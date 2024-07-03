Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C781E4A9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 12:45:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720010724; cv=none; b=R4june8VVKuGkNhwswplunuLW500terOgnINKopgUMsCZFQ1m0jNTm6ldhK1maHTsI+9s1UeVmo57nRrknzbREDIBu2JlA4inEzrmJYJP5Z8ga9raStnl+1/9cqwx5itmhYes6j3hT7J9ptTeDQcsE5MOLENYwUXveRk+Tw6s5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720010724; c=relaxed/simple;
	bh=ZUcizFH83xGavf4FZOrxDi5D0UuQhI8FIc+rhBQjRyM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OZyIo5cRPnu42lDPAX0i366Sd0QYaDLh+STXpeqhMikcngmD2PBeAirz0k33B30qb0Ri9Q59sXvXtdBUFO/+HxeEFzs+7nU7BSJvCdLy5NZXLWWkzYAUOvR9MjBX1IWPcDi4bbbDzPI/VXXr/Gdc5nZvbCw/Oa6nxTVRnO+z/Zo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3B5DXhr; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3B5DXhr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720010722; x=1751546722;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZUcizFH83xGavf4FZOrxDi5D0UuQhI8FIc+rhBQjRyM=;
  b=X3B5DXhrtnJEI4ngpziWr5wfcXV/OFf9zNwhIIwuNly7QulKPJYVrMNU
   8pcrlkYfKVXtP3FxQKnFJkXXUO3Nbld0ziGpwBzQBFSxfY1kj4fyZ84WY
   0wALuJsyRqP59LqDLphZtEDm1z5B4NWaqD8bMoAhu17lsU0l8NR98He3M
   2MX3ipP9Zb6noCgPooja4Af6Tr5Rbi3W2lb46UihRFJ7o4n/oU3gWh97x
   tFcaa++iEvGhBgO5ibAiSc4I++fOW0AarHfYYgFTZEpLDoOq3IjEY+yVj
   at+rIPmRTx2b6xFHeG0uYkd5Q2ccY9IbRm6visrukksgMrDQAgfXfQPF3
   A==;
X-CSE-ConnectionGUID: bk/fRnZeS9GgKbbGvKVx1Q==
X-CSE-MsgGUID: PP+2LBJASQSxMs3v3ggMgg==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="34775986"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="34775986"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 05:45:22 -0700
X-CSE-ConnectionGUID: lVcs/KljTpKy5jOs5jEHWg==
X-CSE-MsgGUID: vXLkknA0SJib9uzbq93Tjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="50848579"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2024 05:45:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOzMN-000PiZ-2U;
	Wed, 03 Jul 2024 12:45:19 +0000
Date: Wed, 3 Jul 2024 20:44:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:rmap_id 6/6] mm/internal.h:660:9: error: implicit
 declaration of function '__folio_prep_large_mapcount_metadata'
Message-ID: <202407032056.KcYDU2wQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux rmap_id
head:   ff5e85c45e818366d70159de7e6e0d0cc781d2cb
commit: ff5e85c45e818366d70159de7e6e0d0cc781d2cb [6/6] rmap_id
config: sh-randconfig-r081-20240703 (https://download.01.org/0day-ci/archive/20240703/202407032056.KcYDU2wQ-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407032056.KcYDU2wQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407032056.KcYDU2wQ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from mm/filemap.c:51:
   mm/internal.h: In function 'prep_compound_head':
>> mm/internal.h:660:9: error: implicit declaration of function '__folio_prep_large_mapcount_metadata' [-Werror=implicit-function-declaration]
     660 |         __folio_prep_large_mapcount_metadata(folio, order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
   In file included from mm/page_alloc.c:59:
   mm/internal.h: In function 'prep_compound_head':
>> mm/internal.h:660:9: error: implicit declaration of function '__folio_prep_large_mapcount_metadata' [-Werror=implicit-function-declaration]
     660 |         __folio_prep_large_mapcount_metadata(folio, order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/page_alloc.c: In function 'free_pages_prepare':
>> mm/page_alloc.c:1079:25: error: implicit declaration of function '__folio_undo_large_mapcount_metadata' [-Werror=implicit-function-declaration]
    1079 |                         __folio_undo_large_mapcount_metadata(page_folio(page),
         |                         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/__folio_prep_large_mapcount_metadata +660 mm/internal.h

   650	
   651	static inline void prep_compound_head(struct page *page, unsigned int order)
   652	{
   653		struct folio *folio = (struct folio *)page;
   654	
   655		folio_set_order(folio, order);
   656		atomic_set(&folio->_large_mapcount, -1);
   657		atomic_set(&folio->_entire_mapcount, -1);
   658		atomic_set(&folio->_nr_pages_mapped, 0);
   659		atomic_set(&folio->_pincount, 0);
 > 660		__folio_prep_large_mapcount_metadata(folio, order);
   661		if (order > 1)
   662			INIT_LIST_HEAD(&folio->_deferred_list);
   663	}
   664	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
