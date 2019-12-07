Nokia X7/8.1 (codenamed _"PNX"_) are smartphones from Nokia, was announced and released in Q4 2018.

## Device specifications

| Device       |   Nokia 8.1                                     |
| -----------: | :---------------------------------------------- |
| SoC          | Qualcomm SDM710 Snapdragon 710                  |
| CPU          | 8x Qualcomm® Kryo™ 260 up to 2.2GHz             |
| GPU          | Adreno 616                                      |
| Memory       | 4/6 GB                                          |
| Shipped Android version | 8.1.0 (China) / 9.0.0 (Global)       |
| Storage      | 64/128GB eMMC 5.1 flash storage                 |
| Battery      | Non-removable Li-Po 3500 mAh                    |
| Dimensions   | 154.8 x 75.76 x 7.97 mm                         |
| Display      | 2280 x 1080 (19:9), 6.18 inch                   |


## How To Compile TWRP For PNX
```
. build/envsetup.sh && lunch omni_PNX-eng && make -j32 bootimage
```
## Fix boot loops TWRP
```
$magiskbootx86 --hexpatch kernel 77616E745F696E697472616D6673 736B69705F696E697472616D6673
```