Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0CD1262BE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Mar 2025 04:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742961827; cv=none; b=iEocIH0V3+zN5FyQA60mT/XBq3N2qVnGUIAJQynU0obJ2tJ4l3NLpNGz9GFLVF1uTeLT6BlKkHzYTawNjWGVZtzbfdM4r4wmKv5otJOARAixg2avQ0oduAj7iXE2h9UQU3+mH0cgsL1GtWomk3kTksTnJIYfUeTBE0CUqV2ZCKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742961827; c=relaxed/simple;
	bh=YwUYGj4JzziRAo56pyeIFXuC6KBlIy8voyonu5OUEnk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CCoiLPtrMjQIUKIKQ0RKT17Xmbbd3yqII5EZKrXS0OV7lupUlpTbJxkvcOxQTe+VN1m5fN0KIJd405bzUfUwlmVgxW+nXGQCuMsWZeKzx/hyr7mixRe5MuqkNMCPcA8YFmdmIvGRfXOehh0jXA/wpewsRAVBAOfpWbvWrqd65eg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KC+4MN1+; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KC+4MN1+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742961824; x=1774497824;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YwUYGj4JzziRAo56pyeIFXuC6KBlIy8voyonu5OUEnk=;
  b=KC+4MN1+EwyJixeI4GDbPAI9O3Pnl8fUGw23Q+xNhNtY862N2wZ2oOvp
   BQffwU/TEolMy0haey/N9dGcYhnlzwJyJIMzkjNS1PsJsM5s/HOY4ksky
   9hyLzKM8SgmynvKGwuSR+bAlNZ07NEHgvUBu4yg2eF+i7ohNYX/iyTcWT
   H2ZjIsYV0YtajXAwXEi3I25jCv+p3lJv5UrSqwd/qTbBv2TjFWGlFA0BU
   cpF9u92NMVvOFo++MzXpzhmcvWfy5y/5xjkhhhLs5xRi3LgUhn/3kQAjD
   Joxb+yL/saf3gbYPyyvZF9zPG/GpD6EvM+71lRuiEiT0Lzow28U3/+lSo
   g==;
X-CSE-ConnectionGUID: nZvUsjOGT1Ch0nT7UEgD+w==
X-CSE-MsgGUID: yFvBG/VqRVGjvP5sO9Tnkg==
X-IronPort-AV: E=McAfee;i="6700,10204,11384"; a="46970779"
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="46970779"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2025 21:03:44 -0700
X-CSE-ConnectionGUID: tA0FbOvgReerE9GpJwd5DA==
X-CSE-MsgGUID: pTCNL1TVQwyL5b8BYzTZGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,276,1736841600"; 
   d="scan'208";a="155628919"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 25 Mar 2025 21:03:43 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txHzQ-0005Rt-15;
	Wed, 26 Mar 2025 04:03:40 +0000
Date: Wed, 26 Mar 2025 12:03:07 +0800
From: kernel test robot <lkp@intel.com>
To: David Woodhouse <dwmw@amazon.co.uk>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dwmw2:kexec-debug-cfi 10/10]
 arch/x86/kernel/machine_kexec_64.c:312:13: warning: 'load_segments' defined
 but not used
Message-ID: <202503261144.q36i9bPk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/dwmw2/linux kexec-debug-cfi
head:   21e95723aa631b1eb5f618c8cf6061226d2a7d05
commit: 21e95723aa631b1eb5f618c8cf6061226d2a7d05 [10/10] final CFI hacks
config: x86_64-buildonly-randconfig-002-20250326 (https://download.01.org/0day-ci/archive/20250326/202503261144.q36i9bPk-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250326/202503261144.q36i9bPk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503261144.q36i9bPk-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/machine_kexec_64.c:312:13: warning: 'load_segments' defined but not used [-Wunused-function]
     312 | static void load_segments(void)
         |             ^~~~~~~~~~~~~


vim +/load_segments +312 arch/x86/kernel/machine_kexec_64.c

5234f5eb04abbbf arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-06-25  311  
5234f5eb04abbbf arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-06-25 @312  static void load_segments(void)
5234f5eb04abbbf arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-06-25  313  {
5234f5eb04abbbf arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-06-25  314  	__asm__ __volatile__ (
36c4fd23cc06f81 arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-07-29  315  		"\tmovl %0,%%ds\n"
36c4fd23cc06f81 arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-07-29  316  		"\tmovl %0,%%es\n"
36c4fd23cc06f81 arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-07-29  317  		"\tmovl %0,%%ss\n"
36c4fd23cc06f81 arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-07-29  318  		"\tmovl %0,%%fs\n"
36c4fd23cc06f81 arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-07-29  319  		"\tmovl %0,%%gs\n"
2ec5e3a867d63d0 arch/x86_64/kernel/machine_kexec.c Michael Matz      2006-03-07  320  		: : "a" (__KERNEL_DS) : "memory"
5234f5eb04abbbf arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-06-25  321  		);
5234f5eb04abbbf arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-06-25  322  }
5234f5eb04abbbf arch/x86_64/kernel/machine_kexec.c Eric W. Biederman 2005-06-25  323  

:::::: The code at line 312 was first introduced by commit
:::::: 5234f5eb04abbbfa306ccfbc2ccbb6e73f515b15 [PATCH] kexec: x86_64 kexec implementation

:::::: TO: Eric W. Biederman <ebiederm@xmission.com>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
