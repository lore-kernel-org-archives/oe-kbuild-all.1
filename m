Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A85B3016F3
	for <oe-kbuild-all@lists.linux.dev>; Thu, 13 Nov 2025 04:53:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763009606; cv=none; b=kV3zNRNE2ov+59xYC7lPAk712yTzaoYHC+gRa2HEpHKZAUJyCY/m5dbFPO9ZapX+Hpz5mcSfcoK/cGeCweIQfxPwp0EFuBAleb8TXC5i5L/IdTdPF2i2gbrfiaDlcH5ma0mbeB9VV49Gl18GTpBZdw0GGps6tI6SS7g8yUab1eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763009606; c=relaxed/simple;
	bh=wjRkHgD+dCn1BZHKBVrF92SBe40wPEh72VflWoV/0Aw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cZu8XCfJdlgT/QZd0vu0G27DlVwfBTs7WYsiniRIZEt0fgLlY+rkh+HtSVcjUOND+B9wLDRSaHoOeaxdbOL05dYeASN8zUfn2Qqo0WVMrJGUkzzwHayDhylOUAxoYlINuANo3p/qOb784aQlWCzhUXRagPW9jEwtfdCVVF0/Yv0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xf5r5Xps; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xf5r5Xps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763009605; x=1794545605;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wjRkHgD+dCn1BZHKBVrF92SBe40wPEh72VflWoV/0Aw=;
  b=Xf5r5Xps5A4JOwtY8TqcDsxQMHq8BUVnWPE3TEWv8PR1Qt47PhVU7NyZ
   DU0uJPuJqMF6RilXMmB1adFIEl4Bgy4XKbLSX3xqoe/cv5f41IWGPPvYC
   yrFOCwV6Yr+zbPuKmNBhLhjWyi/JjZig7C8G8OoIDnz+JQHbE94GWNms7
   l5A8YbBtKHT2yA4Vg46fOeXEIS2ruIeBtLDfi4D5AYKis+C/IxAdj9Uwe
   oux2alNk2mAsG9ocvDwlB10hrGx6P7u186krzMEILjrFins4PUfhzgB9O
   DJht0xFsC02aYWweel2O5JoMdCNgKKCuuOwhO8ue/KD2025sY6qVhRRBM
   w==;
X-CSE-ConnectionGUID: Ls5V+g0qSLiQIDvMtCydsQ==
X-CSE-MsgGUID: yQs0Ks3GRsWed+HN/hcJzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11611"; a="65175888"
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="65175888"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Nov 2025 20:53:22 -0800
X-CSE-ConnectionGUID: TyNmQ1mcQv6b8uXMTLzdKA==
X-CSE-MsgGUID: 2F8HZ2uxTZGrSTJbZS72qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,301,1754982000"; 
   d="scan'208";a="190138859"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Nov 2025 20:53:22 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vJPKh-0004u7-1X;
	Thu, 13 Nov 2025 04:53:19 +0000
Date: Thu, 13 Nov 2025 12:52:31 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:total_cpus 1/2] include/linux/smp.h:63:44: warning: 'struct
 pt_regs' declared inside parameter list will not be visible outside of this
 definition or declaration
Message-ID: <202511131010.zVP0P3G7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux total_cpus
head:   57f6e7cf466e27e510bbc03cc2a5b067622f9673
commit: 3a8c8f12c46acd1541dbea31afaa96e8c4bf8177 [1/2] smp: include cpumask_types.h
config: sparc-allnoconfig (https://download.01.org/0day-ci/archive/20251113/202511131010.zVP0P3G7-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251113/202511131010.zVP0P3G7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511131010.zVP0P3G7-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/kernel_stat.h:5,
                    from kernel/softirq.c:13:
>> include/linux/smp.h:63:44: warning: 'struct pt_regs' declared inside parameter list will not be visible outside of this definition or declaration
      63 | void __noreturn nmi_panic_self_stop(struct pt_regs *regs);
         |                                            ^~~~~~~
   include/linux/smp.h: In function 'on_each_cpu':
   include/linux/smp.h:71:55: error: 'cpu_online_mask' undeclared (first use in this function)
      71 |         on_each_cpu_cond_mask(NULL, func, info, wait, cpu_online_mask);
         |                                                       ^~~~~~~~~~~~~~~
   include/linux/smp.h:71:55: note: each undeclared identifier is reported only once for each function it appears in
   include/linux/smp.h: In function 'on_each_cpu_cond':
   include/linux/smp.h:105:60: error: 'cpu_online_mask' undeclared (first use in this function)
     105 |         on_each_cpu_cond_mask(cond_func, func, info, wait, cpu_online_mask);
         |                                                            ^~~~~~~~~~~~~~~


vim +63 include/linux/smp.h

a5aa5ce30059722 Nadav Amit     2021-02-20  57  
6f1f942cd5fbbe3 He Ying        2021-05-06  58  /*
6f1f942cd5fbbe3 He Ying        2021-05-06  59   * Cpus stopping functions in panic. All have default weak definitions.
6f1f942cd5fbbe3 He Ying        2021-05-06  60   * Architecture-dependent code may override them.
6f1f942cd5fbbe3 He Ying        2021-05-06  61   */
7412a60decec2a6 Josh Poimboeuf 2023-04-12  62  void __noreturn panic_smp_self_stop(void);
27dea14c7f05106 Josh Poimboeuf 2023-04-12 @63  void __noreturn nmi_panic_self_stop(struct pt_regs *regs);
6f1f942cd5fbbe3 He Ying        2021-05-06  64  void crash_smp_send_stop(void);
6f1f942cd5fbbe3 He Ying        2021-05-06  65  

:::::: The code at line 63 was first introduced by commit
:::::: 27dea14c7f05106f39850a9239874cd38703b405 cpu: Mark nmi_panic_self_stop() __noreturn

:::::: TO: Josh Poimboeuf <jpoimboe@kernel.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
