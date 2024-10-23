Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C3EB1AB6D8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 15:55:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729698947; cv=none; b=MAac6rqI8FQNpSarw2KqNeBS7mQXyTEpC0crWvmPi5ZAP+l1Q5y5C7tM1v9zIxRwD7b7siso5l1mnhZBE4WRhGgwazQXx+1EIVTxgB+SlKLMP7xIvBDReK5rUDahO8R9nM+TB2Z8ipShyPhIBPBug2zUUGTQMrw2Oy1HUsTvkKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729698947; c=relaxed/simple;
	bh=yHQ5cBzoCfE8ZVAlCrf18HisHAZiV0sm609pEngye7k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=cgGj+JXKS0ahW4RPvMeoxPNMb5E6mXpNpMWPfp93qN3fx6E21VGjb6cQyZvHILHKkGnFdyUcgIRlZQatmJm2/LFzm9l6Lnt47e/Zq1xOiccmjJ0MoxrQ0u/dyoTcGu4TixFCGqIKZzawYujwzUEgTmUMFcp/lxXxC5VIpmFkTUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kgaXQ3Pu; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kgaXQ3Pu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729698945; x=1761234945;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yHQ5cBzoCfE8ZVAlCrf18HisHAZiV0sm609pEngye7k=;
  b=kgaXQ3Pu5Uec7rm8/1qudF5LkVlQb48vev7rjsxUQ9o0JWNfPM0fuCq4
   j6ibWheh5RousVA3gUnYtzqC6YlwdTUEsPwIM3kkv8C8v2eY1UH+7vf1w
   /i8Lsq7QraKXynbXNTYRUN6cftC3O3b8WRdOMLt2JuXiZMb8itNpaSmzg
   IXDO7dQ1GAl80JVDa0MFGxCg5IwwuU6VlXSgJ3g1A21K8CyuFiu8QLEIT
   jO/AEnot4QDWq6QpLm+aW93CRunNoGDFLezFHS8Tx4GsRjV6p0uBXLtVc
   6mfNnPF7SAiCG7EnibMCV7s/tf+zDjKiSl8BaqFO5clNHm61UYkCLGfI2
   A==;
X-CSE-ConnectionGUID: RrMv3RgIRfuHp3LSm5Drgw==
X-CSE-MsgGUID: 5e9UWEEdTCOL11bqvvIsBg==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="39875656"
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="39875656"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 08:55:45 -0700
X-CSE-ConnectionGUID: gId9POGkQXu7sdhxxnMGJQ==
X-CSE-MsgGUID: 9v2VibjGTsOgdvMB1HzVSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="79934494"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 23 Oct 2024 08:55:43 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3di0-000V6O-2o;
	Wed, 23 Oct 2024 15:55:40 +0000
Date: Wed, 23 Oct 2024 23:54:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, yangxiangkai <yangxiangkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 14671/15255]
 arch/x86/kvm/../../../virt/kvm/vfio.c:519: warning: Function parameter or
 member 'dev' not described in 'find_arm_smmu_domain'
Message-ID: <202410232346.tk5fQNpz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e7bc79687a034a22f94328123d5cf8c4d4436c35
commit: ad540a13eb8292fc92651b3bf281088a502a85f9 [14671/15255] virtcca feature: fix msi iova map
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20241023/202410232346.tk5fQNpz-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241023/202410232346.tk5fQNpz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410232346.tk5fQNpz-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kvm/../../../virt/kvm/vfio.c:416: warning: Function parameter or member 'kv' not described in 'cvm_vfio_add_kvm_to_smmu_domain'
   arch/x86/kvm/../../../virt/kvm/vfio.c:416: warning: Excess function parameter 'kvm' description in 'cvm_vfio_add_kvm_to_smmu_domain'
>> arch/x86/kvm/../../../virt/kvm/vfio.c:519: warning: Function parameter or member 'dev' not described in 'find_arm_smmu_domain'
>> arch/x86/kvm/../../../virt/kvm/vfio.c:519: warning: Function parameter or member 'data' not described in 'find_arm_smmu_domain'
>> arch/x86/kvm/../../../virt/kvm/vfio.c:519: warning: Excess function parameter 'kvf' description in 'find_arm_smmu_domain'
>> arch/x86/kvm/../../../virt/kvm/vfio.c:519: warning: Excess function parameter 'smmu_domain_group_list' description in 'find_arm_smmu_domain'


vim +519 arch/x86/kvm/../../../virt/kvm/vfio.c

c57a5a1f767336 yangxiangkai 2024-09-11  512  
c57a5a1f767336 yangxiangkai 2024-09-11  513  /**
c57a5a1f767336 yangxiangkai 2024-09-11  514   * find_arm_smmu_domain - Find smmu domain list from kvm vfio file
c57a5a1f767336 yangxiangkai 2024-09-11  515   * @kvf: Kvm vfio file
c57a5a1f767336 yangxiangkai 2024-09-11  516   * @smmu_domain_group_list: List of smmu domain group
c57a5a1f767336 yangxiangkai 2024-09-11  517   */
ad540a13eb8292 yangxiangkai 2024-09-20  518  int find_arm_smmu_domain(struct device *dev, void *data)
c57a5a1f767336 yangxiangkai 2024-09-11 @519  {
c57a5a1f767336 yangxiangkai 2024-09-11  520  	int ret = 0;
ad540a13eb8292 yangxiangkai 2024-09-20  521  	struct iommu_domain *domain = NULL;
c57a5a1f767336 yangxiangkai 2024-09-11  522  	struct arm_smmu_domain *arm_smmu_domain = NULL;
c57a5a1f767336 yangxiangkai 2024-09-11  523  	struct arm_smmu_domain *arm_smmu_domain_node = NULL;
ad540a13eb8292 yangxiangkai 2024-09-20  524  	struct list_head *smmu_domain_group_list = (struct list_head *)data;
c57a5a1f767336 yangxiangkai 2024-09-11  525  
ad540a13eb8292 yangxiangkai 2024-09-20  526  	domain = iommu_get_domain_for_dev(dev);
ad540a13eb8292 yangxiangkai 2024-09-20  527  	arm_smmu_domain = to_smmu_domain(domain);
c57a5a1f767336 yangxiangkai 2024-09-11  528  	list_for_each_entry(arm_smmu_domain_node,
c57a5a1f767336 yangxiangkai 2024-09-11  529  		smmu_domain_group_list, node) {
c57a5a1f767336 yangxiangkai 2024-09-11  530  		if (arm_smmu_domain_node == arm_smmu_domain) {
c57a5a1f767336 yangxiangkai 2024-09-11  531  			ret = -1;
c57a5a1f767336 yangxiangkai 2024-09-11  532  			break;
c57a5a1f767336 yangxiangkai 2024-09-11  533  		}
c57a5a1f767336 yangxiangkai 2024-09-11  534  	}
c57a5a1f767336 yangxiangkai 2024-09-11  535  	if (!ret)
c57a5a1f767336 yangxiangkai 2024-09-11  536  		list_add_tail(&arm_smmu_domain->node, smmu_domain_group_list);
ad540a13eb8292 yangxiangkai 2024-09-20  537  
ad540a13eb8292 yangxiangkai 2024-09-20  538  	return 1;
c57a5a1f767336 yangxiangkai 2024-09-11  539  }
c57a5a1f767336 yangxiangkai 2024-09-11  540  

:::::: The code at line 519 was first introduced by commit
:::::: c57a5a1f767336eff9721cb833c067657ade31de virtcca feature: activate confidential vm to set security device s_s2ttbr

:::::: TO: yangxiangkai <yangxiangkai@huawei.com>
:::::: CC: yangxiangkai <yangxiangkai@huawei.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
