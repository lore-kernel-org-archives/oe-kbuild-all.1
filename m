Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 016123B1A2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 12:54:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735390479; cv=none; b=XfogUw45RvZM0WsE9jQ5yvw5yUPf2iZqRw3tOmdJZDIPXtQux64buWKCaXFIVAl6IO8O2V/KR20bbqDogyIxputXNCboGrIozrwZZnylULy1ZHc7hYLpeaipCCtDiWwl01Z7EolrsWq5n2XC5Q0GqDZhUkJaLygMnzf4l2FtclQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735390479; c=relaxed/simple;
	bh=wVGzlyiAN/e0Lg5MV/8YITF38KEqifkjKMwAvmPVQc4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nmJA3EmMOBAI4J9YlXGb4mYyA57wwHoA0MqEnjECgFpMPwaxLfuleC23/R1PHYY9sewc0pL+z0mCnSLRmcYAt/mvG6O/gL0itHgimdF8KsgTHdOrPT0nqRMYD1easEmhvB54E3xwVijSdN318iWtz3I+UXxpKC85bt135u9u8HU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TfJPMju2; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TfJPMju2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735390477; x=1766926477;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wVGzlyiAN/e0Lg5MV/8YITF38KEqifkjKMwAvmPVQc4=;
  b=TfJPMju2neKveL30akTS7slNbAs+q3SAT71iNDlmlNaRO33beTCX1oly
   +HeApnezT36Np9T+NwBJE0Tv5h46BVAJgrKXYwRc+K/q83k7ZSgsW4l58
   8cxCvbNjqjznh/VHsMZsWv0uOaC2GeZm30WddGh4PLS+TQ7fXi1A3feL8
   +D1cZrsx0w2jJfXV6bf0+RHtK5ZuU+HXdqg2ZsnRf9uzuIkbBJmfS/JTB
   Zcft0F1VayxyxLtKAfm5gIfGZhGgaxfZv5G06f44PP+nvloZ/rwKoC/Wo
   W77KobkNcrRo5A/6Zs3DAZa6tNzwu6Limou+GM5obxv4d1ARyt+zK4ubn
   A==;
X-CSE-ConnectionGUID: p8p+sk/VTOiyCnK3vwNuHQ==
X-CSE-MsgGUID: BgJJUcbXT9SvVOjKTJy6yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11299"; a="35981650"
X-IronPort-AV: E=Sophos;i="6.12,272,1728975600"; 
   d="scan'208";a="35981650"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 04:54:36 -0800
X-CSE-ConnectionGUID: 8yrCvvvAS5i9JLWAeMAuGA==
X-CSE-MsgGUID: UAXTqQp0T32PesmYg1bgsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100850660"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Dec 2024 04:54:35 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRWKv-00044w-0I;
	Sat, 28 Dec 2024 12:54:33 +0000
Date: Sat, 28 Dec 2024 20:53:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1355/1355] mm/share_pool.c:837:29:
 sparse: sparse: incompatible types for operation (<=):
Message-ID: <202412282007.9AwBcoM1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   773f731853f1368508a0b112047bd9b5a4bb9a5e
commit: 0f0c3021514f52310056c32406b4b760fc9a7e6e [1355/1355] share_pool: Apply sp_group_id_by_pid() to multi-group-mode
config: arm64-randconfig-r133-20241227 (https://download.01.org/0day-ci/archive/20241228/202412282007.9AwBcoM1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241228/202412282007.9AwBcoM1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412282007.9AwBcoM1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/share_pool.c:837:29: sparse: sparse: incompatible types for operation (<=):
   mm/share_pool.c:837:29: sparse:    int *num
   mm/share_pool.c:837:29: sparse:    int
   mm/share_pool.c: In function 'sp_group_id_by_pid':
   mm/share_pool.c:837:29: warning: ordered comparison of pointer with integer zero [-Wextra]
     837 |         if (!spg_ids || num <= 0)
         |                             ^~
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
   mm/share_pool.c:829: warning: Function parameter or member 'spg_ids' not described in 'sp_group_id_by_pid'
   mm/share_pool.c:829: warning: Function parameter or member 'num' not described in 'sp_group_id_by_pid'
   mm/share_pool.c:2423: warning: duplicate section name 'Return'

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
