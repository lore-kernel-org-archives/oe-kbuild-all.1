Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0407621E097
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Jun 2025 19:34:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749497697; cv=none; b=QiIN8kgOESZLrdGs00D7OLtLA62jPFm8Kx8VYfEZekh3R+f01gf59BKOWzYynXhB7v+9+RxxrnXHM9AWGEK6R4I8oLd46MFIv3F1A2ozVh2oE803UKra4Xlwxet3FCmhBLiHdvHjETOXW6jgzDXgQ3Qr7vT1uxXZE/Pgg8lJd6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749497697; c=relaxed/simple;
	bh=S6UJv2GGQHU95nOnZ+npDZDVudL//9AaOH8Hx0A6XhM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZYQbivu+vBPPLLVcydFBZmSZwYiKmgAz5t9wNELPWU2LtQj4f8eclXWJjoXmrNS8Au5WZWY3SZbZaBD6Db8Gb+QNVuLtsD7py6eGe7OLYnhztsRmNkSmI6IaN8gxiNVMLGMaKqMtT77g/iivTU4cJFDMIM8YMOlLwXFRJSP6zoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HTctzUln; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HTctzUln"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749497696; x=1781033696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=S6UJv2GGQHU95nOnZ+npDZDVudL//9AaOH8Hx0A6XhM=;
  b=HTctzUlnSi24ZV63N/XfqAikr+bOOwKkP/hvoTWbfIM61G4beL/zEaDv
   EAHpPWHg7orgXdS4ketgtWxsIkOvVWhfqI143eVh5SSYbH71E5dmdMJ5g
   2ln8TsJX0mLjCdCBBeqIM4L+f0GWiIzN8HyWg1RYIpM7e6Kzh5j9NTbGY
   ZBJIulVn3XiRYl/ySXMTKkKnRE9j+jDSWjQ679IMoMkAqxGnpy05BgyHf
   wYMWOX0seLQcrU7tpFn5kU7MCKuClgWMy4vxiQcf4P+3VxmLd6BlsPwYE
   uqJrzJqjxefpl3B4XwjHuX4YM3AZzmBwhUTYrqhy5iYwJj9WTj0FVnhk1
   w==;
X-CSE-ConnectionGUID: 3vMmki/pSkCO41VmKmxm5g==
X-CSE-MsgGUID: CBsR9Vl8Sg2fyU2HrdrLlQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="51732114"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="51732114"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2025 12:34:56 -0700
X-CSE-ConnectionGUID: Hv9by377SASg0QTFxXp5Tw==
X-CSE-MsgGUID: C1MZWqIlThmMdWDUeJQjMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; 
   d="scan'208";a="146505198"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Jun 2025 12:34:54 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uOiGh-0007M5-2v;
	Mon, 09 Jun 2025 19:34:51 +0000
Date: Tue, 10 Jun 2025 03:34:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Wang Wensheng <wangwensheng4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2380/2380] mm/share_pool.c:1226:14: error: call
 to undeclared function 'huge_ptep_get'; ISO C99 and later do not support
 implicit function declarations
Message-ID: <202506100320.weV2eiwH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Wang,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   a7f4bf73c34996ee6cdda292e8f906a9c30879de
commit: 549b1f40b56511536196f7522ffa4d7b3da42337 [2380/2380] mm/sharepool: Implement mg_sp_make_share_u2k()
config: arm64-randconfig-r112-20250610 (https://download.01.org/0day-ci/archive/20250610/202506100320.weV2eiwH-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce: (https://download.01.org/0day-ci/archive/20250610/202506100320.weV2eiwH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506100320.weV2eiwH-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/share_pool.c:1226:14: error: call to undeclared function 'huge_ptep_get'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    1226 |         pte_t pte = huge_ptep_get(ptep);
         |                     ^
>> mm/share_pool.c:1226:8: error: initializing 'pte_t' with an expression of incompatible type 'int'
    1226 |         pte_t pte = huge_ptep_get(ptep);
         |               ^     ~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/huge_ptep_get +1226 mm/share_pool.c

  1221	
  1222	static int sp_hugetlb_entry(pte_t *ptep, unsigned long hmask,
  1223				    unsigned long addr, unsigned long next,
  1224				    struct mm_walk *walk)
  1225	{
> 1226		pte_t pte = huge_ptep_get(ptep);
  1227		struct page *page = pte_page(pte);
  1228		struct sp_walk_data *sp_walk_data;
  1229	
  1230		if (unlikely(!pte_present(pte))) {
  1231			pr_debug("the page of addr %lx unexpectedly not in RAM\n", (unsigned long)addr);
  1232			return -EFAULT;
  1233		}
  1234	
  1235		sp_walk_data = walk->private;
  1236		get_page(page);
  1237		sp_walk_data->pages[sp_walk_data->page_count++] = page;
  1238		return 0;
  1239	}
  1240	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
