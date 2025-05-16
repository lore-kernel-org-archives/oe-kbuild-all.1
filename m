Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 422EA223DCA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 May 2025 06:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747376591; cv=none; b=Mgo6VcsogdKDGS7wv1la9/HW6VT4DMek1J7GfSUyR7CNfX2zqkFhXKpCBamJGmNV87UtmT0jvJcHvnWnQwlUBuArxIfgGROCVlv8AtIj7NRypfRMMD2IPcQ+kJ7dxYrclKGfBO1qYk3JHQp83byJuCt+p8XtVUonOVGWUVzp+1A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747376591; c=relaxed/simple;
	bh=N3zKvzRQU+w1GVFU/u4+Zvo8EAhCUu/jPT2zstJFkT4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hgoyae1NK8o2wjX1ux98h1nkHl166xaAwOMnjJmwuEOSM2ly0d3wrsK327iimYny84Vg5WTcV6X+ew6lGsBmDpHkqHuFdb4nHLyoS2WHF9EetEAWO2Hax1COEZQnWgjtLf9CAoc2Fr+ysuaJ7fdIJuv0GEbTplYh+3JkSCWTTEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K6++OT7c; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K6++OT7c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747376589; x=1778912589;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=N3zKvzRQU+w1GVFU/u4+Zvo8EAhCUu/jPT2zstJFkT4=;
  b=K6++OT7csz0FNDTddJ4GMLvXzrDw6XeVKz9MQczmMX5VZnRQavroRCKl
   wHRYe5sb7OSOSeYO3YP2Gt2anbHelSZbrJpNhtsrGdut7wmMsGec4n+7O
   XsM/glnMvxM5GrODuqIlgYqMb90zvikngRe8C2sZmkXCq/edQsHqvsJBP
   +BZagqFUWEnJgA4pbCubmSpWOng4n/ZXoJfzzdETA8MYCPYp9FOZRusha
   jUVUqSZFAtcy+OIUsu7Og7uhyfAeMPZh2WB1F6lpmowEh1/ccVQYpVcv7
   SU61lW7BpfP6b41/wqq8tBXWU3W0frct3aTKQq7x6lYuqPPhJIWKr+jKz
   A==;
X-CSE-ConnectionGUID: 7Rs7Q+isQHiSAD1j2LrUxw==
X-CSE-MsgGUID: T6XR2oTfRoSDXqqT3AkCNw==
X-IronPort-AV: E=McAfee;i="6700,10204,11434"; a="71842966"
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="71842966"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 May 2025 23:23:09 -0700
X-CSE-ConnectionGUID: kDmvP3GcSC+QL1iKUL+DkQ==
X-CSE-MsgGUID: XOossB5WSbq412b0BiTL0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,293,1739865600"; 
   d="scan'208";a="139482065"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 15 May 2025 23:23:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uFoTJ-000J2V-1w;
	Fri, 16 May 2025 06:23:05 +0000
Date: Fri, 16 May 2025 14:23:01 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 5/5] include/linux/iommu.h:1152:17:
 warning: 'iommu_get_pasid_from_domain' defined but not used
Message-ID: <202505161418.LmdAAu8B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jacob,

FYI, the error/warning still remains.

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   bfc84bc1ba93833ad3fd1e370a33e511711611a6
commit: ae98886a907851615758c891a5e488f1add0c69d [5/5] iommu: Add a helper to do PASID lookup from domain
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250516/202505161418.LmdAAu8B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250516/202505161418.LmdAAu8B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505161418.LmdAAu8B-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/x86/kernel/pci-dma.c:4:
>> include/linux/iommu.h:1152:17: warning: 'iommu_get_pasid_from_domain' defined but not used [-Wunused-function]
    1152 | static ioasid_t iommu_get_pasid_from_domain(struct device *dev,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/iommu_get_pasid_from_domain +1152 include/linux/iommu.h

  1147	
  1148	static inline void iommu_detach_device_pasid(struct iommu_domain *domain,
  1149						     struct device *dev, ioasid_t pasid)
  1150	{
  1151	}
> 1152	static ioasid_t iommu_get_pasid_from_domain(struct device *dev,
  1153						    struct iommu_domain *domain)
  1154	{
  1155		return INVALID_IOASID;
  1156	}
  1157	#endif /* CONFIG_IOMMU_API */
  1158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
