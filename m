Content-Type: multipart/mixed; boundary="===============3187750427395563820=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [xlnx:master 475/491] drivers/mtd/nand/raw/nand_onfi.c:319:14: sparse: sparse: restricted __le16 degrades to integer
Date: Mon, 24 May 2021 22:37:49 +0800
Message-ID: <202105242244.4A4vgJJ0-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3187750427395563820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/Xilinx/linux-xlnx master
head:   5db91ec53100477ab552583e5629f91ac02f998e
commit: 031e063f87151e7afa025730a92ca5e77a269d78 [475/491] mtd: rawnand: Re=
trieve NV-DDR timing modes from the ONFI parameter page
config: powerpc64-randconfig-s031-20210524 (attached as .config)
compiler: powerpc64le-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.3-341-g8af24329-dirty
        # https://github.com/Xilinx/linux-xlnx/commit/031e063f87151e7afa025=
730a92ca5e77a269d78
        git remote add xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xlnx master
        git checkout 031e063f87151e7afa025730a92ca5e77a269d78
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=3D1 ARCH=3Dpowerpc64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> drivers/mtd/nand/raw/nand_onfi.c:319:14: sparse: sparse: restricted __le=
16 degrades to integer
   drivers/mtd/nand/raw/nand_onfi.c:321:26: sparse: sparse: cast to restric=
ted __le16

vim +319 drivers/mtd/nand/raw/nand_onfi.c

   140	=

   141	/*
   142	 * Check if the NAND chip is ONFI compliant, returns 1 if it is, 0 o=
therwise.
   143	 */
   144	int nand_onfi_detect(struct nand_chip *chip)
   145	{
   146		struct nand_device *base =3D &chip->base;
   147		struct mtd_info *mtd =3D nand_to_mtd(chip);
   148		struct nand_memory_organization *memorg;
   149		struct nand_onfi_params *p =3D NULL, *pbuf;
   150		struct onfi_params *onfi;
   151		bool use_datain =3D false;
   152		int onfi_version =3D 0;
   153		char id[4];
   154		int i, ret, val;
   155		u16 crc;
   156	=

   157		memorg =3D nanddev_get_memorg(&chip->base);
   158	=

   159		/* Try ONFI for unknown chip or LP */
   160		ret =3D nand_readid_op(chip, 0x20, id, sizeof(id));
   161		if (ret || strncmp(id, "ONFI", 4))
   162			return 0;
   163	=

   164		/* ONFI chip: allocate a buffer to hold its parameter page */
   165		pbuf =3D kzalloc((sizeof(*pbuf) * ONFI_PARAM_PAGES), GFP_KERNEL);
   166		if (!pbuf)
   167			return -ENOMEM;
   168	=

   169		if (!nand_has_exec_op(chip) ||
   170		    !nand_read_data_op(chip, &pbuf[0], sizeof(*pbuf), true, true))
   171			use_datain =3D true;
   172	=

   173		for (i =3D 0; i < ONFI_PARAM_PAGES; i++) {
   174			if (!i)
   175				ret =3D nand_read_param_page_op(chip, 0, &pbuf[i],
   176							      sizeof(*pbuf));
   177			else if (use_datain)
   178				ret =3D nand_read_data_op(chip, &pbuf[i], sizeof(*pbuf),
   179							true, false);
   180			else
   181				ret =3D nand_change_read_column_op(chip, sizeof(*pbuf) * i,
   182								 &pbuf[i], sizeof(*pbuf),
   183								 true);
   184			if (ret) {
   185				ret =3D 0;
   186				goto free_onfi_param_page;
   187			}
   188	=

   189			crc =3D onfi_crc16(ONFI_CRC_BASE, (u8 *)&pbuf[i], 254);
   190			if (crc =3D=3D le16_to_cpu(pbuf[i].crc)) {
   191				p =3D &pbuf[i];
   192				break;
   193			}
   194		}
   195	=

   196		if (i =3D=3D ONFI_PARAM_PAGES) {
   197			const void *srcbufs[ONFI_PARAM_PAGES];
   198			unsigned int j;
   199	=

   200			for (j =3D 0; j < ONFI_PARAM_PAGES; j++)
   201				srcbufs[j] =3D pbuf + j;
   202	=

   203			pr_warn("Could not find a valid ONFI parameter page, trying bit-wi=
se majority to recover it\n");
   204			nand_bit_wise_majority(srcbufs, ONFI_PARAM_PAGES, pbuf,
   205					       sizeof(*pbuf));
   206	=

   207			crc =3D onfi_crc16(ONFI_CRC_BASE, (u8 *)pbuf, 254);
   208			if (crc !=3D le16_to_cpu(pbuf->crc)) {
   209				pr_err("ONFI parameter recovery failed, aborting\n");
   210				goto free_onfi_param_page;
   211			}
   212			p =3D pbuf;
   213		}
   214	=

   215		if (chip->manufacturer.desc && chip->manufacturer.desc->ops &&
   216		    chip->manufacturer.desc->ops->fixup_onfi_param_page)
   217			chip->manufacturer.desc->ops->fixup_onfi_param_page(chip, p);
   218	=

   219		/* Check version */
   220		val =3D le16_to_cpu(p->revision);
   221		if (val & ONFI_VERSION_2_3)
   222			onfi_version =3D 23;
   223		else if (val & ONFI_VERSION_2_2)
   224			onfi_version =3D 22;
   225		else if (val & ONFI_VERSION_2_1)
   226			onfi_version =3D 21;
   227		else if (val & ONFI_VERSION_2_0)
   228			onfi_version =3D 20;
   229		else if (val & ONFI_VERSION_1_0)
   230			onfi_version =3D 10;
   231	=

   232		if (!onfi_version) {
   233			pr_info("unsupported ONFI version: %d\n", val);
   234			goto free_onfi_param_page;
   235		}
   236	=

   237		sanitize_string(p->manufacturer, sizeof(p->manufacturer));
   238		sanitize_string(p->model, sizeof(p->model));
   239		chip->parameters.model =3D kstrdup(p->model, GFP_KERNEL);
   240		if (!chip->parameters.model) {
   241			ret =3D -ENOMEM;
   242			goto free_onfi_param_page;
   243		}
   244	=

   245		memorg->pagesize =3D le32_to_cpu(p->byte_per_page);
   246		mtd->writesize =3D memorg->pagesize;
   247	=

   248		/*
   249		 * pages_per_block and blocks_per_lun may not be a power-of-2 size
   250		 * (don't ask me who thought of this...). MTD assumes that these
   251		 * dimensions will be power-of-2, so just truncate the remaining ar=
ea.
   252		 */
   253		memorg->pages_per_eraseblock =3D
   254				1 << (fls(le32_to_cpu(p->pages_per_block)) - 1);
   255		mtd->erasesize =3D memorg->pages_per_eraseblock * memorg->pagesize;
   256	=

   257		memorg->oobsize =3D le16_to_cpu(p->spare_bytes_per_page);
   258		mtd->oobsize =3D memorg->oobsize;
   259	=

   260		memorg->luns_per_target =3D p->lun_count;
   261		memorg->planes_per_lun =3D 1 << p->interleaved_bits;
   262	=

   263		/* See erasesize comment */
   264		memorg->eraseblocks_per_lun =3D
   265			1 << (fls(le32_to_cpu(p->blocks_per_lun)) - 1);
   266		memorg->max_bad_eraseblocks_per_lun =3D le32_to_cpu(p->blocks_per_l=
un);
   267		memorg->bits_per_cell =3D p->bits_per_cell;
   268	=

   269		if (le16_to_cpu(p->features) & ONFI_FEATURE_16_BIT_BUS)
   270			chip->options |=3D NAND_BUSWIDTH_16;
   271	=

   272		if (p->ecc_bits !=3D 0xff) {
   273			struct nand_ecc_props requirements =3D {
   274				.strength =3D p->ecc_bits,
   275				.step_size =3D 512,
   276			};
   277	=

   278			nanddev_set_ecc_requirements(base, &requirements);
   279		} else if (onfi_version >=3D 21 &&
   280			(le16_to_cpu(p->features) & ONFI_FEATURE_EXT_PARAM_PAGE)) {
   281	=

   282			/*
   283			 * The nand_flash_detect_ext_param_page() uses the
   284			 * Change Read Column command which maybe not supported
   285			 * by the chip->legacy.cmdfunc. So try to update the
   286			 * chip->legacy.cmdfunc now. We do not replace user supplied
   287			 * command function.
   288			 */
   289			nand_legacy_adjust_cmdfunc(chip);
   290	=

   291			/* The Extended Parameter Page is supported since ONFI 2.1. */
   292			if (nand_flash_detect_ext_param_page(chip, p))
   293				pr_warn("Failed to detect ONFI extended param page\n");
   294		} else {
   295			pr_warn("Could not retrieve ONFI ECC requirements\n");
   296		}
   297	=

   298		/* Save some parameters from the parameter page for future use */
   299		if (le16_to_cpu(p->opt_cmd) & ONFI_OPT_CMD_SET_GET_FEATURES) {
   300			chip->parameters.supports_set_get_features =3D true;
   301			bitmap_set(chip->parameters.get_feature_list,
   302				   ONFI_FEATURE_ADDR_TIMING_MODE, 1);
   303			bitmap_set(chip->parameters.set_feature_list,
   304				   ONFI_FEATURE_ADDR_TIMING_MODE, 1);
   305		}
   306	=

   307		onfi =3D kzalloc(sizeof(*onfi), GFP_KERNEL);
   308		if (!onfi) {
   309			ret =3D -ENOMEM;
   310			goto free_model;
   311		}
   312	=

   313		onfi->version =3D onfi_version;
   314		onfi->tPROG =3D le16_to_cpu(p->t_prog);
   315		onfi->tBERS =3D le16_to_cpu(p->t_bers);
   316		onfi->tR =3D le16_to_cpu(p->t_r);
   317		onfi->tCCS =3D le16_to_cpu(p->t_ccs);
   318		onfi->sdr_timing_modes =3D le16_to_cpu(p->sdr_timing_modes);
 > 319		if (p->features & ONFI_FEATURE_NV_DDR)

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3187750427395563820==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3187750427395563820==--

