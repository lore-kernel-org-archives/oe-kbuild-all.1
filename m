Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9447250E8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Oct 2023 10:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="McfUIi8N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698228783; x=1729764783;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h0UyDKoZ/eJJrrnYYUi4H4asKBwlPW4FsjWIGdpYyto=;
  b=McfUIi8NzRGgXgOeh1p8dloGc6/41LYdC4DPlWu1yHshl6849vfK1s/d
   PkAc7GlNVOYbMnuqPegok2Yo0d8xcrUbA86Zz+Hli7HWId7qVtAjHTRvO
   OHdCjR68+Db0eKUU5HhiDyHRQG9XFu0oDjxYB7SRaJVo+jN+NLbD2zdGs
   9AXMgKngP+WcOeVqUL4fmHr5sw+VlM+Ff7ZghlvZrS2xeSpqixMqfF8WX
   B5lSkX0HySxhV2lDHtRoc76TmGhWO9ZpzZalpHHVaXwNq0OWwZPmeOxz+
   DqJwAj+s4umMyc+0c+/gsa/NSige6dwYTpR9XFe8Ap1JcWcNAeJIv85NY
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="377643172"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="377643172"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Oct 2023 03:13:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10873"; a="875447258"
X-IronPort-AV: E=Sophos;i="6.03,250,1694761200"; 
   d="scan'208";a="875447258"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 25 Oct 2023 03:13:01 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qvasl-0008oh-0v;
	Wed, 25 Oct 2023 10:12:59 +0000
Date: Wed, 25 Oct 2023 18:12:53 +0800
From: kernel test robot <lkp@intel.com>
To: Navneet Singh <navneet.singh@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Ira Weiny <ira.weiny@intel.com>
Subject: [weiny2:dcd-v3-2023-10-24 6/27] drivers/cxl/core/mbox.c:1238:54:
 warning: '%d' directive output may be truncated writing between 1 and 11
 bytes into a region of size 5
Message-ID: <202310251714.Ga6ad2kG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/weiny2/linux-kernel.git dcd-v3-2023-10-24
head:   1d3abb0480b0b8503b82e5f02ef95da8b182ba71
commit: 2c30a29c2ac598f2f3dc37f00afffad32d2dc9e4 [6/27] cxl/mem: Read dynamic capacity configuration from the device
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231025/202310251714.Ga6ad2kG-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231025/202310251714.Ga6ad2kG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310251714.Ga6ad2kG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/cxl/core/mbox.c: In function 'cxl_dc_save_region_info':
>> drivers/cxl/core/mbox.c:1238:54: warning: '%d' directive output may be truncated writing between 1 and 11 bytes into a region of size 5 [-Wformat-truncation=]
    1238 |         snprintf(dcr->name, CXL_DC_REGION_STRLEN, "dc%d", index);
         |                                                      ^~
   drivers/cxl/core/mbox.c:1238:51: note: directive argument in the range [-2147483647, 255]
    1238 |         snprintf(dcr->name, CXL_DC_REGION_STRLEN, "dc%d", index);
         |                                                   ^~~~~~
   drivers/cxl/core/mbox.c:1238:9: note: 'snprintf' output between 4 and 14 bytes into a destination of size 7
    1238 |         snprintf(dcr->name, CXL_DC_REGION_STRLEN, "dc%d", index);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +1238 drivers/cxl/core/mbox.c

  1224	
  1225	static int cxl_dc_save_region_info(struct cxl_memdev_state *mds, int index,
  1226					   struct cxl_dc_region_config *region_config)
  1227	{
  1228		struct cxl_dc_region_info *dcr = &mds->dc_region[index];
  1229		struct device *dev = mds->cxlds.dev;
  1230	
  1231		dcr->base = le64_to_cpu(region_config->region_base);
  1232		dcr->decode_len = le64_to_cpu(region_config->region_decode_length);
  1233		dcr->decode_len *= CXL_CAPACITY_MULTIPLIER;
  1234		dcr->len = le64_to_cpu(region_config->region_length);
  1235		dcr->blk_size = le64_to_cpu(region_config->region_block_size);
  1236		dcr->dsmad_handle = le32_to_cpu(region_config->region_dsmad_handle);
  1237		dcr->flags = region_config->flags;
> 1238		snprintf(dcr->name, CXL_DC_REGION_STRLEN, "dc%d", index);
  1239	
  1240		/* Check regions are in increasing DPA order */
  1241		if (index > 0) {
  1242			struct cxl_dc_region_info *prev_dcr = &mds->dc_region[index - 1];
  1243	
  1244			if ((prev_dcr->base + prev_dcr->decode_len) > dcr->base) {
  1245				dev_err(dev,
  1246					"DPA ordering violation for DC region %d and %d\n",
  1247					index - 1, index);
  1248				return -EINVAL;
  1249			}
  1250		}
  1251	
  1252		if (!IS_ALIGNED(dcr->base, SZ_256M) ||
  1253		    !IS_ALIGNED(dcr->base, dcr->blk_size)) {
  1254			dev_err(dev, "DC region %d invalid base %#llx blk size %#llx\n", index,
  1255				dcr->base, dcr->blk_size);
  1256			return -EINVAL;
  1257		}
  1258	
  1259		if (dcr->decode_len == 0 || dcr->len == 0 || dcr->decode_len < dcr->len ||
  1260		    !IS_ALIGNED(dcr->len, dcr->blk_size)) {
  1261			dev_err(dev, "DC region %d invalid length; decode %#llx len %#llx blk size %#llx\n",
  1262				index, dcr->decode_len, dcr->len, dcr->blk_size);
  1263			return -EINVAL;
  1264		}
  1265	
  1266		if (dcr->blk_size == 0 || dcr->blk_size % 0x40 ||
  1267		    !is_power_of_2(dcr->blk_size)) {
  1268			dev_err(dev, "DC region %d invalid block size; %#llx\n",
  1269				index, dcr->blk_size);
  1270			return -EINVAL;
  1271		}
  1272	
  1273		dev_dbg(dev,
  1274			"DC region %s DPA: %#llx LEN: %#llx BLKSZ: %#llx\n",
  1275			dcr->name, dcr->base, dcr->decode_len, dcr->blk_size);
  1276	
  1277		return 0;
  1278	}
  1279	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
