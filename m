Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29B4710A03
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Nov 2023 22:57:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BlQCK6M6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700953072; x=1732489072;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QWM7jpzPbU1vjaAEfL3iZ9jvZmn9qokuwlDAfXyI1vE=;
  b=BlQCK6M6rRxkNZ21WnMSwAHOZarmvk0hMed4tuExRhOhWqQc4ihXSYlf
   Zp0aoJ4ds/CsMvTaPq96hra5kNB5I6WsQQ72/FOEDfzM+ZNaRdFVf+h1R
   iIZk4xfGHVaCedfPR76XOsFvJd6nbMS1q77Vdj6fKWOjfT+16CAso7PHy
   yJg2CMxI0Iddwn5ei32c7zT3yz9c82Kpw5rzGhlBEEfTX+Y8q2znyEw1B
   qWgg8YehHU3EbrrJpk36OZ9aqAffl1W/ryShG1E/Hvar8SZrDywg/Q3+7
   Kpj9QYon4Nag2USfrXsWoccdQJnCLK+SbEbXTgFUqjnEgu+GvhaXSGc1B
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10905"; a="391404144"
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="391404144"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Nov 2023 14:57:51 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,227,1695711600"; 
   d="scan'208";a="9439778"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 25 Nov 2023 14:57:50 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r71au-0004UW-0H;
	Sat, 25 Nov 2023 22:57:48 +0000
Date: Sun, 26 Nov 2023 06:57:13 +0800
From: kernel test robot <lkp@intel.com>
To: Baolu Lu <baolu.lu@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lubaolu-intel-iommu:vtd-static-identity-domain-v1 8/13]
 drivers/iommu/intel/iommu.c:4292 intel_iommu_probe_device() warn:
 inconsistent indenting
Message-ID: <202311260625.TNB6W3wf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/LuBaolu/intel-iommu.git vtd-static-identity-domain-v1
head:   c56a30c3f4bbe56eb4ee140b0e56c9b9cfcff683
commit: 8b15b71a540e093e3080b42bf71173f364abae85 [8/13] iommu/vt-d: Setup scalable mode context entry in probe path
config: x86_64-randconfig-161-20231123 (https://download.01.org/0day-ci/archive/20231126/202311260625.TNB6W3wf-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231126/202311260625.TNB6W3wf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311260625.TNB6W3wf-lkp@intel.com/

New smatch warnings:
drivers/iommu/intel/iommu.c:4292 intel_iommu_probe_device() warn: inconsistent indenting

Old smatch warnings:
drivers/iommu/intel/iommu.c:616 device_lookup_iommu() error: we previously assumed 'pdev' could be null (see line 589)
drivers/iommu/intel/iommu.h:993 clear_context_copied() warn: clear_bit() takes a bit number
drivers/iommu/intel/iommu.h:987 set_context_copied() warn: set_bit() takes a bit number
drivers/iommu/intel/iommu.c:3109 intel_iommu_add() warn: missing unwind goto?

vim +4292 drivers/iommu/intel/iommu.c

  4206	
  4207	static struct iommu_device *intel_iommu_probe_device(struct device *dev)
  4208	{
  4209		struct pci_dev *pdev = dev_is_pci(dev) ? to_pci_dev(dev) : NULL;
  4210		struct device_domain_info *info;
  4211		struct intel_iommu *iommu;
  4212		u8 bus, devfn;
  4213		int ret;
  4214	
  4215		iommu = device_lookup_iommu(dev, &bus, &devfn);
  4216		if (!iommu || !iommu->iommu.ops)
  4217			return ERR_PTR(-ENODEV);
  4218	
  4219		info = kzalloc(sizeof(*info), GFP_KERNEL);
  4220		if (!info)
  4221			return ERR_PTR(-ENOMEM);
  4222	
  4223		if (dev_is_real_dma_subdevice(dev)) {
  4224			info->bus = pdev->bus->number;
  4225			info->devfn = pdev->devfn;
  4226			info->segment = pci_domain_nr(pdev->bus);
  4227		} else {
  4228			info->bus = bus;
  4229			info->devfn = devfn;
  4230			info->segment = iommu->segment;
  4231		}
  4232	
  4233		info->dev = dev;
  4234		info->iommu = iommu;
  4235		if (dev_is_pci(dev)) {
  4236			if (ecap_dev_iotlb_support(iommu->ecap) &&
  4237			    pci_ats_supported(pdev) &&
  4238			    dmar_ats_supported(pdev, iommu)) {
  4239				info->ats_supported = 1;
  4240				info->dtlb_extra_inval = dev_needs_extra_dtlb_flush(pdev);
  4241	
  4242				/*
  4243				 * For IOMMU that supports device IOTLB throttling
  4244				 * (DIT), we assign PFSID to the invalidation desc
  4245				 * of a VF such that IOMMU HW can gauge queue depth
  4246				 * at PF level. If DIT is not set, PFSID will be
  4247				 * treated as reserved, which should be set to 0.
  4248				 */
  4249				if (ecap_dit(iommu->ecap))
  4250					info->pfsid = pci_dev_id(pci_physfn(pdev));
  4251				info->ats_qdep = pci_ats_queue_depth(pdev);
  4252			}
  4253			if (sm_supported(iommu)) {
  4254				if (pasid_supported(iommu)) {
  4255					int features = pci_pasid_features(pdev);
  4256	
  4257					if (features >= 0)
  4258						info->pasid_supported = features | 1;
  4259				}
  4260	
  4261				if (info->ats_supported && ecap_prs(iommu->ecap) &&
  4262				    pci_pri_supported(pdev))
  4263					info->pri_supported = 1;
  4264			}
  4265		}
  4266	
  4267		dev_iommu_priv_set(dev, info);
  4268	
  4269		if (sm_supported(iommu) && !dev_is_real_dma_subdevice(dev)) {
  4270			ret = intel_pasid_alloc_table(dev);
  4271			if (ret) {
  4272				dev_err(dev, "PASID table allocation failed\n");
  4273				goto err_clear_priv;
  4274			}
  4275	
  4276			ret = intel_pasid_setup_sm_context(dev, false);
  4277			if (ret) {
  4278				dev_err(dev, "Scalable context entry setup failed\n");
  4279				goto err_free_table;
  4280			}
  4281		}
  4282	
  4283		intel_iommu_debugfs_create_dev(info);
  4284	
  4285		return &iommu->iommu;
  4286	err_free_table:
  4287		intel_pasid_free_table(dev);
  4288	err_clear_priv:
  4289		dev_iommu_priv_set(dev, NULL);
  4290		kfree(info);
  4291	
> 4292	return ERR_PTR(ret);
  4293	}
  4294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
