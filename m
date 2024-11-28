Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6943D1428E7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 10:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732790245; cv=none; b=Yf0LfkDqDFoQopIdG8zT1vrhmi8pB7Kl2d030XPWu4UXNHzZdua+UgCVQxpk/5MkZPGfN5C1ZXcYcWpl7onKVQmRvNcUAo9bCYp6glNH/jkHmzbqhpO9zzl3HwfxursHDV0/GzczvNXPU0fDChGIoOwZcuVWP4Q+afrUewYcs0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732790245; c=relaxed/simple;
	bh=m4wuTP/RE+PnOf3YG2fI+oQrOjoUgwUSF07Z9bnnA1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lNUQQngJlv3egZ+7uEEnCOjr3GCI6B/GZZQAE/Jas3Y9Ft6sdQKYQipAr77kYzBKFiSd0tQKY8mallcXbqOJffOAoNxCqPVQqh4NCVEQRf7mwL0vpYIPzSWFjpRwfFoYx6Mw7T7mCm9ZP4vKdW80gWPOifAns7Di63vcj9Y2OMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S4ec7Oeb; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S4ec7Oeb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732790243; x=1764326243;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=m4wuTP/RE+PnOf3YG2fI+oQrOjoUgwUSF07Z9bnnA1Q=;
  b=S4ec7OebRtuD5YAiA6jAgPZi2JMsWdThNQly8Bm9s72wxWT+ytSHYljP
   GqiFKxbDMO2+o9HmiOgAcLnc9DaJ5SMPPIS4/VzgMgSzy+9TulCvDIPUh
   5BBk6BP1xgmIKNiNc6BiVoEoLG3hv8dWawTpnmD94KGCcIJfkbmY8AB6J
   90dJdcKK6BfRPUKquxCAYwxAtDCc7JiBABl7PRvsLKCjnWmUrmfwfSsBj
   yrzDU2xI/9BfoEcd4xxeilerZgTZmDmawuRPVO4j4Ud3wZWRNui/+BTVN
   YdHy4BHdjLl400f0+vYptYmzxBzLm6W470dMIdjtxBgAdhS8aZHwIywA0
   w==;
X-CSE-ConnectionGUID: e9jRG/SbTDyeOTvoEypz0Q==
X-CSE-MsgGUID: THUpHCtfTPOuh00o8aWDoQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11269"; a="35880066"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="35880066"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 02:37:23 -0800
X-CSE-ConnectionGUID: Um83C8/RRSSAhInFVWz+xQ==
X-CSE-MsgGUID: kKsSMPOGSwC95v0zq9y3CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="129699190"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 28 Nov 2024 02:37:22 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGbtf-0009TR-1R;
	Thu, 28 Nov 2024 10:37:19 +0000
Date: Thu, 28 Nov 2024 18:36:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangxiangkai <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1540/1540]
 arch/arm64/kvm/../../../virt/kvm/vfio.c:535:6: warning: no previous
 prototype for 'find_arm_smmu_domain'
Message-ID: <202411281809.d4MBGHxN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   321262d8251f07d9439cae39851f2bf2658d8813
commit: c57a5a1f767336eff9721cb833c067657ade31de [1540/1540] virtcca feature: activate confidential vm to set security device s_s2ttbr
config: arm64-randconfig-002-20241128 (https://download.01.org/0day-ci/archive/20241128/202411281809.d4MBGHxN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411281809.d4MBGHxN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411281809.d4MBGHxN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/../../../virt/kvm/vfio.c:535:6: warning: no previous prototype for 'find_arm_smmu_domain' [-Wmissing-prototypes]
     535 | void find_arm_smmu_domain(struct kvm_vfio_file *kvf, struct list_head *smmu_domain_group_list)
         |      ^~~~~~~~~~~~~~~~~~~~


vim +/find_arm_smmu_domain +535 arch/arm64/kvm/../../../virt/kvm/vfio.c

   529	
   530	/**
   531	 * find_arm_smmu_domain - Find smmu domain list from kvm vfio file
   532	 * @kvf: Kvm vfio file
   533	 * @smmu_domain_group_list: List of smmu domain group
   534	 */
 > 535	void find_arm_smmu_domain(struct kvm_vfio_file *kvf, struct list_head *smmu_domain_group_list)
   536	{
   537		struct iommu_group *iommu_group;
   538		int ret = 0;
   539		struct arm_smmu_domain *arm_smmu_domain = NULL;
   540		struct arm_smmu_domain *arm_smmu_domain_node = NULL;
   541	
   542		iommu_group = cvm_vfio_file_iommu_group(kvf->file);
   543		arm_smmu_domain = to_smmu_domain(virtcca_iommu_group_get_domain(iommu_group));
   544		list_for_each_entry(arm_smmu_domain_node,
   545			smmu_domain_group_list, node) {
   546			if (arm_smmu_domain_node == arm_smmu_domain) {
   547				ret = -1;
   548				break;
   549			}
   550		}
   551		if (!ret)
   552			list_add_tail(&arm_smmu_domain->node, smmu_domain_group_list);
   553	}
   554	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
