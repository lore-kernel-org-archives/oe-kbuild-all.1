Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95D962A1D1
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Aug 2024 00:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722991774; cv=none; b=hntbKjbSxF2ZSBVz/j6SqQOZ5WzvNiORknoYI7H0/Q3RHJRJgd5XzOvJJQn5CqmWxuGCrkNObHUpKz+kALL2nvLCejoIIBgkmQ6XqTp733fDxVavfrfjUxogiQ2UmNaOGB4yQwPPmUEGEvBcgDO2AsMf4pOPOoe6+h3CgLblv+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722991774; c=relaxed/simple;
	bh=/GAlhVJ/hWCiuO/Gq0t+UYekazTA+3fgeJqarJIxjlc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G9ZAzdwNDD1k1z4/rEnBSAtW537MoQPK1YUAy18v7pSHsITpqNnmTV6BH0oDzExeI4NpGZB/d4jZRUIVcraOeTab1lX71FYIRQ/GE1PAb/BYYt+0VaDqL1gnkjpuSIlsvNbwdvfnVyexxtElI17+J6WaEsafTC0aBhV9TvG6LrY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ccg6fVSE; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ccg6fVSE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722991773; x=1754527773;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/GAlhVJ/hWCiuO/Gq0t+UYekazTA+3fgeJqarJIxjlc=;
  b=Ccg6fVSEcvc8d+jC/8giU3FUpseCUU2Y+dIPrybik6VvGkJUu9nSwwEH
   p12vhwpsRhVYIOnPeLo+ASGSMpCXGgE2VSMV+elEahqnq7g1/7wdmcaQg
   KC38P8Qy+GAiSkPgyRR2Z5MwX5l5S5ZR2M9p2gYzTbNdmhJ5H4GZOifrI
   CZ1scoTAOlbLhFSqeYesZogLyKW/+MI4mLA5OMC+fWiEmBiA0zEtUFPDq
   vmmaof7yuGXNVCGpSiuzLlHZHQBAFAFAQ0UzOy38Akv7csR3aR03MGLlP
   8G9CTxpsuQ3fZbHsr7r3fK1PiI+xGq++B+Lqpvvc5O/o64Jq/t2i+V9sc
   Q==;
X-CSE-ConnectionGUID: KfZSBbEsQ/KilC/N/9tX9w==
X-CSE-MsgGUID: GlYqPpmBTMSpgAnvSfNNNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11156"; a="21163782"
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="21163782"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Aug 2024 17:49:29 -0700
X-CSE-ConnectionGUID: nbAawD3fRa6NBIkOb9cmAg==
X-CSE-MsgGUID: ivfnz1/GRy6i8aEcnmt6Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,268,1716274800"; 
   d="scan'208";a="94246650"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 06 Aug 2024 17:49:29 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sbUrm-00051A-1c;
	Wed, 07 Aug 2024 00:49:26 +0000
Date: Wed, 7 Aug 2024 08:48:56 +0800
From: kernel test robot <lkp@intel.com>
To: Niklas Schnelle <schnelle@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [niks:b4/blocking_domain 2/2] drivers/iommu/s390-iommu.c:721:23:
 warning: unused variable 'flags'
Message-ID: <202408070855.YxsgXBai-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/niks/linux.git b4/blocking_domain
head:   e5aacb24ca9d2b3e474ff1552e1b3a2250677024
commit: e5aacb24ca9d2b3e474ff1552e1b3a2250677024 [2/2] iommu/s390: Implement blocking domain
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20240807/202408070855.YxsgXBai-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240807/202408070855.YxsgXBai-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408070855.YxsgXBai-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/s390-iommu.c: In function 'blocking_domain_attach_device':
>> drivers/iommu/s390-iommu.c:721:23: warning: unused variable 'flags' [-Wunused-variable]
     721 |         unsigned long flags;
         |                       ^~~~~
>> drivers/iommu/s390-iommu.c:719:29: warning: unused variable 's390_domain' [-Wunused-variable]
     719 |         struct s390_domain *s390_domain = to_s390_domain(domain);
         |                             ^~~~~~~~~~~


vim +/flags +721 drivers/iommu/s390-iommu.c

   715	
   716	static int blocking_domain_attach_device(struct iommu_domain *domain,
   717						 struct device *dev)
   718	{
 > 719		struct s390_domain *s390_domain = to_s390_domain(domain);
   720		struct zpci_dev *zdev = to_zpci_dev(dev);
 > 721		unsigned long flags;
   722	
   723		if (!zdev)
   724			return 0;
   725	
   726		/* Detach sets the blocking domain */
   727		if (zdev->s390_domain)
   728			s390_iommu_detach_device(&zdev->s390_domain->domain, dev);
   729		return 0;
   730	}
   731	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
