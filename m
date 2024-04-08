Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E70149007
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 Apr 2024 23:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712620212; cv=none; b=NIVC8swurw2cuCPBlF6J0A5qLxw2+eQn2FHlnFurmc1/6/Fgk/S/h2oYDkdmDumVTgi52o9QdlZChJss5fDIr/Kz74z15QChMs4dc5HDFuyO1/SOtfofdqG/8m1iFhdrXO02U3ht91gcUFfoCrjVVZiBkwWJwRpuoiYVEDIp7ZI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712620212; c=relaxed/simple;
	bh=LLcjiI0pSeFKv1C5PSocqh2nT/n/rEo1I0KFwVpGJKA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J2gQGbW7Y7Hrnqn6yuQphdgy8909OFRzi5Bg8/B4cjDPlmlZIyReFNqj8FJ+16lDOIcTD0l/AnmFYYEYsSfD2/AAlP64U0Fw4/SndwCE1hdbGp0u0Y9s/JnsRL+NQGFFkupZchn0dJwpL/4C0HRJD18y3Dlud+iGrk1u9mErkWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RrG4926J; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RrG4926J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1712620210; x=1744156210;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LLcjiI0pSeFKv1C5PSocqh2nT/n/rEo1I0KFwVpGJKA=;
  b=RrG4926JJ7JKLTltB49C3R1+dVmlJ5aehS9ieYDNu32SuYMqYRNXAa14
   XIuw6Z0I7Q5UfLEBIhgp8xu+ynMIbHZts4poGMbUx/rFHYFbYQZIXcdw+
   rA69DE7BWZqdpXwn0TXKISjolKNH+NniRgt3atjxKrbBRfgtfaMDVqiDn
   Aw+INW16CvEeuWR4NYJq0OeFojrJ60b5cqYRyGN7NX9li4P1fjor+CaTN
   hL7XsSZMUPeDhOuqyw79+LZxwSaetHvHD3XBiP9W428Pts5d64f6AUKxt
   9WlrLlOwvoxqVBv33c+kb+DMlKKGYVR/KDAl3DkIhHNSEHkBc8UyIPLrU
   Q==;
X-CSE-ConnectionGUID: T6mXsTz4RMWpX1e+0sqQ2g==
X-CSE-MsgGUID: OES/P8AHQtq23zlpdj2wFQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11038"; a="25365768"
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="25365768"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Apr 2024 16:50:07 -0700
X-CSE-ConnectionGUID: Enrp1Na9RNmHoGLYnLMEBg==
X-CSE-MsgGUID: /U30eXFyRy6x8mlS0KL/BA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,187,1708416000"; 
   d="scan'208";a="24674846"
Received: from lkp-server01.sh.intel.com (HELO e61807b1d151) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Apr 2024 16:50:06 -0700
Received: from kbuild by e61807b1d151 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rtykW-0005Yo-0Y;
	Mon, 08 Apr 2024 23:50:04 +0000
Date: Tue, 9 Apr 2024 07:49:36 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18302/22054] mm/share_pool.c:837:29:
 sparse: sparse: incompatible types for operation (<=):
Message-ID: <202404090717.XitFSfCo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   1ed85cbd67db3ccd721e15f7459154e8daec22a8
commit: 0f0c3021514f52310056c32406b4b760fc9a7e6e [18302/22054] share_pool: Apply sp_group_id_by_pid() to multi-group-mode
config: arm64-randconfig-r111-20240331 (https://download.01.org/0day-ci/archive/20240409/202404090717.XitFSfCo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240409/202404090717.XitFSfCo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404090717.XitFSfCo-lkp@intel.com/

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
