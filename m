Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 890A913AA5D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Apr 2024 21:13:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714425185; cv=none; b=Bo/y/n3nmkzdqiw5w4nSmi5WrwVqU3pB6CL81aKgm7XdTXTlo11MY481k2cYKpT3myyDbEhDL+AbVesJTN/a5VNWkGVbgKJGRXlTecOGE18yjGLUU3TzzXvklWmBBsvGqJy1Z2lExo5nOHNbS+x+/074kXDJY2/81aGC0msvZdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714425185; c=relaxed/simple;
	bh=IEUC0Xr06t+1IuQ4DR/+7qfDHo8uLSeVA82lhlHAhEA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XZXFY0YWyBgDPbA/L+8yc6vHYDjkTBp28SEt59s2254lkkequYvtcS38+3guYGRIgQhVk/LLS0HtooDKrV1mslAabe3jmo/DXDAuLWVx6CoB6t8+f/jtAEOhamUT4C529qgL0s2a4xolbBU9GbLZqAgWb/SuvIgQvmm3CBEOAN0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=efpzX3MW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="efpzX3MW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714425184; x=1745961184;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IEUC0Xr06t+1IuQ4DR/+7qfDHo8uLSeVA82lhlHAhEA=;
  b=efpzX3MWGKLW20uQReF3AdxhhhQ8bWSS72xCpizJQsXohdJqtlb3Oms+
   DxhYUMLKlxj2O2Ac/xVOLxRPhFfNVrPvBVbo0Z8D70UAea7U1JzKeJl++
   b9tRXSof3i7kIq10YKEGRhY31oeI79oPRL7RO4jCkwROEOTPZVF4EWKrA
   ckamdRPZW9jRJn5fPPeqYH2BgZ5hUtI7cCY0hwUbXCHhWq9HHBbqmQMfP
   F9VDOoHTUvipq23UwCem4B8ZuBqdowiXuQDPMUG+UdPd3bVgLD6Umbgaf
   oYRbgey83Mveq4x4BwpsiyfCsadiyfb3g6MMZj6sEvr4WrAbTsZ3hr7wZ
   w==;
X-CSE-ConnectionGUID: 1Ap/0YozT3SKpmtyAkfcYg==
X-CSE-MsgGUID: 6aGrhOJpTweUn8eChmHQmw==
X-IronPort-AV: E=McAfee;i="6600,9927,11059"; a="10030297"
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="10030297"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2024 14:13:01 -0700
X-CSE-ConnectionGUID: tNOKBEi2S3iZlL00MC9WLQ==
X-CSE-MsgGUID: XrRIACV3TpShOVyrWDRUTA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,240,1708416000"; 
   d="scan'208";a="26857204"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 29 Apr 2024 14:12:59 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s1YIz-0007Qq-0F;
	Mon, 29 Apr 2024 21:12:57 +0000
Date: Tue, 30 Apr 2024 05:12:52 +0800
From: kernel test robot <lkp@intel.com>
To: Vasant Hegde <vasant.hegde@amd.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Joerg Roedel <jroedel@suse.de>, Jason Gunthorpe <jgg@nvidia.com>
Subject: [linux-next:master 8395/9390] drivers/iommu/amd/pasid.c:172:17:
 error: implicit declaration of function 'mmu_notifier_unregister'; did you
 mean 'mmu_notifier_release'?
Message-ID: <202404300543.z8m1DMGM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   b0a2c79c6f3590b74742cbbc76687014d47972d8
commit: a5a91e54846d35c234939fb9170e035805353049 [8395/9390] iommu/amd: Add SVA domain support
config: x86_64-randconfig-x061-20230629 (https://download.01.org/0day-ci/archive/20240430/202404300543.z8m1DMGM-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240430/202404300543.z8m1DMGM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202404300543.z8m1DMGM-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/amd/pasid.c: In function 'iommu_sva_domain_free':
>> drivers/iommu/amd/pasid.c:172:17: error: implicit declaration of function 'mmu_notifier_unregister'; did you mean 'mmu_notifier_release'? [-Werror=implicit-function-declaration]
     172 |                 mmu_notifier_unregister(&sva_pdom->mn, domain->mm);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~
         |                 mmu_notifier_release
   drivers/iommu/amd/pasid.c: In function 'amd_iommu_domain_alloc_sva':
>> drivers/iommu/amd/pasid.c:195:15: error: implicit declaration of function 'mmu_notifier_register'; did you mean 'mmu_notifier_release'? [-Werror=implicit-function-declaration]
     195 |         ret = mmu_notifier_register(&pdom->mn, mm);
         |               ^~~~~~~~~~~~~~~~~~~~~
         |               mmu_notifier_release
   cc1: some warnings being treated as errors


vim +172 drivers/iommu/amd/pasid.c

   166	
   167	static void iommu_sva_domain_free(struct iommu_domain *domain)
   168	{
   169		struct protection_domain *sva_pdom = to_pdomain(domain);
   170	
   171		if (sva_pdom->mn.ops)
 > 172			mmu_notifier_unregister(&sva_pdom->mn, domain->mm);
   173	
   174		amd_iommu_domain_free(domain);
   175	}
   176	
   177	static const struct iommu_domain_ops amd_sva_domain_ops = {
   178		.set_dev_pasid = iommu_sva_set_dev_pasid,
   179		.free	       = iommu_sva_domain_free
   180	};
   181	
   182	struct iommu_domain *amd_iommu_domain_alloc_sva(struct device *dev,
   183							struct mm_struct *mm)
   184	{
   185		struct protection_domain *pdom;
   186		int ret;
   187	
   188		pdom = protection_domain_alloc(IOMMU_DOMAIN_SVA);
   189		if (!pdom)
   190			return ERR_PTR(-ENOMEM);
   191	
   192		pdom->domain.ops = &amd_sva_domain_ops;
   193		pdom->mn.ops = &sva_mn;
   194	
 > 195		ret = mmu_notifier_register(&pdom->mn, mm);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
