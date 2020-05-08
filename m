Content-Type: multipart/mixed; boundary="===============7662739968091554658=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC-PATCH] mtd: spi-nor: add conditional 4B opcodes
Date: Fri, 08 May 2020 10:07:23 +0800
Message-ID: <202005081012.k46RRapt%lkp@intel.com>
In-Reply-To: <20200507162047.30788-1-danielwa@cisco.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7662739968091554658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Daniel,

[FYI, it's a private test report for your RFC patch.]
[auto build test ERROR on linus/master]
[also build test ERROR on v5.7-rc4 next-20200507]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Daniel-Walker/mtd-spi-nor-=
add-conditional-4B-opcodes/20200508-055015
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
6e7f2eacf09811d092c1b41263108ac7fe0d089d
config: arm-socfpga_defconfig (attached as .config)
compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project 6d2a66=
b10d458e34c852be46028092d2b46edc14)
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/mtd/spi-nor/core.c:3140:15: error: cannot assign to variable 'in=
fo' with const-qualified type 'const struct flash_info *'
                   info->flags |=3D SPI_NOR_4B_OPCODES;
                   ~~~~~~~~~~~ ^
   drivers/mtd/spi-nor/core.c:3086:27: note: variable 'info' declared const=
 here
           const struct flash_info *info;
           ~~~~~~~~~~~~~~~~~~~~~~~~~^~~~
   1 error generated.

vim +3140 drivers/mtd/spi-nor/core.c

  3082	=

  3083	int spi_nor_scan(struct spi_nor *nor, const char *name,
  3084			 const struct spi_nor_hwcaps *hwcaps)
  3085	{
  3086		const struct flash_info *info;
  3087		struct device *dev =3D nor->dev;
  3088		struct mtd_info *mtd =3D &nor->mtd;
  3089		struct device_node *np =3D spi_nor_get_flash_node(nor);
  3090		int ret;
  3091		int i;
  3092	=

  3093		ret =3D spi_nor_check(nor);
  3094		if (ret)
  3095			return ret;
  3096	=

  3097		/* Reset SPI protocol for all commands. */
  3098		nor->reg_proto =3D SNOR_PROTO_1_1_1;
  3099		nor->read_proto =3D SNOR_PROTO_1_1_1;
  3100		nor->write_proto =3D SNOR_PROTO_1_1_1;
  3101	=

  3102		/*
  3103		 * We need the bounce buffer early to read/write registers when goi=
ng
  3104		 * through the spi-mem layer (buffers have to be DMA-able).
  3105		 * For spi-mem drivers, we'll reallocate a new buffer if
  3106		 * nor->page_size turns out to be greater than PAGE_SIZE (which
  3107		 * shouldn't happen before long since NOR pages are usually less
  3108		 * than 1KB) after spi_nor_scan() returns.
  3109		 */
  3110		nor->bouncebuf_size =3D PAGE_SIZE;
  3111		nor->bouncebuf =3D devm_kmalloc(dev, nor->bouncebuf_size,
  3112					      GFP_KERNEL);
  3113		if (!nor->bouncebuf)
  3114			return -ENOMEM;
  3115	=

  3116		info =3D spi_nor_get_flash_info(nor, name);
  3117		if (IS_ERR(info))
  3118			return PTR_ERR(info);
  3119	=

  3120		nor->info =3D info;
  3121	=

  3122		spi_nor_debugfs_init(nor, info);
  3123	=

  3124		mutex_init(&nor->lock);
  3125	=

  3126		/*
  3127		 * Make sure the XSR_RDY flag is set before calling
  3128		 * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
  3129		 * with Atmel spi-nor
  3130		 */
  3131		if (info->flags & SPI_NOR_XSR_RDY)
  3132			nor->flags |=3D  SNOR_F_READY_XSR_RDY;
  3133	=

  3134		if (info->flags & SPI_NOR_HAS_LOCK)
  3135			nor->flags |=3D SNOR_F_HAS_LOCK;
  3136	=

  3137		/* Add SPI_NOR_4B_OPCODES if force in the device tree */
  3138		if (info->flags & SPI_NOR_COND_4B_OPCODES &&
  3139			of_property_read_bool(np, "force-4b-opcodes"))
> 3140			info->flags |=3D SPI_NOR_4B_OPCODES;
  3141	=

  3142		mtd->_write =3D spi_nor_write;
  3143	=

  3144		/* Init flash parameters based on flash_info struct and SFDP */
  3145		ret =3D spi_nor_init_params(nor);
  3146		if (ret)
  3147			return ret;
  3148	=

  3149		if (!mtd->name)
  3150			mtd->name =3D dev_name(dev);
  3151		mtd->priv =3D nor;
  3152		mtd->type =3D MTD_NORFLASH;
  3153		mtd->writesize =3D 1;
  3154		mtd->flags =3D MTD_CAP_NORFLASH;
  3155		mtd->size =3D nor->params->size;
  3156		mtd->_erase =3D spi_nor_erase;
  3157		mtd->_read =3D spi_nor_read;
  3158		mtd->_resume =3D spi_nor_resume;
  3159	=

  3160		if (nor->params->locking_ops) {
  3161			mtd->_lock =3D spi_nor_lock;
  3162			mtd->_unlock =3D spi_nor_unlock;
  3163			mtd->_is_locked =3D spi_nor_is_locked;
  3164		}
  3165	=

  3166		if (info->flags & USE_FSR)
  3167			nor->flags |=3D SNOR_F_USE_FSR;
  3168		if (info->flags & SPI_NOR_HAS_TB) {
  3169			nor->flags |=3D SNOR_F_HAS_SR_TB;
  3170			if (info->flags & SPI_NOR_TB_SR_BIT6)
  3171				nor->flags |=3D SNOR_F_HAS_SR_TB_BIT6;
  3172		}
  3173	=

  3174		if (info->flags & NO_CHIP_ERASE)
  3175			nor->flags |=3D SNOR_F_NO_OP_CHIP_ERASE;
  3176		if (info->flags & USE_CLSR)
  3177			nor->flags |=3D SNOR_F_USE_CLSR;
  3178	=

  3179		if (info->flags & SPI_NOR_4BIT_BP) {
  3180			nor->flags |=3D SNOR_F_HAS_4BIT_BP;
  3181			if (info->flags & SPI_NOR_BP3_SR_BIT6)
  3182				nor->flags |=3D SNOR_F_HAS_SR_BP3_BIT6;
  3183		}
  3184	=

  3185		if (info->flags & SPI_NOR_NO_ERASE)
  3186			mtd->flags |=3D MTD_NO_ERASE;
  3187	=

  3188		mtd->dev.parent =3D dev;
  3189		nor->page_size =3D nor->params->page_size;
  3190		mtd->writebufsize =3D nor->page_size;
  3191	=

  3192		if (of_property_read_bool(np, "broken-flash-reset"))
  3193			nor->flags |=3D SNOR_F_BROKEN_RESET;
  3194	=

  3195		/*
  3196		 * Configure the SPI memory:
  3197		 * - select op codes for (Fast) Read, Page Program and Sector Erase.
  3198		 * - set the number of dummy cycles (mode cycles + wait states).
  3199		 * - set the SPI protocols for register and memory accesses.
  3200		 */
  3201		ret =3D spi_nor_setup(nor, hwcaps);
  3202		if (ret)
  3203			return ret;
  3204	=

  3205		if (info->flags & SPI_NOR_4B_OPCODES)
  3206			nor->flags |=3D SNOR_F_4B_OPCODES;
  3207	=

  3208		ret =3D spi_nor_set_addr_width(nor);
  3209		if (ret)
  3210			return ret;
  3211	=

  3212		/* Send all the required SPI flash commands to initialize device */
  3213		ret =3D spi_nor_init(nor);
  3214		if (ret)
  3215			return ret;
  3216	=

  3217		dev_info(dev, "%s (%lld Kbytes)\n", info->name,
  3218				(long long)mtd->size >> 10);
  3219	=

  3220		dev_dbg(dev,
  3221			"mtd .name =3D %s, .size =3D 0x%llx (%lldMiB), "
  3222			".erasesize =3D 0x%.8x (%uKiB) .numeraseregions =3D %d\n",
  3223			mtd->name, (long long)mtd->size, (long long)(mtd->size >> 20),
  3224			mtd->erasesize, mtd->erasesize / 1024, mtd->numeraseregions);
  3225	=

  3226		if (mtd->numeraseregions)
  3227			for (i =3D 0; i < mtd->numeraseregions; i++)
  3228				dev_dbg(dev,
  3229					"mtd.eraseregions[%d] =3D { .offset =3D 0x%llx, "
  3230					".erasesize =3D 0x%.8x (%uKiB), "
  3231					".numblocks =3D %d }\n",
  3232					i, (long long)mtd->eraseregions[i].offset,
  3233					mtd->eraseregions[i].erasesize,
  3234					mtd->eraseregions[i].erasesize / 1024,
  3235					mtd->eraseregions[i].numblocks);
  3236		return 0;
  3237	}
  3238	EXPORT_SYMBOL_GPL(spi_nor_scan);
  3239	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============7662739968091554658==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7662739968091554658==--

