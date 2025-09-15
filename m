Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8C0C17A303
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Sep 2025 00:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757895741; cv=none; b=uO+c6KdBa1uaXEaaVzf8kXO9asfd79RQoW2xO86+2OFRw3jH0Vwz0kw4Zg1fhnQly9eOJXmS1gVM6gj9njkjCN4ogL8KbCwOPjKNJGb3IUEV0IZxGXGLNmfwsRjDh4Du+eNQY7DfX65iBLb3sRhS76u2dXON3hH52eNpWXzLQGI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757895741; c=relaxed/simple;
	bh=gJkSQYxOXWu0k2KJiuOVXO5kgH5MayDdvjvPAtGHGYM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p5Nv9PhOga/uLTLYquiPtaqnhiws7LDqAvAf9xLGixgZuA7yHh+U6Fhp2yAek08BDkt1K8ovZhujnNYJCrSOJk6Ka0i81wSQ0FlMUCB7zkE7hcKawZBsivUkBcTELJ+UcA5T7yeRG98YC/YvhaSvKymMGlkmuJf8QAe33A0sWow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JWg6BA7U; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JWg6BA7U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757895740; x=1789431740;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gJkSQYxOXWu0k2KJiuOVXO5kgH5MayDdvjvPAtGHGYM=;
  b=JWg6BA7UboyzQL9m1GMld+VWmbRSc5CfyzdxDhqXHgzF13euKPhxeQyQ
   oyP+ReLLskTH+OsHYdvcDTP2I5/SXrKrmN84LcWasQ2pp79k4LYGUq+Vv
   Oan7vRdmGlRrUHEH+fW7HMGmejh3qDOPj7PJs4k+Wkj7IgsY9NE8fYC5o
   HufulvkOGNjTuJD6lzUJpQLJ4WqjAx+/R4n2Y//gWAA9UjtkSiXzBAbB9
   bRM6jY7jqtqTC8RIvj/uSPHWRaPDYkrsuI9V23WlVmbpAQBvbIXofYr3M
   dLO7s1fi41LBUijkn1yOiAChX3ok82FcpG5OiKR99vaHajUf8xQf/r1m3
   w==;
X-CSE-ConnectionGUID: KfXb5r1FS02RWJcJDq2PTQ==
X-CSE-MsgGUID: 7dTiEikKQCmqdwgKXQZ+nA==
X-IronPort-AV: E=McAfee;i="6800,10657,11553"; a="60251936"
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="60251936"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Sep 2025 17:22:19 -0700
X-CSE-ConnectionGUID: H4K4DE/5R4WuP3WF+ZS+CA==
X-CSE-MsgGUID: eoQFNU4cQfqxFcJGZx4+RA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,265,1751266800"; 
   d="scan'208";a="174549673"
Received: from lkp-server02.sh.intel.com (HELO eb5fdfb2a9b7) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 14 Sep 2025 17:22:18 -0700
Received: from kbuild by eb5fdfb2a9b7 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uxwyw-0002pI-0B;
	Mon, 15 Sep 2025 00:22:11 +0000
Date: Mon, 15 Sep 2025 08:21:29 +0800
From: kernel test robot <lkp@intel.com>
To: Will Deacon <will@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Marc Zyngier <maz@kernel.org>
Subject: [arm-platforms:irq/ppi-affinity 18/25] drivers/perf/arm_pmu.c:68:35:
 sparse: sparse: cast removes address space '__percpu' of expression
Message-ID: <202509150852.4ziBllm5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git irq/ppi-affinity
head:   136dedfe26e7de871029de6ed7dcf555e840fadc
commit: 49964285d3074f0494d8f09dce6e120d623b7843 [18/25] perf: arm_pmu: Request specific affinities for percpu NMI/IRQ
config: arm-randconfig-r132-20250915 (https://download.01.org/0day-ci/archive/20250915/202509150852.4ziBllm5-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 21857ae337e0892a5522b6e7337899caa61de2a6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250915/202509150852.4ziBllm5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509150852.4ziBllm5-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/perf/arm_pmu.c:68:35: sparse: sparse: cast removes address space '__percpu' of expression
>> drivers/perf/arm_pmu.c:68:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got void ** @@
   drivers/perf/arm_pmu.c:68:35: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/perf/arm_pmu.c:68:35: sparse:     got void **
>> drivers/perf/arm_pmu.c:68:35: sparse: sparse: cast removes address space '__percpu' of expression
>> drivers/perf/arm_pmu.c:68:35: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/perf/arm_pmu.c:95:35: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/perf/arm_pmu.c:95:35: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got void ** @@
   drivers/perf/arm_pmu.c:95:35: sparse:     expected void const [noderef] __percpu *__vpp_verify
   drivers/perf/arm_pmu.c:95:35: sparse:     got void **
   drivers/perf/arm_pmu.c:95:35: sparse: sparse: cast removes address space '__percpu' of expression
   drivers/perf/arm_pmu.c:95:35: sparse: sparse: cast removes address space '__percpu' of expression

vim +/__percpu +68 drivers/perf/arm_pmu.c

    64	
    65	static void armpmu_free_percpu_pmuirq(unsigned int irq, int cpu,
    66					   void __percpu *devid)
    67	{
  > 68		struct arm_pmu *armpmu = *per_cpu_ptr((void **)devid, cpu);
    69	
    70		if (armpmu_count_irq_users(&armpmu->supported_cpus, irq) == 1)
    71			free_percpu_irq(irq, devid);
    72	}
    73	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
