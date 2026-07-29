Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03A8C451981
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Jul 2026 18:41:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785350520; cv=none; b=JhhbuvvVOvAluXdG8TZRrTb3Z+Mpphxm4Bj7UE9sETBpoE9bhCezL8F5QM7CVWXW1nVqWSy+EJ4PH2kGMP8HSdO43FlYWCwyMIucma0P5+DgYzmpttxrEZduYNnyyQGDbdzTJLlWJvjX7QHeOzyI1VdCLhhqmq0Ugt9Ex0v89UA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785350520; c=relaxed/simple;
	bh=zcmvXRUpLBw/DPlWfQzUpWolMKLHa5Rl3rwPj3Pf3JI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=TjfVGfEW5ELOZxPK9JW8A1sKjUuJJTadPJcunMXoMiLv02FV+hdtDp0vCEfLagArS8s+E0P5sS7Fb/gw+6OHoXRWs65RQLeOWliWA/WBIcMfv+PGuF9a9uHS1VGgtMz+t7idYP0MeCV00AePvDQg+Ii6MlgMx9nS3E1MCkkbYX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6aSXnHw; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6aSXnHw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785350518; x=1816886518;
  h=date:from:to:cc:subject:message-id;
  bh=zcmvXRUpLBw/DPlWfQzUpWolMKLHa5Rl3rwPj3Pf3JI=;
  b=D6aSXnHwziug0fB8Lvdm4KtxCugN7l89kuXNjejlwpVF7Y8lkIgJLnEn
   fe7e49xeJdorgd1Q6A4dym5l7vK2J1BTD+/bg4bPhtAVqlEzN0v0Cjz5v
   Hn9bdzhj8CCewCTJvQ6nn3TrP/3oKZMR0EA3y32l2Hin83+wxD6tC7DZf
   9wmMZngGafN5u3Gv2chLP+VNLNgsjIwSNthtadncSlN2MxmxnRsL5+4dw
   0uRWm+OKNbTYP+arVFryZ8YY8BVrdrjJyRtjxsx6o9bmtwLLAxM7U0VaD
   dYH9YM0TbWfNsmiZ2rohq3pct2pTVzXanyGpIfCHTd+OcqOhRlZZidOb4
   A==;
X-CSE-ConnectionGUID: K4p+NbHNRXinyUgpT5cLrw==
X-CSE-MsgGUID: Zc4UpkrxRhS+uj4TwqHmdg==
X-IronPort-AV: E=McAfee;i="6800,10657,11859"; a="85839533"
X-IronPort-AV: E=Sophos;i="6.25,193,1779174000"; 
   d="scan'208";a="85839533"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2026 11:41:57 -0700
X-CSE-ConnectionGUID: CF0nzAt7QWCltnafQqUUUA==
X-CSE-MsgGUID: oL4zXCFPQEqJgeEvFptOSg==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 Jul 2026 11:41:56 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wp9BL-00000000fat-1rAB;
	Wed, 29 Jul 2026 18:39:29 +0000
Date: Thu, 30 Jul 2026 02:28:06 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-perf:overflow-stack 10/13]
 arch/arm64/kernel/smp.c:450:23: sparse: sparse: cast removes address space
 '__percpu' of expression
Message-ID: <202607300238.usJyacKw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git overflow-stack
head:   7c0748c59a858f301fc801a9818ea1c11ff88ff0
commit: d017f75e2f157a38b824c8f4253f07fac65622eb [10/13] arm64: entry: Point SP_EL0 at the overflow stack
config: arm64-randconfig-r111-20260729 (https://download.01.org/0day-ci/archive/20260730/202607300238.usJyacKw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260730/202607300238.usJyacKw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607300238.usJyacKw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/smp.c:450:23: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +450 arch/arm64/kernel/smp.c

   447	
   448	static void __init set_boot_cpu_offset(void)
   449	{
 > 450		u64 ovf_sp = (u64)overflow_stack + OVERFLOW_STACK_SIZE;
   451	
   452		asm volatile(
   453		"	msr	tpidr_el1, %1\n"
   454		"	add	%0, %0, %1\n"
   455		"	msr	sp_el0, %0" /* Update the overflow stack pointer */
   456		: "+r" (ovf_sp)
   457		: "r" (per_cpu_offset(0))
   458		: "memory");
   459	}
   460	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
