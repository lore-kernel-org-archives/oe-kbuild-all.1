Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B62FE2E0407
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Jan 2026 15:44:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768232673; cv=none; b=eZP78XbpsfFT/PcY8fRf281dbQj1A1qXXGinl0ckNnB80MYmV0HGMN1PD1oGVMJ3BKvWQ7vWU0aJb3RZpS1pwD+fs+cV9uvO2bnvKVba7rTiAbGpxzACS/J6tEtnusK+G+lB+0pVqvzYT1hMhmj2Pjs3EqTbE1FoiTPxd+nozLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768232673; c=relaxed/simple;
	bh=vRGFpoId+xu/LOdAErjRPgQgZcCg+EwL8fIwBKNW6I4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XEnwYQDXac3973EAnLI6HBhvxU3+LCGM4W4bzZ3dQ6n9fIqlBGOnj6pZK+TmMSCGBvmD6wu6vI4W/6HVsXy/DCLQWvPL4QM2Htq7Vuc8PfO03E24H0rRJlGaSc48bpBNc0Ypp6OMeanj0LNxaorNWH/HEEuJMQnJ3QMcbMpo2NE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWLYQUDu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWLYQUDu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768232671; x=1799768671;
  h=date:from:to:cc:subject:message-id;
  bh=vRGFpoId+xu/LOdAErjRPgQgZcCg+EwL8fIwBKNW6I4=;
  b=QWLYQUDug1Q+7sj2lYEsSZ7j+DaaDyLVgBdXhANtxzehHMuVqRlfwh1n
   +6m1zgt8JiRZk53YlDsN50SCEqDuICOxmMOSrUwU91AMIdukuHCGEmif3
   qn0oe79l9hcDZCwyg89KTE6jERovJuYxAsecInSv9OqC9snI66EI+WQTU
   pnixz+nFEy2mfT+uCugeMqoOBmRM+wGBWbA0J7D6B2IVFGzZ3ZYA74AMg
   EFpn40CG13OikR8bGQzsMLv+JsHZTFUX4Ej11hu2JHl/gGMjLRzLlJ0y9
   Wlb0uG3A+MX8Ja3NCRwtwbrle2cwu3nqkvOOnVPLNRmbWqhniUJR3pg6r
   g==;
X-CSE-ConnectionGUID: /AaW71wnSSaamWWk3L/nSg==
X-CSE-MsgGUID: RXYa0wpaQ3WVPVwV3qTn0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="94985979"
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="94985979"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jan 2026 07:44:31 -0800
X-CSE-ConnectionGUID: 6QLdWQ3WSdCyLE28Fq/J8w==
X-CSE-MsgGUID: UCjlj5JnQAOt9qlQTfJ0NA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,221,1763452800"; 
   d="scan'208";a="204399461"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 12 Jan 2026 07:44:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vfK5j-00000000DW6-45D5;
	Mon, 12 Jan 2026 15:44:27 +0000
Date: Mon, 12 Jan 2026 23:43:58 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 11/15]
 include/linux/kernel_stat.h:164:2: error: implicit declaration of function
 'kcpustat_fetch_default'; did you mean 'kcpustat_cpu_fetch_default'?
Message-ID: <202601122333.n1Vk7QmN-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   dbfc29e2be8d36d0159dc4337c7362bf51c8da9f
commit: e9eee24ece46539c4412ead656822a5bf6d12aa7 [11/15] tick/sched: Consolidate fetching idle time
config: csky-randconfig-002-20260112 (https://download.01.org/0day-ci/archive/20260112/202601122333.n1Vk7QmN-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601122333.n1Vk7QmN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601122333.n1Vk7QmN-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/csky/kernel/asm-offsets.c:6:
   include/linux/kernel_stat.h: In function 'kcpustat_cpu_fetch':
>> include/linux/kernel_stat.h:164:2: error: implicit declaration of function 'kcpustat_fetch_default'; did you mean 'kcpustat_cpu_fetch_default'? [-Werror=implicit-function-declaration]
     164 |  kcpustat_fetch_default(dst, cpu);
         |  ^~~~~~~~~~~~~~~~~~~~~~
         |  kcpustat_cpu_fetch_default
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:182: arch/csky/kernel/asm-offsets.s] Error 1 shuffle=311714440
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1314: prepare0] Error 2 shuffle=311714440
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=311714440
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=311714440
   make: Target 'prepare' not remade because of errors.


vim +164 include/linux/kernel_stat.h

   161	
   162	static inline void kcpustat_cpu_fetch(struct kernel_cpustat *dst, int cpu)
   163	{
 > 164		kcpustat_fetch_default(dst, cpu);
   165	}
   166	#endif /* !CONFIG_VIRT_CPU_ACCOUNTING_GEN */
   167	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
