Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DF2F315D2C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 00:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764980432; cv=none; b=NAwyBnGqzX4E84GR8SrQx7liQ8t09jBcorffMGobkD4/CXZLTw79GMuo48P/PlUQRN5yGK3ePPlHKfyg4uiVX8YeR1KptSlTphaHLzmjO3IR0WAf5sPhu6wlHBnSSNGoI8HTWjiGjnG5TmM/flfSiH/gAcw5oZeU9NEoIyW5Kss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764980432; c=relaxed/simple;
	bh=IqLzC+/Kb8s5jpxxLBoia5/JF743X5ZWanuOHGVExcg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Mv9SXeIK4zSZ3qOvf4BNCjKIDw0Pw1eG3QH4Q9Lo4hgRxHRekcSx2jW1IQk73bNjt293EHJLQVj8M4tEAMm+797X+MUk2cSk4oX5xuca89CFhPCOJ0v3PUBMSdFcyPcfz13OPHYwshPdGBzjDVJIlSFcQcVfiFPDPO00KLPMl2s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XJOkYA1I; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XJOkYA1I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764980431; x=1796516431;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IqLzC+/Kb8s5jpxxLBoia5/JF743X5ZWanuOHGVExcg=;
  b=XJOkYA1Iocqk9INWoH07HaQirFeBjsP/nG4te5tsnAjCDVFl8gWeGTdy
   rJtmD4HeYeUdLdzgr1x9/sikaXMfPXawJdJkkpXu15Nw2iFQibIi66Xss
   xcDn782+mLQQI+SXecNk03DXeg3QW4E797U/xtuP7saMqtfUC/Mxk6fJd
   vC+7XjzTUIs+zDZ/n3vXp0o1HkF1knKVbFBcPrWEraT63ayvFzK1azL28
   1q42N+IVNpYaH8P8bSRz2fEjPlUgW4omyPxxjn7YgIWSNJR/Kv5dx5Mwg
   xjre1AqtrNpN5ebKVoaJxcMOUkgFPKEuULAhUy6PJG8Fbj3DgVbOlns46
   w==;
X-CSE-ConnectionGUID: PFaRvIrSQ6W4hJfyd5r2CA==
X-CSE-MsgGUID: 9pYPRjdOQOeHHIuSCGkl6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11633"; a="67057985"
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="67057985"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2025 16:20:30 -0800
X-CSE-ConnectionGUID: oVX2QXkGRVmH3kHUSXFGyQ==
X-CSE-MsgGUID: ye5+YD1ISne1kQdX6CDZ7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,253,1758610800"; 
   d="scan'208";a="200362025"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Dec 2025 16:20:29 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRg2F-00000000Fg5-0Dk1;
	Sat, 06 Dec 2025 00:20:27 +0000
Date: Sat, 6 Dec 2025 08:20:01 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 2/2] mm/balloon_compaction.c:199:
 warning: Function parameter or member 'first_page' not described in
 'balloon_page_list_dequeue_cont'
Message-ID: <202512060816.RGZi1WuE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hui,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   3c54ed1ace809fdcfee4d1f05d78d8aec977bd20
commit: fd410a0ae4e466912c7a19b9e0627d4deba45b81 [2/2] anolis: virtio_balloon: Add deflate_cont_vq to deflate continuous pages
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20251206/202512060816.RGZi1WuE-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 734a912d0f025559fcf76bde9aaaeb0383c1625a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512060816.RGZi1WuE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512060816.RGZi1WuE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/balloon_compaction.c:199: warning: Function parameter or member 'first_page' not described in 'balloon_page_list_dequeue_cont'


vim +199 mm/balloon_compaction.c

   177	
   178	/**
   179	 * balloon_page_list_dequeue_cont() - removes continuous pages from balloon's page list
   180	 *				      and returns a list of the continuous pages.
   181	 * @b_dev_info: balloon device decriptor where we will grab a page from.
   182	 * @pages: pointer to the list of pages that would be returned to the caller.
   183	 * @max_req_pages: max number of requested pages.
   184	 *
   185	 * Driver must call this function to properly de-allocate a previous enlisted
   186	 * balloon pages before definitively releasing it back to the guest system.
   187	 * This function tries to remove @max_req_pages continuous pages from the ballooned
   188	 * pages and return them to the caller in the @pages list.
   189	 *
   190	 * Note that this function may fail to dequeue some pages even if the balloon
   191	 * isn't empty - since the page list can be temporarily empty due to compaction
   192	 * of isolated pages.
   193	 *
   194	 * Return: number of pages that were added to the @pages list.
   195	 */
   196	size_t balloon_page_list_dequeue_cont(struct balloon_dev_info *b_dev_info,
   197					      struct list_head *pages, struct page **first_page,
   198					      size_t max_req_pages)
 > 199	{
   200		struct page *page, *tmp;
   201		unsigned long flags, tail_pfn;
   202		size_t n_pages = 0;
   203		bool got_first = false;
   204	
   205		spin_lock_irqsave(&b_dev_info->pages_lock, flags);
   206		list_for_each_entry_safe_reverse(page, tmp, &b_dev_info->pages, lru) {
   207			unsigned long pfn;
   208	
   209			if (n_pages == max_req_pages)
   210				break;
   211	
   212			pfn = page_to_pfn(page);
   213	
   214			if (got_first && pfn != tail_pfn + 1)
   215				break;
   216	
   217			/*
   218			 * Block others from accessing the 'page' while we get around to
   219			 * establishing additional references and preparing the 'page'
   220			 * to be released by the balloon driver.
   221			 */
   222			if (!trylock_page(page)) {
   223				if (!got_first)
   224					continue;
   225				else
   226					break;
   227			}
   228	
   229			if (IS_ENABLED(CONFIG_BALLOON_COMPACTION) && PageIsolated(page)) {
   230				/* raced with isolation */
   231				unlock_page(page);
   232				if (!got_first)
   233					continue;
   234				else
   235					break;
   236			}
   237			balloon_page_delete(page);
   238			__count_vm_event(BALLOON_DEFLATE);
   239			list_add(&page->lru, pages);
   240			unlock_page(page);
   241			n_pages++;
   242			tail_pfn = pfn;
   243			if (!got_first) {
   244				got_first = true;
   245				*first_page = page;
   246			}
   247		}
   248		spin_unlock_irqrestore(&b_dev_info->pages_lock, flags);
   249	
   250		return n_pages;
   251	}
   252	EXPORT_SYMBOL_GPL(balloon_page_list_dequeue_cont);
   253	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
