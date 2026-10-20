Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792525033;
	b=cUzoE7tNfqMIm+AKMgiUX5FSGaYidXqEpa3k0cBZVZO8dfzat713y0PcFWetkbMNMs5B
	 qgD4Pj/Y62C2y70Mblo6i6nF0Cz4kCOlGEw0CzzAn4hxh9+roCyRTMnM0H1k5hjM4j1In
	 ApVps5tyZQ/B0Ml8Vc7vBUt+73WMWxRni2XF+oAAhVV4QRyUHLu5MtAfRVWsrZ5hv2g/K
	 Gv8c6GDsSzJ749nu19IY3m4I6G9QrCG8PRjKzUU9Pl958/wHSl7yYf8nQGxVzYLH6wK4o
	 J24r7Msoo3nRPGMGuK8Tf+X0oXJU+AYRjvZ7NmXt5frQ69Ggu66sphNje8pzRMR79kw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792525033;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=IsUkSIN6XYqaYTkyn+CCBShRmesEGb05FPIN19r20j0=;
	b=x5w/c6JlOPs5qtp0KrhKkBt6P67MMPqe76n9oW3Od1txDzJSDezhtiJ2IzI9wbq434Gy
	 tVtZ4WfyB4VCZdqfj27UU1dePCa2rE5JEMjOzxH8JQTYn6BhKV3svOiBGms8w2YVf2/EX
	 nNBAlpm1hEyi/vLFrJO2UJvjZ+YxphVFMdNXMXeO44Tu+2pUu/k+Z7mb4PV1aColIbQRB
	 qEpwglTqrnlKyUpQrRuoblc9J9FaPYv1f36oL4x56HQxjhh/RZxMIHc5ZGZzjtUdNDeOx
	 gQCjyGb4TzmUMSI31ddjsYVPb1CRLD7f5l0kwI7uVeYLxZF21ji+G7ZRgn1uFZQ4z6w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N8EqNwIa;
	arc=none smtp.remote-ip=198.175.65.16
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB17606A319
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 19:37:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CAB17606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=N8EqNwIa
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792525031; x=1824061031;
  h=date:from:to:cc:subject:message-id;
  bh=uY0lzOPDTFK9/mF7s0V3eKiIEIeq3ayhA9lqyD2bLAY=;
  b=N8EqNwIaz9DvwbKaeom9nw1EjC0UZ7Othn2KeC5UbRSwQ1xaL5dvFo1w
   CrtNWzO++YX0dhwZ3Hfjicva/E+zv+Kiv2aJfjGHe+1UyBqWaUhWfCa30
   PN45ws2usIBXNBpqoDJ64kCXnjsbAsvNoYFr/yjjAdX85iDZi+xvIztni
   9P56vo5riyVc4ef90qBbcxGAgfUjqyKyS2BG2gM5Hz6FSbFciaR+NQdns
   3d8AWMhWNOkOOzaYGW4XwHRj6Edw88cqO9d6zqbyph9pXUMO6pqI2Q+hd
   ZoKc0sl+05jIyouZXl0Zes+M1cMZxd9Zwr5Z1ntN+t9WLEQBW1vtVAoR+
   A==;
X-CSE-ConnectionGUID: P/GY4dE+RR69kB5LEPHc+A==
X-CSE-MsgGUID: evBysJ2CR9WHpSBnOpr43w==
X-IronPort-AV: E=McAfee;i="6800,10657,11941"; a="1230629"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1230629"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2026 12:36:48 -0700
X-CSE-ConnectionGUID: 64u65ArITZC8s0+3tKUy/Q==
X-CSE-MsgGUID: pGLGbdhTQDy29O9xon58lA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="4721924"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa011.fm.intel.com with ESMTP; 20 Oct 2026 12:36:46 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJFda-00000000OMQ-3DLs;
	Tue, 20 Oct 2026 19:36:42 +0000
Date: Wed, 21 Oct 2026 03:36:22 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [jirislaby:next_master 139/201]
 kernel/sched/ext/ext.c:5178:17: error: implicit declaration of function
 'scx_reenq_wait_dispatching'; did you mean 'scx_wait_dispatching'?
Message-ID: <202610210332.DDqYQv5K-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Mark,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git next_master
head:   3d229ce89862b8e82d71a9e11d6f840ca272a6d6
commit: 67f116b3a9f895527f181af6218c3cdfbf1a966b [139/201] Merge branch 'for-next' of https://git.kernel.org/pub/scm/linux/kernel/git/tj/sched_ext.git
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20261021/202610210332.DDqYQv5K-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261021/202610210332.DDqYQv5K-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610210332.DDqYQv5K-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from kernel/sched/build_policy.c:71:
   kernel/sched/ext/ext.c: In function 'scx_reenq_reject':
>> kernel/sched/ext/ext.c:5178:17: error: implicit declaration of function 'scx_reenq_wait_dispatching'; did you mean 'scx_wait_dispatching'? [-Wimplicit-function-declaration]
    5178 |                 scx_reenq_wait_dispatching(p);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~
         |                 scx_wait_dispatching
   In file included from include/asm-generic/percpu.h:9,
                    from arch/x86/include/asm/percpu.h:593,
                    from arch/x86/include/asm/preempt.h:6,
                    from include/linux/preempt.h:107,
                    from include/linux/smp.h:116,
                    from include/linux/sched/clock.h:5,
                    from kernel/sched/build_policy.c:16:
   kernel/sched/ext/ext.c: In function 'free_dsq_irq_workfn':
   kernel/sched/ext/ext.c:5690:68: error: 'struct scx_dispatch_q' has no member named 'pcpu'
    5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
         |                                                                    ^~
   include/linux/percpu-defs.h:216:54: note: in definition of macro '__verify_pcpu_ptr'
     216 |         const void __percpu *__vpp_verify = (typeof((ptr) + 0))NULL;    \
         |                                                      ^~~
   kernel/sched/ext/ext.c:5690:53: note: in expansion of macro 'per_cpu_ptr'
    5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
         |                                                     ^~~~~~~~~~~
   In file included from include/linux/compiler_types.h:173,
                    from <command-line>:
   kernel/sched/ext/ext.c:5690:68: error: 'struct scx_dispatch_q' has no member named 'pcpu'
    5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
         |                                                                    ^~
   include/linux/compiler-gcc.h:34:41: note: in definition of macro 'RELOC_HIDE'
      34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
         |                                         ^~~
   include/linux/percpu-defs.h:221:10: note: in expansion of macro 'TYPEOF_UNQUAL'
     221 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |          ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:230:20: note: in expansion of macro 'PERCPU_PTR'
     230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:235:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/ext/ext.c:5690:53: note: in expansion of macro 'per_cpu_ptr'
    5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
         |                                                     ^~~~~~~~~~~
   kernel/sched/ext/ext.c:5690:68: error: 'struct scx_dispatch_q' has no member named 'pcpu'
    5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
         |                                                                    ^~
   include/linux/compiler-gcc.h:34:41: note: in definition of macro 'RELOC_HIDE'
      34 |         __asm__ ("" : "=r"(__ptr) : "0"(ptr));                          \
         |                                         ^~~
   include/linux/percpu-defs.h:230:20: note: in expansion of macro 'PERCPU_PTR'
     230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:235:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/ext/ext.c:5690:53: note: in expansion of macro 'per_cpu_ptr'
    5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
         |                                                     ^~~~~~~~~~~
   kernel/sched/ext/ext.c:5690:68: error: 'struct scx_dispatch_q' has no member named 'pcpu'
    5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
         |                                                                    ^~
   include/linux/compiler-gcc.h:35:17: note: in definition of macro 'RELOC_HIDE'
      35 |         (typeof(ptr)) (__ptr + (off));                                  \
         |                 ^~~
   include/linux/percpu-defs.h:221:10: note: in expansion of macro 'TYPEOF_UNQUAL'
     221 |         (TYPEOF_UNQUAL(*(__p)) __force __kernel *)((__force unsigned long)(__p))
         |          ^~~~~~~~~~~~~
   include/linux/percpu-defs.h:230:20: note: in expansion of macro 'PERCPU_PTR'
     230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:235:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/ext/ext.c:5690:53: note: in expansion of macro 'per_cpu_ptr'
    5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
         |                                                     ^~~~~~~~~~~
   kernel/sched/ext/ext.c:5690:68: error: 'struct scx_dispatch_q' has no member named 'pcpu'
    5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
         |                                                                    ^~
   include/linux/compiler-gcc.h:35:17: note: in definition of macro 'RELOC_HIDE'
      35 |         (typeof(ptr)) (__ptr + (off));                                  \
         |                 ^~~
   include/linux/percpu-defs.h:230:20: note: in expansion of macro 'PERCPU_PTR'
     230 |         RELOC_HIDE(PERCPU_PTR(__p), (__offset))
         |                    ^~~~~~~~~~
   include/linux/percpu-defs.h:235:9: note: in expansion of macro 'SHIFT_PERCPU_PTR'
     235 |         SHIFT_PERCPU_PTR((ptr), per_cpu_offset((cpu)));                 \
         |         ^~~~~~~~~~~~~~~~
   kernel/sched/ext/ext.c:5690:53: note: in expansion of macro 'per_cpu_ptr'
    5690 |                         struct scx_dsq_pcpu *pcpu = per_cpu_ptr(dsq->pcpu, cpu);
         |                                                     ^~~~~~~~~~~


vim +5178 kernel/sched/ext/ext.c

84b1a0ea0b7c23 kernel/sched/ext.c     Tejun Heo    2026-03-07  5136  
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5137  /*
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5138   * Drain ready tasks from @rq->scx.reject_dsq and reenqueue them so that their
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5139   * owning BPF schedulers choose placement again. Proxy-active tasks remain
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5140   * parked and rearm the retry notification for a later proxy resolution.
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5141   *
4eeabe0a3ef706 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5142   * A task can be re-rejected repeatedly. Reenqueues are bounded per task by
4eeabe0a3ef706 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5143   * SCX_REENQ_MAX_REPEAT in scx_do_enqueue_task(), which ejects the owning
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5144   * scheduler.
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5145   */
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5146  static void scx_reenq_reject(struct rq *rq)
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5147  {
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5148  	LIST_HEAD(tasks);
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5149  	struct task_struct *p, *n;
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5150  
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5151  	lockdep_assert_rq_held(rq);
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5152  
4eeabe0a3ef706 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5153  	if (list_empty(&rq->scx.reject_dsq.list))
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5154  		return;
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5155  
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5156  	/*
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5157  	 * Move ready tasks to a private list so a task re-rejected by
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5158  	 * scx_do_enqueue_task() below isn't revisited this round.
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5159  	 */
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5160  	list_for_each_entry_safe(p, n, &rq->scx.reject_dsq.list, scx.dsq_list.node) {
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5161  		u32 reason = p->scx.flags & SCX_TASK_REENQ_REASON_MASK;
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5162  
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5163  		WARN_ON_ONCE(!reason);
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5164  
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5165  		if (sched_proxy_exec() && reason == SCX_TASK_REENQ_PROXY) {
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5166  			/* Affinity machinery will dequeue and reactivate @p. */
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5167  			if (p->migration_pending)
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5168  				continue;
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5169  
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5170  			if (task_on_cpu(rq, p) || task_current_donor(rq, p)) {
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5171  				rq->scx.flags |= SCX_RQ_PROXY_RETRY;
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5172  				continue;
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5173  			}
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5174  		} else {
4eeabe0a3ef706 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5175  			WARN_ON_ONCE(p->migration_pending);
13ae184e4b8279 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5176  		}
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5177  
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22 @5178  		scx_reenq_wait_dispatching(p);
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5179  		scx_dispatch_dequeue(rq, p);
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5180  
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5181  		list_add_tail(&p->scx.dsq_list.node, &tasks);
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5182  	}
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5183  
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5184  	list_for_each_entry_safe(p, n, &tasks, scx.dsq_list.node) {
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5185  		list_del_init(&p->scx.dsq_list.node);
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5186  
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5187  		scx_do_enqueue_task(rq, p, SCX_ENQ_REENQ, -1);
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5188  	}
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5189  }
cea8b60e4aee04 kernel/sched/ext/ext.c Andrea Righi 2026-09-22  5190  

:::::: The code at line 5178 was first introduced by commit
:::::: cea8b60e4aee0435c23d343d31972664c65aa7c3 sched_ext: Move reject DSQ draining into core

:::::: TO: Andrea Righi <arighi@nvidia.com>
:::::: CC: Tejun Heo <tj@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
