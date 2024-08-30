Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 111F5199FB7
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 16:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725034103; cv=none; b=m9vYm73W25/pP/kMT+sN5wX2A6/ZFb5WHzzcuLEAe2rB/QH6AA8LIrSKWgUzWAiEUor7zSMo0JM+pEqNZkrHra546GNYusc2QEoHdyjRDUk3j7r+SfOXBBUp+3nD5uNJ7FoNxtiDCRupgpSNbM1rJ12Nr8O0PupqmAM+HoWSYyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725034103; c=relaxed/simple;
	bh=xWuumBZUjcCyekLxweCz/n24NMP/Q3YxWD8BcStGJlc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t4TaKNxnmpZ2KJ+2IO82b3NZP0+D6ftiMeJVQJNaz2Qi3U3aBFFH5qOgZBBC9Ky+skMURCYi0IA2GtDilwzBnRvaeHo9zXx3s3ZAiyYmw+mKPwmRlVmKSUkjEEXugcvd7yW3sUEfbuP2krLSfCcHGu2QZwM5AsCal7ptPCKeM9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EeBr4GeH; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EeBr4GeH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725034101; x=1756570101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xWuumBZUjcCyekLxweCz/n24NMP/Q3YxWD8BcStGJlc=;
  b=EeBr4GeHa38/Civdj4IL0RlWyiu4Sue/pZ6tbOj609Kat/wEhnzvMKeh
   0+k5yEnLJhMw/nKVbnJkSQ9b55xYLOdv9FdfYGffiA6ddFgs9Dgx7mPUv
   amXBSRhcYeFvdZjYpS+R0ZDOnmJjCxWnSL/KL1bjbW1YfMuH+4bAuJyVA
   hMCc+H1kUtb5yMokppsNe27iWT1fCf0RVXfvOcRaQ5CXteAVfYrVm07Bh
   WVx5oJVgkBP4rLEPp0b44JtXfdI6KDlrLog2iR+0IrRDWorIdNWlx7RXr
   3KxRWCb04QIIVAXbUFpEirknecUhE6z9fO1ki27dsKl1tdIWc/Y1zmZNz
   A==;
X-CSE-ConnectionGUID: rdO6t3kcS1yeyAoy0optdw==
X-CSE-MsgGUID: Q9Bjav5qRpGi+O2KpkA7QA==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="34255320"
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="34255320"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 09:08:21 -0700
X-CSE-ConnectionGUID: ysqcwFeqSwSrtjTmX8rehw==
X-CSE-MsgGUID: IWW0MhrwTW++bvPA1BmqqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,189,1719903600"; 
   d="scan'208";a="94674488"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 30 Aug 2024 09:08:17 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sk4AY-0001cs-2n;
	Fri, 30 Aug 2024 16:08:14 +0000
Date: Sat, 31 Aug 2024 00:07:38 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, deshengwu@tencent.com,
	flyingpeng@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 9880/10950] kernel/tkernel/aegis/module.c:15:6:
 sparse: sparse: symbol 'hook_disable' was not declared. Should it be static?
Message-ID: <202408310021.y7z7EzpL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   c99409f7fe0f14dae19af75e7e896e7a17b92946
commit: 62b6061f5714aa71e2d5fdb14db9d1341bb82dd4 [9880/10950] [PATCH] security: add security hook point
config: x86_64-randconfig-121-20240830 (https://download.01.org/0day-ci/archive/20240831/202408310021.y7z7EzpL-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408310021.y7z7EzpL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408310021.y7z7EzpL-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/tkernel/aegis/module.c:15:6: sparse: sparse: symbol 'hook_disable' was not declared. Should it be static?
>> kernel/tkernel/aegis/module.c:65:5: sparse: sparse: symbol 'hook_sysfs_init' was not declared. Should it be static?
>> kernel/tkernel/aegis/module.c:80:6: sparse: sparse: symbol 'hook_sysfs_exit' was not declared. Should it be static?
--
>> kernel/tkernel/aegis/list.c:20:15: sparse: sparse: symbol 'percpu_total_num' was not declared. Should it be static?
>> kernel/tkernel/aegis/list.c:33:15: sparse: sparse: symbol 'percpu_total_num_atomic64' was not declared. Should it be static?
>> kernel/tkernel/aegis/list.c:46:5: sparse: sparse: symbol 'clear_hookinfo_list' was not declared. Should it be static?
>> kernel/tkernel/aegis/list.c:73:6: sparse: sparse: symbol 'clear_cpu_list' was not declared. Should it be static?
>> kernel/tkernel/aegis/list.c:95:17: sparse: sparse: cast to restricted __poll_t
>> kernel/tkernel/aegis/list.c:142:32: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *proc_poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   kernel/tkernel/aegis/list.c:142:32: sparse:     expected restricted __poll_t ( *proc_poll )( ... )
   kernel/tkernel/aegis/list.c:142:32: sparse:     got unsigned int ( * )( ... )
>> kernel/tkernel/aegis/list.c:176:5: sparse: sparse: symbol 'hook_info_proc_create' was not declared. Should it be static?
>> kernel/tkernel/aegis/list.c:206:6: sparse: sparse: symbol 'hook_info_proc_delete' was not declared. Should it be static?
>> kernel/tkernel/aegis/list.c:211:5: sparse: sparse: symbol 'hook_info_percpu_create' was not declared. Should it be static?
>> kernel/tkernel/aegis/list.c:254:5: sparse: sparse: symbol 'hook_info_percpu_delete' was not declared. Should it be static?
>> kernel/tkernel/aegis/list.c:269:5: sparse: sparse: symbol 'hook_info_func_register' was not declared. Should it be static?
>> kernel/tkernel/aegis/list.c:301:6: sparse: sparse: symbol 'init_wait_queue' was not declared. Should it be static?
--
>> kernel/tkernel/aegis/hook_info.c:19:6: sparse: sparse: symbol 'ssh_info_head' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:20:6: sparse: sparse: symbol 'ssh_tty_head' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:37:14: sparse: sparse: symbol 'para_len_current' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:38:14: sparse: sparse: symbol 'para_sum_current' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:39:15: sparse: sparse: symbol 'min_para_len' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:40:15: sparse: sparse: symbol 'max_para_len' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:42:15: sparse: sparse: symbol 'sysctl_para_len' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:43:15: sparse: sparse: symbol 'sysctl_para_sum' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:44:15: sparse: sparse: symbol 'sysctl_info_num' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:47:15: sparse: sparse: symbol 'sysctl_set_min' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:48:15: sparse: sparse: symbol 'sysctl_set_max' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:75:39: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __user * @@     got void * @@
   kernel/tkernel/aegis/hook_info.c:75:39: sparse:     expected char const [noderef] __user *
   kernel/tkernel/aegis/hook_info.c:75:39: sparse:     got void *
   kernel/tkernel/aegis/hook_info.c:82:31: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __user * @@     got void * @@
   kernel/tkernel/aegis/hook_info.c:82:31: sparse:     expected char const [noderef] __user *
   kernel/tkernel/aegis/hook_info.c:82:31: sparse:     got void *
>> kernel/tkernel/aegis/hook_info.c:87:6: sparse: sparse: symbol 'hookinfo_total_numb' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:92:6: sparse: sparse: symbol 'hookinfo_drop_stats' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:97:6: sparse: sparse: symbol 'clear_task_environ' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:114:5: sparse: sparse: symbol 'get_task_environ' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:200:5: sparse: sparse: symbol 'get_task_para' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:291:6: sparse: sparse: symbol 'get_pidns_inum' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:305:6: sparse: sparse: symbol 'get_task_ids' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:317:6: sparse: sparse: symbol 'get_task_pwd' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:340:6: sparse: sparse: symbol 'get_task_start_time' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:345:6: sparse: sparse: symbol 'info_ptr_hold_ref' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:415:37: sparse: sparse: Using plain integer as NULL pointer
   kernel/tkernel/aegis/hook_info.c:419:33: sparse: sparse: Using plain integer as NULL pointer
   kernel/tkernel/aegis/hook_info.c:423:39: sparse: sparse: Using plain integer as NULL pointer
   kernel/tkernel/aegis/hook_info.c:427:38: sparse: sparse: Using plain integer as NULL pointer
>> kernel/tkernel/aegis/hook_info.c:619:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/tkernel/aegis/hook_info.c:619:52: sparse:     expected void *
   kernel/tkernel/aegis/hook_info.c:619:52: sparse:     got void [noderef] __user *buffer
>> kernel/tkernel/aegis/hook_info.c:607:5: sparse: sparse: symbol 'para_len_sum_handler' was not declared. Should it be static?
   kernel/tkernel/aegis/hook_info.c:648:52: sparse: sparse: incorrect type in argument 3 (different address spaces) @@     expected void * @@     got void [noderef] __user *buffer @@
   kernel/tkernel/aegis/hook_info.c:648:52: sparse:     expected void *
   kernel/tkernel/aegis/hook_info.c:648:52: sparse:     got void [noderef] __user *buffer
>> kernel/tkernel/aegis/hook_info.c:640:5: sparse: sparse: symbol 'secur_sysctl_handler' was not declared. Should it be static?
>> kernel/tkernel/aegis/hook_info.c:666:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/tkernel/aegis/hook_info.c:666:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/tkernel/aegis/hook_info.c:666:35: sparse:     got int ( * )( ... )
   kernel/tkernel/aegis/hook_info.c:675:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/tkernel/aegis/hook_info.c:675:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/tkernel/aegis/hook_info.c:675:35: sparse:     got int ( * )( ... )
   kernel/tkernel/aegis/hook_info.c:684:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/tkernel/aegis/hook_info.c:684:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/tkernel/aegis/hook_info.c:684:35: sparse:     got int ( * )( ... )
   kernel/tkernel/aegis/hook_info.c:693:35: sparse: sparse: incorrect type in initializer (incompatible argument 3 (different address spaces)) @@     expected int ( [usertype] *proc_handler )( ... ) @@     got int ( * )( ... ) @@
   kernel/tkernel/aegis/hook_info.c:693:35: sparse:     expected int ( [usertype] *proc_handler )( ... )
   kernel/tkernel/aegis/hook_info.c:693:35: sparse:     got int ( * )( ... )

vim +/hook_disable +15 kernel/tkernel/aegis/module.c

    14	
  > 15	void hook_disable(void)
    16	{
    17		mutex_lock(&hook_lock);
    18		hook_info_flag = 0;
    19		smp_wmb();
    20		hook_info_func_unregister();
    21		if (!module_putted && !hookinfo_nr()) {
    22			module_put(THIS_MODULE);
    23			module_putted = true;
    24		}
    25		mutex_unlock(&hook_lock);
    26	}
    27	
    28	static ssize_t disable_show(struct kobject *kobj, struct kobj_attribute *attr,
    29			char *buf)
    30	{
    31		return sprintf(buf, "%s\t%s\t%ld\n",
    32				hook_info_flag ? "enabled" : "disabled",
    33				module_putted ? "unused" : "inuse", hookinfo_nr());
    34	}
    35	
    36	static ssize_t disable_store(struct kobject *kobj,
    37			struct kobj_attribute *attr,
    38			const char *buf, size_t count)
    39	{
    40		unsigned long v;
    41	
    42		if (kstrtoul(buf, 0, &v))
    43			return -EINVAL;
    44	
    45		if ((v & 0xffffffff00000000) !=  SYSCTL_SET_MAGIC)
    46			return -EINVAL;
    47	
    48		if (v & 0x00000000ffffffff)
    49			hook_disable();
    50	
    51		return count;
    52	}
    53	
    54	KERNEL_ATTR_RW(disable);
    55	
    56	static struct attribute *security_moni_attrs[] = {
    57		&disable_attr.attr,
    58		NULL
    59	};
    60	
    61	static struct attribute_group hook_attrs_group = {
    62		.attrs = security_moni_attrs,
    63	};
    64	
  > 65	int hook_sysfs_init(void)
    66	{
    67		int ret;
    68	
    69		hook_sysfs_kset = kset_create_and_add("aegis", NULL, kernel_kobj);
    70		if (!hook_sysfs_kset)
    71			return -ENOMEM;
    72	
    73		ret = sysfs_create_group(&hook_sysfs_kset->kobj, &hook_attrs_group);
    74		if (ret)
    75			kset_unregister(hook_sysfs_kset);
    76	
    77		return ret;
    78	}
    79	
  > 80	void hook_sysfs_exit(void)
    81	{
    82		sysfs_remove_group(&hook_sysfs_kset->kobj, &hook_attrs_group);
    83		kset_unregister(hook_sysfs_kset);
    84	}
    85	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
