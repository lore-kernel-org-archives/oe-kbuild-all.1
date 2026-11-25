Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795638711;
	b=MjqhLU/iVKF4CUdUrz8Uf+10GbHi70JXoVYlTyrz5PWOm460WawgVM1gz6e69UxS9+oh
	 wBeLWHbL+m9c1UfpWHtYo7Eh/yKa+vdFcKBT8H73lBfC5JEGfEucZANgbWjcOs9viE6SY
	 Tab1aaEvMKbd5AFZVKnEBp5gW9UpcRbnocu7oWDveTXMS9aiR9iixCLjL1NqYifHSL9KE
	 P+FSEBzdwlgUg4kjG1124BEN8HB1IGYS/FPAx4nPNTqxg8O/fx2VqZg/wvZAD1QNBimgT
	 EWqWVJRrg4OzGas2wqZedfGpH0vVmtbDBV13ileHtEKYy5tFb52uCouHCsyHOIxqjmQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795638711;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=aoZAKYk362wJhgRW0YmylUy7Gop62W9fgs53oJUICzE=;
	b=qrQlQ1WF5z6zGk+VzbDJMj5A3KovkM+oqyLjSk1GbutTSxWRS0EsQBtlgJ5A3+YGxOnV
	 Ou2HvNG9jt0SO92ODKRgJnbvjzBF2oLFpbgkVwnVPCVJ2EGf/cL//Q2SEAqkZjM38Aqlp
	 6Njtot0PE0K3ZnNoUX0d9+pmEfpVh/X7E84yyOscGCodtNrnSxBXX7aEKVOStf1uskC9c
	 Q3pZppcjC8nmfe5oa/vxtRmvf4AiQxN5tTU2vSz+Svc3vYJLjg9FLMqg4zYlwNQpwCu6H
	 lWdZv2iJhgKU+sUrN6TGXpyfC6bu2Hfn36vZtaVfZSRaczkGZPA3ht4XcSXlJ65fG4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LyoZlqMY;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D48B8606A31E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Nov 2026 20:31:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D48B8606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LyoZlqMY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795638711; x=1827174711;
  h=date:from:to:cc:subject:message-id;
  bh=RzJoCdRrJbJcBStOOLXyw1u49Eu0CILwcyeYmwbdKsg=;
  b=LyoZlqMY7Ns3NncdH48Dm8EdW2ACi4hXT4O6+2lj1PrE39qJ6qn68iCo
   6WVZ1DpNatUO87T4JmaiDcqjt8RCnPU9MapXDmWtvkxCRwPjXhzQQ1UqY
   YVVLMtM3di5x069wPJ6JZXzjTGyl9kOFQGt6Ji53MzvLw02rt/SnzEm6h
   5js29pVBp5LUjwHeBNenUhRhS2MYmABYAuHDHQbKbQRfYhr0iUI65Hwen
   ga0lfU689NJo8GT359XlNb17amv21RBaHuAa9BXEGKrnAkywMh1FGRf4S
   egazAPqZ18rtzxA1YVDmiTh1YXTQOliTelw6U0zp6PVo+iryxpzE2fUQw
   g==;
X-CSE-ConnectionGUID: p1F7UgT8R4apFzllUxId6Q==
X-CSE-MsgGUID: DV5FeUjBSDiaIIUHAH+qzw==
X-IronPort-AV: E=McAfee;i="6800,10657,11977"; a="4415335"
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="4415335"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2026 12:04:11 -0800
X-CSE-ConnectionGUID: /CWLDZ1MRFywMVWUz+BM1Q==
X-CSE-MsgGUID: RQK27F2EQMyhV6MeeAo7pQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,233,1787036400"; 
   d="scan'208";a="12203558"
Received: from igk-lkp-server01.igk.intel.com (HELO a03d4d989450) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2026 12:01:06 -0800
Received: from kbuild by a03d4d989450 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xWJAs-00000000059-0vz8;
	Wed, 25 Nov 2026 20:01:02 +0000
Date: Wed, 25 Nov 2026 21:00:43 +0100
From: kernel test robot <lkp@intel.com>
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
 Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Subject: [avpatel:riscv_sspesa_v2 125/131]
 include/linux/perf/riscv_pmu.h:156:45: error: parameter name omitted
Message-ID: <20261125205907.CXqsyeUc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/avpatel/linux.git riscv_sspesa_v2
head:   39750c17f65ad08fa27936e9cb67c2a6a10b7d93
commit: 70520ac3394c2394a86e8a4860a7dc8acebf730a [125/131] riscv: pmu: Add driver for Control Transfer Records Ext
config: riscv-randconfig-2002-20261125 (https://download.01.org/0day-ci/archive/20261125/20261125205907.CXqsyeUc-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125205907.CXqsyeUc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125205907.CXqsyeUc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/kvm_vcpu_pmu.h:12,
                    from arch/riscv/include/asm/kvm_host.h:27,
                    from arch/riscv/kernel/asm-offsets.c:13:
   include/linux/perf/riscv_pmu.h:154:49: warning: 'struct cpu_hw_events' declared inside parameter list will not be visible outside of this definition or declaration
    static inline void riscv_pmu_ctr_consume(struct cpu_hw_events *cpuc,
                                                    ^~~~~~~~~~~~~
   include/linux/perf/riscv_pmu.h: In function 'riscv_pmu_ctr_sched_task':
>> include/linux/perf/riscv_pmu.h:156:45: error: parameter name omitted
    static inline void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *,
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/riscv_pmu.h: At top level:
   include/linux/perf/riscv_pmu.h:164:45: warning: 'struct riscv_pmu' declared inside parameter list will not be visible outside of this definition or declaration
    static inline int riscv_pmu_ctr_init(struct riscv_pmu *riscv_pmu) { return 0; }
                                                ^~~~~~~~~
   include/linux/perf/riscv_pmu.h:165:48: warning: 'struct riscv_pmu' declared inside parameter list will not be visible outside of this definition or declaration
    static inline void riscv_pmu_ctr_finish(struct riscv_pmu *riscv_pmu) { }
                                                   ^~~~~~~~~
   include/linux/perf/riscv_pmu.h:159:13: warning: 'riscv_pmu_ctr_del' defined but not used [-Wunused-function]
    static void riscv_pmu_ctr_del(struct perf_event *event) { }
                ^~~~~~~~~~~~~~~~~
   include/linux/perf/riscv_pmu.h:158:13: warning: 'riscv_pmu_ctr_add' defined but not used [-Wunused-function]
    static void riscv_pmu_ctr_add(struct perf_event *event) { }
                ^~~~~~~~~~~~~~~~~
   make[3]: *** [scripts/Makefile.build:185: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=2335483812
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1417: prepare0] Error 2 shuffle=2335483812
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=2335483812
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=2335483812
   make: Target 'prepare' not remade because of errors.


vim +156 include/linux/perf/riscv_pmu.h

   152	
   153	static inline bool riscv_pmu_ctr_valid(struct perf_event *event) { return false; }
   154	static inline void riscv_pmu_ctr_consume(struct cpu_hw_events *cpuc,
   155						 struct perf_event *event) { }
 > 156	static inline void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *,
   157						    struct task_struct *task, bool sched_in) { }
   158	static void riscv_pmu_ctr_add(struct perf_event *event) { }
   159	static void riscv_pmu_ctr_del(struct perf_event *event) { }
   160	static inline void riscv_pmu_ctr_enable(struct perf_event *event) { }
   161	static inline void riscv_pmu_ctr_disable(struct perf_event *event) { }
   162	static inline void riscv_pmu_ctr_dying_cpu(void) { }
   163	static inline void riscv_pmu_ctr_starting_cpu(void) { }
   164	static inline int riscv_pmu_ctr_init(struct riscv_pmu *riscv_pmu) { return 0; }
   165	static inline void riscv_pmu_ctr_finish(struct riscv_pmu *riscv_pmu) { }
   166	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
