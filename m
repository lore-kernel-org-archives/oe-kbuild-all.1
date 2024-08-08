Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B11519007B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Aug 2024 15:20:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723130442; cv=none; b=QDl7nC9ksF8OemAsunyC7blSsT8DVx1OcenDna2mML/XGtMd962RtRN81+Ccb4E5qPz+mXeA1ehBNpDZFAOXj1OsCQyv+aDQ8ioZ4hq/eXpfQj2Zz5V4LkRtCL9uJFc9TBHhBNDl9XwaFlEKSXRUXcndBMMV5Iqc+6L3TFfKrpg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723130442; c=relaxed/simple;
	bh=oFhpGfwWhWhPQM9wModEhPt7pfeLfeW+QTIUZTWNRdo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M0Dwvuy4pAFtYFY4z34MQZ8fFMt1kDYV5J2gIlbiTrLoUBGhZhDNELVATy/DA1qgn7TeSu8wrQIlrH7Xo6PU84jscPq17tBukX3H3ecDyuNnSzwJHzykNKYCoi+N/EZ28nbCKxivRvGsBpGjFYvtGe0CKU5Elskev4CdhwIqmJA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PTdh/9Qz; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PTdh/9Qz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723130440; x=1754666440;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=oFhpGfwWhWhPQM9wModEhPt7pfeLfeW+QTIUZTWNRdo=;
  b=PTdh/9QzGmBjtilOHWDV8C2m/EPASFDtm6TVYdCsdvbMBvYg8/2KzRo5
   Uyrr4ercbQDe0qg/+cRWIfAc0/5HJi8HLnIjBoVTZi4GzPFDFVdvUt5Kl
   DVZcnpJd5y6iz1XsEceilQRg7+4FkA9ntIMwFlP4f2jw6ty5GgfXpKFnF
   XKqxK8lq780yJNuoyLkGEkey4CRpMIHc4RnGJPiEB6WCmIggp3yM0DRBF
   Aqd9pNJJVWRs4grus/1nzY4T+N6KAg1j2kpWwKvr5gywkOFS+9vGPZ25o
   y4D6Fa6WDWrGhdEOug2JxWOktPz586COI/ok22u2t64iDPYjMdStVNqiP
   Q==;
X-CSE-ConnectionGUID: mPTkbsJpT2SlLHpLmVmUmg==
X-CSE-MsgGUID: dZl6uaQMR06thKYEEJyGcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11158"; a="31836561"
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="31836561"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2024 08:20:39 -0700
X-CSE-ConnectionGUID: UiATfww1QJa7NwnxmqOzCA==
X-CSE-MsgGUID: St7/TZoPQcO4YjDkm4b14A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,273,1716274800"; 
   d="scan'208";a="61630454"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 08 Aug 2024 08:20:38 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sc4wJ-0006Gg-0R;
	Thu, 08 Aug 2024 15:20:32 +0000
Date: Thu, 8 Aug 2024 23:19:31 +0800
From: kernel test robot <lkp@intel.com>
To: Yu Zhao <yuzhao@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] arm64: use IPIs to pause/resume remote CPUs
Message-ID: <202408082252.QpzwqC7i-lkp@intel.com>
References: <20240806022114.3320543-3-yuzhao@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240806022114.3320543-3-yuzhao@google.com>

Hi Yu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed]

url:    https://github.com/intel-lab-lkp/linux/commits/Yu-Zhao/mm-HVO-introduce-helper-function-to-update-and-flush-pgtable/20240806-104445
base:   de9c2c66ad8e787abec7c9d7eff4f8c3cdd28aed
patch link:    https://lore.kernel.org/r/20240806022114.3320543-3-yuzhao%40google.com
patch subject: [RFC PATCH 2/4] arm64: use IPIs to pause/resume remote CPUs
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240808/202408082252.QpzwqC7i-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240808/202408082252.QpzwqC7i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408082252.QpzwqC7i-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/smp.c:988:24: warning: 'ipi_cpu_crash_stop' defined but not used [-Wunused-function]
     988 | static void __noreturn ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
         |                        ^~~~~~~~~~~~~~~~~~


vim +/ipi_cpu_crash_stop +988 arch/arm64/kernel/smp.c

78fd584cdec0518 AKASHI Takahiro 2017-04-03   987  
5ab6876c7843db5 Josh Poimboeuf  2023-04-12  @988  static void __noreturn ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
78fd584cdec0518 AKASHI Takahiro 2017-04-03   989  {
78fd584cdec0518 AKASHI Takahiro 2017-04-03   990  #ifdef CONFIG_KEXEC_CORE
78fd584cdec0518 AKASHI Takahiro 2017-04-03   991  	crash_save_cpu(regs, cpu);
78fd584cdec0518 AKASHI Takahiro 2017-04-03   992  
78fd584cdec0518 AKASHI Takahiro 2017-04-03   993  	atomic_dec(&waiting_for_crash_ipi);
78fd584cdec0518 AKASHI Takahiro 2017-04-03   994  
78fd584cdec0518 AKASHI Takahiro 2017-04-03   995  	local_irq_disable();
f5df26961853d68 James Morse     2018-01-08   996  	sdei_mask_local_cpu();
78fd584cdec0518 AKASHI Takahiro 2017-04-03   997  
de58ed5e16e62f3 Gavin Shan      2020-03-19   998  	if (IS_ENABLED(CONFIG_HOTPLUG_CPU))
de58ed5e16e62f3 Gavin Shan      2020-03-19   999  		__cpu_try_die(cpu);
78fd584cdec0518 AKASHI Takahiro 2017-04-03  1000  
78fd584cdec0518 AKASHI Takahiro 2017-04-03  1001  	/* just in case */
78fd584cdec0518 AKASHI Takahiro 2017-04-03  1002  	cpu_park_loop();
5ab6876c7843db5 Josh Poimboeuf  2023-04-12  1003  #else
5ab6876c7843db5 Josh Poimboeuf  2023-04-12  1004  	BUG();
78fd584cdec0518 AKASHI Takahiro 2017-04-03  1005  #endif
78fd584cdec0518 AKASHI Takahiro 2017-04-03  1006  }
78fd584cdec0518 AKASHI Takahiro 2017-04-03  1007  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
