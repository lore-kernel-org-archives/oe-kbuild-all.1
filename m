Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1DFD7B3D2
	for <oe-kbuild-all@lists.linux.dev>; Tue, 12 Mar 2024 14:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710254920; cv=none; b=MHXulkO/YLYUJAM6opTYdj87hqqBen58cWH/lpJv0kiuTLaxytiqfj4jX9j1Z79BizE1ASbtZ071OAjLSbIHyqAx5wislrYoB4HNw91py59So0FBW7a9he8XwwwlTXtXgOl4bUjdTqhoJ19gM2DPRXp5Qr2yl89dcDcXOLEDW2U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710254920; c=relaxed/simple;
	bh=libnBM0XHfpsmEXLUU481Q5u+voJL23T/m7/7S0zHI4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zg+P5UrhdM96RL9/SB5+0/04JYDdUAw6ABv7bwgB4P505GWuH+mIVZoKH6n+W31wxHnKZSFbVbuZ90LQCGAjIU49vmRTvkRyYbt0yBfbp11QCPZSjNebf+Q3iruKaE3sNlTkdnpRaWyvPNPEvEW/wsV6MZtZYUTlwCM8dCYNduE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Fb0Eyn1k; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Fb0Eyn1k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1710254918; x=1741790918;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=libnBM0XHfpsmEXLUU481Q5u+voJL23T/m7/7S0zHI4=;
  b=Fb0Eyn1k73GdM6oR4W3Ifwzi5LCZ5Dj8K75lIivG+pVYC+56fzvect6h
   UGtXJ34VpsBN2AfxPQcMAmgh2OsS2Z2NzSI9cQmJk7QbStxgcZ4i9VwNo
   DfJ9FfpXNdTjvQPjANfvjriWfcxEUggsY5kR0TSSqiB9XGwZ3dAFRUUn+
   33nlTW/rGz/6K7j6V2gEId/I7DpdlXadHIhBZaeZYHPYx6uxsIAuhwUWQ
   PnZJPV60oeFQQ10GdqH0jrxeZZkvD4hbpyz4mH4x580/vr007f5/+zN4f
   fIoCjvW4TP9vNYI+PJv3D7df6EJy65hJPkTlUIU8GLurdQ4kYEHzZt0cS
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11011"; a="8785532"
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="8785532"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Mar 2024 07:48:37 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,119,1708416000"; 
   d="scan'208";a="16168894"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Mar 2024 07:48:36 -0700
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rk3Qf-000AFj-1N;
	Tue, 12 Mar 2024 14:48:33 +0000
Date: Tue, 12 Mar 2024 22:48:27 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18183/21850] mm/share_pool.c:2263:24:
 error: implicit declaration of function 'hugetlb_alloc_hugepage'; did you
 mean 'vmalloc_hugepage'?
Message-ID: <202403122233.J2ozeWSt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c38cc0a3be12e5c70b9a2a015cbee44014a52518
commit: 4a280fac30d27ae2aff096f9f99aa12d50f83426 [18183/21850] ascend: share_pool: support share pool features for ascend platform
config: arm64-randconfig-003-20240312 (https://download.01.org/0day-ci/archive/20240312/202403122233.J2ozeWSt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240312/202403122233.J2ozeWSt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403122233.J2ozeWSt-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/share_pool.c: In function 'sp_hugetlb_entry':
   mm/share_pool.c:1542:21: error: implicit declaration of function 'huge_ptep_get' [-Werror=implicit-function-declaration]
    1542 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^~~~~~~~~~~~~
   mm/share_pool.c:1542:21: error: invalid initializer
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
   cc1: some warnings being treated as errors


vim +2263 mm/share_pool.c

  2257	
  2258	
  2259	struct page *sp_alloc_pages(struct vm_struct *area, gfp_t mask,
  2260						  unsigned int page_order, int node)
  2261	{
  2262		if (area->flags & VM_HUGE_PAGES)
> 2263			return hugetlb_alloc_hugepage(NUMA_NO_NODE, HUGETLB_ALLOC_NONE);
  2264		else
  2265			return alloc_pages_node(node, mask, page_order);
  2266	}
  2267	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
