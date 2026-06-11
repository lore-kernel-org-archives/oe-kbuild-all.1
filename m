Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCACA2641FC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 01:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781142939; cv=none; b=gMBO8XZhvQ9Ssg1RNCVIDoylule7LEW9b0RQbLvQnuuVYzH2kTsJNXBOJjsq6oSgwRzQYhAJ4bYRN9KqLnzO+muLkbpqRJjGZ0qn5WoutRmHAprK1uJRiWZt/tHLcIoLIoH6/JSkboYF6u3ZW80JzwaaOMxF7CRU55hPlvDo8TQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781142939; c=relaxed/simple;
	bh=3ElpI3es8ekUAZiYe7U7IPXhm8Lx0T43H8Xtpy+AOLo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KNe38pmzNSb4fuHFKaywr1hJk2Xf6mlNdVMdDAerDXg+sJXnsMEOqWEMjv0BmByqtnw3mvoucDo877Pzf8o/mY+Gs7nNZrzksFJfV0srHscDo65JPXaZOCR4TsjqIpsW0NZ1fqoCPMcfVODoAXhcOkvxiuk9tB79rt9f7YoWMTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HQ7lZolG; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HQ7lZolG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781142936; x=1812678936;
  h=date:from:to:cc:subject:message-id;
  bh=3ElpI3es8ekUAZiYe7U7IPXhm8Lx0T43H8Xtpy+AOLo=;
  b=HQ7lZolGThbLcGdFQJpYh71gWlsZG58Wf8JZDz+d6X4xvsVTETf9+JnC
   mIh+LYkUgFe9PRxmZ+tIP/emBNrVNGIGC0DW/tVvdYGjEvZUsU77hfRpO
   jXIohiUh72HmHb44mL6UH9EfIcM93FMkB/MaGI8l6aoUSRslcmOpr6kNG
   VUhU47K+etxrulPk219lL5ornB3CYIlFuRmncO31uLQjPqHE0zPYKY3Me
   vtS6aKPx6CWlfffOeBQbG9M2ynTOyXRMNrcY8E+rXbLarwznroKSwgoUV
   HYda4H7iqkZ9hAXT90m4MhkDkVwFohQeOZdpBvaBdzOMY+DdxzjrZt1qB
   w==;
X-CSE-ConnectionGUID: NDuv6LdfThCCxSxCeBkPhA==
X-CSE-MsgGUID: 0/NKqq8BTiqwjNNOg52eZg==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="69492476"
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="69492476"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jun 2026 18:55:35 -0700
X-CSE-ConnectionGUID: rlkqWlXVQA253N6x4V2xMg==
X-CSE-MsgGUID: 4z2d4Or8QZ6Fb/jhhA9qVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,198,1774335600"; 
   d="scan'208";a="239995931"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 10 Jun 2026 18:55:33 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXUdn-00000000M9C-1nyp;
	Thu, 11 Jun 2026 01:55:31 +0000
Date: Thu, 11 Jun 2026 09:55:22 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 2/2]
 drivers/iommu/intel/iommu.c:1122:14: warning: variable 'leaf_ptes_only' set
 but not used
Message-ID: <202606110955.gInPB9MK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vineeth,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   19f145cefca5621fd2dd6693def69fe1a476b2d7
commit: 019c99390aba092e5e9be673e096a2aaf5d07bf6 [2/2] ANDROID: iommu/vt-d: pKVM: Prevent host from donating DMA pages
config: x86_64-randconfig-012-20260611 (https://download.01.org/0day-ci/archive/20260611/202606110955.gInPB9MK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260611/202606110955.gInPB9MK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606110955.gInPB9MK-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/intel/iommu.c: In function 'domain_unmap':
>> drivers/iommu/intel/iommu.c:1122:14: warning: variable 'leaf_ptes_only' set but not used [-Wunused-but-set-variable]
    1122 |         bool leaf_ptes_only;
         |              ^~~~~~~~~~~~~~


vim +/leaf_ptes_only +1122 drivers/iommu/intel/iommu.c

  1115	
  1116	/* We can't just free the pages because the IOMMU may still be walking
  1117	   the page tables, and may have cached the intermediate levels. The
  1118	   pages can only be freed after the IOTLB flush has been done. */
  1119	void domain_unmap(struct dmar_domain *domain, unsigned long start_pfn,
  1120			  unsigned long last_pfn, struct iommu_pages_list *freelist)
  1121	{
> 1122		bool leaf_ptes_only;
  1123	
  1124		if (WARN_ON(!domain_pfn_supported(domain, last_pfn)) ||
  1125		    WARN_ON(start_pfn > last_pfn))
  1126			return;
  1127	
  1128		/* we don't need lock here; nobody else touches the iova range */
  1129		leaf_ptes_only = dma_pte_clear_level(domain, agaw_to_level(domain->agaw),
  1130						     domain->pgd, 0, start_pfn, last_pfn, freelist);
  1131	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
