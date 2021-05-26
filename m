Content-Type: multipart/mixed; boundary="===============6750632896224452339=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [xlnx:xlnx_rebase_v5.4 942/1759] drivers/mtd/spi-nor/spi-nor.c:5196:14: error: implicit declaration of function 'of_get_next_parent'; did you mean 'of_get_parent'?
Date: Wed, 26 May 2021 20:03:10 +0800
Message-ID: <202105262004.KP18oP7q-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6750632896224452339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Amit,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v5.4
head:   8ee418d98ee353b439aa529bb5789c28702d6ffd
commit: 24bcc7359bdd609cedf0a715d77dc39e4ad782db [942/1759] mtd: spi-nor: A=
dded axi-qspi support in spi-nor framework
config: m68k-randconfig-m031-20210526 (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/24bcc7359bdd609cedf0a=
715d77dc39e4ad782db
        git remote add xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xlnx xlnx_rebase_v5.4
        git checkout 24bcc7359bdd609cedf0a715d77dc39e4ad782db
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dm68k =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/page.h:49,
                    from arch/m68k/include/asm/thread_info.h:6,
                    from include/linux/thread_info.h:38,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/m68k/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:78,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:10,
                    from drivers/mtd/spi-nor/spi-nor.c:12:
   drivers/mtd/spi-nor/spi-nor.c: In function 'spi_nor_spimem_xfer_data':
   arch/m68k/include/asm/page_no.h:33:50: warning: ordered comparison of po=
inter with null pointer [-Wextra]
      33 | #define virt_addr_valid(kaddr) (((void *)(kaddr) >=3D (void *)PA=
GE_OFFSET) && \
         |                                                  ^~
   drivers/mtd/spi-nor/spi-nor.c:269:34: note: in expansion of macro 'virt_=
addr_valid'
     269 |  if (object_is_on_stack(buf) || !virt_addr_valid(buf))
         |                                  ^~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/spi-nor.c: In function 'spi_nor_write_ear':
   drivers/mtd/spi-nor/spi-nor.c:691:5: warning: variable 'code' set but no=
t used [-Wunused-but-set-variable]
     691 |  u8 code;
         |     ^~~~
   drivers/mtd/spi-nor/spi-nor.c: In function 'spi_nor_read':
   drivers/mtd/spi-nor/spi-nor.c:2741:9: warning: variable 'addr' set but n=
ot used [-Wunused-but-set-variable]
    2741 |  loff_t addr =3D 0;
         |         ^~~~
   drivers/mtd/spi-nor/spi-nor.c: In function 'spi_nor_set_addr_width':
>> drivers/mtd/spi-nor/spi-nor.c:5196:14: error: implicit declaration of fu=
nction 'of_get_next_parent'; did you mean 'of_get_parent'? [-Werror=3Dimpli=
cit-function-declaration]
    5196 |     np_spi =3D of_get_next_parent(np);
         |              ^~~~~~~~~~~~~~~~~~
         |              of_get_parent
   drivers/mtd/spi-nor/spi-nor.c:5196:12: warning: assignment to 'struct de=
vice_node *' from 'int' makes pointer from integer without a cast [-Wint-co=
nversion]
    5196 |     np_spi =3D of_get_next_parent(np);
         |            ^
   drivers/mtd/spi-nor/spi-nor.c: In function 'spi_nor_get_flash_info':
   drivers/mtd/spi-nor/spi-nor.c:5266:11: warning: return discards 'const' =
qualifier from pointer target type [-Wdiscarded-qualifiers]
    5266 |    return jinfo;
         |           ^~~~~
   drivers/mtd/spi-nor/spi-nor.c:5281:9: warning: return discards 'const' q=
ualifier from pointer target type [-Wdiscarded-qualifiers]
    5281 |  return info;
         |         ^~~~
   drivers/mtd/spi-nor/spi-nor.c: In function 'spi_nor_scan':
   drivers/mtd/spi-nor/spi-nor.c:5295:6: warning: unused variable 'is_dual'=
 [-Wunused-variable]
    5295 |  u32 is_dual;
         |      ^~~~~~~
   drivers/mtd/spi-nor/spi-nor.c:5294:22: warning: unused variable 'np_spi'=
 [-Wunused-variable]
    5294 |  struct device_node *np_spi;
         |                      ^~~~~~
   At top level:
   drivers/mtd/spi-nor/spi-nor.c:781:12: warning: 'read_ear' defined but no=
t used [-Wunused-function]
     781 | static int read_ear(struct spi_nor *nor, struct flash_info *info)
         |            ^~~~~~~~
   cc1: some warnings being treated as errors


vim +5196 drivers/mtd/spi-nor/spi-nor.c

  5162	=

  5163	static int spi_nor_set_addr_width(struct spi_nor *nor)
  5164	{
  5165		struct device_node *np =3D spi_nor_get_flash_node(nor);
  5166		struct device_node *np_spi;
  5167		if (nor->addr_width) {
  5168			/* already configured from SFDP */
  5169		} else if (nor->info->addr_width) {
  5170			nor->addr_width =3D nor->info->addr_width;
  5171		} else if (nor->mtd.size > 0x1000000) {
  5172	#ifdef CONFIG_OF
  5173			np_spi =3D of_get_next_parent(np);
  5174			if (of_property_match_string(np_spi, "compatible",
  5175						     "xlnx,zynq-qspi-1.0") >=3D 0) {
  5176				int status;
  5177	=

  5178				nor->addr_width =3D 3;
  5179				nor->params.set_4byte(nor, false);
  5180				status =3D read_ear(nor, (struct flash_info *)nor->info);
  5181				if (status < 0)
  5182					dev_warn(nor->dev, "failed to read ear reg\n");
  5183				else
  5184					nor->curbank =3D status & EAR_SEGMENT_MASK;
  5185			} else {
  5186	#endif
  5187				/*
  5188				 * enable 4-byte addressing if the
  5189				 * device exceeds 16MiB
  5190				 */
  5191				nor->addr_width =3D 4;
  5192				if (JEDEC_MFR(nor->info) =3D=3D SNOR_MFR_SPANSION ||
  5193				    nor->info->flags & SPI_NOR_4B_OPCODES) {
  5194					spi_nor_set_4byte_opcodes(nor);
  5195				} else {
> 5196					np_spi =3D of_get_next_parent(np);
  5197					if (of_property_match_string(np_spi,
  5198								     "compatible",
  5199								     "xlnx,xps-spi-2.00.a") >=3D 0) {
  5200						nor->addr_width =3D 3;
  5201						nor->params.set_4byte(nor, false);
  5202					} else {
  5203						nor->params.set_4byte(nor, true);
  5204						if (nor->isstacked) {
  5205							nor->spi->master->flags |=3D
  5206								SPI_MASTER_U_PAGE;
  5207							nor->params.set_4byte(nor, true);
  5208							nor->spi->master->flags &=3D
  5209								~SPI_MASTER_U_PAGE;
  5210						}
  5211					}
  5212				}
  5213	#ifdef CONFIG_OF
  5214			}
  5215	#endif
  5216		} else {
  5217			nor->addr_width =3D 3;
  5218		}
  5219	=

  5220		if (nor->addr_width > SPI_NOR_MAX_ADDR_WIDTH) {
  5221			dev_err(nor->dev, "address width is too large: %u\n",
  5222				nor->addr_width);
  5223			return -EINVAL;
  5224		}
  5225	=

  5226		/* Set 4byte opcodes when possible. */
  5227		if (nor->addr_width =3D=3D 4 && nor->flags & SNOR_F_4B_OPCODES &&
  5228		    !(nor->flags & SNOR_F_HAS_4BAIT))
  5229			spi_nor_set_4byte_opcodes(nor);
  5230	=

  5231		return 0;
  5232	}
  5233	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6750632896224452339==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6750632896224452339==--

