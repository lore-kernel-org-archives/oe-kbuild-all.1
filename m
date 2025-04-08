Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F19E01A2C0E
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 02:24:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744079051; cv=none; b=Qqs4Sjujie8XVFny81kJu/HP2xKaYxklWZREL1DMoUoqg+IPdwq9RVl5XCE+HkWBqo21DeAE9sNYgtZrhmEfRjbDkY0JGu7lfeq4E65j5yiwJtZs6ZRE8N2C/kogSAO4ehytgHZ5UcBonsZt/3qil2uiFc+KK/qsJyU18ZcEt70=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744079051; c=relaxed/simple;
	bh=wf1ApLtobv3j4yW20Cvb4lhag6L2O8BYKLSB01ui9nA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KQNsBNBbGZRSiG4QBT6LxI6y7sDiz01GY5nwh3p6OnjCxedo6elATAcHihqqOVWxLmwpKFdqeaU/17omxEcuwJ9X+sf1uOvqDhUWRx8IyEthhhhshpbG4reNUgx8MBMJJBBXm+5o8fKIKgw1wxXbXMpq+Qm3QWVPU3UMOZK+Ep4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LHxEVojM; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LHxEVojM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744079049; x=1775615049;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wf1ApLtobv3j4yW20Cvb4lhag6L2O8BYKLSB01ui9nA=;
  b=LHxEVojM5h8VDIy6t4AFBaPxs/wS3BrGWvzUTHiV94XJN9UJ0ZPtp5eb
   QIabDFnR+Gr+VAHKX0Wr/yI3Cd30eYuNDfVWdGqv+yoYiadRz7ApWk0is
   99XXPyp172w5vKStWvcbiJ9I68YjlKjctZ7d/Ji2ihwcUtN2cq2Easljp
   wPkhGRk2NhsaT1kS0x7mUPu9ZcmL/1UeEd+l7P1L6HMn/z336rGxJ805c
   7UrD8KGnJWDqremyNb9KqXdHQYJO7QbjeoCKxfiOIwU3IArgIEIzQVbzv
   0N5z/AAhep8hciTCTE06n1hnbAdVLFRB8MDCsmUDNYnsZRskdcGrJpuAY
   Q==;
X-CSE-ConnectionGUID: Jf9JOxsZSDiU52iPuwhwTA==
X-CSE-MsgGUID: g7WVd2HvSY+7TqSepwWIPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45382995"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="45382995"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 19:24:09 -0700
X-CSE-ConnectionGUID: 7m6+2E6hSSWOBF61RMY/Ng==
X-CSE-MsgGUID: jvBLiXI0RuyY1V5LFrIUKQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="128015883"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Apr 2025 19:24:08 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1ydB-000411-0k;
	Tue, 08 Apr 2025 02:24:05 +0000
Date: Tue, 8 Apr 2025 10:23:32 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 73/73] mm/balloon_compaction.c:199:
 warning: Function parameter or member 'first_page' not described in
 'balloon_page_list_dequeue_cont'
Message-ID: <202504081003.0EQysHDV-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   b25eef84f6a2a410019d17d8923cc61a9e127ceb
commit: 61a956d9b8463d866512f3a15a12b118e2d48bae [73/73] anolis: virtio_balloon: Add deflate_cont_vq to deflate continuous pages
config: x86_64-anolis-intel-cloud-devel-6.6 (https://download.01.org/0day-ci/archive/20250408/202504081003.0EQysHDV-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081003.0EQysHDV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081003.0EQysHDV-lkp@intel.com/

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
