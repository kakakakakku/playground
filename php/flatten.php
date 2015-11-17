<?php

  $nested_array = array(
    1,
    2,
    3,
    array(
      'A',
      'B',
      'C',
      array(
       'D1',
       'D2',
       'D3'
      )
    ),
    4,
    5,
    6
  );

  // Array
  // (
  //     [0] => 1
  //     [1] => 2
  //     [2] => 3
  //     [3] => Array
  //         (
  //             [0] => A
  //             [1] => B
  //             [2] => C
  //             [3] => Array
  //                 (
  //                     [0] => D1
  //                     [1] => D2
  //                     [2] => D3
  //                 )
  // 
  //         )
  // 
  //     [4] => 4
  //     [5] => 5
  //     [6] => 6
  // )
  echo print_r($nested_array, true);

  // Array
  // (
  //     [0] => 1
  //     [1] => 2
  //     [2] => 3
  //     [3] => A
  //     [4] => B
  //     [5] => C
  //     [6] => D1
  //     [7] => D2
  //     [8] => D3
  //     [9] => 4
  //     [10] => 5
  //     [11] => 6
  // )
  echo print_r(array_flatten($nested_array), true);

  function array_flatten($nested_array) {
    return iterator_to_array(new RecursiveIteratorIterator(new RecursiveArrayIterator($nested_array)), false);
  }
