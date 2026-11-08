Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794157095;
	b=kmgrAifqkPcKEY3S0cXeC0WERYEi5h/a4bB/Sxpe5pRPMD/U1tgwbM7sHGdh5QRJytmX
	 8qpHfN21yieY32tZucJkKNahAqPRz18/Sj3uSABghq9AcdB33eQSADco7tAis7wi6Jk50
	 kp3wiLy20PI5vt2i1SmQlO2k63k0wdxjl5kWTf4BuVdoO5ZdJhw6/7lFp13wdvu4dd/xM
	 6bSwGeZxg2Wg3pJHj0bA+u+FYCq2uEdgV6icrB71bePXMgiok4DqJQy9kD6g9nl9KPZAu
	 vsDr/bBGme9bUHOR/9uAE1jzAz4C8C+8wllJlv3+BJH4oZz8G+fwyZ2maTMM4jBnyZg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794157095;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=bDAsNNkaCHbKqlZddsh7HAAsR1v85k850P13VQ4cR6o=;
	b=bscSzNfkj9Lzpklap55uUf3C/f9mlxr9ie6S/re5+hC531HSjlmi8TzBcYz3zfb2yyKJ
	 DFHFHHBE2Yqlqg32OxUDnKnlhIfaL9FFG7E0CL1Cf8hnoCljIdRxsEiL4Vh/h6r2aKJvj
	 V4yNVmYrvi9X8sSAT4iSOR/HvAonBHountdWTuKmZlN92q1f/Obv2PgsCOxNaYNeoPv0M
	 7aZ2FU/6U7vtC7XH55PDZp4//3xKJodfTg7Ryx55+UH5vlyXKgTFVhF1tLV0K0hr/fE7G
	 lVkMNK45J0R2ogWb1n+T4JeWnxtYYpDd3B7/ndV1jlnA/DtrHdFPgEO4Djzr35ABIbg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m5gloC6F;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A32FB606A320
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 16:58:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A32FB606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=m5gloC6F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794157093; x=1825693093;
  h=date:from:to:cc:subject:message-id;
  bh=bY01hDl+2ZxpRHdcIEH9jxniRYKwGeWE1vcmls4x9zk=;
  b=m5gloC6FTJwd/SY45tz/FTGrjqtZhvubRFiMphNqlyBXch3QxLyfShq0
   DjLiDwqcz0NpIdZZ80rjFuRDJb9Ao+BY8B4QDBJVW1172ZsZEPJnPCjCK
   tt/mB9J3KBuOlHoUvQJD2LZ8rmg7rWGKV6aRvw2OVlVRBfXtqxWx2sYeA
   jFX+yNm8F/4Kov9u3GbZRSTmjouxI4ApWze+Vq9UJg7S8ONL4zjnpG4R1
   xC/lFRjAWgRoYX9r9OKuWu0hajqbzpsHq+8TqayrERegEbZ6lMbZzbrFX
   GwBZtFpLEzhlUZCc0rvgjLpOq6mezRGClD0smM4xWWdZGZAnPszu7HwiS
   A==;
X-CSE-ConnectionGUID: +90u0HE4RTGXarO7G2jGNA==
X-CSE-MsgGUID: M7weqZFKR3q5uh1uXwHpkw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2913065"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2913065"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 08:58:13 -0800
X-CSE-ConnectionGUID: 2l9E10tgTFSl7naCg2HrKw==
X-CSE-MsgGUID: T6+ftLVEQJaBMadzOCCLkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="9558176"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 08 Nov 2026 08:58:11 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ6DW-00000000Bc9-3ag9;
	Sun, 08 Nov 2026 16:58:06 +0000
Date: Sun, 08 Nov 2026 17:57:37 +0100
From: kernel test robot <lkp@intel.com>
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
 Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Subject: [avpatel:riscv_sbi_watchdog_v1 94/98]
 include/linux/perf/riscv_pmu.h:155:45: error: parameter name omitted
Message-ID: <202611081712.Y6IZfpHw-lkp@intel.com>
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
config: riscv-randconfig-r2106-20261108 (https://download.01.org/0day-ci/archive/20261108/202611081712.Y6IZfpHw-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081712.Y6IZfpHw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611081712.Y6IZfpHw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/kvm_vcpu_pmu.h:12,
                    from arch/riscv/include/asm/kvm_host.h:27,
                    from arch/riscv/kernel/asm-offsets.c:13:
   include/linux/perf/riscv_pmu.h: In function 'riscv_pmu_ctr_sched_task':
>> include/linux/perf/riscv_pmu.h:155:45: error: parameter name omitted
     155 | static inline void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *,
         |                                             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   At top level:
>> include/linux/perf/riscv_pmu.h:158:13: warning: 'riscv_pmu_ctr_del' defined but not used [-Wunused-function]
     158 | static void riscv_pmu_ctr_del(struct perf_event *event) { }
         |             ^~~~~~~~~~~~~~~~~
>> include/linux/perf/riscv_pmu.h:157:13: warning: 'riscv_pmu_ctr_add' defined but not used [-Wunused-function]
     157 | static void riscv_pmu_ctr_add(struct perf_event *event) { }
         |             ^~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:185: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=3613240060
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1417: prepare0] Error 2 shuffle=3613240060
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=3613240060
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=3613240060
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
