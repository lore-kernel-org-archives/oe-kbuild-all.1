Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A774207D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 16:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725122656; cv=none; b=tfhtCpz3aHWXe7q4aLg/9YIB2qLEp8GMqQ2p9jxY2g9C+d5Hx+w+hEmChetI0H6qNmo3HRhJSC8ejkPHtLHpAQnLhjRGYkex5AQZQ7uQUHMH1WeDMZQi3Uq3LUGdpM8pF3oE76uWhb6mXpjIs+SKibu6Wk8M3XP/Hupkg7kM+aA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725122656; c=relaxed/simple;
	bh=b0MHH9Bh6EAzuYIOZhcxeIURr38vLtzh9B5PlPySLNU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YtZRj6HbjZlUFbAu9U/zSwI6wfnbi0G2NFxsIEYMUW9sUqiARje+5b7PSemUuVKEPznwI7B1z8zLRiQBI3t3yan0dQlH2V5GkuPBpPA7+4Ke8+cBoa4k/OJpOj0gvx5W3J/MhdB01GmSaQNWL+RtVFci4Cm+SbBZ6eEbO/sJ7TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUcNBMt0; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUcNBMt0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725122656; x=1756658656;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b0MHH9Bh6EAzuYIOZhcxeIURr38vLtzh9B5PlPySLNU=;
  b=iUcNBMt09iB98q92ailnOo7su7cqLeB1E669qQ12oh75h/BoY9kplNne
   zcriBKb+Fx1ZwH9QoVazvRwM5kcErznGbss5OjDiIJdWp4ux/EoN+RWxi
   xNaBfG6r3Noud5jvqjHxWq6kLhBlCfpjozj8DPneJepvxNgA9fldMEkdG
   8eBQjuSLuzwftuwpIX9IC1MKZyokmYbJMQ7LIDWXBcjnOf3f0mYtgxMMt
   j2d5mVii8oaenEr9BCBVVrUMVc0LnNQCDgWAUZVKQIY6XTGPEmfJllX92
   WlmIW7EWFOZWt8vWthK0vB/lrzr87KHZGw8fnm5rUPPlKxTOijyYRnLPJ
   g==;
X-CSE-ConnectionGUID: sKy+Y+JgRSaNmdhplsPq9w==
X-CSE-MsgGUID: 0w3cESAaR2mfg38/GFWLXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11181"; a="34320450"
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="34320450"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 09:44:15 -0700
X-CSE-ConnectionGUID: F4kjQze5S2+cRUIs4wynHg==
X-CSE-MsgGUID: /cJf/+PpS8iqnDzbMjjsFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,192,1719903600"; 
   d="scan'208";a="94991985"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Aug 2024 09:44:13 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skRCs-0002wI-2h;
	Sat, 31 Aug 2024 16:44:10 +0000
Date: Sun, 1 Sep 2024 00:43:22 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240830-notest-yet 13/22]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c:352:68: error: 'old_domain'
 undeclared; did you mean 'irq_domain'?
Message-ID: <202409010015.S5N2S4DJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/yiliu1765/iommufd.git wip/iommufd_pasid-20240830-notest-yet
head:   aa93c979a57a5a050175b1d62886d9eb31dc0a6c
commit: 55d373e31eb94036a5cba39a417594a8ceba6b43 [13/22] iommu/arm-smmu-v3: Make smmuv3 set_dev_pasid() op support replace
config: arm64-randconfig-r112-20240831 (https://download.01.org/0day-ci/archive/20240901/202409010015.S5N2S4DJ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240901/202409010015.S5N2S4DJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409010015.S5N2S4DJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c: In function 'arm_smmu_sva_set_dev_pasid':
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c:352:68: error: 'old_domain' undeclared (first use in this function); did you mean 'irq_domain'?
     352 |         ret = arm_smmu_set_pasid(master, smmu_domain, id, &target, old_domain);
         |                                                                    ^~~~~~~~~~
         |                                                                    irq_domain
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c:352:68: note: each undeclared identifier is reported only once for each function it appears in


vim +352 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c

   333	
   334	static int arm_smmu_sva_set_dev_pasid(struct iommu_domain *domain,
   335					      struct device *dev, ioasid_t id,
   336					      struct iommu_domain *old)
   337	{
   338		struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
   339		struct arm_smmu_master *master = dev_iommu_priv_get(dev);
   340		struct arm_smmu_cd target;
   341		int ret;
   342	
   343		/* Prevent arm_smmu_mm_release from being called while we are attaching */
   344		if (!mmget_not_zero(domain->mm))
   345			return -EINVAL;
   346	
   347		/*
   348		 * This does not need the arm_smmu_asid_lock because SVA domains never
   349		 * get reassigned
   350		 */
   351		arm_smmu_make_sva_cd(&target, master, domain->mm, smmu_domain->cd.asid);
 > 352		ret = arm_smmu_set_pasid(master, smmu_domain, id, &target, old_domain);
   353	
   354		mmput(domain->mm);
   355		return ret;
   356	}
   357	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
