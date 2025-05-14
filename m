Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E97C41552FD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 14 May 2025 15:27:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747236464; cv=none; b=LkJP7jMt0IVvdAH+xrWKZAmDc89X6+6jxT5MwmMKd+WZeyj1qLp+u2oZF07Aw+36G/rbErPKI1faJuW2KsNxBVx1lZ9B6DKUAqlcL1C52FDHEiPCuyYl+RHm/zK9vnb7Czz7Uq5zBWPYXMFRB0fc2xaPvheBtI0mbPqsUuok/8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747236464; c=relaxed/simple;
	bh=Ea7+wBt/MrcPIYqdinLuUBuOFVo6f/gsbFgImw4Sw8M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XDk27IhTWRmmQumVrIdLpxaAc6OjBNtO3s4UNCs6aZ/Y0GyZ5ek5apWu0094RqqVxlOoOZi341w0+en0dXxU+BbgPVW3gKR6NBK7c0V3pGdTGqoi2hoT4x6EcFV/Db+h0x0MHtggBIwWWPYbt/YMsJrxZMApqgGp5wmU3LajFTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=H11MgZh9; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="H11MgZh9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747236462; x=1778772462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ea7+wBt/MrcPIYqdinLuUBuOFVo6f/gsbFgImw4Sw8M=;
  b=H11MgZh9fZKWVUhPdsx5Onjg4/37xOdEElP+tNPNIhVBApTlK0h+JT+j
   5++VumEItPpQAKx/H7rtFXevwbCR5UoXUlh3Og56YCkDxF0rN47kAs47x
   AeOSuZ2YVuP2mkiUdVorhDqLlvhAIKI4fX4cBUc6kE2GuhBLnjJZOGywt
   GrPXqJyMgOyx8a9fs8XkDqEDTOKsz0CSoXaoxY/nPEonEy/6Hh8lBEzfE
   CT7xDuYfmTC0DS7ZsxbPxTDjgCn6lIMhBB+FDF4562Z4ugo+ZYoZYJvhz
   j9DtwZEYjgGluUw3s67qIoPkW0Qstveh8jL/VY+q4OxoJCga+7luUBtCd
   A==;
X-CSE-ConnectionGUID: kk/nBVkMQ5CJ6bs4SxB+/Q==
X-CSE-MsgGUID: tND2us8BS8CDYOaD+RrA3g==
X-IronPort-AV: E=McAfee;i="6700,10204,11433"; a="49011851"
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="49011851"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 May 2025 08:27:42 -0700
X-CSE-ConnectionGUID: nE3wBdNSRxSLdDhiOMyjEw==
X-CSE-MsgGUID: jCtIFJBdR3W2hJQsTSN9XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,288,1739865600"; 
   d="scan'208";a="138597879"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 14 May 2025 08:27:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFE1C-000HHF-0i;
	Wed, 14 May 2025 15:27:38 +0000
Date: Wed, 14 May 2025 23:27:08 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 56/56] mm/balloon_compaction.c:199:
 warning: Function parameter or member 'first_page' not described in
 'balloon_page_list_dequeue_cont'
Message-ID: <202505142314.U0QvBNGn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   962678f628e6378bd0b60eeb52c2e28ec5881096
commit: d268ed17fe3862e6c35371ece4890742e56dff9f [56/56] anolis: virtio_balloon: Add deflate_cont_vq to deflate continuous pages
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250514/202505142314.U0QvBNGn-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250514/202505142314.U0QvBNGn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505142314.U0QvBNGn-lkp@intel.com/

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
