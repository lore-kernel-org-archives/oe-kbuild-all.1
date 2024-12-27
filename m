Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E07C03D69
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Dec 2024 16:37:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735317439; cv=none; b=gmZBJNIC4uBxPkaRB+vkPQFnOj8wozY/d0rmKb2ZkOWfib+Ih//xNc8Kl6ss1wb66SJZw1HcPftwlV/2cPxa9xtBXZ1qwGirljsQr1cbj0zwVbqHpuGxNk2RJn1cXZ6yeOy06W1ULwaLpyUSAtjMAEcewPCbo+R4orEs7fCBVRI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735317439; c=relaxed/simple;
	bh=QSadlB4Nyiq7Kb9s/Ig5CvUSqf+0IE7BzoSFZPNZAYk=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JjfIjvXBY6iNlTg+BkLHtqGxD8cxuMeZoVo1pVr+om5HLpRJ8OqhnFQPPI7Z0ojSrW1ppO5Se38rnGokM/PTPOdmsLmoaXn2YA1FdTsEgvEd1ymJlPMUEFgK5Ks+WDseZHSPjtBqxjGZSk5WV19d1ExenCxLRf67i4012dA1+n4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=O7Iu9ftE; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="O7Iu9ftE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735317437; x=1766853437;
  h=date:from:cc:subject:message-id:mime-version;
  bh=QSadlB4Nyiq7Kb9s/Ig5CvUSqf+0IE7BzoSFZPNZAYk=;
  b=O7Iu9ftEbZUc8yD8VQkSon+EGHe9xXFHblBZAOQ7+1MKQb6noXmwLIia
   iu03o1DhmwjuXtSKNvTUOyaUpdh2GCv2nkjo970JCr46N/rbgohlky3c2
   7vCpwK2giN0sEbagJxvieLZdXXwBhY/fdgNw+6WZ31V9+pU9sEP/OX7ng
   V39ABRKGICubh/aASC/I3/E1M12pVTn+2bn9I2S7eiDxOlDGdlHLhPbsn
   VvOE/+9bj439GwoLmRP3fI0ulPrVvVJoMmyOrExLe/Ptnq2m75HuB12sr
   tBvz3aBme7oNBiD/RszeI7HENb/g3jjS6TSkyr17AgZnhYpP3c7q9jf0R
   Q==;
X-CSE-ConnectionGUID: xc/Nn38+QzCl2PF/h0cvXQ==
X-CSE-MsgGUID: k2pWLcxfQdmf/lSElyOX9Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11298"; a="39403099"
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="39403099"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Dec 2024 08:37:16 -0800
X-CSE-ConnectionGUID: /zdlvrGWRAe62z63BWw0SQ==
X-CSE-MsgGUID: 2dZHdlj+TRyJABBzmkD7KA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,269,1728975600"; 
   d="scan'208";a="131035470"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Dec 2024 08:37:15 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tRDKr-0003Ku-19
	for oe-kbuild-all@lists.linux.dev;
	Fri, 27 Dec 2024 16:37:13 +0000
Date: Sat, 28 Dec 2024 00:36:45 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:6.6/preempt-rt 3/3]
 drivers/iommu/iommufd/io_pagetable.c:135:25: error: 'HPAGE_SIZE' undeclared;
 did you mean 'PAGE_SIZE'?
Message-ID: <202412280033.q7emyqu0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jason,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git 6.6/preempt-rt
head:   7f064b9d8937d880fb64d1df8d1e8b8115a1c128
commit: cd6dd564ae7d99967ef50078216929418160b30e [3/3] iommufd: Protect against overflow of ALIGN() during iova allocation
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20241228/202412280033.q7emyqu0-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241228/202412280033.q7emyqu0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412280033.q7emyqu0-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/iommufd/io_pagetable.c: In function 'iopt_alloc_iova':
>> drivers/iommu/iommufd/io_pagetable.c:135:25: error: 'HPAGE_SIZE' undeclared (first use in this function); did you mean 'PAGE_SIZE'?
     135 |         max_alignment = HPAGE_SIZE;
         |                         ^~~~~~~~~~
         |                         PAGE_SIZE
   drivers/iommu/iommufd/io_pagetable.c:135:25: note: each undeclared identifier is reported only once for each function it appears in


vim +135 drivers/iommu/iommufd/io_pagetable.c

   103	
   104	/*
   105	 * Automatically find a block of IOVA that is not being used and not reserved.
   106	 * Does not return a 0 IOVA even if it is valid.
   107	 */
   108	static int iopt_alloc_iova(struct io_pagetable *iopt, unsigned long *iova,
   109				   unsigned long uptr, unsigned long length)
   110	{
   111		unsigned long page_offset = uptr % PAGE_SIZE;
   112		struct interval_tree_double_span_iter used_span;
   113		struct interval_tree_span_iter allowed_span;
   114		unsigned long max_alignment = PAGE_SIZE;
   115		unsigned long iova_alignment;
   116	
   117		lockdep_assert_held(&iopt->iova_rwsem);
   118	
   119		/* Protect roundup_pow-of_two() from overflow */
   120		if (length == 0 || length >= ULONG_MAX / 2)
   121			return -EOVERFLOW;
   122	
   123		/*
   124		 * Keep alignment present in the uptr when building the IOVA, this
   125		 * increases the chance we can map a THP.
   126		 */
   127		if (!uptr)
   128			iova_alignment = roundup_pow_of_two(length);
   129		else
   130			iova_alignment = min_t(unsigned long,
   131					       roundup_pow_of_two(length),
   132					       1UL << __ffs64(uptr));
   133	
   134	#ifdef CONFIG_TRANSPARENT_HUGEPAGE
 > 135		max_alignment = HPAGE_SIZE;
   136	#endif
   137		/* Protect against ALIGN() overflow */
   138		if (iova_alignment >= max_alignment)
   139			iova_alignment = max_alignment;
   140	
   141		if (iova_alignment < iopt->iova_alignment)
   142			return -EINVAL;
   143	
   144		interval_tree_for_each_span(&allowed_span, &iopt->allowed_itree,
   145					    PAGE_SIZE, ULONG_MAX - PAGE_SIZE) {
   146			if (RB_EMPTY_ROOT(&iopt->allowed_itree.rb_root)) {
   147				allowed_span.start_used = PAGE_SIZE;
   148				allowed_span.last_used = ULONG_MAX - PAGE_SIZE;
   149				allowed_span.is_hole = false;
   150			}
   151	
   152			if (!__alloc_iova_check_used(&allowed_span, length,
   153						     iova_alignment, page_offset))
   154				continue;
   155	
   156			interval_tree_for_each_double_span(
   157				&used_span, &iopt->reserved_itree, &iopt->area_itree,
   158				allowed_span.start_used, allowed_span.last_used) {
   159				if (!__alloc_iova_check_hole(&used_span, length,
   160							     iova_alignment,
   161							     page_offset))
   162					continue;
   163	
   164				*iova = used_span.start_hole;
   165				return 0;
   166			}
   167		}
   168		return -ENOSPC;
   169	}
   170	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
