Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ECA254785
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Jul 2026 23:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783897330; cv=none; b=Hm5kzEFuHe6DE+Qm42WxcTexC8AnZPGF0iaIUkhVdxA+0K41u1XhpmzUiCAMu3jkzcPvS8jB//CG5MgYKxiMlTJyQUBhg4Y2lm9B4w5Q+nlhh5Wdxami+ec/PAHvIJie3x/tLfAI9SCKOn9Xxqu92PFJ6GRy5ioO7Ied9FphGCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783897330; c=relaxed/simple;
	bh=O/YcYRDafzWB5F7yjTDS9bKwMABaHXOn2DXAuBMOVWE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=kisdLDXvgUBM97lffaTmIISRkMN9cPJzyC51RIz5Gg5xykeWclLTF6VCLKMAEgfe/H7cvQbI2LfoGOWdt1eHTEN/v1caaemKqHuiBSWVm8WknIWp2ul1PXI8Y3aoG95xgYEcyQttdJE+r+qEX1DC795tn7bJy0vHsIHu3c4BwWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mD/IO25k; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mD/IO25k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783897329; x=1815433329;
  h=date:from:to:cc:subject:message-id;
  bh=O/YcYRDafzWB5F7yjTDS9bKwMABaHXOn2DXAuBMOVWE=;
  b=mD/IO25kL1u28rOjaa64PiYTBNTmX/UsE3V0dsYlJupC4FJzeHlz68s4
   rXsTHRd3zSlhDzjE1ZQ8kxY7fXXDsRt56WpFD1HAlCrPFTcQiVz+mXVEU
   AtJFC4mXF3qZYDomlugLuUwfbreLZWRxSBt3Avv3g2CSyQqPo9EsVz/kn
   vQ+Jb2l630sBKKQeEQ/urfhOyNhlG+6Po0OLmgHyZGhJaa0cdJu1nA2+2
   slEK7moziU3+An4ylgfgE6QBgXM5pAQFSViaKK/ya6TyUlcKykmGsX/F6
   ZmgfHMn8ji5MhQL/2qWflXh6Nizw4nM/D3wh106G7O33jApLHeSlsX1Gz
   w==;
X-CSE-ConnectionGUID: jw5BTDiqQXSiXqQEsdXrqQ==
X-CSE-MsgGUID: 7lCoWx04TNuOl9ELtN+WQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="88335562"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="88335562"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 16:02:08 -0700
X-CSE-ConnectionGUID: 5vun3Sg3R3eP9TI3FPIwXg==
X-CSE-MsgGUID: E8sPNHTnSSqcZzJx/ZrqUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="279800571"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 12 Jul 2026 16:02:07 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj3BU-00000000LBx-41xM;
	Sun, 12 Jul 2026 23:02:04 +0000
Date: Mon, 13 Jul 2026 07:01:51 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 58/59]
 arch/x86/hyperv/hv_init.c:204:9: error: 'tsc_khz' undeclared
Message-ID: <202607130651.vQHR3Of7-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: 27019f00127af90a16c3b8c54e976cdc8a711b0a [58/59] x86: Select ARCH_HAS_RANDOM_ENTROPY
config: i386-randconfig-014-20260713 (https://download.01.org/0day-ci/archive/20260713/202607130651.vQHR3Of7-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607130651.vQHR3Of7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607130651.vQHR3Of7-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/hyperv/hv_init.c: In function 'hyperv_stop_tsc_emulation':
>> arch/x86/hyperv/hv_init.c:204:9: error: 'tsc_khz' undeclared (first use in this function)
     204 |         tsc_khz = div64_u64(freq, 1000);
         |         ^~~~~~~
   arch/x86/hyperv/hv_init.c:204:9: note: each undeclared identifier is reported only once for each function it appears in
--
   arch/x86/kernel/cpu/mce/core.c: In function 'machine_check_poll':
>> arch/x86/kernel/cpu/mce/core.c:804:26: error: implicit declaration of function 'rdtsc' [-Werror=implicit-function-declaration]
     804 |                 m->tsc = rdtsc();
         |                          ^~~~~
   cc1: some warnings being treated as errors


vim +/tsc_khz +204 arch/x86/hyperv/hv_init.c

93286261de1b46 Vitaly Kuznetsov 2018-01-24  193  
93286261de1b46 Vitaly Kuznetsov 2018-01-24  194  void hyperv_stop_tsc_emulation(void)
93286261de1b46 Vitaly Kuznetsov 2018-01-24  195  {
93286261de1b46 Vitaly Kuznetsov 2018-01-24  196  	u64 freq;
93286261de1b46 Vitaly Kuznetsov 2018-01-24  197  	struct hv_tsc_emulation_status emu_status;
93286261de1b46 Vitaly Kuznetsov 2018-01-24  198  
c435e608cf59ff Ingo Molnar      2025-04-09  199  	rdmsrq(HV_X64_MSR_TSC_EMULATION_STATUS, *(u64 *)&emu_status);
93286261de1b46 Vitaly Kuznetsov 2018-01-24  200  	emu_status.inprogress = 0;
78255eb2397332 Ingo Molnar      2025-04-09  201  	wrmsrq(HV_X64_MSR_TSC_EMULATION_STATUS, *(u64 *)&emu_status);
93286261de1b46 Vitaly Kuznetsov 2018-01-24  202  
c435e608cf59ff Ingo Molnar      2025-04-09  203  	rdmsrq(HV_X64_MSR_TSC_FREQUENCY, freq);
93286261de1b46 Vitaly Kuznetsov 2018-01-24 @204  	tsc_khz = div64_u64(freq, 1000);
93286261de1b46 Vitaly Kuznetsov 2018-01-24  205  }
93286261de1b46 Vitaly Kuznetsov 2018-01-24  206  EXPORT_SYMBOL_GPL(hyperv_stop_tsc_emulation);
93286261de1b46 Vitaly Kuznetsov 2018-01-24  207  

:::::: The code at line 204 was first introduced by commit
:::::: 93286261de1b46339aa27cd4c639b21778f6cade x86/hyperv: Reenlightenment notifications support

:::::: TO: Vitaly Kuznetsov <vkuznets@redhat.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
