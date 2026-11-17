Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794923039;
	b=v4/qHa7qW/4viiBLkztaDtM7k1r/0NGOkPAyYJrENBAv/t1vZX62qL84/EIW2z2Q8KzG
	 NUXMXM6S8xjL/TiZnsNZozKfV+pgL0H2kkpbjiCGejpbR0ZwIdtBLhp2t24TiKyct7l0+
	 NTk7fyLe4fFZP1UzonumibaAJ6x6qjGYgEU6BwB95Ma+LT+abFmcfHZtWsy0gpDZPVj9Z
	 uXTDpuMi9DFb5LkJbmXLKanLO2ZrGEQxsXBMM1NIyrexAEpqdmwGpfWYiW8Lhexy2yAXS
	 xensNk6RUrHIeiTbcEZWvKrNjb6znI1BQ8gNYo9rEwpzGL34RbBj0vPUkO3AYjvFoww==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794923039;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Nikym/xtbO8nakcYNAFwfMjxFzpoNEswwp6jzC9yeMA=;
	b=PrUrPI4cUGCAAdMcjmMOizrRxr92Jm7CKMWvo3Kkf2N9mPARDKmVvRAldn/4qfeZGxSa
	 hP6OglSRnwTtpdLrvCazXFtOTnGXKYb/lbNNMOcM8SXtZXsIeXe2mkEtiNciuUbPzRjpW
	 6Nvg+UOrUjthjA9bEBfiyVIIXxdfV9tcQwMlpRBYgSCi+qtLzMTvPRDerj87nwGM5Gzlv
	 GnzQXQougX3X7eK+QcH4Cfy0vPlUhitSidqUqGDQ7LsISRTIh0OsToU9qAP6RfBEydnbv
	 CjbhySKr/MenCS2ai7RU0sJ+HgnLK9vYuY4BysljtWkF0RL10OhOml5SG4bYfu3wCCA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bdlorhpf;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0A75606A330
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 13:43:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E0A75606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=Bdlorhpf
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794923039; x=1826459039;
  h=date:from:to:cc:subject:message-id;
  bh=FgdiXa9meEz60jXKwgts7A4VejKjlIwcrNi/C7xowUY=;
  b=Bdlorhpf40pFcZrRIbnPCU1QIOd/TjefVNOhYraT+IfHnnC+rq8ps77Q
   Hf/GCnWmjf4NBNlpJWBuUlofljKQ8VMFFAajiSN64D8Wi5PUspUrOnMyU
   +ERuEWTxuMLS9/ZNtp3252rruzXFmzfzzx7Y519KOBxV9xD5uKO4i0iD3
   lS6pXtd6mUmUXUncKAyyVLCeSfvTwaCRcHLG47hYXsVEIrUr5IocPQL7d
   Mij4hDVbDWAy+qHIZq4nx+AwxWKWfqd7tgYUjij3+nYyLDpf8ke7Buvav
   Cc29Ujg96v7qriUnPOLzTavR4DMaDaq67u5PGfhVXX4yOaFrjdyITqLzL
   A==;
X-CSE-ConnectionGUID: 6cg+KS91R0y59Bi+vCMo+Q==
X-CSE-MsgGUID: B4lzwArDTDqfK29wBdBWvA==
X-IronPort-AV: E=McAfee;i="6800,10657,11969"; a="3682363"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3682363"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Nov 2026 05:43:59 -0800
X-CSE-ConnectionGUID: T97P3l3xRseWgMYD+Js+tA==
X-CSE-MsgGUID: V6qeJBqaRlyNlvozJtperA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9625289"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Nov 2026 05:43:57 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTJTW-00000001BfR-0Sog;
	Tue, 17 Nov 2026 13:43:54 +0000
Date: Tue, 17 Nov 2026 21:43:00 +0800
From: kernel test robot <lkp@intel.com>
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
 Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Subject: [avpatel:riscv_sbi_watchdog_v2 103/107]
 include/linux/perf/riscv_pmu.h:155:45: error: parameter name omitted
Message-ID: <202611172025.29lEFEZM-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_sbi_watchdog_v2
head:   7f56a7ea58afdb6108010879b63f273cdcc5cc1c
commit: 2349538e3c00b86762e404237a8bc2e0828e1bb9 [103/107] riscv: pmu: Add driver for Control Transfer Records Ext
config: riscv-randconfig-1000-20261117 (https://download.01.org/0day-ci/archive/20261117/202611172025.29lEFEZM-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611172025.29lEFEZM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611172025.29lEFEZM-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/kvm_vcpu_pmu.h:12,
                    from arch/riscv/include/asm/kvm_host.h:27,
                    from arch/riscv/kernel/asm-offsets.c:13:
   include/linux/perf/riscv_pmu.h:153:49: warning: 'struct cpu_hw_events' declared inside parameter list will not be visible outside of this definition or declaration
    static inline void riscv_pmu_ctr_consume(struct cpu_hw_events *cpuc,
                                                    ^~~~~~~~~~~~~
   include/linux/perf/riscv_pmu.h: In function 'riscv_pmu_ctr_sched_task':
>> include/linux/perf/riscv_pmu.h:155:45: error: parameter name omitted
    static inline void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *,
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/riscv_pmu.h: At top level:
   include/linux/perf/riscv_pmu.h:163:45: warning: 'struct riscv_pmu' declared inside parameter list will not be visible outside of this definition or declaration
    static inline int riscv_pmu_ctr_init(struct riscv_pmu *riscv_pmu) { return 0; }
                                                ^~~~~~~~~
   include/linux/perf/riscv_pmu.h:164:48: warning: 'struct riscv_pmu' declared inside parameter list will not be visible outside of this definition or declaration
    static inline void riscv_pmu_ctr_finish(struct riscv_pmu *riscv_pmu) { }
                                                   ^~~~~~~~~
   include/linux/perf/riscv_pmu.h:158:13: warning: 'riscv_pmu_ctr_del' defined but not used [-Wunused-function]
    static void riscv_pmu_ctr_del(struct perf_event *event) { }
                ^~~~~~~~~~~~~~~~~
   include/linux/perf/riscv_pmu.h:157:13: warning: 'riscv_pmu_ctr_add' defined but not used [-Wunused-function]
    static void riscv_pmu_ctr_add(struct perf_event *event) { }
                ^~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:185: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=2228139241
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1417: prepare0] Error 2 shuffle=2228139241
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2228139241
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2228139241
   make: Target 'prepare' not remade because of errors.


vim +155 include/linux/perf/riscv_pmu.h

   151	
   152	static inline bool riscv_pmu_ctr_valid(struct perf_event *event) { return false; }
 > 153	static inline void riscv_pmu_ctr_consume(struct cpu_hw_events *cpuc,
   154						 struct perf_event *event) { }
 > 155	static inline void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *,
   156						    struct task_struct *task, bool sched_in) { }
   157	static void riscv_pmu_ctr_add(struct perf_event *event) { }
   158	static void riscv_pmu_ctr_del(struct perf_event *event) { }
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
