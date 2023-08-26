Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E521FAC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 12:33:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693053223; x=1724589223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GYpOmI9r8rWsj1jNjLNJGeMkwAb/XORsfKoo7uRD4sk=;
  b=TCdymlssz3oy9r1ea9ycecXuXYCuip/eulZ87xbsyK3PEpZ+TmlrW/gp
   qmxXHS8ZUnZ2YAGOL08K3DOLqu5gKYFXwTPS99L2eQSEUXQtX2VM/ERjP
   C1LQxzNdZizmKnya8XrWKuwI6RtVY/DS+IDpCkssS8O4SdP41c9TGrlLL
   JDictRLnj1IgbKYXNy043BrhoO9EULVw1SeBo+RqzDtYx72Ditk5ner2R
   506YD96ndlUF/Ij6mKYvLgEANzvQGJs0cCoEK2efMRkPgMpNgP90lPCPn
   I0GZ7PYqGjExsJb2jr3jc4g2pssW1aGss/3fRaC5TOBQMFXSWQrC/h/38
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="378652797"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="378652797"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 05:33:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10813"; a="1068529913"
X-IronPort-AV: E=Sophos;i="6.02,203,1688454000"; 
   d="scan'208";a="1068529913"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by fmsmga005.fm.intel.com with ESMTP; 26 Aug 2023 05:33:41 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qZsU0-0004go-2f;
	Sat, 26 Aug 2023 12:33:40 +0000
Date: Sat, 26 Aug 2023 20:33:31 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4_2 11427/11471]
 drivers/nvmem/layouts/adtran.c:45:12: warning: stack frame size (1112)
 exceeds limit (1024) in 'adtran_add_cells'
Message-ID: <202308262023.mIKUmTck-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4_2
head:   35d96df508340fa0325298e246b04b957d57c468
commit: 102ec6e9739acc2d8c976f5ea65d5e449790e0af [11427/11471] nvmem: add layout for Adtran devices
config: hexagon-randconfig-r005-20230826 (https://download.01.org/0day-ci/archive/20230826/202308262023.mIKUmTck-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project.git 4a5ac14ee968ff0ad5d2cc1ffa0299048db4c88a)
reproduce: (https://download.01.org/0day-ci/archive/20230826/202308262023.mIKUmTck-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308262023.mIKUmTck-lkp@intel.com/

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
