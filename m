Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 173EB1FE44E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Feb 2025 16:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739982913; cv=none; b=oPACZ6k/Gqx4XvdLH6yrld0dDnl77F2WnujYRsbPwoINtqjxJb87DaXbD9X0DR8R4xDtKNiKlfC4++OTBDJu0HG4RTJfaRHqQLnIIlUPmEOyMszb/Fep6wH0AvU96X5p6H8276ISJCoiCA6WwvuU6G+/7IkvuE7yaiLZ7qha+Sc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739982913; c=relaxed/simple;
	bh=ls+zVThvFTzHjZnv5XrYD8+7cb1zBxZZ8Rm2cRxErls=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k0+RhnqvvujBn72xB3rUvuDZZ5wdVlLXUeQIi0lwG8HUwtni8HlnPR7gFT1AF/Ny4dc7IDqVZCepmQHQ9AcSz16nZcUiyrR0DAvObzxCgARak75U6PX6QwiKWMr7tzNovp4/DvbFDXj8PlbvjynT2nMjl8wwKiKSyR+RYThp2LE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gHYWm/jg; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gHYWm/jg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739982911; x=1771518911;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ls+zVThvFTzHjZnv5XrYD8+7cb1zBxZZ8Rm2cRxErls=;
  b=gHYWm/jgh1QhXJmlQXVbNBh+Uvw6XEJefl87zoS+vIZTru5DnB0XtXwD
   b+Z7EKeaIkdlmQzuEFkq5OM27H2mmRh+PG2iza71C+NnVm4WADmqCwWQp
   m0DODy5nFnEU6wi5Ne1UvXhIZAQrNkpaRv94wpAc47SSMbejAMv/+wM5p
   djzVtFlW+F09uvQp155h1WiLnMJLMmtd1HP6ihPLOr8gXVeWGNludpadv
   Y5FO0mEeKyPbXPJTaLak0IWSIStN2sXVbXXcTzSw3lSIxhyc1yJfLhYy4
   gx7oJ4x/PHs8Qs2SJZTLAmgRRuCWwpbwhSl/zNCWyh2B4lQo7lVH6Ynfp
   g==;
X-CSE-ConnectionGUID: X0qBNfwVSkuy86auDVxqdw==
X-CSE-MsgGUID: rvqwys1xTTillgm4V0MKXA==
X-IronPort-AV: E=McAfee;i="6700,10204,11350"; a="39962858"
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="39962858"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Feb 2025 08:35:10 -0800
X-CSE-ConnectionGUID: EeJjIKtqR22w+8/0DDsgUQ==
X-CSE-MsgGUID: RJcoLN8ASPSKPhc99qIKcA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,299,1732608000"; 
   d="scan'208";a="114740726"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa007.fm.intel.com with ESMTP; 19 Feb 2025 08:25:52 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tkmtO-0003A5-1j;
	Wed, 19 Feb 2025 16:25:46 +0000
Date: Thu, 20 Feb 2025 00:25:09 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/20250219-handle-refactor 8/8]
 drivers/iommu/omap-iommu.c:1555:32: error: call to undeclared function
 'iommu_get_domain_for_dev_locked'; ISO C99 and later do not support implicit
 function declarations
Message-ID: <202502200043.j7RUfGvK-lkp@intel.com>
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
config: arm-randconfig-003-20250219 (https://download.01.org/0day-ci/archive/20250220/202502200043.j7RUfGvK-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250220/202502200043.j7RUfGvK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502200043.j7RUfGvK-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/omap-iommu.c:1555:32: error: call to undeclared function 'iommu_get_domain_for_dev_locked'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           struct iommu_domain *domain = iommu_get_domain_for_dev_locked(dev);
                                         ^
   drivers/iommu/omap-iommu.c:1555:32: note: did you mean 'iommu_get_domain_for_dev'?
   include/linux/iommu.h:856:29: note: 'iommu_get_domain_for_dev' declared here
   extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
                               ^
>> drivers/iommu/omap-iommu.c:1555:23: error: incompatible integer to pointer conversion initializing 'struct iommu_domain *' with an expression of type 'int' [-Wint-conversion]
           struct iommu_domain *domain = iommu_get_domain_for_dev_locked(dev);
                                ^        ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.
--
>> drivers/iommu/ipmmu-vmsa.c:641:35: error: call to undeclared function 'iommu_get_domain_for_dev_locked'; ISO C99 and later do not support implicit function declarations [-Werror,-Wimplicit-function-declaration]
           struct iommu_domain *io_domain = iommu_get_domain_for_dev_locked(dev);
                                            ^
   drivers/iommu/ipmmu-vmsa.c:641:35: note: did you mean 'iommu_get_domain_for_dev'?
   include/linux/iommu.h:856:29: note: 'iommu_get_domain_for_dev' declared here
   extern struct iommu_domain *iommu_get_domain_for_dev(struct device *dev);
                               ^
>> drivers/iommu/ipmmu-vmsa.c:641:23: error: incompatible integer to pointer conversion initializing 'struct iommu_domain *' with an expression of type 'int' [-Wint-conversion]
           struct iommu_domain *io_domain = iommu_get_domain_for_dev_locked(dev);
                                ^           ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +/iommu_get_domain_for_dev_locked +1555 drivers/iommu/omap-iommu.c

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
