Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42D0B173
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 01:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718416598; cv=none; b=TvzUasCoGy/Zs44r0R/Vw0pkSAb/2bI9hs4TAmkbNnEVelIXc8K9OojvFAcQe3IGiPTfxoC21Xl7Zb20TvR7u2SQXe5RpLqgQ4e7xJPm21LdxKYP68tPShZ7VBw9fk24beV8etw3M2Bb0LmIL/wz0cUbHyopmzSxn89PId9Fs0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718416598; c=relaxed/simple;
	bh=2rpf6ggvVyMtoW3grh0Ew1uWiRp2z3vW7x+Vy7BZd+4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hTqyLeoTi42l1Dk/rSf7CBeYuntcx3YvZYTT0+3x2S1aq3aiHJVFzensNZnH6uKLwH1MezuWTCuV2jm+W4iNj22wMoqpxUR+I+9bnAoh5J8Z4mO0uR7IGeleV3sy/QwZdvcrLYeD+uzvrDNGJbtxwb9cDZ96LnnSPWThTMbYQtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WlnS6LT7; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WlnS6LT7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718416597; x=1749952597;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2rpf6ggvVyMtoW3grh0Ew1uWiRp2z3vW7x+Vy7BZd+4=;
  b=WlnS6LT7t7gQzYzOnFSFXy2g5/tdnsx76avh2XlXQsSi5PBjerx3X6yG
   EAa4oXd8sByKzdN7mOTahnCuR48eQcjY8d8D7gWQ1JtrXlSOTKHPMcUx/
   SwwNfH3K4iApPSah72eJN/XT6GW+CWqoB7qN64iMgvZXqezBwOA4KzECv
   szOmkEpk5o5ZhZpy4PqA3lY+vNLoB0LI6kc418BMV9PKEQ98F/8EBOWPl
   tXlQgOJ+/Kb+vinI6S5+rvY+nW5E0p4zwpjArzaEeLH9rUcpJ3Z8zSk7T
   V0LKdGpZBt92cjmWrckHCPHUHFtJk1zclLz6Roc1whPOulWAZqGveQjPK
   g==;
X-CSE-ConnectionGUID: A9m/QUGhS/y824fzxZMcrQ==
X-CSE-MsgGUID: DygdM3YfRby6fRw3mu6d3A==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15459700"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="15459700"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 18:56:35 -0700
X-CSE-ConnectionGUID: /+Fqi8RgTFKciJH8EL8pYQ==
X-CSE-MsgGUID: UiJ1cG3xRy+FJfxusJlPyw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="40821242"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jun 2024 18:56:33 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIIec-0001zh-1D;
	Sat, 15 Jun 2024 01:56:30 +0000
Date: Sat, 15 Jun 2024 09:55:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18534/22937]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202406150959.idZDT1QZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   745a3c567e1c329d131a8896642475f3916d020a
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [18534/22937] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-103-20240609 (https://download.01.org/0day-ci/archive/20240615/202406150959.idZDT1QZ-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150959.idZDT1QZ-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing functions is not needed.

vim +614 drivers/acpi/cppc_acpi.c

   576	
   577	int acpi_get_psd_map(struct cppc_cpudata **all_cpu_data)
   578	{
   579		struct cpc_desc **cpc_pptr, *cpc_ptr;
   580		int parsed_core_num = 0;
   581		int i, ret;
   582	
   583		cpc_pptr = kcalloc(num_possible_cpus(), sizeof(void *), GFP_KERNEL);
   584		if (!cpc_pptr)
   585			return -ENOMEM;
   586		for_each_possible_cpu(i) {
   587			cpc_pptr[i] = kzalloc(sizeof(struct cpc_desc), GFP_KERNEL);
   588			if (!cpc_pptr[i]) {
   589				ret = -ENOMEM;
   590				goto out;
   591			}
   592		}
   593	
   594		/*
   595		 * We can not use acpi_get_devices() to walk the processor devices
   596		 * because some processor device is not present.
   597		 */
   598		ret = acpi_walk_namespace(ACPI_TYPE_DEVICE, ACPI_ROOT_OBJECT,
   599					  ACPI_UINT32_MAX, acpi_parse_cpc, NULL,
   600					  cpc_pptr, (void **)&parsed_core_num);
   601		if (ret)
   602			goto out;
   603		if (parsed_core_num != num_possible_cpus()) {
   604			ret = -EINVAL;
   605			goto out;
   606		}
   607	
   608		ret = __acpi_get_psd_map(all_cpu_data, cpc_pptr);
   609	
   610	out:
   611		for_each_possible_cpu(i) {
   612			cpc_ptr = cpc_pptr[i];
   613			if (cpc_ptr)
 > 614				kfree(cpc_ptr);
   615		}
   616		kfree(cpc_pptr);
   617	
   618		return ret;
   619	}
   620	EXPORT_SYMBOL_GPL(acpi_get_psd_map);
   621	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
