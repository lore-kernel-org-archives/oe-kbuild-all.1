Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24C6441AAC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 May 2025 05:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748668117; cv=none; b=hVybB/c4LfkTiGejMwK/RIwZ1Sd+dyCa2jxzDWV2rKql9jDzGNzKN4kVY27wVjSKq+neD+pcJPz08LTEIsHM2ngL6IDFTsmBlGJ58ZvyFWKf4l7VKLy7r3O1UToEI4nL8il8OA3ccxlqXDzmYxfMezXaeXBCiZT3pn3m9ozrvLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748668117; c=relaxed/simple;
	bh=bJAJzpQsrKo0ZGjx9XK64BrmxGq+sAFKAhPDV6wK40A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DoZr8nFqRvw8spiMCOVFJhaExQMnHcIx9eJS3F52xncDBFtJqg8ZzitpxQyOeb0uGfP3U4Dqsu5/CfWq+oAA4JJaInhbfj5nWpGeqH6x/GMBVBjydTIvzJQXXGCIHKCvX2/ZGPTR0MQ5cOwI+uBhL7Qqts64Y7vBt6wO9Vbq/zk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Z2jzASFB; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Z2jzASFB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748668115; x=1780204115;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=bJAJzpQsrKo0ZGjx9XK64BrmxGq+sAFKAhPDV6wK40A=;
  b=Z2jzASFBxqK9x1s1rqZ0/3Nf0d82KEq90a/W3k8WLSoF+tMPaOeJDTrv
   ewQMMe7kaycZErzOAWm3UY2X0hd3O3R7u0H/ANroGamC0Ti4//p45fGjs
   7Yp/KRF5Ysqgy5subY5zwbeSo9pGyPanGb3Jip74Y134QQnTOKtO5pG7Z
   YVlZTAQUQVyAcLol6ezNjJ3TcSet9pKZqoITtrCbPF+txXzFLpd/euivJ
   MKfHmFxtju6xoGw28J84+pC0fAYkfv19iJDbUqDwUmnxYmKoJx4Z5H48u
   sj9HAhJ6HVUvrMjc8G2TFu3Id4Z/baPw5g7z9uT4vH+qeEWcqUA2mNyxP
   A==;
X-CSE-ConnectionGUID: 3QiPX3p5Sv+p0EsAhT/jGQ==
X-CSE-MsgGUID: s2Seed8pQ3yJI8hBh71j+Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11449"; a="68310548"
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="68310548"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 May 2025 22:08:34 -0700
X-CSE-ConnectionGUID: YuAHNIpPR46vC6/Jf05C5w==
X-CSE-MsgGUID: g26UhT/pRWGfFj0yhbXH4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,197,1744095600"; 
   d="scan'208";a="149212215"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 30 May 2025 22:08:34 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uLESN-000YCO-28;
	Sat, 31 May 2025 05:08:31 +0000
Date: Sat, 31 May 2025 13:08:01 +0800
From: kernel test robot <lkp@intel.com>
To: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:tdx/dpamt 15/17] arch/x86/kvm/mmu/tdp_mmu.c:58:9: error:
 implicit declaration of function 'tdx_free_pamt_pages'; did you mean
 'tdx_nr_pamt_pages'?
Message-ID: <202505311253.uQfD3kI0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git tdx/dpamt
head:   ecf8d6a2a90c373eb46868f243c1a69b343ee98e
commit: 149f57b2b8371270bbb1b902dc2c8c76911984e0 [15/17] split
config: x86_64-buildonly-randconfig-003-20250531 (https://download.01.org/0day-ci/archive/20250531/202505311253.uQfD3kI0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250531/202505311253.uQfD3kI0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505311253.uQfD3kI0-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   arch/x86/kvm/mmu/tdp_mmu.c: In function 'tdp_mmu_free_sp':
>> arch/x86/kvm/mmu/tdp_mmu.c:58:9: error: implicit declaration of function 'tdx_free_pamt_pages'; did you mean 'tdx_nr_pamt_pages'? [-Werror=implicit-function-declaration]
      58 |         tdx_free_pamt_pages(&sp->pamt_pages);
         |         ^~~~~~~~~~~~~~~~~~~
         |         tdx_nr_pamt_pages
>> arch/x86/kvm/mmu/tdp_mmu.c:58:32: error: 'struct kvm_mmu_page' has no member named 'pamt_pages'
      58 |         tdx_free_pamt_pages(&sp->pamt_pages);
         |                                ^~
>> arch/x86/kvm/mmu/tdp_mmu.c:60:17: error: implicit declaration of function 'tdx_free_page'; did you mean 'bio_free_pages'? [-Werror=implicit-function-declaration]
      60 |                 tdx_free_page(virt_to_page(sp->external_spt));
         |                 ^~~~~~~~~~~~~
         |                 bio_free_pages
   arch/x86/kvm/mmu/tdp_mmu.c: In function 'tdp_mmu_alloc_sp':
   arch/x86/kvm/mmu/tdp_mmu.c:223:27: error: 'struct kvm_mmu_page' has no member named 'pamt_pages'
     223 |         INIT_LIST_HEAD(&sp->pamt_pages);
         |                           ^~
   arch/x86/kvm/mmu/tdp_mmu.c: In function 'tdp_mmu_alloc_sp_for_split':
   arch/x86/kvm/mmu/tdp_mmu.c:1629:27: error: 'struct kvm_mmu_page' has no member named 'pamt_pages'
    1629 |         INIT_LIST_HEAD(&sp->pamt_pages);
         |                           ^~
>> arch/x86/kvm/mmu/tdp_mmu.c:1638:16: error: implicit declaration of function 'tdx_alloc_page'; did you mean 'try_alloc_pages'? [-Werror=implicit-function-declaration]
    1638 |         page = tdx_alloc_page();
         |                ^~~~~~~~~~~~~~
         |                try_alloc_pages
>> arch/x86/kvm/mmu/tdp_mmu.c:1638:14: warning: assignment to 'struct page *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
    1638 |         page = tdx_alloc_page();
         |              ^
>> arch/x86/kvm/mmu/tdp_mmu.c:1643:13: error: implicit declaration of function 'tdx_alloc_pamt_pages'; did you mean 'tdx_nr_pamt_pages'? [-Werror=implicit-function-declaration]
    1643 |         if (tdx_alloc_pamt_pages(&sp->pamt_pages))
         |             ^~~~~~~~~~~~~~~~~~~~
         |             tdx_nr_pamt_pages
   arch/x86/kvm/mmu/tdp_mmu.c:1643:37: error: 'struct kvm_mmu_page' has no member named 'pamt_pages'
    1643 |         if (tdx_alloc_pamt_pages(&sp->pamt_pages))
         |                                     ^~
   cc1: some warnings being treated as errors


vim +58 arch/x86/kvm/mmu/tdp_mmu.c

    55	
    56	static void tdp_mmu_free_sp(struct kvm_mmu_page *sp)
    57	{
  > 58		tdx_free_pamt_pages(&sp->pamt_pages);
    59		if (sp->external_spt)
  > 60			tdx_free_page(virt_to_page(sp->external_spt));
    61		free_page((unsigned long)sp->spt);
    62		kmem_cache_free(mmu_page_header_cache, sp);
    63	}
    64	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
