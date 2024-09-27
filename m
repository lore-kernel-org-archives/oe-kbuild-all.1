Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9652F1B655F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Sep 2024 23:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727479314; cv=none; b=b7kUSbVKJQgDWhoXkkl3v6YRMt0UldlHypFHF9sOnos8LWtAvcedIGm3yx5Oc9S6frD4rWxXguIiaK4gHkx1asGDwQ8AQKBnGazTS/oSkgeHYsQPXSo1179mPjvfyTRkW2nm/hIE61dZvw8YCRT+6LKAMheS6cw/MIpjrXh+e40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727479314; c=relaxed/simple;
	bh=ZrQv4InVXXz+2aCfPlnpj1traFLNbn+jReSJVVQTJe8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=M6ZozDsRD35zrAbcgUG9BwPgYIte6kGVmGN77vZwiRuQHN88j2Pfj5UbPmnwl+SHmmRESyFgvSTG2Qz3BS1hw7/1VxFvR/3D/+k6ucSgW+w1q6s/TM1igw8GDRrk9hwj0cAHFSja/nYvRkIEI5HMEqfaSx1QNLlfCNlRVJ57gOU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YKgKf0f+; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YKgKf0f+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727479313; x=1759015313;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZrQv4InVXXz+2aCfPlnpj1traFLNbn+jReSJVVQTJe8=;
  b=YKgKf0f+jrX1EKN4Z2gnrg9+YdOZ536QuQc5rS+QDePmwytYcmZaBLSu
   dvcr0NMByanzOfdy0rGEURvkYGDqvZWpdTtaMaunjAo09ovDdc6noyf/G
   /9teFbfysZtuC+OsZSlKmY+Sl3YuJq82V7e0uPBCnp1tUge7DC/FNofQV
   P9PKAjQfxMP+LAajn98NTpwHzS6ciCAvYQyuQXaZIJOg4ZzN0FHinOxwZ
   x4qu/WxPqMBuhgAlza6sEP8qEzE9x7V65iRGFh7mGcb82gsxIMTRNeFdO
   KmFFJL8ERL2dIcQ1DF5cOj9L+1mwCZ9CbGEryBU1PyUwSjTZOyyabzhF+
   w==;
X-CSE-ConnectionGUID: k1GRjACuQm2IzlHCbrLmmg==
X-CSE-MsgGUID: qRbBid/9QG+kHiJEqbnrSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11208"; a="38024887"
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="38024887"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2024 16:21:52 -0700
X-CSE-ConnectionGUID: 7IJCjh7dSVq5LG64aaRCwQ==
X-CSE-MsgGUID: RsNexRLDS1SAJAUEvJ9IOg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,160,1725346800"; 
   d="scan'208";a="103458680"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Sep 2024 16:21:50 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suKHU-000Mif-1k;
	Fri, 27 Sep 2024 23:21:48 +0000
Date: Sat, 28 Sep 2024 07:21:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18183/23799] mm/share_pool.c:1542:21:
 error: implicit declaration of function 'huge_ptep_get'
Message-ID: <202409280759.ueQXB2WQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3841d75a6dcd12d108aaf56560b99431d18169e4
commit: 4a280fac30d27ae2aff096f9f99aa12d50f83426 [18183/23799] ascend: share_pool: support share pool features for ascend platform
config: arm64-randconfig-003-20240928 (https://download.01.org/0day-ci/archive/20240928/202409280759.ueQXB2WQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240928/202409280759.ueQXB2WQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409280759.ueQXB2WQ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   mm/share_pool.c: In function 'sp_hugetlb_entry':
>> mm/share_pool.c:1542:21: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
    1542 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^~~~~~~~~~~~~
>> mm/share_pool.c:1542:21: error: invalid initializer
   mm/share_pool.c: In function 'sp_alloc_pages':
>> mm/share_pool.c:2263:24: error: implicit declaration of function 'hugetlb_alloc_hugepage'; did you mean 'vmalloc_hugepage'? [-Werror=implicit-function-declaration]
    2263 |                 return hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
         |                        ^~~~~~~~~~~~~~~~~~~~~~
         |                        vmalloc_hugepage
>> mm/share_pool.c:2263:61: error: 'HUGETLB_ALLOC_NONE' undeclared (first use in this function); did you mean 'HUGETLB_ANON_FILE'?
    2263 |                 return hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
         |                                                             ^~~~~~~~~~~~~~~~~~
         |                                                             HUGETLB_ANON_FILE
   mm/share_pool.c:2263:61: note: each undeclared identifier is reported only once for each function it appears in
   mm/share_pool.c:2266:1: warning: control reaches end of non-void function [-Wreturn-type]
    2266 | }
         | ^
   mm/share_pool.c: At top level:
>> mm/share_pool.c:2235:12: warning: 'spa_stat_show' defined but not used [-Wunused-function]
    2235 | static int spa_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~
>> mm/share_pool.c:2121:12: warning: 'proc_stat_show' defined but not used [-Wunused-function]
    2121 | static int proc_stat_show(struct seq_file *seq, void *offset)
         |            ^~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/huge_ptep_get +1542 mm/share_pool.c

  1537	
  1538	static int sp_hugetlb_entry(pte_t *ptep, unsigned long hmask,
  1539				    unsigned long addr, unsigned long next,
  1540				    struct mm_walk *walk)
  1541	{
> 1542		pte_t pte = huge_ptep_get(ptep);
  1543		struct page *page = pte_page(pte);
  1544		struct sp_walk_data *sp_walk_data;
  1545	
  1546		if (unlikely(!pte_present(pte))) {
  1547			if (printk_ratelimit())
  1548				pr_err("share pool: the page of addr %pK unexpectedly not in RAM\n", (void *)addr);
  1549			return -EFAULT;
  1550		}
  1551	
  1552		sp_walk_data = walk->private;
  1553		get_page(page);
  1554		sp_walk_data->pages[sp_walk_data->page_count++] = page;
  1555		return 0;
  1556	}
  1557	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
