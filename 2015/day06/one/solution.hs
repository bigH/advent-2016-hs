import Data.List (transpose)

data Instruction = Instruction Action Int Int Int Int deriving Show
data Action = TurnOn | TurnOff | Flip deriving Show
data State = On | Off deriving (Show, Eq)

input = [Instruction TurnOn 887 9 959 629,
         Instruction TurnOn 454 398 844 448,
         Instruction TurnOff 539 243 559 965,
         Instruction TurnOff 370 819 676 868,
         Instruction TurnOff 145 40 370 997,
         Instruction TurnOff 301 3 808 453,
         Instruction TurnOn 351 678 951 908,
         Instruction Flip 720 196 897 994,
         Instruction Flip 831 394 904 860,
         Instruction Flip 753 664 970 926,
         Instruction TurnOff 150 300 213 740,
         Instruction TurnOn 141 242 932 871,
         Instruction Flip 294 259 474 326,
         Instruction Flip 678 333 752 957,
         Instruction Flip 393 804 510 976,
         Instruction TurnOff 6 964 411 976,
         Instruction TurnOff 33 572 978 590,
         Instruction TurnOn 579 693 650 978,
         Instruction TurnOn 150 20 652 719,
         Instruction TurnOff 782 143 808 802,
         Instruction TurnOff 240 377 761 468,
         Instruction TurnOff 899 828 958 967,
         Instruction TurnOn 613 565 952 659,
         Instruction TurnOn 295 36 964 978,
         Instruction Flip 846 296 969 528,
         Instruction TurnOff 211 254 529 491,
         Instruction TurnOff 231 594 406 794,
         Instruction TurnOff 169 791 758 942,
         Instruction TurnOn 955 440 980 477,
         Instruction Flip 944 498 995 928,
         Instruction TurnOn 519 391 605 718,
         Instruction Flip 521 303 617 366,
         Instruction TurnOff 524 349 694 791,
         Instruction Flip 391 87 499 792,
         Instruction Flip 562 527 668 935,
         Instruction TurnOff 68 358 857 453,
         Instruction Flip 815 811 889 828,
         Instruction TurnOff 666 61 768 87,
         Instruction TurnOn 27 501 921 952,
         Instruction TurnOn 953 102 983 471,
         Instruction TurnOn 277 552 451 723,
         Instruction TurnOff 64 253 655 960,
         Instruction TurnOn 47 485 734 977,
         Instruction TurnOff 59 119 699 734,
         Instruction Flip 407 898 493 955,
         Instruction Flip 912 966 949 991,
         Instruction TurnOn 479 990 895 990,
         Instruction Flip 390 589 869 766,
         Instruction Flip 593 903 926 943,
         Instruction Flip 358 439 870 528,
         Instruction TurnOff 649 410 652 875,
         Instruction TurnOn 629 834 712 895,
         Instruction Flip 254 555 770 901,
         Instruction Flip 641 832 947 850,
         Instruction TurnOn 268 448 743 777,
         Instruction TurnOff 512 123 625 874,
         Instruction TurnOff 498 262 930 811,
         Instruction TurnOff 835 158 886 242,
         Instruction Flip 546 310 607 773,
         Instruction TurnOn 501 505 896 909,
         Instruction TurnOff 666 796 817 924,
         Instruction Flip 987 789 993 809,
         Instruction Flip 745 8 860 693,
         Instruction Flip 181 983 731 988,
         Instruction TurnOn 826 174 924 883,
         Instruction TurnOn 239 228 843 993,
         Instruction TurnOn 205 613 891 667,
         Instruction Flip 867 873 984 896,
         Instruction TurnOn 628 251 677 681,
         Instruction Flip 276 956 631 964,
         Instruction TurnOn 78 358 974 713,
         Instruction TurnOn 521 360 773 597,
         Instruction TurnOff 963 52 979 502,
         Instruction TurnOn 117 151 934 622,
         Instruction Flip 237 91 528 164,
         Instruction TurnOn 944 269 975 453,
         Instruction Flip 979 460 988 964,
         Instruction TurnOff 440 254 681 507,
         Instruction Flip 347 100 896 785,
         Instruction TurnOff 329 592 369 985,
         Instruction TurnOn 931 960 979 985,
         Instruction Flip 703 3 776 36,
         Instruction Flip 798 120 908 550,
         Instruction TurnOff 186 605 914 709,
         Instruction TurnOff 921 725 979 956,
         Instruction Flip 167 34 735 249,
         Instruction TurnOn 726 781 987 936,
         Instruction Flip 720 336 847 756,
         Instruction TurnOn 171 630 656 769,
         Instruction TurnOff 417 276 751 500,
         Instruction Flip 559 485 584 534,
         Instruction TurnOn 568 629 690 873,
         Instruction Flip 248 712 277 988,
         Instruction Flip 345 594 812 723,
         Instruction TurnOff 800 108 834 618,
         Instruction TurnOff 967 439 986 869,
         Instruction TurnOn 842 209 955 529,
         Instruction TurnOn 132 653 357 696,
         Instruction TurnOn 817 38 973 662,
         Instruction TurnOff 569 816 721 861,
         Instruction TurnOn 568 429 945 724,
         Instruction TurnOn 77 458 844 685,
         Instruction TurnOff 138 78 498 851,
         Instruction TurnOn 136 21 252 986,
         Instruction TurnOff 2 460 863 472,
         Instruction TurnOn 172 81 839 332,
         Instruction TurnOn 123 216 703 384,
         Instruction TurnOff 879 644 944 887,
         Instruction Flip 227 491 504 793,
         Instruction Flip 580 418 741 479,
         Instruction Flip 65 276 414 299,
         Instruction Flip 482 486 838 931,
         Instruction TurnOff 557 768 950 927,
         Instruction TurnOff 615 617 955 864,
         Instruction TurnOn 859 886 923 919,
         Instruction TurnOn 391 330 499 971,
         Instruction Flip 521 835 613 847,
         Instruction TurnOn 822 787 989 847,
         Instruction TurnOn 192 142 357 846,
         Instruction TurnOff 564 945 985 945,
         Instruction TurnOff 479 361 703 799,
         Instruction Flip 56 481 489 978,
         Instruction TurnOff 632 991 774 998,
         Instruction Flip 723 526 945 792,
         Instruction TurnOn 344 149 441 640,
         Instruction Flip 568 927 624 952,
         Instruction TurnOn 621 784 970 788,
         Instruction Flip 665 783 795 981,
         Instruction Flip 386 610 817 730,
         Instruction Flip 440 399 734 417,
         Instruction Flip 939 201 978 803,
         Instruction TurnOff 395 883 554 929,
         Instruction TurnOn 340 309 637 561,
         Instruction TurnOff 875 147 946 481,
         Instruction TurnOff 945 837 957 922,
         Instruction TurnOff 429 982 691 991,
         Instruction Flip 227 137 439 822,
         Instruction Flip 4 848 7 932,
         Instruction TurnOff 545 146 756 943,
         Instruction TurnOn 763 863 937 994,
         Instruction TurnOn 232 94 404 502,
         Instruction TurnOff 742 254 930 512,
         Instruction TurnOn 91 931 101 942,
         Instruction Flip 585 106 651 425,
         Instruction TurnOn 506 700 567 960,
         Instruction TurnOff 548 44 718 352,
         Instruction TurnOff 194 827 673 859,
         Instruction TurnOff 6 645 509 764,
         Instruction TurnOff 13 230 821 361,
         Instruction TurnOn 734 629 919 631,
         Instruction Flip 788 552 957 972,
         Instruction Flip 244 747 849 773,
         Instruction TurnOff 162 553 276 887,
         Instruction TurnOff 569 577 587 604,
         Instruction TurnOff 799 482 854 956,
         Instruction TurnOn 744 535 909 802,
         Instruction Flip 330 641 396 986,
         Instruction TurnOff 927 458 966 564,
         Instruction Flip 984 486 986 913,
         Instruction Flip 519 682 632 708,
         Instruction TurnOn 984 977 989 986,
         Instruction Flip 766 423 934 495,
         Instruction TurnOn 17 509 947 718,
         Instruction TurnOn 413 783 631 903,
         Instruction TurnOn 482 370 493 688,
         Instruction TurnOn 433 859 628 938,
         Instruction TurnOff 769 549 945 810,
         Instruction TurnOn 178 853 539 941,
         Instruction TurnOff 203 251 692 433,
         Instruction TurnOff 525 638 955 794,
         Instruction TurnOn 169 70 764 939,
         Instruction Flip 59 352 896 404,
         Instruction Flip 143 245 707 320,
         Instruction TurnOff 103 35 160 949,
         Instruction Flip 496 24 669 507,
         Instruction TurnOff 581 847 847 903,
         Instruction TurnOn 689 153 733 562,
         Instruction TurnOn 821 487 839 699,
         Instruction TurnOn 837 627 978 723,
         Instruction Flip 96 748 973 753,
         Instruction Flip 99 818 609 995,
         Instruction TurnOn 731 193 756 509,
         Instruction TurnOff 622 55 813 365,
         Instruction TurnOn 456 490 576 548,
         Instruction TurnOn 48 421 163 674,
         Instruction TurnOff 853 861 924 964,
         Instruction TurnOff 59 963 556 987,
         Instruction TurnOn 458 710 688 847,
         Instruction Flip 12 484 878 562,
         Instruction TurnOff 241 964 799 983,
         Instruction TurnOff 434 299 845 772,
         Instruction Flip 896 725 956 847,
         Instruction TurnOn 740 289 784 345,
         Instruction TurnOff 395 840 822 845,
         Instruction TurnOn 955 224 996 953,
         Instruction TurnOff 710 186 957 722,
         Instruction TurnOff 485 949 869 985,
         Instruction TurnOn 848 209 975 376,
         Instruction Flip 221 241 906 384,
         Instruction TurnOn 588 49 927 496,
         Instruction TurnOn 273 332 735 725,
         Instruction TurnOn 505 962 895 962,
         Instruction Flip 820 112 923 143,
         Instruction TurnOn 919 792 978 982,
         Instruction Flip 489 461 910 737,
         Instruction TurnOff 202 642 638 940,
         Instruction TurnOff 708 953 970 960,
         Instruction Flip 437 291 546 381,
         Instruction TurnOn 409 358 837 479,
         Instruction TurnOff 756 279 870 943,
         Instruction TurnOff 154 657 375 703,
         Instruction TurnOff 524 622 995 779,
         Instruction Flip 514 221 651 850,
         Instruction Flip 808 464 886 646,
         Instruction Flip 483 537 739 840,
         Instruction Flip 654 769 831 825,
         Instruction TurnOff 326 37 631 69,
         Instruction TurnOff 590 570 926 656,
         Instruction TurnOff 881 913 911 998,
         Instruction TurnOn 996 102 998 616,
         Instruction TurnOff 677 503 828 563,
         Instruction TurnOn 860 251 877 441,
         Instruction TurnOff 964 100 982 377,
         Instruction Flip 888 403 961 597,
         Instruction TurnOff 632 240 938 968,
         Instruction Flip 731 176 932 413,
         Instruction TurnOn 5 498 203 835,
         Instruction TurnOn 819 352 929 855,
         Instruction Flip 393 813 832 816,
         Instruction Flip 725 689 967 888,
         Instruction TurnOn 968 950 969 983,
         Instruction TurnOff 152 628 582 896,
         Instruction TurnOff 165 844 459 935,
         Instruction TurnOff 882 741 974 786,
         Instruction TurnOff 283 179 731 899,
         Instruction Flip 197 366 682 445,
         Instruction TurnOn 106 309 120 813,
         Instruction Flip 950 387 967 782,
         Instruction TurnOff 274 603 383 759,
         Instruction TurnOff 155 665 284 787,
         Instruction Flip 551 871 860 962,
         Instruction TurnOff 30 826 598 892,
         Instruction Flip 76 552 977 888,
         Instruction TurnOn 938 180 994 997,
         Instruction Flip 62 381 993 656,
         Instruction Flip 625 861 921 941,
         Instruction TurnOn 685 311 872 521,
         Instruction TurnOn 124 934 530 962,
         Instruction TurnOn 606 379 961 867,
         Instruction TurnOff 792 735 946 783,
         Instruction TurnOn 417 480 860 598,
         Instruction Flip 178 91 481 887,
         Instruction TurnOff 23 935 833 962,
         Instruction Flip 317 14 793 425,
         Instruction TurnOn 986 89 999 613,
         Instruction TurnOff 359 201 560 554,
         Instruction TurnOff 729 494 942 626,
         Instruction TurnOn 204 143 876 610,
         Instruction Flip 474 97 636 542,
         Instruction TurnOff 902 924 976 973,
         Instruction TurnOff 389 442 824 638,
         Instruction TurnOff 622 863 798 863,
         Instruction TurnOn 840 622 978 920,
         Instruction Flip 567 374 925 439,
         Instruction TurnOff 643 319 935 662,
         Instruction Flip 185 42 294 810,
         Instruction TurnOn 47 124 598 880,
         Instruction Flip 828 303 979 770,
         Instruction TurnOff 174 272 280 311,
         Instruction TurnOff 540 50 880 212,
         Instruction TurnOn 141 994 221 998,
         Instruction TurnOn 476 695 483 901,
         Instruction TurnOn 960 216 972 502,
         Instruction Flip 752 335 957 733,
         Instruction TurnOff 419 713 537 998,
         Instruction Flip 772 846 994 888,
         Instruction TurnOn 881 159 902 312,
         Instruction TurnOff 537 651 641 816,
         Instruction Flip 561 947 638 965,
         Instruction TurnOn 368 458 437 612,
         Instruction TurnOn 290 149 705 919,
         Instruction TurnOn 711 918 974 945,
         Instruction Flip 916 242 926 786,
         Instruction Flip 522 272 773 314,
         Instruction TurnOn 432 897 440 954,
         Instruction TurnOff 132 169 775 380,
         Instruction Flip 52 205 693 747,
         Instruction Flip 926 309 976 669,
         Instruction TurnOff 838 342 938 444,
         Instruction TurnOn 144 431 260 951,
         Instruction Flip 780 318 975 495,
         Instruction TurnOff 185 412 796 541,
         Instruction TurnOn 879 548 892 860,
         Instruction TurnOn 294 132 460 338,
         Instruction TurnOn 823 500 899 529,
         Instruction TurnOff 225 603 483 920,
         Instruction Flip 717 493 930 875,
         Instruction Flip 534 948 599 968,
         Instruction TurnOn 522 730 968 950,
         Instruction TurnOff 102 229 674 529]

perform :: Action -> State -> State
perform Flip    On  = Off
perform Flip    Off = On
perform TurnOff _   = Off
perform TurnOn  _   = On

instruction :: [[State]] -> Instruction -> [[State]]
instruction state (Instruction action x1 y1 x2 y2) = top ++ rejoined ++ bottom
  where (top, middle, bottom) = partition x1 x2 state
        transposed = transpose middle
        (left, center, right) = partition y1 y2 transposed
        transformed = map (map (perform action)) center
        rejoined = transpose (left ++ transformed ++ right)

partition :: Int -> Int -> [a] -> ([a], [a], [a])
partition a b xs = (begin, middle, end)
  where begin = take a xs
        middle = take (b - a + 1) $ drop a xs
        end = drop (b + 1) xs

start = replicate 1000 $ replicate 1000 Off

finalState = foldl instruction start input

toBit :: State -> Int
toBit On = 1
toBit Off = 0

main = do putStrLn "Number of Lights On:"
          print $ sum $ map sum $ map (map toBit) finalState
