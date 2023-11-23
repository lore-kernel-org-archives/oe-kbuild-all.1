Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA3F2567
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Nov 2023 01:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QZzpX1/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700704509; x=1732240509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iCEymq1uCiDfClu4NunbOEAlaHiNRYA9xuCSApwQJTo=;
  b=QZzpX1/zZ2Lh1jCB4d7msWFiAa2p9UfCowz29KhBg2qpwjfowiws7daH
   7eXMZNAzssGRLeJXJpA6vA/Qk7xscwrzBdYQK1sopSNqdr4gTH4EIaCNd
   s/RuHyTd2xfCXIOzq2G03dKH9Vy8WK4jBbRD8uY1/bKWTVzgfa5scN3se
   xYRrBQYcrTMXm9cO+JBRqstQLAVuVvFED5amlifqLCqvO+V2UaM+8lZK9
   VnvFKTK32qAS54B3Ny9fPP+MHpk1IvD+e3Gx7kOu5ts/aZlXDtWA7fAjB
   cx+veoW6cXp5wUIH/CDQ3mqncN56SmwMX6DFnbWRKtRF/Us/A319Ohk5o
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="458674146"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="458674146"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 17:55:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10902"; a="884821092"
X-IronPort-AV: E=Sophos;i="6.04,220,1695711600"; 
   d="scan'208";a="884821092"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 22 Nov 2023 17:55:07 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5yvp-000160-12;
	Thu, 23 Nov 2023 01:55:05 +0000
Date: Thu, 23 Nov 2023 09:54:19 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.6-dango 7039/7095]
 drivers/nvmem/layouts/adtran.c:45:12: warning: stack frame size (1112)
 exceeds limit (1024) in 'adtran_add_cells'
Message-ID: <202311230410.pANJZUIi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.6-dango
head:   c3f5b3f22933d3fdfdaced4da77348154240d88b
commit: 4d567854f3e201e1cfba0c198cd93d3cff7184ba [7039/7095] nvmem: add layout for Adtran devices
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20231123/202311230410.pANJZUIi-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231123/202311230410.pANJZUIi-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311230410.pANJZUIi-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvmem/layouts/adtran.c:45:12: warning: stack frame size (1112) exceeds limit (1024) in 'adtran_add_cells' [-Wframe-larger-than]
      45 | static int adtran_add_cells(struct device *dev, struct nvmem_device *nvmem,
         |            ^
   1 warning generated.


vim +/adtran_add_cells +45 drivers/nvmem/layouts/adtran.c

    44	
  > 45	static int adtran_add_cells(struct device *dev, struct nvmem_device *nvmem,
    46				     struct nvmem_layout *layout)
    47	{
    48		struct nvmem_cell_info info;
    49		struct device_node *layout_np;
    50		char mfginfo[1024], *c, *t, *p;
    51		int ret = -EINVAL;
    52	
    53		ret = nvmem_device_read(nvmem, 0, sizeof(mfginfo), mfginfo);
    54		if (ret < 0)
    55			return ret;
    56		else if (ret != sizeof(mfginfo))
    57			return -EIO;
    58	
    59		layout_np = of_nvmem_layout_get_container(nvmem);
    60		if (!layout_np)
    61			return -ENOENT;
    62	
    63		c = mfginfo;
    64		while (*c != 0xff) {
    65			memset(&info, 0, sizeof(info));
    66			if (*c == '#')
    67				goto nextline;
    68	
    69			t = strchr(c, '=');
    70			if (!t)
    71				goto nextline;
    72	
    73			*t = '\0';
    74			++t;
    75			info.offset = t - mfginfo;
    76			if (!strcmp(c, "MFG_MAC"))
    77				info.read_post_process = adtran_mac_address_pp;
    78	
    79			/* process variable name: convert to lower-case, '_' -> '-' */
    80			p = c;
    81			do {
    82				*p = tolower(*p);
    83				if (*p == '_')
    84					*p = '-';
    85			} while (*++p);
    86			info.name = c;
    87			c = strchr(t, 0xa); /* find newline */
    88			if (!c)
    89				break;
    90	
    91			info.bytes = c - t;
    92			info.np = of_get_child_by_name(layout_np, info.name);
    93			ret = nvmem_add_one_cell(nvmem, &info);
    94			if (ret)
    95				break;
    96	
    97			++c;
    98			continue;
    99	
   100	nextline:
   101			c = strchr(c, 0xa); /* find newline */
   102			if (!c)
   103				break;
   104			++c;
   105		}
   106	
   107		of_node_put(layout_np);
   108	
   109		return ret;
   110	}
   111	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
