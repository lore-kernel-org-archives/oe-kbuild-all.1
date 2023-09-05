Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 461D4378
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Sep 2023 16:54:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693932886; x=1725468886;
  h=date:from:cc:subject:message-id:mime-version;
  bh=KbxHU93YJMliTgEjYXLQGrF11j5/7HEQcM4gYXtFgEg=;
  b=NAqgCa/gZSls6Szia60ztA8uLt04rmjy0CwuhiiIrfzoi1p79ndNX/Ep
   zFcltwGGbeGlsdtX9mkBRRLkLLTZnr/r9Wu76KH9PbC4v2mg+ZMiM12PY
   k3/KcKacGt3pbg0Jj2qK6e2YOsaJ9ejGPeRu4mUnO3QDUAe0mGrB6+4+8
   kMz5hiht2yS5u/8JzVDicIdFUGWTdzQIQ6SKQztY1DJxNn++xnW4lZ5R1
   2ms9phzHOvcYwPsdOEZvljLFlRVioz1REPMZK8RB6YDIBMKdGVFq4QYSX
   Fld4XJw6ULvGsGXBBhJqHuH0HfIWgewZ65ogrdJ1d9PtexL5m42EtzpvX
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="407839048"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="407839048"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2023 09:54:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10824"; a="776255038"
X-IronPort-AV: E=Sophos;i="6.02,229,1688454000"; 
   d="scan'208";a="776255038"
Received: from lkp-server02.sh.intel.com (HELO e0b2ea88afd5) ([10.239.97.151])
  by orsmga001.jf.intel.com with ESMTP; 05 Sep 2023 09:54:39 -0700
Received: from kbuild by e0b2ea88afd5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qdZJR-0001ss-1n;
	Tue, 05 Sep 2023 16:54:36 +0000
Date: Wed, 6 Sep 2023 00:50:02 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Michal Simek <monstr@monstr.eu>
Subject: [pinchartl-media:muxed/2022.2/base 30/740]
 drivers/mtd/spi-nor/sfdp.c:1204:12: warning: 'spi_nor_parse_sccr' defined
 but not used
Message-ID: <202309060054.oP81Fw02-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://linuxtv.org/pinchartl/media.git muxed/2022.2/base
head:   e26621179c3b1834a1bb17e9a38e47238ac63bf5
commit: 9b62852ec04b7d48971ce8016b13c27403929908 [30/740] Merge tag 'v5.15' into master
config: x86_64-randconfig-001-20230905 (https://download.01.org/0day-ci/archive/20230906/202309060054.oP81Fw02-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230906/202309060054.oP81Fw02-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309060054.oP81Fw02-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/mtd/spi-nor/sfdp.c:1204:12: warning: 'spi_nor_parse_sccr' defined but not used [-Wunused-function]
    1204 | static int spi_nor_parse_sccr(struct spi_nor *nor,
         |            ^~~~~~~~~~~~~~~~~~
>> drivers/mtd/spi-nor/sfdp.c:1126:12: warning: 'spi_nor_parse_profile1' defined but not used [-Wunused-function]
    1126 | static int spi_nor_parse_profile1(struct spi_nor *nor,
         |            ^~~~~~~~~~~~~~~~~~~~~~
   drivers/mtd/spi-nor/sfdp.c:941:12: warning: 'spi_nor_parse_4bait' defined but not used [-Wunused-function]
     941 | static int spi_nor_parse_4bait(struct spi_nor *nor,
         |            ^~~~~~~~~~~~~~~~~~~


vim +/spi_nor_parse_sccr +1204 drivers/mtd/spi-nor/sfdp.c

fb27f198971a68f Pratyush Yadav 2020-10-05  1117  
fb27f198971a68f Pratyush Yadav 2020-10-05  1118  /**
fb27f198971a68f Pratyush Yadav 2020-10-05  1119   * spi_nor_parse_profile1() - parse the xSPI Profile 1.0 table
fb27f198971a68f Pratyush Yadav 2020-10-05  1120   * @nor:		pointer to a 'struct spi_nor'
fb27f198971a68f Pratyush Yadav 2020-10-05  1121   * @profile1_header:	pointer to the 'struct sfdp_parameter_header' describing
fb27f198971a68f Pratyush Yadav 2020-10-05  1122   *			the Profile 1.0 Table length and version.
fb27f198971a68f Pratyush Yadav 2020-10-05  1123   *
fb27f198971a68f Pratyush Yadav 2020-10-05  1124   * Return: 0 on success, -errno otherwise.
fb27f198971a68f Pratyush Yadav 2020-10-05  1125   */
fb27f198971a68f Pratyush Yadav 2020-10-05 @1126  static int spi_nor_parse_profile1(struct spi_nor *nor,
a580293a19fc49b Tudor Ambarus  2021-03-06  1127  				  const struct sfdp_parameter_header *profile1_header)
fb27f198971a68f Pratyush Yadav 2020-10-05  1128  {
fb27f198971a68f Pratyush Yadav 2020-10-05  1129  	u32 *dwords, addr;
fb27f198971a68f Pratyush Yadav 2020-10-05  1130  	size_t len;
fb27f198971a68f Pratyush Yadav 2020-10-05  1131  	int ret;
fb27f198971a68f Pratyush Yadav 2020-10-05  1132  	u8 dummy, opcode;
fb27f198971a68f Pratyush Yadav 2020-10-05  1133  
fb27f198971a68f Pratyush Yadav 2020-10-05  1134  	len = profile1_header->length * sizeof(*dwords);
fb27f198971a68f Pratyush Yadav 2020-10-05  1135  	dwords = kmalloc(len, GFP_KERNEL);
fb27f198971a68f Pratyush Yadav 2020-10-05  1136  	if (!dwords)
fb27f198971a68f Pratyush Yadav 2020-10-05  1137  		return -ENOMEM;
fb27f198971a68f Pratyush Yadav 2020-10-05  1138  
fb27f198971a68f Pratyush Yadav 2020-10-05  1139  	addr = SFDP_PARAM_HEADER_PTP(profile1_header);
fb27f198971a68f Pratyush Yadav 2020-10-05  1140  	ret = spi_nor_read_sfdp(nor, addr, len, dwords);
fb27f198971a68f Pratyush Yadav 2020-10-05  1141  	if (ret)
fb27f198971a68f Pratyush Yadav 2020-10-05  1142  		goto out;
fb27f198971a68f Pratyush Yadav 2020-10-05  1143  
fb27f198971a68f Pratyush Yadav 2020-10-05  1144  	le32_to_cpu_array(dwords, profile1_header->length);
fb27f198971a68f Pratyush Yadav 2020-10-05  1145  
fb27f198971a68f Pratyush Yadav 2020-10-05  1146  	/* Get 8D-8D-8D fast read opcode and dummy cycles. */
fb27f198971a68f Pratyush Yadav 2020-10-05  1147  	opcode = FIELD_GET(PROFILE1_DWORD1_RD_FAST_CMD, dwords[0]);
fb27f198971a68f Pratyush Yadav 2020-10-05  1148  
fb27f198971a68f Pratyush Yadav 2020-10-05  1149  	 /* Set the Read Status Register dummy cycles and dummy address bytes. */
fb27f198971a68f Pratyush Yadav 2020-10-05  1150  	if (dwords[0] & PROFILE1_DWORD1_RDSR_DUMMY)
a580293a19fc49b Tudor Ambarus  2021-03-06  1151  		nor->params->rdsr_dummy = 8;
fb27f198971a68f Pratyush Yadav 2020-10-05  1152  	else
a580293a19fc49b Tudor Ambarus  2021-03-06  1153  		nor->params->rdsr_dummy = 4;
fb27f198971a68f Pratyush Yadav 2020-10-05  1154  
fb27f198971a68f Pratyush Yadav 2020-10-05  1155  	if (dwords[0] & PROFILE1_DWORD1_RDSR_ADDR_BYTES)
a580293a19fc49b Tudor Ambarus  2021-03-06  1156  		nor->params->rdsr_addr_nbytes = 4;
fb27f198971a68f Pratyush Yadav 2020-10-05  1157  	else
a580293a19fc49b Tudor Ambarus  2021-03-06  1158  		nor->params->rdsr_addr_nbytes = 0;
fb27f198971a68f Pratyush Yadav 2020-10-05  1159  
fb27f198971a68f Pratyush Yadav 2020-10-05  1160  	/*
fb27f198971a68f Pratyush Yadav 2020-10-05  1161  	 * We don't know what speed the controller is running at. Find the
fb27f198971a68f Pratyush Yadav 2020-10-05  1162  	 * dummy cycles for the fastest frequency the flash can run at to be
fb27f198971a68f Pratyush Yadav 2020-10-05  1163  	 * sure we are never short of dummy cycles. A value of 0 means the
fb27f198971a68f Pratyush Yadav 2020-10-05  1164  	 * frequency is not supported.
fb27f198971a68f Pratyush Yadav 2020-10-05  1165  	 *
fb27f198971a68f Pratyush Yadav 2020-10-05  1166  	 * Default to PROFILE1_DUMMY_DEFAULT if we don't find anything, and let
fb27f198971a68f Pratyush Yadav 2020-10-05  1167  	 * flashes set the correct value if needed in their fixup hooks.
fb27f198971a68f Pratyush Yadav 2020-10-05  1168  	 */
fb27f198971a68f Pratyush Yadav 2020-10-05  1169  	dummy = FIELD_GET(PROFILE1_DWORD4_DUMMY_200MHZ, dwords[3]);
fb27f198971a68f Pratyush Yadav 2020-10-05  1170  	if (!dummy)
fb27f198971a68f Pratyush Yadav 2020-10-05  1171  		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_166MHZ, dwords[4]);
fb27f198971a68f Pratyush Yadav 2020-10-05  1172  	if (!dummy)
fb27f198971a68f Pratyush Yadav 2020-10-05  1173  		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_133MHZ, dwords[4]);
fb27f198971a68f Pratyush Yadav 2020-10-05  1174  	if (!dummy)
fb27f198971a68f Pratyush Yadav 2020-10-05  1175  		dummy = FIELD_GET(PROFILE1_DWORD5_DUMMY_100MHZ, dwords[4]);
fb27f198971a68f Pratyush Yadav 2020-10-05  1176  	if (!dummy)
fb27f198971a68f Pratyush Yadav 2020-10-05  1177  		dev_dbg(nor->dev,
fb27f198971a68f Pratyush Yadav 2020-10-05  1178  			"Can't find dummy cycles from Profile 1.0 table\n");
fb27f198971a68f Pratyush Yadav 2020-10-05  1179  
fb27f198971a68f Pratyush Yadav 2020-10-05  1180  	/* Round up to an even value to avoid tripping controllers up. */
fb27f198971a68f Pratyush Yadav 2020-10-05  1181  	dummy = round_up(dummy, 2);
fb27f198971a68f Pratyush Yadav 2020-10-05  1182  
fb27f198971a68f Pratyush Yadav 2020-10-05  1183  	/* Update the fast read settings. */
a580293a19fc49b Tudor Ambarus  2021-03-06  1184  	spi_nor_set_read_settings(&nor->params->reads[SNOR_CMD_READ_8_8_8_DTR],
fb27f198971a68f Pratyush Yadav 2020-10-05  1185  				  0, dummy, opcode,
fb27f198971a68f Pratyush Yadav 2020-10-05  1186  				  SNOR_PROTO_8_8_8_DTR);
fb27f198971a68f Pratyush Yadav 2020-10-05  1187  
fb27f198971a68f Pratyush Yadav 2020-10-05  1188  out:
fb27f198971a68f Pratyush Yadav 2020-10-05  1189  	kfree(dwords);
fb27f198971a68f Pratyush Yadav 2020-10-05  1190  	return ret;
fb27f198971a68f Pratyush Yadav 2020-10-05  1191  }
fb27f198971a68f Pratyush Yadav 2020-10-05  1192  
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1193  #define SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE		BIT(31)
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1194  
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1195  /**
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1196   * spi_nor_parse_sccr() - Parse the Status, Control and Configuration Register
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1197   *                        Map.
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1198   * @nor:		pointer to a 'struct spi_nor'
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1199   * @sccr_header:	pointer to the 'struct sfdp_parameter_header' describing
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1200   *			the SCCR Map table length and version.
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1201   *
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1202   * Return: 0 on success, -errno otherwise.
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1203   */
981a8d60e01f7e7 Tudor Ambarus  2020-10-05 @1204  static int spi_nor_parse_sccr(struct spi_nor *nor,
a580293a19fc49b Tudor Ambarus  2021-03-06  1205  			      const struct sfdp_parameter_header *sccr_header)
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1206  {
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1207  	u32 *dwords, addr;
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1208  	size_t len;
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1209  	int ret;
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1210  
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1211  	len = sccr_header->length * sizeof(*dwords);
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1212  	dwords = kmalloc(len, GFP_KERNEL);
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1213  	if (!dwords)
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1214  		return -ENOMEM;
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1215  
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1216  	addr = SFDP_PARAM_HEADER_PTP(sccr_header);
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1217  	ret = spi_nor_read_sfdp(nor, addr, len, dwords);
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1218  	if (ret)
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1219  		goto out;
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1220  
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1221  	le32_to_cpu_array(dwords, sccr_header->length);
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1222  
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1223  	if (FIELD_GET(SCCR_DWORD22_OCTAL_DTR_EN_VOLATILE, dwords[22]))
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1224  		nor->flags |= SNOR_F_IO_MODE_EN_VOLATILE;
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1225  
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1226  out:
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1227  	kfree(dwords);
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1228  	return ret;
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1229  }
981a8d60e01f7e7 Tudor Ambarus  2020-10-05  1230  

:::::: The code at line 1204 was first introduced by commit
:::::: 981a8d60e01f7e76d6bccb621598d087c9dd4a5d mtd: spi-nor: Parse SFDP SCCR Map

:::::: TO: Tudor Ambarus <tudor.ambarus@microchip.com>
:::::: CC: Vignesh Raghavendra <vigneshr@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
