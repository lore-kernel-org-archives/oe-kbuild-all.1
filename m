Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44BD7381C8
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 10:09:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719482998; cv=none; b=csaHi/CKGv1CbHLT0t5rh7ASaSU0oYnS2aEwezuigfebaaXo7KHeeF5feaPUiT7oOdJMEo87TU90hcwTzGJoOe6POpWhUpf/rryZ0NJZMM2wrkbGia9LYylTrsRKE2HP6i30bzd40FbIoy8TLDLOp50HSex2sVHOOeIaHCWJXxI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719482998; c=relaxed/simple;
	bh=VDylPKojmN/ntI4vyMC3zYuqNJIOxE+j5hmcJCT9xyQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CRv5XR3HhpU9s8tP2G2fhchqzjp/QE+tHx7HSYJZyv8SUryHNRXH6arXC6FFGJPtsPwsegkWpjSpv6Ut03r2oGb9lrzQq6nx2hyUhj1T6ZYomrT3YoldoJdSjDLPcJIpN9Em5MMkHsTRJYute7fNAG2l2Qk7RABrMRZZpkTiGac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ig86mJD0; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ig86mJD0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719482996; x=1751018996;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VDylPKojmN/ntI4vyMC3zYuqNJIOxE+j5hmcJCT9xyQ=;
  b=ig86mJD0J47FBaGt6h5ckZ2emmvjeeKY/ZEz4u22mTfMCZK8i+/VHWDk
   S/JPr2YXcOXQjOw7iXg6KSMF4YcpuXu90nAkxayYAoDz88gSd0yusIRzN
   yDmiAHXqfFbAemeqd1pBnbSPAw+7yslBWADFUKW4Upyc3Cb/aE8KXRUOj
   hedovl9D0tdKl+T3uBueNvXvgl1cvJGf0oEloZxlHPshQH5iwNhObUS3W
   n+Sh1k55pXj+4dqReTUYD5cUSxTBVBjminXNNigr6y8ukHqpQMW7Sr0xK
   izB2GPrjnQ1YOgkpP89uNNi4D/hBlVRs1N/7ijNqj89b7kPHKgs35v4H3
   g==;
X-CSE-ConnectionGUID: mPhGheRQQveKglNXFbn1pw==
X-CSE-MsgGUID: wprS0BvITVSW2hvwxwKOSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="19486338"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="19486338"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jun 2024 03:09:55 -0700
X-CSE-ConnectionGUID: l6k6v6rKSJ2hqpLTy/pl6A==
X-CSE-MsgGUID: FcshIPD0SBK6fbmvNsON4Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="45077603"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 27 Jun 2024 03:09:54 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMm4e-000G7E-1I;
	Thu, 27 Jun 2024 10:09:52 +0000
Date: Thu, 27 Jun 2024 18:09:46 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240626 1/31]
 drivers/iommu/intel/iommu.c:4367:35: error: initialization of 'int
 (*)(struct iommu_domain *, struct device *, ioasid_t,  struct iommu_domain
 *)' {aka 'int (*)(struct iommu_domain *, struct device *, unsigned int,
  struct iommu_domain *)'} from incompatib...
Message-ID: <202406271753.ZTAeSMts-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20240626
head:   fd569f167302f1d7a03199dae77450a22884fb93
commit: ad4c2a1ad5ea4662bb7b1a8b2839ca4eca59a05f [1/31] iommu: Pass old domain to set_dev_pasid op
config: x86_64-defconfig (https://download.01.org/0day-ci/archive/20240627/202406271753.ZTAeSMts-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271753.ZTAeSMts-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271753.ZTAeSMts-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/intel/iommu.c:4367:35: error: initialization of 'int (*)(struct iommu_domain *, struct device *, ioasid_t,  struct iommu_domain *)' {aka 'int (*)(struct iommu_domain *, struct device *, unsigned int,  struct iommu_domain *)'} from incompatible pointer type 'int (*)(struct iommu_domain *, struct device *, ioasid_t)' {aka 'int (*)(struct iommu_domain *, struct device *, unsigned int)'} [-Werror=incompatible-pointer-types]
    4367 |                 .set_dev_pasid  = identity_domain_set_dev_pasid,
         |                                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/intel/iommu.c:4367:35: note: (near initialization for '(anonymous).set_dev_pasid')
   cc1: some warnings being treated as errors


vim +4367 drivers/iommu/intel/iommu.c

46d417fe907d5c5 Lu Baolu 2024-06-01  4362  
46d417fe907d5c5 Lu Baolu 2024-06-01  4363  static struct iommu_domain identity_domain = {
46d417fe907d5c5 Lu Baolu 2024-06-01  4364  	.type = IOMMU_DOMAIN_IDENTITY,
46d417fe907d5c5 Lu Baolu 2024-06-01  4365  	.ops = &(const struct iommu_domain_ops) {
46d417fe907d5c5 Lu Baolu 2024-06-01  4366  		.attach_dev	= identity_domain_attach_dev,
46d417fe907d5c5 Lu Baolu 2024-06-01 @4367  		.set_dev_pasid	= identity_domain_set_dev_pasid,
46d417fe907d5c5 Lu Baolu 2024-06-01  4368  	},
46d417fe907d5c5 Lu Baolu 2024-06-01  4369  };
46d417fe907d5c5 Lu Baolu 2024-06-01  4370  

:::::: The code at line 4367 was first introduced by commit
:::::: 46d417fe907d5c5ca3dae996fb2fc5b87870aba5 iommu/vt-d: Add support for static identity domain

:::::: TO: Lu Baolu <baolu.lu@linux.intel.com>
:::::: CC: Lu Baolu <baolu.lu@linux.intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
