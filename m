Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A54E7472
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Dec 2023 17:11:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GUzMY3Wk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702228312; x=1733764312;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tC6DddCeNg0v8KO0NVyEbkG5o5qU6wNeCwysQi5xrek=;
  b=GUzMY3WkPlHnuiDaOncmWNEiUP6X2hEIRTCOgNlBtAXkGJWTaHi5r6Ip
   Ed9KMJxfN0CZveIVrt5JqKxEbIhHQ3K+c1hRsQm1KzR3q7Og6eWrQFL3i
   y4z8YFNvLmhYHWKFDaAMk9WozYUTmNdk+/ALHKkOVdQ0AS5RNplCjjW0d
   EAOdAdXlN1+BMfr5y5d1BqsU3aTLkqdaTJ1hcMltIehbPPSu1L9bkg7YX
   likdA5OL7HQ+wSCDAkQC3HxjZf8CcrpHBmI9dU3yAz4dohY2IzONQJB0J
   n7BFbdraKiozY6WC3uJtlRxOqpys0X8hUfuARkLTBByNGijaZgZ30g14K
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="1663869"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="1663869"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Dec 2023 09:11:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10920"; a="946014177"
X-IronPort-AV: E=Sophos;i="6.04,266,1695711600"; 
   d="scan'208";a="946014177"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga005.jf.intel.com with ESMTP; 10 Dec 2023 09:11:49 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rCNLG-000H4v-09;
	Sun, 10 Dec 2023 17:11:46 +0000
Date: Mon, 11 Dec 2023 01:11:20 +0800
From: kernel test robot <lkp@intel.com>
To: David Wei <davidhwei@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, Pavel Begunkov <asml.silence@gmail.com>
Subject: [isilence:zc/rx-pp-provider 19/31] io_uring/io_uring.c:2923:2:
 error: implicit declaration of function 'io_unregister_zc_rx_ifqs'; did you
 mean 'io_unregister_zc_rx_ifq'?
Message-ID: <202312110115.j2ZCAuUX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-pp-provider
head:   4b8de8977565096e38b6da993c68da6f2ef9b89c
commit: a637a9b59d1de6a86ea926ae416dd7bc1f4b6da1 [19/31] io_uring: add interface queue
config: i386-buildonly-randconfig-003-20231210 (https://download.01.org/0day-ci/archive/20231211/202312110115.j2ZCAuUX-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231211/202312110115.j2ZCAuUX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312110115.j2ZCAuUX-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from io_uring/io_uring.c:98:0:
   io_uring/zc_rx.h: In function 'io_unregister_zc_rx_ifq':
   io_uring/zc_rx.h:31:9: warning: 'return' with a value, in function returning void
     return -EOPNOTSUPP;
            ^
   io_uring/zc_rx.h:29:20: note: declared here
    static inline void io_unregister_zc_rx_ifq(struct io_ring_ctx *ctx)
                       ^~~~~~~~~~~~~~~~~~~~~~~
   io_uring/io_uring.c: In function 'io_ring_ctx_free':
>> io_uring/io_uring.c:2923:2: error: implicit declaration of function 'io_unregister_zc_rx_ifqs'; did you mean 'io_unregister_zc_rx_ifq'? [-Werror=implicit-function-declaration]
     io_unregister_zc_rx_ifqs(ctx);
     ^~~~~~~~~~~~~~~~~~~~~~~~
     io_unregister_zc_rx_ifq
   io_uring/io_uring.c: In function 'io_ring_exit_work':
>> io_uring/io_uring.c:3116:4: error: implicit declaration of function 'io_shut_zc_rx_ifqs'; did you mean 'io_register_zc_rx_ifq'? [-Werror=implicit-function-declaration]
       io_shut_zc_rx_ifqs(ctx);
       ^~~~~~~~~~~~~~~~~~
       io_register_zc_rx_ifq
   cc1: some warnings being treated as errors


vim +2923 io_uring/io_uring.c

  2914	
  2915	static __cold void io_ring_ctx_free(struct io_ring_ctx *ctx)
  2916	{
  2917		io_sq_thread_finish(ctx);
  2918		/* __io_rsrc_put_work() may need uring_lock to progress, wait w/o it */
  2919		if (WARN_ON_ONCE(!list_empty(&ctx->rsrc_ref_list)))
  2920			return;
  2921	
  2922		mutex_lock(&ctx->uring_lock);
> 2923		io_unregister_zc_rx_ifqs(ctx);
  2924		if (ctx->buf_data)
  2925			__io_sqe_buffers_unregister(ctx);
  2926		if (ctx->file_data)
  2927			__io_sqe_files_unregister(ctx);
  2928		io_cqring_overflow_kill(ctx);
  2929		io_eventfd_unregister(ctx);
  2930		io_alloc_cache_free(&ctx->apoll_cache, io_apoll_cache_free);
  2931		io_alloc_cache_free(&ctx->netmsg_cache, io_netmsg_cache_free);
  2932		io_futex_cache_free(ctx);
  2933		io_destroy_buffers(ctx);
  2934		mutex_unlock(&ctx->uring_lock);
  2935		if (ctx->sq_creds)
  2936			put_cred(ctx->sq_creds);
  2937		if (ctx->submitter_task)
  2938			put_task_struct(ctx->submitter_task);
  2939	
  2940		/* there are no registered resources left, nobody uses it */
  2941		if (ctx->rsrc_node)
  2942			io_rsrc_node_destroy(ctx, ctx->rsrc_node);
  2943	
  2944		WARN_ON_ONCE(!list_empty(&ctx->rsrc_ref_list));
  2945	
  2946	#if defined(CONFIG_UNIX)
  2947		if (ctx->ring_sock) {
  2948			ctx->ring_sock->file = NULL; /* so that iput() is called */
  2949			sock_release(ctx->ring_sock);
  2950		}
  2951	#endif
  2952		WARN_ON_ONCE(!list_empty(&ctx->ltimeout_list));
  2953	
  2954		io_alloc_cache_free(&ctx->rsrc_node_cache, io_rsrc_node_cache_free);
  2955		if (ctx->mm_account) {
  2956			mmdrop(ctx->mm_account);
  2957			ctx->mm_account = NULL;
  2958		}
  2959		io_rings_free(ctx);
  2960		io_kbuf_mmap_list_free(ctx);
  2961	
  2962		percpu_ref_exit(&ctx->refs);
  2963		free_uid(ctx->user);
  2964		io_req_caches_free(ctx);
  2965		if (ctx->hash_map)
  2966			io_wq_put_hash(ctx->hash_map);
  2967		kfree(ctx->cancel_table.hbs);
  2968		kfree(ctx->cancel_table_locked.hbs);
  2969		kfree(ctx->io_bl);
  2970		xa_destroy(&ctx->io_bl_xa);
  2971		kfree(ctx);
  2972	}
  2973	
  2974	static __cold void io_activate_pollwq_cb(struct callback_head *cb)
  2975	{
  2976		struct io_ring_ctx *ctx = container_of(cb, struct io_ring_ctx,
  2977						       poll_wq_task_work);
  2978	
  2979		mutex_lock(&ctx->uring_lock);
  2980		ctx->poll_activated = true;
  2981		mutex_unlock(&ctx->uring_lock);
  2982	
  2983		/*
  2984		 * Wake ups for some events between start of polling and activation
  2985		 * might've been lost due to loose synchronisation.
  2986		 */
  2987		wake_up_all(&ctx->poll_wq);
  2988		percpu_ref_put(&ctx->refs);
  2989	}
  2990	
  2991	static __cold void io_activate_pollwq(struct io_ring_ctx *ctx)
  2992	{
  2993		spin_lock(&ctx->completion_lock);
  2994		/* already activated or in progress */
  2995		if (ctx->poll_activated || ctx->poll_wq_task_work.func)
  2996			goto out;
  2997		if (WARN_ON_ONCE(!ctx->task_complete))
  2998			goto out;
  2999		if (!ctx->submitter_task)
  3000			goto out;
  3001		/*
  3002		 * with ->submitter_task only the submitter task completes requests, we
  3003		 * only need to sync with it, which is done by injecting a tw
  3004		 */
  3005		init_task_work(&ctx->poll_wq_task_work, io_activate_pollwq_cb);
  3006		percpu_ref_get(&ctx->refs);
  3007		if (task_work_add(ctx->submitter_task, &ctx->poll_wq_task_work, TWA_SIGNAL))
  3008			percpu_ref_put(&ctx->refs);
  3009	out:
  3010		spin_unlock(&ctx->completion_lock);
  3011	}
  3012	
  3013	static __poll_t io_uring_poll(struct file *file, poll_table *wait)
  3014	{
  3015		struct io_ring_ctx *ctx = file->private_data;
  3016		__poll_t mask = 0;
  3017	
  3018		if (unlikely(!ctx->poll_activated))
  3019			io_activate_pollwq(ctx);
  3020	
  3021		poll_wait(file, &ctx->poll_wq, wait);
  3022		/*
  3023		 * synchronizes with barrier from wq_has_sleeper call in
  3024		 * io_commit_cqring
  3025		 */
  3026		smp_rmb();
  3027		if (!io_sqring_full(ctx))
  3028			mask |= EPOLLOUT | EPOLLWRNORM;
  3029	
  3030		/*
  3031		 * Don't flush cqring overflow list here, just do a simple check.
  3032		 * Otherwise there could possible be ABBA deadlock:
  3033		 *      CPU0                    CPU1
  3034		 *      ----                    ----
  3035		 * lock(&ctx->uring_lock);
  3036		 *                              lock(&ep->mtx);
  3037		 *                              lock(&ctx->uring_lock);
  3038		 * lock(&ep->mtx);
  3039		 *
  3040		 * Users may get EPOLLIN meanwhile seeing nothing in cqring, this
  3041		 * pushes them to do the flush.
  3042		 */
  3043	
  3044		if (__io_cqring_events_user(ctx) || io_has_work(ctx))
  3045			mask |= EPOLLIN | EPOLLRDNORM;
  3046	
  3047		return mask;
  3048	}
  3049	
  3050	static int io_unregister_personality(struct io_ring_ctx *ctx, unsigned id)
  3051	{
  3052		const struct cred *creds;
  3053	
  3054		creds = xa_erase(&ctx->personalities, id);
  3055		if (creds) {
  3056			put_cred(creds);
  3057			return 0;
  3058		}
  3059	
  3060		return -EINVAL;
  3061	}
  3062	
  3063	struct io_tctx_exit {
  3064		struct callback_head		task_work;
  3065		struct completion		completion;
  3066		struct io_ring_ctx		*ctx;
  3067	};
  3068	
  3069	static __cold void io_tctx_exit_cb(struct callback_head *cb)
  3070	{
  3071		struct io_uring_task *tctx = current->io_uring;
  3072		struct io_tctx_exit *work;
  3073	
  3074		work = container_of(cb, struct io_tctx_exit, task_work);
  3075		/*
  3076		 * When @in_cancel, we're in cancellation and it's racy to remove the
  3077		 * node. It'll be removed by the end of cancellation, just ignore it.
  3078		 * tctx can be NULL if the queueing of this task_work raced with
  3079		 * work cancelation off the exec path.
  3080		 */
  3081		if (tctx && !atomic_read(&tctx->in_cancel))
  3082			io_uring_del_tctx_node((unsigned long)work->ctx);
  3083		complete(&work->completion);
  3084	}
  3085	
  3086	static __cold bool io_cancel_ctx_cb(struct io_wq_work *work, void *data)
  3087	{
  3088		struct io_kiocb *req = container_of(work, struct io_kiocb, work);
  3089	
  3090		return req->ctx == data;
  3091	}
  3092	
  3093	static __cold void io_ring_exit_work(struct work_struct *work)
  3094	{
  3095		struct io_ring_ctx *ctx = container_of(work, struct io_ring_ctx, exit_work);
  3096		unsigned long timeout = jiffies + HZ * 60 * 5;
  3097		unsigned long interval = HZ / 20;
  3098		struct io_tctx_exit exit;
  3099		struct io_tctx_node *node;
  3100		int ret;
  3101	
  3102		/*
  3103		 * If we're doing polled IO and end up having requests being
  3104		 * submitted async (out-of-line), then completions can come in while
  3105		 * we're waiting for refs to drop. We need to reap these manually,
  3106		 * as nobody else will be looking for them.
  3107		 */
  3108		do {
  3109			if (test_bit(IO_CHECK_CQ_OVERFLOW_BIT, &ctx->check_cq)) {
  3110				mutex_lock(&ctx->uring_lock);
  3111				io_cqring_overflow_kill(ctx);
  3112				mutex_unlock(&ctx->uring_lock);
  3113			}
  3114			if (ctx->ifq) {
  3115				mutex_lock(&ctx->uring_lock);
> 3116				io_shut_zc_rx_ifqs(ctx);
  3117				mutex_unlock(&ctx->uring_lock);
  3118			}
  3119	
  3120			if (ctx->flags & IORING_SETUP_DEFER_TASKRUN)
  3121				io_move_task_work_from_local(ctx);
  3122	
  3123			while (io_uring_try_cancel_requests(ctx, NULL, true))
  3124				cond_resched();
  3125	
  3126			if (ctx->sq_data) {
  3127				struct io_sq_data *sqd = ctx->sq_data;
  3128				struct task_struct *tsk;
  3129	
  3130				io_sq_thread_park(sqd);
  3131				tsk = sqd->thread;
  3132				if (tsk && tsk->io_uring && tsk->io_uring->io_wq)
  3133					io_wq_cancel_cb(tsk->io_uring->io_wq,
  3134							io_cancel_ctx_cb, ctx, true);
  3135				io_sq_thread_unpark(sqd);
  3136			}
  3137	
  3138			io_req_caches_free(ctx);
  3139	
  3140			if (WARN_ON_ONCE(time_after(jiffies, timeout))) {
  3141				/* there is little hope left, don't run it too often */
  3142				interval = HZ * 60;
  3143			}
  3144			/*
  3145			 * This is really an uninterruptible wait, as it has to be
  3146			 * complete. But it's also run from a kworker, which doesn't
  3147			 * take signals, so it's fine to make it interruptible. This
  3148			 * avoids scenarios where we knowingly can wait much longer
  3149			 * on completions, for example if someone does a SIGSTOP on
  3150			 * a task that needs to finish task_work to make this loop
  3151			 * complete. That's a synthetic situation that should not
  3152			 * cause a stuck task backtrace, and hence a potential panic
  3153			 * on stuck tasks if that is enabled.
  3154			 */
  3155		} while (!wait_for_completion_interruptible_timeout(&ctx->ref_comp, interval));
  3156	
  3157		init_completion(&exit.completion);
  3158		init_task_work(&exit.task_work, io_tctx_exit_cb);
  3159		exit.ctx = ctx;
  3160		/*
  3161		 * Some may use context even when all refs and requests have been put,
  3162		 * and they are free to do so while still holding uring_lock or
  3163		 * completion_lock, see io_req_task_submit(). Apart from other work,
  3164		 * this lock/unlock section also waits them to finish.
  3165		 */
  3166		mutex_lock(&ctx->uring_lock);
  3167		while (!list_empty(&ctx->tctx_list)) {
  3168			WARN_ON_ONCE(time_after(jiffies, timeout));
  3169	
  3170			node = list_first_entry(&ctx->tctx_list, struct io_tctx_node,
  3171						ctx_node);
  3172			/* don't spin on a single task if cancellation failed */
  3173			list_rotate_left(&ctx->tctx_list);
  3174			ret = task_work_add(node->task, &exit.task_work, TWA_SIGNAL);
  3175			if (WARN_ON_ONCE(ret))
  3176				continue;
  3177	
  3178			mutex_unlock(&ctx->uring_lock);
  3179			/*
  3180			 * See comment above for
  3181			 * wait_for_completion_interruptible_timeout() on why this
  3182			 * wait is marked as interruptible.
  3183			 */
  3184			wait_for_completion_interruptible(&exit.completion);
  3185			mutex_lock(&ctx->uring_lock);
  3186		}
  3187		mutex_unlock(&ctx->uring_lock);
  3188		spin_lock(&ctx->completion_lock);
  3189		spin_unlock(&ctx->completion_lock);
  3190	
  3191		/* pairs with RCU read section in io_req_local_work_add() */
  3192		if (ctx->flags & IORING_SETUP_DEFER_TASKRUN)
  3193			synchronize_rcu();
  3194	
  3195		io_ring_ctx_free(ctx);
  3196	}
  3197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
