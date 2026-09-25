Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D39F483BF0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 11:00:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790334054; cv=none; b=P2vqBUrB11CHvj6/6rbxC7LXAtFAIT9XOAheboYf9SdMlJzbwYwUtCrw4YA1qT4U8ma2eF0vyfCjxQS/aBOV1r2FjsNIPloAfNTF9+1LtI4qIJjpujG7oHyRH0Er8+NKNL8g1gV1xffI/PTQtPrMV29ha1SWN8BWtoQf9XGs7ss=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790334054; c=relaxed/simple;
	bh=OmbV5Q8Q0GLMin1X3bQ7Xer9FcDgRTAwXbx1FQo4cKQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=dEdYB/WkYYITSfaKdMvz/5ge7oaMi9m8zYj1xV5DxBeodbGKzjSy1YBFcSdu6mmGzqEgX0sBDQav+kTQDFrT5IGmSMH/byjGTAwMY4qCXJKOztsHV0xgu1/AfRCfFc3GljVeg8/GTRMA22VZz6BRYyb4T0tQ3HS6HiOWqq1wm/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K7K7Rl30; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K7K7Rl30"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790334054; x=1821870054;
  h=date:from:to:cc:subject:message-id;
  bh=OmbV5Q8Q0GLMin1X3bQ7Xer9FcDgRTAwXbx1FQo4cKQ=;
  b=K7K7Rl30nE7llXSI6QiCo0bWqUjhjOvZpWMFRUu4fJMMTHewO+0YIhVB
   k9zKvFyQgR4B1oBq1kBBhS+8Lqng7XF8uPK2rT89gl60YPag8gxcO28XL
   mecuxZ+mXcyR/L9b/s8b3/g5PmaM0EpZNrT3snmyJc07SGxzmSp570fLc
   0hgFiTQKr4hnHORcdcdyuo+OIyT4QrS5rDRPKfsHrOJW88ZO/OYH0lKob
   3huA6xbvtDm6zqFAj2wzOhwkApcxHEh0Z/HXXmGy3oaEOCzaqE3Edvvdl
   0TgSHbGYLlGSD+ADqgsqSMDCxPlsYj+gDrDnnKbmf6PHh71g8pl/Mawdy
   g==;
X-CSE-ConnectionGUID: v3Bfe0WBTdWllI6L1V3DnA==
X-CSE-MsgGUID: peejNB7HQYCDS1bpx0MKIQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11915"; a="89886395"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="89886395"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 04:00:53 -0700
X-CSE-ConnectionGUID: RP64xJcEQ46Do1a2Iag3iw==
X-CSE-MsgGUID: HDFhlOVaSNaBEpE2Sc7Adw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="274402904"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 Sep 2026 04:00:52 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA3fd-00000000KTy-29xx;
	Fri, 25 Sep 2026 11:00:49 +0000
Date: Fri, 25 Sep 2026 19:00:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-2026-04 2/2]
 drivers/iommu/intel/iommu.c:1122:14: warning: variable 'leaf_ptes_only' set
 but not used
Message-ID: <202609251856.6bDwtyNf-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Vineeth,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android17-6.18-2026-04
head:   643df54b14b912667e5e41666126ce8f21e15214
commit: 019c99390aba092e5e9be673e096a2aaf5d07bf6 [2/2] ANDROID: iommu/vt-d: pKVM: Prevent host from donating DMA pages
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20260925/202609251856.6bDwtyNf-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260925/202609251856.6bDwtyNf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251856.6bDwtyNf-lkp@intel.com/

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
