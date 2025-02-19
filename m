Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030DD2862B2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 16:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739983846; cv=none; b=EcQt6YFnBlLrkCnM6ss4TC5UM2sOKYsrANB50JBqfPP9/LgC5hgo91yhCx11pakAZwWKeXH6FodSFClMi64ffIEiL/reXY5DOb8k7ZPXDrcPfeNm7wEhL3nXH95IsVu8/KDdmLy3mQT3Ko88warNcYg7137GkMw/zsw9bVl/sw8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739983846; c=relaxed/simple;
	bh=yupgmtNsDOeAbkZ5u+cH/2HKcIVTQOzEogoYYY707g0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=g8iTuzHuVYOppTDo09ra1IilMgeygFFkSMG2NI5FDWJJ2ih7lvGs5zGxGDrF6gkyalTvrNAWvkqeN+Q/R37ZGb8SsYfLF6Hfd8kIDqXJEJBeO4nTwxeveIKbdEr44QiDbHuDsn05WczksOPXtVxepTKNvzWMTZ42Gq4UEqE/f6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ldJEZXdl; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ldJEZXdl"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739983844; x=1771519844;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yupgmtNsDOeAbkZ5u+cH/2HKcIVTQOzEogoYYY707g0=;
  b=ldJEZXdlqFJQyybVCRtdqg82maK4Gf3SRxfpKLm9FRXG4miqN2x2adVW
   P03RhvGTk4s9FUrtMuZsF0oe2Q4bLd6s+V3zspE8C+oTYdp/Ujq7xQmPf
   9/wCndHxRHotQ2t9JT+9TjCivE8XX+3oZYF8gmHFfLydD0o3xkxSx/yTH
   QPrxGCy3smzHVhm09f0hYEGD8QHqubZ0ej9sykfLbLSoBOCyKGg3wQqXY
   dBiq9hmCIDag4L6iWsFFgKK9ccQKxl2CdSusdNm+GePehAyr+4VbPh3mC
   F5xVcfMLUdygm6Na7HPxuKrn5/MlHKFo0B3EWlOYq8xJqbc625z0c7ID6
   w==;
X-CSE-ConnectionGUID: nAuYHc9wQdiPaFEiKDOSVQ==
X-CSE-MsgGUID: ge0tKexmQpOyEauo9AF+Pw==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="40991246"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="40991246"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 08:50:43 -0800
X-CSE-ConnectionGUID: pdZujytWSGGaeEdiDh+muQ==
X-CSE-MsgGUID: vQOBd/smRjiuqgQvBTmwBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="114964091"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 19 Feb 2025 08:15:33 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkmj0-00039F-1q;
	Wed, 19 Feb 2025 16:15:06 +0000
Date: Thu, 20 Feb 2025 00:13:52 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/20250219-handle-refactor 8/8]
 drivers/iommu/omap-iommu.c:1555:39: error: implicit declaration of function
 'iommu_get_domain_for_dev_locked'; did you mean 'iommu_get_domain_for_dev'?
Message-ID: <202502200008.3qqaEZpH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/20250219-handle-refactor
head:   c1a19e4695fca8f123793f427f4c10638ae0ac41
commit: c1a19e4695fca8f123793f427f4c10638ae0ac41 [8/8] TMP for lockdep get_domain_for_dev
config: arm-randconfig-001-20250219 (https://download.01.org/0day-ci/archive/20250220/202502200008.3qqaEZpH-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200008.3qqaEZpH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200008.3qqaEZpH-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/omap-iommu.c: In function 'omap_iommu_identity_attach':
>> drivers/iommu/omap-iommu.c:1555:39: error: implicit declaration of function 'iommu_get_domain_for_dev_locked'; did you mean 'iommu_get_domain_for_dev'? [-Wimplicit-function-declaration]
    1555 |         struct iommu_domain *domain = iommu_get_domain_for_dev_locked(dev);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                       iommu_get_domain_for_dev
>> drivers/iommu/omap-iommu.c:1555:39: error: initialization of 'struct iommu_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
--
   drivers/iommu/msm_iommu.c: In function 'msm_iommu_identity_attach':
>> drivers/iommu/msm_iommu.c:446:39: error: implicit declaration of function 'iommu_get_domain_for_dev_locked'; did you mean 'iommu_get_domain_for_dev'? [-Wimplicit-function-declaration]
     446 |         struct iommu_domain *domain = iommu_get_domain_for_dev_locked(dev);
         |                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
         |                                       iommu_get_domain_for_dev
>> drivers/iommu/msm_iommu.c:446:39: error: initialization of 'struct iommu_domain *' from 'int' makes pointer from integer without a cast [-Wint-conversion]


vim +1555 drivers/iommu/omap-iommu.c

  1551	
  1552	static int omap_iommu_identity_attach(struct iommu_domain *identity_domain,
  1553					      struct device *dev)
  1554	{
> 1555		struct iommu_domain *domain = iommu_get_domain_for_dev_locked(dev);
  1556		struct omap_iommu_domain *omap_domain;
  1557	
  1558		if (domain == identity_domain || !domain)
  1559			return 0;
  1560	
  1561		omap_domain = to_omap_domain(domain);
  1562		spin_lock(&omap_domain->lock);
  1563		_omap_iommu_detach_dev(omap_domain, dev);
  1564		spin_unlock(&omap_domain->lock);
  1565		return 0;
  1566	}
  1567	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
