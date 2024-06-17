Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E67DD53B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 19:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718652001; cv=none; b=mGO5m3aQG+jJLpa8NLvtUCZ5YgzTrpTbfcK8qNaa35m2Q7oem+u/v9g1R3h56/N1rMY6DIMK3jGG5RUGwkxt13QEAHtSOBIub0g+ItNdOm/LjoQFeFhUCUGpGYAXrRWQCBcN8EL08AHEzuNMG9xDCBWtP/YNEY+Mee9kbR/zw8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718652001; c=relaxed/simple;
	bh=E/sMugfIavR6XyNlKIDF8mlzQsRnxGJ+H/v6Gr3qyh0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IxY9wU+uJ2oN+Cf3CbaEhqHKNHHEznUVkW0KelZ4CqJxyzUwJi1/PBla9VwleujIuneGip8wmN8tLvjPnQ6d1d5/7/pya2O/hCEZeYKhpqbZPare+5dm8O5UNwbMuPAFbUtJ7BFB72N8y1uocLQZCZJSpE6uQBuehYeI3juFeaM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gv94XWzN; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gv94XWzN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718652000; x=1750188000;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=E/sMugfIavR6XyNlKIDF8mlzQsRnxGJ+H/v6Gr3qyh0=;
  b=Gv94XWzNCOoAYdvzXR8kXxc4Srnp6+rFB6f4X2LPx8kxyWIV+BZCy9z+
   6jKX+9PyFcuGCPS7KMYKR5tS737KTObe/7+jc0bItEPwJ2GYfyMoLtLDq
   S/AKSqNjlZTFsWRuCXVOS659RIKhdZF/po0y7TNLWMGrndBhbeKBl35Eq
   YfqDDLQpNDn5sEFcf0iIQLA+r+mfnzWeFattnZep74qtRTY0pEiX57wv6
   WMkezgRIJ67QJSvvrlV536s+K5U/Mwa4MqZ+m4G5EcvYusufIcSVT8keV
   ZvZRckSaD1l+1S1anO7AdzZswsLgsdxjLS92ANr87txT6uX9M0Uq4XrDA
   g==;
X-CSE-ConnectionGUID: UZ2UOqkSSCS9dMogE2xBYA==
X-CSE-MsgGUID: sDyjv4brSHai/nQ5aH76dA==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15622397"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="15622397"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 12:19:59 -0700
X-CSE-ConnectionGUID: /iGsdkG0QwSX/9nsP0kgmg==
X-CSE-MsgGUID: qd12oc4bQZmamYVBzg7EVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="78755906"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 17 Jun 2024 12:19:57 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJHtT-0004oR-1s;
	Mon, 17 Jun 2024 19:19:55 +0000
Date: Tue, 18 Jun 2024 03:18:58 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18183/22954] mm/share_pool.c:2121:12:
 warning: 'proc_stat_show' defined but not used
Message-ID: <202406180323.ePxYZgH5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   297a8114a17425dccc02597803b1c8049eb3b91b
commit: 4a280fac30d27ae2aff096f9f99aa12d50f83426 [18183/22954] ascend: share_pool: support share pool features for ascend platform
config: arm64-randconfig-001-20240618 (https://download.01.org/0day-ci/archive/20240618/202406180323.ePxYZgH5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406180323.ePxYZgH5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180323.ePxYZgH5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/share_pool.c: In function 'sp_hugetlb_entry':
   mm/share_pool.c:1542:21: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
    1542 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^~~~~~~~~~~~~
   mm/share_pool.c:1542:21: error: invalid initializer
   mm/share_pool.c: In function 'sp_alloc_pages':
   mm/share_pool.c:2263:24: error: implicit declaration of function 'hugetlb_alloc_hugepage'; did you mean 'vmalloc_hugepage'? [-Werror=implicit-function-declaration]
    2263 |                 return hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
         |                        ^~~~~~~~~~~~~~~~~~~~~~
         |                        vmalloc_hugepage
   mm/share_pool.c:2263:61: error: 'HUGETLB_ALLOC_NONE' undeclared (first use in this function); did you mean 'HUGETLB_ANON_FILE'?
    2263 |                 return hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
         |                                                             ^~~~~~~~~~~~~~~~~~
         |                                                             HUGETLB_ANON_FILE
   mm/share_pool.c:2263:61: note: each undeclared identifier is reported only once for each function it appears in
   mm/share_pool.c:2266:1: warning: control reaches end of non-void function [-Wreturn-type]
    2266 | }
         | ^
   mm/share_pool.c: At top level:
   mm/share_pool.c:2235:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    2235 | static int spa_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~
>> mm/share_pool.c:2121:12: warning: 'proc_stat_show' defined but not used [-Wunused-function]
    2121 | static int proc_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/proc_stat_show +2121 mm/share_pool.c

  2120	
> 2121	static int proc_stat_show(struct seq_file *seq, void *offset)
  2122	{
  2123		/* print the file header */
  2124		seq_printf(seq, "%-12s %-10s %-18s\n",
  2125			   "Process ID", "Group ID", "Aligned Apply(KB)");
  2126		/* print kthread buff_module_guard_work */
  2127		seq_printf(seq, "%-12s %-10s %-18ld\n",
  2128			   "guard", "-", byte2kb(kthread_stat.amount));
  2129		idr_for_each(&sp_stat_idr, idr_proc_stat_cb, seq);
  2130		return 0;
  2131	}
  2132	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
