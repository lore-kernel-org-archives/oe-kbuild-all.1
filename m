Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.10
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792800257;
	b=5IELONn+ZC5BP/Lg2C38qlLzIvsKOVTayN6eRsXyLK3PXTebfzoiWzd1JuzXE3aCCrTF
	 SRBCxgsIrHIYEQ8vs9KRkN6cjtrmBghzzP6Wl6Res9XN2AHEs5MPyTdp7an0+PNk9RbSw
	 UN1nNITon7JAG/AZGNukbIJhJeETmRzJF1ccwBS8GZT5Rb93uHYKCisk6DK9TM1T9tbz/
	 ckwe+oRR6rNdTHor/6JDu5xoPCC7MPJrm/IBZj8qYhivRtEZa+RGNF5YT0UD+FXMsoeFD
	 u+vK8gipkgT4WFdsYLjT9D6IODCaRSUOhgpIe5s7kkiUyYy+rWLOAIabFW229yZwrFA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792800257;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=sSehteLYCxtuRHOHIqxVg7nk+pkfpnAytroWLTWJLZI=;
	b=HDOaEoK/hDKooORYXTddZUPyeiYvVG3Uttp+i1cV8y6ot+fGiy5Dv34YfmrFhXrsTyp+
	 RM9eLINSdabNHnuzxVH/zzig0j8NuAXFuWWlko32D/G2DzzeNvB4ra7uVNECHv/pOz+06
	 OJsT4AGVlPdXYC6gPeLm97g47FF867bCsWpqr3AgAI71E4deg3JrfrbO47YnG1b0DnQXj
	 0UNqtQyD+pbW/r/zIY2fa0/HWEC7fZ1st4EF74zBtdgLzuA7p4j9qyLBqap8N5DzWF1w4
	 naqz4b4KR8xYBjX08eISOhe2fvsq1dcPelBUgQ/dWcIpW986GcIrtjopGWLhNFNdv/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UBP9O89Q;
	arc=none smtp.remote-ip=198.175.65.10
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C43606A31B
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Oct 2026 00:04:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24C43606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=UBP9O89Q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792800255; x=1824336255;
  h=date:from:to:cc:subject:message-id;
  bh=J1RUpBtFJNYWY+MUAayB2GSnlnrxUeIK8yA5Lv2zpN8=;
  b=UBP9O89QCojei6zHLYFnvmcvTO+WPTuX8sHto0ZAsx1PhUgAzyauPJ9t
   3n5n6+fSIwMtVMr59AIH9FZQX6qMSVKWYaqzcue/vmh6H6EPOFGLOV7iF
   xBGDjsb/xsC6lsbpk27D4xRUvc1FUa3TPSFrgRTfAzbnMnfou3D7tgJt1
   CDKesGtK3DgaV5Kxf5lIhB54RTczC7M1hCYYJPoAUm7DW4X2CGLAQHoQr
   KoQxTFyvPAfxc03MvlhKXpuDBLZ2ajmED1xIFdRICtU1WxC9WALjG3X6o
   5imYWEmAxa0AvnVpFu/1WWCQaekK+IulurWyd8aJaDBixqRksCc8SBH+Y
   A==;
X-CSE-ConnectionGUID: 7ZLbTP5FQ4eTxVegyt1jww==
X-CSE-MsgGUID: Z+b8GloSQK+J4Jzyg0H/dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11944"; a="1451807"
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="1451807"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2026 17:04:15 -0700
X-CSE-ConnectionGUID: Yqxm7skrSTCgzCfk6F8OuA==
X-CSE-MsgGUID: GJZYYkHjS6usdc9AnHrebQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,175,1787036400"; 
   d="scan'208";a="4158442"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 23 Oct 2026 17:04:13 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xKPF4-00000000TO2-3mRJ;
	Sat, 24 Oct 2026 00:04:10 +0000
Date: Sat, 24 Oct 2026 08:03:32 +0800
From: kernel test robot <lkp@intel.com>
To: Huacai Chen <chenhuacai@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chenhuacai-loongson:loongarch-next 9/22]
 arch/loongarch/include/asm/numa.h:17:48: warning: left shift count >= width
 of type
Message-ID: <202610240732.2HGud7k8-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chenhuacai/linux-loongson.git loongarch-next
head:   ce668200313df40f8c74752b9601a3a85def24f5
commit: 9c04d06741cd87a9e18cafff1cfeff8c5ff6727a [9/22] LoongArch: Use pa_to_nid()/nid_to_addrbase() rather than hard-code
config: loongarch-randconfig-1001-20261023 (https://download.01.org/0day-ci/archive/20261024/202610240732.2HGud7k8-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261024/202610240732.2HGud7k8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610240732.2HGud7k8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/loongarch/pci/pci.c:15:
   arch/loongarch/pci/pci.c: In function 'mcfg_addr_init':
>> arch/loongarch/include/asm/numa.h:17:48: warning: left shift count >= width of type [-Wshift-count-overflow]
      17 | #define nid_to_addrbase(nid)    (_ULCAST_(nid) << NODE_ADDRSPACE_SHIFT)
         |                                                ^~
   arch/loongarch/pci/pci.c:47:17: note: in expansion of macro 'nid_to_addrbase'
      47 |         return (nid_to_addrbase(node) | MCFG_EXT_PCICFG_BASE);
         |                 ^~~~~~~~~~~~~~~
>> arch/loongarch/pci/pci.c:47:39: warning: conversion from 'long long unsigned int' to 'phys_addr_t' {aka 'unsigned int'} changes value from '16484084482048' to '0' [-Woverflow]
      47 |         return (nid_to_addrbase(node) | MCFG_EXT_PCICFG_BASE);
         |                ~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~


vim +17 arch/loongarch/include/asm/numa.h

d4b6f1562a3c32 Huacai Chen 2022-05-31  15  
d4b6f1562a3c32 Huacai Chen 2022-05-31  16  #define pa_to_nid(addr)		(((addr) & 0xf00000000000) >> NODE_ADDRSPACE_SHIFT)
d4b6f1562a3c32 Huacai Chen 2022-05-31 @17  #define nid_to_addrbase(nid)	(_ULCAST_(nid) << NODE_ADDRSPACE_SHIFT)
d4b6f1562a3c32 Huacai Chen 2022-05-31  18  

:::::: The code at line 17 was first introduced by commit
:::::: d4b6f1562a3c3284adcef81d6e4f183d7d34b8a9 LoongArch: Add Non-Uniform Memory Access (NUMA) support

:::::: TO: Huacai Chen <chenhuacai@loongson.cn>
:::::: CC: Huacai Chen <chenhuacai@loongson.cn>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
