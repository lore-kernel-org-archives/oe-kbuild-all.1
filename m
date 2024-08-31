Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CFD41D12E4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Aug 2024 11:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725103385; cv=none; b=m67JF5uGUkigKn2kMFEuxww6i6Tf3hVhNVKNqS+j5tMjkEUpqdfj7FvzAMpFnM4K4SYSwPC9iAd3IvbTgtZR7GIXKWVWN+e8h4d/bZkZAPGi3/bmmBeqRTitlQJelUcHJl10U9jVzoGEDzvlD5gSBMrbFxabYQ69Fth1By/HTlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725103385; c=relaxed/simple;
	bh=jZvozTMLnuufWrLb6qGRVrHKFTm9hCCICBnI6wQ28Es=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JeVY7D+Q6LmP1KHqLMlrs7JKDcNYOtEffM6A+HFESB6HvY4dErHAUioZOLeI/ZUypbWKoRjHLKr2ggjqycBUl4fzjL7+DAGwyXHum0+prc+s9rM5oetHn4FCvgJ9d0ZtSyKzQp3L3Iu4uBAaCMFNCT5CuCOPI/ySoCrDE48ZtWk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iAOfPeX7; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iAOfPeX7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725103383; x=1756639383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jZvozTMLnuufWrLb6qGRVrHKFTm9hCCICBnI6wQ28Es=;
  b=iAOfPeX7b8DpsY+C1KUW5dXfxuNpHoJa4QoiNHcaHGvU8esMVh6cgEa0
   E4H8NN7iBIppoIdr1y4NCSuJ0HtOB0ZwpQXz3i4XjHcLS6SvzRo/Id4jv
   C6jgt7/nG/2weoknz8kjH8u7qaZ4lztBgdIB15p/Vb8nj456r2ktyUyGZ
   G+7IXmjcTILxtaBIQbMnSiLyIYO+y2cyV+CVGA+ibOjYUtoS6OzNucKtC
   bxWtQb6DxXQcTVV59jfBESncP9LzeIJ0MOg6Fc6XDiAbbhTxdZXrHnjAF
   YC7DhSn1i89PwdqxIiRRcwESv2sT7SL59XWwzrYC03/85jGs+5ryy6wmn
   g==;
X-CSE-ConnectionGUID: DVfEo1SYSVyXxyLbv0DhVg==
X-CSE-MsgGUID: G8uZYZDvQduHvdrb6jcs1g==
X-IronPort-AV: E=McAfee;i="6700,10204,11180"; a="23553730"
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="23553730"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Aug 2024 04:23:02 -0700
X-CSE-ConnectionGUID: zanubpFkScC6yCnp5bNNkA==
X-CSE-MsgGUID: DeZjg8WiSUmAckysg51LEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,191,1719903600"; 
   d="scan'208";a="68281058"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 31 Aug 2024 04:23:01 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1skMC3-0002gL-1X;
	Sat, 31 Aug 2024 11:22:59 +0000
Date: Sat, 31 Aug 2024 19:22:28 +0800
From: kernel test robot <lkp@intel.com>
To: Yi Liu <yi.l.liu@intel.com>, Kevin Tian <kevin.tian@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [yiliu1765-iommufd:wip/iommufd_pasid-20240830-notest-yet 13/22]
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c:352:61: error: use of
 undeclared identifier 'old_domain'; did you mean 'smmu_domain'?
Message-ID: <202408311915.cjDPNSq7-lkp@intel.com>
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
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240831/202408311915.cjDPNSq7-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 46fe36a4295f05d5d3731762e31fc4e6e99863e9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240831/202408311915.cjDPNSq7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408311915.cjDPNSq7-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c:6:
   In file included from include/linux/mm.h:2228:
   include/linux/vmstat.h:503:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     503 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     504 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:510:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     510 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     511 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:517:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     517 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:523:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     523 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     524 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c:352:61: error: use of undeclared identifier 'old_domain'; did you mean 'smmu_domain'?
     352 |         ret = arm_smmu_set_pasid(master, smmu_domain, id, &target, old_domain);
         |                                                                    ^~~~~~~~~~
         |                                                                    smmu_domain
   drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c:338:26: note: 'smmu_domain' declared here
     338 |         struct arm_smmu_domain *smmu_domain = to_smmu_domain(domain);
         |                                 ^
   4 warnings and 1 error generated.


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
