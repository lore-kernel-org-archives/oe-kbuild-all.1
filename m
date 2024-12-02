Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A20271F9F6A
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Dec 2024 10:48:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733136501; cv=none; b=owoWCjcYX+LzFItFw2M64Pk4BxVv9lPqdgRfv/dkpryZwR40g+jknHVFW/37Im+/aj+o1X7OXbsRTAsu6E7gHObmeT4JVr0o5aK9V0EivAZwD7fSTsbZVRHviW8l9KWDyw/VQYRHyQ5R0Ntf2rdiybTWQNVicWScuJtbzq5hiH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733136501; c=relaxed/simple;
	bh=FQbi2eJhlqN5oLBJM3F3WtwBVh7MEkW94nmePpPCvDE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KOtWsv04nT9FjI17MlXhjW8CygqqMy+0M0ivp0oAG1r4wvC/pbiCPY92D9JKdm4+oXUxCeu7dXIFrQVFwYV6y3oSMfzy5EFgTJrTSwnPJ0SgoT2i657a0rvTnvyUmcuvM+dkLT9gsRwsM8DcKn/sTyq7mKzB4cJGqBNZ8HdtkCI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FaQr4JAj; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FaQr4JAj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733136500; x=1764672500;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FQbi2eJhlqN5oLBJM3F3WtwBVh7MEkW94nmePpPCvDE=;
  b=FaQr4JAj6NScq8KLBUf3sVBtgLzYx1MlZTF6quk2QoJZHtbaTcjjsg4w
   4u5XyIVbfMcxCH3AugrmcYaA+ftYCuuHGVCFfodoLTtM8uJWIoZZHS9J+
   RgLJ/kMm5hqIYEsXHl5FzySffXBZsFI+N8yokHO12aCNrzNI6TYNwNFJ2
   nTYEjWb66p79YvoQ3F1/jimy2caR9QXwCuoxemCMfwgYdMXY684g6Iy+I
   Up6zGuwwR0hq1eBEt6T+oLRuBr8lwLb67x9M8ez6OsP9XNmzQln47a7cY
   bf550GUpnCy/lK02LEYTH9nBdd1o7CJzDlIIqJwvYLYeC21nqD+hyAE00
   g==;
X-CSE-ConnectionGUID: WBjyS1LSQOqtS+AwLquyVQ==
X-CSE-MsgGUID: KzeD+v5ATrKeZMlWdHlf3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11273"; a="33427342"
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="33427342"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Dec 2024 02:48:18 -0800
X-CSE-ConnectionGUID: rJ5q5PohRtqkQLI5sSexOw==
X-CSE-MsgGUID: Pfi7yDosRySmPAyvSJTlpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,202,1728975600"; 
   d="scan'208";a="123921100"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 02 Dec 2024 02:48:17 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tI3yQ-0002LJ-0q;
	Mon, 02 Dec 2024 10:48:14 +0000
Date: Mon, 2 Dec 2024 18:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, chenhuiying <chenhuiying4@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2439/2439]
 drivers/iommu/arm/arm-smmu-v3/ascend_smmu.c:71:20: warning: no previous
 prototype for 'agent_smmu_unlocked_find'
Message-ID: <202412021825.ykqFT7Io-lkp@intel.com>
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
head:   a1fd264a5653d0f3d66669ec3b88a99b929f8717
commit: 3bf501c87ffe1f045f86af89e8958fed62c02c94 [2439/2439] ascend agent smmu: an implementation of ARM SMMUv3 ATOS feature
config: arm64-randconfig-004-20241117 (https://download.01.org/0day-ci/archive/20241202/202412021825.ykqFT7Io-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241202/202412021825.ykqFT7Io-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412021825.ykqFT7Io-lkp@intel.com/

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
