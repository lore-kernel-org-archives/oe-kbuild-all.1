Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A2F9221264
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 21:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756072800; cv=none; b=e+O0jGZN+yAZTq+iuObXIT+r2dpAYNrPOtp3uJEwETLU/XpN1e85FQCjsSrmSMh0bNcc/iBXBfyxAhYDDx8fbLJf8lGQMt87FOB8uCZzg0PbVVspHydS8zti+kQX9Lh7qqvvPRNyhI8pdCB54lGk6Rn25yxKbXMPuXd7cKP1NaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756072800; c=relaxed/simple;
	bh=N98UMX3IhPn4ZNhViiT3m4q8cG40kuM/uBMZilYa9BA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m6ZB3KmIoCcjnUqPR/NT8vgnGw9ypYTEJ+Lk/Wu8nP+d2krOnRA5bDtVxsMO4NFEr61WVHL6op04tp07lfoiZbrYtNMaJR6j0w3CEfIg5fxcwDu4WLwoHSCATWh/VU+V9VFoRvMm342/WNaIfereD+tbpkMsI9rqZmrBG1tDL44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=klCAiNGs; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="klCAiNGs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756072798; x=1787608798;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N98UMX3IhPn4ZNhViiT3m4q8cG40kuM/uBMZilYa9BA=;
  b=klCAiNGsdvsr40TbuE0BTapuzWLNdz2B6IEcfC0jCKQKYl4VuA1FaXfb
   ybW72TwGpT05VkIPqwElKRtsmhPT49mAvowHrLX1oQTjY+xjzfh0u/USZ
   2jZ1ApImQKvwot0r8Ua2kn5ZwQF/ScJ52gOOcC60q7u5mPRH8i1OHF4lP
   KM5AwMrP9RWuVCx27dvEyY0FgeUqJiaO6sxQI3QrA9Rsb++foczVPc8YJ
   huukc2XWWSjsrh5EvXPvAK7pcWmbNnskRyjZagC+yIkeOfuU0M4T4A6w8
   QxPcXmBSBq0ADVMuRs1BhUbnMf/uHXPKC8T5Em62buTRGtCKPktHZ25XY
   g==;
X-CSE-ConnectionGUID: Uc0JzgfkQ3OtX/OUab+9lA==
X-CSE-MsgGUID: t8zOqLEbTfeU8PkKAAcQmg==
X-IronPort-AV: E=McAfee;i="6800,10657,11532"; a="58384758"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58384758"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Aug 2025 14:59:57 -0700
X-CSE-ConnectionGUID: GM/AQ2FhSUmG6lhNMIASGw==
X-CSE-MsgGUID: d56TjmxdTUSXr3efYqAfpA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169045964"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa007.jf.intel.com with ESMTP; 24 Aug 2025 14:59:56 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uqIkf-000NE9-0I;
	Sun, 24 Aug 2025 21:59:49 +0000
Date: Mon, 25 Aug 2025 05:58:40 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:intel-5.10-GNR-perf-uncore-ANBZ24140 0/2]
 mm/balloon_compaction.c:199: warning: Function parameter or member
 'first_page' not described in 'balloon_page_list_dequeue_cont'
Message-ID: <202508250520.XZuSicyN-lkp@intel.com>
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

tree:   https://gitee.com/anolis/intel-cloud-kernel.git intel-5.10-GNR-perf-uncore-ANBZ24140
head:   5b97140220e2f9196fa5de48f6be468691f8b43b
commit: fd410a0ae4e466912c7a19b9e0627d4deba45b81 [0/2] anolis: virtio_balloon: Add deflate_cont_vq to deflate continuous pages
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250825/202508250520.XZuSicyN-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project d26ea02060b1c9db751d188b2edb0059a9eb273d)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250825/202508250520.XZuSicyN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508250520.XZuSicyN-lkp@intel.com/

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
