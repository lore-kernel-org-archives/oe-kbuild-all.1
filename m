Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92E5833086
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Nov 2025 19:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762112951; cv=none; b=PJ8NgdPvm8vrSv+/OpUzX+nMk8gO7nVKo5Yw5fGzKDiGAIC/02wc29yrcElUYyqyYHD4N/BVF1cF9EfKNHOBDlTRms6h7GwTrjcJll8eS4BjTxZzfEHTrw2ju6jfUwnSXC8ufQeJxnjZD62Q814/+U6gl9sk/ObDMxD/O5wH1Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762112951; c=relaxed/simple;
	bh=1xBJfaNRMhW08giWOh05C79xX+/t6NwD/XnYSLa8fSo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O1RAN17Wi12HU5aZAPHB+p6N8xsHDNFpyxf5Hxf1rdywMZ8otkdXeEmtrbIaNFnGx81HHFSTyOA3LTeZALpygFASljxX94fT+CYICRtbOZRxcQpR0yYfDkLhrCSQjitQrbuQQhPrvR9u44d3YC/Il5LcS6TiN2u/JjrS4X/5hB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kIW+8zZn; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kIW+8zZn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762112950; x=1793648950;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1xBJfaNRMhW08giWOh05C79xX+/t6NwD/XnYSLa8fSo=;
  b=kIW+8zZnUXNk69EQ2JniDObO/XE352ieTUyWJC0ZmuSb09SFOV3bx/5P
   OZyR13zLIP5Sp62zJYzXBaxqvMU/jt8CKrEhFHE47N1b3OJ4m8v6SEG5j
   iG6Kz2bPxeHqQB387C7Eerz6JYKYIrgszqTPCBs5JeWyeLehnZ37oorJP
   8Q7NbVKmbZiurmqqSbDGg8dwmUqe8/qUNjUQ8yilHmr7emFxp2cc65iA1
   iemx/A17xPCAnh+fG3du8VPZcR3j/1B/X0rmIDWcxgloWO9KdEb6F8K/w
   K8jMyCyuTd6czdlzakOD5aAVR82EWDrZn/gjFL6ye69T81FCNKlhoL9rP
   g==;
X-CSE-ConnectionGUID: muuwB36sQm2hWLtTsnUgXA==
X-CSE-MsgGUID: mvyXQyG1Qv+6K7cpKL1M+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11601"; a="68058730"
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="68058730"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2025 11:49:09 -0800
X-CSE-ConnectionGUID: avaeHPqxQnKCJyPJGwuayg==
X-CSE-MsgGUID: 9TCo8UJQQVa/ovvEvQ+nYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,274,1754982000"; 
   d="scan'208";a="191036149"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa004.jf.intel.com with ESMTP; 02 Nov 2025 11:49:08 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vFe4U-000PX2-2I;
	Sun, 02 Nov 2025 19:49:03 +0000
Date: Mon, 3 Nov 2025 03:48:51 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Jinjiang Tu <tujinjiang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3083/3083] mm/page_alloc.c:1668:17: error: use of
 undeclared identifier 'MAX_PAGE_ORDER'
Message-ID: <202511030359.alOLxYJG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   5394cae209c4a4990d81be436ba17ae56fb09d16
commit: 5a5fd38ba9135eb97df57cef7392bb457ef2ef04 [3083/3083] mm: page_isolation: prepare for hygienic freelists
config: x86_64-randconfig-001-20251103 (https://download.01.org/0day-ci/archive/20251103/202511030359.alOLxYJG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251103/202511030359.alOLxYJG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511030359.alOLxYJG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/page_alloc.c:1668:17: error: use of undeclared identifier 'MAX_PAGE_ORDER'
    1668 |                 if (++order > MAX_PAGE_ORDER)
         |                               ^
   mm/page_alloc.c:1734:25: error: use of undeclared identifier 'MAX_PAGE_ORDER'
    1734 |         if (pageblock_order == MAX_PAGE_ORDER)
         |                                ^
   2 errors generated.


vim +/MAX_PAGE_ORDER +1668 mm/page_alloc.c

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
