Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8D402AEEC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 29 Sep 2024 06:59:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727593158; cv=none; b=K6AmiRiZpZHO5C/zLcN216PaeVo6e8VsatcNnsWhj8qhSqdLQ/hHEeQb/LB1SxIgyvQplL54YdCRnR44c49FeT46j8C4TzM25LevdDEOt+jrPl4q/hkzuFofeMWUgw+eXkMeMdGGXvSq+AkSoC2PvQZLGk51pjGpAxZ59mGmxXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727593158; c=relaxed/simple;
	bh=dxROwJZ5Rx6gQVDdQX0XToYr4u2tvv30RpjpiiwU7Xw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=quomgspDxbifrrkWpCQF8kfQE31YwN2gkbT9mPOZ95CUkj3DiVjmWTEN6YOtA8bvLArBRd2BYZX/T5iOSLQBFmZm8YfBd4QYCbufSmk6cQJZo3SAJjB5Vw5wrNG9b2CBd9CWtrlTzWe07+X3WmDsZp5v8jtaphpVxErVgI1YAto=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WEWDUWVj; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WEWDUWVj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727593156; x=1759129156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dxROwJZ5Rx6gQVDdQX0XToYr4u2tvv30RpjpiiwU7Xw=;
  b=WEWDUWVjaCIJo+dt+Ne+SnoSysvGRmHQuG+3l3a8vdgEsNCv0NmGuNi6
   zdRygmnnJXfXL8qycgUzkxyvKKaHOf3MnbKgSNpdKynP83YRHbrKA6HcV
   4bNDKRSx5+5y4OA7KBg0KS4yPq/leXggxoNDV0js6XfoHf1OrQTvHt206
   wvLMoSY6ZlfhnoiEzl9aJLBYcT6BZtFw8TMnHSDZuAIvIq3zdh7Kc31S0
   N+cDEHblTVFSCyIbTUMWu7T+tv0WolSHXZ7qAKSzozZo9SHX+0KEKBWPs
   JnpcSuNJZAub3E9fmzKuGYTGioNOp1cOxy3K8JmsXPFHlJXSJAviW8lbT
   A==;
X-CSE-ConnectionGUID: ke4BGUuVRYaIYndnI6TWIw==
X-CSE-MsgGUID: uj4AgIemQeuiu0ao4JYImg==
X-IronPort-AV: E=McAfee;i="6700,10204,11209"; a="37368566"
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="37368566"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Sep 2024 23:59:16 -0700
X-CSE-ConnectionGUID: NNowLiUFT4aMnk9euDrBNw==
X-CSE-MsgGUID: KztIG2iMQ/yZBjTZJUgD0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,162,1725346800"; 
   d="scan'208";a="73281116"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 28 Sep 2024 23:59:15 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1suntg-000NzH-37;
	Sun, 29 Sep 2024 06:59:12 +0000
Date: Sun, 29 Sep 2024 14:58:33 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18534/23801]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202409291416.g51wPHKv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3a5093f2913b14c22e19e60b6bf7a4d8ec2e5c69
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [18534/23801] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-104-20240929 (https://download.01.org/0day-ci/archive/20240929/202409291416.g51wPHKv-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409291416.g51wPHKv-lkp@intel.com/

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
