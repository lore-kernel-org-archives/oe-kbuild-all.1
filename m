Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9F856C2E0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 11 Jul 2025 00:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752194600; cv=none; b=T7Azu0sLYwY/lhQTiYTj+d+2kMlnV9dTH3HycecXXyxANV47gLlQ3IXYH+QPEaYNP5zG46UYdVdZPGkTjQeBhjIvr/n/HRtkxqieJQ49qujBvnJYW8goiKNNgR60+6Cz4b7T/Fp0PW+UkXJ4tUe+A0NWLwZ8Q5rhvN/KVw7xbNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752194600; c=relaxed/simple;
	bh=W5v4eEW+Xt7QO0uMNHJI0X4ebEt0fgPDi3KaNZUfMzQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U3G+sUnEJQivWYc0vjDvpL0vt58hPup3Ik43iSfa/B3w36GFZwTP0UlAMefowaI3lBfqXqwhxVfnBB4EUh6V1Yzf+LHtWkjgVu46LPaWv9kPKmjANf4tvcunVQGLCJW2J0xuehKLNYvLuWkqLC4hNCIegaC4Hhnx+to9UBC25fk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RH3HFJ4M; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RH3HFJ4M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1752194598; x=1783730598;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=W5v4eEW+Xt7QO0uMNHJI0X4ebEt0fgPDi3KaNZUfMzQ=;
  b=RH3HFJ4MYdF7isAjGoxFbNYWHwjTwe8Nf+k5FApzPXefP2+an6RZqOKW
   o+7ELFgJpBDqpYrTzLvQIP+iBxxnlGjdd/LOjbTySdfu4b5pq7FORkFZk
   vX17tzMSt6S2WwLeDsAC8pu3toeAQQE8jIcfDYdgodlZtW16SzlVn+nxh
   tSsSPKZaeX6F7kzq3mpGbxs7GfPYqYn39BsAWHsum5CZhOQinHWZMwadj
   byhnRL5A7k5aEzYqWjQIrrSLF5xEy2wQpVj0zbIPiofQN2gu2Gr5uB1Ur
   8eMy0WIFZl/rWdUGllFG/KQ+7ZH3kRR9E/7V0MB1u8T/enbRFTggq4rMF
   Q==;
X-CSE-ConnectionGUID: jd35dI8kTQa4yM3/M+U11A==
X-CSE-MsgGUID: exUqKzyQSwqc9p7tduNRdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11490"; a="54620032"
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="54620032"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Jul 2025 17:43:18 -0700
X-CSE-ConnectionGUID: uN8fFdCbQAqSiBb1z/vKSg==
X-CSE-MsgGUID: cpC2aL/OSFunxSqq+LdVJg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,302,1744095600"; 
   d="scan'208";a="156793618"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 10 Jul 2025 17:43:17 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ua1r9-0005ex-0n;
	Fri, 11 Jul 2025 00:43:15 +0000
Date: Fri, 11 Jul 2025 08:42:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jgunthorpe:pcie_switch_groups 18/19] drivers/iommu/iommu.c:1745
 pci_check_group() warn: inconsistent indenting
Message-ID: <202507110831.GR5rXLF0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jgunthorpe/linux pcie_switch_groups
head:   dd09b165dc2dbc1b7e1e7032a7afb0632d03faf8
commit: 6525a08b4145275af5fd738c4bf62e63e5f2828b [18/19] debug prints 2
config: alpha-randconfig-r072-20250711 (https://download.01.org/0day-ci/archive/20250711/202507110831.GR5rXLF0-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507110831.GR5rXLF0-lkp@intel.com/

New smatch warnings:
drivers/iommu/iommu.c:1745 pci_check_group() warn: inconsistent indenting
drivers/pci/pci.c:3668 pci_acs_flags_enabled() warn: inconsistent indenting

Old smatch warnings:
drivers/iommu/iommu.c:1036 iommu_group_alloc() warn: Calling kobject_put|get with state->initialized unset from line: 1016
drivers/iommu/iommu.c:1042 iommu_group_alloc() warn: Calling kobject_put|get with state->initialized unset from line: 1016
drivers/iommu/iommu.c:1051 iommu_group_alloc() warn: Calling kobject_put|get with state->initialized unset from line: 1016

vim +1745 drivers/iommu/iommu.c

  1738	
  1739	static void pci_check_group(const struct check_group_aliases_data *data,
  1740				    u16 alias, struct pci_dev *pdev)
  1741	{
  1742		struct iommu_group *group;
  1743	
  1744		group = iommu_group_get(&pdev->dev);
> 1745	dev_info(&pdev->dev," Check group %u\n",group != NULL);
  1746		if (!group)
  1747			return;
  1748	
  1749		if (group != data->group)
  1750			dev_err(&data->pdev->dev,
  1751				"During group construction alias processing needed dev %s alias %x to have the same group but %u != %u\n",
  1752				pci_name(pdev), alias, data->group->id, group->id);
  1753		iommu_group_put(group);
  1754	}
  1755	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
