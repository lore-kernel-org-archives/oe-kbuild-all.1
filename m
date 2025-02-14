Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E541DC99C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Feb 2025 22:54:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739573670; cv=none; b=ZSL9jXkJcgn0X7cmcm+AWjxzxwPO3HLKnV3O+xHN71wHLn7mJ2tlcSNld72HUqoJlboFcfjgPyVYMIG1IjwGxPeBgQN/qV7ymYeFaAlRxzf27M9nnGoiwQ8ZWZo5iHCPQpzk/tjmPcDM2lN29jYRdRN7L3OVh3/q+r80o+hDOUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739573670; c=relaxed/simple;
	bh=iDJ58tmEGp9elj5UolgsLJe+8IX57O3Calpsy3mTLUk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=svFW12Q11146eN7qQm497JYxeYZjpnu+HD1Z6MEupp1He6idUNo1I5IertqvkBxz8N22AMXyjMYQe6N71vZhWHT63QfQt8KroK1aIMt0oVLUlwUhT3oiweCJCPcMdv26Zj2LU5MmzkPZ6N7HdcXadOtjkzi2rV+OsZO3mhWVzxY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJbDAuHB; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJbDAuHB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739573668; x=1771109668;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iDJ58tmEGp9elj5UolgsLJe+8IX57O3Calpsy3mTLUk=;
  b=bJbDAuHB+m8n8ynnlUGhCdtQotc0F6vyVORSLBt7i8JYCXIW9DXQcLmA
   r0Vob9RhFELbix2lQORkQc8dBdVUkFE6Pb+SryK5y/+2WC8y1eDNovkCy
   JYFsBW7DmHbrXVPWXI/AXPluK3CeFpaJxqlex/kRyUhn04B3BUh+jRj6A
   Cu+gwN191OcNCMHxpeCwXXqHA5el+G9m/up0t8NpvmPrdxdLX+lg0AGdi
   otcgoY3Ildoyb3bqEXmhgP04IzSIK5YvKlz+D7akOzeR81XcPevfPlK9G
   Qj/R8O7VYiiA+vYIpa6EMHVcovPv7wYzWR2nO1qVZF8lO74ob+JX+3f2E
   Q==;
X-CSE-ConnectionGUID: nFdk44aGQe28gKmo3crMjA==
X-CSE-MsgGUID: gx+Wk6N9Q3CgQe2Cs/VPuA==
X-IronPort-AV: E=McAfee;i="6700,10204,11345"; a="39521617"
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="39521617"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2025 14:54:27 -0800
X-CSE-ConnectionGUID: FcGUOWAgQJa8YMpnAxoCKg==
X-CSE-MsgGUID: qo6S2t0sS0K0kDhknZpFdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,287,1732608000"; 
   d="scan'208";a="118605624"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 14 Feb 2025 14:54:26 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tj4Zj-001AG9-36;
	Fri, 14 Feb 2025 22:54:23 +0000
Date: Sat, 15 Feb 2025 06:54:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1926/1926] mm/share_pool.c:68: warning: expecting
 prototype for mp_sp_group_id_by_pid(). Prototype was for
 mg_sp_group_id_by_pid() instead
Message-ID: <202502150605.wrnTujjy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   56197cf035ddc0d25f6d27169455448133fd75dd
commit: fb31808921b891789a2f6cbfc7e277fd0918144a [1926/1926] mm/sharepool: Add base framework for share_pool
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250215/202502150605.wrnTujjy-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250215/202502150605.wrnTujjy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502150605.wrnTujjy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/share_pool.c:68: warning: expecting prototype for mp_sp_group_id_by_pid(). Prototype was for mg_sp_group_id_by_pid() instead
>> mm/share_pool.c:176: warning: duplicate section name 'Return'
>> mm/share_pool.c:211: warning: Function parameter or member 'spg_id' not described in 'mg_sp_unshare'


vim +68 mm/share_pool.c

    54	
    55	/**
    56	 * mp_sp_group_id_by_pid() - Get the sp_group ID array of a process.
    57	 * @tgid: tgid of target process.
    58	 * @spg_ids: point to an array to save the group ids the process belongs to
    59	 * @num: input the spg_ids array size; output the spg number of the process
    60	 *
    61	 * Return:
    62	 * >0		- the sp_group ID.
    63	 * -ENODEV	- target process doesn't belong to any sp_group.
    64	 * -EINVAL	- spg_ids or num is NULL.
    65	 * -E2BIG	- the num of groups process belongs to is larger than *num
    66	 */
    67	int mg_sp_group_id_by_pid(int tgid, int *spg_ids, int *num)
  > 68	{
    69		return -EOPNOTSUPP;
    70	}
    71	EXPORT_SYMBOL_GPL(mg_sp_group_id_by_pid);
    72	
    73	/**
    74	 * mg_sp_group_add_task() - Add a process to an share group (sp_group).
    75	 * @tgid: the tgid of the task to be added.
    76	 * @prot: the prot of task for this spg.
    77	 * @spg_id: the ID of the sp_group.
    78	 *
    79	 * Return: A postive group number for success, -errno on failure.
    80	 *
    81	 * Valid @spg_id:
    82	 * [SPG_ID_MIN, SPG_ID_MAX]:
    83	 *              the task would be added to the group with @spg_id, if the
    84	 *              group doesn't exist, just create it.
    85	 * [SPG_ID_AUTO_MIN, SPG_ID_AUTO_MAX]:
    86	 *              the task would be added to the group with @spg_id, if it
    87	 *              doesn't exist ,return failed.
    88	 * SPG_ID_AUTO:
    89	 *              the task would be added into a new group with a new id in range
    90	 *              [SPG_ID_AUTO_MIN, SPG_ID_AUTO_MAX].
    91	 *
    92	 * This function can be taken into four parts:
    93	 * 1. Check and initlize the task specified by @tgid properly.
    94	 * 2. Create or get the spg specified by @spg_id.
    95	 * 3. Check the spg and task together and link the task into the spg if
    96	 *    everything looks good.
    97	 * 4. Map the existing sp_area from the spg into the new task.
    98	 */
    99	int mg_sp_group_add_task(int tgid, unsigned long prot, int spg_id)
   100	{
   101		return -EOPNOTSUPP;
   102	}
   103	EXPORT_SYMBOL_GPL(mg_sp_group_add_task);
   104	
   105	int mg_sp_id_of_current(void)
   106	{
   107		return -EOPNOTSUPP;
   108	}
   109	EXPORT_SYMBOL_GPL(mg_sp_id_of_current);
   110	
   111	/**
   112	 * mg_sp_free() - Free the memory allocated by mg_sp_alloc() or
   113	 * mg_sp_alloc_nodemask().
   114	 *
   115	 * @addr: the starting VA of the memory.
   116	 * @id: Address space identifier, which is used to distinguish the addr.
   117	 *
   118	 * Return:
   119	 * * 0		- success.
   120	 * * -EINVAL	- the memory can't be found or was not allocated by share pool.
   121	 * * -EPERM	- the caller has no permision to free the memory.
   122	 */
   123	int mg_sp_free(unsigned long addr, int id)
   124	{
   125		return -EOPNOTSUPP;
   126	}
   127	EXPORT_SYMBOL_GPL(mg_sp_free);
   128	
   129	static void __init proc_sharepool_init(void)
   130	{
   131		if (!proc_mkdir("sharepool", NULL))
   132			return;
   133	}
   134	
   135	void *mg_sp_alloc_nodemask(unsigned long size, unsigned long sp_flags, int spg_id,
   136			nodemask_t nodemask)
   137	{
   138		return ERR_PTR(-EOPNOTSUPP);
   139	}
   140	EXPORT_SYMBOL_GPL(mg_sp_alloc_nodemask);
   141	
   142	/**
   143	 * mg_sp_alloc() - Allocate shared memory for all the processes in a sp_group.
   144	 * @size: the size of memory to allocate.
   145	 * @sp_flags: how to allocate the memory.
   146	 * @spg_id: the share group that the memory is allocated to.
   147	 *
   148	 * Use pass through allocation if spg_id == SPG_ID_DEFAULT in multi-group mode.
   149	 *
   150	 * Return:
   151	 * * if succeed, return the starting address of the shared memory.
   152	 * * if fail, return the pointer of -errno.
   153	 */
   154	void *mg_sp_alloc(unsigned long size, unsigned long sp_flags, int spg_id)
   155	{
   156		return ERR_PTR(-EOPNOTSUPP);
   157	}
   158	EXPORT_SYMBOL_GPL(mg_sp_alloc);
   159	
   160	/**
   161	 * mg_sp_make_share_k2u() - Share kernel memory to current process or an sp_group.
   162	 * @kva: the VA of shared kernel memory.
   163	 * @size: the size of shared kernel memory.
   164	 * @sp_flags: how to allocate the memory. We only support SP_DVPP.
   165	 * @tgid:  the tgid of the specified process (Not currently in use).
   166	 * @spg_id: the share group that the memory is shared to.
   167	 *
   168	 * Return: the shared target user address to start at
   169	 *
   170	 * Share kernel memory to current task if spg_id == SPG_ID_NONE
   171	 * or SPG_ID_DEFAULT in multi-group mode.
   172	 *
   173	 * Return:
   174	 * * if succeed, return the shared user address to start at.
   175	 * * if fail, return the pointer of -errno.
 > 176	 */
   177	void *mg_sp_make_share_k2u(unsigned long kva, unsigned long size,
   178				unsigned long sp_flags, int tgid, int spg_id)
   179	{
   180		return ERR_PTR(-EOPNOTSUPP);
   181	}
   182	EXPORT_SYMBOL_GPL(mg_sp_make_share_k2u);
   183	
   184	/**
   185	 * mg_sp_make_share_u2k() - Share user memory of a specified process to kernel.
   186	 * @uva: the VA of shared user memory
   187	 * @size: the size of shared user memory
   188	 * @tgid: the tgid of the specified process(Not currently in use)
   189	 *
   190	 * Return:
   191	 * * if success, return the starting kernel address of the shared memory.
   192	 * * if failed, return the pointer of -errno.
   193	 */
   194	void *mg_sp_make_share_u2k(unsigned long uva, unsigned long size, int tgid)
   195	{
   196		return ERR_PTR(-EOPNOTSUPP);
   197	}
   198	EXPORT_SYMBOL_GPL(mg_sp_make_share_u2k);
   199	
   200	/**
   201	 * mg_sp_unshare() - Unshare the kernel or user memory which shared by calling
   202	 *                sp_make_share_{k2u,u2k}().
   203	 * @va: the specified virtual address of memory
   204	 * @size: the size of unshared memory
   205	 *
   206	 * Use spg_id of current thread if spg_id == SPG_ID_DEFAULT.
   207	 *
   208	 * Return: 0 for success, -errno on failure.
   209	 */
   210	int mg_sp_unshare(unsigned long va, unsigned long size, int spg_id)
 > 211	{
   212		return -EOPNOTSUPP;
   213	}
   214	EXPORT_SYMBOL_GPL(mg_sp_unshare);
   215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
