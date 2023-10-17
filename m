Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 449BBEBE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Oct 2023 13:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F51g/Gsm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697549658; x=1729085658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3CSdkLqUk6bduEHO84T+5uI6Mwhnf2tkcu4zsuU9npE=;
  b=F51g/Gsm0VcwNQjrUJ6Gq+PUOUvnkogqQWS1UjvAEVEg6EADbCByKazN
   vknOcveveDDnyUEOqdqIA8KMBYXrudDHhZ/VoJM3JoGnH2N6xrhoz/iS5
   SjoS+MI5VcVQ2ueN5gh1PjNWqRDHZMCf+HfdChFXx9Lp36oP/sH3RoS/S
   t+iBeTrDcoVPkqxP5ZbXb1abc+uAqSLGb7qgNLos8L7SZmjVfMgaMtFm6
   CSMy5+rKw9mqHJ61vFpucRFd+PSQgXKdxaQPfDJ4HXzCWuX3PrMl3s/lS
   gwFzophd6Xz/nsjGlA8Xz8tw39X70tSnQKtt37ucMgpMKHKCUVki8sZAw
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="385616850"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="385616850"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Oct 2023 06:34:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="759809615"
X-IronPort-AV: E=Sophos;i="6.03,232,1694761200"; 
   d="scan'208";a="759809615"
Received: from lkp-server02.sh.intel.com (HELO f64821696465) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 17 Oct 2023 06:34:16 -0700
Received: from kbuild by f64821696465 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qskD5-0009dx-2I;
	Tue, 17 Oct 2023 13:34:12 +0000
Date: Tue, 17 Oct 2023 21:33:36 +0800
From: kernel test robot <lkp@intel.com>
To: Tina Zhang <tina.zhang@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tinazhangzw:per-iommu_IOTLB_invalidation 16/19]
 drivers/iommu/intel/iommu.c:4725:25: error: implicit declaration of function
 'mmu_notifier_unregister'; did you mean 'mmu_notifier_release'?
Message-ID: <202310172125.ho1tRnOs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/TinaZhangZW/linux.git per-iommu_IOTLB_invalidation
head:   637bb19835d04ae4c16c46d0af4284eaa47d5b8d
commit: 889a1ae471abb1b1475ed17b3b009133d32fc6de [16/19] iommu/vt-d: Refactor intel_iommu_remove_dev_pasid()
config: i386-randconfig-005-20231017 (https://download.01.org/0day-ci/archive/20231017/202310172125.ho1tRnOs-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231017/202310172125.ho1tRnOs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310172125.ho1tRnOs-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/intel/iommu.c: In function 'intel_iommu_remove_dev_pasid':
>> drivers/iommu/intel/iommu.c:4725:25: error: implicit declaration of function 'mmu_notifier_unregister'; did you mean 'mmu_notifier_release'? [-Werror=implicit-function-declaration]
    4725 |                         mmu_notifier_unregister(&domain->notifier, domain->mm);
         |                         ^~~~~~~~~~~~~~~~~~~~~~~
         |                         mmu_notifier_release
   cc1: some warnings being treated as errors


vim +4725 drivers/iommu/intel/iommu.c

  4696	
  4697	static void intel_iommu_remove_dev_pasid(struct device *dev, ioasid_t pasid)
  4698	{
  4699		struct intel_iommu *iommu = device_to_iommu(dev, NULL, NULL);
  4700		struct dev_pasid_info *curr, *dev_pasid = NULL;
  4701		struct dmar_domain *dmar_domain;
  4702		struct iommu_domain *domain;
  4703		unsigned long flags;
  4704	
  4705		domain = iommu_get_domain_for_dev_pasid(dev, pasid, 0);
  4706		if (WARN_ON_ONCE(IS_ERR_OR_NULL(domain)))
  4707			goto out_tear_down;
  4708	
  4709		dmar_domain = to_dmar_domain(domain);
  4710		spin_lock_irqsave(&dmar_domain->lock, flags);
  4711		list_for_each_entry(curr, &dmar_domain->dev_pasids, link_domain) {
  4712			if (curr->dev == dev && curr->pasid == pasid) {
  4713				list_del_rcu(&curr->link_domain);
  4714				dev_pasid = curr;
  4715				break;
  4716			}
  4717		}
  4718		WARN_ON_ONCE(!dev_pasid);
  4719		spin_unlock_irqrestore(&dmar_domain->lock, flags);
  4720	
  4721		domain_detach_iommu(dmar_domain, iommu);
  4722		kfree_rcu(dev_pasid, rcu);
  4723		if (list_empty(&to_dmar_domain(domain)->dev_pasids)) {
  4724			if (domain->notifier.ops)
> 4725				mmu_notifier_unregister(&domain->notifier, domain->mm);
  4726		}
  4727	out_tear_down:
  4728		intel_pasid_tear_down_entry(iommu, dev, pasid, false);
  4729		intel_drain_pasid_prq(dev, pasid);
  4730	}
  4731	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
