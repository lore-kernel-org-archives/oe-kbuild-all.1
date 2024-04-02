Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E529E8F55
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Apr 2024 01:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712020300; cv=none; b=EvRc2/3F7a+uRpZpyyIbLrMkSaoKNWrRMC+88TZvXFrC0PSH6CgW/CZCIgkbQhASU5BynlEc7qC4DdNOu0icMSEJEsEcNXIU9IhGCta8aldoxyPLFyPdcT2RwR543rfgteaWPzGg1Bp282qwUybUDqiiP59mKh56CKzo+v3IqjE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712020300; c=relaxed/simple;
	bh=4uwq6KvpH4A/xwORuaAW85XMtyn6E6wb3ehd/VMrsQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J3s/GaqLrPkpLyUWzRUXi4aiy9HGIchygsXC4ff8jJ2c5WVhwmUgJ1Hav7cdFlrx4zwR/Anqrh8rXwU5Dnc/oOy4LuI37sQnviXXnSLvYMOWgx9w3RruRKMx8ANcGyRPddnXg1VUyMXoRvGqYsF0b650WKtgX83ewwWU/0dZ56o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M4G5UKJB; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M4G5UKJB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712020298; x=1743556298;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4uwq6KvpH4A/xwORuaAW85XMtyn6E6wb3ehd/VMrsQA=;
  b=M4G5UKJBbkO8DzvP8FyCuWSJC6FGCbI5bHblclmNh5qha10jd2+isbho
   l88y17ZPp5Bvds66PEk57CDTJ7PrT8yysAMFcvn2eV3AdAGxEBUV9gI95
   HJ+elasl4ntAKc/qEebQIqWudFVcydYV0hSbIlG+LXMTPb2pC5w3k90/S
   nX/qN1Xh9VLl0vrEqBDY7zyCr8ggSvq3QRJKcHad3SykhB6nH48pcbJjt
   Y2DgKPPKmdRbnBcq4CCOHGylFtZxUwdkQsdc0IHciVYi7tQZxhvBnT8xP
   iy5Hi8QtG/nQAgwAVLUmYZ7gf5I5CZDkhHQuIDoWO0Jo3gdq0Q891qFYB
   g==;
X-CSE-ConnectionGUID: vYy77pxxR7Smcfp72+uLAA==
X-CSE-MsgGUID: yDX+YLXYSUK6iP5IcoKrow==
X-IronPort-AV: E=McAfee;i="6600,9927,11031"; a="7285946"
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="7285946"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Apr 2024 18:11:27 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,173,1708416000"; 
   d="scan'208";a="17945429"
Received: from lkp-server02.sh.intel.com (HELO 90ee3aa53dbd) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Apr 2024 18:11:25 -0700
Received: from kbuild by 90ee3aa53dbd with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rrSgN-0000jp-0a;
	Tue, 02 Apr 2024 01:11:23 +0000
Date: Tue, 2 Apr 2024 09:11:22 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18302/22019] mm/share_pool.c:837:29:
 sparse: sparse: incompatible types for operation (<=):
Message-ID: <202404020952.XAujhr6P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   bca07979c0a7054331b91c892163a0d214cffcbe
commit: 0f0c3021514f52310056c32406b4b760fc9a7e6e [18302/22019] share_pool: Apply sp_group_id_by_pid() to multi-group-mode
config: arm64-randconfig-r111-20240331 (https://download.01.org/0day-ci/archive/20240402/202404020952.XAujhr6P-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240402/202404020952.XAujhr6P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404020952.XAujhr6P-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/share_pool.c:837:29: sparse: sparse: incompatible types for operation (<=):
   mm/share_pool.c:837:29: sparse:    int *num
   mm/share_pool.c:837:29: sparse:    int
   mm/share_pool.c:1628:9: sparse: sparse: undefined identifier 'sysctl_compaction_handler'
   mm/share_pool.c: In function 'sp_group_id_by_pid':
   mm/share_pool.c:837:29: warning: ordered comparison of pointer with integer zero [-Wextra]
     837 |         if (!spg_ids || num <= 0)
         |                             ^~
   mm/share_pool.c: In function 'sp_compact_nodes':
   mm/share_pool.c:1628:9: error: implicit declaration of function 'sysctl_compaction_handler' [-Werror=implicit-function-declaration]
    1628 |         sysctl_compaction_handler(NULL, 1, NULL, NULL, NULL);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   In function 'vmalloc_area_clr_flag',
       inlined from 'sp_make_share_k2u' at mm/share_pool.c:2550:8:
   mm/share_pool.c:2396:18: warning: 'spa' may be used uninitialized [-Wmaybe-uninitialized]
    2396 |         spa->kva = 0;
         |         ~~~~~~~~~^~~
   mm/share_pool.c: In function 'sp_make_share_k2u':
   mm/share_pool.c:2429:25: note: 'spa' was declared here
    2429 |         struct sp_area *spa;
         |                         ^~~
   mm/share_pool.c:2562:16: warning: 'uva' may be used uninitialized [-Wmaybe-uninitialized]
    2562 |         return uva;
         |                ^~~
   mm/share_pool.c:2427:15: note: 'uva' was declared here
    2427 |         void *uva;
         |               ^~~
   mm/share_pool.c: In function 'sp_group_post_exit':
   mm/share_pool.c:3863:37: warning: 'alloc_size' may be used uninitialized [-Wmaybe-uninitialized]
    3863 |                 if (alloc_size != 0 || k2u_size != 0)
         |                     ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   mm/share_pool.c:3831:14: note: 'alloc_size' was declared here
    3831 |         long alloc_size, k2u_size;
         |              ^~~~~~~~~~
   mm/share_pool.c:3863:37: warning: 'k2u_size' may be used uninitialized [-Wmaybe-uninitialized]
    3863 |                 if (alloc_size != 0 || k2u_size != 0)
         |                     ~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~
   mm/share_pool.c:3831:26: note: 'k2u_size' was declared here
    3831 |         long alloc_size, k2u_size;
         |                          ^~~~~~~~
   cc1: some warnings being treated as errors

vim +837 mm/share_pool.c

   815	
   816	/**
   817	 * sp_group_id_by_pid() - Get the sp_group ID array of a process.
   818	 * @pid: pid of target process.
   819	 * @spg_ids point to an array to save the group ids the process belongs to
   820	 * @num input the spg_ids array size; output the spg number of the process
   821	 *
   822	 * Return:
   823	 * >0		- the sp_group ID.
   824	 * -ENODEV	- target process doesn't belong to any sp_group.
   825	 * -EINVAL	- spg_ids or num is NULL.
   826	 * -E2BIG	- the num of groups process belongs to is larger than *num
   827	 */
   828	int sp_group_id_by_pid(int pid, int *spg_ids, int *num)
   829	{
   830		int ret = 0;
   831		struct sp_group_node *node;
   832		struct sp_group_master *master = NULL;
   833		struct task_struct *tsk;
   834	
   835		check_interrupt_context();
   836	
 > 837		if (!spg_ids || num <= 0)
   838			return -EINVAL;
   839	
   840		ret = get_task(pid, &tsk);
   841		if (ret)
   842			return ret;
   843	
   844		down_read(&sp_group_sem);
   845		task_lock(tsk);
   846		if (tsk->mm)
   847			master = tsk->mm->sp_group_master;
   848		task_unlock(tsk);
   849	
   850		if (!master) {
   851			ret = -ENODEV;
   852			goto out_up_read;
   853		}
   854	
   855		if (!master->count) {
   856			ret = -ENODEV;
   857			goto out_up_read;
   858		}
   859		if ((unsigned int)*num < master->count) {
   860			ret = -E2BIG;
   861			goto out_up_read;
   862		}
   863		*num = master->count;
   864	
   865		list_for_each_entry(node, &master->node_list, group_node)
   866			*(spg_ids++) = node->spg->id;
   867	
   868	out_up_read:
   869		up_read(&sp_group_sem);
   870		put_task_struct(tsk);
   871		return ret;
   872	}
   873	EXPORT_SYMBOL_GPL(sp_group_id_by_pid);
   874	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
