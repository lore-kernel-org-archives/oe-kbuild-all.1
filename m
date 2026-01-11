Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6AD912DB7B6
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Jan 2026 23:54:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768175667; cv=none; b=uwQrVP+r8HfxP4277IvlwnVIIGr6oFqmnffCdHy7RJzjP17vgCoSNA9l3OVJPbEIDSEVMZn87KLcuoPSEscrXMg00GBlwv1/AJGa+1r9CwFEffB16iSRXrZyRJ3JVTjskKejbOTekY3y6rUTqZ/ksnB0nshMdoE9Vo4ULHntY9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768175667; c=relaxed/simple;
	bh=bM7ul9eph4WTRbOwiK6rmSwM6rglbWk1cWCvNsH2JbA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=a9YYFQ8ygYnhmFwen0y8orXh7XyjyQjFkM1knj8K2VNWnz9LTAs4e1GPcKVKk+ZyTX9EqYwmIrneTDLp1eJpwNl7+A3m2/vD5qGgmXLF+W5qagCuPN8IWb+sbLGHf+bp997LASKLZN6IGxZJs5hJaOTMs5IrRos1V5FcJWoNmAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CPY42y/x; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CPY42y/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768175665; x=1799711665;
  h=date:from:to:cc:subject:message-id;
  bh=bM7ul9eph4WTRbOwiK6rmSwM6rglbWk1cWCvNsH2JbA=;
  b=CPY42y/xdR4fg9Fi/8Ev4h87AFotwZWvDE9q6TI777G+sqPXuvMc4N+U
   4L07mKVrdpcE8lmCBFvxAUVY3Bxyq7l8xSUYBHBEqLfK5Ofhs5THA9TaT
   P6q6pxtwIK4riq71j2MbCaIgdXdj3M61ftnvWePCBSiNw0MX+PjOpWdOZ
   Tftx7oEkwzwBbvKVHv9gRlFOo6+kGR0rGPYLihsbFvNA3qanQflNH+CFe
   HCCZVAr4qwOQFcQikAIycjyxzW/vqz2kJ1BnYBZBG6ZIbyy30rZt8VNzE
   hfdKHzbMclXDGsK9J5fgh0EU7haeceVsaiKQxgE0SUFKIkoMWFVHuxU3N
   w==;
X-CSE-ConnectionGUID: uUrKWIVyS0K5Ej2b1F3LPA==
X-CSE-MsgGUID: A1TDz6f3QdyDv4rqthOA1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11668"; a="79746959"
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="79746959"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2026 15:54:21 -0800
X-CSE-ConnectionGUID: bR5soxUMSryqHC40eSdOzA==
X-CSE-MsgGUID: MjO1t50VSUWTSECFV9I2eg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,219,1763452800"; 
   d="scan'208";a="234654236"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jan 2026 15:54:20 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vf5GD-00000000Cmq-24ki;
	Sun, 11 Jan 2026 23:54:17 +0000
Date: Mon, 12 Jan 2026 07:53:48 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 13/15]
 kernel/sched/cputime.c:481:72: error: implicit declaration of function
 'vtime_enabled_this_cpu'; did you mean 'vtime_generic_enabled_this_cpu'?
Message-ID: <202601120712.tHOUbhUe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   dbfc29e2be8d36d0159dc4337c7362bf51c8da9f
commit: 68fe31b4f141a343ee788815606d24da6609cb86 [13/15] sched/cputime: Handle idle irqtime gracefully
config: powerpc-randconfig-r071-20260112 (https://download.01.org/0day-ci/archive/20260112/202601120712.tHOUbhUe-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.4.0
smatch version: v0.5.0-8985-g2614ff1a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260112/202601120712.tHOUbhUe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601120712.tHOUbhUe-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:57:
   kernel/sched/cputime.c: In function 'kcpustat_irq_enter':
>> kernel/sched/cputime.c:481:72: error: implicit declaration of function 'vtime_enabled_this_cpu'; did you mean 'vtime_generic_enabled_this_cpu'? [-Werror=implicit-function-declaration]
     481 |         if (!vtime_generic_enabled_this_cpu() && (irqtime_enabled() || vtime_enabled_this_cpu()))
         |                                                                        ^~~~~~~~~~~~~~~~~~~~~~
         |                                                                        vtime_generic_enabled_this_cpu
   cc1: some warnings being treated as errors


vim +481 kernel/sched/cputime.c

   476	
   477	void kcpustat_irq_enter(ktime_t now)
   478	{
   479		struct kernel_cpustat *kc = kcpustat_this_cpu;
   480	
 > 481		if (!vtime_generic_enabled_this_cpu() && (irqtime_enabled() || vtime_enabled_this_cpu()))
   482			kcpustat_idle_stop(kc, now);
   483	}
   484	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
