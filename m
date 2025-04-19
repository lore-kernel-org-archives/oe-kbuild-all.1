Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E3217E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Apr 2025 14:14:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745072078; cv=none; b=ldGlhrMCx0qKG4hQWJEezpme3uKdNmC6+2lFSECDq7LAN+ROX2AvLq3jhiKR96CNTZtM4/NGMzeTWwhTPc8vZtNxUwPh/hceWvjFxzEKUniPNl9C4ga9OAPiSANlOetdxRlCIELK6X/RHejTKuhROvyCKh2Zh8Nv1IWtkiWLfeE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745072078; c=relaxed/simple;
	bh=OTgQHzgzri6BBEM9QLk54XqhXtDVRgv34cJ7gLCIh6A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uLSdreXTQRRwFxwrppNBZlIMCOVVUyie0icFAIe5XQR5Fxp38BcoHyYxUHK8zOYhWHr181rIyO5Oehvygvy4azNymyNTEtcG2oDBrhzLlnFJS7mTSR6LpDYc34cCP/wS1YVOt7o10DEUsyiPIefBil44M3oZvhX7Nr29+4YuZvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Wt8dVrkW; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Wt8dVrkW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745072076; x=1776608076;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=OTgQHzgzri6BBEM9QLk54XqhXtDVRgv34cJ7gLCIh6A=;
  b=Wt8dVrkW4AuxSmMGQyiVpT/rP7hIifbOSTsFCuaBusxErUmxACzknIAr
   Y19R5Y4sZW0bwl9Ra0ZwetOPp2TljsQlO55veyiHOj25s3EkJTP5KryQN
   d0+hZyD7WlE0KDHF4twL93pqDzN7eqDDHwNVTnpp4z5/mewbRimp1xHkR
   GmibdjrplX/rb/8072NCnI0HGGOWKHGK46U1OLvhILFUDUqMwm/qBJDrH
   4BQwtEA4aqiIS2rmFdl4N2V0NKwYv+cSJLH9aEGhxKD036VRMJZmBwdfg
   h2nCMqqkwn/TxF5JllOSpSRVpL9WWItXnYyG/1kEwyTEI9ho4xkLWiK7v
   A==;
X-CSE-ConnectionGUID: wGOSI8+mT7WtxcWtMoNEHA==
X-CSE-MsgGUID: 6SjTQXauTTaQ+ECW1nHj8Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11408"; a="46595249"
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="46595249"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Apr 2025 07:14:36 -0700
X-CSE-ConnectionGUID: TU7jdkHbQ/yMS2nvVcKzRw==
X-CSE-MsgGUID: w6TFhkQ8SRugI4WqjK74LQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,224,1739865600"; 
   d="scan'208";a="162385215"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Apr 2025 07:14:35 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u68xk-0003uX-21;
	Sat, 19 Apr 2025 14:14:32 +0000
Date: Sat, 19 Apr 2025 22:13:50 +0800
From: kernel test robot <lkp@intel.com>
To: Pranjal Shrivastava <praan@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v2 10/10] iommu/arm-smmu-v3: Invoke pm_runtime before
 hw access
Message-ID: <202504192248.FUDmPe37-lkp@intel.com>
References: <20250418233409.3926715-11-praan@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250418233409.3926715-11-praan@google.com>

Hi Pranjal,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on arm-perf/for-next/perf]
[also build test WARNING on linus/master v6.15-rc2 next-20250417]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pranjal-Shrivastava/iommu-arm-smmu-v3-Refactor-arm_smmu_setup_irqs/20250419-073729
base:   https://git.kernel.org/pub/scm/linux/kernel/git/will/linux.git for-next/perf
patch link:    https://lore.kernel.org/r/20250418233409.3926715-11-praan%40google.com
patch subject: [RFC PATCH v2 10/10] iommu/arm-smmu-v3: Invoke pm_runtime before hw access
config: arm64-randconfig-001-20250419 (https://download.01.org/0day-ci/archive/20250419/202504192248.FUDmPe37-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250419/202504192248.FUDmPe37-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504192248.FUDmPe37-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c: In function 'arm_smmu_attach_dev_nested':
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c:150:26: warning: unused variable 'smmu' [-Wunused-variable]
     struct arm_smmu_device *smmu = master->smmu;
                             ^~~~


vim +/smmu +150 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-iommufd.c

   138	
   139	static int arm_smmu_attach_dev_nested(struct iommu_domain *domain,
   140					      struct device *dev)
   141	{
   142		struct arm_smmu_nested_domain *nested_domain =
   143			to_smmu_nested_domain(domain);
   144		struct arm_smmu_master *master = dev_iommu_priv_get(dev);
   145		struct arm_smmu_attach_state state = {
   146			.master = master,
   147			.old_domain = iommu_get_domain_for_dev(dev),
   148			.ssid = IOMMU_NO_PASID,
   149		};
 > 150		struct arm_smmu_device *smmu = master->smmu;
   151		struct arm_smmu_ste ste;
   152		int ret;
   153	
   154		if (nested_domain->vsmmu->smmu != master->smmu)
   155			return -EINVAL;
   156		if (arm_smmu_ssids_in_use(&master->cd_table))
   157			return -EBUSY;
   158	
   159		mutex_lock(&arm_smmu_asid_lock);
   160		/*
   161		 * The VM has to control the actual ATS state at the PCI device because
   162		 * we forward the invalidations directly from the VM. If the VM doesn't
   163		 * think ATS is on it will not generate ATC flushes and the ATC will
   164		 * become incoherent. Since we can't access the actual virtual PCI ATS
   165		 * config bit here base this off the EATS value in the STE. If the EATS
   166		 * is set then the VM must generate ATC flushes.
   167		 */
   168		state.disable_ats = !nested_domain->enable_ats;
   169		ret = arm_smmu_attach_prepare(&state, domain);
   170		if (ret) {
   171			mutex_unlock(&arm_smmu_asid_lock);
   172			return ret;
   173		}
   174	
   175		arm_smmu_make_nested_domain_ste(&ste, master, nested_domain,
   176						state.ats_enabled);
   177		arm_smmu_install_ste_for_dev(master, &ste);
   178		arm_smmu_attach_commit(&state);
   179		mutex_unlock(&arm_smmu_asid_lock);
   180		return 0;
   181	}
   182	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
