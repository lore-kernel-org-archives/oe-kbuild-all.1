Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A04ED40C03
	for <oe-kbuild-all@lists.linux.dev>; Sun, 13 Apr 2025 05:05:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744520747; cv=none; b=sL3fj6Iw2fqHnsLr6M6ErDhe/E+RBVgMfE0/LYkHGsb7OY1lg2180ZH7KkWd0DMS6oLTXJxlXw169MEj963ri0qMlOHUzbajRleCKFvO5sZA2pdIwncSjNNrnKOsKbtrp38lIyE8BTcgpMiyvd5blxelqOpPbu5K7g8TJecdkz4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744520747; c=relaxed/simple;
	bh=WLdKbw7R2TATYfScgleGCKzs8FPPAo72GnuZPiJPHHI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AJK2x8+3BzhtKWZXatZhdhJmErbHWRu/678dtCstzlbxrpRPclLXs/glEWwul9HhqEuxd1tdnh3De9phF45KfrsWbOpeVPmhmE3K6NgdkHlPiOLnD2vRYqPp9jli/yazwhjFR20ph7eY1wXERD7LMF8Rhe6AsOrLQMokA2EpMHU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RtB0MeBg; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RtB0MeBg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744520746; x=1776056746;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=WLdKbw7R2TATYfScgleGCKzs8FPPAo72GnuZPiJPHHI=;
  b=RtB0MeBg1QwWNvGpDMDHKzTPonXgqmnxcq0IHEFur+1owdME1ONJp57d
   q9s/a4dovpwR483b8IBp5Nnd5rtThCXF6tdSbaiHg05BSVV0FB5/wnhWj
   Rsku1aiZV+fDDNHqOQLjUcgzOiecgHRyQ0f5XaBt6FyIXchFnjedmttQK
   qUzUs5CdgugkhOtxVulmYLixMzNaml0t0t1VgK0oV5dz4P72RuGUze1v+
   7xfuMWyOfJX5RU7IAzcHFB0PBOv5PlfIDuJyffO7M4fRh3gKUv9ik5SGF
   6zjrdzEEVTfP7s7O2UT6XPCyuutrgj22sE++IME86nPxNrvcTHxPxLBvN
   Q==;
X-CSE-ConnectionGUID: lHWyW355SI+FPhkPuH4oQQ==
X-CSE-MsgGUID: zd7K7g1MTcC19RKi767KXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11402"; a="57402072"
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="57402072"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2025 22:05:45 -0700
X-CSE-ConnectionGUID: iv88DH2IQkityobGFQFWOQ==
X-CSE-MsgGUID: JSZidDBgRTaVTjrOt/9V9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,209,1739865600"; 
   d="scan'208";a="129472289"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 12 Apr 2025 22:05:44 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u3pXJ-000COY-1I;
	Sun, 13 Apr 2025 05:05:41 +0000
Date: Sun, 13 Apr 2025 13:05:40 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.14-next-wip 6643/6651]
 drivers/nvmem/layouts/adtran.c:34:12: warning: stack frame size (1112)
 exceeds limit (1024) in 'adtran_add_cells'
Message-ID: <202504131327.2TPls56n-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.14-next-wip
head:   c47e22e7e204c4e69cb6eeeb8588809af178bc8c
commit: b25b864617cae33765e53cc53fbbc72faa5f3570 [6643/6651] nvmem: add layout for Adtran devices
config: hexagon-allmodconfig (https://download.01.org/0day-ci/archive/20250413/202504131327.2TPls56n-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250413/202504131327.2TPls56n-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504131327.2TPls56n-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/nvmem/layouts/adtran.c:34:12: warning: stack frame size (1112) exceeds limit (1024) in 'adtran_add_cells' [-Wframe-larger-than]
      34 | static int adtran_add_cells(struct nvmem_layout *layout)
         |            ^
   1 warning generated.


vim +/adtran_add_cells +34 drivers/nvmem/layouts/adtran.c

    33	
  > 34	static int adtran_add_cells(struct nvmem_layout *layout)
    35	{
    36		struct nvmem_device *nvmem = layout->nvmem;
    37		struct nvmem_cell_info info;
    38		struct device_node *layout_np;
    39		char mfginfo[1024], *c, *t, *p;
    40		int ret = -EINVAL;
    41	
    42		ret = nvmem_device_read(nvmem, 0, sizeof(mfginfo), mfginfo);
    43		if (ret < 0)
    44			return ret;
    45		else if (ret != ARRAY_SIZE(mfginfo))
    46			return -EIO;
    47	
    48		layout_np = of_nvmem_layout_get_container(nvmem);
    49		if (!layout_np)
    50			return -ENOENT;
    51	
    52		c = mfginfo;
    53		while (*c != 0xff) {
    54			memset(&info, 0, sizeof(info));
    55			if (*c == '#')
    56				goto nextline;
    57	
    58			t = strchr(c, '=');
    59			if (!t)
    60				goto nextline;
    61	
    62			*t = '\0';
    63			++t;
    64			info.offset = t - mfginfo;
    65			/* process variable name: convert to lower-case, '_' -> '-' */
    66			p = c;
    67			do {
    68				*p = tolower(*p);
    69				if (*p == '_')
    70					*p = '-';
    71			} while (*++p);
    72			info.name = c;
    73			c = strchr(t, 0xa); /* find newline */
    74			if (!c)
    75				break;
    76	
    77			info.bytes = c - t;
    78			if (!strcmp(info.name, "mfg-mac")) {
    79				info.raw_len = info.bytes;
    80				info.bytes = ETH_ALEN;
    81				info.read_post_process = adtran_mac_address_pp;
    82			}
    83	
    84			info.np = of_get_child_by_name(layout_np, info.name);
    85			ret = nvmem_add_one_cell(nvmem, &info);
    86			if (ret)
    87				break;
    88	
    89			++c;
    90			continue;
    91	
    92	nextline:
    93			c = strchr(c, 0xa); /* find newline */
    94			if (!c)
    95				break;
    96			++c;
    97		}
    98	
    99		of_node_put(layout_np);
   100	
   101		return ret;
   102	}
   103	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
