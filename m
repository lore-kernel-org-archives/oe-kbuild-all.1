Content-Type: multipart/mixed; boundary="===============1815488298557595893=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [xlnx:xlnx_rebase_v5.4 19/1698] drivers/mtd/nand/raw/arasan_nand.c:365:16: warning: right shift count >= width of type
Date: Fri, 22 Jan 2021 05:05:24 +0800
Message-ID: <202101220521.LArf7mnO-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1815488298557595893==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Naga,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.4
head:   6ccc4c949a216b74368d280af00ac0cecf6fea07
commit: 1dea215e98f470c4fabe230cb5dcb648e3301fb9 [19/1698] mtd: rawnand: Ad=
d support for ARASAN NAND controller
config: arc-randconfig-r014-20210121 (attached as .config)
compiler: arceb-elf-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/1dea215e98f470c4fabe2=
30cb5dcb648e3301fb9
        git remote add xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xlnx xlnx_rebase_v5.4
        git checkout 1dea215e98f470c4fabe230cb5dcb648e3301fb9
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Darc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/swab.h:5,
                    from include/uapi/linux/byteorder/big_endian.h:13,
                    from include/linux/byteorder/big_endian.h:5,
                    from arch/arc/include/uapi/asm/byteorder.h:14,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/arc/include/asm/bitops.h:429,
                    from include/linux/bitops.h:26,
                    from include/linux/kernel.h:12,
                    from include/linux/clk.h:13,
                    from drivers/mtd/nand/raw/arasan_nand.c:10:
   drivers/mtd/nand/raw/arasan_nand.c: In function 'anfc_rw_dma_op':
>> drivers/mtd/nand/raw/arasan_nand.c:365:16: warning: right shift count >=
=3D width of type [-Wshift-count-overflow]
     365 |  writel((paddr >> 32), nfc->base + DMA_ADDR1_OFST);
         |                ^~
   include/uapi/linux/swab.h:117:32: note: in definition of macro '__swab32'
     117 |  (__builtin_constant_p((__u32)(x)) ? \
         |                                ^
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__=
cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   arch/arc/include/asm/io.h:213:36: note: in expansion of macro 'writel_re=
laxed'
     213 | #define writel(v,c)  ({ __iowmb(); writel_relaxed(v,c); })
         |                                    ^~~~~~~~~~~~~~
   drivers/mtd/nand/raw/arasan_nand.c:365:2: note: in expansion of macro 'w=
ritel'
     365 |  writel((paddr >> 32), nfc->base + DMA_ADDR1_OFST);
         |  ^~~~~~
>> drivers/mtd/nand/raw/arasan_nand.c:365:16: warning: right shift count >=
=3D width of type [-Wshift-count-overflow]
     365 |  writel((paddr >> 32), nfc->base + DMA_ADDR1_OFST);
         |                ^~
   include/uapi/linux/swab.h:18:12: note: in definition of macro '___consta=
nt_swab32'
      18 |  (((__u32)(x) & (__u32)0x000000ffUL) << 24) |  \
         |            ^
   include/uapi/linux/byteorder/big_endian.h:33:43: note: in expansion of m=
acro '__swab32'
      33 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                                           ^~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__=
cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   arch/arc/include/asm/io.h:213:36: note: in expansion of macro 'writel_re=
laxed'
     213 | #define writel(v,c)  ({ __iowmb(); writel_relaxed(v,c); })
         |                                    ^~~~~~~~~~~~~~
   drivers/mtd/nand/raw/arasan_nand.c:365:2: note: in expansion of macro 'w=
ritel'
     365 |  writel((paddr >> 32), nfc->base + DMA_ADDR1_OFST);
         |  ^~~~~~
>> drivers/mtd/nand/raw/arasan_nand.c:365:16: warning: right shift count >=
=3D width of type [-Wshift-count-overflow]
     365 |  writel((paddr >> 32), nfc->base + DMA_ADDR1_OFST);
         |                ^~
   include/uapi/linux/swab.h:19:12: note: in definition of macro '___consta=
nt_swab32'
      19 |  (((__u32)(x) & (__u32)0x0000ff00UL) <<  8) |  \
         |            ^
   include/uapi/linux/byteorder/big_endian.h:33:43: note: in expansion of m=
acro '__swab32'
      33 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                                           ^~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__=
cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   arch/arc/include/asm/io.h:213:36: note: in expansion of macro 'writel_re=
laxed'
     213 | #define writel(v,c)  ({ __iowmb(); writel_relaxed(v,c); })
         |                                    ^~~~~~~~~~~~~~
   drivers/mtd/nand/raw/arasan_nand.c:365:2: note: in expansion of macro 'w=
ritel'
     365 |  writel((paddr >> 32), nfc->base + DMA_ADDR1_OFST);
         |  ^~~~~~
>> drivers/mtd/nand/raw/arasan_nand.c:365:16: warning: right shift count >=
=3D width of type [-Wshift-count-overflow]
     365 |  writel((paddr >> 32), nfc->base + DMA_ADDR1_OFST);
         |                ^~
   include/uapi/linux/swab.h:20:12: note: in definition of macro '___consta=
nt_swab32'
      20 |  (((__u32)(x) & (__u32)0x00ff0000UL) >>  8) |  \
         |            ^
   include/uapi/linux/byteorder/big_endian.h:33:43: note: in expansion of m=
acro '__swab32'
      33 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                                           ^~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__=
cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   arch/arc/include/asm/io.h:213:36: note: in expansion of macro 'writel_re=
laxed'
     213 | #define writel(v,c)  ({ __iowmb(); writel_relaxed(v,c); })
         |                                    ^~~~~~~~~~~~~~
   drivers/mtd/nand/raw/arasan_nand.c:365:2: note: in expansion of macro 'w=
ritel'
     365 |  writel((paddr >> 32), nfc->base + DMA_ADDR1_OFST);
         |  ^~~~~~
>> drivers/mtd/nand/raw/arasan_nand.c:365:16: warning: right shift count >=
=3D width of type [-Wshift-count-overflow]
     365 |  writel((paddr >> 32), nfc->base + DMA_ADDR1_OFST);
         |                ^~
   include/uapi/linux/swab.h:21:12: note: in definition of macro '___consta=
nt_swab32'
      21 |  (((__u32)(x) & (__u32)0xff000000UL) >> 24)))
         |            ^
   include/uapi/linux/byteorder/big_endian.h:33:43: note: in expansion of m=
acro '__swab32'
      33 | #define __cpu_to_le32(x) ((__force __le32)__swab32((x)))
         |                                           ^~~~~~~~
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__=
cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   arch/arc/include/asm/io.h:213:36: note: in expansion of macro 'writel_re=
laxed'
     213 | #define writel(v,c)  ({ __iowmb(); writel_relaxed(v,c); })
         |                                    ^~~~~~~~~~~~~~
   drivers/mtd/nand/raw/arasan_nand.c:365:2: note: in expansion of macro 'w=
ritel'
     365 |  writel((paddr >> 32), nfc->base + DMA_ADDR1_OFST);
         |  ^~~~~~
>> drivers/mtd/nand/raw/arasan_nand.c:365:16: warning: right shift count >=
=3D width of type [-Wshift-count-overflow]
     365 |  writel((paddr >> 32), nfc->base + DMA_ADDR1_OFST);
         |                ^~
   include/uapi/linux/swab.h:119:12: note: in definition of macro '__swab32'
     119 |  __fswab32(x))
         |            ^
   include/linux/byteorder/generic.h:88:21: note: in expansion of macro '__=
cpu_to_le32'
      88 | #define cpu_to_le32 __cpu_to_le32
         |                     ^~~~~~~~~~~~~
   arch/arc/include/asm/io.h:213:36: note: in expansion of macro 'writel_re=
laxed'
     213 | #define writel(v,c)  ({ __iowmb(); writel_relaxed(v,c); })
         |                                    ^~~~~~~~~~~~~~
   drivers/mtd/nand/raw/arasan_nand.c:365:2: note: in expansion of macro 'w=
ritel'
     365 |  writel((paddr >> 32), nfc->base + DMA_ADDR1_OFST);
         |  ^~~~~~


vim +365 drivers/mtd/nand/raw/arasan_nand.c

   337	=

   338	static void anfc_rw_dma_op(struct mtd_info *mtd, u8 *buf, int len,
   339				   bool do_read, u32 prog, int pktcount, int pktsize)
   340	{
   341		dma_addr_t paddr;
   342		struct nand_chip *chip =3D mtd_to_nand(mtd);
   343		struct anfc_nand_controller *nfc =3D to_anfc(chip->controller);
   344		struct anfc_nand_chip *achip =3D to_anfc_nand(chip);
   345		u32 eccintr =3D 0, dir;
   346	=

   347		if (pktsize =3D=3D 0)
   348			pktsize =3D len;
   349	=

   350		anfc_setpktszcnt(nfc, pktsize, pktcount);
   351	=

   352		if (!achip->strength)
   353			eccintr =3D MBIT_ERROR;
   354	=

   355		if (do_read)
   356			dir =3D DMA_FROM_DEVICE;
   357		else
   358			dir =3D DMA_TO_DEVICE;
   359		paddr =3D dma_map_single(nfc->dev, buf, len, dir);
   360		if (dma_mapping_error(nfc->dev, paddr)) {
   361			dev_err(nfc->dev, "Read buffer mapping error");
   362			return;
   363		}
   364		writel(paddr, nfc->base + DMA_ADDR0_OFST);
 > 365		writel((paddr >> 32), nfc->base + DMA_ADDR1_OFST);
   366		anfc_enable_intrs(nfc, (XFER_COMPLETE | eccintr));
   367		writel(prog, nfc->base + PROG_OFST);
   368		anfc_wait_for_event(nfc);
   369		dma_unmap_single(nfc->dev, paddr, len, dir);
   370	}
   371	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============1815488298557595893==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1815488298557595893==--

