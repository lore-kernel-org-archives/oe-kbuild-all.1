Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE8E627718
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Sep 2023 16:34:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695141247; x=1726677247;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=f7n3c4xIk3gK/W0qbT6LgGssHqXWSSgqS9J8CBalmkk=;
  b=Jh10o3lj4HBMympWcNVAxFxbrdcL0RazJbEkM8l1+KWRHqt9YuzfyC10
   6DAYs8NliF4iu9725RwhNeKDAQEcubGad38BQMGwZmDjN28JtUQLtpTKn
   uaScL+83BKkb5MHFKKGMDLDtrGMUYsDg1tjqIUNT3GGh2lADzH4H9g6x2
   nh8/2oiZnlJ7scbJL7ppdkjQ+wFm27YZGjmzEtMmjSHwFHOHjGYu9i/Cl
   by208HwNNVt+wiok9vj7K9F+66uuT/frtdHjQMkxiwqt58By88M3j+xaX
   DcyMWIUUIzdvEa1DpxHJEkXxHPyhFEgy04psMaSzwRdkwzoYVQGflu1j/
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="377304623"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="377304623"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2023 09:34:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="739786741"
X-IronPort-AV: E=Sophos;i="6.02,160,1688454000"; 
   d="scan'208";a="739786741"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 19 Sep 2023 09:33:59 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qidfg-0007ek-31;
	Tue, 19 Sep 2023 16:33:56 +0000
Date: Wed, 20 Sep 2023 00:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: Yun Zhou <yun.zhou@windriver.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@xilinx.com>
Subject: [xilinx-xlnx:pr/146 12313/14527] drivers/mtd/spi-nor/sfdp.c:924:12:
 warning: 'spi_nor_parse_4bait' defined but not used
Message-ID: <202309200001.658kpUTv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yun,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx pr/146
head:   38b0c0cf11566882cda99f8e4f2243924a684be5
commit: 190ba47825b71dd7abeca27b890f1dd5bd5eb781 [12313/14527] mtd: spi-nor: Don't parse 4BAIT via Zynq QSPI
config: x86_64-randconfig-001-20230905 (https://download.01.org/0day-ci/archive/20230920/202309200001.658kpUTv-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309200001.658kpUTv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309200001.658kpUTv-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/sfdp.c:924:12: warning: 'spi_nor_parse_4bait' defined but not used [-Wunused-function]
     924 | static int spi_nor_parse_4bait(struct spi_nor *nor,
         |            ^~~~~~~~~~~~~~~~~~~


vim +/spi_nor_parse_4bait +924 drivers/mtd/spi-nor/sfdp.c

cb481b92d10fdb Tudor Ambarus 2020-03-13   914  
cb481b92d10fdb Tudor Ambarus 2020-03-13   915  /**
cb481b92d10fdb Tudor Ambarus 2020-03-13   916   * spi_nor_parse_4bait() - parse the 4-Byte Address Instruction Table
cb481b92d10fdb Tudor Ambarus 2020-03-13   917   * @nor:		pointer to a 'struct spi_nor'.
cb481b92d10fdb Tudor Ambarus 2020-03-13   918   * @param_header:	pointer to the 'struct sfdp_parameter_header' describing
cb481b92d10fdb Tudor Ambarus 2020-03-13   919   *			the 4-Byte Address Instruction Table length and version.
cb481b92d10fdb Tudor Ambarus 2020-03-13   920   * @params:		pointer to the 'struct spi_nor_flash_parameter' to be.
cb481b92d10fdb Tudor Ambarus 2020-03-13   921   *
cb481b92d10fdb Tudor Ambarus 2020-03-13   922   * Return: 0 on success, -errno otherwise.
cb481b92d10fdb Tudor Ambarus 2020-03-13   923   */
cb481b92d10fdb Tudor Ambarus 2020-03-13  @924  static int spi_nor_parse_4bait(struct spi_nor *nor,
cb481b92d10fdb Tudor Ambarus 2020-03-13   925  			       const struct sfdp_parameter_header *param_header,
cb481b92d10fdb Tudor Ambarus 2020-03-13   926  			       struct spi_nor_flash_parameter *params)
cb481b92d10fdb Tudor Ambarus 2020-03-13   927  {
cb481b92d10fdb Tudor Ambarus 2020-03-13   928  	static const struct sfdp_4bait reads[] = {
cb481b92d10fdb Tudor Ambarus 2020-03-13   929  		{ SNOR_HWCAPS_READ,		BIT(0) },
cb481b92d10fdb Tudor Ambarus 2020-03-13   930  		{ SNOR_HWCAPS_READ_FAST,	BIT(1) },
cb481b92d10fdb Tudor Ambarus 2020-03-13   931  		{ SNOR_HWCAPS_READ_1_1_2,	BIT(2) },
cb481b92d10fdb Tudor Ambarus 2020-03-13   932  		{ SNOR_HWCAPS_READ_1_2_2,	BIT(3) },
cb481b92d10fdb Tudor Ambarus 2020-03-13   933  		{ SNOR_HWCAPS_READ_1_1_4,	BIT(4) },
cb481b92d10fdb Tudor Ambarus 2020-03-13   934  		{ SNOR_HWCAPS_READ_1_4_4,	BIT(5) },
cb481b92d10fdb Tudor Ambarus 2020-03-13   935  		{ SNOR_HWCAPS_READ_1_1_1_DTR,	BIT(13) },
cb481b92d10fdb Tudor Ambarus 2020-03-13   936  		{ SNOR_HWCAPS_READ_1_2_2_DTR,	BIT(14) },
cb481b92d10fdb Tudor Ambarus 2020-03-13   937  		{ SNOR_HWCAPS_READ_1_4_4_DTR,	BIT(15) },
cb481b92d10fdb Tudor Ambarus 2020-03-13   938  	};
cb481b92d10fdb Tudor Ambarus 2020-03-13   939  	static const struct sfdp_4bait programs[] = {
cb481b92d10fdb Tudor Ambarus 2020-03-13   940  		{ SNOR_HWCAPS_PP,		BIT(6) },
cb481b92d10fdb Tudor Ambarus 2020-03-13   941  		{ SNOR_HWCAPS_PP_1_1_4,		BIT(7) },
cb481b92d10fdb Tudor Ambarus 2020-03-13   942  		{ SNOR_HWCAPS_PP_1_4_4,		BIT(8) },
cb481b92d10fdb Tudor Ambarus 2020-03-13   943  	};
cb481b92d10fdb Tudor Ambarus 2020-03-13   944  	static const struct sfdp_4bait erases[SNOR_ERASE_TYPE_MAX] = {
cb481b92d10fdb Tudor Ambarus 2020-03-13   945  		{ 0u /* not used */,		BIT(9) },
cb481b92d10fdb Tudor Ambarus 2020-03-13   946  		{ 0u /* not used */,		BIT(10) },
cb481b92d10fdb Tudor Ambarus 2020-03-13   947  		{ 0u /* not used */,		BIT(11) },
cb481b92d10fdb Tudor Ambarus 2020-03-13   948  		{ 0u /* not used */,		BIT(12) },
cb481b92d10fdb Tudor Ambarus 2020-03-13   949  	};
cb481b92d10fdb Tudor Ambarus 2020-03-13   950  	struct spi_nor_pp_command *params_pp = params->page_programs;
cb481b92d10fdb Tudor Ambarus 2020-03-13   951  	struct spi_nor_erase_map *map = &params->erase_map;
cb481b92d10fdb Tudor Ambarus 2020-03-13   952  	struct spi_nor_erase_type *erase_type = map->erase_type;
cb481b92d10fdb Tudor Ambarus 2020-03-13   953  	u32 *dwords;
cb481b92d10fdb Tudor Ambarus 2020-03-13   954  	size_t len;
cb481b92d10fdb Tudor Ambarus 2020-03-13   955  	u32 addr, discard_hwcaps, read_hwcaps, pp_hwcaps, erase_mask;
cb481b92d10fdb Tudor Ambarus 2020-03-13   956  	int i, ret;
cb481b92d10fdb Tudor Ambarus 2020-03-13   957  
cb481b92d10fdb Tudor Ambarus 2020-03-13   958  	if (param_header->major != SFDP_JESD216_MAJOR ||
cb481b92d10fdb Tudor Ambarus 2020-03-13   959  	    param_header->length < SFDP_4BAIT_DWORD_MAX)
cb481b92d10fdb Tudor Ambarus 2020-03-13   960  		return -EINVAL;
cb481b92d10fdb Tudor Ambarus 2020-03-13   961  
cb481b92d10fdb Tudor Ambarus 2020-03-13   962  	/* Read the 4-byte Address Instruction Table. */
cb481b92d10fdb Tudor Ambarus 2020-03-13   963  	len = sizeof(*dwords) * SFDP_4BAIT_DWORD_MAX;
cb481b92d10fdb Tudor Ambarus 2020-03-13   964  
cb481b92d10fdb Tudor Ambarus 2020-03-13   965  	/* Use a kmalloc'ed bounce buffer to guarantee it is DMA-able. */
cb481b92d10fdb Tudor Ambarus 2020-03-13   966  	dwords = kmalloc(len, GFP_KERNEL);
cb481b92d10fdb Tudor Ambarus 2020-03-13   967  	if (!dwords)
cb481b92d10fdb Tudor Ambarus 2020-03-13   968  		return -ENOMEM;
cb481b92d10fdb Tudor Ambarus 2020-03-13   969  
cb481b92d10fdb Tudor Ambarus 2020-03-13   970  	addr = SFDP_PARAM_HEADER_PTP(param_header);
cb481b92d10fdb Tudor Ambarus 2020-03-13   971  	ret = spi_nor_read_sfdp(nor, addr, len, dwords);
cb481b92d10fdb Tudor Ambarus 2020-03-13   972  	if (ret)
cb481b92d10fdb Tudor Ambarus 2020-03-13   973  		goto out;
cb481b92d10fdb Tudor Ambarus 2020-03-13   974  
cb481b92d10fdb Tudor Ambarus 2020-03-13   975  	/* Fix endianness of the 4BAIT DWORDs. */
cb481b92d10fdb Tudor Ambarus 2020-03-13   976  	le32_to_cpu_array(dwords, SFDP_4BAIT_DWORD_MAX);
cb481b92d10fdb Tudor Ambarus 2020-03-13   977  
cb481b92d10fdb Tudor Ambarus 2020-03-13   978  	/*
cb481b92d10fdb Tudor Ambarus 2020-03-13   979  	 * Compute the subset of (Fast) Read commands for which the 4-byte
cb481b92d10fdb Tudor Ambarus 2020-03-13   980  	 * version is supported.
cb481b92d10fdb Tudor Ambarus 2020-03-13   981  	 */
cb481b92d10fdb Tudor Ambarus 2020-03-13   982  	discard_hwcaps = 0;
cb481b92d10fdb Tudor Ambarus 2020-03-13   983  	read_hwcaps = 0;
cb481b92d10fdb Tudor Ambarus 2020-03-13   984  	for (i = 0; i < ARRAY_SIZE(reads); i++) {
cb481b92d10fdb Tudor Ambarus 2020-03-13   985  		const struct sfdp_4bait *read = &reads[i];
cb481b92d10fdb Tudor Ambarus 2020-03-13   986  
cb481b92d10fdb Tudor Ambarus 2020-03-13   987  		discard_hwcaps |= read->hwcaps;
cb481b92d10fdb Tudor Ambarus 2020-03-13   988  		if ((params->hwcaps.mask & read->hwcaps) &&
cb481b92d10fdb Tudor Ambarus 2020-03-13   989  		    (dwords[0] & read->supported_bit))
cb481b92d10fdb Tudor Ambarus 2020-03-13   990  			read_hwcaps |= read->hwcaps;
cb481b92d10fdb Tudor Ambarus 2020-03-13   991  	}
cb481b92d10fdb Tudor Ambarus 2020-03-13   992  
cb481b92d10fdb Tudor Ambarus 2020-03-13   993  	/*
cb481b92d10fdb Tudor Ambarus 2020-03-13   994  	 * Compute the subset of Page Program commands for which the 4-byte
cb481b92d10fdb Tudor Ambarus 2020-03-13   995  	 * version is supported.
cb481b92d10fdb Tudor Ambarus 2020-03-13   996  	 */
cb481b92d10fdb Tudor Ambarus 2020-03-13   997  	pp_hwcaps = 0;
cb481b92d10fdb Tudor Ambarus 2020-03-13   998  	for (i = 0; i < ARRAY_SIZE(programs); i++) {
cb481b92d10fdb Tudor Ambarus 2020-03-13   999  		const struct sfdp_4bait *program = &programs[i];
cb481b92d10fdb Tudor Ambarus 2020-03-13  1000  
cb481b92d10fdb Tudor Ambarus 2020-03-13  1001  		/*
cb481b92d10fdb Tudor Ambarus 2020-03-13  1002  		 * The 4 Byte Address Instruction (Optional) Table is the only
cb481b92d10fdb Tudor Ambarus 2020-03-13  1003  		 * SFDP table that indicates support for Page Program Commands.
cb481b92d10fdb Tudor Ambarus 2020-03-13  1004  		 * Bypass the params->hwcaps.mask and consider 4BAIT the biggest
cb481b92d10fdb Tudor Ambarus 2020-03-13  1005  		 * authority for specifying Page Program support.
cb481b92d10fdb Tudor Ambarus 2020-03-13  1006  		 */
cb481b92d10fdb Tudor Ambarus 2020-03-13  1007  		discard_hwcaps |= program->hwcaps;
cb481b92d10fdb Tudor Ambarus 2020-03-13  1008  		if (dwords[0] & program->supported_bit)
cb481b92d10fdb Tudor Ambarus 2020-03-13  1009  			pp_hwcaps |= program->hwcaps;
cb481b92d10fdb Tudor Ambarus 2020-03-13  1010  	}
cb481b92d10fdb Tudor Ambarus 2020-03-13  1011  
cb481b92d10fdb Tudor Ambarus 2020-03-13  1012  	/*
cb481b92d10fdb Tudor Ambarus 2020-03-13  1013  	 * Compute the subset of Sector Erase commands for which the 4-byte
cb481b92d10fdb Tudor Ambarus 2020-03-13  1014  	 * version is supported.
cb481b92d10fdb Tudor Ambarus 2020-03-13  1015  	 */
cb481b92d10fdb Tudor Ambarus 2020-03-13  1016  	erase_mask = 0;
cb481b92d10fdb Tudor Ambarus 2020-03-13  1017  	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
cb481b92d10fdb Tudor Ambarus 2020-03-13  1018  		const struct sfdp_4bait *erase = &erases[i];
cb481b92d10fdb Tudor Ambarus 2020-03-13  1019  
cb481b92d10fdb Tudor Ambarus 2020-03-13  1020  		if (dwords[0] & erase->supported_bit)
cb481b92d10fdb Tudor Ambarus 2020-03-13  1021  			erase_mask |= BIT(i);
cb481b92d10fdb Tudor Ambarus 2020-03-13  1022  	}
cb481b92d10fdb Tudor Ambarus 2020-03-13  1023  
cb481b92d10fdb Tudor Ambarus 2020-03-13  1024  	/* Replicate the sort done for the map's erase types in BFPT. */
cb481b92d10fdb Tudor Ambarus 2020-03-13  1025  	erase_mask = spi_nor_sort_erase_mask(map, erase_mask);
cb481b92d10fdb Tudor Ambarus 2020-03-13  1026  
cb481b92d10fdb Tudor Ambarus 2020-03-13  1027  	/*
cb481b92d10fdb Tudor Ambarus 2020-03-13  1028  	 * We need at least one 4-byte op code per read, program and erase
cb481b92d10fdb Tudor Ambarus 2020-03-13  1029  	 * operation; the .read(), .write() and .erase() hooks share the
cb481b92d10fdb Tudor Ambarus 2020-03-13  1030  	 * nor->addr_width value.
cb481b92d10fdb Tudor Ambarus 2020-03-13  1031  	 */
cb481b92d10fdb Tudor Ambarus 2020-03-13  1032  	if (!read_hwcaps || !pp_hwcaps || !erase_mask)
cb481b92d10fdb Tudor Ambarus 2020-03-13  1033  		goto out;
cb481b92d10fdb Tudor Ambarus 2020-03-13  1034  
cb481b92d10fdb Tudor Ambarus 2020-03-13  1035  	/*
cb481b92d10fdb Tudor Ambarus 2020-03-13  1036  	 * Discard all operations from the 4-byte instruction set which are
cb481b92d10fdb Tudor Ambarus 2020-03-13  1037  	 * not supported by this memory.
cb481b92d10fdb Tudor Ambarus 2020-03-13  1038  	 */
cb481b92d10fdb Tudor Ambarus 2020-03-13  1039  	params->hwcaps.mask &= ~discard_hwcaps;
cb481b92d10fdb Tudor Ambarus 2020-03-13  1040  	params->hwcaps.mask |= (read_hwcaps | pp_hwcaps);
cb481b92d10fdb Tudor Ambarus 2020-03-13  1041  
cb481b92d10fdb Tudor Ambarus 2020-03-13  1042  	/* Use the 4-byte address instruction set. */
cb481b92d10fdb Tudor Ambarus 2020-03-13  1043  	for (i = 0; i < SNOR_CMD_READ_MAX; i++) {
cb481b92d10fdb Tudor Ambarus 2020-03-13  1044  		struct spi_nor_read_command *read_cmd = &params->reads[i];
cb481b92d10fdb Tudor Ambarus 2020-03-13  1045  
cb481b92d10fdb Tudor Ambarus 2020-03-13  1046  		read_cmd->opcode = spi_nor_convert_3to4_read(read_cmd->opcode);
cb481b92d10fdb Tudor Ambarus 2020-03-13  1047  	}
cb481b92d10fdb Tudor Ambarus 2020-03-13  1048  
cb481b92d10fdb Tudor Ambarus 2020-03-13  1049  	/* 4BAIT is the only SFDP table that indicates page program support. */
cb481b92d10fdb Tudor Ambarus 2020-03-13  1050  	if (pp_hwcaps & SNOR_HWCAPS_PP)
cb481b92d10fdb Tudor Ambarus 2020-03-13  1051  		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP],
cb481b92d10fdb Tudor Ambarus 2020-03-13  1052  					SPINOR_OP_PP_4B, SNOR_PROTO_1_1_1);
cb481b92d10fdb Tudor Ambarus 2020-03-13  1053  	if (pp_hwcaps & SNOR_HWCAPS_PP_1_1_4)
cb481b92d10fdb Tudor Ambarus 2020-03-13  1054  		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_1_4],
cb481b92d10fdb Tudor Ambarus 2020-03-13  1055  					SPINOR_OP_PP_1_1_4_4B,
cb481b92d10fdb Tudor Ambarus 2020-03-13  1056  					SNOR_PROTO_1_1_4);
cb481b92d10fdb Tudor Ambarus 2020-03-13  1057  	if (pp_hwcaps & SNOR_HWCAPS_PP_1_4_4)
cb481b92d10fdb Tudor Ambarus 2020-03-13  1058  		spi_nor_set_pp_settings(&params_pp[SNOR_CMD_PP_1_4_4],
cb481b92d10fdb Tudor Ambarus 2020-03-13  1059  					SPINOR_OP_PP_1_4_4_4B,
cb481b92d10fdb Tudor Ambarus 2020-03-13  1060  					SNOR_PROTO_1_4_4);
cb481b92d10fdb Tudor Ambarus 2020-03-13  1061  
cb481b92d10fdb Tudor Ambarus 2020-03-13  1062  	for (i = 0; i < SNOR_ERASE_TYPE_MAX; i++) {
cb481b92d10fdb Tudor Ambarus 2020-03-13  1063  		if (erase_mask & BIT(i))
cb481b92d10fdb Tudor Ambarus 2020-03-13  1064  			erase_type[i].opcode = (dwords[1] >>
cb481b92d10fdb Tudor Ambarus 2020-03-13  1065  						erase_type[i].idx * 8) & 0xFF;
cb481b92d10fdb Tudor Ambarus 2020-03-13  1066  		else
cb481b92d10fdb Tudor Ambarus 2020-03-13  1067  			spi_nor_set_erase_type(&erase_type[i], 0u, 0xFF);
cb481b92d10fdb Tudor Ambarus 2020-03-13  1068  	}
cb481b92d10fdb Tudor Ambarus 2020-03-13  1069  
cb481b92d10fdb Tudor Ambarus 2020-03-13  1070  	/*
cb481b92d10fdb Tudor Ambarus 2020-03-13  1071  	 * We set SNOR_F_HAS_4BAIT in order to skip spi_nor_set_4byte_opcodes()
cb481b92d10fdb Tudor Ambarus 2020-03-13  1072  	 * later because we already did the conversion to 4byte opcodes. Also,
cb481b92d10fdb Tudor Ambarus 2020-03-13  1073  	 * this latest function implements a legacy quirk for the erase size of
cb481b92d10fdb Tudor Ambarus 2020-03-13  1074  	 * Spansion memory. However this quirk is no longer needed with new
cb481b92d10fdb Tudor Ambarus 2020-03-13  1075  	 * SFDP compliant memories.
cb481b92d10fdb Tudor Ambarus 2020-03-13  1076  	 */
cb481b92d10fdb Tudor Ambarus 2020-03-13  1077  	nor->addr_width = 4;
cb481b92d10fdb Tudor Ambarus 2020-03-13  1078  	nor->flags |= SNOR_F_4B_OPCODES | SNOR_F_HAS_4BAIT;
cb481b92d10fdb Tudor Ambarus 2020-03-13  1079  
cb481b92d10fdb Tudor Ambarus 2020-03-13  1080  	/* fall through */
cb481b92d10fdb Tudor Ambarus 2020-03-13  1081  out:
cb481b92d10fdb Tudor Ambarus 2020-03-13  1082  	kfree(dwords);
cb481b92d10fdb Tudor Ambarus 2020-03-13  1083  	return ret;
cb481b92d10fdb Tudor Ambarus 2020-03-13  1084  }
cb481b92d10fdb Tudor Ambarus 2020-03-13  1085  

:::::: The code at line 924 was first introduced by commit
:::::: cb481b92d10fdb0027c7f96576b640c28a5e4179 mtd: spi-nor: Move SFDP logic out of the core

:::::: TO: Tudor Ambarus <tudor.ambarus@microchip.com>
:::::: CC: Tudor Ambarus <tudor.ambarus@microchip.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
