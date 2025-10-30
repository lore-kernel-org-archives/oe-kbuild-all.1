Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70E8D1F2C45
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 00:49:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761785391; cv=none; b=jP9i9QKHQyFrrNzXceib7to1buO3iB4TUDm7vhPClKbFl5tt4bzuO/BgKB4op7uWlNafEoj3ygRT4ZsyMXtTjWnQnqJPrNTqXwrpXmiBIdLis1DQIbRJ0QFAzmR95gWPNmLM2KWLh6p0H2WrYh5FKvaJ2i4jxTePbgl9SagcB2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761785391; c=relaxed/simple;
	bh=eX/Igh+wBztROzI+kZk/CEJVIo2V4rGUpOG0v4HIAnQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EfuFAOkEP11MGJvm5gu3VcbNzzh4NjXYfd4EdSrnRVbbQ/sU4LDQ1OeYGZhG7BzBgzH2Xk9Jhk59ne3fJNCrZDPIwokugjR4AIEn3K9IPaP3Qe3epHZ1OkWGh+F+Qqtd69qDvIaCZyKcuNhuiXe+UBIYtVKGLkgGu5ypS8KYfPU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K2OBAHVV; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K2OBAHVV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761785390; x=1793321390;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eX/Igh+wBztROzI+kZk/CEJVIo2V4rGUpOG0v4HIAnQ=;
  b=K2OBAHVVouaIs7afrvmUhiWSAfk/Vlx1sfqnGOnVaqZqohO9/hKi3Wuf
   nB2RrwdkEjj8jO3a4UynxnfzPpG+sX0hlyoMofSA0hFK/GLAtW7fyHpb1
   VuRk0mtv24FJYSQz1VnUFd1nidkP9qpk4DwqS+HIADMwjrSya2mVfYJFm
   06GDwOLXm5BqsIdH2LDFClRfra5iSPwOrIUKgkMEKAcrQy33fksCyKlrS
   bCF41bSKtLg6uWguz4ybylmlA+UU6NLDZVwfvZhUyC+SHzp/3JFIdz1wo
   4tBJQysrgpwY6ShvixTHi4V666Hl0zYfRxPFi4zvyETvqokxcbgRUBnZj
   g==;
X-CSE-ConnectionGUID: t0fCsQ/uSPq99gzqjGZu+g==
X-CSE-MsgGUID: AeDTyyDPT1mR/9I2+d7HTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="81340199"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="81340199"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 17:49:48 -0700
X-CSE-ConnectionGUID: aUUvloZXSSOkaTZsHJzXkA==
X-CSE-MsgGUID: Lp1RnO6RQlKH1r2YUgnCMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="186159436"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 29 Oct 2025 17:49:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEGrI-000LK8-0v;
	Thu, 30 Oct 2025 00:49:44 +0000
Date: Thu, 30 Oct 2025 08:48:48 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3064/3064] mm/page_alloc.c:1668:31: error:
 'MAX_PAGE_ORDER' undeclared; did you mean 'MAX_XAS_ORDER'?
Message-ID: <202510300800.0Oz3WLDb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   2f6a2b7160d59b59ef2bd08614200d0a2219b54e
commit: 5a5fd38ba9135eb97df57cef7392bb457ef2ef04 [3064/3064] mm: page_isolation: prepare for hygienic freelists
config: x86_64-randconfig-016-20251029 (https://download.01.org/0day-ci/archive/20251030/202510300800.0Oz3WLDb-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510300800.0Oz3WLDb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300800.0Oz3WLDb-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/page_alloc.c: In function 'find_large_buddy':
>> mm/page_alloc.c:1668:31: error: 'MAX_PAGE_ORDER' undeclared (first use in this function); did you mean 'MAX_XAS_ORDER'?
    1668 |                 if (++order > MAX_PAGE_ORDER)
         |                               ^~~~~~~~~~~~~~
         |                               MAX_XAS_ORDER
   mm/page_alloc.c:1668:31: note: each undeclared identifier is reported only once for each function it appears in
   mm/page_alloc.c: In function 'move_freepages_block_isolate':
   mm/page_alloc.c:1734:32: error: 'MAX_PAGE_ORDER' undeclared (first use in this function); did you mean 'MAX_XAS_ORDER'?
    1734 |         if (pageblock_order == MAX_PAGE_ORDER)
         |                                ^~~~~~~~~~~~~~
         |                                MAX_XAS_ORDER

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PTP_1588_CLOCK
   Depends on [n]: NET [=y] && POSIX_TIMERS [=n]
   Selected by [m]:
   - SXE [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]
   - SXE_VF [=m] && NETDEVICES [=y] && ETHERNET [=y] && NET_VENDOR_LINKDATA [=y] && (X86 [=y] || ARM64) && PCI [=y]


vim +1668 mm/page_alloc.c

  1657	
  1658	#ifdef CONFIG_MEMORY_ISOLATION
  1659	/* Look for a buddy that straddles start_pfn */
  1660	static unsigned long find_large_buddy(unsigned long start_pfn)
  1661	{
  1662		int order = 0;
  1663		struct page *page;
  1664		unsigned long pfn = start_pfn;
  1665	
  1666		while (!PageBuddy(page = pfn_to_page(pfn))) {
  1667			/* Nothing found */
> 1668			if (++order > MAX_PAGE_ORDER)
  1669				return start_pfn;
  1670			pfn &= ~0UL << order;
  1671		}
  1672	
  1673		/*
  1674		 * Found a preceding buddy, but does it straddle?
  1675		 */
  1676		if (pfn + (1 << buddy_order(page)) > start_pfn)
  1677			return pfn;
  1678	
  1679		/* Nothing found */
  1680		return start_pfn;
  1681	}
  1682	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
