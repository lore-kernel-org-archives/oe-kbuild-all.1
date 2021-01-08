Content-Type: multipart/mixed; boundary="===============4289274696070300434=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [ti:ti-rt-linux-5.4.y 9600/13037] drivers/mtd/spi-nor/spi-nor.c:5721:18: error: implicit declaration of function 'of_read_number'
Date: Fri, 08 Jan 2021 19:01:36 +0800
Message-ID: <202101081927.yGvWTybi-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4289274696070300434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Pratyush,

FYI, the error/warning still remains.

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-5.=
4.y
head:   cfa321c18ddfc08dc4f4417c93fe607dadd9cdee
commit: 6f9db649f76819bbe6b9ee1a7758717d0f2e01ee [9600/13037] HACK: mtd: sp=
i-nor: Look for PHY pattern partition
config: i386-randconfig-s002-20210108 (attached as .config)
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.3-208-g46a52ca4-dirty
        git remote add ti git://git.ti.com/ti-linux-kernel/ti-linux-kernel.=
git
        git fetch --no-tags ti ti-rt-linux-5.4.y
        git checkout 6f9db649f76819bbe6b9ee1a7758717d0f2e01ee
        # save the attached .config to linux build tree
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=
=3Di386 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

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

--===============4289274696070300434==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4289274696070300434==--

