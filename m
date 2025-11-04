Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7453BEEBB
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 06:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762236203; cv=none; b=Xq67qXFwVYMZTmXshQbFL5e/SvyVLISnjzgyVYBdylcbc5aodsbIRgA2Pk9ITFJNyBh4kT+lYHkZnUIA0WlSHgBcSOj2poXSwFO/z+TYQ/aw4nQONXTRLRkLMn2nHTQn0KwevA/aL5XKFkCdUKJ0rYcccs/QVRqB5lFWk4g0HcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762236203; c=relaxed/simple;
	bh=/dL1gBSTItHzBoVba+zlzvDJWscPnr+j+9zMFRaFDIA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XCbyEVlgum0nMgK6uJFG75W3FzUf5iPb4e5R1SEgREdoTr3rUmj1JqZ5wwFSD/9tHbIbv/t+hjylWfyzCDTv2HtwypxrGba7asEKNSEAFzq3DzUL4uxXGfQ+Ja5CaoI7MXsbv8aKfLBx2vzSYWZYSyol7eaBP45M13de0PtLa0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YG5cC2MG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YG5cC2MG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762236201; x=1793772201;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=/dL1gBSTItHzBoVba+zlzvDJWscPnr+j+9zMFRaFDIA=;
  b=YG5cC2MGN7sSOAUtgoqHYfIXyY/JG0LA8CtSuxa2qQs2TakrV61psl0D
   bPPbQizJULSyfeHctwnp9Ou2Aw/Qj45aQP8kT2fT7oM86LxredpJfZCEF
   l0v+iRvDH+2xxFtNx550uljXdf9CK+VpOZspuzBGif5AhiZrro6CmPjfM
   HPzBrKOAFuP3E55z2M8jSGwYOpvnB2ewWyDYioKYrImVETm82DN0fLnYB
   YJ2+4t2VWE6E0RBukQMX5l1cG5lbWWS83dCSzsKMRtsRd7zCnk3/gId/J
   fHSI/CbeEl4zRlYi4c2os/qxfEmxpylOxc61D2P80GXHd8zROtFk0nhY1
   Q==;
X-CSE-ConnectionGUID: T/TZHYKJT1W+K0Kr/p8XEw==
X-CSE-MsgGUID: PXlIEXsYTPGysrj7bZHcAw==
X-IronPort-AV: E=McAfee;i="6800,10657,11602"; a="66936268"
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="66936268"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2025 22:03:21 -0800
X-CSE-ConnectionGUID: qsZ0NbiXT6ukdTHRh+FeNA==
X-CSE-MsgGUID: t7vmxUyhSVeSFQnjNikDfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,278,1754982000"; 
   d="scan'208";a="186928092"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 03 Nov 2025 22:03:14 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGA89-000Qyq-2I;
	Tue, 04 Nov 2025 06:02:59 +0000
Date: Tue, 4 Nov 2025 14:02:13 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Janosch Frank <frankja@linux.ibm.com>,
	Claudio Imbrenda <imbrenda@linux.ibm.com>,
	David Hildenbrand <david@redhat.com>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>, Peter Xu <peterx@redhat.com>,
	Alexander Viro <viro@zeniv.linux.org.uk>,
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>,
	Arnd Bergmann <arnd@arndb.de>, Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Nico Pache <npache@redhat.com>, Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	Oscar Salvador <osalvador@suse.de>,
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>
Subject: Re: [PATCH 13/16] mm: remove non_swap_entry() and use leaf entry
 helpers instead
Message-ID: <202511041345.8K1Nt70Q-lkp@intel.com>
References: <b4925aeaf6b7e8255b1cf1585476b718862b8104.1762171281.git.lorenzo.stoakes@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b4925aeaf6b7e8255b1cf1585476b718862b8104.1762171281.git.lorenzo.stoakes@oracle.com>

Hi Lorenzo,

kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Stoakes/mm-correctly-handle-UFFD-PTE-markers/20251103-204118
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/b4925aeaf6b7e8255b1cf1585476b718862b8104.1762171281.git.lorenzo.stoakes%40oracle.com
patch subject: [PATCH 13/16] mm: remove non_swap_entry() and use leaf entry helpers instead
config: s390-randconfig-r112-20251104 (https://download.01.org/0day-ci/archive/20251104/202511041345.8K1Nt70Q-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251104/202511041345.8K1Nt70Q-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511041345.8K1Nt70Q-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/s390/mm/pgtable.c:693:47: sparse: sparse: incorrect type in argument 1 (different modifiers) @@     expected struct folio *folio @@     got struct folio const *folio @@
   arch/s390/mm/pgtable.c:693:47: sparse:     expected struct folio *folio
   arch/s390/mm/pgtable.c:693:47: sparse:     got struct folio const *folio
   arch/s390/mm/pgtable.c:1098:9: sparse: sparse: context imbalance in 'pgste_perform_essa' - unexpected unlock
   arch/s390/mm/pgtable.c: note: in included file (through include/linux/pgtable.h, include/linux/mm.h):
   arch/s390/include/asm/pgtable.h:2067:9: sparse: sparse: context imbalance in 'set_pgste_bits' - unexpected unlock
   arch/s390/mm/pgtable.c: note: in included file:
   include/linux/mm.h:2832:9: sparse: sparse: context imbalance in 'get_pgste' - unexpected unlock

vim +693 arch/s390/mm/pgtable.c

4be130a08420d6 Martin Schwidefsky 2016-03-08  685  
9c8ce56552b434 Lorenzo Stoakes    2025-11-03  686  static void ptep_zap_leaf_entry(struct mm_struct *mm, leaf_entry_t entry)
1e133ab296f3ff Martin Schwidefsky 2016-03-08  687  {
9c8ce56552b434 Lorenzo Stoakes    2025-11-03  688  	if (leafent_is_swap(entry))
1e133ab296f3ff Martin Schwidefsky 2016-03-08  689  		dec_mm_counter(mm, MM_SWAPENTS);
9c8ce56552b434 Lorenzo Stoakes    2025-11-03  690  	else if (leafent_is_migration(entry)) {
9c8ce56552b434 Lorenzo Stoakes    2025-11-03  691  		const struct folio *folio = leafent_to_folio(entry);
1e133ab296f3ff Martin Schwidefsky 2016-03-08  692  
a23f517b0e1554 Kefeng Wang        2024-01-11 @693  		dec_mm_counter(mm, mm_counter(folio));
1e133ab296f3ff Martin Schwidefsky 2016-03-08  694  	}
1e133ab296f3ff Martin Schwidefsky 2016-03-08  695  	free_swap_and_cache(entry);
1e133ab296f3ff Martin Schwidefsky 2016-03-08  696  }
1e133ab296f3ff Martin Schwidefsky 2016-03-08  697  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
