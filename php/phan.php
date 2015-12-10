<?php

  $sample_array_1 = array(1, 2, 3, 4, 5);

  function f1() {
    print_r('f1');
  }

  // === 正常

  // Array
  // (
  //     [0] => 1
  //     [1] => 2
  //     [2] => 3
  //     [3] => 4
  //     [4] => 5
  // )
  print_r($sample_array_1);

  // f1
  f1();

  // === 異常（これを Phan で検知する）

  // PHP Notice:  Undefined variable: sample_array_2
  print_r($sample_array_2);

  // PHP Fatal error:  Uncaught Error: Call to undefined function f2()
  f2();
