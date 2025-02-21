Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD04209F3C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Feb 2025 11:58:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740139099; cv=none; b=jONpUSHQlG33tfiKBMptgyjg0s5iZqVHfAhNERDHHKRRBiaeQRdY6wOb4g+i9XqLcs0Nd3SAWBWPZO79C6FJTFgIyVUiz0OdEbqtLR8RGjbcY2nGOG4lKKkdjXFY+sptxZ2wthTXHR/ix3etSkxMy8rkbuTp8zeArxm7Covxlqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740139099; c=relaxed/simple;
	bh=YCWbDh62miv7wUbdZDJZhE3w3uTGwtKLtTckT6S1J6Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M89Ds4+6vHhNRqjn8Sd/YS95pOBhPh1SFVuUx9Lq0WEcFbcQLG76Z+ns+pP9RFTacPTBuKcwACwbzMU7cTM4Ip5TPWvhd5861MaCCWr6McOlShi00LS9mclS1iiSBp9wwJyh4pJgNjZDfaBhSt3Dn9Hj4uxttAPARF29VhwF0Vw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZUUIakuH; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZUUIakuH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740139098; x=1771675098;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=YCWbDh62miv7wUbdZDJZhE3w3uTGwtKLtTckT6S1J6Q=;
  b=ZUUIakuH1hK8sKhu4PJSfBApfiLomqnbuLNZlnW9i8JGfihczy6qeE4g
   Q8FEPVNB4Y+z1ofPBitbZMj9+RMMWAc1C8IkNEhgrK/zGUJpRgfCiVyYa
   Y7MEb/XUjsBVEqmiXkHKWKjFRjJ2Ocqu91HX9ZZqLsmfm+SXD8KebXJbB
   NAifYjIPp7Z+ap0UVs3i1rzBIBI1+a1+tFpzRzC3UPKUqXF0Q8q8tpfCN
   XV8yw5eEoAGXwMcPml25gonTiQFhsE4UFhdODRVY0ks22iizEQKPJ//vg
   jZLkFSgS4t50RL62L/gmwY7fuhW53v0SzEDc+u/FAo8Badk/t1mav7l/6
   w==;
X-CSE-ConnectionGUID: UUXuFl4NS26p2SDxN2Jiaw==
X-CSE-MsgGUID: 9vSARgDqRtOLFTXPth6iGA==
X-IronPort-AV: E=McAfee;i="6700,10204,11351"; a="40668016"
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="40668016"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2025 03:58:16 -0800
X-CSE-ConnectionGUID: Fj+jXC08RSOh+38go1OV4Q==
X-CSE-MsgGUID: WMs1WiuQR9qlseNVQEgCwg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,304,1732608000"; 
   d="scan'208";a="120455859"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 21 Feb 2025 03:58:14 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tlRfX-0005TH-2j;
	Fri, 21 Feb 2025 11:58:11 +0000
Date: Fri, 21 Feb 2025 19:57:27 +0800
From: kernel test robot <lkp@intel.com>
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 22/22] [DEBUG] sched/fair: Debug pick_eevdf()
 returning NULL!
Message-ID: <202502211905.w6RU0AXv-lkp@intel.com>
References: <20250220093257.9380-23-kprateek.nayak@amd.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220093257.9380-23-kprateek.nayak@amd.com>

Hi Prateek,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on d34e798094ca7be935b629a42f8b237d4d5b7f1d]

url:    https://github.com/intel-lab-lkp/linux/commits/K-Prateek-Nayak/kernel-entry-common-Move-syscall_enter_from_user_mode_work-out-of-header/20250220-174233
base:   d34e798094ca7be935b629a42f8b237d4d5b7f1d
patch link:    https://lore.kernel.org/r/20250220093257.9380-23-kprateek.nayak%40amd.com
patch subject: [RFC PATCH 22/22] [DEBUG] sched/fair: Debug pick_eevdf() returning NULL!
config: arc-randconfig-001-20250221 (https://download.01.org/0day-ci/archive/20250221/202502211905.w6RU0AXv-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250221/202502211905.w6RU0AXv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502211905.w6RU0AXv-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/kernel.h:31,
                    from include/linux/cpumask.h:11,
                    from include/linux/energy_model.h:4,
                    from kernel/sched/fair.c:23:
   kernel/sched/fair.c: In function 'debug_print_se':
>> kernel/sched/fair.c:5618:103: error: 'struct sched_entity' has no member named 'kernel_cs_count'
    5618 |         pr_warn("CPU%d: se kcs: kernel_cs_count(%d) min_kcs_vruntime(%lld) pick_entity(%d)\n", cpu, se->kernel_cs_count, se->min.kcs_vruntime, pick_entity(cfs_rq, se, h_throttled));
         |                                                                                                       ^~
   include/linux/printk.h:473:33: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:554:9: note: in expansion of macro 'printk'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/sched/fair.c:5618:9: note: in expansion of macro 'pr_warn'
    5618 |         pr_warn("CPU%d: se kcs: kernel_cs_count(%d) min_kcs_vruntime(%lld) pick_entity(%d)\n", cpu, se->kernel_cs_count, se->min.kcs_vruntime, pick_entity(cfs_rq, se, h_throttled));
         |         ^~~~~~~
>> kernel/sched/fair.c:5618:130: error: 'struct <anonymous>' has no member named 'kcs_vruntime'; did you mean 'vruntime'?
    5618 |         pr_warn("CPU%d: se kcs: kernel_cs_count(%d) min_kcs_vruntime(%lld) pick_entity(%d)\n", cpu, se->kernel_cs_count, se->min.kcs_vruntime, pick_entity(cfs_rq, se, h_throttled));
         |                                                                                                                                  ^~~~~~~~~~~~
   include/linux/printk.h:473:33: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:554:9: note: in expansion of macro 'printk'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/sched/fair.c:5618:9: note: in expansion of macro 'pr_warn'
    5618 |         pr_warn("CPU%d: se kcs: kernel_cs_count(%d) min_kcs_vruntime(%lld) pick_entity(%d)\n", cpu, se->kernel_cs_count, se->min.kcs_vruntime, pick_entity(cfs_rq, se, h_throttled));
         |         ^~~~~~~
   kernel/sched/fair.c: In function 'debug_print_cfs_rq':
>> kernel/sched/fair.c:5624:171: error: 'struct cfs_rq' has no member named 'throttled'
    5624 |         pr_warn("CPU%d: cfs_rq: throttled?(%d) cfs_rq->throttled(%d) h_nr_queued(%d) h_nr_runnable(%d) nr_queued(%d) gse->kernel_cs_count(%d)\n", cpu, h_throttled, cfs_rq->throttled, cfs_rq->h_nr_queued, cfs_rq->h_nr_runnable, cfs_rq->nr_queued, (se)? se->kernel_cs_count: -1);
         |                                                                                                                                                                           ^~
   include/linux/printk.h:473:33: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:554:9: note: in expansion of macro 'printk'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/sched/fair.c:5624:9: note: in expansion of macro 'pr_warn'
    5624 |         pr_warn("CPU%d: cfs_rq: throttled?(%d) cfs_rq->throttled(%d) h_nr_queued(%d) h_nr_runnable(%d) nr_queued(%d) gse->kernel_cs_count(%d)\n", cpu, h_throttled, cfs_rq->throttled, cfs_rq->h_nr_queued, cfs_rq->h_nr_runnable, cfs_rq->nr_queued, (se)? se->kernel_cs_count: -1);
         |         ^~~~~~~
   kernel/sched/fair.c:5624:255: error: 'struct sched_entity' has no member named 'kernel_cs_count'
    5624 |         pr_warn("CPU%d: cfs_rq: throttled?(%d) cfs_rq->throttled(%d) h_nr_queued(%d) h_nr_runnable(%d) nr_queued(%d) gse->kernel_cs_count(%d)\n", cpu, h_throttled, cfs_rq->throttled, cfs_rq->h_nr_queued, cfs_rq->h_nr_runnable, cfs_rq->nr_queued, (se)? se->kernel_cs_count: -1);
         |                                                                                                                                                                                                                                                               ^~
   include/linux/printk.h:473:33: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:554:9: note: in expansion of macro 'printk'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/sched/fair.c:5624:9: note: in expansion of macro 'pr_warn'
    5624 |         pr_warn("CPU%d: cfs_rq: throttled?(%d) cfs_rq->throttled(%d) h_nr_queued(%d) h_nr_runnable(%d) nr_queued(%d) gse->kernel_cs_count(%d)\n", cpu, h_throttled, cfs_rq->throttled, cfs_rq->h_nr_queued, cfs_rq->h_nr_runnable, cfs_rq->nr_queued, (se)? se->kernel_cs_count: -1);
         |         ^~~~~~~
>> kernel/sched/fair.c:5625:173: error: 'struct cfs_rq' has no member named 'avg_kcs_vruntime'; did you mean 'avg_vruntime'?
    5625 |         pr_warn("CPU%d: cfs_rq EEVDF: avg_vruntime(%lld) avg_load(%lld) avg_kcs_vruntime(%lld) avg_kcs_load(%lld) \n", cpu, cfs_rq->avg_vruntime, cfs_rq->avg_load, cfs_rq->avg_kcs_vruntime, cfs_rq->avg_kcs_load);
         |                                                                                                                                                                             ^~~~~~~~~~~~~~~~
   include/linux/printk.h:473:33: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:554:9: note: in expansion of macro 'printk'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/sched/fair.c:5625:9: note: in expansion of macro 'pr_warn'
    5625 |         pr_warn("CPU%d: cfs_rq EEVDF: avg_vruntime(%lld) avg_load(%lld) avg_kcs_vruntime(%lld) avg_kcs_load(%lld) \n", cpu, cfs_rq->avg_vruntime, cfs_rq->avg_load, cfs_rq->avg_kcs_vruntime, cfs_rq->avg_kcs_load);
         |         ^~~~~~~
>> kernel/sched/fair.c:5625:199: error: 'struct cfs_rq' has no member named 'avg_kcs_load'; did you mean 'avg_load'?
    5625 |         pr_warn("CPU%d: cfs_rq EEVDF: avg_vruntime(%lld) avg_load(%lld) avg_kcs_vruntime(%lld) avg_kcs_load(%lld) \n", cpu, cfs_rq->avg_vruntime, cfs_rq->avg_load, cfs_rq->avg_kcs_vruntime, cfs_rq->avg_kcs_load);
         |                                                                                                                                                                                                       ^~~~~~~~~~~~
   include/linux/printk.h:473:33: note: in definition of macro 'printk_index_wrap'
     473 |                 _p_func(_fmt, ##__VA_ARGS__);                           \
         |                                 ^~~~~~~~~~~
   include/linux/printk.h:554:9: note: in expansion of macro 'printk'
     554 |         printk(KERN_WARNING pr_fmt(fmt), ##__VA_ARGS__)
         |         ^~~~~~
   kernel/sched/fair.c:5625:9: note: in expansion of macro 'pr_warn'
    5625 |         pr_warn("CPU%d: cfs_rq EEVDF: avg_vruntime(%lld) avg_load(%lld) avg_kcs_vruntime(%lld) avg_kcs_load(%lld) \n", cpu, cfs_rq->avg_vruntime, cfs_rq->avg_load, cfs_rq->avg_kcs_vruntime, cfs_rq->avg_kcs_load);
         |         ^~~~~~~
   kernel/sched/fair.c: In function 'debug_pick_next_entity':
>> kernel/sched/fair.c:5653:41: error: 'struct cfs_rq' has no member named 'tg'
    5653 |         struct sched_entity *se = cfs_rq->tg->se[cpu_of(rq_of(cfs_rq))];
         |                                         ^~


vim +5618 kernel/sched/fair.c

  5612	
  5613	static void debug_print_se(int cpu, struct sched_entity *se, bool h_throttled)
  5614	{
  5615		struct cfs_rq *cfs_rq = cfs_rq_of(se);
  5616	
  5617		pr_warn("CPU%d: se: load(%lu) vruntime(%lld) entity_key(%lld) deadline(%lld) min_vruntime(%lld) on_rq(%d)\n", cpu, scale_load_down(se->load.weight), se->vruntime, entity_key(cfs_rq, se), se->deadline, se->min.vruntime, se->on_rq);
> 5618		pr_warn("CPU%d: se kcs: kernel_cs_count(%d) min_kcs_vruntime(%lld) pick_entity(%d)\n", cpu, se->kernel_cs_count, se->min.kcs_vruntime, pick_entity(cfs_rq, se, h_throttled));
  5619	}
  5620	
  5621	static void debug_print_cfs_rq(int cpu, struct cfs_rq *cfs_rq, struct sched_entity *se, bool h_throttled)
  5622	{
  5623		pr_warn("CPU%d: ----- cfs_rq ----\n", cpu);
> 5624		pr_warn("CPU%d: cfs_rq: throttled?(%d) cfs_rq->throttled(%d) h_nr_queued(%d) h_nr_runnable(%d) nr_queued(%d) gse->kernel_cs_count(%d)\n", cpu, h_throttled, cfs_rq->throttled, cfs_rq->h_nr_queued, cfs_rq->h_nr_runnable, cfs_rq->nr_queued, (se)? se->kernel_cs_count: -1);
> 5625		pr_warn("CPU%d: cfs_rq EEVDF: avg_vruntime(%lld) avg_load(%lld) avg_kcs_vruntime(%lld) avg_kcs_load(%lld) \n", cpu, cfs_rq->avg_vruntime, cfs_rq->avg_load, cfs_rq->avg_kcs_vruntime, cfs_rq->avg_kcs_load);
  5626	
  5627		if (cfs_rq->curr) {
  5628			pr_warn("CPU%d: ----- cfs_rq->curr ----\n", cpu);
  5629			debug_print_se(cpu, cfs_rq->curr, h_throttled);
  5630		}
  5631		pr_warn("CPU%d: ----- cfs_rq done ----\n", cpu);
  5632	}
  5633	
  5634	static void debug_recursive(int cpu, struct rb_node *node, bool h_throttled)
  5635	{
  5636		debug_print_se(cpu, __node_2_se(node), h_throttled);
  5637	
  5638		if (node->rb_left) {
  5639			pr_warn("CPU%d: ----- Left Subtree ----\n", cpu);
  5640			debug_recursive(cpu, node->rb_left, h_throttled);
  5641			pr_warn("CPU%d: ----- Left Subtree Done ----\n", cpu);
  5642		}
  5643	
  5644		if (node->rb_right) {
  5645			pr_warn("CPU%d: ----- Right Subtree ----\n", cpu);
  5646			debug_recursive(cpu, node->rb_right, h_throttled);
  5647			pr_warn("CPU%d: ----- Right Subtree Done ----\n", cpu);
  5648		}
  5649	}
  5650	
  5651	static void debug_pick_next_entity(struct cfs_rq *cfs_rq, bool h_throttled)
  5652	{
> 5653		struct sched_entity *se = cfs_rq->tg->se[cpu_of(rq_of(cfs_rq))];
  5654		struct rb_node *node = cfs_rq->tasks_timeline.rb_root.rb_node;
  5655		struct task_struct *p = rq_of(cfs_rq)->curr;
  5656		int cpu = smp_processor_id();
  5657	
  5658		if (p) {
  5659			pr_warn("CPU%d: ----- current task ----\n", cpu);
  5660			pr_warn("CPU%d: pid(%d) comm(%s) task_cpu(%d) task_on_rq_queued(%d) task_on_rq_migrating(%d) normal_policy(%d) idle_policy(%d)\n", cpu, p->pid, p->comm, task_cpu(p), task_on_rq_queued(p), task_on_rq_migrating(p), normal_policy(p->policy), idle_policy(p->policy));
  5661			pr_warn("CPU%d: ----- current task done ----\n", cpu);
  5662		}
  5663	
  5664		debug_print_cfs_rq(cpu, cfs_rq, se, h_throttled);
  5665	
  5666		if (node) {
  5667			pr_warn("CPU%d: ----- rbtree traversal: root ----\n", cpu);
  5668			debug_recursive(cpu, node, h_throttled);
  5669			pr_warn("CPU%d: ----- rbtree done ----\n", cpu);
  5670		}
  5671	
  5672		cfs_rq = cfs_rq_of(se);
  5673		se = parent_entity(se);
  5674	
  5675		for_each_sched_entity(se) {
  5676			pr_warn("CPU%d: ----- parent cfs_rq ----\n", cpu);
  5677			debug_print_cfs_rq(cpu, cfs_rq, se, h_throttled);
  5678	
  5679			cfs_rq = cfs_rq_of(se);
  5680		}
  5681	
  5682		debug_print_cfs_rq(cpu, cfs_rq, NULL, false);
  5683	}
  5684	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
