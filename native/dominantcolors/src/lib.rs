use kmeans_colors::{get_kmeans, Kmeans};
use palette::{FromColor, IntoColor, Lab, Srgb};

#[rustler::nif]
fn dominant_colors(file_name: &str) -> Vec<String> {
    // Read file into buffer
    let img = image::open(file_name).unwrap();
    let img_vec = img.to_rgb8().into_raw();

    // Convert RGB [u8] buffer to Lab for k-means
    let lab: Vec<Lab> = img_vec
        .chunks(3)
        .map(|chunk| {
            Srgb::new(
                chunk[0] as f32 / 255.0,
                chunk[1] as f32 / 255.0,
                chunk[2] as f32 / 255.0,
            )
            .into_format()
            .into_color()
        })
        .collect();

    // Perform k-means clustering
    let mut best_result = Kmeans::new();
    let converge = 0.0025;
    for i in 0..10 {
        // Run k-means multiple times
        let run_result = get_kmeans(8, 20, converge, false, &lab, 0 + i as u64);
        if run_result.score < best_result.score {
            best_result = run_result;
        }
    }

    // Convert Lab centroids back to Srgb<u8> for output
    let color_codes: Vec<String> = best_result
        .centroids
        .iter()
        .map(|x| Srgb::from_color(*x).into_format::<u8>())
        .map(|color| format!("#{:02x}{:02x}{:02x}", color.red, color.green, color.blue))
        .collect();

    color_codes
}

rustler::init!("Elixir.DominantColors", [dominant_colors]);
