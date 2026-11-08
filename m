Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.20
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794160173;
	b=BCYhy2o8Qxd/tsLJF5rQbwZBqVRBOEOvq/nqcvzu43Uy5/lAt340M2A8kUovZLCtIkQd
	 w9NFXIfnTQ7+k+6fB7txI8zrQ7XDhH9//pKOgV77HQAUBdsZ+qRztvIQNMlpo42oogGW2
	 HYU1ULyc4yE6z7MO7JLJFhxel3eHow/pGdZTeIcQ/7/HeHSSxFqBKlQ5anUld4uzHXfzh
	 Z3pBj/15qagI+sv06ztF3AIHQTECGjmOr6tM0v/N55onaB8bp+cCL9D9KzP+rcN6MfIEJ
	 fMVasxZj+msErVdXAV8HYDJds23F7RuUFlqqQ3nOdkvNM34VudrBn+bLl6euGb1GhOQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794160173;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=7IwIAJAn47ItPouz8Uk9YxD3mcRQhsg/pxMobjsIIi0=;
	b=hpGwssL5EkOX9TzLRqvQt2IgQ40wIfnp671ywCjYD4kBFJoy/i8P6r4sDdQFWXE40nbM
	 wRxEehNjIJdUCicAI/YDd3YWMVbwv+2d9MsvXesnwHOKF+3K1RA9X1DSlBMBvq5F+eiJN
	 AFHIA3GK8WKx4buRopqn/4rGBmZ7RY7qyyBhId/Si2/oLjZPhs02lYv1ZFlUMcS579QTb
	 2mrXW5ekRgUpUhcxhW2bBB5HVel+sEBsChvSx/ZPRX3qyEfX/I/oF/eXRplS1BgFtrbz8
	 nLrZ/QOA5+ZgCcFnEUz0wq/xCtiD88Niv+Bj7FGAxUP7Q6FXSbb0n5lhvxSdCo17/iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OlgRJt8D;
	arc=none smtp.remote-ip=198.175.65.20
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 726CB606A31C
	for <oe-kbuild-all@lists.linux.dev>; Sun,  8 Nov 2026 17:49:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 726CB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=OlgRJt8D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794160169; x=1825696169;
  h=date:from:to:cc:subject:message-id;
  bh=Xv8SQCOuhMkBjEjb0U32beGdOYmBTtXUUICn/FTSH+A=;
  b=OlgRJt8DreNlpKprBArKOoH/K47UOOkSAkSoOxgD5shC+bWDAoGDneab
   BQn69eCD9QnWM4kxmunb0AD2aVr0WHR604xreV3QAeSEmfZK3MHLIxcW/
   DlBuCxBPpBNi1iJ0dEaci85sibe+8wbcQ0H3XkixdeigUzlqMCQ3QKN2w
   cR3hoOHw4qtvd6cZwRM/Q0lGgIB2iAMEsPWmDQowfHJGMHSSEZ8P30YpX
   Z6kpYd+WhWXv+jtpJ6SKzQiEnMf57sh5ku1mTnYBY/V8jGvOkH3c+u1S9
   YtOVO8CsILKbswptLVPozDZRjvnU08brwaq6hmMiqyUFeNhZv5RjblOo7
   g==;
X-CSE-ConnectionGUID: to+4+kw4SuSNU7sQGLOayw==
X-CSE-MsgGUID: DKrWp9/ZQsyhlMutAj4X5w==
X-IronPort-AV: E=McAfee;i="6800,10657,11960"; a="2930893"
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="2930893"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2026 09:49:28 -0800
X-CSE-ConnectionGUID: rLLzBYDNSPy3CVP6IdA3aA==
X-CSE-MsgGUID: fNEV1oj0SP66oMy8RmbuOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,202,1787036400"; 
   d="scan'208";a="9565432"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa013.fm.intel.com with ESMTP; 08 Nov 2026 09:49:27 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQ71A-00000000BdV-3g4c;
	Sun, 08 Nov 2026 17:49:24 +0000
Date: Sun, 08 Nov 2026 18:48:49 +0100
From: kernel test robot <lkp@intel.com>
To: Vikram Singh <vikram.singh3@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>,
 Rajnesh Kanwal <rajnesh.kanwal49@gmail.com>
Subject: [avpatel:riscv_sbi_watchdog_v1 94/98]
 include/linux/perf/riscv_pmu.h:153:49: warning: 'struct cpu_hw_events'
 declared inside parameter list will not be visible outside of this definition
 or declaration
Message-ID: <202611081821.wrW1WvLU-lkp@intel.com>
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
config: riscv-randconfig-2000-20261108 (https://download.01.org/0day-ci/archive/20261108/202611081821.wrW1WvLU-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261108/202611081821.wrW1WvLU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611081821.wrW1WvLU-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/riscv/include/asm/kvm_vcpu_pmu.h:12,
                    from arch/riscv/include/asm/kvm_host.h:27,
                    from arch/riscv/kernel/asm-offsets.c:13:
>> include/linux/perf/riscv_pmu.h:153:49: warning: 'struct cpu_hw_events' declared inside parameter list will not be visible outside of this definition or declaration
    static inline void riscv_pmu_ctr_consume(struct cpu_hw_events *cpuc,
                                                    ^~~~~~~~~~~~~
   include/linux/perf/riscv_pmu.h: In function 'riscv_pmu_ctr_sched_task':
   include/linux/perf/riscv_pmu.h:155:45: error: parameter name omitted
    static inline void riscv_pmu_ctr_sched_task(struct perf_event_pmu_context *,
                                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/perf/riscv_pmu.h: At top level:
>> include/linux/perf/riscv_pmu.h:163:45: warning: 'struct riscv_pmu' declared inside parameter list will not be visible outside of this definition or declaration
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
   make[3]: *** [scripts/Makefile.build:185: arch/riscv/kernel/asm-offsets.s] Error 1 shuffle=817640402
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1417: prepare0] Error 2 shuffle=817640402
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:248: __sub-make] Error 2 shuffle=817640402
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:248: __sub-make] Error 2 shuffle=817640402
   make: Target 'prepare' not remade because of errors.


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
