Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794160753;
	b=tFXwfaemF0dv1k5Q8+YomHtoXNcypCuL3rFHJWgTzXoyCcQP1wLfygE4NZjruO0bl+Ev
	 PyOplaCiFC9rVT1u8mtYNPOgRxeDcRnzk1Ihk+81tYSovviQnqs1SovPldhpYCU9KEzcL
	 jv3fOTiGtkSxvPkO3k1Q7cPrX3KlnpBQlnkXB4dgBXE03SRyTMUPFY3GTLxwjJKr3LpqP
	 8mNMKBuwOCsEW6U2fV+59qZ6FjMWvqDQ8xVcOCGQf+h4hzSnw9nelLScWcLL+VIar1klH
	 Uu0bVhtL+9o5QBpuRcKX9fK2Vyt229dOQU4sZnPY+HRLqw53ye8KuNIDA2GpRshYNaA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794160753;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=crP0AGJnxEEVfhJ/YIRmkNxLLASLK5FubT+mvGFc4oI=;
	b=Ki8Ie3SYZx8QITHXdpdJE9z54ag5I4o82S2A0iFZgY8ytYFizKBIzn0Z+5YyxOJTvRmr
	 mZQ4EukNU2XgP1TtKUTGJjfNb874b64IsPwEH+svxaCakWDGorab49ZfdoqwME8s3U7xN
	 A+nSeUezl7qwHXXrJTtdXr38+8Gkxfdzoqx7HLmahCeF4Y7ckiO4H5+MXmfjeVWOv5Dnl
	 JdPNzZ+0lEW7yUYpVF54vzdESF7YDv1UAcz15gtX8BX09X8qpat+a/Lh7nY72X+iZZR5W
	 AzxthQ6RZFE6Bmfk9y65M2luPp3mYPC8DwTSszI0+JV35SGMoem7T18uLEj3DXnNRHQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O0PptemJ;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7731B606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 17:59:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7731B606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=O0PptemJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794160753; x=1825696753;
  h=date:from:to:cc:subject:message-id;
  bh=JrQx1cE5PWD8y8YsjQnX+dUSpEJ8YUYJEFoySkSc5t8=;
  b=O0PptemJ8+wZbkKOsHBXRsoaH2YmArApRyvittj8dFBFKrKhLhPAfOMy
   gL0Dnl6VrCYc6OWtBm8l2WKeLiTeYrsCXDJySvJAGgA/rAMUScD5i5kD6
   3qZSQvIiYIvIqQk08OXM16maleh9n2uLEZCUQrLVGORzRH/KRVyfrDQqQ
   xTirHtzzxIdCw4t0we3zFCNj8S6ahDAsleH4/i/qgY9mxwkUIlytG4Gsz
   OdedG5LEqTD/pOcWjjPRi9XJQ2EDoOHaIb2gD2la0KDApAnEL8l8LtI6P
   dLDnIDA/W9xqxbsGTdeNlNfjtwGpQmin7ihhU1+3ZGlwiRmfOrqks9HOe
   g==;
X-CSE-ConnectionGUID: u9HHimNJQ8mWNAkI0AqW8A==
X-CSE-MsgGUID: 7o8vhZCBRq+prHmENklk6Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2927449"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2927449"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 09:59:12 -0800
X-CSE-ConnectionGUID: isZmnZEnT6+HxtGo7gAJbw==
X-CSE-MsgGUID: Z01wbix7QcO7nruMW9J1Cw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7862003"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Nov 2026 09:59:10 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ7AZ-00000000tET-2BZa;
	Sun, 08 Nov 2026 17:59:07 +0000
Date: Mon, 09 Nov 2026 01:58:46 +0800
From: kernel test robot <lkp@intel.com>
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
 Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Subject: [avpatel:riscv_sbi_watchdog_v1 94/98]
 include/linux/perf/riscv_pmu.h:155:45: error: parameter name omitted
Message-ID: <202611090109.rvVV8Dto-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_sbi_watchdog_v1
head:   929bf13433e242a3f255f463b2fb44633e102e0d
commit: b4cc5b9ca0cada8221e31b647640bbae515000a1 [94/98] riscv: pmu: Add driver for Control Transfer Records Ext
config: riscv-randconfig-1000-20261109 (https://download.01.org/0day-ci/archive/20261109/202611090109.rvVV8Dto-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090109.rvVV8Dto-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611090109.rvVV8Dto-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/kvm_vcpu_pmu.h:12,
                    from arch/riscv/include/asm/kvm_host.h:27,
                    from arch/riscv/kernel/asm-offsets.c:13:
   include/linux/perf/riscv_pmu.h: In function 'riscv_pmu_ctr_sched_task':
>> include/linux/perf/riscv_pmu.h:155:45: error: parameter name omitted
    static inline void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *,
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   At top level:
>> include/linux/perf/riscv_pmu.h:158:13: warning: 'riscv_pmu_ctr_del' defined but not used [-Wunused-function]
    static void riscv_pmu_ctr_del(struct perf_event *event) { }
                ^~~~~~~~~~~~~~~~~
>> include/linux/perf/riscv_pmu.h:157:13: warning: 'riscv_pmu_ctr_add' defined but not used [-Wunused-function]
    static void riscv_pmu_ctr_add(struct perf_event *event) { }
                ^~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:185: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=1387635060
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1417: prepare0] Error 2 shuffle=1387635060
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=1387635060
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=1387635060
   make: Target 'prepare' not remade because of errors.


vim +155 include/linux/perf/riscv_pmu.h

   151	
   152	static inline bool riscv_pmu_ctr_valid(struct perf_event *event) { return false; }
   153	static inline void riscv_pmu_ctr_consume(struct cpu_hw_events *cpuc,
   154						 struct perf_event *event) { }
 > 155	static inline void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *,
   156						    struct task_struct *task, bool sched_in) { }
 > 157	static void riscv_pmu_ctr_add(struct perf_event *event) { }
 > 158	static void riscv_pmu_ctr_del(struct perf_event *event) { }
   159	static inline void riscv_pmu_ctr_enable(struct perf_event *event) { }
   160	static inline void riscv_pmu_ctr_disable(struct perf_event *event) { }
   161	static inline void riscv_pmu_ctr_dying_cpu(void) { }
   162	static inline void riscv_pmu_ctr_starting_cpu(void) { }
   163	static inline int riscv_pmu_ctr_init(struct riscv_pmu *riscv_pmu) { return 0; }
   164	static inline void riscv_pmu_ctr_finish(struct riscv_pmu *riscv_pmu) { }
   165	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
