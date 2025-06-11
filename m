Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9C73380
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 18:43:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749667404; cv=none; b=cv34k1rfKpdyuCc8XxRDwnjgnNWjmp4DTGZAZ6DP2dgTDqKDKu/ejMzF8s5CwFOXnSwv7vRxmne9lJtK9xXSD5Qwk6J6TLM0T9y1J5O2fkQGpWX7ZMrjHLyT0DM6+sPdksfpiKOFL0PsjzHQn0/UzcSqAeQx4gX7H8tsQe7mffY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749667404; c=relaxed/simple;
	bh=B/wDvvGitaN9+naebXqOSiUYGPYs1o+I/+MozyOnT08=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SGjV7PW9rdZqAK2s9JhQ41U1Qqu4Wf9cCjHeegSnmKPq1xnmlyJpVQdpfKCgq5oz/ADTk863OeUQCc5fy0CQzyTloldGVWp/UpERcZevaYwfMKGCM3XeyRdMA/tC7s9lRboSom/CEiMN3681YNDdHa8tbPIdnLbEBbBANWRGpJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FyzXK7Ba; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FyzXK7Ba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749667403; x=1781203403;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B/wDvvGitaN9+naebXqOSiUYGPYs1o+I/+MozyOnT08=;
  b=FyzXK7BaEJFo79MMU64wimRU/JTC7lhX3KFUUE8eUyqo/q5mCaTZ5Iep
   OFJ6fDFbVGJfu9Bp2ZUI5yK+JWFb4OsAP8CqqzKU/MbWrdMfKveEw81l8
   vYMqizV33lNsLj1vcrVF/S94oSAxGnd++QvA9OPigSpmTU2aC6QaZQwDu
   10ix4Fc7tM63P9agJO+POJGzzbLE3TGhXlfkPaWFOgiDkE9UR/z9/KG1y
   couLd2TXHK6cM/36Q7vRmZg0GgGOZ0t2td/b3y/81e9Wuah9VGoS9TPtI
   lpRGdHKQeK1UOrGycyDsMFz6g3jgxccwxSvyhqqxMAdFc+/649y36ihqH
   Q==;
X-CSE-ConnectionGUID: 4zzi7XexQxykVZfx4jgJ0Q==
X-CSE-MsgGUID: wuHgnWrJQVC6QJCBkGTaBQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62476386"
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="62476386"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 11:43:22 -0700
X-CSE-ConnectionGUID: sXSfhEaNQ0ivmPOaQtcZxg==
X-CSE-MsgGUID: MfsPFCV2T/CYK5w4XViOkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,228,1744095600"; 
   d="scan'208";a="147271543"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Jun 2025 11:43:19 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPQPt-000AmU-1a;
	Wed, 11 Jun 2025 18:43:17 +0000
Date: Thu, 12 Jun 2025 02:42:23 +0800
From: kernel test robot <lkp@intel.com>
To: Penglei Jiang <superman.xpt@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [linux-next:master 1510/1841] io_uring/sqpoll.c:273:17: sparse:
 sparse: incompatible types in comparison expression (different address
 spaces):
Message-ID: <202506120243.xcdLAjHE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   19a60293b9925080d97f22f122aca3fc46dadaf9
commit: ac0b8b327a5677dc6fecdf353d808161525b1ff0 [1510/1841] io_uring: fix use-after-free of sq->thread in __io_uring_show_fdinfo()
config: x86_64-randconfig-122-20250611 (https://download.01.org/0day-ci/archive/20250612/202506120243.xcdLAjHE-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506120243.xcdLAjHE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120243.xcdLAjHE-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> io_uring/sqpoll.c:273:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   io_uring/sqpoll.c:273:17: sparse:    struct task_struct [noderef] __rcu *
   io_uring/sqpoll.c:273:17: sparse:    struct task_struct *
   io_uring/sqpoll.c:383:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   io_uring/sqpoll.c:383:9: sparse:    struct task_struct [noderef] __rcu *
   io_uring/sqpoll.c:383:9: sparse:    struct task_struct *
   io_uring/sqpoll.c:42:9: sparse: sparse: context imbalance in 'io_sq_thread_unpark' - wrong count at exit
   io_uring/sqpoll.c:54:9: sparse: sparse: context imbalance in 'io_sq_thread_park' - wrong count at exit
--
   io_uring/fdinfo.c: note: in included file (through io_uring/io_uring.h):
   include/linux/io_uring_types.h:199:37: sparse: sparse: array of flexible structures
>> io_uring/fdinfo.c:147:23: sparse: sparse: incompatible types in comparison expression (different address spaces):
   io_uring/fdinfo.c:147:23: sparse:    struct task_struct [noderef] __rcu *
   io_uring/fdinfo.c:147:23: sparse:    struct task_struct *

vim +273 io_uring/sqpoll.c

   259	
   260	static int io_sq_thread(void *data)
   261	{
   262		struct llist_node *retry_list = NULL;
   263		struct io_sq_data *sqd = data;
   264		struct io_ring_ctx *ctx;
   265		struct rusage start;
   266		unsigned long timeout = 0;
   267		char buf[TASK_COMM_LEN] = {};
   268		DEFINE_WAIT(wait);
   269	
   270		/* offload context creation failed, just exit */
   271		if (!current->io_uring) {
   272			mutex_lock(&sqd->lock);
 > 273			rcu_assign_pointer(sqd->thread, NULL);
   274			put_task_struct(current);
   275			mutex_unlock(&sqd->lock);
   276			goto err_out;
   277		}
   278	
   279		snprintf(buf, sizeof(buf), "iou-sqp-%d", sqd->task_pid);
   280		set_task_comm(current, buf);
   281	
   282		/* reset to our pid after we've set task_comm, for fdinfo */
   283		sqd->task_pid = current->pid;
   284	
   285		if (sqd->sq_cpu != -1) {
   286			set_cpus_allowed_ptr(current, cpumask_of(sqd->sq_cpu));
   287		} else {
   288			set_cpus_allowed_ptr(current, cpu_online_mask);
   289			sqd->sq_cpu = raw_smp_processor_id();
   290		}
   291	
   292		/*
   293		 * Force audit context to get setup, in case we do prep side async
   294		 * operations that would trigger an audit call before any issue side
   295		 * audit has been done.
   296		 */
   297		audit_uring_entry(IORING_OP_NOP);
   298		audit_uring_exit(true, 0);
   299	
   300		mutex_lock(&sqd->lock);
   301		while (1) {
   302			bool cap_entries, sqt_spin = false;
   303	
   304			if (io_sqd_events_pending(sqd) || signal_pending(current)) {
   305				if (io_sqd_handle_event(sqd))
   306					break;
   307				timeout = jiffies + sqd->sq_thread_idle;
   308			}
   309	
   310			cap_entries = !list_is_singular(&sqd->ctx_list);
   311			getrusage(current, RUSAGE_SELF, &start);
   312			list_for_each_entry(ctx, &sqd->ctx_list, sqd_list) {
   313				int ret = __io_sq_thread(ctx, cap_entries);
   314	
   315				if (!sqt_spin && (ret > 0 || !wq_list_empty(&ctx->iopoll_list)))
   316					sqt_spin = true;
   317			}
   318			if (io_sq_tw(&retry_list, IORING_TW_CAP_ENTRIES_VALUE))
   319				sqt_spin = true;
   320	
   321			list_for_each_entry(ctx, &sqd->ctx_list, sqd_list)
   322				if (io_napi(ctx))
   323					io_napi_sqpoll_busy_poll(ctx);
   324	
   325			if (sqt_spin || !time_after(jiffies, timeout)) {
   326				if (sqt_spin) {
   327					io_sq_update_worktime(sqd, &start);
   328					timeout = jiffies + sqd->sq_thread_idle;
   329				}
   330				if (unlikely(need_resched())) {
   331					mutex_unlock(&sqd->lock);
   332					cond_resched();
   333					mutex_lock(&sqd->lock);
   334					sqd->sq_cpu = raw_smp_processor_id();
   335				}
   336				continue;
   337			}
   338	
   339			prepare_to_wait(&sqd->wait, &wait, TASK_INTERRUPTIBLE);
   340			if (!io_sqd_events_pending(sqd) && !io_sq_tw_pending(retry_list)) {
   341				bool needs_sched = true;
   342	
   343				list_for_each_entry(ctx, &sqd->ctx_list, sqd_list) {
   344					atomic_or(IORING_SQ_NEED_WAKEUP,
   345							&ctx->rings->sq_flags);
   346					if ((ctx->flags & IORING_SETUP_IOPOLL) &&
   347					    !wq_list_empty(&ctx->iopoll_list)) {
   348						needs_sched = false;
   349						break;
   350					}
   351	
   352					/*
   353					 * Ensure the store of the wakeup flag is not
   354					 * reordered with the load of the SQ tail
   355					 */
   356					smp_mb__after_atomic();
   357	
   358					if (io_sqring_entries(ctx)) {
   359						needs_sched = false;
   360						break;
   361					}
   362				}
   363	
   364				if (needs_sched) {
   365					mutex_unlock(&sqd->lock);
   366					schedule();
   367					mutex_lock(&sqd->lock);
   368					sqd->sq_cpu = raw_smp_processor_id();
   369				}
   370				list_for_each_entry(ctx, &sqd->ctx_list, sqd_list)
   371					atomic_andnot(IORING_SQ_NEED_WAKEUP,
   372							&ctx->rings->sq_flags);
   373			}
   374	
   375			finish_wait(&sqd->wait, &wait);
   376			timeout = jiffies + sqd->sq_thread_idle;
   377		}
   378	
   379		if (retry_list)
   380			io_sq_tw(&retry_list, UINT_MAX);
   381	
   382		io_uring_cancel_generic(true, sqd);
   383		rcu_assign_pointer(sqd->thread, NULL);
   384		put_task_struct(current);
   385		list_for_each_entry(ctx, &sqd->ctx_list, sqd_list)
   386			atomic_or(IORING_SQ_NEED_WAKEUP, &ctx->rings->sq_flags);
   387		io_run_task_work();
   388		mutex_unlock(&sqd->lock);
   389	err_out:
   390		complete(&sqd->exited);
   391		do_exit(0);
   392	}
   393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
