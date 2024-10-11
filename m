Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297F91C8FAE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Oct 2024 21:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728683263; cv=none; b=UWDwGQuGf3d/bVkW8Sj1jimSeWt8EQkXI3odf0RmWMjRfXqn/nDTuqUr+icha247ryrYmzrrQ74MOqN62/k84pKP3Fu62Cj626LNnShHa9oxf5i/LvmglgZGvJoc+PcA03+Aeh8YxAC+5fLkuacngrEHR0VhbGXDU8BJp8FbTPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728683263; c=relaxed/simple;
	bh=IsJwlv9CpA1U7oIa4+X6q8wdxPQ7r16Co1bIkdsMiF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hcBLxx9s3NC7eFSnpTqIG5YLKGQw+nM+H3L8IX3CBascggDYKMEFl+O/MqTeFHCdJmEcpgMDo+WPjhImypN3vNFrSWnB0KUa6Eo5HWav7fcSsdLpPty8jq5S5/7KaolIrBdF8ttEB6yBzuTKmByC56JQ9OVQqdCM7nkMVVwWa9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DTcR13aP; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DTcR13aP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728683262; x=1760219262;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IsJwlv9CpA1U7oIa4+X6q8wdxPQ7r16Co1bIkdsMiF0=;
  b=DTcR13aPS0iAd2wlb1JPU5sqBZxwZiMs7/A4sFmQJpxQYKr1plbu8XA6
   Z9de+PeDWnh0ej0svi4RMQKEPdq7nY4HxStVDVVa5ei9sWqLxcsnYFXPG
   yLaXWyL+TPRRxq5qUl2ss9VaykSmQA6wlMo1LfieucAztvucmcaBx6glJ
   icQZHSnbsWbozRLoKoJNLPWyu828GosG5nW7+o8BRsj3H6U0UDDzwyin/
   5jD3CTuM6O9DT8YTiRfgwHn/NXztMBXSxeX+aVa3kqnkYmfTgHqec4EUr
   cq8PrcGzDisfIDkEYqSmUqUoAYPIW/U3Wn7X057hvmquQ5PfsGzV+61cc
   A==;
X-CSE-ConnectionGUID: pgB6Y/rQTaCHJ6gp7Yt+/w==
X-CSE-MsgGUID: fk97vPisS3adGzZOwOakeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="15723270"
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="15723270"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Oct 2024 14:47:41 -0700
X-CSE-ConnectionGUID: 9H5reODWSqK67CQWbgm2bA==
X-CSE-MsgGUID: nqeeo96YTM2OPitK/QeEQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,196,1725346800"; 
   d="scan'208";a="82022863"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Oct 2024 14:47:40 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1szNU1-000Cm8-2r;
	Fri, 11 Oct 2024 21:47:37 +0000
Date: Sat, 12 Oct 2024 05:47:09 +0800
From: kernel test robot <lkp@intel.com>
To: "Matthew Wilcox (Oracle)" <willy@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 3561/4143] mm/sparse.c:730:24: error: implicit
 declaration of function 'bootmem_type'
Message-ID: <202410120526.Ud7TRejf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   d61a00525464bfc5fe92c6ad713350988e492b88
commit: 8010bda4cd9c0dded1cb1e52ac1d14f4e6a55ec9 [3561/4143] bootmem: stop using page->index
config: loongarch-randconfig-r061-20241012 (https://download.01.org/0day-ci/archive/20241012/202410120526.Ud7TRejf-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241012/202410120526.Ud7TRejf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410120526.Ud7TRejf-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/sparse.c: In function 'free_map_bootmem':
>> mm/sparse.c:730:24: error: implicit declaration of function 'bootmem_type' [-Wimplicit-function-declaration]
     730 |                 type = bootmem_type(page);
         |                        ^~~~~~~~~~~~
>> mm/sparse.c:735:39: error: implicit declaration of function 'bootmem_info' [-Wimplicit-function-declaration]
     735 |                 removing_section_nr = bootmem_info(page);
         |                                       ^~~~~~~~~~~~


vim +/bootmem_type +730 mm/sparse.c

   719	
   720	static void free_map_bootmem(struct page *memmap)
   721	{
   722		unsigned long maps_section_nr, removing_section_nr, i;
   723		unsigned long type, nr_pages;
   724		struct page *page = virt_to_page(memmap);
   725	
   726		nr_pages = PAGE_ALIGN(PAGES_PER_SECTION * sizeof(struct page))
   727			>> PAGE_SHIFT;
   728	
   729		for (i = 0; i < nr_pages; i++, page++) {
 > 730			type = bootmem_type(page);
   731	
   732			BUG_ON(type == NODE_INFO);
   733	
   734			maps_section_nr = pfn_to_section_nr(page_to_pfn(page));
 > 735			removing_section_nr = bootmem_info(page);
   736	
   737			/*
   738			 * When this function is called, the removing section is
   739			 * logical offlined state. This means all pages are isolated
   740			 * from page allocator. If removing section's memmap is placed
   741			 * on the same section, it must not be freed.
   742			 * If it is freed, page allocator may allocate it which will
   743			 * be removed physically soon.
   744			 */
   745			if (maps_section_nr != removing_section_nr)
   746				put_page_bootmem(page);
   747		}
   748	}
   749	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
