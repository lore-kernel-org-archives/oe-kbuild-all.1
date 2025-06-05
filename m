Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2071442C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  5 Jun 2025 03:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749094691; cv=none; b=NF/+UldCmmlB7Aoe331DoUWIF1T44wOcb1IegVph902i1Etr9N0ZQIAiWzOFDixyejPxrDxoAc7YB/JNX9L4nrI/fTzbzc9MneKZ5mICHifjlS6CEhfdfkYJelXdhEPweRlMNA45JDb54SFk0I1oTUMbAncTnF6IPiWtwLemaJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749094691; c=relaxed/simple;
	bh=5OQQQdihYel3FCRXmzzAOawk0HVVsvug9Vf+Qct6Zg4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FQanesVHX9nyB98fyuuAsffZwlpWc6cB33KLJaWDStGtSVltLAD/OEHqLvLirLTDOo9g62vialEv8tXOAXyWRBDbNoA4P5AHbSk1re9Rz4oUDd6xwWmxBdmfDOkOF7I4KbnLDhPBi5MbnsGVWeM4/ojx/eD+0+3YGFE8B1Udc4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DPQPIdJT; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DPQPIdJT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749094689; x=1780630689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5OQQQdihYel3FCRXmzzAOawk0HVVsvug9Vf+Qct6Zg4=;
  b=DPQPIdJT+wRju+TcSYoN5Yt+HKBlyHqqiNefkwDmtc3bDtb4eL1HpOSX
   N3o4sATHwxCRrbHp/3g9voCZltx06TUQRVMZ0POuGgEjSdAKgP6KUV3FC
   gOf0wv4EcEzWHjFP4q0TIoEPz/XZ9bD3HPrNJgcUCkiSW9CO4q+rJSqUv
   +xO1TrzXpYrrp+aZT9YmuwLOnNPnXxNEqQrgJloD9m0Yl7JDCcEd4m6uc
   eVgkLsik8EsN8u1m2j2Qm9uIYN6aLvXVGhfOfRc1E7yd1Omsgx7i3CX1l
   Z9ewmgQkgCo4Pv1IPduH44d/G9eM9G+Cv5CpAAKAYDDFu61eYjBE9CkrV
   Q==;
X-CSE-ConnectionGUID: 7/hzxCFIQUeYqP1Aj+1o9w==
X-CSE-MsgGUID: 5A4KUh6xQJmJ9PEaAfH33g==
X-IronPort-AV: E=McAfee;i="6800,10657,11454"; a="38828980"
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="38828980"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2025 20:38:09 -0700
X-CSE-ConnectionGUID: rEJfdPQYTEGOeSP9kj/jNw==
X-CSE-MsgGUID: PxGm3obTQF6SKNRkRvHalA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,211,1744095600"; 
   d="scan'208";a="150653909"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 04 Jun 2025 20:38:07 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uN1Qb-0003gz-0x;
	Thu, 05 Jun 2025 03:38:05 +0000
Date: Thu, 5 Jun 2025 11:38:02 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202506051103.QJTAn6J7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   f86f8706481a23ecd781d2d13c3815a7fb4cc312
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [1365/1365] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250605/202506051103.QJTAn6J7-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506051103.QJTAn6J7-lkp@intel.com/

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
