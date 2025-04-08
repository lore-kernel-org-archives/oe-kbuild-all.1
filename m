Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C78B879E1
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 03:56:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744084583; cv=none; b=d/SKYc0id/86L6f4R9CehNoOq3lW5j3uZf8Bq7vrRNrEbwws+v8adTlsfbh5Hb74XZGi7QjwsZIleweb+/Q0v2T3S72GcCmQcvcNxcLwXX8E+lLRX9+VkegFxc9UrXNL5b5P9L02siN2rGbKvLCJQwU3f7CNAfI04JCiaxPvgcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744084583; c=relaxed/simple;
	bh=aQM33vEob1dFCVMLIXWg9gs9Cspm4s34WeStS0zlxY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DbYnNVQGluC3GtimapNXdxZnhBI4oZZspAH92YXqoIgrcHB7NvlpOA/cjPwPcGIYgOvFy4rbPZ4IWSepI2DVlFa2ehki5vj65pxqAILiBMJPPcFCJxYWec3g/BjmvOBW/PlQ8U9ZMXifb0MFd/M4smVxIgfKS0aqHr2tfb7lkBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F7+p50s1; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F7+p50s1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744084581; x=1775620581;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aQM33vEob1dFCVMLIXWg9gs9Cspm4s34WeStS0zlxY4=;
  b=F7+p50s1h4Fi6P7Yy26CkOjTebrikzHtj/Zxi3NyUGDEkYxcEM+LD8T8
   /A8V8xQFkqP81IPf1Yxf7uwHz2Xbc9EROOsVS1VoofylbpXcFcXSx3foh
   QmP7HGDc4VrhYAgGxE8Qb25Jnm9seUOz+WwukNFpxCffenjVfvBFSYTto
   boBCS9A2qXM+ecnKLt6LFZXLBem1LtqpsFPACt8ggkRWoaTFV0tFWyZI+
   A5jw700lS3flAFDqIGAodx3uywdDU1SbxascUUATWobvUTrAYXgC6tWnN
   1PNzACk5x32C959cz0vgl0ccGF5j1pKfu1TehxL8VMit39YKDWFn3dpYL
   w==;
X-CSE-ConnectionGUID: xuIryND7TcO0drVGwHmQ4g==
X-CSE-MsgGUID: EksczHeiTLK4qvwe7AyISg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="45213479"
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="45213479"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 20:56:20 -0700
X-CSE-ConnectionGUID: 6T1rFbSASsCGY0imNJYA3g==
X-CSE-MsgGUID: sGqfX0m/T7GV7sXDAUj83g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,197,1739865600"; 
   d="scan'208";a="129002328"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 20:56:19 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u204P-000465-1H;
	Tue, 08 Apr 2025 03:56:17 +0000
Date: Tue, 8 Apr 2025 11:55:56 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] include/linux/iommu.h:1152:17:
 warning: 'iommu_get_pasid_from_domain' defined but not used
Message-ID: <202504081147.uqnSlBhQ-lkp@intel.com>
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
head:   c55bd07f747cd457f58e5781279fa11a5fc0add1
commit: ae98886a907851615758c891a5e488f1add0c69d [9/9] iommu: Add a helper to do PASID lookup from domain
config: x86_64-allnoconfig (https://download.01.org/0day-ci/archive/20250408/202504081147.uqnSlBhQ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250408/202504081147.uqnSlBhQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081147.uqnSlBhQ-lkp@intel.com/

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
