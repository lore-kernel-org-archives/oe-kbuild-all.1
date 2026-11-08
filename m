Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794170079;
	b=UTq1wkTIzRRpGgW3zcju/G8gohAKducu6dKKMlWVS+CKCp9uuvobTtRswEcRK8j3trrF
	 hxxxiJMQP4mmmexw3aB2HSBBiRHR6JoczZdY+ImjR4+owRS3fWgCjOYiL354QHiL5x2t/
	 9V1ZCDYeEYE/oDcoLxfhHIA3ZT9gS41BayZKSOAV1MHP2hSRaUdjSlgJI3C8UwKucoG7D
	 Rwo8aD2E5VdXqRcs1GV/+vWK5iFaDYUkR56lQhngHREGSq7086mlSrzHC3Z0n5phgCztH
	 qOFa1s/bdth92GeHTJaKcvKIkr9soIzKSmgsoC3b/XMpH72RiBIsy0sTDv/K3OAInlA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794170079;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=4+JbUpJ4CovseHZBtgVM+LHgJfb1ss/QffDVq11APjg=;
	b=ylgirF73q8V+C5S9Taf9X0jhE6w8Xf2LS/fzA6+RfN41czqKpqjSeLcQcQYJN0UeNsOz
	 PcUkIQ89rviCLsep+a/0sL0ViN/JTHrJ5fRvuvLLehbYCp7+s5Uk2Wc/wgDjPdem+B73Z
	 2QX6tWH0SeajLrUp63s5EOEABrzYHGP1NTYs86B2FQXBP4Pzl9Wd7YxwPG6Nb+QNZdqeq
	 lN9zO/GooQHEwwpDOBHQi/I64SmeGTe9+uxSwthUkOKNIdkckqTme+SgW6d4MURpoHX7b
	 POBoWJ3DeEbyWPCCPFi2yGxCMc3IWU6pdirqZcaU3eRs70lsDQYXCjzK63KhfIyXHJA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iEztsjOp;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A93A606D805
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 20:34:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A93A606D805
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iEztsjOp
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794170078; x=1825706078;
  h=date:from:to:cc:subject:message-id;
  bh=hnp3WYuQCLn0vYGinfylk1mpATCYtwa0jvHun8NV/Ak=;
  b=iEztsjOpeQuQB2yoy9m9o7pLwKCEIETdJr6xKWpkEDdGgkJl12GyUnMR
   1muYeduvSpyt5VIlDgHL2HSxngQB4qSUf8OcN0OIM6yNzRSjhAypR8dT8
   smqDeP8NKuUNHMZbx7AZMzh8LnaVDeGNQ57ZxB6hTjqM5Nfa/xmvBEyHD
   BG2sRII7Skp6pw48oPavFGo2K30Wgofa3XyF9wITC7tYQgam3yGUQ2q8/
   SZgd+bJu4ZbBywo5gD1fOWwrmEPSWsRlrGE+moqQ3uoKrP2N15bPdlDTw
   8CXJGhTpPphc3+QZhOc4hnTWxhTmnTZ/ajihXTR7KuH9fWetu/54n0P7Z
   g==;
X-CSE-ConnectionGUID: qVi3eAo5TZaAL2JHGitHmA==
X-CSE-MsgGUID: s22pX/BkTveKLQnzU4MPFw==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2905972"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2905972"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 12:34:37 -0800
X-CSE-ConnectionGUID: MHUC/WqiRUqtA13z1BqnhQ==
X-CSE-MsgGUID: CHwi5qXvSo6WYfXkP1+oDQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="7853403"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 08 Nov 2026 12:34:34 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ9ay-00000000tN1-0Ibb;
	Sun, 08 Nov 2026 20:34:32 +0000
Date: Mon, 09 Nov 2026 04:34:01 +0800
From: kernel test robot <lkp@intel.com>
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
 Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Subject: [avpatel:riscv_sbi_watchdog_v1 94/98]
 include/linux/perf/riscv_pmu.h:153:49: warning: 'struct cpu_hw_events'
 declared inside parameter list will not be visible outside of this definition
 or declaration
Message-ID: <202611090430.SZCd3e70-lkp@intel.com>
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
config: riscv-allnoconfig (https://download.01.org/0day-ci/archive/20261109/202611090430.SZCd3e70-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611090430.SZCd3e70-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611090430.SZCd3e70-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/kvm_vcpu_pmu.h:12,
                    from arch/riscv/include/asm/kvm_host.h:27,
                    from arch/riscv/kernel/asm-offsets.c:13:
>> include/linux/perf/riscv_pmu.h:153:49: warning: 'struct cpu_hw_events' declared inside parameter list will not be visible outside of this definition or declaration
     153 | static inline void riscv_pmu_ctr_consume(struct cpu_hw_events *cpuc,
         |                                                 ^~~~~~~~~~~~~
>> include/linux/perf/riscv_pmu.h:163:45: warning: 'struct riscv_pmu' declared inside parameter list will not be visible outside of this definition or declaration
     163 | static inline int riscv_pmu_ctr_init(struct riscv_pmu *riscv_pmu) { return 0; }
         |                                             ^~~~~~~~~
   include/linux/perf/riscv_pmu.h:164:48: warning: 'struct riscv_pmu' declared inside parameter list will not be visible outside of this definition or declaration
     164 | static inline void riscv_pmu_ctr_finish(struct riscv_pmu *riscv_pmu) { }
         |                                                ^~~~~~~~~
   include/linux/perf/riscv_pmu.h:158:13: warning: 'riscv_pmu_ctr_del' defined but not used [-Wunused-function]
     158 | static void riscv_pmu_ctr_del(struct perf_event *event) { }
         |             ^~~~~~~~~~~~~~~~~
   include/linux/perf/riscv_pmu.h:157:13: warning: 'riscv_pmu_ctr_add' defined but not used [-Wunused-function]
     157 | static void riscv_pmu_ctr_add(struct perf_event *event) { }
         |             ^~~~~~~~~~~~~~~~~
--
   In file included from arch/riscv/include/asm/kvm_vcpu_pmu.h:12,
                    from arch/riscv/include/asm/kvm_host.h:27,
                    from arch/riscv/kernel/asm-offsets.c:13:
>> include/linux/perf/riscv_pmu.h:153:49: warning: 'struct cpu_hw_events' declared inside parameter list will not be visible outside of this definition or declaration
     153 | static inline void riscv_pmu_ctr_consume(struct cpu_hw_events *cpuc,
         |                                                 ^~~~~~~~~~~~~
>> include/linux/perf/riscv_pmu.h:163:45: warning: 'struct riscv_pmu' declared inside parameter list will not be visible outside of this definition or declaration
     163 | static inline int riscv_pmu_ctr_init(struct riscv_pmu *riscv_pmu) { return 0; }
         |                                             ^~~~~~~~~
   include/linux/perf/riscv_pmu.h:164:48: warning: 'struct riscv_pmu' declared inside parameter list will not be visible outside of this definition or declaration
     164 | static inline void riscv_pmu_ctr_finish(struct riscv_pmu *riscv_pmu) { }
         |                                                ^~~~~~~~~
   include/linux/perf/riscv_pmu.h:158:13: warning: 'riscv_pmu_ctr_del' defined but not used [-Wunused-function]
     158 | static void riscv_pmu_ctr_del(struct perf_event *event) { }
         |             ^~~~~~~~~~~~~~~~~
   include/linux/perf/riscv_pmu.h:157:13: warning: 'riscv_pmu_ctr_add' defined but not used [-Wunused-function]
     157 | static void riscv_pmu_ctr_add(struct perf_event *event) { }
         |             ^~~~~~~~~~~~~~~~~


vim +153 include/linux/perf/riscv_pmu.h

   151	
   152	static inline bool riscv_pmu_ctr_valid(struct perf_event *event) { return false; }
 > 153	static inline void riscv_pmu_ctr_consume(struct cpu_hw_events *cpuc,
   154						 struct perf_event *event) { }
   155	static inline void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *,
   156						    struct task_struct *task, bool sched_in) { }
   157	static void riscv_pmu_ctr_add(struct perf_event *event) { }
   158	static void riscv_pmu_ctr_del(struct perf_event *event) { }
   159	static inline void riscv_pmu_ctr_enable(struct perf_event *event) { }
   160	static inline void riscv_pmu_ctr_disable(struct perf_event *event) { }
   161	static inline void riscv_pmu_ctr_dying_cpu(void) { }
   162	static inline void riscv_pmu_ctr_starting_cpu(void) { }
 > 163	static inline int riscv_pmu_ctr_init(struct riscv_pmu *riscv_pmu) { return 0; }
   164	static inline void riscv_pmu_ctr_finish(struct riscv_pmu *riscv_pmu) { }
   165	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
