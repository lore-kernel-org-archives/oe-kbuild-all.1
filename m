Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F29F98801
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 07:23:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695194624; x=1726730624;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R+C3Qh6xu4ERPjnUPabYFIAJ3Lw7VpSgW5J7X2YeP08=;
  b=ZRTu1cV/Vnjyi6IjYOPKt7aQibL3TAMmJ9Ycrqd+F68LVccNc4C6PyLV
   sQKx2Lzc5sBo613piyrWcZmTRbVJLwkK6SLdGXIq4ovjOaVfE0rjQ2k18
   d4yl1i2Y59Ed1mtFReUGeG15I4qgWriMsL3u2gzvTI466TxeEEUiOgBtw
   OLyYclx2RG9MNmDbbk2JHZbAEmd5Rl+Y6YoAC7hV19oExrPg0yae4m/WM
   SATBZuA1qFZBzqd52o9fqfILzQPZdkpn+NVOj02DKP36y7tZl6WFHbsnI
   rXXBP6LAiTVm2W3Lx7/pdxLbFt25BD8zPJKrJgHmArhZWk9a3G1tVGJQA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="380049529"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="380049529"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 00:23:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="920171845"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="920171845"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 20 Sep 2023 00:23:34 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qirYZ-0008RY-3B;
	Wed, 20 Sep 2023 07:23:31 +0000
Date: Wed, 20 Sep 2023 15:23:23 +0800
From: kernel test robot <lkp@intel.com>
To: Yun Zhou <yun.zhou@windriver.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
	Michal Simek <monstr@monstr.eu>,
	Amit Kumar Mahapatra <amit.kumar-mahapatra@amd.com>
Subject: [xilinx-xlnx:xlnx_rebase_v6.1_LTS 736/1363]
 drivers/mtd/spi-nor/sfdp.c:1206:12: warning: 'spi_nor_parse_sccr' defined
 but not used
Message-ID: <202309201506.10r0YmWL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.1_LTS
head:   4f412ed20fd2c5353c1e878ef9ed77952a5040a1
commit: dc2415e2e9dfa89252ea0ecceaa605cbbf903af4 [736/1363] mtd: spi-nor: Don't parse 4BAIT via Zynq QSPI
config: x86_64-buildonly-randconfig-005-20230920 (https://download.01.org/0day-ci/archive/20230920/202309201506.10r0YmWL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201506.10r0YmWL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201506.10r0YmWL-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/sfdp.c:1206:12: warning: 'spi_nor_parse_sccr' defined but not used [-Wunused-function]
    1206 | static int spi_nor_parse_sccr(struct spi_nor *nor,
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/sfdp.c:1128:12: warning: 'spi_nor_parse_profile1' defined but not used [-Wunused-function]
    1128 | static int spi_nor_parse_profile1(struct spi_nor *nor,
         |            ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/sfdp.c:943:12: warning: 'spi_nor_parse_4bait' defined but not used [-Wunused-function]
     943 | static int spi_nor_parse_4bait(struct spi_nor *nor,
         |            ^~~~~~~~~~~~~~~~~~~


vim +/spi_nor_parse_sccr +1206 drivers/mtd/spi-nor/sfdp.c

fb27f198971a68 Pratyush Yadav 2020-10-05  1119  
fb27f198971a68 Pratyush Yadav 2020-10-05  1120  /**
fb27f198971a68 Pratyush Yadav 2020-10-05  1121   * spi_nor_parse_profile1() - parse the xSPI Profile 1.0 table
fb27f198971a68 Pratyush Yadav 2020-10-05  1122   * @nor:		pointer to a 'struct spi_nor'
fb27f198971a68 Pratyush Yadav 2020-10-05  1123   * @profile1_header:	pointer to the 'struct sfdp_parameter_header' describing
fb27f198971a68 Pratyush Yadav 2020-10-05  1124   *			the Profile 1.0 Table length and version.
fb27f198971a68 Pratyush Yadav 2020-10-05  1125   *
fb27f198971a68 Pratyush Yadav 2020-10-05  1126   * Return: 0 on success, -errno otherwise.
fb27f198971a68 Pratyush Yadav 2020-10-05  1127   */
fb27f198971a68 Pratyush Yadav 2020-10-05 @1128  static int spi_nor_parse_profile1(struct spi_nor *nor,
a580293a19fc49 Tudor Ambarus  2021-03-06  1129  				  const struct sfdp_parameter_header *profile1_header)
fb27f198971a68 Pratyush Yadav 2020-10-05  1130  {
fb27f198971a68 Pratyush Yadav 2020-10-05  1131  	u32 *dwords, addr;
fb27f198971a68 Pratyush Yadav 2020-10-05  1132  	size_t len;
fb27f198971a68 Pratyush Yadav 2020-10-05  1133  	int ret;
fb27f198971a68 Pratyush Yadav 2020-10-05  1134  	u8 dummy, opcode;
fb27f198971a68 Pratyush Yadav 2020-10-05  1135  
fb27f198971a68 Pratyush Yadav 2020-10-05  1136  	len = profile1_header->length * sizeof(*dwords);
fb27f198971a68 Pratyush Yadav 2020-10-05  1137  	dwords = kmalloc(len, GFP_KERNEL);
fb27f198971a68 Pratyush Yadav 2020-10-05  1138  	if (!dwords)
fb27f198971a68 Pratyush Yadav 2020-10-05  1139  		return -ENOMEM;
fb27f198971a68 Pratyush Yadav 2020-10-05  1140  
fb27f198971a68 Pratyush Yadav 2020-10-05  1141  	addr = SFDP_PARAM_HEADER_PTP(profile1_header);
fb27f198971a68 Pratyush Yadav 2020-10-05  1142  	ret = spi_nor_read_sfdp(nor, addr, len, dwords);
fb27f198971a68 Pratyush Yadav 2020-10-05  1143  	if (ret)
fb27f198971a68 Pratyush Yadav 2020-10-05  1144  		goto out;
fb27f198971a68 Pratyush Yadav 2020-10-05  1145  
fb27f198971a68 Pratyush Yadav 2020-10-05  1146  	le32_to_cpu_array(dwords, profile1_header->length);
fb27f198971a68 Pratyush Yadav 2020-10-05  1147  
fb27f198971a68 Pratyush Yadav 2020-10-05  1148  	/* Get 8D-8D-8D fast read opcode and dummy cycles. */
fb27f198971a68 Pratyush Yadav 2020-10-05  1149  	opcode = FIELD_GET(PROFILE1_DWORD1_RD_FAST_CMD, dwords[0]);
fb27f198971a68 Pratyush Yadav 2020-10-05  1150  
fb27f198971a68 Pratyush Yadav 2020-10-05  1151  	 /* Set the Read Status Register dummy cycles and dummy address bytes. */
fb27f198971a68 Pratyush Yadav 2020-10-05  1152  	if (dwords[0] & PROFILE1_DWORD1_RDSR_DUMMY)
a580293a19fc49 Tudor Ambarus  2021-03-06  1153  		nor->params->rdsr_dummy = 8;
fb27f198971a68 Pratyush Yadav 2020-10-05  1154  	else
a580293a19fc49 Tudor Ambarus  2021-03-06  1155  		nor->params->rdsr_dummy = 4;
fb27f198971a68 Pratyush Yadav 2020-10-05  1156  
fb27f198971a68 Pratyush Yadav 2020-10-05  1157  	if (dwords[0] & PROFILE1_DWORD1_RDSR_ADDR_BYTES)
a580293a19fc49 Tudor Ambarus  2021-03-06  1158  		nor->params->rdsr_addr_nbytes = 4;
fb27f198971a68 Pratyush Yadav 2020-10-05  1159  	else
a580293a19fc49 Tudor Ambarus  2021-03-06  1160  		nor->params->rdsr_addr_nbytes = 0;
fb27f198971a68 Pratyush Yadav 2020-10-05  1161  
fb27f198971a68 Pratyush Yadav 2020-10-05  1162  	/*
fb27f198971a68 Pratyush Yadav 2020-10-05  1163  	 * We don't know what speed the controller is running at. Find the
fb27f198971a68 Pratyush Yadav 2020-10-05  1164  	 * dummy cycles for the fastest frequency the flash can run at to be
fb27f198971a68 Pratyush Yadav 2020-10-05  1165  	 * sure we are never short of dummy cycles. A value of 0 means the
fb27f198971a68 Pratyush Yadav 2020-10-05  1166  	 * frequency is not supported.
fb27f198971a68 Pratyush Yadav 2020-10-05  1167  	 *
fb27f198971a68 Pratyush Yadav 2020-10-05  1168  	 * Default to PROFILE1_DUMMY_DEFAULT if we don't find anything, and let
fb27f198971a68 Pratyush Yadav 2020-10-05  1169  	 * flashes set the correct value if needed in their fixup hooks.
fb27f198971a68 Pratyush Yadav 2020-10-05  1170  	 */
fb27f198971a68 Pratyush Yadav 2020-10-05  1171  	dummy = FIELD_GET(PROFILE1_DWORD4_DUMMY_200MHZ, dwords[3]);
fb27f198971a68 Pratyush Yadav 2020-10-05  1172  	if (!dummy)
fb27f198971a68 Pratyush Yadav 2020-10-05  1173  		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_166MHZ, dwords[4]);
fb27f198971a68 Pratyush Yadav 2020-10-05  1174  	if (!dummy)
fb27f198971a68 Pratyush Yadav 2020-10-05  1175  		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_133MHZ, dwords[4]);
fb27f198971a68 Pratyush Yadav 2020-10-05  1176  	if (!dummy)
fb27f198971a68 Pratyush Yadav 2020-10-05  1177  		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_100MHZ, dwords[4]);
fb27f198971a68 Pratyush Yadav 2020-10-05  1178  	if (!dummy)
fb27f198971a68 Pratyush Yadav 2020-10-05  1179  		dev_dbg(nor->dev,
fb27f198971a68 Pratyush Yadav 2020-10-05  1180  			"Can't find dummy cycles from Profile 1.0 table\n");
fb27f198971a68 Pratyush Yadav 2020-10-05  1181  
fb27f198971a68 Pratyush Yadav 2020-10-05  1182  	/* Round up to an even value to avoid tripping controllers up. */
fb27f198971a68 Pratyush Yadav 2020-10-05  1183  	dummy = round_up(dummy, 2);
fb27f198971a68 Pratyush Yadav 2020-10-05  1184  
fb27f198971a68 Pratyush Yadav 2020-10-05  1185  	/* Update the fast read settings. */
a580293a19fc49 Tudor Ambarus  2021-03-06  1186  	spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_8_8_8_DTR],
fb27f198971a68 Pratyush Yadav 2020-10-05  1187  				  0, dummy, opcode,
fb27f198971a68 Pratyush Yadav 2020-10-05  1188  				  SNOR_PROTO_8_8_8_DTR);
fb27f198971a68 Pratyush Yadav 2020-10-05  1189  
fb27f198971a68 Pratyush Yadav 2020-10-05  1190  out:
fb27f198971a68 Pratyush Yadav 2020-10-05  1191  	kfree(dwords);
fb27f198971a68 Pratyush Yadav 2020-10-05  1192  	return ret;
fb27f198971a68 Pratyush Yadav 2020-10-05  1193  }
fb27f198971a68 Pratyush Yadav 2020-10-05  1194  
981a8d60e01f7e Tudor Ambarus  2020-10-05  1195  #define SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE		BIT(31)
981a8d60e01f7e Tudor Ambarus  2020-10-05  1196  
981a8d60e01f7e Tudor Ambarus  2020-10-05  1197  /**
981a8d60e01f7e Tudor Ambarus  2020-10-05  1198   * spi_nor_parse_sccr() - Parse the Status, Control and Configuration Register
981a8d60e01f7e Tudor Ambarus  2020-10-05  1199   *                        Map.
981a8d60e01f7e Tudor Ambarus  2020-10-05  1200   * @nor:		pointer to a 'struct spi_nor'
981a8d60e01f7e Tudor Ambarus  2020-10-05  1201   * @sccr_header:	pointer to the 'struct sfdp_parameter_header' describing
981a8d60e01f7e Tudor Ambarus  2020-10-05  1202   *			the SCCR Map table length and version.
981a8d60e01f7e Tudor Ambarus  2020-10-05  1203   *
981a8d60e01f7e Tudor Ambarus  2020-10-05  1204   * Return: 0 on success, -errno otherwise.
981a8d60e01f7e Tudor Ambarus  2020-10-05  1205   */
981a8d60e01f7e Tudor Ambarus  2020-10-05 @1206  static int spi_nor_parse_sccr(struct spi_nor *nor,
a580293a19fc49 Tudor Ambarus  2021-03-06  1207  			      const struct sfdp_parameter_header *sccr_header)
981a8d60e01f7e Tudor Ambarus  2020-10-05  1208  {
981a8d60e01f7e Tudor Ambarus  2020-10-05  1209  	u32 *dwords, addr;
981a8d60e01f7e Tudor Ambarus  2020-10-05  1210  	size_t len;
981a8d60e01f7e Tudor Ambarus  2020-10-05  1211  	int ret;
981a8d60e01f7e Tudor Ambarus  2020-10-05  1212  
981a8d60e01f7e Tudor Ambarus  2020-10-05  1213  	len = sccr_header->length * sizeof(*dwords);
981a8d60e01f7e Tudor Ambarus  2020-10-05  1214  	dwords = kmalloc(len, GFP_KERNEL);
981a8d60e01f7e Tudor Ambarus  2020-10-05  1215  	if (!dwords)
981a8d60e01f7e Tudor Ambarus  2020-10-05  1216  		return -ENOMEM;
981a8d60e01f7e Tudor Ambarus  2020-10-05  1217  
981a8d60e01f7e Tudor Ambarus  2020-10-05  1218  	addr = SFDP_PARAM_HEADER_PTP(sccr_header);
981a8d60e01f7e Tudor Ambarus  2020-10-05  1219  	ret = spi_nor_read_sfdp(nor, addr, len, dwords);
981a8d60e01f7e Tudor Ambarus  2020-10-05  1220  	if (ret)
981a8d60e01f7e Tudor Ambarus  2020-10-05  1221  		goto out;
981a8d60e01f7e Tudor Ambarus  2020-10-05  1222  
981a8d60e01f7e Tudor Ambarus  2020-10-05  1223  	le32_to_cpu_array(dwords, sccr_header->length);
981a8d60e01f7e Tudor Ambarus  2020-10-05  1224  
981a8d60e01f7e Tudor Ambarus  2020-10-05  1225  	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[22]))
981a8d60e01f7e Tudor Ambarus  2020-10-05  1226  		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
981a8d60e01f7e Tudor Ambarus  2020-10-05  1227  
981a8d60e01f7e Tudor Ambarus  2020-10-05  1228  out:
981a8d60e01f7e Tudor Ambarus  2020-10-05  1229  	kfree(dwords);
981a8d60e01f7e Tudor Ambarus  2020-10-05  1230  	return ret;
981a8d60e01f7e Tudor Ambarus  2020-10-05  1231  }
981a8d60e01f7e Tudor Ambarus  2020-10-05  1232  

:::::: The code at line 1206 was first introduced by commit
:::::: 981a8d60e01f7e76d6bccb621598d087c9dd4a5d mtd: spi-nor: Parse SFDP SCCR Map

:::::: TO: Tudor Ambarus <tudor.ambarus@microchip.com>
:::::: CC: Vignesh Raghavendra <vigneshr@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
