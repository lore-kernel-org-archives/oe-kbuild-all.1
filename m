Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB1917BC9
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jun 2024 16:43:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717692183; cv=none; b=WCPWoKh/xA7WCsiw7DQ5kRl2H6pTY45T7f1c2AgEras+WVqswl3SvzJOzWBs5IOiTcg/IrO7tNtR06rEuj4r4W8G5uCfeVRs88WqHJ0gScxSaxRXwedVo1eVzmTz6o+4HFjigPhRKasuseb/eHM/7s9lw9yw53DjRMg4VHdmHfY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717692183; c=relaxed/simple;
	bh=Z/qGZ6kXbDyftM+bdn++DLcG4nsRU9+UtEnoBlLP/co=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZobdG5cvKyrPpH7mcWD4agZ1HFuFzcm3CimjIAEQHH19B7+QSQyHzWwFJgWZ89M5avmmUl6pNYA1+HNwtiyw+fqfwAFGBR7rn6mCZLFxGoEgd9uwnTAGHAtu6WzoPNPFbHhjEjV5BqRRpCHopy6fGWJ3VYSwPf4a4pKm/EBEUU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OrtcdLuI; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OrtcdLuI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717692181; x=1749228181;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z/qGZ6kXbDyftM+bdn++DLcG4nsRU9+UtEnoBlLP/co=;
  b=OrtcdLuIMhbjkmapwnGOPHW4x1b8CEJ1klsOEoJ5oDvckp/2Bn1Hdw+G
   NPE747MlNBNjbC2r7obYq4KuSUMngLG42Tl2VNn6sq8v7xxbH1JAkgIq0
   B/0tsvKz/yUWsQdkxGjPS7a8UuqRRR1+TvcfFYXZTZ1obXSpGHKj5PQhj
   KGjAfsU4msAUul+lXdZgMvM32eevQ7a2Fg/6Fa68KqwwwUWdqTU6GRohy
   fkMm5JRQpQ1637WmtbCobp/2Ow4RABkiK2pG3LTd2iXmLB0YE5VXf75Kr
   6kDmreGzmJrnbtbQbxXgbor0/15vZhY8AA0kI3yCWo5M1XKFa1gW+Mpa+
   g==;
X-CSE-ConnectionGUID: 5Wq5DJkMQB+wT9uE37kUNw==
X-CSE-MsgGUID: dtdE636BSIS1A0d+YrKcdw==
X-IronPort-AV: E=McAfee;i="6600,9927,11095"; a="17310090"
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="17310090"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jun 2024 09:43:01 -0700
X-CSE-ConnectionGUID: 8KkXGYsmS3uzWlMH64sCIA==
X-CSE-MsgGUID: FCbnaRMJQXaGdznRIBD1XQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,219,1712646000"; 
   d="scan'208";a="37889531"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jun 2024 09:42:55 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFGCN-0003Py-2x;
	Thu, 06 Jun 2024 16:42:49 +0000
Date: Fri, 7 Jun 2024 00:41:10 +0800
From: kernel test robot <lkp@intel.com>
To: David Hildenbrand <david@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [davidhildenbrand:virtio-mem-pg-offline 3/5] mm/mm_init.c:2508:9:
 error: implicit declaration of function '_free_pages_core'; did you mean
 '__free_pages_core'?
Message-ID: <202406070022.hbhs2wAc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/davidhildenbrand/linux virtio-mem-pg-offline
head:   1816cc48b3c54139589a526b6986439600b80180
commit: 4a19cdf655855a47e0b84be7783451da60a7f9e1 [3/5] mm: pass meminit_context to __free_pages_core()
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240607/202406070022.hbhs2wAc-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406070022.hbhs2wAc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406070022.hbhs2wAc-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/mm_init.c: In function 'memblock_free_pages':
>> mm/mm_init.c:2508:9: error: implicit declaration of function '_free_pages_core'; did you mean '__free_pages_core'? [-Werror=implicit-function-declaration]
    2508 |         _free_pages_core(page, order, MEMINIT_EARLY);
         |         ^~~~~~~~~~~~~~~~
         |         __free_pages_core
   cc1: some warnings being treated as errors


vim +2508 mm/mm_init.c

  2482	
  2483	void __init memblock_free_pages(struct page *page, unsigned long pfn,
  2484								unsigned int order)
  2485	{
  2486		if (IS_ENABLED(CONFIG_DEFERRED_STRUCT_PAGE_INIT)) {
  2487			int nid = early_pfn_to_nid(pfn);
  2488	
  2489			if (!early_page_initialised(pfn, nid))
  2490				return;
  2491		}
  2492	
  2493		if (!kmsan_memblock_free_pages(page, order)) {
  2494			/* KMSAN will take care of these pages. */
  2495			return;
  2496		}
  2497	
  2498		/* pages were reserved and not allocated */
  2499		if (mem_alloc_profiling_enabled()) {
  2500			union codetag_ref *ref = get_page_tag_ref(page);
  2501	
  2502			if (ref) {
  2503				set_codetag_empty(ref);
  2504				put_page_tag_ref(ref);
  2505			}
  2506		}
  2507	
> 2508		_free_pages_core(page, order, MEMINIT_EARLY);
  2509	}
  2510	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
