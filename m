Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45E931C32
	for <oe-kbuild-all@lists.linux.dev>; Tue, 22 Jul 2025 11:33:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753184033; cv=none; b=TA4R+XgK6IqRo5y+6DW96fXGd53G5kD6MSmGjH+LTX4kFgvJL0NdGTd8CmrCLrvFo8Ja9AaPzzxSjs2ab4LCwxkViRKnyKn2WsNp3vuGVw9dC0JQzd6MPefK+JYJ/yF3r37ay/d8sNP2bmGkl7ICBCSeY3FPQjQjFunzlKpZ3Do=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753184033; c=relaxed/simple;
	bh=nMWuJ4jdnkJU/2Y3GO/otOnVB5BnpPOBgstxvk6JJCw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A2MrPoZmUkRyHii8gt+uF+fZu9xhKkUMTlhetpor3lsefcWW7RosqMsRUHFiyGuHAaFphcCPn9S2QdYsgH0uq54ede4WgXrK9sTX7BLC9H7l7v6PGKS2Wi/VVoozfRRS7+TrvmM/Wn9mgbrcFPtRGcD9w50YtvEm9fu7SgxDhS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YVUD241V; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YVUD241V"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753184031; x=1784720031;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nMWuJ4jdnkJU/2Y3GO/otOnVB5BnpPOBgstxvk6JJCw=;
  b=YVUD241VIdD+QhV/cnvvWDjGzmstj1/eF6xXXx925TW00QRnkDeWHda+
   msykfKOIt37BWjxXC5cm08SLlnTHk7cZSyzYWxSmj2fUsLVL/0LUFqd3F
   KhxOkw8Vq3RHUI31pSkeOP8K4yPq2Ix8WemNxoK0t5YHFe3u37EFakK/P
   j4jIuUG0WHIle+G9mcPeLjE0IAXQUebxyNfWsqbCfk9YmnV7+6dDtVwNZ
   wYQhybddarzcMXxRTlOycuBXZzZ4VU7ZQA/ab/fHyMjwswcPwQ/Z3ivRD
   4oEtzGmThurUXHtETd3ndoKcZ2bjQ8AzJlEFaRs/tNhMMtM1toSR4ipoq
   A==;
X-CSE-ConnectionGUID: 2Qrv5TIgR2yLj27FO0qVhA==
X-CSE-MsgGUID: +cY6BKSpSEqNDi1xYa/lEw==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="80873153"
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="80873153"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jul 2025 04:33:50 -0700
X-CSE-ConnectionGUID: Sioti3Z4RNmVmWHDV6gW/A==
X-CSE-MsgGUID: RbYqcbZbRZaHB8UaBcyebg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,331,1744095600"; 
   d="scan'208";a="159434565"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 22 Jul 2025 04:33:50 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueBFj-000Hk7-2r;
	Tue, 22 Jul 2025 11:33:47 +0000
Date: Tue, 22 Jul 2025 19:33:03 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 34/34] mm/balloon_compaction.c:199:
 warning: Function parameter or member 'first_page' not described in
 'balloon_page_list_dequeue_cont'
Message-ID: <202507221939.IYCJjXkw-lkp@intel.com>
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

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   7c51bc02ec5b3728140f3a1cd74cf21c8566be5c
commit: d268ed17fe3862e6c35371ece4890742e56dff9f [34/34] anolis: virtio_balloon: Add deflate_cont_vq to deflate continuous pages
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20250722/202507221939.IYCJjXkw-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14+deb12u1) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507221939.IYCJjXkw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507221939.IYCJjXkw-lkp@intel.com/

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
