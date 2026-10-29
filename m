Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.8
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793272823;
	b=GG5HaB9uYMJy5xePokj7stWWPj7H8t9Nnj4FGyW/aO/zlFICRNtdfHkTzQ8ovpCRVTq9
	 NS9jLe8gzQK7vG3NpY6DMCe1NMo6EkCGSkTOIY2ByvrWVUHpbIPrQpOio80JHtfWjWo98
	 pmZbLwfjcrYo4JUm4m8QliksvJLx4KyppdJHQ29ctKhqzfvNRrd8YMhRmsizK61XuRRwV
	 6z/WZzbZ3vb4UItcxVMb3nDMRDZb6+80I42YIAqK+XoknyiUHKzRWC7IZpG0ztlZPJFdx
	 Clq+/2OFCp4mb9HSy2RahYPSMpPECEvu3we0cFti4ld7FNhKYmOr3p7pdWvlZOZNzag==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793272823;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=IAk4OfK0yuDD3Q1zcxykdIo2Qu+b+KLDG+VccMie5Qw=;
	b=ho9IaSQjj8AnmhAOxywpmUphXZLVKAUiQtG0SftD9KJd1Ci8+Y2GYu5AAELA60juwKsI
	 MeLwInvaqyZ4trVptqBeTgRrFRhIlWlORT2D+nkRAF7VGELQDQ2RRoByZCpzBFiM2R7fT
	 ZSduIn0Q1F+oK2zVTAEegm6gwcWmyegGlijtQHiKtE7T12nMxM7QEgEbjTriIpJ3EIdZS
	 vE5TkQ8nndeOkyu0z0RWR4bwk5ULQlK3wm/AwLl/khlscB4OKu0OU72hVkoV3d3sA7guM
	 B9uBg5dgdvOo9TDzbd/TCpDUPCTJLyTmUMAIJycB7u92deC7Wl3FnGzqxeOeKxVxl+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TKVZWPPy;
	arc=none smtp.remote-ip=192.198.163.8
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8CF5606A31C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 Oct 2026 11:20:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8CF5606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=TKVZWPPy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793272822; x=1824808822;
  h=date:from:to:cc:subject:message-id;
  bh=KLhEeIEpHV2dsA31YxyI5EDZ61n0ReYQbULpliZxdm8=;
  b=TKVZWPPyT5tt25KphJeO6i8wNDtFAzVAc6lhs37DWb6YsCfzRYBfaHpS
   9owtPSlbq1kE4DEDksWsJpksD4TfA0jBOX7y25u0ZOZrHwjyQ1nl2pjMc
   4yI03y8hgOuDuc/52eVmNA73qRJiylXBt6A6IXWudfGfU12mRJiX6kqdS
   4c75rVG9O7niwWtZ1u5FOl7doCIp20x8lrQ/adxbBXEBaQsAEuLbQlYMA
   /fnagghPWPyYYllLX61X8iXoHMCF8UX6lGBxZRayuiCWfHYVwcGwE/TGi
   2+9EYevto09l0r5HWE7P+8fQOdWT2JtDKQ69pqAXIqV/c2ctLrlEsZ8+f
   g==;
X-CSE-ConnectionGUID: IoHAsfsuRSGLBY588i4I8g==
X-CSE-MsgGUID: BhtI7xJaQZWrlXey2xbXtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1906045"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1906045"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2026 04:20:21 -0700
X-CSE-ConnectionGUID: lVtpX8hHTzSKspCcogzjEA==
X-CSE-MsgGUID: lk1FgvYTShSpSe6K6kElHg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5444089"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa009.fm.intel.com with ESMTP; 29 Oct 2026 04:20:20 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMOB7-000000005EJ-2P4e;
	Thu, 29 Oct 2026 11:20:17 +0000
Date: Thu, 29 Oct 2026 12:20:03 +0100
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:coroutine 14/19] kernel/bpf/helpers.c:2451:18:
 sparse: sparse: symbol 'bpf_coro_suspend' was not declared. Should it be
 static?
Message-ID: <202610291254.CEY38DsM-lkp@intel.com>
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
head:   010227bd8fe1e7e1bcd7ac230700d24c9be9b714
commit: d53fe5798cf63f95f210cd13d1371a9578ab35bc [14/19] bpf: Add no-op bpf_coro_suspend() kfunc
config: x86_64-randconfig-r2309-20261029 (https://download.01.org/0day-ci/archive/20261029/202610291254.CEY38DsM-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
sparse: v0.6.5-rc1-1-gc4640450
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261029/202610291254.CEY38DsM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610291254.CEY38DsM-lkp@intel.com/

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
