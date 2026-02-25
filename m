Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FCDB393DD7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Feb 2026 18:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772045024; cv=none; b=W6esffdmNM2Oh1+JvYx7ZsJ2C4XUp/lm5V+m3saeNKMbXtHdPtSYNOZRvYsBJBUaIz/uJRVSL9rAR6uBrrfT3bsEmIWGYyPppW+SvBph3QIybyfDVv6cnWKunzQQkqINjJdnAcXYFwJ4uHMkAjvotGSgBteTFmZosnO5bkOnS4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772045024; c=relaxed/simple;
	bh=ctcb+PpBhIuAAow+mabTF3DgO7Af/4FH6kNzNHqSw8U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=k5xdgU75FwykTxF1c68sMOc+u+zthoAxTjlqNaIrbyNp4b/hkkee298dKD/VBc1vuPPIcGWjHC/oM/5gCj1M40snsCYyiImmUkHA9mQxTrzbCEhh1uYmiyN9lrj28uwdptMlCUl4MxYfQwaScSo2BLBxSPszb6DOzYB3ixd7BvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dn4GPT3p; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dn4GPT3p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772045023; x=1803581023;
  h=date:from:to:cc:subject:message-id;
  bh=ctcb+PpBhIuAAow+mabTF3DgO7Af/4FH6kNzNHqSw8U=;
  b=dn4GPT3pS4GPPTNkR0GKoPhfgNXnyVyGIUiQQU/mN/XW8KoftPbB6N4v
   m20L8mWmDyfNzs06Mj2k8rAUZvllMBXbGVLdOOnKOEDDSwJqRVKjixRMr
   /9z1eXO5U5zcnL5xA9zeSmlFqM+HdqVBRf9PttrRXQNcPh0Zt5qPVsXIS
   ler8p3PzWxpU3kdH3vFa7FwxPNi9hvIOgMrooj0QxvHZTOEi+GEtlsYCq
   buyBPg5/OR7EoQ2w3V6hKNkRo32DItt8hSVnVTQ7JSXOE37l49Osr+JP1
   ue8rIoFXatDw1+Wt287oyow+DJooDPmhgs1gXu4SN536LkhUWudgDE5Uc
   Q==;
X-CSE-ConnectionGUID: ERDeGWQdRgqlLlIHQdwAng==
X-CSE-MsgGUID: WZ0AwyjhRYaHw24rL16U2w==
X-IronPort-AV: E=McAfee;i="6800,10657,11712"; a="76966025"
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="76966025"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2026 10:43:43 -0800
X-CSE-ConnectionGUID: /MQl5JAXR3ilrNkLgQ2AIg==
X-CSE-MsgGUID: TeiRprMdTUaVLdP9cPLqyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,311,1763452800"; 
   d="scan'208";a="214596093"
Received: from lkp-server02.sh.intel.com (HELO a3936d6a266d) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 25 Feb 2026 10:43:41 -0800
Received: from kbuild by a3936d6a266d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vvJrH-0000000071R-1OsJ;
	Wed, 25 Feb 2026 18:43:39 +0000
Date: Thu, 26 Feb 2026 02:39:54 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18 66/66]
 drivers/iommu/intel/iommu.c:1122:14: warning: variable 'leaf_ptes_only' set
 but not used
Message-ID: <202602260209.duMRYmxR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18
head:   c255f8ed55ab4ad860d3dc612b5b5946d6f93fa0
commit: 019c99390aba092e5e9be673e096a2aaf5d07bf6 [66/66] ANDROID: iommu/vt-d: pKVM: Prevent host from donating DMA pages
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20260226/202602260209.duMRYmxR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260226/202602260209.duMRYmxR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602260209.duMRYmxR-lkp@intel.com/

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
