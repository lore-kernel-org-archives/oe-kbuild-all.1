Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E5FE3DA5B7
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jul 2026 09:26:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783330018; cv=none; b=PDpASWMLH8EpJze16Jtg2bcx8EYseoHhkFMfJtnf0UCJwbjyKz29ar6UaC+RQ/7laLdjE/oaflIUpTiPme5kGr4ePYXFfZyACFh+K2pas2f4SPGvfyc54YpJrd44oMFCl9kiLFXr81Yvo9bONrYFenPrvlDcCbGffNcM00oIeks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783330018; c=relaxed/simple;
	bh=yxRiZOTE+xLMxinXayTTC9UgVCrkh4jULhmDSq16Peg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=BDK/pVRyZyL1XisoW4G3BkST6L2DcTSRV1SAWb9ZvQcDEyP6ye3xchl5Q+50RPvsaDnJA+LxuwvMo8p5v1sZa4b4AS3qMJF7qMSCLIm8ZehMZJiayu0qMKHNC/twhvPWciA3Bu/0xmQSlOAT42HDYjcwSTGW86gtIbLod3X848Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=cxOvIQbD; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cxOvIQbD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783330013; x=1814866013;
  h=date:from:to:cc:subject:message-id;
  bh=yxRiZOTE+xLMxinXayTTC9UgVCrkh4jULhmDSq16Peg=;
  b=cxOvIQbD3wg25YD6CZeQYioJRHvjUdMQBhY57wmqA+tG/f2CVQVlxrjy
   RfWOSeFikJofpSsM4zRlQQUBAZD2sLpvEc35DfUPICUfgtXd83c2b6fmx
   ZNyNqZF3dSXu2TI2MR3z5tifhDEkJTvmGYzlUWD0EWtKLxOTssE5WgR09
   0Qx/ZFG5bstB66lM+Eg/mgLFSZuLXiKLHobN0inyjKZMCaR5MB6eyihQX
   VC3g1EeZpIfLRbzBFQwNsY5X21XU1dyDJEYP9dcpf7fC28UzjL4liavUW
   o2UKxUpESoDOIZ/Oc7QQrpIX9ZE0HGan/DyAr+drxJDCQgoYhg76ZYmVA
   g==;
X-CSE-ConnectionGUID: 0/0DwYRWRBqmfoLlTZtuMw==
X-CSE-MsgGUID: +UayYKcJSGqlUmgPoC2CyQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11838"; a="82939006"
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="82939006"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jul 2026 02:26:46 -0700
X-CSE-ConnectionGUID: tCygQ6IXRdW3rG4f/QqHJQ==
X-CSE-MsgGUID: dpZ0qXXHRmShJI9b1Lda+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,149,1779174000"; 
   d="scan'208";a="257995378"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 06 Jul 2026 02:26:44 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wgfb7-00000000EEl-47Zc;
	Mon, 06 Jul 2026 09:26:41 +0000
Date: Mon, 06 Jul 2026 17:26:37 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:7.2-dango 165/215]
 drivers/nvmem/layouts/adtran.c:103:1: warning: the frame size of 1368 bytes
 is larger than 1280 bytes
Message-ID: <202607061739.cVztZNlY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/frank-w/BPI-R2-4.14 7.2-dango
head:   d19514df7d0958e914bdb3435ea4d64d2fc5766a
commit: a648529bea91c552be3bc0dfc3efcd69f5f67a13 [165/215] nvmem: add layout for Adtran devices
config: arm-allyesconfig (https://download.01.org/0day-ci/archive/20260706/202607061739.cVztZNlY-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260706/202607061739.cVztZNlY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607061739.cVztZNlY-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/nvmem/layouts/adtran.c: In function 'adtran_add_cells':
>> drivers/nvmem/layouts/adtran.c:103:1: warning: the frame size of 1368 bytes is larger than 1280 bytes [-Wframe-larger-than=]
     103 | }
         | ^


vim +103 drivers/nvmem/layouts/adtran.c

    34	
    35	static int adtran_add_cells(struct nvmem_layout *layout)
    36	{
    37		struct nvmem_device *nvmem = layout->nvmem;
    38		struct nvmem_cell_info info;
    39		struct device_node *layout_np;
    40		char mfginfo[1024], *c, *t, *p;
    41		int ret = -EINVAL;
    42	
    43		ret = nvmem_device_read(nvmem, 0, sizeof(mfginfo), mfginfo);
    44		if (ret < 0)
    45			return ret;
    46		else if (ret != ARRAY_SIZE(mfginfo))
    47			return -EIO;
    48	
    49		layout_np = of_nvmem_layout_get_container(nvmem);
    50		if (!layout_np)
    51			return -ENOENT;
    52	
    53		c = mfginfo;
    54		while (*c != 0xff) {
    55			memset(&info, 0, sizeof(info));
    56			if (*c == '#')
    57				goto nextline;
    58	
    59			t = strchr(c, '=');
    60			if (!t)
    61				goto nextline;
    62	
    63			*t = '\0';
    64			++t;
    65			info.offset = t - mfginfo;
    66			/* process variable name: convert to lower-case, '_' -> '-' */
    67			p = c;
    68			do {
    69				*p = tolower(*p);
    70				if (*p == '_')
    71					*p = '-';
    72			} while (*++p);
    73			info.name = c;
    74			c = strchr(t, 0xa); /* find newline */
    75			if (!c)
    76				break;
    77	
    78			info.bytes = c - t;
    79			if (!strcmp(info.name, "mfg-mac")) {
    80				info.raw_len = info.bytes;
    81				info.bytes = ETH_ALEN;
    82				info.read_post_process = adtran_mac_address_pp;
    83			}
    84	
    85			info.np = of_get_child_by_name(layout_np, info.name);
    86			ret = nvmem_add_one_cell(nvmem, &info);
    87			if (ret)
    88				break;
    89	
    90			++c;
    91			continue;
    92	
    93	nextline:
    94			c = strchr(c, 0xa); /* find newline */
    95			if (!c)
    96				break;
    97			++c;
    98		}
    99	
   100		of_node_put(layout_np);
   101	
   102		return ret;
 > 103	}
   104	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
