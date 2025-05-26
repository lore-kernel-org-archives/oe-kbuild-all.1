Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE53728DB72
	for <oe-kbuild-all@lists.linux.dev>; Thu, 29 May 2025 11:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748516597; cv=none; b=Ok8LmSwPJLCpnele+VjJKwTKIQnNN56EQBNcfMF2rh2SCyzScPLKrfJUpyhUHvhfl6KZwRgg8F1KwjlbQntPocWzXhZ+AmfyWU9f58VMss2nOwHnmmJg9trdIlQdm6pMCsTgQxE8dZEsO+uD4mOW26OnP3db4PSWDCkW7XlTCuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748516597; c=relaxed/simple;
	bh=6DdptIT103K5Mm13Vwtbi9kzqUwDr9w5Dsbp7pIDNzw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PW/mnkrRpvzyDuzLxG5b/qWNMS0aYxKJ3d62PhguuLfs1ohylgTZI0nrnOrKorTmpwcldwt/gSlalZ4xBJ2wQnivaZLJddLzXYs5kFRUj4KWEZL/ZCJPDzK7vMQZOCB62DbWWI5CyvV7RP+UyBN7xDdPIRb8o9bkxULdCo8FhRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=moWtRtpP; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="moWtRtpP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748516596; x=1780052596;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=6DdptIT103K5Mm13Vwtbi9kzqUwDr9w5Dsbp7pIDNzw=;
  b=moWtRtpPwjDJCDGyUJYCfBGZqoRI0dlc77UHCjwjeb7QmeXD1aLRfoqN
   j1sucpsPkpqJaxXi5vH1TdEeLl5OC1oy7s501SSgSAdcYESlVFK6JNCe7
   siur1l3Jln8fTbbKlzFbXKgnRUtAmjWosI658U3kGDsg3DwwQ4vEl8ZFs
   3zdd4qDpUY08lGhJ1J0OtsbtJewBus+v/2lG8MQpjCevdJ3TgsjRxQWHB
   5ckh61Y6O/e/sD1risLj//8yNzYR3Pbm3bRdh+JJv9STqTfAbmFZto/fc
   OPxHCZS2h01JMglA6hf6Z4hNLLBiIQkabeYWuInMJRgP2UGAw76ZeJQgN
   w==;
X-CSE-ConnectionGUID: WXOb7KyJRVeTmopkSgLr+A==
X-CSE-MsgGUID: z9yy9FPKSDmgNycN4Pcr/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="54369594"
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="54369594"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 May 2025 04:03:12 -0700
X-CSE-ConnectionGUID: NzJSqioURhua1EiEMPLBZg==
X-CSE-MsgGUID: 6AKiuypiRTuRcSNgFSbkxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,192,1739865600"; 
   d="scan'208";a="148303620"
Received: from igk-lkp-server01.igk.intel.com (HELO b69e6467d450) ([10.211.3.150])
  by orviesa003.jf.intel.com with ESMTP; 29 May 2025 04:03:10 -0700
Received: from kbuild by b69e6467d450 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKb2R-0000G4-2Y;
	Thu, 29 May 2025 11:03:07 +0000
Date: Mon, 26 May 2025 23:37:42 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 0/1] mm/memory.c:1718: warning: Function
 parameter or member 'details' not described in 'zap_page_range'
Message-ID: <202505262316.S0jY0eRq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Qi,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   de277dab626c9ece4c9cf99ec9c56f23b298a042
commit: 41aa13e68be21943e440b9f8df819ce65301fd26 [0/1] bytedance: add details parameter for zap_page_range()
config: x86_64-buildonly-randconfig-2002-20250514 (https://download.01.org/0day-ci/archive/20250526/202505262316.S0jY0eRq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250526/202505262316.S0jY0eRq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505262316.S0jY0eRq-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/memory.c:1718: warning: Function parameter or member 'details' not described in 'zap_page_range'


vim +1718 mm/memory.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  1707  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1708  /**
^1da177e4c3f41 Linus Torvalds 2005-04-16  1709   * zap_page_range - remove user pages in a given range
^1da177e4c3f41 Linus Torvalds 2005-04-16  1710   * @vma: vm_area_struct holding the applicable pages
eb4546bbbdb160 Randy Dunlap   2012-06-20  1711   * @start: starting address of pages to zap
^1da177e4c3f41 Linus Torvalds 2005-04-16  1712   * @size: number of bytes to zap
f5cc4eef9987d0 Al Viro        2012-03-05  1713   *
f5cc4eef9987d0 Al Viro        2012-03-05  1714   * Caller must protect the VMA list
^1da177e4c3f41 Linus Torvalds 2005-04-16  1715   */
7e027b14d53e97 Linus Torvalds 2012-05-06  1716  void zap_page_range(struct vm_area_struct *vma, unsigned long start,
41aa13e68be219 Qi Zheng       2025-04-01  1717  		unsigned long size, struct zap_details *details)
^1da177e4c3f41 Linus Torvalds 2005-04-16 @1718  {
ac46d4f3c43241 Jérôme Glisse  2018-12-28  1719  	struct mmu_notifier_range range;
d16dfc550f5326 Peter Zijlstra 2011-05-24  1720  	struct mmu_gather tlb;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1721  
^1da177e4c3f41 Linus Torvalds 2005-04-16  1722  	lru_add_drain();
7269f999934b28 Jérôme Glisse  2019-05-13  1723  	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, vma, vma->vm_mm,
6f4f13e8d9e27c Jérôme Glisse  2019-05-13  1724  				start, start + size);
a72afd873089c6 Will Deacon    2021-01-27  1725  	tlb_gather_mmu(&tlb, vma->vm_mm);
ac46d4f3c43241 Jérôme Glisse  2018-12-28  1726  	update_hiwater_rss(vma->vm_mm);
ac46d4f3c43241 Jérôme Glisse  2018-12-28  1727  	mmu_notifier_invalidate_range_start(&range);
ac46d4f3c43241 Jérôme Glisse  2018-12-28  1728  	for ( ; vma && vma->vm_start < range.end; vma = vma->vm_next)
41aa13e68be219 Qi Zheng       2025-04-01  1729  		unmap_single_vma(&tlb, vma, start, range.end, details);
ac46d4f3c43241 Jérôme Glisse  2018-12-28  1730  	mmu_notifier_invalidate_range_end(&range);
ae8eba8b5d723a Will Deacon    2021-01-27  1731  	tlb_finish_mmu(&tlb);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1732  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  1733  

:::::: The code at line 1718 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
