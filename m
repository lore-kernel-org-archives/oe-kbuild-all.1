Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FF1B13D630
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jul 2024 10:49:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721126994; cv=none; b=OvhyVWrfwA+hVHOHG7/HkfRkDMxaeXZYPEbcUb/UEUz5/HL9Cw5zjiQhQNxPhISnbAA2fuUhmpNJJWEid3HhyCqo/CFR/puJERD3Jrk1a1WFujJ/IwaDivLFY7xGYo3R6okD9Mq/plki6FoT9lMpkbq6GjHaJwmgKJtZD15LuMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721126994; c=relaxed/simple;
	bh=nI6P+bR1hUBsaBlNEDlvXMj/Ybfu+yhIPfIo6Mkh8P0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=o65U1b4WKPnZtvKDLCS7GJ7cLwOtWf/HgVivahvdrL8s7BCkk9wF3ntjGuLQOUL/rJiz1wLiLv6YZ7zNf8zapRHgbfzhION+fgiF9Vt2E2q4EDrcsjp5gKWkQx65L4ZULmMlbJ3V36bNz2WoDJbfMBgBd7So899ywQ4HVE5atiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ccIdJ9ZY; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ccIdJ9ZY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721126993; x=1752662993;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nI6P+bR1hUBsaBlNEDlvXMj/Ybfu+yhIPfIo6Mkh8P0=;
  b=ccIdJ9ZYwX/Uh2yrjpO8dh6HjBKxuNt5NEjZUJFqLmmqdxtAZ3INOpSN
   7N7fSwRmKY1HYTdvseva5h6LwEVNYlEARePI8e0vHlsyr14YnxeB2+4Sz
   Z2XliNCo616MBB87SYayeNHAawXZmG5KiQn0UCwUf3sZW4t0vdNJEMaJT
   TvNuQe6NczlDmTyzLykm57F7bMf+VA2nJflRfaMqJHDjHuY+nGCL/blYR
   7hvoWEvxYWdxU+89mS6jWOrper4xVuI3lfYoCmuneVPhm4hTXiI5ksw+d
   RYOMVW6J9jt68tyOsypxiUqyoG47zmcFDxfE9GuAHYF9IZDHo5iW7cNNv
   w==;
X-CSE-ConnectionGUID: jrYts2LMRvGQSJpAts4iRQ==
X-CSE-MsgGUID: z/KnBvliQ9+GKbolma1Hlg==
X-IronPort-AV: E=McAfee;i="6700,10204,11134"; a="18169220"
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="18169220"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jul 2024 03:49:52 -0700
X-CSE-ConnectionGUID: UUfAZQcXTzW8cMs/NhNeLQ==
X-CSE-MsgGUID: reJp6rs0Qh+aljqq+/x+Yg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,211,1716274800"; 
   d="scan'208";a="54811967"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Jul 2024 03:49:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sTfkh-000f8j-2u;
	Tue, 16 Jul 2024 10:49:47 +0000
Date: Tue, 16 Jul 2024 18:48:59 +0800
From: kernel test robot <lkp@intel.com>
To: Tejun Heo <tj@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	David Vernet <dvernet@meta.com>
Subject: [linux-next:master 5677/13217] kernel/sched/ext.c:3339:18: error:
 implicit declaration of function 'stack_trace_save_tsk'
Message-ID: <202407161844.reewQQrR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4f40be61af99a67d5580c1448acd9b74c0376389
commit: 07814a9439a3b03d79a1001614b5bc1cab69bcec [5677/13217] sched_ext: Print debug dump after an error exit
config: sparc-randconfig-r052-20240716 (https://download.01.org/0day-ci/archive/20240716/202407161844.reewQQrR-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240716/202407161844.reewQQrR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407161844.reewQQrR-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/rhashtable-types.h:12,
                    from include/linux/sched/ext.h:13,
                    from include/linux/sched.h:83,
                    from include/linux/sched/signal.h:7,
                    from include/linux/sched/cputime.h:5,
                    from kernel/sched/build_policy.c:17:
   kernel/sched/ext.c: In function 'alloc_exit_info':
   kernel/sched/ext.c:2982:32: warning: 'kmalloc_array_noprof' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
    2982 |         ei->bt = kcalloc(sizeof(ei->bt[0]), SCX_EXIT_BT_LEN, GFP_KERNEL);
         |                                ^
   include/linux/alloc_tag.h:206:16: note: in definition of macro 'alloc_hooks_tag'
     206 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                ^~~~~~~~~
   include/linux/slab.h:701:49: note: in expansion of macro 'alloc_hooks'
     701 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:730:41: note: in expansion of macro 'kmalloc_array'
     730 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   kernel/sched/ext.c:2982:18: note: in expansion of macro 'kcalloc'
    2982 |         ei->bt = kcalloc(sizeof(ei->bt[0]), SCX_EXIT_BT_LEN, GFP_KERNEL);
         |                  ^~~~~~~
   kernel/sched/ext.c:2982:32: note: earlier argument should specify number of elements, later size of each element
    2982 |         ei->bt = kcalloc(sizeof(ei->bt[0]), SCX_EXIT_BT_LEN, GFP_KERNEL);
         |                                ^
   include/linux/alloc_tag.h:206:16: note: in definition of macro 'alloc_hooks_tag'
     206 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                ^~~~~~~~~
   include/linux/slab.h:701:49: note: in expansion of macro 'alloc_hooks'
     701 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:730:41: note: in expansion of macro 'kmalloc_array'
     730 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   kernel/sched/ext.c:2982:18: note: in expansion of macro 'kcalloc'
    2982 |         ei->bt = kcalloc(sizeof(ei->bt[0]), SCX_EXIT_BT_LEN, GFP_KERNEL);
         |                  ^~~~~~~
   kernel/sched/ext.c:2982:32: warning: 'kmalloc_array_noprof' sizes specified with 'sizeof' in the earlier argument and not in the later argument [-Wcalloc-transposed-args]
    2982 |         ei->bt = kcalloc(sizeof(ei->bt[0]), SCX_EXIT_BT_LEN, GFP_KERNEL);
         |                                ^
   include/linux/alloc_tag.h:206:34: note: in definition of macro 'alloc_hooks_tag'
     206 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                                  ^~~~~~~~~
   include/linux/slab.h:701:49: note: in expansion of macro 'alloc_hooks'
     701 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:730:41: note: in expansion of macro 'kmalloc_array'
     730 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   kernel/sched/ext.c:2982:18: note: in expansion of macro 'kcalloc'
    2982 |         ei->bt = kcalloc(sizeof(ei->bt[0]), SCX_EXIT_BT_LEN, GFP_KERNEL);
         |                  ^~~~~~~
   kernel/sched/ext.c:2982:32: note: earlier argument should specify number of elements, later size of each element
    2982 |         ei->bt = kcalloc(sizeof(ei->bt[0]), SCX_EXIT_BT_LEN, GFP_KERNEL);
         |                                ^
   include/linux/alloc_tag.h:206:34: note: in definition of macro 'alloc_hooks_tag'
     206 |         typeof(_do_alloc) _res = _do_alloc;                             \
         |                                  ^~~~~~~~~
   include/linux/slab.h:701:49: note: in expansion of macro 'alloc_hooks'
     701 | #define kmalloc_array(...)                      alloc_hooks(kmalloc_array_noprof(__VA_ARGS__))
         |                                                 ^~~~~~~~~~~
   include/linux/slab.h:730:41: note: in expansion of macro 'kmalloc_array'
     730 | #define kcalloc(n, size, flags)         kmalloc_array(n, size, (flags) | __GFP_ZERO)
         |                                         ^~~~~~~~~~~~~
   kernel/sched/ext.c:2982:18: note: in expansion of macro 'kcalloc'
    2982 |         ei->bt = kcalloc(sizeof(ei->bt[0]), SCX_EXIT_BT_LEN, GFP_KERNEL);
         |                  ^~~~~~~
   In file included from kernel/sched/build_policy.c:62:
   kernel/sched/ext.c: In function 'scx_ops_disable_workfn':
   kernel/sched/ext.c:3126:17: error: implicit declaration of function 'stack_trace_print'; did you mean 'event_trace_printk'? [-Wimplicit-function-declaration]
    3126 |                 stack_trace_print(ei->bt, ei->bt_len, 2);
         |                 ^~~~~~~~~~~~~~~~~
         |                 event_trace_printk
   kernel/sched/ext.c: In function 'scx_dump_task':
>> kernel/sched/ext.c:3339:18: error: implicit declaration of function 'stack_trace_save_tsk' [-Wimplicit-function-declaration]
    3339 |         bt_len = stack_trace_save_tsk(p, bt, SCX_EXIT_BT_LEN, 1);
         |                  ^~~~~~~~~~~~~~~~~~~~
   kernel/sched/ext.c: In function 'scx_ops_exit_kind':
   kernel/sched/ext.c:3485:30: error: implicit declaration of function 'stack_trace_save'; did you mean 'stack_tracer_enable'? [-Wimplicit-function-declaration]
    3485 |                 ei->bt_len = stack_trace_save(ei->bt, SCX_EXIT_BT_LEN, 1);
         |                              ^~~~~~~~~~~~~~~~
         |                              stack_tracer_enable


vim +/stack_trace_save_tsk +3339 kernel/sched/ext.c

  3308	
  3309	static void scx_dump_task(struct seq_buf *s, struct scx_dump_ctx *dctx,
  3310				  struct task_struct *p, char marker)
  3311	{
  3312		static unsigned long bt[SCX_EXIT_BT_LEN];
  3313		char dsq_id_buf[19] = "(n/a)";
  3314		unsigned long ops_state = atomic_long_read(&p->scx.ops_state);
  3315		unsigned int bt_len;
  3316	
  3317		if (p->scx.dsq)
  3318			scnprintf(dsq_id_buf, sizeof(dsq_id_buf), "0x%llx",
  3319				  (unsigned long long)p->scx.dsq->id);
  3320	
  3321		dump_newline(s);
  3322		dump_line(s, " %c%c %s[%d] %+ldms",
  3323			  marker, task_state_to_char(p), p->comm, p->pid,
  3324			  jiffies_delta_msecs(p->scx.runnable_at, dctx->at_jiffies));
  3325		dump_line(s, "      scx_state/flags=%u/0x%x ops_state/qseq=%lu/%lu",
  3326			  scx_get_task_state(p), p->scx.flags & ~SCX_TASK_STATE_MASK,
  3327			  ops_state & SCX_OPSS_STATE_MASK,
  3328			  ops_state >> SCX_OPSS_QSEQ_SHIFT);
  3329		dump_line(s, "      sticky/holding_cpu=%d/%d dsq_id=%s",
  3330			  p->scx.sticky_cpu, p->scx.holding_cpu, dsq_id_buf);
  3331		dump_line(s, "      cpus=%*pb", cpumask_pr_args(p->cpus_ptr));
  3332	
  3333		if (SCX_HAS_OP(dump_task)) {
  3334			ops_dump_init(s, "    ");
  3335			SCX_CALL_OP(SCX_KF_REST, dump_task, dctx, p);
  3336			ops_dump_exit();
  3337		}
  3338	
> 3339		bt_len = stack_trace_save_tsk(p, bt, SCX_EXIT_BT_LEN, 1);
  3340		if (bt_len) {
  3341			dump_newline(s);
  3342			dump_stack_trace(s, "    ", bt, bt_len);
  3343		}
  3344	}
  3345	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
