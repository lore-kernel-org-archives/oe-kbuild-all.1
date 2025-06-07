Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A9FEC4
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jun 2025 11:12:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749294765; cv=none; b=MyaThWSHS2mWZUR0JAkQ8nJ0KM7nzVpotn8pfJ23RHPPk6r8bu6IlD0PHRj1WSkL5kVE2lIrbprLCuEWcvp77ew7P+7Y1gnqgaQD02Wt4BSBFx/6xgyFK4tfrcxVCLz40Cr/1PLfeAihXDc7lU5xYv0f7kzpf9W02dBzj3t/kPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749294765; c=relaxed/simple;
	bh=5wCDQ0FUm8E25F0c0AJSw/Z/eSIWYjPbx9pyXoFkqUo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UcoxJCRFeVEw/gt5IekLcNcAivIRZtTQVza1xqolXZohxia/3kpLyOQmfEYqL3yoC2fHlADfBYDrt7SCoX/sMcLEUC6UWHF2fXTVYnnDPTipfiGBDWTX/F19y0mr+FxiXOv8Zun6HqayeeEZVhEzxqkr1tFtrDae6FShTgcrWQw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=diBDmXKL; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="diBDmXKL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749294764; x=1780830764;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5wCDQ0FUm8E25F0c0AJSw/Z/eSIWYjPbx9pyXoFkqUo=;
  b=diBDmXKL4cRE7QExLGl68zZCV1D7wrT0tOvGurTB9uSItOFQB5ZpkDOe
   WnkNSTkE6zQMOsDzykSqWketJyTEdrKxPz2yRi9S0f+SL0Hw1ab6RtzSl
   4Bavayf/uJovH8TnBg0OJHmK+Nwhv2BS6RYdswObVIOdZ/B1iMoRMDQRs
   vKwbOCgBw+Eb6pmtizmgmdQJXQosZXhZvMOpqITz+3wrDd0o8BDGuJ67/
   InNlQpZIur5DMi+eohoRLGWJ3Wpn8FJswhnN4rQxlsPDpGgPLWFbaxuOj
   IiDGfFvx+unDLtHz4xBBZ/56YsN1q7AaYJfCuDfegEYjOiuBl3gkUhnfP
   w==;
X-CSE-ConnectionGUID: hrx3YXBhRJmrsrG60XGwpg==
X-CSE-MsgGUID: qQlW+yHWTXyg7StBsCX5mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11456"; a="55096174"
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="55096174"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 04:12:43 -0700
X-CSE-ConnectionGUID: OeM+xzAmROq8xEVPKLiboA==
X-CSE-MsgGUID: 4VcRVCugSrahCU2iBUEbOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="145983428"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Jun 2025 04:12:41 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNrTb-0005kf-1a;
	Sat, 07 Jun 2025 11:12:39 +0000
Date: Sat, 7 Jun 2025 19:12:05 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202506071951.jzYnVjgu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   31245821cb3d54a27ff007515f57af84d6842846
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [1365/1365] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250607/202506071951.jzYnVjgu-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506071951.jzYnVjgu-lkp@intel.com/

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
