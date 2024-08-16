Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7228755893
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 21:01:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723842079; cv=none; b=IsLBEiHLmTsOKB5qEJlztRqbSqxEK49eF5iN1jzdOe2k0uLw1M2SrcmlaJjV459QqnPA07U5o1ne5g/6JudsPvf8xNOwHP7nSiKSZbHPgqDD4uCIYLr4DzKOGmnMAhYWukfYZd4gTWW/B2/49uaEDD7tYF1mz1Skh45vG+2p6Hc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723842079; c=relaxed/simple;
	bh=6sm8WFCC7gRCzQVAMWvxL1pqGqapZPRKnh3Ar2jeCAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ChsvdiLqAacsBn3l00pOmu1Nrv5RGsBjGLgEcpMD8K949G/1LuujgCKgJN+iMfgpMtAvzA01PAES23rMZ3FqeohhQfu24RMLlRBGpn8tqgQSi/0ye67XBJoOvsB4tXdFJj+l9C8KGFJL7m+UyZKNIZRBOa9P5iybyDAB4MS+hpk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XCeNaDiO; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XCeNaDiO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723842077; x=1755378077;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6sm8WFCC7gRCzQVAMWvxL1pqGqapZPRKnh3Ar2jeCAM=;
  b=XCeNaDiOqCxS7xNN6DV1c9v/F6VWqEBsfN35GyBhRfRJbGs5jk0c2iq2
   QK6nmd70O42bt6TS23LKYwpXIb2yQeak+o3mOoW7FVrokPDryeHk1gN2T
   c5akzEKmWkDutg79Pn6TjOHmjoO/KMkA6Bk+rHDwyWbzgomskcH518yFW
   FDWTRkKvBS58CopTjR+HEfU1zLlfTNJNOI7D85F2WAIAffOD+UMzC3cxO
   CR5nJZP0qt/epLK4bvah80cI5dlrlKILQm4b9V7qD/9950y02y5GaRGL9
   LPwvcC744iYPVhy8pxBLVIHCjzkeGyH8R9KekF7UG2ZIBI9Z6fungao3H
   Q==;
X-CSE-ConnectionGUID: pkmLGD9gTeaScQvVdHeKRA==
X-CSE-MsgGUID: SMWtcyiqQPK+/gmmr+Hjmw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="33562005"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="33562005"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 14:01:17 -0700
X-CSE-ConnectionGUID: zDNi91QhRyCN7wfTKSWyMQ==
X-CSE-MsgGUID: qrWFqmDmQ7CgIwzkvoRiEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="64614382"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 16 Aug 2024 14:01:15 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sf44O-0006vK-35;
	Fri, 16 Aug 2024 21:01:12 +0000
Date: Sat, 17 Aug 2024 05:00:35 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Joerg Roedel <jroedel@suse.de>, Kevin Tian <kevin.tian@intel.com>,
	Lu Baolu <baolu.lu@linux.intel.com>
Subject: [linux-next:master 3822/5190]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3301:17: error: implicit
 declaration of function 'pci_prepare_ats'; did you mean 'pci_enable_ats'?
Message-ID: <202408170408.2bq7qYA8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   367b5c3d53e57d51a5878816804652963da90950
commit: 2665d975db35f124d47e9584d448a3fb4d54f225 [3822/5190] iommu: Allow ATS to work on VFs when the PF uses IDENTITY
config: arm64-randconfig-004-20240817 (https://download.01.org/0day-ci/archive/20240817/202408170408.2bq7qYA8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240817/202408170408.2bq7qYA8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408170408.2bq7qYA8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c: In function 'arm_smmu_probe_device':
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c:3301:17: error: implicit declaration of function 'pci_prepare_ats'; did you mean 'pci_enable_ats'? [-Wimplicit-function-declaration]
    3301 |                 pci_prepare_ats(to_pci_dev(dev), stu);
         |                 ^~~~~~~~~~~~~~~
         |                 pci_enable_ats


vim +3301 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c

  3249	
  3250	static struct iommu_device *arm_smmu_probe_device(struct device *dev)
  3251	{
  3252		int ret;
  3253		struct arm_smmu_device *smmu;
  3254		struct arm_smmu_master *master;
  3255		struct iommu_fwspec *fwspec = dev_iommu_fwspec_get(dev);
  3256	
  3257		if (WARN_ON_ONCE(dev_iommu_priv_get(dev)))
  3258			return ERR_PTR(-EBUSY);
  3259	
  3260		smmu = arm_smmu_get_by_fwnode(fwspec->iommu_fwnode);
  3261		if (!smmu)
  3262			return ERR_PTR(-ENODEV);
  3263	
  3264		master = kzalloc(sizeof(*master), GFP_KERNEL);
  3265		if (!master)
  3266			return ERR_PTR(-ENOMEM);
  3267	
  3268		master->dev = dev;
  3269		master->smmu = smmu;
  3270		dev_iommu_priv_set(dev, master);
  3271	
  3272		ret = arm_smmu_insert_master(smmu, master);
  3273		if (ret)
  3274			goto err_free_master;
  3275	
  3276		device_property_read_u32(dev, "pasid-num-bits", &master->ssid_bits);
  3277		master->ssid_bits = min(smmu->ssid_bits, master->ssid_bits);
  3278	
  3279		/*
  3280		 * Note that PASID must be enabled before, and disabled after ATS:
  3281		 * PCI Express Base 4.0r1.0 - 10.5.1.3 ATS Control Register
  3282		 *
  3283		 *   Behavior is undefined if this bit is Set and the value of the PASID
  3284		 *   Enable, Execute Requested Enable, or Privileged Mode Requested bits
  3285		 *   are changed.
  3286		 */
  3287		arm_smmu_enable_pasid(master);
  3288	
  3289		if (!(smmu->features & ARM_SMMU_FEAT_2_LVL_CDTAB))
  3290			master->ssid_bits = min_t(u8, master->ssid_bits,
  3291						  CTXDESC_LINEAR_CDMAX);
  3292	
  3293		if ((smmu->features & ARM_SMMU_FEAT_STALLS &&
  3294		     device_property_read_bool(dev, "dma-can-stall")) ||
  3295		    smmu->features & ARM_SMMU_FEAT_STALL_FORCE)
  3296			master->stall_enabled = true;
  3297	
  3298		if (dev_is_pci(dev)) {
  3299			unsigned int stu = __ffs(smmu->pgsize_bitmap);
  3300	
> 3301			pci_prepare_ats(to_pci_dev(dev), stu);
  3302		}
  3303	
  3304		return &smmu->iommu;
  3305	
  3306	err_free_master:
  3307		kfree(master);
  3308		return ERR_PTR(ret);
  3309	}
  3310	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
