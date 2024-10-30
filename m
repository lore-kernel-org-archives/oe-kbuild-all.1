Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B0CADDCD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Oct 2024 00:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730247465; cv=none; b=jb5iRxK5hezfFYC0UgXpq/oxK0CIRl+co/hQ+gXfR8xoU80A7Af3ErtYMRn9f/y34cfACd+BWpQ+KxxWEdpOBobqWrmoz3VESzv2DUxGnc7MYhxsL+ddbb7KmtnrVR52Yo4S5GlcBo60/knG8naEbC4fTIRke3sbjMDi9LJpNGs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730247465; c=relaxed/simple;
	bh=3TIpW9Nj1Ob216jWFhqKuccjWD7KJU8wZ4nagEYyYY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I730b9O7ZbCwO5icQ3H2o16t3Nv56sQ3rMOXlykYt0cPXMx5noCQzV8vy0nPStx7ETNViLNIoTK7T/mjHEkfsl7oYfmxnAU0F1zlyqvE6aYAyYzIue1O5Suag88q75UFsDp0ThJhO+Ztf/opqeI1/mp3tx2kTZcbXBPzevqRd8o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gEhm86+g; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gEhm86+g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730247463; x=1761783463;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3TIpW9Nj1Ob216jWFhqKuccjWD7KJU8wZ4nagEYyYY4=;
  b=gEhm86+gPStg24jC1gwFhUc+eVfociOgWfFu4atXGojFqQ8F2wShkBpi
   Md6GflHHAt6hRlRrNEVguxOj1YA7Wz1ESGwIfQV7e18LyaSd9o+Efkdln
   pgUjIVpCR23QnoPhMHf968v1GFqoR8vcDjkkg3AaaS+8WC08YZzVOFmRu
   CmaFyifMrjOdF+rsKGIhyVbILrE+RGKDFgOaLUlp9+t4oixcldWQbaBSc
   1k6UIIJ87N2BZj9ijV4nZcmECgGUqFP5a6Tfbl/8jgA7LtpS1cFqZwfp6
   vuUdaTc8nHoxlSXjY7LHcpserX0RlfXq7FVT0Uvlt8C8CkK/VORmJSCG1
   w==;
X-CSE-ConnectionGUID: ujfXiFgzSVyudrrL/Ej4qw==
X-CSE-MsgGUID: 0RB2Yap4R3KqY9jOhrgi0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="33723311"
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="33723311"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 17:17:39 -0700
X-CSE-ConnectionGUID: mZv7vaMmS4qkETsjViY4LA==
X-CSE-MsgGUID: gXATe6hfQw65b1M9s3dabw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,243,1725346800"; 
   d="scan'208";a="82237373"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 29 Oct 2024 17:17:37 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5wP0-000eIy-2y;
	Wed, 30 Oct 2024 00:17:34 +0000
Date: Wed, 30 Oct 2024 08:17:24 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: oe-kbuild-all@lists.linux.dev, Joerg Roedel <jroedel@suse.de>,
	Vasant Hegde <vasant.hegde@amd.com>,
	Lu Baolu <baolu.lu@linux.intel.com>, Yi Liu <yi.l.liu@intel.com>,
	Kevin Tian <kevin.tian@intel.com>
Subject: [iommu:core 10/22] include/linux/iommu.h:1085: multiple definition
 of `iommu_paging_domain_alloc_flags';
 arch/x86/kvm/../../../virt/kvm/vfio.o:include/linux/iommu.h:1085: first
 defined here
Message-ID: <202410300824.FoaIMuCP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iommu/linux.git core
head:   a33bf8d8ce7e06bf0f033865b0cea5887cd2ac8c
commit: 20858d4ebb423826b7a978d54cde195f51d87e20 [10/22] iommu: Introduce iommu_paging_domain_alloc_flags()
config: x86_64-randconfig-r064-20241029 (https://download.01.org/0day-ci/archive/20241030/202410300824.FoaIMuCP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300824.FoaIMuCP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300824.FoaIMuCP-lkp@intel.com/

Note: the iommu/core HEAD a33bf8d8ce7e06bf0f033865b0cea5887cd2ac8c builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   ld: arch/x86/kvm/x86.o: in function `iommu_paging_domain_alloc_flags':
>> include/linux/iommu.h:1085: multiple definition of `iommu_paging_domain_alloc_flags'; arch/x86/kvm/../../../virt/kvm/vfio.o:include/linux/iommu.h:1085: first defined here


vim +1085 include/linux/iommu.h

  1082	
  1083	struct iommu_domain *iommu_paging_domain_alloc_flags(struct device *dev,
  1084							     unsigned int flags)
> 1085	{
  1086		return ERR_PTR(-ENODEV);
  1087	}
  1088	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
