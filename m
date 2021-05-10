Content-Type: multipart/mixed; boundary="===============3828851995494216686=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [linux-nvme:nvme-5.13 4/4] drivers/nvme/host/multipath.c:810:6: warning: variable 'error' is used uninitialized whenever 'if' condition is true
Date: Mon, 10 May 2021 19:43:10 +0800
Message-ID: <202105101904.hOaMo7Ow-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3828851995494216686==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.infradead.org/nvme.git nvme-5.13
head:   8b951d3a91bdd748db10df3ad020257e49dd97b0
commit: 8b951d3a91bdd748db10df3ad020257e49dd97b0 [4/4] nvme-multipath: fix =
double initialization of ANA state
config: s390-randconfig-r013-20210510 (attached as .config)
compiler: clang version 13.0.0 (https://github.com/llvm/llvm-project 492173=
d42b32cb91d5d0d72d5ed84fcab80d059a)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install s390 cross compiling tool for clang build
        # apt-get install binutils-s390x-linux-gnu
        git remote add linux-nvme git://git.infradead.org/nvme.git
        git fetch --no-tags linux-nvme nvme-5.13
        git checkout 8b951d3a91bdd748db10df3ad020257e49dd97b0
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross W=3D=
1 ARCH=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from drivers/nvme/host/multipath.c:6:
   In file included from include/linux/backing-dev.h:15:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:464:31: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __raw_readb(PCI_IOBASE + addr);
                             ~~~~~~~~~~ ^
   include/asm-generic/io.h:477:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le16_to_cpu((__le16 __force)__raw_readw(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:36:59: note: expanded from mac=
ro '__le16_to_cpu'
   #define __le16_to_cpu(x) __swab16((__force __u16)(__le16)(x))
                                                             ^
   include/uapi/linux/swab.h:102:54: note: expanded from macro '__swab16'
   #define __swab16(x) (__u16)__builtin_bswap16((__u16)(x))
                                                        ^
   In file included from drivers/nvme/host/multipath.c:6:
   In file included from include/linux/backing-dev.h:15:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:490:61: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           val =3D __le32_to_cpu((__le32 __force)__raw_readl(PCI_IOBASE + a=
ddr));
                                                           ~~~~~~~~~~ ^
   include/uapi/linux/byteorder/big_endian.h:34:59: note: expanded from mac=
ro '__le32_to_cpu'
   #define __le32_to_cpu(x) __swab32((__force __u32)(__le32)(x))
                                                             ^
   include/uapi/linux/swab.h:115:54: note: expanded from macro '__swab32'
   #define __swab32(x) (__u32)__builtin_bswap32((__u32)(x))
                                                        ^
   In file included from drivers/nvme/host/multipath.c:6:
   In file included from include/linux/backing-dev.h:15:
   In file included from include/linux/blkdev.h:26:
   In file included from include/linux/scatterlist.h:9:
   In file included from arch/s390/include/asm/io.h:80:
   include/asm-generic/io.h:501:33: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writeb(value, PCI_IOBASE + addr);
                               ~~~~~~~~~~ ^
   include/asm-generic/io.h:511:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writew((u16 __force)cpu_to_le16(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:521:59: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           __raw_writel((u32 __force)cpu_to_le32(value), PCI_IOBASE + addr);
                                                         ~~~~~~~~~~ ^
   include/asm-generic/io.h:609:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsb(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:617:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsw(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:625:20: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           readsl(PCI_IOBASE + addr, buffer, count);
                  ~~~~~~~~~~ ^
   include/asm-generic/io.h:634:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesb(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:643:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesw(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
   include/asm-generic/io.h:652:21: warning: performing pointer arithmetic =
on a null pointer has undefined behavior [-Wnull-pointer-arithmetic]
           writesl(PCI_IOBASE + addr, buffer, count);
                   ~~~~~~~~~~ ^
>> drivers/nvme/host/multipath.c:810:6: warning: variable 'error' is used u=
ninitialized whenever 'if' condition is true [-Wsometimes-uninitialized]
           if (ana_log_size > max_transfer_size) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/multipath.c:832:9: note: uninitialized use occurs here
           return error;
                  ^~~~~
   drivers/nvme/host/multipath.c:810:2: note: remove the 'if' if its condit=
ion is always false
           if (ana_log_size > max_transfer_size) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/nvme/host/multipath.c:795:11: note: initialize the variable 'err=
or' to silence this warning
           int error;
                    ^
                     =3D 0
   13 warnings generated.


vim +810 drivers/nvme/host/multipath.c

   790	=

   791	int nvme_mpath_init_identify(struct nvme_ctrl *ctrl, struct nvme_id_=
ctrl *id)
   792	{
   793		size_t max_transfer_size =3D ctrl->max_hw_sectors << SECTOR_SHIFT;
   794		size_t ana_log_size;
   795		int error;
   796	=

   797		/* check if multipath is enabled and we have the capability */
   798		if (!multipath || !ctrl->subsys ||
   799		    !(ctrl->subsys->cmic & NVME_CTRL_CMIC_ANA))
   800			return 0;
   801	=

   802		ctrl->anacap =3D id->anacap;
   803		ctrl->anatt =3D id->anatt;
   804		ctrl->nanagrpid =3D le32_to_cpu(id->nanagrpid);
   805		ctrl->anagrpmax =3D le32_to_cpu(id->anagrpmax);
   806	=

   807		ana_log_size =3D sizeof(struct nvme_ana_rsp_hdr) +
   808			ctrl->nanagrpid * sizeof(struct nvme_ana_group_desc) +
   809			ctrl->max_namespaces * sizeof(__le32);
 > 810		if (ana_log_size > max_transfer_size) {
   811			dev_err(ctrl->device,
   812				"ANA log page size (%zd) larger than MDTS (%zd).\n",
   813				ana_log_size, max_transfer_size);
   814			dev_err(ctrl->device, "disabling ANA support.\n");
   815			goto out_uninit;
   816		}
   817		if (ana_log_size > ctrl->ana_log_size) {
   818			nvme_mpath_stop(ctrl);
   819			kfree(ctrl->ana_log_buf);
   820			ctrl->ana_log_buf =3D kmalloc(ctrl->ana_log_size, GFP_KERNEL);
   821			if (!ctrl->ana_log_buf)
   822				return -ENOMEM;
   823		}
   824		ctrl->ana_log_size =3D ana_log_size;
   825		error =3D nvme_read_ana_log(ctrl);
   826		if (error)
   827			goto out_uninit;
   828		return 0;
   829	=

   830	out_uninit:
   831		nvme_mpath_uninit(ctrl);
   832		return error;
   833	}
   834	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3828851995494216686==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICA8HmWAAAy5jb25maWcAnDzbctu4ku/zFaxM1dZM1ZmJb8nEZ8sPIAhKiHgLQUqWX1CKrSTa
kS2vJM9M9utPN8ALAIJyavOQhN2NBtBo9A2Afv7p54C8HHePq+PmfrXdfg++rp/W+9Vx/RB82WzX
/x1EeZDlVcAiXv0OxMnm6eWft4fL67Pg3e/nF7+fBbP1/mm9Deju6cvm6ws03eyefvr5J5pnMZ9I
SuWclYLnmazYbXXz5n67evoa/LXeH4AuOL/8/Qx4/PJ1c/z327fw9+Nmv9/t3263fz3K5/3uf9b3
x+Dq+uL8j8uHq4vPlxf3n6/PH949nD38cfHwbv3w4erL/erzh7OHs3fXq1/ftL1O+m5vzoyhcCFp
QrLJzfcOiJ8d7fnlGfxpcUmEDcI46skB1NJeXL47u+jgBsLscEqEJCKVk7zKjU5thMzrqqgrL55n
Cc+YgcozUZU1rfJS9FBefpKLvJz1kLDmSVTxlMmKhAmTIi+NDqppyQjMLotz+AtIBDaFVfs5mKj1
3waH9fHluV9HnvFKsmwuSQmz5Smvbi772eeUJO3037zxgSWpTQmo4UlBksqgn5I5kzNWZiyRkzte
9OQmJgTMhR+V3KXEj7m9G2uRjyGu/Ig6o3lalEwIhnrxc9DQGOMONofgaXdEEf5kY9uxu61w4GYr
F397dwoLkziNvjqFNifkGXnEYlInlVIAY61a8DQXVUZSdvPml6fd0xq2YMdfLIhPFGIp5rygvXQX
pKJT+almtannZS6ETFmal0tJqorQaY+sBUt46KwPKYELqcFOQQ+geEmr0bA5gsPL58P3w3H92Gv0
hGWs5FTtHZ59ZLRC7f3uQ9OpqYwIifKU8MyGCZ72AFGQUjCE+1lGLKwnsVC6sH56CHZfnHG6jdRe
nvdTc9AUNtuMzVlWiXbe1eYRrKxv6hWnM5lnTExzwyhkuZzegYFJUyWHbh0BWEAfecSpZzl1Kx4l
zOFkLA+fTCUomJpDac15MMa2DSgkS4sKWCnr1w2mhc/zpM4qUi69qt1QmTglElrUb6vV4c/gCP0G
KxjD4bg6HoLV/f3u5em4efraC2nOy0pCA0kozaEvbroND1JmpOJzQwqhiGAgOYWdhWSVOQ0XJ+eX
/okIbsMbuf3ARHomOE4u8oSghg9kUtI6EB4dARFKwJmjhk/JbkEZKt++1sRmcwcEXkYoHo3SelAD
UB0xH7wqCXUQyFhUsDl6FTYwGWPgb9iEhgkXlamC9vy7DT3T/7l57CFT8JnMdLtJjp4slmLK4+rm
/A8TjkJPya2Jv+iVm2fVDNxfzFwel3pRxP239cPLdr0PvqxXx5f9+qDAzZA92Ja1soKiLgrw90Jm
dUpkSCDGoZb6NgEGjOL84oOxb13ybuVtTGf9WYbBhc9t0EmZ14Uhq4JMmFR7hZU9FAw8nTifcgb/
GNsomTXcjPGrb7koecVCQmcDjKBTZoRtMeGl9GJoDBEeyaIFj6qppeuV2WB0hrLgkTDbNeAyGvHo
DT6G/XHHSh/fAtxbZUoO7AR202AGc43YnFM2AAO1a3UaTFjEp4aWckFP4ZXr8nkCCAPA7YFNMzw1
KqHxrbxYZgkMYgGAePjBZEuHFqXgpYU1orMiB4VGRwPBsSEPtYAq/my1qA9RlgLWP2LgLyip7GXu
NYElZOnpExUTZK8io9JQKfVNUmAs8rqElXljBEVlNAgRTZwKEMeQbpTYY8zwVhHmlipHbgzYI+5E
ZQw9zPNKNobPNBZ5AQvH75iM8xKDAfgnBVNgeWaXTMB/PH2qWK3m0fl7Y4UgqqkScC2UFZVKFdG8
G8Mq4v5DOyBDxWxeKdgljqpjsJ+wKgW3IQfRk17/HtxNJp6CTUiY3yfngt82sYxngtq4m9tXGfss
5Wb6Y8iXJTHI3NTYkEDoGNfOkGpIoD39sSK3CQWfZCSJ/cqshh377JkKHs1cV0wtO0y4pVQ8lzXM
bOLthURzDlNoBOuTErAOSVlyc51mSLtMxRAirVXroEpOuD2dwKuIh0utHOOCgIFonReSfeSmJoHW
pDkEHFEJ/EqbIZiIJCdWyof0ipVXnjOaGh4LkgEjE1Am1IGBQFgUmb5JbRXcbbIL7HslpOdnV4NY
rqnFFOv9l93+cfV0vw7YX+snCAwJRA4UQ0MIt3Uo3PDp2XsDzR/k2DOcp5pd6+t9iy+SOtQyMAsb
aUFgUVQRo9flhIQjDGyyPPQqIrYHXSsh9miW3csNiNAhY2goS9j5uZnJWdgpKSOIXi09ENM6jhOm
QxxQuhx8Se5z7WreGBhCclhxYhuiiqUyIhXBOhKPOSVNPmokNXnME2fLdeE2GEzl/6z0yi7mdHsv
NcLmO0iwZGTWTXCAISpkFnFihNGYYYKrbKNLY/CQnc90RD7AtfnpdMEgC/QgLCUwgN2+lmpaVtyt
sny1o62ck+fYN0TdhbPtu3i4BhmGzDIwgmSwgCTKFzKPY4yvzv45/3Bm/OmmeXl95kYVeQoDicHb
d8M0DP9El94S2A+JuHlnbesEZlZg4cOQrwFSW7TY7+7Xh8NuHxy/P+ssz8gGTG6pmubd9dmZjBmp
6tKco0Vx/SqFPD+7foXm/DUm59fvTYpOhbv2Po/QNfW0YPTcHxa1rfzpc4v1F8Ba7LsTo7mSVW1X
IPDbZ0xsAlyLU9jrk1hcgxP481ONQYAnsKOCbBpf+oyLRl0NpOAX3fur0PSq2rBbpg7rf0O46S6z
UmU7N++vOvXKqyKplXWyE1bTBERMtIm0vU9FWrlbN6UuBKLfmQuLSrKwYkkFrcDSQOK+NLT/Dtbs
zCmbXbzzLxSgLkfUQ/Px7Y/p3c25YYzUOKYllvIMc8ZuGTUHobRYe7RTNeAsD32lWgi18+b4oWvR
wtBanmjS1vuH7TCu9eUiTPlNtJhG1KRGjhkFhnqmZztlG5XxTNePu/139xhDuwNVm4UItKlfuN6i
Qze73MHrRm1tutHL12hK+N/c7amhEkUCXqRII1lU6GSNZIbcymK6FDgY2FTi5up9X0+hM+15ja2G
WbALVJ9yUkPgcnPxrmu/IGUmoyUk7eBv2yadeC3p6Sr629xXSv4UcfNgayooqqYVHVEYe+2PLm2m
qp/o5fEZYM/Pu/3RDFRpScRURnVaeDlZzfrMddH60vlmf3xZbTf/55xPQkBQMQqpvyrp1iThdyrw
AoExYax84WgCTVNrkhAbyOmygGwy9kW8+gRpbrWxO/SHr8hWjcQ7aWdSunK43n45rg9HI0RQXOps
wTMsgSZxxewKaN/EOgFc7e+/bY7re9xUvz2sn4EaAv9g94ydGez1ytgZrDJEDqwN7iA5KJemIGY6
KvOI7SMst4T4myWWPoPRgx6WwpyNKWgWQ/zMMQmpIROGdBjrPxSL7c4GhAxOHUVWPJMhnlc5jGZu
vKihJav8CA2VoD6xU8JQ+LjO1CmTZGWZl75TJ0VmlQr6sy3FcWr5KIWE4B1rNhWf1HkthvIGx6rO
Z5pTX0cEWAeOITjm8bKtVw0JICxubJknoRadGalUkUUdTzt0lxdgvkDcsHYyliBucNXuHEUqIftu
zotd0ZZsIiRBBVbmTK+mJIUrKTun7jNobO+DqyKj5om2xSd3nxL6sJ5KBGRackKqKfShcwHMI71o
PKN4hQQyHP2/wQJpndHnCTQtbul04g612QV6cVSm6lA07fSh/Qguyuuhu1Q1FQzo9Ilnew3AQ9Sk
+D9EmyeRQe8TvGAUCU6gJKTLOiPrDarGeExNUuXtYaPJ7+Qp4BiFcxzabyMQLVN1fCzD/QAf2MIj
liDDKAUt3LSeMM9yajnkcSUj4Lt0sLDP2liHUSw2GAqXR3UCNgxNI1YmUamd1nh+zW5hP4MlUwff
dsChaLBrxAFJvshckk4iqoc2yBts+YTr+KirLxj+N8G6BZ79QCATCeNCCGqO4BNRw9yy6HKAII7J
bbTMxfaBh8ZrC4brNube1aTmKSlGZwu7j8Pua4LucnFrerVRlNtcr5C3uQ+FEaVZknN9IHLWsTAt
l4VruBE7j0SuSlNjZRVdzkQtVNWvNuaa0Hz+2+fVYf0Q/KnLiM/73ZfNVh+zdwJGsmbiHtF2o1Bk
ugbGZFuub+tcJ3qy1ggvhmG4zjNvneyVkKdlperOIsVBnNn7BlVIqtORarClXADSUTwANn1yg6oz
L1i38CCHXnPUnbY6AmpGSzpEiJJ2d7bMAno/Qas+Y02b+jaHQeKcshgYMSXnp9sCxcXF1XhzyG38
VR6L6vLDSC3IonpnF0mGNKCQ05s3h28rGNIbB99ep/IMtUWNXRNzydS5nssE99gCT2mFvnXSnLpK
nqrd6K/ulDwFvQGjHskZnp2Mdi701Y0E4kzzxD20E1M8+wTrrra7tJ0ZogQVHDTsk51DtQemoZh4
gfpOV39Hpjtfrdik5JX/qk9LhXVs/5FXSwHhb15VbgHdIqNppGoUKjwpR8kWob/y119VkByv24BJ
HTs47shoPhQRWtNYOCLFanNhhmYI1ddDW9tt+TUvWsawZM2NCV1jXu2PG7RuQfX92awrqyMK1YRE
czzrNRMHSOyynsIqONkoSeuUZP6bEC4pYyL3HXC6dJyKUz2SyJuBu2RFvmBlxejorGTJBeWmH+a3
1pzbsELEPjAkRBPiRVSk5H7h8TDtEd6iNPVxTEWUCx8Cb5lFXMyc5CXlGUxF1KGnCV4Tg4nL2w/v
fRxraAkBF7PYduNPotPjFxPuZZqAebr1i0TUmZ9lXz0g4G1PdsviEXljKfr9h1f4GzbBR9XWI519
ZNnNQa0b92b6SYX8qnymK2x5f7HL2IhAx/OmGA3pu30d3EDOlqGd67SIMP7kL75Z/fX73on0RHbu
xH2NVREFXh0vl7ZnGKOQ4fQE0Ss8foyBfdt2lESQQSHWJMPo6uRgNMHp4TQ0pwfUEw3uLJm06qr+
STkrih9Aj465pxgdsUUyLkJFdkqEBsHp4bwmQofopAjVRcHTMtQkP4IfHbZBMjpqm2ZcjprulCBN
ileG9JooXaqBLMHsv7ZDumSQVDnWAst0YZgpvLukG+uCgFnEKhcC0s8RpBrSCK5PjPVlH5gHKQpF
oQwq+2d9/3Jcfd6u1VumQN1gMQvjIc/itMIixKAc4EOp/nqEqkQbQgJQU/A2agfoKrFC2N2YhXbN
PWJfZKiZC1pyMxNvwHgxs7+PjLybkmVn0sdmbJ6Ipaun1df1o7eU3x199X2ri9PqUl0BuYc6YjWi
hf4k7RaPuJgPNYe/sCriHrYNKNwiFUu198QTMDnEx0RUcmImKc1xW3fX3UqerOM6X3CiT+Eq7bDx
8PnK4RtiumPFVxqgdcZXVnJg6oJQyXCfWHVECBVL4jbHgr5s6yktA5QEiaJSVu4x+0wYi9Zqm5I7
hHuqzc3V2fV7MyUcFhF9N2sTBtE/gUjCGJx1XQiiL/cuVwsykxgEQm9E3Jxft7C7Is+TXqXvwjqC
r26Id5dxnviTujtVfsl9L1Jg8qws7WK3fr5kBkdRe2ELC4sz/60qsCVYkMV9bqUcoHSycg7lXJtU
VExXV4lVqRrfhMZle+bjrE+2+kuL+rR0/dfmfh1E+81fVtCoDzgoN0cNn/77rJSS0pJyfwy4uW94
B3lnK/r7j7qqOGVJMZIsQ9pdpUXsr0mAWLOIYB137A2PYh9zcCWYcqg3g4Nhxpv949+r/TrY7lYP
630vgnihSmumw+hAauUjfHdhmG+wYKTrzXjq1rdSh0V6uj6mBtrMswd0VoGo0Qt3Gm2r5sbq3DT3
raqpOpAf50CNBcHagr7f6t06Cs3mzr0tDUeVb9pKfZ/Bd1kIiYhYZrQlVYei/SbvXqzhUUdd5Rr9
3Yee1wl8kJCDZeam3ynZxPIHeAQqpqTUaxqby4OomGWUdZfK7arvUMOVWoUvh+BBbS5L5dMpH73M
YDbpZpOZZ874JUFJrKufCpjicyCNeLSpeRn7MXV4O+CVVlFPBR9qNcTNo1vreV7tD85FYKQm5R8q
zfVWBwFvpsLC7iiPfVBYEPWk4AQq4iXD18zLpsT42/koA3War24J2fdvh4SYG+RZsnwlVW/FoORQ
w3+DdIfpsL7cXO1XT4etuloRJKvvdlIOXUISDztFmA5Lg2EaIwLU8UyZ96KIK2NdM/3VOwL4hvDY
ax45Iv0vReJIOrjW4oo4MiJIkdrdq3XMi8GMusoHRoIQdNmmQz8iJOnbMk/fxtvV4Vtw/23zHDy4
PklpUMzt/j6yiFHHQiAczEBnOKzBAAesSKq3Jrn3LRBSYdwTkmwm1bsueW5tERd7cRJ7ZWOxf37u
gV24KqmgWcUS8CxjGwonk0bC3bYIB/dIhtC64okrEhD+CH9YEpsFCQX4VMWgff44vnJqZTNw0vYa
IkRf7bE3NFkoVGttytXfb2GDrbbb9VZxCb7oLnZPx/1uux3ohuIbMbyxY3M2EDKqWv7p5nDvYYB/
4UvshopRCjP9unlaG5fK3DZAZC9oC5ViAaFUmtrRup8AthN1VcAkC+nUa458I2xxSvhqHkkBEXzw
X/rfi6CgafCoQ0nvPlNkthQ/qV976PdU08XrjE0mdeisDQDkIlFXi8QUgnWdZDgEIQub34y4OLMF
hFjM41LifxLX0kySmoX+8LXrZMTuRpWxuHlsLhE4rRrygpFQHrAx5JGVdR8HgLM8/GgBmutPFsyq
teR4jQKS0rnNCAKoMiHG3YzmpGoAkFmdJPhhZFORtbdbQkhHCz9UpYHqAsDNBxevTofypq3OK8ow
Ch42BywlPASf1/erl8M6UC9RIZrf7QOOSYoW2HZ9f1w/mLFEy9cxTH1ZBAcvi1lFo/kwohdv8ddl
Pm9393828dRQx9sebgvow7SHERUCkP5shAjfQy1dhW/Eq23ePGWBcM0FQp0rjQqkiyOkmjrwmIQl
Nw/YNZQ6gIqUE1ZZbr8Hg+8VAjZX7Xtva5DZ625iYjrGOqbYymuTLAF01tYIiFuJ1mm6tHUdQu0k
FzXkaxCc4sNk+3X0BRY/BkvOGKhWOrTQGi6vL+nte6vOZdPrn7tY/7M6BPzpcNy/PKoXaodvkFA9
BEeM45Au2KKRBa2+3zzjf80n9f+P1qo52R7X+1UQFxMSfGlzuIfd30+YxwWPKpwMftmv//dls4e4
kl/QX43p0akRCuJzbfu3LuYFyTj1rpC1HnrbUMHb/TIQpDqQT3OrulISHuFPq/if6EEDI1LE5vqR
WN9X04m+gP8LCObPfwXH1fP6XwGNfoPl+dVnEoS/nEOnpUb7DHHX1vBoXYOJOaUOavtacxadfjqz
o/jDSsR5ZakwST6ZjF0aUASCkkynvENbhoKqWhWyEi7dtOAnl0AK/B0oJHCGi/CEh/CPB4E/ymO/
p9Gosuh49Ze/nREOJr9Q79fGxhdNnU6iqSwjQl3dmcppAVGQuVgtgqX+nxto8SSpiXcP+DTeiAtG
HkBr44d23G9TzfWHT1k47kSf1T49vxxHdxvP8Oe8jKkqgExY5FtnjYxjLDMnWBZ6tDG6Tj7DgoeD
SQkenDeYLond4mOYDb7L/bKyrHXTKMdbQBBlDMbXYmQhSO27ieGQCQqhUSZvb87PLq5O0yxv/nj/
wSb5mC/1KCwom3uBWF5+NEU/VvjUDWZsGeakdH6gS8Mge/RVjXt0NQstO9lhkhlgRp5RNST/oe1J
lttWdt2/r1BldU5VcqPRw+IuKJKSGHMKB0vKhqXIjK26tuSS5LrH5+tfA80me0DLOVXvbeIIQA/s
EUBjmKeBLRaXRFGByz4ZVKQl41PbDUSLiP1lkcQEIneivIznFKZIls6SMZoEqoz51+qIlT4K0rxa
Vwab0lx1SBOQymHSWyJ1rkOMlGY6uEefChJBQHSkRbvJNHOI9uaz4R0FzoKU7AcgKt3pyCAqAzah
UULdXi0Rugc7bkE2kweeDw46pFq2pSoiWX/T1Yyml2S9HFUNR7TXZ0u3hGAMpNN6SxI5cz8MnZjo
ABogJtnUhoKHMgoHz2B+RmCKZeCxHwTmx8KPFyU1s3CggLqbGoZZHjhXVCQBvnDR80KOj4i/G/Uq
Gxs3icbmZiiSEhze4ICzqOhwy2jhdAT3FQVjTYuCoFlfMlkXEOxJolEOwZsrzpNMpx8MDMhQh4wU
X9UGRsaI4ShHr2AyEczgYnN8QLYXvPkEmyPucLXf+BP+xSABGpixM2k+1KGZs9RBjApkLoWXQAQ/
W3PKdrfUejJ3Il/thIBUcT6Z3BDwcCzzTdRXt5ZVFHfAeT8mVGyYuHw0ZamiUJzi7mkTUzDAu72p
0mJNP6qF/txx1xfwHluO+O4Cj1EkCSobioKyXG02BNrryq5mEtwtMizdhIHo+K5i3YTCIRtthHDg
wpOQdLFYGpE5WpAwpJMWRIcD70fb4yTjuGyoOw3XCk1LIzwMeOkiHF4DwMW264UTz7lTLsbdsag6
ttqikNQd3fDFo+G1xe2foVRHfImFDlN9KlXkfTEc9i2zvYjgDU/ixrBEMpMib6JraeGkfisZ4heB
GNh7EjvElEZFqWo0XklMjgSfyLE27iM3VX+hNQFEmPr3WOL4kxgtmcjQK1D1fVRK07Zid/ZaWcYC
AmpCaaubm7ZbDbjEiqxkAhe8P7UvzpxVHbqUKzOASYNMiVyiHlnEozSiGKCFLLezHxXyc6D7bc9r
JjWpSvgO/LwD3YdkRwCS8cKRrug0zZUfre0Hf2JMc1EJ9eVA74bomXtn7AiKCo8ryjKjI4FDv33h
ZM03AawPR7kHHFukrHOgVtQQ/h5NptLFmt1BGEsg9guIpwwGN7h188KJUlACnA+sG3Xv/FT3Ng8P
+Iy4eea1nv4lK5TMxqQPDGI4Jonvgo9RQts2AFSSg46x0aNPumCS/G0eR0E2UYGrEMObWVqpXEXT
3IKq+4GYzGjm9VCgqf96ZYMiTiShgTKxsqc9xxmKW2zHmc8zdk8VibSuEBElLnidSHuPrK1dBWDD
D6p1X7lqJDBGA3Qy+i4FLWfEKPDhGAJ/UQsN6wLjxnBttsHh1oiIwpaByTLV1CnYySQp+9FQAquR
FPacqJp+H16v5JMR9iDjlOGqubmVOUSBaHaBBg2L0dVE4gbBeziSDQYaAHeqB1Y5N3E+xs+KgauA
3iazGfvg0FlXUd65vwniZGZWAIcyOnIykTYlGhDWavMEFIB+Wi2DXA25QxBiSE+0+aAvRaII9/UG
eeRiEXvtBOHF/gLBFOLLwz8fVNR1TprctJSmzKjeZ1ywETuCWHrGrGPEbS+ZmxBNImnBcbJ01kmp
bLMWyWMl8uCR9oiwLXmS+jEeqlBf30DjoSWOoOXmvH16ODz20mMNoY4PjK+eH9ghsD/Ip0pbOM38
pmYYVOL7VAIIICFzjTayWHso+YAc1fbEKEpk8rrk5PoX2zRc6NTdzqAsA8kIqS3KNoDNgDMcVEtP
EoC8wJkPb27IutlxDWuNVBBkri7HupWirAyDTHr0YljPdxM1kjLbbbHfIiT9H0RGmEjwji0CzJXA
UJJ9Vn27p6vMk3hNI5x4ndAYdhakJCZy/epu6pG4VZRa+h4wZvVy5zM3iqjCOH74sEZOLJvFymVD
2UXi49acx83r026rcmXCDk7HcX4w8EzOnQEVKSvw2jsrLzI/nhcL8mxlhExCoiVaaMhSRhxjpuD0
Wm93jC2AsgaPAQWdceG7C4kTBpiblSsCVM0UqwCEs3udlEIBV2a+ExrD4Id3AXUSA5LJgFm21ou4
i4D9IiUvwCblXGa8ARY54OewVoEuTroGW3MLUwXIpmCexBlcVvKLeQutZnRcaCjrR3lFBvxCZMiW
aaQ25v+487WOzv1oGmSeBpxlkT4w8zDJgqQkAykFEKnp3mGCgV6KtYcaOUupu7Wvtrx0wkJ+NedV
+0t2OsinN3Zo3djnK9DAZcKe3gsmf1o68M3hGmmFvFgGMbs/bX32Y3DyLvSWQ1djHBHoezogTu4T
DZbMA3NnCCj8SOWTW8DVHQLgrIzYRZ863pBeF0Azvx33iaLLhe+HF5ZT5MwDF18a9NUfFpk+FJGz
noXgja8NbObzhW1rI4AMI+zG1GpLQEmvL1y08MC1pbcSF6QMzjDs7PXvdHJ20wMzxpY3xSEhhV84
4TpeGSXZURG61lIhqziDdZsbBRmnjty9dSjSLGBihfrFuRMQ3W+emKyHRJ76PlgI0yo+pCh8i01Q
g2ULgx345N2GFGWchqV2rmWRcRbMQSnv5AEVLx3riZhQ+C1ZN5V1PJQEty/QItC3FTtIcl/ff8WC
7V3jcANrHjB40+1oJZISLssqzUfagRUwrqHQNsUqiCOtMz+YkKaOkoDwzSiTrj12Bep7yglT1UaA
um1bRbjEJ4hKynxaJQs3YKxfUYS+EUqYyd38oVC2ZG1gpjQtea/l5x1YhZn60bZ0GWMYLHb7lWSo
nihPs6SxNZdbz00DQqPdxeF0hkRnjerM5M1jf4mv/N2Xwi9IMpYry6yDVnh4WVT5LREeQOwAIPlv
pJtmEF45hqAhiyXI//EcjeS58ahPcElYrFEbqG2mS0rzjaiwGE1uR0Ld1tULnoa9n8+7/X/+GPzZ
Y9Pfy+bTXiMIvoF2iFpEvT+6bfKn1rMoXDGhQ7qKAIhx/fXuFmyZRWWT9cWYP27XDDq94nDcPmlj
0X5Gcdw9PprjU7Bhnas5XyQw1+prfRQ4kV/J6G6DjwrqNFdIFj47jaa+HDlAwYODUYhhtW2NuCll
OaiQgJPifVCsrXVYbRoUKiHQElOwe0WX1FPvzAe5WxNxff61Aws6UEj/2j32/oC5OG+Oj/VZMR9T
Rx08F0H3+9GnuQ6bHscyP0LqpttIUaqhrkx18EqP2EBtR9VnlXaxTWGjGJ83td6cPNphgH5Q9FuO
FzmEUMhNeSNnWs4IX19w0YJgWorB27LS7djkNiBREfh9VXECASMpa2tOpDmENlARrlO6mRoMW+mp
6nEmwZvo+PbWOBX3Su0iwqrfLY1mufKCPKWTupSqGr2EB2UvuwdBFPKzkQIso/FAk2zSNBT3swCi
00Msx2Kd+pJCFjDKqy9QxgnS2iqKFMV9CxJ5gNqhxYCC/K1SOr/amCNiNITDKmjKIYhcEwoXam2y
72mRU1tsXBpAw0W6gQuLOAFFC8Wmhu7jEcoz/3GOoXnONi/l3fZ4OB1+nXuL99f6+OW+9/hWs7uZ
UG58RNoqTBnXP5V5Jnaf+KqQySFWbX+LbtKLwIKH0NV3038P++ObC2SM/ZYp+0aTYEMiptLecpA7
0nzrdaRueD0YkCtYohhSNiAy/kofIQSP+hT4ZjAkxg8RVxebuRnckAWjkdZBncSJ0pCNVJAM+30Y
D3srnDJ1h6MrICSaaymuRperYiv8pt8nakAEZY0i1oDj9ofGwHlOPriKBhS8f2PpK5a51FDOe2iW
onvOMFfji10vhjf9AVWSIS4vM6S4sMwQP7FVfX254HBFFYyi0dChHwEbklk4sSRGEKsB3i2DZDCs
bi4sKjjqAiZfDMxt4l6xa2euvNI1mzt1r4ZjagF63wdDOq9NQxGD9Tho8idUxgCVyGwYERHRI4EY
XHlEtxg2dKape3lTsM3qeMShEHnOwFzzDB6pjFSHKFX2Uxs8kIy+j4iS+WR4YUfcDCdjoxcMOCGB
Fbnp7vhfsBn4nWOG3tDU4Bf0nGRJiXFDzJ4gU0VZvRTOnPsucnsUNpKn8+Zxt3/UZSBnu62ZSHt4
qc/aO7+G4dT7zfPhEYwhHnaPuzNYQBz2rDqj7CU6uSaB/rn78rA71lt0ulbqFOyKV1yPcHfpjXxU
Bee3N6+bLSODPFYf9v5jYs5gY2vsD0fn7/vzU33aKVVZabi/WX3+7+H4H/yS97/r4+de8PJaP2DD
Ltm13yzRTO2ZTXUPzGIe33s4jbAAAledZRsRd+atT4dnkPM/HLSPKFtjJ2ItSnIIX7j8Pctg/5z9
w/GwU1wOHcxWR5pVCeqW08srcNeC52p5K5VxwOQMcLagtEbImSZRyqT6WJZfGrYRH78Vj0yB4C9m
GlAI7TpYtpDvgEmKkUQMjPYGIMDcYrazBGrA98E0019wDaJpFngQGSVd0HLmLPBDDwiZsEEpLzFa
vOKnikESjHCyghCeqSEGkVQA1ThaJS0MdFPK0Sjgs2AF0QkiWbRZLCFwWBOrjC8WNMjKD29H2soS
XwUg23eVBsXVeEquJ7ISqQ4nCKdkIFMuAfKcBd1bMAKb11pjpWf1y+Fcvx4PW1OBByFYCnCElB/X
W5iw75I2plEVb+L15fRI1J5Gcphe/KmkcuWQVpzs2lHqk7Z0UkKaXdWihj/mJm7vjxxzwPSSfc99
2r3+2TuBuvBXG52lu6he2GHPwPnBVWZQbHYCjfjp8bB52B5ebAVJPD+dV+nX2bGuT9vNc937fjgG
322VfETK1WH/ila2CgycbJ8Y7s41x07fds+gP2sHiajq9wthqe9vm2f2+dbxIfEtn4FRoMUuW0Hg
9b9sFVHY9qHht1ZCt6ZSsJC4n2U+pXXxV4WLqgg+hn+d2TVktarhxGgu9c1RnwYalK4GVbFMhB+N
ZO6xgcNLiGqbp+dRCeQjKwAdihbBqINV7pQEg2eubF6iYPyY3aSkz1ZHBk8GSQwvJlq7d7Nglqhx
sgDcKDiJcEsBN+Jn/5Vjv0llDFJsNYdYay3JUP2WfNnotsgrqaFoylq+s+swBhUTDxgE19sUmkbO
2JKibRq5TN5CtRhlwnu3yr1bhT/95wy0WEPxvR8mKaQbLDBIkvRMt7pGN5/ueEXHRh7E3bzm/yk/
Pjse9md2hDzIrpXgjeNjDhOC/ZZKNOf06zPbtdqwLiJ3PJzQfesK/L+x6u5T/bLbAgNe70+KBSG7
zK77fenBNXe9UV8L98BhbdAtyUFAq5YbUO0eGgAyuy47PDHzWPdyShK0klruRoHUUYVzVnD8Es1T
UZnZkolsJBc+TGzENnwWtdFtvttLIVCXQ3stXKyk/ZiHt5cXEVJG/xgFxx/tIGBCvd++t5LS3/Bc
6Hn51zQMBSvAGbG5sPf/6u1O5+Pu51uT4U1j2Cx03DPgaXOqv4SMrH7ohYfDa+8P1s6fvV9tP05S
PxQz/39Yso33d/kLlel5fD8eTtvDa80G3lgNdiK+COvN8/lJWkYCejz3ss257kWH/e6s1UmiJaRc
I6/v7WX3sDu/Sx0US2dRDAbycWGQ8iXC5uYMr8Mv9eb0duSRMd9Y0+rKt1Pxt7Xd49NZGSQhKESj
qz597Khl+OvC5nFfn/l5TQ05iecl357Pu9fn+i9tA8HRGaku9V1tcplmMLaMRbK3T+KRQLxi976A
bL1/YNsRw5xI3UAv5KxMi/a2fZHRaH0t3dVdgBSy6mbY92zB4Bv7Zv/49sz+/3o48RB7RPd/h1xZ
/69MbtkztKmbslCQpVmvzxcLcwJ+HhzrEywwai1F+eRqQOWq+ZE6w9FQiVNj1NMt0z0oPsjR0ZFN
jw5/7V5g38C4PexO/K4z9luqhCrLs1l/rHboYjX/t7oeviTrl1c4d/XRbOPumOj2W5aSsyf70boG
SCDx0NyJBAzoFJEfVoU7NURNeJ/FGHdmzI7sOwj+0sNoWM0aAwGx7/TCndSdY0gRsMELw87/D7Qo
uZQztVO3NN4ZhppFTJNSsP1e0Pe4jhrQtUhpe7rMMU0BOr2Z+MbYy5JACZPRgCDmOMSqDVL61teV
ap4jZUpBxyotjoofme5o/O5YQoylLa54w1G0kFYA+4HpWuGVOZfDrXUI1kJVqAgMUSWxdQzE01wK
X2OFie6wre0NqVZvyWZGVFnieyT9GcSJMiucyU6b7AcakmHgN54nsysPYZzQdNBuliPRLEr6+WiG
UYsSyqQiDxI5rxz7Ba7ehqFYHgbRlLTQxguG/T/2XcVdCGPPkQIaKFcl+RhVrSJAjTirVbGdM4kQ
4Z5vEeWAvnfCwHMKNjc5kcipHQHQvKl7iYnsQzp9L8OMeEYmmXiELSR5sGLCICUKCprcd0tIYNWN
K8OMzQrHmHVxlmTYFXLmmoIfNTvWmlXL2ywYEHkHIRErzUzn29RT4pvCb2s1rOloKkLGdweSH7Cp
sCVI/oYIeYV9s32lQiG+0Upg6yQWJrweV7wjyu9GO1vdK+nnAPO9TAo6u9Xqg0kCvBohASBJk2bD
zUrqURFIIHG3Xsz4yO6mmeWWNT0tMvGpnWqjgV3seUvEIxu06dnIirIyBq8qhrY+UnJazWKMA52c
LZlCh0K1/gyyxwYzaU/FQcg/VjpKh2JZyQCehVia44asWkF0NBPcDoaJorYY4vjYWCLf89Jo/tPm
gKb2UdOIiBevJIgQyPBHQgHHJHDhmuAfEH2YqjaTk3XADMlXPD0s/gr2iTy0AtKEvk5k/1/M5Alg
zrNKLyix52BIcJmCPmiozHcKmPFxcuZnFddktRGJT6X7EVcXGRVjlnPjR8m6sQV0Ah8HocEyvQQc
04SyRRqniuDNyiKZ5WNlRXOYusjxFpFN2RRXmsYkTz1tm1i0FcGguZvtkxoFP/aL7lS0MBh4/tPv
Z7w+XiFGivwKYWDhOu9uczGOeXJ7ddXXjqlvSRj4dMM/WAnLriu9mbEhRZfobnA5Msm/zpziq7+C
f+OC7uiMHykdF4M5+WTIvU4Cv4UVIHh5Yhbn8eiawgcJuPRDnINPu9Ph5mZy+2XwSV5NHWlZzCgL
Jey+0j6HEC28nX/dtNkv4sK4JRBkv3IQrUetF3zcpcHkMtOpfns4YPoigrcTEYjN7+Nvnosg9DI5
aTbkFZbPIyFCtjXa85NAUpwinNLZJNusxMHciQsQ5ZQc3PxPN3JCrjM/Tjr2wMgTTjxu7kw1G4dy
OOEwF7OnrAoJLZZVxZaVWrDFXCOmmzwFd02HFVKIbkjbM41EsvjSMBNr6zeT699o/erj1q8Glm+/
uRpaMYpJmYajjBc1kontg6+urJhba5O3I8qUTSWZ9C3fcjsaWsf4dnz7G2N8bftgdtjCqqtuLN80
GE76dtRARTm5GwTqN4j6BzR4SINHar0CPKbBxgIUCNuQC/w1Xd8tDR5YejUYWz7Z6NddEtxUlCzb
Iku1CUgXy641J9ZrAoTrg0uZdfI5CWPty4x69W5JsoSJUHJMyBazzoIwDFx9TQNu7vhhQIV1agky
378z6wxYpyHDxLuBiEs5F5ry8YrjocAUZXYX5At9YCx3J5OIXU0R04CqGHK9h8EPdLBtHVzIu0/R
V/A3u3r7dgRlrOGcc+evlVsKfouE2pXBWokrENK2s6sjxgC4GeOZZUacc72+x+t+kVqCIMsJK4zf
oDfLXX0C1zHSrXS6oEYIAi+YfN46klDKJUMRIiDKHS3qa6JwERg13D5akzHuxfMhRQ3w3G6Srqsm
WZAcINMgkr/WrEFk8aL5A4McDrY8dehooDPI+sdEAq44pI11gZGA2iAYlZ5njETzgfj09fRzt//6
dqqPL4eH+stT/fxaHz8RMwTx6VIyTEVLsnYaPyodAX61jD8MKLdFqQH3zkuWcRXmEVmLTFD5TqYn
aWroUVpEOuDg/LDicWxjW7Y4Cz2ZO/5yEcSyiWXHWqhJ9pcz0QcQkhA+0wclepVkPC4gGMkkZGRg
wXp3+8eR5HMYwE/wcg3ZBD6/b142nyGnwOtu//m0+VWzenYPnyHM9yMcIZ9/vv76xE+Vu/q4r58x
/GKND0nd6fI/nUdzb7ffwVvq7u9N814uWFcXGVuQK6t7J8PMicIdUmJwKSpwM5fsewDEVi0bZZg2
dSBbFORtJZwtbaTQhJ0OxX02rxZvVIN4xu4ZK62asVEfLoG2j3ZrfKGf8q02jy0RVIvIWTIxFUtr
r3p8fz0fetvDsYakK3xfS1OFxKDh4EalFHhown3HI4EmaX7nBulCPoU0hFlk4eQLEmiSZvJTZQcj
CVtJ50XvuLUnjq3zd2lqUjOgWQNo3kxSxlQ4c6LeBm4tUHlBzuPgoXJdp5rPBsObqAwNBATkJYEK
X9/AU/xLOaRwPP4h5r8sFoxFUHxLOEbnZ7iU/vbzebf98p/6vbfFNfoIMaTejaWZ5Y7RlGeuD0jA
Zbbsux4dGaHD0x5IAp15mt9Os3gji6dXM0Jldu8PJ5PBrfHZztv5CWwFtptz/dDz9/jtYLfw3935
qeecToftDlHe5rxRDFCaql3qyU3MvxsZA+MuGK/nDPtpEq4Ho/6E2LfzIGfrxtyh/vfgnhzUhcOO
v3vj26ZoJQX8w+l/Kzuy5bht5K+o8rQPidc6Y2+VHkASo2GGHFIEqRn5ZUqWJ4rKlqzSUZX8/fYB
kjiatOMq2xK6cRBHo7vRR7SMaZLGQ1sk0WFM2/hUpMJW164hqy0rmk3UXkV9xFs8kYQHC90K/QEf
i7nBhbYUuhm33USeKjtaY4T5WmJciX66ooUu1cwQl6WK53OLkxwP8Cpoqbdt2b+8xsvUpMdHwkph
cTS3261IqpNCrfRRIlAWhoj+x0M/7eH7LF/EpE3sanJTl9lJNNwyOxXGVOawnYF1KydE2Z4Mldmh
qCjqD8tSHcYnCA7e6ZlUfHooUV4AHM8NwpTHMyPANHOJ6/9jAZv6lPwleZPdP/3lWQgPVCDe81CG
NvnxjgKWY7PIjRQnrV9IVWqQ3VV8vhW7QZVeqvIRJi0Rlp/NzUumZbHSghc/utAsiRQoYFOjrbew
UqXofmzvu021yIXdasvHz+cV+f7whEZePgvdfxjmD9TCAIpPoksrAz+cHAmrVnyacHwfwMsZimMf
+di+6+bxy/eHg/Xbw+f9c28WK40fo6zs0rpZx7sya5KLIAKECxEJHEOUr3VxYXB7TH8BYkRN/oHJ
GzGDfcOifMx17tzI55ad/nb/+fkGWPrn72+v94/CdYcBt1WQuG6E/JAOIhLvyt7QK77sBhQZNLAg
QwvhCvhoIrinr8CFYaT8wzmUuYFO0unxK2Y4FEQaSGk4n8uNMI3KXJelRh0SKaAwZMrYqgOsu6Sw
OKZLfLTt6fuPu1Q3VnelrSXQiFCvUvMBY99dIRTbsBgPLsbvsMmNQX31UH98iyI4hfGG6rJmLL9A
BVGt+SWbLBasKi1+ZkXb5j+JtXyhcFov93ePbBh5+9f+9ivIluNGJTcPje1j3+e/3ELll/9iDUDb
AVv+7mn/MDwF8YPSoI6wykHvUSyAm/Nfwtp62zbKndKofoRhMzQ4GWGNhh8y1VwLgxlnjZuDc4bh
rcygzZSfbn9i2vrek3yNXVMakkVPFIpJaoAJEs929aU7tr5sl4C0BGSukVLOolGBajA7xIX2Xtlr
NWXKkOTAAGDkFmdaeyvRRb7O4J8Gc0y4au60ajL3yGIgRw2CYZl4EX9Yr+vG/6bXSzQSSMt6my5Z
FdZoj29LQVgB6uoSlvTwzMeIub10l7fdzq917AnE8OugJvevOYLAgdbJ9YeJq85BkW9wQlDNJrp2
EQCTJ1c689jN9MQbr/PMA6QsZrFT5/Er5Kk5P4j7xQMIbvnBsGdsAEsx5nNY/gmpKFxlhXfuqHTk
MrzSRdG6Wa2B4xi780qd7pzyExEbeAy5XGwFmQ4BnYol/O0nLHbXjUt22w8yA2nBZBddS9yPRcjV
2UnYDRyCUugKStslnKDpxjBCQBq1lqR/RGV2i9vC8YsBPuI6xZ4pl1PuW2gNkf3j1w0QIbKdqYqq
dCN6uqX4DOSeYg8GXbowMuS9UsXOz4CtjKnSHGjKlYbZatz81agR5iyxtmCNzUMJxoOnBwy3HSRC
CFNZ1uza3dmJR9wGCwvWyiNitx4esZy7Z5NXbeGoExAz9Z8wsKjWDVBGAsXi9P7Pm7dvr5QV5/7u
7fvbS58D/eZ5f3OAvln/c5hEm3oIm8QnUjT8OHRjdvVwg4Jpct2K0Ww9LKelf6YaymVVto+kpLgD
iKIKYEVK7Wb/prmvcyFW31i8MxfhROJSzl1+5qLgvekQyRpm3qx21WJBmnxnMxdV4v/mXg599eIT
ZuRzdmZzSSk0x5Kyzr20OfDLInN2U0URoS+AmWi8/Qp7uD9PV5mp4lN2oVtKo7DI3I3u1qEgoF5k
BIOuGlV439KXb5Qb14KKMl1XbVDGogtc7+gMPaTIMHBA2GR9wEW2yL9OBzeigKvxn4Z6dpJKn57v
H1+/skfQw/7lLn6O5sRt9KUeu4GFGJHeU4azWwUGM6HMwYPm/vdJjMsu1+35ybCYluWOWnByfWXX
a1Xm6aR5twcP3Xivy6RCyUE3DWB5Z47x4S/wYkllZAvGyQkbVAL33/a/Yb4S5kFfCPWWy5+d6Q26
RVlVsjhtYJBs9/3h8KPjHI/rXwNBRtca0V6s0SqjFwdl3Lx5GpOUGegONpt7iuyRZ4NktEcrMRWI
M3EBhMaENuvXYRtMtBfdOrU2uEB9dsdHiYy30WpFAQCAUJy7ftU/O5M0laTJuL/tN3m2//x2R+GF
nKzuniMfhplHYUOM2WnHZ6IRG6Jumx3PXLCCaBiZG0Yo0eFFpNlBS+GjdngDdolR1ooeCX3QMUGF
6iCdQq1VijmImmql1+7M/tRc+R/Oj+ThdKDRYi9J2ZfSoTGHfuBxBvEQ0xlU63jaEE53hmTVgnWr
zToQvkkmr3JM1iAKVGPDO5Zsgi6bKlOtil63wrln5M02bmAjXbWDY19LqWjdAVMJ150wOOV2qwQ9
AsRobkWX9EiO/pWKkbkywc1m143SiqtV/AU9ZHL2+C7qjGfaatIl8owE0uuMPR0Evo2bwATqF5T9
K+7/SgzpG1fzNxwHpcUX/BBkKQhyKOFU0KhWyri2YAEAX1oCtoVtHBgaK8gYigZKeAmvq/GAAkPr
CTZBxxMNcnHVtag+cGeLAeyrIG4cRqAlmYHb75NIBcFHxy9XLmeY1TdN2rZFRz/YSEtg2XoyQUgH
1fenl18PMHDC2xNT9eXN453Lc2B8bjTSqDynEa8Yff06R7PJwDG3mLPhMIDKbtmtMbmzkbb85lLI
i0bavSLKSjj/CWzbB/fVlzfKEuDQw9EoRAD7c4ZfsdK6duI3YlcOrf7Py9P9I2We/PXg4e11//ce
fti/3r57986Npl/1ORUoot6YF8o1qr8S3Wx86yokMdOkYoy05h/XrtVbHd2imw1DgHhVG9+Yz5Ln
jdFlVI3GEZxSMijTdVSA6h5zfngaFtP7t7HQsxDKdI2cei3KxzkU4tMZ7yTqKG/SrlANsLe661s7
ComgxZ65EEDGR07WFFpLSejGZnB5UXIbw6z/EyxhCyuP9mkTt964KpG6yqQLr7Ynp5qMm9+ovJUc
Q3qZ5F9s34g1bi4XhbqYCHKarkY37P5bkDVFi7FujZlZ4MpiZdzMRK/46hXUA3javzKr9OXm9eYA
eaRb1DG7kU54HXJ/buzNhMXTZ+cirsFWt3K4b2YAdsS/gGSDwTx6rsqjTxMjDrtKG23NHWPfL9jB
Ej8X7IRe2ki7HYWHinYIQn6w9xAFvTqdBh5cGF7sJK4M5P3oMOigUaJdLcL05ehhOoav8D4u4u8u
rXTSTKXRsLIibX1gbtFh3z8XMORl1dYFs1Kt7kNESJbvVc0f0AQMyiBDzUMvGlUvZZxeFB5CFUwD
d5u8XaKiJOSfLLgkJ35AwKeHAAUEqZSWBzGBM19H/OgCH2pD9Qt+ODfr3Lr0GZRXPRgzDyP1bxpS
goSB6CjOG+F7T124ArhWBr40jScswu8Z+glE5zrthfWIEqH1L+mIbB1Jwo8WeTQbl1Z4RuERrvLM
Asd9ACeAD5ViAvXx1vPGB4TZYErgyYGxvBBXXG4K1U5Xs+O1u8pEm8OsgctfVt6BC0CDQGA2Sro5
E7gRYA/Yj46MlPtytQZirMiOmypMmKsM6HAGZhGTYkWxPSgsoUyy+kWjTWzCzTV1DH0ove+l8Y71
NYjXa9gPYTdLfHSNUx9x83yw2G89mnw697PqYeewjnhRO9CLKkjVjHMq+1MwIk8C/tc1Jp+w9+43
E6YC7+rJK8gZmovq3WQOzhBohE53potWTW0NrUu4pJtLmzk7lqPi9UDSM43oLdGMM67BAPTiA4Qj
qFN0ntyqo7QXDohdeSxOxB68HH98L/IHNN09zxYTSfL7sArkmPeha0J+7KAAZiGTNlzowXBclXe7
f3lFphOltBQTSN/cOYHRSPR1fKJIEraqGk8SH0RkSYomoN7SjAccDMPoevQDq/R8Huqiq2YMB+E8
XSxoj09je5T8h0ElhmVHzWCkzQBZHxWGvH61q5xg7HEmEI2TfdMTr2pQFSftM8JEVXPT4fvTztM4
MxDOhWo0v2Odv//75D38GQ4l0DK6PGHeOCK8a3RWrLLWy7DIAjseDhPEJnARynxNSaMCQd8EgjEV
ZvmV6PCb9FIHSUshx5rgo2nIH7uPrT6+99YaVMPHQUwE71VgofDsRHguo1Ev9ZY0kH6pfTBi3zET
A03qe8SxcRMAWjGgOYGtNY3fln2p8gu7Ls+CGd/yC7KPh7EoFkCJAtwGhe1Ilchfq0RzVoIBiQ71
OasyHm5Vh/PR6wODjzDIVKC54RjIAe1zoAnnPgt35CJvSpBIpbseKlJU/YEIjXeNtkHGZLLj2kul
bTFPnNiOytXwDQDHVinS/qVlRhFSfjAC1G1MQ3ne6OabWiTr3Oi7pvJR1WUKfGIdrTkxpKgGnu4T
6s4jkP8XeW2KOFB/UuM5e69EzmH83vp/S2de727hAAA=
--===============3828851995494216686==--

