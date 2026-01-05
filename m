Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B29FB332EA1
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Jan 2026 16:25:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767630359; cv=none; b=ONtaOvsLGWXEgG0Qdt0Vv5j2S7k6YfCzzdarGRZQDdORQl5JNFVG1N/VXF+vsQpA0rtspAOl/sjMDp6T/Cf7zyTC1x37GGNCTb/3me3pV69vqxwA1D2gcn6jDyxPI5suUxQlgcWfk4SnOFDtLenHHpwx4XCG15u1glIc0tZVgkY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767630359; c=relaxed/simple;
	bh=7UaRKMnsjqC9jzolUy5e/IgQsQryyhhtDDpvwF78ihU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=SYO/AsEtp5aRQaCy/64bT9oW9+b49RRSyDZE7Z9bU4VLeAskdnSfg8JpG8bfLWYd7AQyEdatXyrOyspxkdR2DxAIXmoprm8BTIBzb79U5gHOkmU3zggiPmS8PmNKxOl9KaFWYPiHfSwTNjChGUDfQVP8KS14rpsN2lUY9D7GxNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SEtcvOTt; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SEtcvOTt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1767630356; x=1799166356;
  h=date:from:to:cc:subject:message-id;
  bh=7UaRKMnsjqC9jzolUy5e/IgQsQryyhhtDDpvwF78ihU=;
  b=SEtcvOTtSn9MGAPP/u5hCda3DN+IQAF7TItn804iB1z9UHMJLJXgNW7y
   rGquosOGcxYzUX0/bAJ3eNWJboJL75k+5yJhrlc3scM2zo2swzxf73MHd
   acEcY+gAhdTxNHY1Cfpq2DMqT2ZzmYWBxXzDfGMc3K90UA3VBi+Fby8zw
   aQTowXNSeMRgwebyjPMJ7jdgnzscFaFqar+Bif21VuSbJlnoQ7QcoCw4G
   G0vUHX9zXnVMXtX96wxKj1lmAzpy3mhjmbcp0ouyFKLE0okovos0FhnyM
   KMthleCs5QPgKymR+PDF+3PXh6F1Drlt3vfvm+QuNjwmJbn484EhyHbXR
   g==;
X-CSE-ConnectionGUID: JlMQABzkTeCOgTJ3yqZruA==
X-CSE-MsgGUID: fPaWcV8ERbq9263rNk9T6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11662"; a="68192262"
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="68192262"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2026 08:25:56 -0800
X-CSE-ConnectionGUID: U2GxWUZGSLGd9hqPuiHUWw==
X-CSE-MsgGUID: n/axhCWHQrW0asPBZVgWhQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,203,1763452800"; 
   d="scan'208";a="239911611"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 05 Jan 2026 08:25:55 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vcnOy-000000001LF-1O7Y;
	Mon, 05 Jan 2026 16:25:52 +0000
Date: Tue, 06 Jan 2026 00:25:25 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 2/2]
 mm/balloon_compaction.c:199: warning: Function parameter or member
 'first_page' not described in 'balloon_page_list_dequeue_cont'
Message-ID: <202601060008.1BRGbier-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   f64b5635bc6da0e12f72f202d7ac1b5bb5457209
commit: 1f23c7bc1279ef309af72e4ee3a93f78b9b7a05e [2/2] anolis: virtio_balloon: Add deflate_cont_vq to deflate continuous pages
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20260106/202601060008.1BRGbier-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.4.0-5) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260106/202601060008.1BRGbier-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601060008.1BRGbier-lkp@intel.com/

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
