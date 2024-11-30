Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86BD4191
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 00:04:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732925050; cv=none; b=JOOmLzMDT3EdFgHk0FVZHxeeiS3A/pIAkJNfIdH9SsE7m6sQ9i8DpK65Asq7y0p39AZ3kgB+iSA9P/dBErbf9dRtHBiRmJJvW+IwhytB0im5llI/O8st1SpMqCCG7HXDRM22W9N4BrGgFe0byiS5RD/Cc9gmeH5FOybk1HjcVBI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732925050; c=relaxed/simple;
	bh=naP+dek5NWPVg7dreFdZLHoWg/K/rphCH6BLEWnTEuA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZBnVaEEjSnr8W4bvns71LbzY9JFW32kfcqzpKkI3JdWgR4uHmNQhHsiJPuRdk4QuBhRdEp/uQmhoL8mxdn3PGILwUhVG0hUm95OasaAHO7OuY5JfQDzLrwPJN1UX66MsxCbj0ftaPtIAnSaiuVkQUjMTEJUGKqlmA3TMZz8bXh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kk1quZba; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kk1quZba"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732925048; x=1764461048;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=naP+dek5NWPVg7dreFdZLHoWg/K/rphCH6BLEWnTEuA=;
  b=kk1quZba5YR2Dz0NGu4C7HP7bZA1by8U3x6uFfIy4/8835yNpW0ctEL7
   4nSMuTOCugh+wz5V6csdnQuZmGBzMJKFK+qox/E1ZvO2KnvzVEeRcc82m
   JZILLAkrsvq7MZ715AiV+i/1BZ64ZktFRZmQmA/ZylTeMtrcR/Vc+TJMT
   zLGkRatBm/eF/vV0sKh6BXyYpvVdK/JRymhfeD32eiWNBzq6/xzHHdP2Q
   +TRZcwnkSXRYKmvo6Pocf/arVErVkW+cgFViSD3CWnsb5oKx8Ezjo1ttI
   I4h/x7KtYtlGXaLeYCJSULGTlWj8ecQkoWz2JaEHakrsrdVBe2gJBJ59E
   w==;
X-CSE-ConnectionGUID: 9OM6rlsNTzilbqyWB7V8sA==
X-CSE-MsgGUID: n0peRh6bSQOGlM3ObVKyfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="43648963"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="43648963"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 16:04:08 -0800
X-CSE-ConnectionGUID: r7lkoVizSzySPkCBIm0I5g==
X-CSE-MsgGUID: Wa8hqGPzT1muOk6u45m4iw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="92685751"
Received: from lkp-server01.sh.intel.com (HELO 5e2646291792) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 29 Nov 2024 16:04:07 -0800
Received: from kbuild by 5e2646291792 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHAxx-0000mU-0g;
	Sat, 30 Nov 2024 00:04:05 +0000
Date: Sat, 30 Nov 2024 08:03:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:iommu_pt 32/48] include/linux/iommu.h:938:24: error:
 'const struct iommu_domain_ops' has no member named 'flush_iotlb_all'
Message-ID: <202411300806.7ygJd1Zt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux iommu_pt
head:   87e70b0c76695339b0163fde25b260773b0720c2
commit: 8e43ac717967eb0f573622be728fc994e3942095 [32/48] iommu: Bind the iommu page table operations to iommupt
config: i386-buildonly-randconfig-004-20241130 (https://download.01.org/0day-ci/archive/20241130/202411300806.7ygJd1Zt-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241130/202411300806.7ygJd1Zt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411300806.7ygJd1Zt-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/iommu-sysfs.c:10:
   include/linux/iommu.h: In function 'iommu_flush_iotlb_all':
>> include/linux/iommu.h:938:24: error: 'const struct iommu_domain_ops' has no member named 'flush_iotlb_all'
     938 |         if (domain->ops->flush_iotlb_all)
         |                        ^~
   include/linux/iommu.h:939:28: error: 'const struct iommu_domain_ops' has no member named 'flush_iotlb_all'
     939 |                 domain->ops->flush_iotlb_all(domain);
         |                            ^~


vim +938 include/linux/iommu.h

4a77a6cf6d9bf9 Joerg Roedel 2008-11-26  932  
207c6e36f122eb Joerg Roedel 2017-04-26  933  extern int report_iommu_fault(struct iommu_domain *domain, struct device *dev,
207c6e36f122eb Joerg Roedel 2017-04-26  934  			      unsigned long iova, int flags);
4a77a6cf6d9bf9 Joerg Roedel 2008-11-26  935  
aae4c8e27bd756 Tom Murphy   2020-08-17  936  static inline void iommu_flush_iotlb_all(struct iommu_domain *domain)
add02cfdc9bc29 Joerg Roedel 2017-08-23  937  {
add02cfdc9bc29 Joerg Roedel 2017-08-23 @938  	if (domain->ops->flush_iotlb_all)
add02cfdc9bc29 Joerg Roedel 2017-08-23  939  		domain->ops->flush_iotlb_all(domain);
add02cfdc9bc29 Joerg Roedel 2017-08-23  940  }
add02cfdc9bc29 Joerg Roedel 2017-08-23  941  

:::::: The code at line 938 was first introduced by commit
:::::: add02cfdc9bc2987b0121861d5bb0c7392865be9 iommu: Introduce Interface for IOMMU TLB Flushing

:::::: TO: Joerg Roedel <jroedel@suse.de>
:::::: CC: Joerg Roedel <jroedel@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
