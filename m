Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C2C126C03
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 01:28:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783906122; cv=none; b=Yb8mDXUDm8sQUyeavRB15tqbuPBo7xTfuuK3dX1b9BCaamoLGmcD1k/j5E2Tp7ZMsMin1m6i7uDDQzc5KFwLdg+jF8VKRvYy7DhD3urt+gIVsslV6fgciDB6S3n+c3jKXdvNsqh/R2bXdiDELe+KNcT7+s/oNS5rVvR6FG9F3Qw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783906122; c=relaxed/simple;
	bh=6ZYBoLarpmF+DyohU3/AbRutLXWJR0MOM8lWLMvJPZg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dUL5Th0aNiCk9sN+q/Srt2s/svc8qMUjNhrtsJtBerrGXBVLU3DrdiUB3DvrP+4Et68ULWBcCCqO6cQ+Z0OKTDb6ZlokOfsA5BAajS3OxyMw7BqFvk2wfQxyPPBfv7FDo3/e20bXQBcJsO5v4ESj2nTwQ6YwR+t2v4vaheQSqGI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=attOiuAt; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="attOiuAt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783906120; x=1815442120;
  h=date:from:to:cc:subject:message-id;
  bh=6ZYBoLarpmF+DyohU3/AbRutLXWJR0MOM8lWLMvJPZg=;
  b=attOiuAt7/TMbQ0HI+pYhmZiC7+dEp6lx9ewK0QkW26QNs9/6GuNjEkb
   k3H3FazVUnBm/hKdozyK06GMDMDp8RkKNB7RsGGPB28K514KQztjf9jMN
   nYrdVFzLutu6ipNhOJTD5UcrQO7+7OUf43AljE5tS38mXvru+hK0pKDtZ
   2VRBzjaGYnFETQfY3mUJKlFsy0u4aRiX1ngZ7n+2/6POf+JKZKsdR2gmw
   Zr4x/ukawMG5qXQgii/nD7gf+U5X9AhvRTWf5M4oR2ZsgSDAHjdrjQlmp
   azs+qCVHRfixZDMubsTryJPOenJIuut141Km4H/fRbY5w5U03sP73NDig
   A==;
X-CSE-ConnectionGUID: CdoTV5EiSHCzqGMjHF1GAw==
X-CSE-MsgGUID: OI1vgOgNQga3auY19LZUKw==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95881814"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95881814"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2026 18:28:40 -0700
X-CSE-ConnectionGUID: Y06llomAThWPB4+MuHTVEA==
X-CSE-MsgGUID: OuDhpsUYRTu9M431TkXkVw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="254897455"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 12 Jul 2026 18:28:38 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wj5TH-00000000LGP-3vnn;
	Mon, 13 Jul 2026 01:28:35 +0000
Date: Mon, 13 Jul 2026 09:28:27 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tglx-devel:timers/cleanup 3/59]
 arch/arm/include/asm/smp.h:73:43: warning: 'struct completion' declared
 inside parameter list will not be visible outside of this definition or
 declaration
Message-ID: <202607130847.Qldf3HQK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tglx/devel.git timers/cleanup
head:   0ad363c8e014568032d53fe2c7ab288de68373f4
commit: 7685fb5c8fe1aebd1a2202b2267a79d5b6775fd2 [3/59] nodemask: Include find.h instead of random.h
config: arm-randconfig-002-20260713 (https://download.01.org/0day-ci/archive/20260713/202607130847.Qldf3HQK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260713/202607130847.Qldf3HQK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607130847.Qldf3HQK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/smp.h:120,
                    from include/linux/alloc_tag.h:14,
                    from include/linux/percpu.h:5,
                    from include/linux/prandom.h:13,
                    from kernel/sched/sched.h:8,
                    from kernel/sched/rq-offsets.c:5:
>> arch/arm/include/asm/smp.h:73:43: warning: 'struct completion' declared inside parameter list will not be visible outside of this definition or declaration
      73 | extern int register_ipi_completion(struct completion *completion, int cpu);
         |                                           ^~~~~~~~~~
--
   In file included from include/linux/smp.h:120,
                    from include/linux/lockdep.h:14,
                    from include/linux/spinlock.h:63,
                    from include/linux/mmzone.h:8,
                    from include/linux/gfp.h:7,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:9,
                    from include/linux/module.h:18,
                    from arch/arm/kernel/smp.c:7:
>> arch/arm/include/asm/smp.h:73:43: warning: 'struct completion' declared inside parameter list will not be visible outside of this definition or declaration
      73 | extern int register_ipi_completion(struct completion *completion, int cpu);
         |                                           ^~~~~~~~~~
   arch/arm/kernel/smp.c:619:5: error: conflicting types for 'register_ipi_completion'; have 'int(struct completion *, int)'
     619 | int register_ipi_completion(struct completion *completion, int cpu)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
   arch/arm/include/asm/smp.h:73:12: note: previous declaration of 'register_ipi_completion' with type 'int(struct completion *, int)'
      73 | extern int register_ipi_completion(struct completion *completion, int cpu);
         |            ^~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/smp.h:120,
                    from include/linux/alloc_tag.h:14,
                    from include/linux/percpu.h:5,
                    from include/linux/prandom.h:13,
                    from kernel/sched/sched.h:8,
                    from kernel/sched/rq-offsets.c:5:
>> arch/arm/include/asm/smp.h:73:43: warning: 'struct completion' declared inside parameter list will not be visible outside of this definition or declaration
      73 | extern int register_ipi_completion(struct completion *completion, int cpu);
         |                                           ^~~~~~~~~~


vim +73 arch/arm/include/asm/smp.h

f6dd9fa5a75a3d include/asm-arm/smp.h      Jens Axboe    2008-06-10  72  
5135d875e1457e arch/arm/include/asm/smp.h Nicolas Pitre 2012-11-27 @73  extern int register_ipi_completion(struct completion *completion, int cpu);
5135d875e1457e arch/arm/include/asm/smp.h Nicolas Pitre 2012-11-27  74  

:::::: The code at line 73 was first introduced by commit
:::::: 5135d875e1457ef946a055003d8f80713e862135 ARM: SMP: basic IPI triggered completion support

:::::: TO: Nicolas Pitre <nicolas.pitre@linaro.org>
:::::: CC: Nicolas Pitre <nicolas.pitre@linaro.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
