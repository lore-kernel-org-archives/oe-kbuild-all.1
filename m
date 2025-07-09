Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD1DB1F55F8
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Jul 2025 11:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752060443; cv=none; b=by+IfFW8ADCNnzBxDqFtYlzWWB+uPpy+eQZbdXiGv9cF9APyYfZZXHbxEeQWBjOMiddkpmEQ0KYa06cu2hm3B//o4YGYQYO8VJF5Tu01SM2JghRgVvWq0RipdhFV8LCyrVJpRk7kX0YAXD1AMdC7aPhgAyGPREAvJO+ZVk8TRME=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752060443; c=relaxed/simple;
	bh=DyhD8lbMpN/hri3OdvfFl3gu63rlwRjNkV3t6tMgP7I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qOi/EEQzri94KSN1nzZZlGGi6qRCrrO1qSLwXfJRuKp6IY/A3vSWyQzAJu3u0EkbKSUK+7gqX6dhkdtENds+WaKbrMQyeeyDRlzz4YBEG72c7CIGMN4QC5eIvipNr3MS5gnbeDkAefTEa6qXkQPCM1Xf7HggtzNh/+IF4Xu6Aok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NxFRSDGW; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NxFRSDGW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752060442; x=1783596442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=DyhD8lbMpN/hri3OdvfFl3gu63rlwRjNkV3t6tMgP7I=;
  b=NxFRSDGWK9cdnVG1k3rA9BBUu549T+g9ryrTToR0hVSwomq9R4dOOEnd
   ylt/QL1rypQbamiLXLXZOiVUK+6gVcQQRz1ajiwd5crZzkdpM+Zzn5LfN
   ojEmGEt7fW86SJ+XQpS86umKMIKqRX1IkSU/WzQujsxO+QpKP6yzW68w0
   NWigxDKczdKFbGkf4//tbwgI08yl5eDhOvVOq5h44jF2fx/zoIiH5NddH
   BcseXYmA0frv+I7kiUn8YPp7FV8f/Eh6hwNATLVV2cIwm7McAr9pzlNRD
   99QagRPWtgoxj8ck+Y6N6yKTwz6Z5m6Meattear7CeDm5uVFj6X5nMoyQ
   Q==;
X-CSE-ConnectionGUID: dT1suWHqSQSDaihh9FmzDw==
X-CSE-MsgGUID: 4h/pxwuGTDWdlILYHU7UYg==
X-IronPort-AV: E=McAfee;i="6800,10657,11487"; a="54174741"
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="54174741"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jul 2025 04:27:21 -0700
X-CSE-ConnectionGUID: 2HJwWpWeRA2DZcec7BlxGg==
X-CSE-MsgGUID: qjkdiXHmQou5bpY4VyPQjg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,298,1744095600"; 
   d="scan'208";a="155881381"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Jul 2025 04:27:20 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uZSxJ-0003Sq-2g;
	Wed, 09 Jul 2025 11:27:17 +0000
Date: Wed, 9 Jul 2025 19:26:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangxiangkai <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2464/2464] arch/arm64/kvm/virtcca_cvm.c:1193:5:
 sparse: sparse: symbol 'cvm_arm_smmu_domain_set_kvm' was not declared.
 Should it be static?
Message-ID: <202507091947.60BNSiXp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   4467208a8b5583a77c842c4eb7673166deb5b717
commit: ad540a13eb8292fc92651b3bf281088a502a85f9 [2464/2464] virtcca feature: fix msi iova map
config: arm64-randconfig-r111-20250705 (https://download.01.org/0day-ci/archive/20250709/202507091947.60BNSiXp-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project 61529d9e36fa86782a2458e6bdeedf7f376ef4b5)
reproduce: (https://download.01.org/0day-ci/archive/20250709/202507091947.60BNSiXp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507091947.60BNSiXp-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   arch/arm64/kvm/virtcca_cvm.c:963:5: sparse: sparse: symbol 'kvm_cvm_create_dev_ttt_levels' was not declared. Should it be static?
>> arch/arm64/kvm/virtcca_cvm.c:1193:5: sparse: sparse: symbol 'cvm_arm_smmu_domain_set_kvm' was not declared. Should it be static?
--
>> drivers/coda/coda_vfio.c:323:5: sparse: sparse: symbol 'virtcca_set_dev_msi_addr' was not declared. Should it be static?

vim +/cvm_arm_smmu_domain_set_kvm +1193 arch/arm64/kvm/virtcca_cvm.c

  1184	
  1185	/**
  1186	 * cvm_arm_smmu_domain_set_kvm - Associate SMMU domain with CVM
  1187	 * @dev: The Device under the iommu group
  1188	 *
  1189	 * Returns:
  1190	 * %0 if smmu_domain has been associate cvm or associate cvm successfully
  1191	 * %-ENXIO if the iommu group does not have smmu domain
  1192	 */
> 1193	int cvm_arm_smmu_domain_set_kvm(struct device *dev, void *data)
  1194	{
  1195		struct kvm *kvm;
  1196		struct iommu_domain *domain;
  1197		struct arm_smmu_domain *arm_smmu_domain = NULL;
  1198	
  1199		domain = iommu_get_domain_for_dev(dev);
  1200		if (!domain)
  1201			return -ENXIO;
  1202	
  1203		arm_smmu_domain = to_smmu_domain(domain);
  1204		if (arm_smmu_domain->kvm)
  1205			return 1;
  1206	
  1207		kvm = virtcca_arm_smmu_get_kvm(arm_smmu_domain);
  1208		if (kvm && kvm_is_virtcca_cvm(kvm))
  1209			arm_smmu_domain->kvm = kvm;
  1210	
  1211		return 1;
  1212	}
  1213	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
