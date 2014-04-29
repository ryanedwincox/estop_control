FILE(REMOVE_RECURSE
  "../srv_gen"
  "../srv_gen"
  "../src/estop_control/srv"
  "CMakeFiles/ROSBUILD_gensrv_py"
  "../src/estop_control/srv/__init__.py"
  "../src/estop_control/srv/_estopSignal.py"
)

# Per-language clean rules from dependency scanning.
FOREACH(lang)
  INCLUDE(CMakeFiles/ROSBUILD_gensrv_py.dir/cmake_clean_${lang}.cmake OPTIONAL)
ENDFOREACH(lang)
