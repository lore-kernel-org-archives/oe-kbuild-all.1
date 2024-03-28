Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778C381731
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Mar 2024 15:34:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711640058; cv=none; b=sCj6Gyd+6aPYuf30cTvzIPs97NrPaeDart+8qPireBv+n9beojoG79MfWPZWotYFT87F8nm2yUVCbXhkbGJhc9q/ThUde/R0de3hdVjiHcjwS0SIf0VahHIJ/zmZuE85YfE3VtlqoQlE69CYA9x1U0qWlHF9hUXI9bGYHLRH5NA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711640058; c=relaxed/simple;
	bh=pq4rM/jkC3pLBCbfs311M7bBO4YHyOpwr1F4hhSa1Qg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OrYvw1h00XtA+ARrxdlYArU0wOa0gbgWfpyAmZZTZivM1v/XrmT21gVXvaJd3xwDG0b2NNojXiEdPM41J1UwybI1nUn5YlkmnTZjJFLkeYkism2U3xbC1qGKs+8uJrIuMk9K5cUFUyUKlAUvMs6ygtp73sfQyJ8ie1eOO8r0h2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Gi66aJaQ; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Gi66aJaQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711640056; x=1743176056;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pq4rM/jkC3pLBCbfs311M7bBO4YHyOpwr1F4hhSa1Qg=;
  b=Gi66aJaQrSbRLpySAbsFkrva2zv2/EwVdfk63Z+ZzJLggeDJNffhmS5p
   kdNmXxa/zIWgawEJySMEc1PGieyHcZuWh9OzqLG5huMvEZzyDmBZEONk8
   h4N+junR946kfE+mMyARCMfdFZrJnBio1Ma5mzqJQOECgywP8RrTA/Au4
   eNox0xWy75AY4WP2/o4TG4Mr7uI9ggn6N9xp1Ul2chkSkJb8w300/DS34
   wHde1pZzbNtzEGHLrFFfDXkwRtRDAF9VszkqOftbReQbdyd3R1L4/k5ra
   g9hyeLxdmBH+thoy5ZWFNSRmbELTk24yhz04B4Pms43ezxjaouMbvYl05
   g==;
X-CSE-ConnectionGUID: KzaniXTUQ2ygeWstQiuXfw==
X-CSE-MsgGUID: FhBLM5xUQHyNA25SL5oocA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="24249784"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="24249784"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 08:34:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="17080090"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 28 Mar 2024 08:34:12 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rprlZ-0002Gs-2T;
	Thu, 28 Mar 2024 15:34:09 +0000
Date: Thu, 28 Mar 2024 23:33:54 +0800
From: kernel test robot <lkp@intel.com>
To: Kefeng Wang <wangkefeng.wang@huawei.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	willy@infradead.org, Miaohe Lin <linmiaohe@huawei.com>,
	Naoya Horiguchi <naoya.horiguchi@nec.com>,
	David Hildenbrand <david@redhat.com>,
	Oscar Salvador <osalvador@suse.de>, Zi Yan <ziy@nvidia.com>,
	Hugh Dickins <hughd@google.com>, Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: Re: [PATCH 3/6] mm: remove isolate_lru_page()
Message-ID: <202403282357.bFSsmYuH-lkp@intel.com>
References: <20240327141034.3712697-4-wangkefeng.wang@huawei.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240327141034.3712697-4-wangkefeng.wang@huawei.com>

Hi Kefeng,

kernel test robot noticed the following build errors:

[auto build test ERROR on linus/master]
[also build test ERROR on v6.9-rc1]
[cannot apply to akpm-mm/mm-everything next-20240328]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Kefeng-Wang/mm-migrate-add-isolate_movable_folio/20240327-221513
base:   linus/master
patch link:    https://lore.kernel.org/r/20240327141034.3712697-4-wangkefeng.wang%40huawei.com
patch subject: [PATCH 3/6] mm: remove isolate_lru_page()
config: x86_64-randconfig-013-20240328 (https://download.01.org/0day-ci/archive/20240328/202403282357.bFSsmYuH-lkp@intel.com/config)
compiler: gcc-10 (Ubuntu 10.5.0-1ubuntu1) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240328/202403282357.bFSsmYuH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403282357.bFSsmYuH-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/migrate_device.c: In function 'migrate_device_unmap':
>> mm/migrate_device.c:388:9: error: implicit declaration of function 'isolate_lru_page' [-Werror=implicit-function-declaration]
     388 |    if (!isolate_lru_page(page)) {
         |         ^~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/isolate_lru_page +388 mm/migrate_device.c

76cbbead253ddc Christoph Hellwig       2022-02-16  355  
76cbbead253ddc Christoph Hellwig       2022-02-16  356  /*
44af0b45d58d7b Alistair Popple         2022-11-11  357   * Unmaps pages for migration. Returns number of source pfns marked as
44af0b45d58d7b Alistair Popple         2022-11-11  358   * migrating.
76cbbead253ddc Christoph Hellwig       2022-02-16  359   */
241f6885965683 Alistair Popple         2022-09-28  360  static unsigned long migrate_device_unmap(unsigned long *src_pfns,
241f6885965683 Alistair Popple         2022-09-28  361  					  unsigned long npages,
241f6885965683 Alistair Popple         2022-09-28  362  					  struct page *fault_page)
76cbbead253ddc Christoph Hellwig       2022-02-16  363  {
76cbbead253ddc Christoph Hellwig       2022-02-16  364  	unsigned long i, restore = 0;
76cbbead253ddc Christoph Hellwig       2022-02-16  365  	bool allow_drain = true;
241f6885965683 Alistair Popple         2022-09-28  366  	unsigned long unmapped = 0;
76cbbead253ddc Christoph Hellwig       2022-02-16  367  
76cbbead253ddc Christoph Hellwig       2022-02-16  368  	lru_add_drain();
76cbbead253ddc Christoph Hellwig       2022-02-16  369  
76cbbead253ddc Christoph Hellwig       2022-02-16  370  	for (i = 0; i < npages; i++) {
241f6885965683 Alistair Popple         2022-09-28  371  		struct page *page = migrate_pfn_to_page(src_pfns[i]);
4b8554c527f3cf Matthew Wilcox (Oracle  2022-01-28  372) 		struct folio *folio;
76cbbead253ddc Christoph Hellwig       2022-02-16  373  
44af0b45d58d7b Alistair Popple         2022-11-11  374  		if (!page) {
44af0b45d58d7b Alistair Popple         2022-11-11  375  			if (src_pfns[i] & MIGRATE_PFN_MIGRATE)
44af0b45d58d7b Alistair Popple         2022-11-11  376  				unmapped++;
76cbbead253ddc Christoph Hellwig       2022-02-16  377  			continue;
44af0b45d58d7b Alistair Popple         2022-11-11  378  		}
76cbbead253ddc Christoph Hellwig       2022-02-16  379  
76cbbead253ddc Christoph Hellwig       2022-02-16  380  		/* ZONE_DEVICE pages are not on LRU */
76cbbead253ddc Christoph Hellwig       2022-02-16  381  		if (!is_zone_device_page(page)) {
76cbbead253ddc Christoph Hellwig       2022-02-16  382  			if (!PageLRU(page) && allow_drain) {
1fec6890bf2247 Matthew Wilcox (Oracle  2023-06-21  383) 				/* Drain CPU's lru cache */
76cbbead253ddc Christoph Hellwig       2022-02-16  384  				lru_add_drain_all();
76cbbead253ddc Christoph Hellwig       2022-02-16  385  				allow_drain = false;
76cbbead253ddc Christoph Hellwig       2022-02-16  386  			}
76cbbead253ddc Christoph Hellwig       2022-02-16  387  
f7f9c00dfafffd Baolin Wang             2023-02-15 @388  			if (!isolate_lru_page(page)) {
241f6885965683 Alistair Popple         2022-09-28  389  				src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
76cbbead253ddc Christoph Hellwig       2022-02-16  390  				restore++;
76cbbead253ddc Christoph Hellwig       2022-02-16  391  				continue;
76cbbead253ddc Christoph Hellwig       2022-02-16  392  			}
76cbbead253ddc Christoph Hellwig       2022-02-16  393  
76cbbead253ddc Christoph Hellwig       2022-02-16  394  			/* Drop the reference we took in collect */
76cbbead253ddc Christoph Hellwig       2022-02-16  395  			put_page(page);
76cbbead253ddc Christoph Hellwig       2022-02-16  396  		}
76cbbead253ddc Christoph Hellwig       2022-02-16  397  
4b8554c527f3cf Matthew Wilcox (Oracle  2022-01-28  398) 		folio = page_folio(page);
4b8554c527f3cf Matthew Wilcox (Oracle  2022-01-28  399) 		if (folio_mapped(folio))
4b8554c527f3cf Matthew Wilcox (Oracle  2022-01-28  400) 			try_to_migrate(folio, 0);
76cbbead253ddc Christoph Hellwig       2022-02-16  401  
16ce101db85db6 Alistair Popple         2022-09-28  402  		if (page_mapped(page) ||
241f6885965683 Alistair Popple         2022-09-28  403  		    !migrate_vma_check_page(page, fault_page)) {
76cbbead253ddc Christoph Hellwig       2022-02-16  404  			if (!is_zone_device_page(page)) {
76cbbead253ddc Christoph Hellwig       2022-02-16  405  				get_page(page);
76cbbead253ddc Christoph Hellwig       2022-02-16  406  				putback_lru_page(page);
76cbbead253ddc Christoph Hellwig       2022-02-16  407  			}
76cbbead253ddc Christoph Hellwig       2022-02-16  408  
241f6885965683 Alistair Popple         2022-09-28  409  			src_pfns[i] &= ~MIGRATE_PFN_MIGRATE;
76cbbead253ddc Christoph Hellwig       2022-02-16  410  			restore++;
76cbbead253ddc Christoph Hellwig       2022-02-16  411  			continue;
76cbbead253ddc Christoph Hellwig       2022-02-16  412  		}
241f6885965683 Alistair Popple         2022-09-28  413  
241f6885965683 Alistair Popple         2022-09-28  414  		unmapped++;
76cbbead253ddc Christoph Hellwig       2022-02-16  415  	}
76cbbead253ddc Christoph Hellwig       2022-02-16  416  
76cbbead253ddc Christoph Hellwig       2022-02-16  417  	for (i = 0; i < npages && restore; i++) {
241f6885965683 Alistair Popple         2022-09-28  418  		struct page *page = migrate_pfn_to_page(src_pfns[i]);
4eecb8b9163df8 Matthew Wilcox (Oracle  2022-01-28  419) 		struct folio *folio;
76cbbead253ddc Christoph Hellwig       2022-02-16  420  
241f6885965683 Alistair Popple         2022-09-28  421  		if (!page || (src_pfns[i] & MIGRATE_PFN_MIGRATE))
76cbbead253ddc Christoph Hellwig       2022-02-16  422  			continue;
76cbbead253ddc Christoph Hellwig       2022-02-16  423  
4eecb8b9163df8 Matthew Wilcox (Oracle  2022-01-28  424) 		folio = page_folio(page);
4eecb8b9163df8 Matthew Wilcox (Oracle  2022-01-28  425) 		remove_migration_ptes(folio, folio, false);
76cbbead253ddc Christoph Hellwig       2022-02-16  426  
241f6885965683 Alistair Popple         2022-09-28  427  		src_pfns[i] = 0;
4eecb8b9163df8 Matthew Wilcox (Oracle  2022-01-28  428) 		folio_unlock(folio);
4eecb8b9163df8 Matthew Wilcox (Oracle  2022-01-28  429) 		folio_put(folio);
76cbbead253ddc Christoph Hellwig       2022-02-16  430  		restore--;
76cbbead253ddc Christoph Hellwig       2022-02-16  431  	}
241f6885965683 Alistair Popple         2022-09-28  432  
241f6885965683 Alistair Popple         2022-09-28  433  	return unmapped;
241f6885965683 Alistair Popple         2022-09-28  434  }
241f6885965683 Alistair Popple         2022-09-28  435  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
