Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93E6B1B395B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Nov 2024 05:01:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730782872; cv=none; b=C7T9AIdpIg/d5+vgFpLaQITvSAL5uBpQyO/m2whA2otpbOU743OQEfB0P9Meo0/GsGXlucgxXVhh5EHzkKhXrFNeWMWScl224YHX6Pyux+kwlkpkh/2bWv5a/UotzE45RrMFa6Jk826WPtzxu3IFIwOxbv2inQnmEbyPDzDe1JM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730782872; c=relaxed/simple;
	bh=DbpdAUl03GVQJwM7XbT4aoO8AcF8uoiU8bDx+gTzhuQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UA3sf7YEYkNYyxRQC9h0UuhTi35qyNe48KpfiCQ0GAUBC1gZYHyLdsg4sg7ALfdaFXUWT95V43tvNMdT6uwCm4/7SsS2zL2v6OsSQUW+nyV4CW1s23xhM0zWyY2QiaUQ2tPW1qGm2KID85032WCqgIi0OZZ/lUKakYbjOXGR500=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LVgcT8zT; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LVgcT8zT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730782871; x=1762318871;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DbpdAUl03GVQJwM7XbT4aoO8AcF8uoiU8bDx+gTzhuQ=;
  b=LVgcT8zTN3Lsp1vXC5nedLyucRVfvf+b1E1UcWJMdaZI2fw64+aiy7+w
   G786jpfVy7Ra3oD+iwoP8U2CHlestLolTYJSSN3UVtv4RT870IGRFHa15
   RZufDW5pKTW9Wf3cYdQ6Kx4RFnAqTYumyx1xH/LDV1TyHQ1DEZFkxPCTo
   3rTwN9eboGCIUPfCzBvhUiq7Y9cvOFD+qiHzVJtgdSgyUcibTz1iWmU2Q
   KrOKqWVRP5LpVXjRMfN1uvXXL7guWvSQaOuvgveNNMkghqpPzJJC6i0p8
   D7W3DdxQzEROifnOE6FlVBwGCRG758XT6N23HZfPCvpSd6VpmU0xPg8Nb
   A==;
X-CSE-ConnectionGUID: 1233NSPhSjuPapLwj9hwow==
X-CSE-MsgGUID: UKd+ggSqSkeK+zKqLK8wxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11246"; a="33347568"
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="33347568"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2024 21:01:10 -0800
X-CSE-ConnectionGUID: 6rbv/y6gTNecLQmZ7hOAlA==
X-CSE-MsgGUID: rhMEbm6YQxSMV1k3imO/EQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,259,1725346800"; 
   d="scan'208";a="84688058"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 04 Nov 2024 21:01:08 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t8Bge-000le5-2C;
	Tue, 05 Nov 2024 05:01:04 +0000
Date: Tue, 5 Nov 2024 13:00:25 +0800
From: kernel test robot <lkp@intel.com>
To: Nicolin Chen <nicolinc@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev, Jason Gunthorpe <jgg@nvidia.com>
Subject: [jgunthorpe:smmuv3_nesting 12/48] vfio_main.c:undefined reference to
 `iova_bitmap_alloc'
Message-ID: <202411051233.3v7aHvAv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux smmuv3_nesting
head:   62751d127563bed0dce9d9a6a6b10c1dccc9f37c
commit: ecb546d9799d97ee71ae38fe482985109fcc4adb [12/48] iommufd: Move _iommufd_object_alloc helper to a sharable file
config: x86_64-buildonly-randconfig-002-20241105 (https://download.01.org/0day-ci/archive/20241105/202411051233.3v7aHvAv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241105/202411051233.3v7aHvAv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411051233.3v7aHvAv-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/vfio/vfio_main.o: in function `vfio_ioctl_device_feature':
>> vfio_main.c:(.text+0x2031): undefined reference to `iova_bitmap_alloc'
>> ld: vfio_main.c:(.text+0x2057): undefined reference to `iova_bitmap_for_each'
>> ld: vfio_main.c:(.text+0x2061): undefined reference to `iova_bitmap_free'
   ld: drivers/vfio/pci/mlx5/cmd.o: in function `mlx5vf_cq_poll_one':
>> drivers/vfio/pci/mlx5/cmd.c:1638: undefined reference to `iova_bitmap_set'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
