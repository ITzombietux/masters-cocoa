//
//  main.swift
//  BubbleSort
//
//  Created by zombietux on 2020/11/16.
//

import Foundation

func main() {
    let bubbleSort = BubbleSort([100,30,7,10,60,9,3,2,1,43,56,101])
    print(bubbleSort.sorted(isAscending: true))
    print(bubbleSort.bubbleSortTarget)
}

main()
