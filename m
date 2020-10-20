Content-Type: multipart/mixed; boundary="===============6386809592781841101=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [ti:ti-rt-linux-5.4.y 9600/11346] drivers/mtd/spi-nor/spi-nor.c:5721:18: error: implicit declaration of function 'of_read_number'
Date: Wed, 21 Oct 2020 07:29:42 +0800
Message-ID: <202010210739.tVhBbRw1-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6386809592781841101==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Pratyush,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.=
4.y
head:   0343656e0feca050ec3f6a0a47fc65018d5a7fd1
commit: 6f9db649f76819bbe6b9ee1a7758717d0f2e01ee [9600/11346] HACK: mtd: sp=
i-nor: Look for PHY pattern partition
config: m68k-randconfig-r001-20201020 (attached as .config)
compiler: m68k-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.=
git
        git fetch --no-tags ti ti-rt-linux-5.4.y
        git checkout 6f9db649f76819bbe6b9ee1a7758717d0f2e01ee
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dm68k =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/page.h:47,
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
                    from drivers/mtd/spi-nor/spi-nor.c:13:
   drivers/mtd/spi-nor/spi-nor.c: In function 'spi_nor_spimem_xfer_data':
   arch/m68k/include/asm/page_mm.h:169:49: warning: ordered comparison of p=
ointer with null pointer [-Wextra]
     169 | #define virt_addr_valid(kaddr) ((void *)(kaddr) >=3D (void *)PAG=
E_OFFSET && (void *)(kaddr) < high_memory)
         |                                                 ^~
   drivers/mtd/spi-nor/spi-nor.c:389:34: note: in expansion of macro 'virt_=
addr_valid'
     389 |  if (object_is_on_stack(buf) || !virt_addr_valid(buf))
         |                                  ^~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/spi-nor.c: In function 'spi_nor_scan':
>> drivers/mtd/spi-nor/spi-nor.c:5721:18: error: implicit declaration of fu=
nction 'of_read_number' [-Werror=3Dimplicit-function-declaration]
    5721 |    op.addr.val =3D of_read_number(reg, a_cells);
         |                  ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors

vim +/of_read_number +5721 drivers/mtd/spi-nor/spi-nor.c

  5556	=

  5557	int spi_nor_scan(struct spi_nor *nor, const char *name,
  5558			 const struct spi_nor_hwcaps *hwcaps)
  5559	{
  5560		const struct flash_info *info;
  5561		struct device *dev =3D nor->dev;
  5562		struct mtd_info *mtd =3D &nor->mtd;
  5563		struct device_node *np =3D spi_nor_get_flash_node(nor);
  5564		struct device_node *child;
  5565		struct spi_nor_flash_parameter *params =3D &nor->params;
  5566		struct spi_mem_op op;
  5567		int ret;
  5568		int i;
  5569	=

  5570		ret =3D spi_nor_check(nor);
  5571		if (ret)
  5572			return ret;
  5573	=

  5574		/* Reset SPI protocol for all commands. */
  5575		nor->reg_proto =3D SNOR_PROTO_1_1_1;
  5576		nor->read_proto =3D SNOR_PROTO_1_1_1;
  5577		nor->write_proto =3D SNOR_PROTO_1_1_1;
  5578	=

  5579		/*
  5580		 * We need the bounce buffer early to read/write registers when goi=
ng
  5581		 * through the spi-mem layer (buffers have to be DMA-able).
  5582		 * For spi-mem drivers, we'll reallocate a new buffer if
  5583		 * nor->page_size turns out to be greater than PAGE_SIZE (which
  5584		 * shouldn't happen before long since NOR pages are usually less
  5585		 * than 1KB) after spi_nor_scan() returns.
  5586		 */
  5587		nor->bouncebuf_size =3D PAGE_SIZE;
  5588		nor->bouncebuf =3D devm_kmalloc(dev, nor->bouncebuf_size,
  5589					      GFP_KERNEL);
  5590		if (!nor->bouncebuf)
  5591			return -ENOMEM;
  5592	=

  5593		info =3D spi_nor_get_flash_info(nor, name);
  5594		if (IS_ERR(info))
  5595			return PTR_ERR(info);
  5596	=

  5597		nor->info =3D info;
  5598	=

  5599		spi_nor_debugfs_init(nor, info);
  5600	=

  5601		mutex_init(&nor->lock);
  5602	=

  5603		/*
  5604		 * Make sure the XSR_RDY flag is set before calling
  5605		 * spi_nor_wait_till_ready(). Xilinx S3AN share MFR
  5606		 * with Atmel spi-nor
  5607		 */
  5608		if (info->flags & SPI_NOR_XSR_RDY)
  5609			nor->flags |=3D  SNOR_F_READY_XSR_RDY;
  5610	=

  5611		if (info->flags & SPI_NOR_HAS_LOCK)
  5612			nor->flags |=3D SNOR_F_HAS_LOCK;
  5613	=

  5614		/*
  5615		 * Atmel, SST, Intel/Numonyx, and others serial NOR tend to power up
  5616		 * with the software protection bits set.
  5617		 */
  5618		if (JEDEC_MFR(nor->info) =3D=3D SNOR_MFR_ATMEL ||
  5619		    JEDEC_MFR(nor->info) =3D=3D SNOR_MFR_INTEL ||
  5620		    JEDEC_MFR(nor->info) =3D=3D SNOR_MFR_SST ||
  5621		    nor->info->flags & SPI_NOR_HAS_LOCK)
  5622			nor->clear_sr_bp =3D spi_nor_clear_sr_bp;
  5623	=

  5624		/* Init flash parameters based on flash_info struct and SFDP */
  5625		spi_nor_init_params(nor);
  5626	=

  5627		if (!mtd->name)
  5628			mtd->name =3D dev_name(dev);
  5629		mtd->priv =3D nor;
  5630		mtd->type =3D MTD_NORFLASH;
  5631		mtd->writesize =3D 1;
  5632		mtd->flags =3D MTD_CAP_NORFLASH;
  5633		mtd->size =3D params->size;
  5634		mtd->_erase =3D spi_nor_erase;
  5635		mtd->_read =3D spi_nor_read;
  5636		mtd->_suspend =3D spi_nor_suspend;
  5637		mtd->_resume =3D spi_nor_resume;
  5638	=

  5639		if (nor->params.locking_ops) {
  5640			mtd->_lock =3D spi_nor_lock;
  5641			mtd->_unlock =3D spi_nor_unlock;
  5642			mtd->_is_locked =3D spi_nor_is_locked;
  5643		}
  5644	=

  5645		/* sst nor chips use AAI word program */
  5646		if (info->flags & SST_WRITE)
  5647			mtd->_write =3D sst_write;
  5648		else
  5649			mtd->_write =3D spi_nor_write;
  5650	=

  5651		if (info->flags & USE_FSR)
  5652			nor->flags |=3D SNOR_F_USE_FSR;
  5653		if (info->flags & SPI_NOR_HAS_TB)
  5654			nor->flags |=3D SNOR_F_HAS_SR_TB;
  5655		if (info->flags & NO_CHIP_ERASE)
  5656			nor->flags |=3D SNOR_F_NO_OP_CHIP_ERASE;
  5657		if (info->flags & USE_CLSR)
  5658			nor->flags |=3D SNOR_F_USE_CLSR;
  5659	=

  5660		if (info->flags & SPI_NOR_NO_ERASE)
  5661			mtd->flags |=3D MTD_NO_ERASE;
  5662	=

  5663		mtd->dev.parent =3D dev;
  5664		nor->page_size =3D params->page_size;
  5665		mtd->writebufsize =3D nor->page_size;
  5666	=

  5667		if (of_property_read_bool(np, "broken-flash-reset"))
  5668			nor->flags |=3D SNOR_F_BROKEN_RESET;
  5669	=

  5670		/*
  5671		 * Configure the SPI memory:
  5672		 * - select op codes for (Fast) Read, Page Program and Sector Erase.
  5673		 * - set the number of dummy cycles (mode cycles + wait states).
  5674		 * - set the SPI protocols for register and memory accesses.
  5675		 */
  5676		ret =3D spi_nor_setup(nor, hwcaps);
  5677		if (ret)
  5678			return ret;
  5679	=

  5680		if (info->flags & SPI_NOR_4B_OPCODES)
  5681			nor->flags |=3D SNOR_F_4B_OPCODES;
  5682	=

  5683		ret =3D spi_nor_set_addr_width(nor);
  5684		if (ret)
  5685			return ret;
  5686	=

  5687		/* Send all the required SPI flash commands to initialize device */
  5688		ret =3D spi_nor_init(nor);
  5689		if (ret)
  5690			return ret;
  5691	=

  5692		/*
  5693		 * Find out if a PHY pattern partition is present.
  5694		 *
  5695		 * TODO: Teach the mtd core to find the partition for us so we don't
  5696		 * have to repeat the parsing logic here that mtd already has.
  5697		 */
  5698		child =3D NULL;
  5699		do {
  5700			int len;
  5701			char *label =3D NULL;
  5702	=

  5703			child =3D of_get_next_child(np, child);
  5704			if (child)
  5705				label =3D (char *)of_get_property(child, "label", &len);
  5706	=

  5707			if (label && !strcmp(label, "ospi.phypattern")) {
  5708				const __be32 *reg;
  5709				int a_cells, s_cells;
  5710	=

  5711				reg =3D of_get_property(child, "reg", &len);
  5712				if (!reg)
  5713					continue;
  5714	=

  5715				a_cells =3D of_n_addr_cells(child);
  5716				s_cells =3D of_n_size_cells(child);
  5717				if (len / 4 !=3D a_cells + s_cells)
  5718					continue;
  5719	=

  5720				op =3D spi_nor_spimem_read_op(nor);
> 5721				op.addr.val =3D of_read_number(reg, a_cells);
  5722				spi_mem_set_calibration_read_op(nor->spimem, &op);
  5723				break;
  5724			}
  5725		} while (child);
  5726	=

  5727		dev_info(dev, "%s (%lld Kbytes)\n", info->name,
  5728				(long long)mtd->size >> 10);
  5729	=

  5730		dev_dbg(dev,
  5731			"mtd .name =3D %s, .size =3D 0x%llx (%lldMiB), "
  5732			".erasesize =3D 0x%.8x (%uKiB) .numeraseregions =3D %d\n",
  5733			mtd->name, (long long)mtd->size, (long long)(mtd->size >> 20),
  5734			mtd->erasesize, mtd->erasesize / 1024, mtd->numeraseregions);
  5735	=

  5736		if (mtd->numeraseregions)
  5737			for (i =3D 0; i < mtd->numeraseregions; i++)
  5738				dev_dbg(dev,
  5739					"mtd.eraseregions[%d] =3D { .offset =3D 0x%llx, "
  5740					".erasesize =3D 0x%.8x (%uKiB), "
  5741					".numblocks =3D %d }\n",
  5742					i, (long long)mtd->eraseregions[i].offset,
  5743					mtd->eraseregions[i].erasesize,
  5744					mtd->eraseregions[i].erasesize / 1024,
  5745					mtd->eraseregions[i].numblocks);
  5746		return 0;
  5747	}
  5748	EXPORT_SYMBOL_GPL(spi_nor_scan);
  5749	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============6386809592781841101==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============6386809592781841101==--

