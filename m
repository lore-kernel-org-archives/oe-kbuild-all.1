Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B1B219A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 21:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749676056; cv=none; b=DRW788uaGlZDTZfmeZH3o9gVUv38EmUmvPiZkWlKukNSQ+PD1YFDWcRh6PLlBR6HhTurxWvbcX3F3rXmV+nWUYHLz+gkvXjD/83rpNS7aKOiDbqRR9vEgTRTrhCIgRXlqrk9AYHEzeHqk1QmrGYdV3RNZrgeKai9RYXqcy0MdK0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749676056; c=relaxed/simple;
	bh=AVqCr0qZ9zNTDO5s0waakqhRU9UrA1BTvwHWY0TZ4rE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G02X8YJ9qyCH1f4ihB4bxsD2BM34jKZpovhEwE9e5mwCxlp2JxBQY02m/n6eWIpSTmBsZuxMxEcXSrMPiWjn0SZpKjI0NgwkhmerUhWnjLfNAnSkkbjeNygEeNuK8bFNe7X5UL/Kki6ZxUtn6GYK83I3MP6Eamx+ITmebtJPPW0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S+Y+l9Jg; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S+Y+l9Jg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749676055; x=1781212055;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=AVqCr0qZ9zNTDO5s0waakqhRU9UrA1BTvwHWY0TZ4rE=;
  b=S+Y+l9JgdR06cL9IBqiIi61Dzz7+nKp8kvrOMBrN1PiMLVG+KuznoBb+
   ENR3PpSwiaE3ZIqgkmodAz06tK3VJM3KvWEr55NQEy0ZRAFRU1QVAiv+R
   A4VEUTBpN8Mr8W2EWzWviwsUl3/0TAEJgrqmOV1bU04ZuASD0y8VxdPYZ
   692Rv2Dr34lcVJa1a5+WFKKEWGEDprYVDCf+1mINBM4SJbPPEx63QpTDW
   aRNREse4q3P82sIX9+N/PJs6yk5y95+fnMOzaboxTYMjJdmSjMoxFAflk
   0G8c3J0dJhVbJyC0TgW/i6W83jVLXV9rf2INFNR+38qzXKWa/6eICknmU
   w==;
X-CSE-ConnectionGUID: HcC0lgo3S9eTmJeJP4vTsw==
X-CSE-MsgGUID: fTI+MVkzTJ2CYx9YLfzp3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11461"; a="62489004"
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="62489004"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 14:07:34 -0700
X-CSE-ConnectionGUID: YZI/2xN3TIOUpRekeud2JA==
X-CSE-MsgGUID: NVec7ELLT+uPP1CBdNaPzA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,229,1744095600"; 
   d="scan'208";a="147160541"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 11 Jun 2025 14:07:33 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPSfT-000Arq-1D;
	Wed, 11 Jun 2025 21:07:31 +0000
Date: Thu, 12 Jun 2025 05:07:30 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 1/7] iommu/vtd: Lift the __pa to
 domain_setup_first_level/intel_svm_set_dev_pasid()
Message-ID: <202506120432.5AfFGhMO-lkp@intel.com>
References: <1-v1-20c73f153f4c+1895-vtd_prep_jgg@nvidia.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1-v1-20c73f153f4c+1895-vtd_prep_jgg@nvidia.com>

Hi Jason,

kernel test robot noticed the following build errors:

[auto build test ERROR on 19272b37aa4f83ca52bdf9c16d5d81bdd1354494]

url:    https://github.com/intel-lab-lkp/linux/commits/Jason-Gunthorpe/iommu-vtd-Lift-the-__pa-to-domain_setup_first_level-intel_svm_set_dev_pasid/20250610-035945
base:   19272b37aa4f83ca52bdf9c16d5d81bdd1354494
patch link:    https://lore.kernel.org/r/1-v1-20c73f153f4c%2B1895-vtd_prep_jgg%40nvidia.com
patch subject: [PATCH 1/7] iommu/vtd: Lift the __pa to domain_setup_first_level/intel_svm_set_dev_pasid()
config: i386-randconfig-012-20250612 (https://download.01.org/0day-ci/archive/20250612/202506120432.5AfFGhMO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250612/202506120432.5AfFGhMO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506120432.5AfFGhMO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/iommu/intel/pasid.c:415:5: error: conflicting types for 'intel_pasid_replace_first_level'; have 'int(struct intel_iommu *, struct device *, u64,  u32,  u16,  u16,  int)' {aka 'int(struct intel_iommu *, struct device *, long long unsigned int,  unsigned int,  short unsigned int,  short unsigned int,  int)'}
     415 | int intel_pasid_replace_first_level(struct intel_iommu *iommu,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from drivers/iommu/intel/pasid.c:22:
   drivers/iommu/intel/pasid.h:304:5: note: previous declaration of 'intel_pasid_replace_first_level' with type 'int(struct intel_iommu *, struct device *, phys_addr_t,  u32,  u16,  u16,  int)' {aka 'int(struct intel_iommu *, struct device *, unsigned int,  unsigned int,  short unsigned int,  short unsigned int,  int)'}
     304 | int intel_pasid_replace_first_level(struct intel_iommu *iommu,
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +415 drivers/iommu/intel/pasid.c

437f35e1cd4c8d drivers/iommu/intel-pasid.c Lu Baolu        2018-12-10  414  
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08 @415  int intel_pasid_replace_first_level(struct intel_iommu *iommu,
8e8445810b0cdc drivers/iommu/intel/pasid.c Jason Gunthorpe 2025-06-09  416  				    struct device *dev, u64 fsptptr,
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  417  				    u32 pasid, u16 did, u16 old_did,
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  418  				    int flags)
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  419  {
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  420  	struct pasid_entry *pte, new_pte;
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  421  
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  422  	if (!ecap_flts(iommu->ecap)) {
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  423  		pr_err("No first level translation support on %s\n",
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  424  		       iommu->name);
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  425  		return -EINVAL;
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  426  	}
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  427  
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  428  	if ((flags & PASID_FLAG_FL5LP) && !cap_fl5lp_support(iommu->cap)) {
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  429  		pr_err("No 5-level paging support for first-level on %s\n",
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  430  		       iommu->name);
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  431  		return -EINVAL;
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  432  	}
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  433  
8e8445810b0cdc drivers/iommu/intel/pasid.c Jason Gunthorpe 2025-06-09  434  	pasid_pte_config_first_level(iommu, &new_pte, fsptptr, did, flags);
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  435  
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  436  	spin_lock(&iommu->lock);
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  437  	pte = intel_pasid_get_entry(dev, pasid);
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  438  	if (!pte) {
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  439  		spin_unlock(&iommu->lock);
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  440  		return -ENODEV;
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  441  	}
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  442  
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  443  	if (!pasid_pte_is_present(pte)) {
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  444  		spin_unlock(&iommu->lock);
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  445  		return -EINVAL;
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  446  	}
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  447  
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  448  	WARN_ON(old_did != pasid_get_domain_id(pte));
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  449  
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  450  	*pte = new_pte;
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  451  	spin_unlock(&iommu->lock);
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  452  
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  453  	intel_pasid_flush_present(iommu, dev, pasid, old_did, pte);
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  454  	intel_iommu_drain_pasid_prq(dev, pasid);
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  455  
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  456  	return 0;
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  457  }
7543ee63e8113a drivers/iommu/intel/pasid.c Yi Liu          2024-11-08  458  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
