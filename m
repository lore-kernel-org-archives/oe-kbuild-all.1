Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2405F101F6
	for <oe-kbuild-all@lists.linux.dev>; Wed, 16 Aug 2023 14:20:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692195627; x=1723731627;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=mzCnil4fMT/WApV9UEcH+mSm0zcEsThp9TNEYRlLI2o=;
  b=k6mwM9U2fcr2udot//X3RnM0tOyVahxww0jMgbq3Fa76+l0MXDKSHYBR
   G61R2QhGmvR/7cYDDTBbRqmuAT2zAT3yFz0hicJu4SqsuPBSRA+HqWVqH
   6OdyDRKAqdfePmeJf+GogNwjkB2yJtAhAfcWRY8I9hpQsy7H3Puc4Ss1H
   o5WdLKqkJTSt8Ah+uCb6hkK+HLQk6Th2tlp8xzEKL0rIuYa6QLHr6n9Kq
   80VvA7SrY45HeBysP7HSaCPHLw0sYPsJTOM+36YZD1g73Faik3/s8bw7V
   Y8+0Ury09YyjcFfDEC2sK7JaHJxMQpvzyqhaEGLantJbJlIZstWJGiRqP
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="438893342"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="438893342"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2023 07:20:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10803"; a="737308032"
X-IronPort-AV: E=Sophos;i="6.01,177,1684825200"; 
   d="scan'208";a="737308032"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 16 Aug 2023 07:20:00 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWHNO-0000Mn-2M;
	Wed, 16 Aug 2023 14:19:58 +0000
Date: Wed, 16 Aug 2023 22:19:01 +0800
From: kernel test robot <lkp@intel.com>
To: thinker.li@gmail.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC bpf-next v3 4/5] bpf: Add a new dynptr type for
 CGRUP_SOCKOPT.
Message-ID: <202308162201.NR58Gd8V-lkp@intel.com>
References: <20230815174712.660956-5-thinker.li@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230815174712.660956-5-thinker.li@gmail.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/thinker-li-gmail-com/bpf-enable-sleepable-BPF-programs-attached-to-cgroup-get-set-sockopt/20230816-014936
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20230815174712.660956-5-thinker.li%40gmail.com
patch subject: [RFC bpf-next v3 4/5] bpf: Add a new dynptr type for CGRUP_SOCKOPT.
config: x86_64-buildonly-randconfig-r001-20230816 (https://download.01.org/0day-ci/archive/20230816/202308162201.NR58Gd8V-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce: (https://download.01.org/0day-ci/archive/20230816/202308162201.NR58Gd8V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308162201.NR58Gd8V-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/bpf/helpers.c:1892:19: warning: no previous declaration for 'bpf_obj_new_impl' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_obj_new_impl(u64 local_type_id__k, void *meta__ign)
                      ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:1922:18: warning: no previous declaration for 'bpf_obj_drop_impl' [-Wmissing-declarations]
    __bpf_kfunc void bpf_obj_drop_impl(void *p__alloc, void *meta__ign)
                     ^~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:1930:19: warning: no previous declaration for 'bpf_refcount_acquire_impl' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_refcount_acquire_impl(void *p__refcounted_kptr, void *meta__ign)
                      ^~~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:1975:17: warning: no previous declaration for 'bpf_list_push_front_impl' [-Wmissing-declarations]
    __bpf_kfunc int bpf_list_push_front_impl(struct bpf_list_head *head,
                    ^~~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:1985:17: warning: no previous declaration for 'bpf_list_push_back_impl' [-Wmissing-declarations]
    __bpf_kfunc int bpf_list_push_back_impl(struct bpf_list_head *head,
                    ^~~~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2018:35: warning: no previous declaration for 'bpf_list_pop_front' [-Wmissing-declarations]
    __bpf_kfunc struct bpf_list_node *bpf_list_pop_front(struct bpf_list_head *head)
                                      ^~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2023:35: warning: no previous declaration for 'bpf_list_pop_back' [-Wmissing-declarations]
    __bpf_kfunc struct bpf_list_node *bpf_list_pop_back(struct bpf_list_head *head)
                                      ^~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2028:33: warning: no previous declaration for 'bpf_rbtree_remove' [-Wmissing-declarations]
    __bpf_kfunc struct bpf_rb_node *bpf_rbtree_remove(struct bpf_rb_root *root,
                                    ^~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2084:17: warning: no previous declaration for 'bpf_rbtree_add_impl' [-Wmissing-declarations]
    __bpf_kfunc int bpf_rbtree_add_impl(struct bpf_rb_root *root, struct bpf_rb_node *node,
                    ^~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2094:33: warning: no previous declaration for 'bpf_rbtree_first' [-Wmissing-declarations]
    __bpf_kfunc struct bpf_rb_node *bpf_rbtree_first(struct bpf_rb_root *root)
                                    ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2107:33: warning: no previous declaration for 'bpf_task_acquire' [-Wmissing-declarations]
    __bpf_kfunc struct task_struct *bpf_task_acquire(struct task_struct *p)
                                    ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2118:18: warning: no previous declaration for 'bpf_task_release' [-Wmissing-declarations]
    __bpf_kfunc void bpf_task_release(struct task_struct *p)
                     ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2207:33: warning: no previous declaration for 'bpf_task_from_pid' [-Wmissing-declarations]
    __bpf_kfunc struct task_struct *bpf_task_from_pid(s32 pid)
                                    ^~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2248:19: warning: no previous declaration for 'bpf_dynptr_slice' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_dynptr_slice(const struct bpf_dynptr_kern *ptr, u32 offset,
                      ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2333:19: warning: no previous declaration for 'bpf_dynptr_slice_rdwr' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_dynptr_slice_rdwr(const struct bpf_dynptr_kern *ptr, u32 offset,
                      ^~~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2364:17: warning: no previous declaration for 'bpf_dynptr_adjust' [-Wmissing-declarations]
    __bpf_kfunc int bpf_dynptr_adjust(struct bpf_dynptr_kern *ptr, u32 start, u32 end)
                    ^~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2382:18: warning: no previous declaration for 'bpf_dynptr_is_null' [-Wmissing-declarations]
    __bpf_kfunc bool bpf_dynptr_is_null(struct bpf_dynptr_kern *ptr)
                     ^~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2387:18: warning: no previous declaration for 'bpf_dynptr_is_rdonly' [-Wmissing-declarations]
    __bpf_kfunc bool bpf_dynptr_is_rdonly(struct bpf_dynptr_kern *ptr)
                     ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2395:19: warning: no previous declaration for 'bpf_dynptr_size' [-Wmissing-declarations]
    __bpf_kfunc __u32 bpf_dynptr_size(const struct bpf_dynptr_kern *ptr)
                      ^~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2403:17: warning: no previous declaration for 'bpf_dynptr_clone' [-Wmissing-declarations]
    __bpf_kfunc int bpf_dynptr_clone(struct bpf_dynptr_kern *ptr,
                    ^~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2416:19: warning: no previous declaration for 'bpf_cast_to_kern_ctx' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_cast_to_kern_ctx(void *obj)
                      ^~~~~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2421:19: warning: no previous declaration for 'bpf_rdonly_cast' [-Wmissing-declarations]
    __bpf_kfunc void *bpf_rdonly_cast(void *obj__ign, u32 btf_id__k)
                      ^~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2426:18: warning: no previous declaration for 'bpf_rcu_read_lock' [-Wmissing-declarations]
    __bpf_kfunc void bpf_rcu_read_lock(void)
                     ^~~~~~~~~~~~~~~~~
   kernel/bpf/helpers.c:2431:18: warning: no previous declaration for 'bpf_rcu_read_unlock' [-Wmissing-declarations]
    __bpf_kfunc void bpf_rcu_read_unlock(void)
                     ^~~~~~~~~~~~~~~~~~~
>> kernel/bpf/helpers.c:2441:17: warning: no previous declaration for 'bpf_sockopt_dynptr_alloc' [-Wmissing-declarations]
    __bpf_kfunc int bpf_sockopt_dynptr_alloc(struct bpf_sockopt *sopt, int size,
                    ^~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/helpers.c:2469:17: warning: no previous declaration for 'bpf_sockopt_dynptr_install' [-Wmissing-declarations]
    __bpf_kfunc int bpf_sockopt_dynptr_install(struct bpf_sockopt *sopt,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/helpers.c:2506:17: warning: no previous declaration for 'bpf_sockopt_dynptr_release' [-Wmissing-declarations]
    __bpf_kfunc int bpf_sockopt_dynptr_release(struct bpf_sockopt *sopt,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/helpers.c:2545:17: warning: no previous declaration for 'bpf_sockopt_dynptr_from' [-Wmissing-declarations]
    __bpf_kfunc int bpf_sockopt_dynptr_from(struct bpf_sockopt *sopt,
                    ^~~~~~~~~~~~~~~~~~~~~~~
>> kernel/bpf/helpers.c:2590:17: warning: no previous declaration for 'bpf_sockopt_dynptr_copy_to' [-Wmissing-declarations]
    __bpf_kfunc int bpf_sockopt_dynptr_copy_to(struct bpf_sockopt *sopt,
                    ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/bpf_sockopt_dynptr_alloc +2441 kernel/bpf/helpers.c

  2435	
  2436	/* Create a buffer of the given size for a {set,get}sockopt BPF filter.
  2437	 *
  2438	 * This kfunc is only avaliabe for sleeplabe contexts. The dynptr should be
  2439	 * released by bpf_sockopt_dynptr_install() or bpf_sockopt_release().
  2440	 */
> 2441	__bpf_kfunc int bpf_sockopt_dynptr_alloc(struct bpf_sockopt *sopt, int size,
  2442						 struct bpf_dynptr_kern *ptr__uninit)
  2443	{
  2444		void *optval;
  2445		int err;
  2446	
  2447		bpf_dynptr_set_null(ptr__uninit);
  2448	
  2449		err = bpf_dynptr_check_size(size);
  2450		if (err)
  2451			return err;
  2452	
  2453		optval = kzalloc(size, GFP_KERNEL);
  2454		if (!optval)
  2455			return -ENOMEM;
  2456	
  2457		bpf_dynptr_init(ptr__uninit, optval,
  2458				BPF_DYNPTR_TYPE_CGROUP_SOCKOPT, 0, size);
  2459	
  2460		return size;
  2461	}
  2462	
  2463	/* Install the buffer of the dynptr into the sockopt context.
  2464	 *
  2465	 * This kfunc is only avaliabe for sleeplabe contexts. The dynptr should be
  2466	 * allocated by bpf_sockopt_dynptr_alloc().  The dynptr is invalid after
  2467	 * returning from this function successfully.
  2468	 */
> 2469	__bpf_kfunc int bpf_sockopt_dynptr_install(struct bpf_sockopt *sopt,
  2470						   struct bpf_dynptr_kern *ptr)
  2471	{
  2472		struct bpf_sockopt_kern *sopt_kern = (struct bpf_sockopt_kern *)sopt;
  2473	
  2474		if (!(sopt_kern->flags & BPF_SOCKOPT_FLAG_OPTVAL_REPLACE) ||
  2475		    bpf_dynptr_get_type(ptr) != BPF_DYNPTR_TYPE_CGROUP_SOCKOPT ||
  2476		    !ptr->data)
  2477			return -EINVAL;
  2478	
  2479		if (sopt_kern->optval == ptr->data &&
  2480		    !(sopt_kern->flags & BPF_SOCKOPT_FLAG_OPTVAL_USER)) {
  2481			/* This dynptr is initialized by bpf_sockopt_dynptr_from()
  2482			 * and the optval is not overwritten by
  2483			 * bpf_sockopt_dynptr_install() yet.
  2484			 */
  2485			bpf_dynptr_set_null(ptr);
  2486			sopt_kern->flags &= ~BPF_SOCKOPT_FLAG_OPTVAL_DYNPTR;
  2487			return 0;
  2488		}
  2489	
  2490		if (sopt_kern->optval &&
  2491		    !(sopt_kern->flags & (BPF_SOCKOPT_FLAG_OPTVAL_USER |
  2492					  BPF_SOCKOPT_FLAG_OPTVAL_DYNPTR)))
  2493			kfree(sopt_kern->optval);
  2494	
  2495		sopt_kern->optval = ptr->data;
  2496		sopt_kern->optval_end = ptr->data + __bpf_dynptr_size(ptr);
  2497		sopt_kern->optlen = __bpf_dynptr_size(ptr);
  2498		sopt_kern->flags &= ~(BPF_SOCKOPT_FLAG_OPTVAL_USER |
  2499				      BPF_SOCKOPT_FLAG_OPTVAL_DYNPTR);
  2500	
  2501		bpf_dynptr_set_null(ptr);
  2502	
  2503		return 0;
  2504	}
  2505	
> 2506	__bpf_kfunc int bpf_sockopt_dynptr_release(struct bpf_sockopt *sopt,
  2507						   struct bpf_dynptr_kern *ptr)
  2508	{
  2509		struct bpf_sockopt_kern *sopt_kern = (struct bpf_sockopt_kern *)sopt;
  2510	
  2511		if (bpf_dynptr_get_type(ptr) != BPF_DYNPTR_TYPE_CGROUP_SOCKOPT ||
  2512		    !ptr->data)
  2513			return -EINVAL;
  2514	
  2515		if (sopt_kern->optval == ptr->data &&
  2516		    !(sopt_kern->flags & BPF_SOCKOPT_FLAG_OPTVAL_USER))
  2517			/* This dynptr is initialized by bpf_sockopt_dynptr_from()
  2518			 * and the optval is not overwritten by
  2519			 * bpf_sockopt_dynptr_install() yet.
  2520			 */
  2521			sopt_kern->flags &= ~BPF_SOCKOPT_FLAG_OPTVAL_DYNPTR;
  2522		else
  2523			kfree(ptr->data);
  2524		bpf_dynptr_set_null(ptr);
  2525	
  2526		return 0;
  2527	}
  2528	
  2529	/* Initialize a sockopt dynptr from a user or installed optval pointer.
  2530	 *
  2531	 * sopt->optval can be a user pointer or a kernel pointer. A kernel pointer
  2532	 * can be a buffer allocated by the caller of the BPF program or a buffer
  2533	 * installed by other BPF programs through bpf_sockopt_dynptr_install().
  2534	 *
  2535	 * Atmost one dynptr shall be created by this function at any moment, or
  2536	 * it will return -EINVAL. You can create another dypptr by this function
  2537	 * after release the previous one by bpf_sockopt_dynptr_release().
  2538	 *
  2539	 * A dynptr that is initialized when optval is a user pointer is an
  2540	 * exception. In this case, the dynptr will point to a kernel buffer with
  2541	 * the same content as the user buffer. To simplify the code, users should
  2542	 * always make sure having only one dynptr initialized by this function at
  2543	 * any moment.
  2544	 */
> 2545	__bpf_kfunc int bpf_sockopt_dynptr_from(struct bpf_sockopt *sopt,
  2546						struct bpf_dynptr_kern *ptr__uninit,
  2547						unsigned int size)
  2548	{
  2549		struct bpf_sockopt_kern *sopt_kern = (struct bpf_sockopt_kern *)sopt;
  2550		int err;
  2551	
  2552		bpf_dynptr_set_null(ptr__uninit);
  2553	
  2554		if (size > (sopt_kern->optval_end - sopt_kern->optval))
  2555			return -EINVAL;
  2556	
  2557		if (size == 0)
  2558			size = min(sopt_kern->optlen,
  2559				   (int)(sopt_kern->optval_end - sopt_kern->optval));
  2560	
  2561		if (sopt_kern->flags & BPF_SOCKOPT_FLAG_OPTVAL_DYNPTR)
  2562			return -EINVAL;
  2563	
  2564		if (sopt_kern->flags & BPF_SOCKOPT_FLAG_OPTVAL_USER) {
  2565			err = bpf_sockopt_dynptr_alloc(sopt, sopt_kern->optlen,
  2566						       ptr__uninit);
  2567			if (err >= 0)
  2568				err = copy_from_user(ptr__uninit->data,
  2569						     sopt_kern->optval,
  2570						     size);
  2571			return err;
  2572		}
  2573	
  2574		bpf_dynptr_init(ptr__uninit, sopt_kern->optval,
  2575				BPF_DYNPTR_TYPE_CGROUP_SOCKOPT, 0,
  2576				size);
  2577		sopt_kern->flags |= BPF_SOCKOPT_FLAG_OPTVAL_DYNPTR;
  2578	
  2579		return size;
  2580	}
  2581	
  2582	/**
  2583	 * int bpf_sockopt_dynptr_copy_to(struct bpf_sockopt *sopt,
  2584	 *				  struct bpf_dynptr_kern *ptr)
  2585	 *     Description
  2586	 *             Copy data from *ptr* to *sopt->optval*.
  2587	 *     Return
  2588	 *             >= 0 on success, or a negative error in case of failure.
  2589	 */
> 2590	__bpf_kfunc int bpf_sockopt_dynptr_copy_to(struct bpf_sockopt *sopt,
  2591						   struct bpf_dynptr_kern *ptr)
  2592	{
  2593		__u32 size = bpf_dynptr_size(ptr);
  2594	
  2595		struct bpf_sockopt_kern *sopt_kern = (struct bpf_sockopt_kern *)sopt;
  2596		int ret;
  2597	
  2598		if (size > (sopt_kern->optval_end - sopt_kern->optval))
  2599			return -EINVAL;
  2600	
  2601		if (sopt_kern->flags & BPF_SOCKOPT_FLAG_OPTVAL_USER) {
  2602			ret = copy_to_user(sopt_kern->optval, ptr->data,
  2603					   size);
  2604			if (unlikely(ret))
  2605				return -EFAULT;
  2606		} else {
  2607			/* Use memmove() in case of optval & ptr overlap. */
  2608			memmove(sopt_kern->optval, ptr->data, size);
  2609			ret = size;
  2610		}
  2611	
  2612		return ret;
  2613	}
  2614	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
