Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA9AB5221
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Nov 2023 05:44:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCOHQIon"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698903861; x=1730439861;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=66t9OrYOY9yuS9ElfLmbvVBlC/TeMk5jRrhYLGBo4H4=;
  b=XCOHQIonigY4bDqQpCAuK3ZNHtnBvdWp1r3XKs7pvyk9KRQdM2Kn51/e
   1woeSuVhvL1lHeWrxnpC9LVYvH9IQDdl3jdsp8zHXMFV1didnxQ87NvPf
   /9J0ILLXRGYsuBi+Rt6fjkrNqsX/1lXEr9RxSRMjgqQCnPHzuSNBiHfGg
   f5nyC4indKqshem+URSbZyBZhvaKRbGfw0UWTaw7L+qvOQYk0WAWNIrzu
   Pnn+X71aJoZWGIut0GbkdwJQuXgTEVVFLAa0LhMcN37Ok4RTcy0B0WN6v
   xdDcEgVlotj5eSpK+QRRzxy3RhpeqTgvQEiq0ciYes0Y6GtQSbdFWLQrU
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="452938119"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="452938119"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Nov 2023 22:44:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10881"; a="851802750"
X-IronPort-AV: E=Sophos;i="6.03,270,1694761200"; 
   d="scan'208";a="851802750"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 01 Nov 2023 22:44:19 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyQV7-0001A0-0l;
	Thu, 02 Nov 2023 05:44:17 +0000
Date: Thu, 2 Nov 2023 13:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:dcd-v3-2023-10-30 4/24] drivers/cxl/core/mbox.c:1234:54:
 warning: '%d' directive output may be truncated writing between 1 and 11
 bytes into a region of size 6
Message-ID: <202311021307.OrCTvm4G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v3-2023-10-30
head:   d3da9e88296217b17eb067531b48dfd0211393c9
commit: d8a51c52640d787c07aa8accaa23ccace0a252ab [4/24] cxl/mem: Read dynamic capacity configuration from the device
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20231102/202311021307.OrCTvm4G-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231102/202311021307.OrCTvm4G-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311021307.OrCTvm4G-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cxl/core/mbox.c: In function 'cxl_dc_save_region_info':
>> drivers/cxl/core/mbox.c:1234:54: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 6 [-Wformat-truncation=]
    1234 |         snprintf(dcr->name, CXL_DC_REGION_STRLEN, "dc%d", index);
         |                                                      ^~
   drivers/cxl/core/mbox.c:1234:51: note: directive argument in the range [-2147483647, 255]
    1234 |         snprintf(dcr->name, CXL_DC_REGION_STRLEN, "dc%d", index);
         |                                                   ^~~~~~
   drivers/cxl/core/mbox.c:1234:9: note: 'snprintf' output between 4 and 14 bytes into a destination of size 8
    1234 |         snprintf(dcr->name, CXL_DC_REGION_STRLEN, "dc%d", index);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1234 drivers/cxl/core/mbox.c

  1220	
  1221	static int cxl_dc_save_region_info(struct cxl_memdev_state *mds, int index,
  1222					   struct cxl_dc_region_config *region_config)
  1223	{
  1224		struct cxl_dc_region_info *dcr = &mds->dc_region[index];
  1225		struct device *dev = mds->cxlds.dev;
  1226	
  1227		dcr->base = le64_to_cpu(region_config->region_base);
  1228		dcr->decode_len = le64_to_cpu(region_config->region_decode_length);
  1229		dcr->decode_len *= CXL_CAPACITY_MULTIPLIER;
  1230		dcr->len = le64_to_cpu(region_config->region_length);
  1231		dcr->blk_size = le64_to_cpu(region_config->region_block_size);
  1232		dcr->dsmad_handle = le32_to_cpu(region_config->region_dsmad_handle);
  1233		dcr->flags = region_config->flags;
> 1234		snprintf(dcr->name, CXL_DC_REGION_STRLEN, "dc%d", index);
  1235	
  1236		/* Check regions are in increasing DPA order */
  1237		if (index > 0) {
  1238			struct cxl_dc_region_info *prev_dcr = &mds->dc_region[index - 1];
  1239	
  1240			if ((prev_dcr->base + prev_dcr->decode_len) > dcr->base) {
  1241				dev_err(dev,
  1242					"DPA ordering violation for DC region %d and %d\n",
  1243					index - 1, index);
  1244				return -EINVAL;
  1245			}
  1246		}
  1247	
  1248		if (!IS_ALIGNED(dcr->base, SZ_256M) ||
  1249		    !IS_ALIGNED(dcr->base, dcr->blk_size)) {
  1250			dev_err(dev, "DC region %d invalid base %#llx blk size %#llx\n", index,
  1251				dcr->base, dcr->blk_size);
  1252			return -EINVAL;
  1253		}
  1254	
  1255		if (dcr->decode_len == 0 || dcr->len == 0 || dcr->decode_len < dcr->len ||
  1256		    !IS_ALIGNED(dcr->len, dcr->blk_size)) {
  1257			dev_err(dev, "DC region %d invalid length; decode %#llx len %#llx blk size %#llx\n",
  1258				index, dcr->decode_len, dcr->len, dcr->blk_size);
  1259			return -EINVAL;
  1260		}
  1261	
  1262		if (dcr->blk_size == 0 || dcr->blk_size % 0x40 ||
  1263		    !is_power_of_2(dcr->blk_size)) {
  1264			dev_err(dev, "DC region %d invalid block size; %#llx\n",
  1265				index, dcr->blk_size);
  1266			return -EINVAL;
  1267		}
  1268	
  1269		dev_dbg(dev,
  1270			"DC region %s DPA: %#llx LEN: %#llx BLKSZ: %#llx\n",
  1271			dcr->name, dcr->base, dcr->decode_len, dcr->blk_size);
  1272	
  1273		return 0;
  1274	}
  1275	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
