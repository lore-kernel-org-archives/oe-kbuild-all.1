Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793291817;
	b=Swq6dUrm32X7qVF3IxWiOA70GHtdIor98q0qu14QAvqr8TuApP423XF7qsV33bllZ+7y
	 nZ62Lu11IWIH1R+l8JNgUye9zoujqWTjtyBjjLJ37RPIscPgkHg0GZjEP36nFySZP3L+f
	 u3mGJns4HmtB2naqzGQZqqc7bBBTBKDLHw8zWc+1nYY2xsowR+9aldo2WXuf0OIkb3OFd
	 ITzDybDc8ov4lGr806RVgNe7bMOBPUdABtUNuArCc2xphPyU3GmEwKfB/ZXABUXOQOQPq
	 nQ3t1vz2MmyVQPTR0VzoermqzBZCsM0xctTd32CVlUTC3sgWCLfJ7paCRqId7CrXLcw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793291817;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=T+t+W/ZeMuVt7V02Cq0RguH6O2OESqWCuPL/etMLYSc=;
	b=zgSmS1LXAQ5VZ65j7z4HRCvjx6rxMjRBsAebTxvQGjZGYfbW2VdYxvI8kv7PEZIDX33c
	 P054yyCyela9HXQbooTBuOCwsS6aRqAQYmsQ77Fm7WZ92rHWtZRjT7ZyXtFz+rvGTtZXd
	 9E9lvTcr3imEhHfnDYqOOEEOk8cN8NvyuGEyyiUjjTr5xxPdCgfOilneQFuaQ25BfZdyz
	 BeL1NVJWlILcCZYsrdfB5Rlo8WEQDVOLjtRwsuy3Yqz7dxQDJ9zTXBEAfn62h/lDvf7tr
	 ShyZLGBUYMQIQ3oSg8QFs0dzuZqCwYPSq/x1WIvLHHsyA1+syHq1yunqnUpyGynVZLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fJlOnInz;
	arc=none smtp.remote-ip=192.198.163.13
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BCC6606A31D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 16:36:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7BCC6606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=fJlOnInz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793291815; x=1824827815;
  h=date:from:to:cc:subject:message-id;
  bh=7Nn1HG5d+nAQ9oo4I0oopB5X1+00u7c4xtSZ7yjyMEY=;
  b=fJlOnInzaWI1VrcaByM3HZroJjaF/a07l+8KKcEttEjEHPZM25XuxCSQ
   nD0F2Y5G7G3lqz9+uNS63xYd7ui5HgT7NLZxvEZLcWT8gSBAB1gVzuoyu
   OADrrBtVtb/KQ2KB1Y4py1rnyuxu+dtn1crHjgKno/0RhtP06RvUKli7T
   HlnE/l4+5TGD2TBssZZwjP0OMa/2d9MkEs8LoY4rINaGAidZHb4CP2ymS
   kjIFsPCj0b/5Or0cmkakbl/C5Z6FKBlECkhvedQBTTe3x8PRzo/vyNM4M
   eZOBOCfayGCwatL8BsswPy3G8uLj88sLdRiscwBbP5GFdREO0xMF2cQfZ
   A==;
X-CSE-ConnectionGUID: A8GwEGFLS+qpZqoRyZrdMQ==
X-CSE-MsgGUID: jS5nEXkaQ8CEvMCY7Wy1uA==
X-IronPort-AV: E=McAfee;i="6800,10657,11950"; a="2031153"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="2031153"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 09:36:55 -0700
X-CSE-ConnectionGUID: CG06uQbETla4NYcWo7fASw==
X-CSE-MsgGUID: VVnslTqBQL6G9ju504tOsg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5584522"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 29 Oct 2026 09:36:54 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMT7T-000000005I3-2AjX;
	Thu, 29 Oct 2026 16:36:51 +0000
Date: Thu, 29 Oct 2026 17:35:57 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:coroutine 14/19] kernel/bpf/helpers.c:2451:18:
 sparse: sparse: symbol 'bpf_coro_suspend' was not declared. Should it be
 static?
Message-ID: <202610291701.9k9lSRNr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux coroutine
head:   fa34101696d14e4c060e4cb66af99b07566043e8
commit: d53fe5798cf63f95f210cd13d1371a9578ab35bc [14/19] bpf: Add no-op bpf_coro_suspend() kfunc
config: x86_64-randconfig-r2309-20261029 (https://download.01.org/0day-ci/archive/20261029/202610291701.9k9lSRNr-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291701.9k9lSRNr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291701.9k9lSRNr-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c:1269:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long ( *[usertype] callback_fn )( ... ) @@     got void [noderef] __rcu * @@
   kernel/bpf/helpers.c:1269:21: sparse:     expected unsigned long long ( *[usertype] callback_fn )( ... )
   kernel/bpf/helpers.c:1269:21: sparse:     got void [noderef] __rcu *
   kernel/bpf/helpers.c:2095:29: sparse: sparse: symbol 'bpf_get_current_task_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2096:29: sparse: sparse: symbol 'bpf_get_current_task_btf_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2097:29: sparse: sparse: symbol 'bpf_probe_read_user_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2098:29: sparse: sparse: symbol 'bpf_probe_read_user_str_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2099:29: sparse: sparse: symbol 'bpf_probe_read_kernel_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2100:29: sparse: sparse: symbol 'bpf_probe_read_kernel_str_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2101:29: sparse: sparse: symbol 'bpf_task_pt_regs_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2102:29: sparse: sparse: symbol 'bpf_perf_event_read_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2103:29: sparse: sparse: symbol 'bpf_send_signal_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2104:29: sparse: sparse: symbol 'bpf_send_signal_thread_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2107:29: sparse: sparse: symbol 'bpf_get_branch_snapshot_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2393:18: sparse: sparse: symbol 'bpf_obj_new' was not declared. Should it be static?
   kernel/bpf/helpers.c:2407:18: sparse: sparse: symbol 'bpf_obj_new_impl' was not declared. Should it be static?
   kernel/bpf/helpers.c:2423:18: sparse: sparse: symbol 'bpf_percpu_obj_new' was not declared. Should it be static?
   kernel/bpf/helpers.c:2431:18: sparse: sparse: symbol 'bpf_percpu_obj_new_impl' was not declared. Should it be static?
   kernel/bpf/helpers.c:2446:18: sparse: sparse: symbol 'bpf_coro_frame_free' was not declared. Should it be static?
>> kernel/bpf/helpers.c:2451:18: sparse: sparse: symbol 'bpf_coro_suspend' was not declared. Should it be static?
   kernel/bpf/helpers.c:2486:18: sparse: sparse: symbol 'bpf_obj_drop' was not declared. Should it be static?
   kernel/bpf/helpers.c:2505:18: sparse: sparse: symbol 'bpf_percpu_obj_drop' was not declared. Should it be static?
   kernel/bpf/helpers.c:2526:18: sparse: sparse: symbol 'bpf_refcount_acquire' was not declared. Should it be static?
   kernel/bpf/helpers.c:2543:18: sparse: sparse: symbol 'bpf_refcount_acquire_impl' was not declared. Should it be static?
   kernel/bpf/helpers.c:2601:17: sparse: sparse: symbol 'bpf_list_push_front' was not declared. Should it be static?
   kernel/bpf/helpers.c:2612:17: sparse: sparse: symbol 'bpf_list_push_front_impl' was not declared. Should it be static?
   kernel/bpf/helpers.c:2631:17: sparse: sparse: symbol 'bpf_list_push_back' was not declared. Should it be static?
   kernel/bpf/helpers.c:2642:17: sparse: sparse: symbol 'bpf_list_push_back_impl' was not declared. Should it be static?
   kernel/bpf/helpers.c:2649:17: sparse: sparse: symbol 'bpf_list_add' was not declared. Should it be static?
   kernel/bpf/helpers.c:2685:34: sparse: sparse: symbol 'bpf_list_pop_front' was not declared. Should it be static?
   kernel/bpf/helpers.c:2692:34: sparse: sparse: symbol 'bpf_list_pop_back' was not declared. Should it be static?
   kernel/bpf/helpers.c:2699:34: sparse: sparse: symbol 'bpf_list_del' was not declared. Should it be static?
   kernel/bpf/helpers.c:2708:34: sparse: sparse: symbol 'bpf_list_front' was not declared. Should it be static?
   kernel/bpf/helpers.c:2718:34: sparse: sparse: symbol 'bpf_list_back' was not declared. Should it be static?
   kernel/bpf/helpers.c:2728:18: sparse: sparse: symbol 'bpf_list_is_first' was not declared. Should it be static?
   kernel/bpf/helpers.c:2740:18: sparse: sparse: symbol 'bpf_list_is_last' was not declared. Should it be static?
   kernel/bpf/helpers.c:2752:18: sparse: sparse: symbol 'bpf_list_empty' was not declared. Should it be static?
   kernel/bpf/helpers.c:2765:32: sparse: sparse: symbol 'bpf_rbtree_remove' was not declared. Should it be static?
   kernel/bpf/helpers.c:2850:26: sparse: sparse: symbol 'bpf_rbtree_add' was not declared. Should it be static?
   kernel/bpf/helpers.c:2862:26: sparse: sparse: symbol 'bpf_rbtree_add_impl' was not declared. Should it be static?
   kernel/bpf/helpers.c:2873:32: sparse: sparse: symbol 'bpf_rbtree_first' was not declared. Should it be static?
   kernel/bpf/helpers.c:2880:32: sparse: sparse: symbol 'bpf_rbtree_root' was not declared. Should it be static?
   kernel/bpf/helpers.c:2887:32: sparse: sparse: symbol 'bpf_rbtree_left' was not declared. Should it be static?
   kernel/bpf/helpers.c:2897:32: sparse: sparse: symbol 'bpf_rbtree_right' was not declared. Should it be static?
   kernel/bpf/helpers.c:2913:32: sparse: sparse: symbol 'bpf_task_acquire' was not declared. Should it be static?
   kernel/bpf/helpers.c:2924:18: sparse: sparse: symbol 'bpf_task_release' was not declared. Should it be static?
   kernel/bpf/helpers.c:2929:18: sparse: sparse: symbol 'bpf_task_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2942:27: sparse: sparse: symbol 'bpf_cgroup_acquire' was not declared. Should it be static?
   kernel/bpf/helpers.c:2954:18: sparse: sparse: symbol 'bpf_cgroup_release' was not declared. Should it be static?
   kernel/bpf/helpers.c:2959:18: sparse: sparse: symbol 'bpf_cgroup_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2972:27: sparse: sparse: symbol 'bpf_cgroup_ancestor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2992:27: sparse: sparse: symbol 'bpf_cgroup_from_id' was not declared. Should it be static?
   kernel/bpf/helpers.c:3012:18: sparse: sparse: symbol 'bpf_task_under_cgroup' was not declared. Should it be static?
   kernel/bpf/helpers.c:3055:27: sparse: sparse: symbol 'bpf_task_get_cgroup1' was not declared. Should it be static?
   kernel/bpf/helpers.c:3072:32: sparse: sparse: symbol 'bpf_task_from_pid' was not declared. Should it be static?
   kernel/bpf/helpers.c:3091:32: sparse: sparse: symbol 'bpf_task_from_vpid' was not declared. Should it be static?
   kernel/bpf/helpers.c:3134:18: sparse: sparse: symbol 'bpf_dynptr_slice' was not declared. Should it be static?
   kernel/bpf/helpers.c:3257:17: sparse: sparse: symbol 'bpf_dynptr_adjust' was not declared. Should it be static?
   kernel/bpf/helpers.c:3276:18: sparse: sparse: symbol 'bpf_dynptr_is_null' was not declared. Should it be static?
   kernel/bpf/helpers.c:3283:18: sparse: sparse: symbol 'bpf_dynptr_is_rdonly' was not declared. Should it be static?
   kernel/bpf/helpers.c:3293:17: sparse: sparse: symbol 'bpf_dynptr_size' was not declared. Should it be static?
   kernel/bpf/helpers.c:3303:17: sparse: sparse: symbol 'bpf_dynptr_clone' was not declared. Should it be static?
   kernel/bpf/helpers.c:3330:17: sparse: sparse: symbol 'bpf_dynptr_copy' was not declared. Should it be static?
   kernel/bpf/helpers.c:3385:17: sparse: sparse: symbol 'bpf_dynptr_memset' was not declared. Should it be static?
   kernel/bpf/helpers.c:3420:18: sparse: sparse: symbol 'bpf_cast_to_kern_ctx' was not declared. Should it be static?
   kernel/bpf/helpers.c:3425:18: sparse: sparse: symbol 'bpf_rdonly_cast' was not declared. Should it be static?
   kernel/bpf/helpers.c:3430:18: sparse: sparse: symbol 'bpf_rcu_read_lock' was not declared. Should it be static?
   kernel/bpf/helpers.c:3440:18: sparse: sparse: symbol 'bpf_throw' was not declared. Should it be static?
   kernel/bpf/helpers.c:3445:17: sparse: sparse: symbol 'bpf_wq_init' was not declared. Should it be static?
   kernel/bpf/helpers.c:3459:17: sparse: sparse: symbol 'bpf_wq_start' was not declared. Should it be static?
   kernel/bpf/helpers.c:3483:17: sparse: sparse: symbol 'bpf_wq_set_callback' was not declared. Should it be static?
   kernel/bpf/helpers.c:3496:18: sparse: sparse: symbol 'bpf_preempt_disable' was not declared. Should it be static?
   kernel/bpf/helpers.c:3560:1: sparse: sparse: symbol 'bpf_iter_bits_new' was not declared. Should it be static?
   kernel/bpf/helpers.c:3621:17: sparse: sparse: symbol 'bpf_iter_bits_next' was not declared. Should it be static?
   kernel/bpf/helpers.c:3647:18: sparse: sparse: symbol 'bpf_iter_bits_destroy' was not declared. Should it be static?
   kernel/bpf/helpers.c:3677:17: sparse: sparse: symbol 'bpf_copy_from_user_str' was not declared. Should it be static?
   kernel/bpf/helpers.c:3718:17: sparse: sparse: symbol 'bpf_copy_from_user_mm' was not declared. Should it be static?
   kernel/bpf/helpers.c:3762:17: sparse: sparse: symbol 'bpf_copy_from_user_mm_str' was not declared. Should it be static?
   kernel/bpf/helpers.c:3808:17: sparse: sparse: symbol 'bpf_copy_from_user_task_str' was not declared. Should it be static?
   kernel/bpf/helpers.c:3842:18: sparse: sparse: symbol 'bpf_local_irq_save' was not declared. Should it be static?
   kernel/bpf/helpers.c:3852:18: sparse: sparse: symbol '__bpf_trap' was not declared. Should it be static?
   kernel/bpf/helpers.c:3907:17: sparse: sparse: symbol 'bpf_strcmp' was not declared. Should it be static?
   kernel/bpf/helpers.c:3925:17: sparse: sparse: symbol 'bpf_strcasecmp' was not declared. Should it be static?
   kernel/bpf/helpers.c:3944:17: sparse: sparse: symbol 'bpf_strncasecmp' was not declared. Should it be static?
   kernel/bpf/helpers.c:3965:17: sparse: sparse: symbol 'bpf_strnchr' was not declared. Should it be static?
   kernel/bpf/helpers.c:4002:17: sparse: sparse: symbol 'bpf_strchr' was not declared. Should it be static?
   kernel/bpf/helpers.c:4019:17: sparse: sparse: symbol 'bpf_strchrnul' was not declared. Should it be static?
   kernel/bpf/helpers.c:4051:17: sparse: sparse: symbol 'bpf_strrchr' was not declared. Should it be static?
   kernel/bpf/helpers.c:4084:17: sparse: sparse: symbol 'bpf_strnlen' was not declared. Should it be static?
   kernel/bpf/helpers.c:4114:17: sparse: sparse: symbol 'bpf_strlen' was not declared. Should it be static?
   kernel/bpf/helpers.c:4132:17: sparse: sparse: symbol 'bpf_strspn' was not declared. Should it be static?
   kernel/bpf/helpers.c:4176:17: sparse: sparse: symbol 'bpf_strcspn' was not declared. Should it be static?
   kernel/bpf/helpers.c:4267:17: sparse: sparse: symbol 'bpf_strstr' was not declared. Should it be static?
   kernel/bpf/helpers.c:4286:17: sparse: sparse: symbol 'bpf_strcasestr' was not declared. Should it be static?
   kernel/bpf/helpers.c:4305:17: sparse: sparse: symbol 'bpf_strnstr' was not declared. Should it be static?
   kernel/bpf/helpers.c:4326:17: sparse: sparse: symbol 'bpf_strncasestr' was not declared. Should it be static?
   kernel/bpf/helpers.c:4820:17: sparse: sparse: symbol 'bpf_task_work_schedule_signal' was not declared. Should it be static?
   kernel/bpf/helpers.c:4838:17: sparse: sparse: symbol 'bpf_task_work_schedule_resume' was not declared. Should it be static?
   kernel/bpf/helpers.c:4921:17: sparse: sparse: symbol 'bpf_call_rcu' was not declared. Should it be static?
   kernel/bpf/helpers.c:4939:17: sparse: sparse: symbol 'bpf_call_rcu_tasks_trace' was not declared. Should it be static?
   kernel/bpf/helpers.c:4969:17: sparse: sparse: symbol 'bpf_dynptr_from_file' was not declared. Should it be static?
   kernel/bpf/helpers.c:4979:17: sparse: sparse: symbol 'bpf_dynptr_file_discard' was not declared. Should it be static?
   kernel/bpf/helpers.c:5008:17: sparse: sparse: symbol 'bpf_timer_cancel_async' was not declared. Should it be static?
   kernel/bpf/helpers.c: note: in included file:
   include/linux/bpf_unwind.h:137:48: sparse: sparse: undefined identifier '__builtin_dwarf_cfa'
   include/linux/bpf_unwind.h:137:32: sparse: sparse: cast from unknown type
   include/linux/bpf_unwind.h:137:32: sparse: sparse: cast from unknown type

vim +/bpf_coro_suspend +2451 kernel/bpf/helpers.c

  2450	
> 2451	__bpf_kfunc void bpf_coro_suspend(void *p__ign)
  2452	{
  2453	}
  2454	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
