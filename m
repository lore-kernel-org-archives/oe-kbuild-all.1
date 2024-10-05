Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BC77BE6C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Oct 2024 12:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728133036; cv=none; b=W4isjjZZfvlF9fJ2cmqu0dubnFpLpyP7txEDlqrckC5cgZpFdI/VrnahWPG5qWwEdGhSba0lLrkEXsGfnXG00v3YmZuc28OiLKcIDxD2ZzMmHxf9yhkgfSug+IUfWbI/JAnUlaaH34LDWuJ//K+e4h2GFp0QOQ1wkuYwephtSW4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728133036; c=relaxed/simple;
	bh=g4UY5f7mfhWmhow/81eRvpgWZEA4jO+KI7xD+8hUEhc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y8SQRxJs+KUI0L5dS3ALDwh2fVElP+Ke/RFh1usYOvO7f2IWs/9R2jrZoC8jBBsei2IB9zDQQeE1j+kQ8zvWsm0nZXDGL+79PV9LLFIYfI5xLeuSbVChWUXt75aoQyeezEoqNPky4OBdEwayfIRYsUoYN3cqJmVrsUzZQJGHUvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BkjZ+YWP; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BkjZ+YWP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728133035; x=1759669035;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g4UY5f7mfhWmhow/81eRvpgWZEA4jO+KI7xD+8hUEhc=;
  b=BkjZ+YWPEi0Hbp187dkr3X5AcAGuaGVdZ7IAk7qYU7naCTwLxMlhNxQ1
   W2vmDCYqffuMwQdh1y0aJK5pUSp53kIHRa/qMU7o2PeKwC0axjE04qmv0
   1qvQyH1A2U1QICa0P5BNmXaG0zNAF4BhmnVqTguycxRPEAa0a8UZJqOEh
   5nXsc7I5IBH71R1oV7bEtSnMRRt85bEO/YhvJbvNYafWLGvslBl8YuXHV
   PwouJmPf4v87Ry8OZwNtuL+584wbqHpF8m9IuZ9mLh7TB4m1u5Vz9cpxK
   mxpsyoJKwXimXf0cPJvWVt5cYQvC+1oTegzcfxRKvhB/WNO9ZQWZCcibV
   w==;
X-CSE-ConnectionGUID: AXkm2SlZT0mMNXmOhV9FXA==
X-CSE-MsgGUID: eKZmIBUuRlKOIIySMFVJig==
X-IronPort-AV: E=McAfee;i="6700,10204,11215"; a="30224500"
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="30224500"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Oct 2024 05:57:10 -0700
X-CSE-ConnectionGUID: mrfNAmY3Qtmsub+hk2bmDA==
X-CSE-MsgGUID: laf2BZdBQ9yQLK3uadZ0Tw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,180,1725346800"; 
   d="scan'208";a="105730787"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 05 Oct 2024 05:57:09 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sx4LK-0002xG-3C;
	Sat, 05 Oct 2024 12:57:07 +0000
Date: Sat, 5 Oct 2024 20:56:55 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:for-vasant 10/10] drivers/iommu/iommu.c:98:1: warning:
 '__iommu_group_domain_alloc' declared 'static' but never defined
Message-ID: <202410052031.VzFCQbcU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux for-vasant
head:   8aa0df6ce0d35430baeac4ee5e0ea77f82cf2ead
commit: 8aa0df6ce0d35430baeac4ee5e0ea77f82cf2ead [10/10] iommu: Create __iommu_alloc_identity_domain()
config: x86_64-buildonly-randconfig-004-20241005 (https://download.01.org/0day-ci/archive/20241005/202410052031.VzFCQbcU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241005/202410052031.VzFCQbcU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410052031.VzFCQbcU-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/iommu.c:98:1: warning: '__iommu_group_domain_alloc' declared 'static' but never defined [-Wunused-function]
      98 | __iommu_group_domain_alloc(struct iommu_group *group, unsigned int type);
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +98 drivers/iommu/iommu.c

faf1498993cdf6 Joerg Roedel    2019-08-19   93  
c13dbc1e248549 Robin Murphy    2022-08-15   94  static int iommu_bus_notifier(struct notifier_block *nb,
c13dbc1e248549 Robin Murphy    2022-08-15   95  			      unsigned long action, void *data);
e223864f8257af Jason Gunthorpe 2023-04-12   96  static void iommu_release_device(struct device *dev);
8359cf39acba72 Jason Gunthorpe 2023-09-13   97  static struct iommu_domain *
8359cf39acba72 Jason Gunthorpe 2023-09-13  @98  __iommu_group_domain_alloc(struct iommu_group *group, unsigned int type);
6e1aa2049154d7 Joerg Roedel    2020-04-29   99  static int __iommu_attach_device(struct iommu_domain *domain,
6e1aa2049154d7 Joerg Roedel    2020-04-29  100  				 struct device *dev);
6e1aa2049154d7 Joerg Roedel    2020-04-29  101  static int __iommu_attach_group(struct iommu_domain *domain,
6e1aa2049154d7 Joerg Roedel    2020-04-29  102  				struct iommu_group *group);
c568ecb8c3efb4 Jason Gunthorpe 2024-09-11  103  static struct iommu_domain *__iommu_paging_domain_alloc_flags(struct device *dev,
c568ecb8c3efb4 Jason Gunthorpe 2024-09-11  104  						       unsigned int type,
c568ecb8c3efb4 Jason Gunthorpe 2024-09-11  105  						       unsigned int flags);
dcf40ed3a20d72 Jason Gunthorpe 2023-05-11  106  

:::::: The code at line 98 was first introduced by commit
:::::: 8359cf39acba72606736f453f54432ac9dc28523 iommu: Add __iommu_group_domain_alloc()

:::::: TO: Jason Gunthorpe <jgg@nvidia.com>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
