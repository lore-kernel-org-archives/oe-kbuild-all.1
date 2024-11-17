Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDFB7E9
	for <oe-kbuild-all@lists.linux.dev>; Sun, 17 Nov 2024 03:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731813402; cv=none; b=uP7AkzgTeh70yzkNG8+oxgW6X5f3KeoYW9ddTvWeaxxGz+/3fraFS1e4HbufWNfeNuenh5ZOQBGALGst9Lu1nOhtZ7Zgxk+lisgc8qynahPqtQ7nV09JIC2jB/njsaADYwXp9xZ3udDWzGQntWPUYZ+uR7KCg1jPUbfuEiP5vcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731813402; c=relaxed/simple;
	bh=s6KY+irOLv30r7XJqlJYb3vqlZXYeaIv2eoprCKldVY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kiaMtOG0kJtmJ4vWZZD56HPVx4pCDufEy85qflj7P5wbKHpsrqZqIOTeAogop8/Dl7lmUMbV0ZuwmRHvwDbDmNn2f/flGfLAAwS0a4D3RUPeTJX3vVoO2nDTaNCrgzeaADN/4snJJGu0On9NeNRAvlUWUmwXrhyAnK9pBvL6LuY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b9dj3hxc; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b9dj3hxc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731813401; x=1763349401;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=s6KY+irOLv30r7XJqlJYb3vqlZXYeaIv2eoprCKldVY=;
  b=b9dj3hxc4rG1eUNxUUKzM+OR4Xh3E2ThMRnvBFWfHAHm+vShECU5CrpW
   qnatwZ0B+sdVIR3u2SroYiMO7Ck6ENb4VzusDwNXpi1m9ew2usXkxYnhz
   wkzJ85GVlnPDt6432luwDMT42pb78ZQ4zdtpNWFCJaTK4FUEEVy3F9at4
   +38zlHMaLB45ncdfIetVR16SNdNJdftEvCdmGDEkVmVV4BJvRu3WhaWml
   Eqw7x9x2kE7Z9/kR/g/NtOa5JIb+XRLXoX5EdarUq3jogsyV9JA1PivVa
   +sNY1G3L55Hkok3ol078j0puS0Y94zTn/XJ6DGYiXhtvWYDoHw2sgxk8s
   Q==;
X-CSE-ConnectionGUID: nJMzn9q3RPyvg7l1SXnlwA==
X-CSE-MsgGUID: fYG1ZymcS5eKXBkW2A/0sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11258"; a="31172236"
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="31172236"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2024 19:16:40 -0800
X-CSE-ConnectionGUID: 40bRHgyCTk+eDjNnQQ2+Fg==
X-CSE-MsgGUID: arrbjYwzS+C5WEHPYE/y/g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,161,1728975600"; 
   d="scan'208";a="88664598"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 16 Nov 2024 19:16:39 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tCVm9-0001In-0S;
	Sun, 17 Nov 2024 03:16:37 +0000
Date: Sun, 17 Nov 2024 11:15:39 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chenhuiying <chenhuiying4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2439/2439]
 drivers/iommu/arm/arm-smmu-v3/ascend_smmu.c:71:20: warning: no previous
 prototype for 'agent_smmu_unlocked_find'
Message-ID: <202411171149.AYnfA3ex-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Binfeng,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   4cbb736395eb31ff181c4488182276601992fa0b
commit: 3bf501c87ffe1f045f86af89e8958fed62c02c94 [2439/2439] ascend agent smmu: an implementation of ARM SMMUv3 ATOS feature
config: arm64-randconfig-004-20241117 (https://download.01.org/0day-ci/archive/20241117/202411171149.AYnfA3ex-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241117/202411171149.AYnfA3ex-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411171149.AYnfA3ex-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/iommu/arm/arm-smmu-v3/ascend_smmu.c:71:20: warning: no previous prototype for 'agent_smmu_unlocked_find' [-Wmissing-prototypes]
      71 | struct agent_smmu *agent_smmu_unlocked_find(u64 device_id)
         |                    ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm/arm-smmu-v3/ascend_smmu.c: In function 'agent_smmu_platform_probe':
   drivers/iommu/arm/arm-smmu-v3/ascend_smmu.c:145:18: error: implicit declaration of function 'acpi_evaluate_integer'; did you mean 'acpi_evaluate_object'? [-Werror=implicit-function-declaration]
     145 |         status = acpi_evaluate_integer(ACPI_HANDLE(&pdev->dev), METHOD_NAME__UID,
         |                  ^~~~~~~~~~~~~~~~~~~~~
         |                  acpi_evaluate_object
   drivers/iommu/arm/arm-smmu-v3/ascend_smmu.c: At top level:
>> drivers/iommu/arm/arm-smmu-v3/ascend_smmu.c:420:36: warning: 'agent_smmu_acpi_match' defined but not used [-Wunused-const-variable=]
     420 | static const struct acpi_device_id agent_smmu_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/agent_smmu_unlocked_find +71 drivers/iommu/arm/arm-smmu-v3/ascend_smmu.c

    70	
  > 71	struct agent_smmu *agent_smmu_unlocked_find(u64 device_id)
    72	{
    73		struct agent_smmu *temp = NULL;
    74	
    75		list_for_each_entry(temp, &agent_smmu_list, list) {
    76			if (temp->device_id == device_id) {
    77				return temp;
    78			}
    79		}
    80		return NULL;
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
