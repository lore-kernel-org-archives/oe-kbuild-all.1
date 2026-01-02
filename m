Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F011276051
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Jan 2026 12:04:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767355452; cv=none; b=omoHhxUOD6rfSuW8F3MJtA1A2QFUTzWo2T01kyWGf+9OK1UN6NXEKi+hrwvB94Hk0UsxkIKrpdK7hDD5onsQRCjpq0ftiRGSOHRAUbTATzbif/HP38wyHyhVn7kyb07vqFALbmVZCWZX+t3uX4nNYOjECOg/9ryaj+CWF0HFhSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767355452; c=relaxed/simple;
	bh=+xbuQMoZvPzz5JRnhuI7hYv3b2p5EmOcn32+utuvhBY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=bFH9hBVfjmjpkFfztY0bwQ+sbvgGS3cr8pwDvRT+qB+yyAHIi0q+Yj8nxrjWOP7lfmUA3MhzOmRFEDeXx3NR14AGvDp2Obj9kMLxVWfNDByGP4g1n43CBdbR1npxEflnFsS4yVKodlWTxeTok9grBmaR2uoTd/U8mfRgPjyNxIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GGDPFKlu; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GGDPFKlu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767355451; x=1798891451;
  h=date:from:to:cc:subject:message-id;
  bh=+xbuQMoZvPzz5JRnhuI7hYv3b2p5EmOcn32+utuvhBY=;
  b=GGDPFKlumrzDqch2BSrEJhy9HzLV4KkIR6YzuxipCdVCqXANdQA/dHLe
   CtUVDqYliM8jQUMHRkl3Xa3nRpdZzazcWe8EzFpsKd1SuH2V+edtebVNK
   BFVwAqpuzhzu3C913Xn5qRMGNSAuBoJAHNZYSZzgjuBG1BnW/+ZFiGzIy
   qO6JFLfuuMFf1mouV2AtmTa9WkR6d8YGWxsMK1zZsnA0F/qXnScxb+4pc
   4gLiMYWwW52nn80bbDxNfe0PaMmqxpi5ERcBkPAYg4qVYFNAgFU5ddA0N
   QgmoIfju054IQnpAnsSs1MEUzKGWq4pQG/H9g4P3kpl4wr+Q9sqn7WkqF
   Q==;
X-CSE-ConnectionGUID: M8FGJ5pETTKloCerqdI6pw==
X-CSE-MsgGUID: GbDt5JzpSAiWovVK24hwuw==
X-IronPort-AV: E=McAfee;i="6800,10657,11658"; a="68892118"
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="68892118"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jan 2026 04:04:08 -0800
X-CSE-ConnectionGUID: NZfVwFcyRMyeAGvRg/C3Ww==
X-CSE-MsgGUID: O7cHvZOZTg6GdEczdyfmiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,197,1763452800"; 
   d="scan'208";a="206853973"
Received: from igk-lkp-server01.igk.intel.com (HELO 92b2e8bd97aa) ([10.211.93.152])
  by orviesa005.jf.intel.com with ESMTP; 02 Jan 2026 04:04:06 -0800
Received: from kbuild by 92b2e8bd97aa with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vbdsy-000000000Qj-0B1D;
	Fri, 02 Jan 2026 12:04:04 +0000
Date: Fri, 02 Jan 2026 13:03:29 +0100
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:timers/core 8/10]
 ./include/linux/kernel_stat.h:164:9: error: implicit declaration of function
 'kcpustat_fetch_default'; did you mean 'kcpustat_cpu_fetch_default'?
Message-ID: <202601021300.Z39hHzud-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git timers/core
head:   e2e8796db56999913bd1cf839e933af6e5d5b23e
commit: fddf01afd946b39d896ba8c2f53ee285379bd606 [8/10] tick/sched: Consolidate fetching idle time
config: riscv-allnoconfig-bpf (https://download.01.org/0day-ci/archive/20260102/202601021300.Z39hHzud-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260102/202601021300.Z39hHzud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601021300.Z39hHzud-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from ./include/linux/cgroup.h:27,
                    from ./include/linux/memcontrol.h:13,
                    from ./include/linux/swap.h:9,
                    from ./include/linux/suspend.h:5,
                    from arch/riscv/kernel/asm-offsets.c:12:
   ./include/linux/kernel_stat.h: In function 'kcpustat_cpu_fetch':
>> ./include/linux/kernel_stat.h:164:9: error: implicit declaration of function 'kcpustat_fetch_default'; did you mean 'kcpustat_cpu_fetch_default'? [-Wimplicit-function-declaration]
     164 |         kcpustat_fetch_default(dst, cpu);
         |         ^~~~~~~~~~~~~~~~~~~~~~
         |         kcpustat_cpu_fetch_default


vim +164 ./include/linux/kernel_stat.h

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
