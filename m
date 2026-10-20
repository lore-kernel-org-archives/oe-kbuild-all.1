Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792456364;
	b=bxIn0ZUZTg+eOAhJmxAYFRlm+bzmoSTIb5pUVyVq+iYNkhLtmUy0QHXe+15K6vCGWTJA
	 FlChEbaOxWRcezECdfT2dooKeD0d71PvvlmHCxRjcRUftGKOOT6CViQjL3JHy4eh4OD4o
	 GWLgiHNZfN/6B9JufWm0Gcj3Op98NBTjr5xeD4Cy15Hl7V+66nq3FYg+jHJHpFOqBduY4
	 UDzsjCycA6NwfLb1ah7tcGAe7yauuAxTB4U+QVYp+PXHWddHlRk6KZtGeDQKOoV4e5GPY
	 VkSyvO6J/Jy3khJFE5LI7zF135q6HGd3lXZK2kfSen1+hIZgwrHMRbcnp/N2tnB8JTg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792456364;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=Pb0quvUtnLUohsFt5yCvFE0ucaKJY9OqwB7dMYSn0C4=;
	b=Eleo8EcdF0trb2okUYFCx+m2TXvGXlbdz7YksqQHOGSAokGudrG4tgJOMdALKnNmgN//
	 7YirmT73GmF8IhYuWo2SOBaUC2bqEoIykArTIuOCGZegLvQ8gXMl6JBEK9jNF3qrWmV+h
	 A0X8kFofNZ1pcrL1PmSQShbWC4qeOEfdb31WxDTrVSzhrryh1ArNL4ZclklIzSzoDjvDR
	 4rQvHBLxPOXWPy2hqxBiHolctBSUj5Y7tx+XQc1wPgJk61Ebzh/kBIU9erg50sV1AwuvS
	 UxaY0b4TNobXvqiQqIIh5PUeQEhhzEu/WmXzL2d3opF3bhGPdnAzDKI2wXguTGWdcjA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VVK5HRzd;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F327606A31D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 20 Oct 2026 00:32:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3F327606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VVK5HRzd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792456362; x=1823992362;
  h=date:from:to:cc:subject:message-id;
  bh=ffnNaENV3htw6KplZrWQUsVIlpcGKk2jBsBRI/Juxjs=;
  b=VVK5HRzd7pZF0NcS4uX1VeFcAETmX+KaAAjEUCXJ2cG7mOnKXvFLKu4L
   3dUZCV6nTbvH2yaZp2OV+rGT2t4WJ9xfdQBGzqq8imjZ/h0MFZBxYcgve
   BGmKMs3NT1OpdwJGXUJuR3SZmYlH7h1Pj92PF6sV9HPlacZNq3z4PJfrX
   deok7Rx2K37LeYeVdMMZZpD3vv5vJ/Fe6/57bilX/Q7NKvQInUx7X+wQ6
   D3WJ2ZlH/oPh+ADG90q+wNU/5wEFblVTaT0eaBzt7Yr+gIaq9KDBZRQ26
   mOcJ0GuYmH7J9TNga/4NBzIhq3gmSSl9rfShfOpjVVhY0ms16LmSr1X33
   Q==;
X-CSE-ConnectionGUID: zlSm+XWFR1K4B5QDFCRUSg==
X-CSE-MsgGUID: SjrvADmdTHWU6EIgJm1Q0A==
X-IronPort-AV: E=McAfee;i="6800,10657,11940"; a="1055400"
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="1055400"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2026 17:32:42 -0700
X-CSE-ConnectionGUID: H/ZYUP91TdSRpzaKRlRWKg==
X-CSE-MsgGUID: r5LxRz9cSLWUB1VK+J9USg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,168,1787036400"; 
   d="scan'208";a="4432103"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa012.fm.intel.com with ESMTP; 19 Oct 2026 17:32:40 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xIxmQ-0000000060b-1WUp;
	Tue, 20 Oct 2026 00:32:38 +0000
Date: Tue, 20 Oct 2026 02:32:22 +0200
From: kernel test robot <lkp@intel.com>
To: Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kkdwivedi:cancellations 13/40]
 kernel/bpf/helpers.c:3673:18: sparse: sparse: symbol
 'bpf_iter_bits_destroy_dtor' was not declared. Should it be static?
Message-ID: <202610200259.BaLQDzZt-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/kkdwivedi/linux cancellations
head:   d3a43c8a05ca2e56ecb592c265a238386f3f1ff3
commit: a3416dd07fd2456144375d431511361e824e3b61 [13/40] bpf: Register cleanup destructors for the remaining referenced types
config: i386-randconfig-2300-20261019 (https://download.01.org/0day-ci/archive/20261020/202610200259.BaLQDzZt-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261020/202610200259.BaLQDzZt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610200259.BaLQDzZt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   kernel/bpf/helpers.c:1268:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected unsigned long long ( *[usertype] callback_fn )( ... ) @@     got void [noderef] __rcu * @@
   kernel/bpf/helpers.c:1268:21: sparse:     expected unsigned long long ( *[usertype] callback_fn )( ... )
   kernel/bpf/helpers.c:1268:21: sparse:     got void [noderef] __rcu *
   kernel/bpf/helpers.c:2094:29: sparse: sparse: symbol 'bpf_get_current_task_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2095:29: sparse: sparse: symbol 'bpf_get_current_task_btf_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2096:29: sparse: sparse: symbol 'bpf_probe_read_user_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2097:29: sparse: sparse: symbol 'bpf_probe_read_user_str_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2098:29: sparse: sparse: symbol 'bpf_probe_read_kernel_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2099:29: sparse: sparse: symbol 'bpf_probe_read_kernel_str_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2100:29: sparse: sparse: symbol 'bpf_task_pt_regs_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2101:29: sparse: sparse: symbol 'bpf_perf_event_read_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2102:29: sparse: sparse: symbol 'bpf_send_signal_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2103:29: sparse: sparse: symbol 'bpf_send_signal_thread_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2106:29: sparse: sparse: symbol 'bpf_get_branch_snapshot_proto' was not declared. Should it be static?
   kernel/bpf/helpers.c:2392:18: sparse: sparse: symbol 'bpf_obj_new' was not declared. Should it be static?
   kernel/bpf/helpers.c:2406:18: sparse: sparse: symbol 'bpf_obj_new_impl' was not declared. Should it be static?
   kernel/bpf/helpers.c:2422:18: sparse: sparse: symbol 'bpf_percpu_obj_new' was not declared. Should it be static?
   kernel/bpf/helpers.c:2430:18: sparse: sparse: symbol 'bpf_percpu_obj_new_impl' was not declared. Should it be static?
   kernel/bpf/helpers.c:2466:18: sparse: sparse: symbol 'bpf_obj_drop' was not declared. Should it be static?
   kernel/bpf/helpers.c:2473:18: sparse: sparse: symbol 'bpf_obj_drop_impl' was not declared. Should it be static?
   kernel/bpf/helpers.c:2485:18: sparse: sparse: symbol 'bpf_percpu_obj_drop' was not declared. Should it be static?
   kernel/bpf/helpers.c:2491:18: sparse: sparse: symbol 'bpf_percpu_obj_drop_impl' was not declared. Should it be static?
   kernel/bpf/helpers.c:2506:18: sparse: sparse: symbol 'bpf_refcount_acquire' was not declared. Should it be static?
   kernel/bpf/helpers.c:2523:18: sparse: sparse: symbol 'bpf_refcount_acquire_impl' was not declared. Should it be static?
   kernel/bpf/helpers.c:2581:17: sparse: sparse: symbol 'bpf_list_push_front' was not declared. Should it be static?
   kernel/bpf/helpers.c:2592:17: sparse: sparse: symbol 'bpf_list_push_front_impl' was not declared. Should it be static?
   kernel/bpf/helpers.c:2611:17: sparse: sparse: symbol 'bpf_list_push_back' was not declared. Should it be static?
   kernel/bpf/helpers.c:2622:17: sparse: sparse: symbol 'bpf_list_push_back_impl' was not declared. Should it be static?
   kernel/bpf/helpers.c:2629:17: sparse: sparse: symbol 'bpf_list_add' was not declared. Should it be static?
   kernel/bpf/helpers.c:2665:34: sparse: sparse: symbol 'bpf_list_pop_front' was not declared. Should it be static?
   kernel/bpf/helpers.c:2672:34: sparse: sparse: symbol 'bpf_list_pop_back' was not declared. Should it be static?
   kernel/bpf/helpers.c:2679:34: sparse: sparse: symbol 'bpf_list_del' was not declared. Should it be static?
   kernel/bpf/helpers.c:2688:34: sparse: sparse: symbol 'bpf_list_front' was not declared. Should it be static?
   kernel/bpf/helpers.c:2698:34: sparse: sparse: symbol 'bpf_list_back' was not declared. Should it be static?
   kernel/bpf/helpers.c:2708:18: sparse: sparse: symbol 'bpf_list_is_first' was not declared. Should it be static?
   kernel/bpf/helpers.c:2720:18: sparse: sparse: symbol 'bpf_list_is_last' was not declared. Should it be static?
   kernel/bpf/helpers.c:2732:18: sparse: sparse: symbol 'bpf_list_empty' was not declared. Should it be static?
   kernel/bpf/helpers.c:2745:32: sparse: sparse: symbol 'bpf_rbtree_remove' was not declared. Should it be static?
   kernel/bpf/helpers.c:2814:17: sparse: sparse: symbol 'bpf_rbtree_add' was not declared. Should it be static?
   kernel/bpf/helpers.c:2825:17: sparse: sparse: symbol 'bpf_rbtree_add_impl' was not declared. Should it be static?
   kernel/bpf/helpers.c:2832:32: sparse: sparse: symbol 'bpf_rbtree_first' was not declared. Should it be static?
   kernel/bpf/helpers.c:2839:32: sparse: sparse: symbol 'bpf_rbtree_root' was not declared. Should it be static?
   kernel/bpf/helpers.c:2846:32: sparse: sparse: symbol 'bpf_rbtree_left' was not declared. Should it be static?
   kernel/bpf/helpers.c:2856:32: sparse: sparse: symbol 'bpf_rbtree_right' was not declared. Should it be static?
   kernel/bpf/helpers.c:2872:32: sparse: sparse: symbol 'bpf_task_acquire' was not declared. Should it be static?
   kernel/bpf/helpers.c:2883:18: sparse: sparse: symbol 'bpf_task_release' was not declared. Should it be static?
   kernel/bpf/helpers.c:2888:18: sparse: sparse: symbol 'bpf_task_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2901:27: sparse: sparse: symbol 'bpf_cgroup_acquire' was not declared. Should it be static?
   kernel/bpf/helpers.c:2913:18: sparse: sparse: symbol 'bpf_cgroup_release' was not declared. Should it be static?
   kernel/bpf/helpers.c:2918:18: sparse: sparse: symbol 'bpf_cgroup_release_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2931:27: sparse: sparse: symbol 'bpf_cgroup_ancestor' was not declared. Should it be static?
   kernel/bpf/helpers.c:2951:27: sparse: sparse: symbol 'bpf_cgroup_from_id' was not declared. Should it be static?
   kernel/bpf/helpers.c:2971:18: sparse: sparse: symbol 'bpf_task_under_cgroup' was not declared. Should it be static?
   kernel/bpf/helpers.c:3014:27: sparse: sparse: symbol 'bpf_task_get_cgroup1' was not declared. Should it be static?
   kernel/bpf/helpers.c:3031:32: sparse: sparse: symbol 'bpf_task_from_pid' was not declared. Should it be static?
   kernel/bpf/helpers.c:3050:32: sparse: sparse: symbol 'bpf_task_from_vpid' was not declared. Should it be static?
   kernel/bpf/helpers.c:3093:18: sparse: sparse: symbol 'bpf_dynptr_slice' was not declared. Should it be static?
   kernel/bpf/helpers.c:3216:17: sparse: sparse: symbol 'bpf_dynptr_adjust' was not declared. Should it be static?
   kernel/bpf/helpers.c:3235:18: sparse: sparse: symbol 'bpf_dynptr_is_null' was not declared. Should it be static?
   kernel/bpf/helpers.c:3242:18: sparse: sparse: symbol 'bpf_dynptr_is_rdonly' was not declared. Should it be static?
   kernel/bpf/helpers.c:3252:17: sparse: sparse: symbol 'bpf_dynptr_size' was not declared. Should it be static?
   kernel/bpf/helpers.c:3262:17: sparse: sparse: symbol 'bpf_dynptr_clone' was not declared. Should it be static?
   kernel/bpf/helpers.c:3289:17: sparse: sparse: symbol 'bpf_dynptr_copy' was not declared. Should it be static?
   kernel/bpf/helpers.c:3344:17: sparse: sparse: symbol 'bpf_dynptr_memset' was not declared. Should it be static?
   kernel/bpf/helpers.c:3379:18: sparse: sparse: symbol 'bpf_cast_to_kern_ctx' was not declared. Should it be static?
   kernel/bpf/helpers.c:3384:18: sparse: sparse: symbol 'bpf_rdonly_cast' was not declared. Should it be static?
   kernel/bpf/helpers.c:3389:18: sparse: sparse: symbol 'bpf_rcu_read_lock' was not declared. Should it be static?
   kernel/bpf/helpers.c:3394:18: sparse: sparse: symbol 'bpf_rcu_read_unlock' was not declared. Should it be static?
   kernel/bpf/helpers.c:3457:18: sparse: sparse: symbol 'bpf_throw' was not declared. Should it be static?
   kernel/bpf/helpers.c:3462:17: sparse: sparse: symbol 'bpf_wq_init' was not declared. Should it be static?
   kernel/bpf/helpers.c:3476:17: sparse: sparse: symbol 'bpf_wq_start' was not declared. Should it be static?
   kernel/bpf/helpers.c:3500:17: sparse: sparse: symbol 'bpf_wq_set_callback' was not declared. Should it be static?
   kernel/bpf/helpers.c:3513:18: sparse: sparse: symbol 'bpf_preempt_disable' was not declared. Should it be static?
   kernel/bpf/helpers.c:3518:18: sparse: sparse: symbol 'bpf_preempt_enable' was not declared. Should it be static?
   kernel/bpf/helpers.c:3577:1: sparse: sparse: symbol 'bpf_iter_bits_new' was not declared. Should it be static?
   kernel/bpf/helpers.c:3638:17: sparse: sparse: symbol 'bpf_iter_bits_next' was not declared. Should it be static?
   kernel/bpf/helpers.c:3664:18: sparse: sparse: symbol 'bpf_iter_bits_destroy' was not declared. Should it be static?
>> kernel/bpf/helpers.c:3673:18: sparse: sparse: symbol 'bpf_iter_bits_destroy_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:3694:17: sparse: sparse: symbol 'bpf_copy_from_user_str' was not declared. Should it be static?
   kernel/bpf/helpers.c:3735:17: sparse: sparse: symbol 'bpf_copy_from_user_mm' was not declared. Should it be static?
   kernel/bpf/helpers.c:3779:17: sparse: sparse: symbol 'bpf_copy_from_user_mm_str' was not declared. Should it be static?
   kernel/bpf/helpers.c:3825:17: sparse: sparse: symbol 'bpf_copy_from_user_task_str' was not declared. Should it be static?
   kernel/bpf/helpers.c:3859:18: sparse: sparse: symbol 'bpf_local_irq_save' was not declared. Should it be static?
   kernel/bpf/helpers.c:3864:18: sparse: sparse: symbol 'bpf_local_irq_restore' was not declared. Should it be static?
   kernel/bpf/helpers.c:3869:18: sparse: sparse: symbol '__bpf_trap' was not declared. Should it be static?
   kernel/bpf/helpers.c:3924:17: sparse: sparse: symbol 'bpf_strcmp' was not declared. Should it be static?
   kernel/bpf/helpers.c:3942:17: sparse: sparse: symbol 'bpf_strcasecmp' was not declared. Should it be static?
   kernel/bpf/helpers.c:3961:17: sparse: sparse: symbol 'bpf_strncasecmp' was not declared. Should it be static?
   kernel/bpf/helpers.c:3982:17: sparse: sparse: symbol 'bpf_strnchr' was not declared. Should it be static?
   kernel/bpf/helpers.c:4019:17: sparse: sparse: symbol 'bpf_strchr' was not declared. Should it be static?
   kernel/bpf/helpers.c:4036:17: sparse: sparse: symbol 'bpf_strchrnul' was not declared. Should it be static?
   kernel/bpf/helpers.c:4068:17: sparse: sparse: symbol 'bpf_strrchr' was not declared. Should it be static?
   kernel/bpf/helpers.c:4101:17: sparse: sparse: symbol 'bpf_strnlen' was not declared. Should it be static?
   kernel/bpf/helpers.c:4131:17: sparse: sparse: symbol 'bpf_strlen' was not declared. Should it be static?
   kernel/bpf/helpers.c:4149:17: sparse: sparse: symbol 'bpf_strspn' was not declared. Should it be static?
   kernel/bpf/helpers.c:4193:17: sparse: sparse: symbol 'bpf_strcspn' was not declared. Should it be static?
   kernel/bpf/helpers.c:4284:17: sparse: sparse: symbol 'bpf_strstr' was not declared. Should it be static?
   kernel/bpf/helpers.c:4303:17: sparse: sparse: symbol 'bpf_strcasestr' was not declared. Should it be static?
   kernel/bpf/helpers.c:4322:17: sparse: sparse: symbol 'bpf_strnstr' was not declared. Should it be static?
   kernel/bpf/helpers.c:4343:17: sparse: sparse: symbol 'bpf_strncasestr' was not declared. Should it be static?
>> kernel/bpf/helpers.c:4456:18: sparse: sparse: symbol 'bpf_key_put_dtor' was not declared. Should it be static?
   kernel/bpf/helpers.c:4837:17: sparse: sparse: symbol 'bpf_task_work_schedule_signal' was not declared. Should it be static?
   kernel/bpf/helpers.c:4855:17: sparse: sparse: symbol 'bpf_task_work_schedule_resume' was not declared. Should it be static?
   kernel/bpf/helpers.c:4938:17: sparse: sparse: symbol 'bpf_call_rcu' was not declared. Should it be static?
   kernel/bpf/helpers.c:4956:17: sparse: sparse: symbol 'bpf_call_rcu_tasks_trace' was not declared. Should it be static?
   kernel/bpf/helpers.c:4986:17: sparse: sparse: symbol 'bpf_dynptr_from_file' was not declared. Should it be static?
   kernel/bpf/helpers.c:4996:17: sparse: sparse: symbol 'bpf_dynptr_file_discard' was not declared. Should it be static?
   kernel/bpf/helpers.c:5025:17: sparse: sparse: symbol 'bpf_timer_cancel_async' was not declared. Should it be static?

vim +/bpf_iter_bits_destroy_dtor +3673 kernel/bpf/helpers.c

  3672	
> 3673	__bpf_kfunc void bpf_iter_bits_destroy_dtor(void *it)
  3674	{
  3675		bpf_iter_bits_destroy(it);
  3676	}
  3677	CFI_NOSEAL(bpf_iter_bits_destroy_dtor);
  3678	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
