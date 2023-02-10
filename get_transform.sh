image_dir=$1    # ./data/nerf_synthetic/lego
out_json=$2     # ./transforms.json
phase=$3        # train

python scripts/colmap2nerf.py --run_colmap --colmap_matcher exhaustive --images $image_dir/$phase --colmap_camera_model SIMPLE_RADIAL --abs_pose_max_error 2 --out $out_json
sed -i "s|$image_dir\/$phase|./$phase|g" $out_json
