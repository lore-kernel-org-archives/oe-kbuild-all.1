Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14DEFC08
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Feb 2025 03:01:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740279706; cv=none; b=QYiyWGNPWbWTCz/n4vLcY5PtgrgthTLJ5uYg5o/l+kMLq+H14O5/WnLFPhK/6rytnh/wl690BW03SQUKdyCroZc6wcnnwpopNNgOV33Is61tVJMQXW1y5t5/1l4vanzqHw+1Y8uNFO6H1XEHFxMhOtYFZYkOJhHQXxjZs50qTm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740279706; c=relaxed/simple;
	bh=40/mr5TISKRW+KOpQzc3lNryy3fICHotKt6NqL4pK30=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nRdSTqUF4EkPzn3n0qApJSN9CTycmahRmv0OJP5fo/bRGNg2cNy6aNs+Ngu9h2td7Itnqr/0rVAXuJlg2FR1LISMGFrUcPfR3JpllRnqAcUPuOW3FKM17zisMnOT6S0ETvwLOA4vctBgIXkySnUQ9kjU4rfma+qSKA4BE4+icH4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=P8kWFbz5; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="P8kWFbz5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740279704; x=1771815704;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=40/mr5TISKRW+KOpQzc3lNryy3fICHotKt6NqL4pK30=;
  b=P8kWFbz5JZRoqZjX9+8lU1wHXLRHeZ7tGRkk5hphy4P3bbfbONIj4+HG
   Uv2mjzyqQxfeyjhcqGTImenft7W4ulHxgiGILaBsvgk+HA9gPvt3V2dhf
   Bsmf5peSNE5eG3Tg60EiuKatPKM35mtEsH1IE6b+HbWB6qwzSxa0WMajX
   4xsPBPfEvKfzn+PmYJnwB+4M9H2uVR8NCIJAtzCXUEn16gGeEVYkZRCJ4
   iNulyiALrZmYL0iwXLIheoff0ARDGsvzbrRZAaO7Twr9CvNEwm1DLtsVl
   LNZwIznrD//c15tBueE6offGBXMjan9x7OWFlSE+DLpGSYl+241xHVTCc
   w==;
X-CSE-ConnectionGUID: lXD69+4ISFKbi2HVIsHoiw==
X-CSE-MsgGUID: 7TF9foZ3QxmgFmOMviGTcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11353"; a="40937099"
X-IronPort-AV: E=Sophos;i="6.13,308,1732608000"; 
   d="scan'208";a="40937099"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2025 19:01:43 -0800
X-CSE-ConnectionGUID: Kngcs5uyS+WGBK0AjxUeQA==
X-CSE-MsgGUID: gvV0gGPiTWq7CvASuUy1Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="115570098"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 22 Feb 2025 19:01:41 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tm2FP-00075b-1J;
	Sun, 23 Feb 2025 03:01:39 +0000
Date: Sun, 23 Feb 2025 11:00:48 +0800
From: kernel test robot <lkp@intel.com>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH bpf-next v9 3/6] mm, bpf: Introduce free_pages_nolock()
Message-ID: <202502231009.vjtHZJhD-lkp@intel.com>
References: <20250222024427.30294-4-alexei.starovoitov@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250222024427.30294-4-alexei.starovoitov@gmail.com>

Hi Alexei,

kernel test robot noticed the following build warnings:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Alexei-Starovoitov/locking-local_lock-Introduce-localtry_lock_t/20250222-104619
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
patch link:    https://lore.kernel.org/r/20250222024427.30294-4-alexei.starovoitov%40gmail.com
patch subject: [PATCH bpf-next v9 3/6] mm, bpf: Introduce free_pages_nolock()
config: x86_64-buildonly-randconfig-003-20250223 (https://download.01.org/0day-ci/archive/20250223/202502231009.vjtHZJhD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250223/202502231009.vjtHZJhD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502231009.vjtHZJhD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_alloc.c:4899: warning: Function parameter or struct member 'fpi_flags' not described in '___free_pages'
>> mm/page_alloc.c:4899: warning: expecting prototype for __free_pages(). Prototype was for ___free_pages() instead
   mm/page_alloc.c:7171: warning: Function parameter or struct member 'nid' not described in 'try_alloc_pages'
   mm/page_alloc.c:7171: warning: Function parameter or struct member 'order' not described in 'try_alloc_pages'


vim +4899 mm/page_alloc.c

^1da177e4c3f415 Linus Torvalds          2005-04-16  4876  
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4877) /**
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4878)  * __free_pages - Free pages allocated with alloc_pages().
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4879)  * @page: The page pointer returned from alloc_pages().
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4880)  * @order: The order of the allocation.
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4881)  *
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4882)  * This function can free multi-page allocations that are not compound
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4883)  * pages.  It does not check that the @order passed in matches that of
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4884)  * the allocation, so it is easy to leak memory.  Freeing more memory
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4885)  * than was allocated will probably emit a warning.
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4886)  *
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4887)  * If the last reference to this page is speculative, it will be released
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4888)  * by put_page() which only frees the first page of a non-compound
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4889)  * allocation.  To prevent the remaining pages from being leaked, we free
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4890)  * the subsequent pages here.  If you want to use the page's reference
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4891)  * count to decide when to free the allocation, you should allocate a
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4892)  * compound page, and use put_page() instead of __free_pages().
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4893)  *
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4894)  * Context: May be called in interrupt context or while holding a normal
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4895)  * spinlock, but not in NMI context or while holding a raw spinlock.
7f194fbb2dd75e9 Matthew Wilcox (Oracle  2020-12-14  4896)  */
6a8d5134d2d09c2 Alexei Starovoitov      2025-02-21  4897  static void ___free_pages(struct page *page, unsigned int order,
6a8d5134d2d09c2 Alexei Starovoitov      2025-02-21  4898  			  fpi_t fpi_flags)
742aa7fb52c56fb Aaron Lu                2018-12-28 @4899  {
462a8e08e0e6287 David Chen              2023-02-09  4900  	/* get PageHead before we drop reference */
462a8e08e0e6287 David Chen              2023-02-09  4901  	int head = PageHead(page);
cc92eba1c88b1f7 Suren Baghdasaryan      2024-03-21  4902  	struct alloc_tag *tag = pgalloc_tag_get(page);
462a8e08e0e6287 David Chen              2023-02-09  4903  
742aa7fb52c56fb Aaron Lu                2018-12-28  4904  	if (put_page_testzero(page))
6a8d5134d2d09c2 Alexei Starovoitov      2025-02-21  4905  		__free_frozen_pages(page, order, fpi_flags);
cc92eba1c88b1f7 Suren Baghdasaryan      2024-03-21  4906  	else if (!head) {
cc92eba1c88b1f7 Suren Baghdasaryan      2024-03-21  4907  		pgalloc_tag_sub_pages(tag, (1 << order) - 1);
e320d3012d25b1f Matthew Wilcox (Oracle  2020-10-13  4908) 		while (order-- > 0)
6a8d5134d2d09c2 Alexei Starovoitov      2025-02-21  4909  			__free_frozen_pages(page + (1 << order), order,
6a8d5134d2d09c2 Alexei Starovoitov      2025-02-21  4910  					    fpi_flags);
6a8d5134d2d09c2 Alexei Starovoitov      2025-02-21  4911  	}
742aa7fb52c56fb Aaron Lu                2018-12-28  4912  }
6a8d5134d2d09c2 Alexei Starovoitov      2025-02-21  4913  void __free_pages(struct page *page, unsigned int order)
6a8d5134d2d09c2 Alexei Starovoitov      2025-02-21  4914  {
6a8d5134d2d09c2 Alexei Starovoitov      2025-02-21  4915  	___free_pages(page, order, FPI_NONE);
cc92eba1c88b1f7 Suren Baghdasaryan      2024-03-21  4916  }
^1da177e4c3f415 Linus Torvalds          2005-04-16  4917  EXPORT_SYMBOL(__free_pages);
^1da177e4c3f415 Linus Torvalds          2005-04-16  4918  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
