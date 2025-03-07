Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 127FC14293
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Mar 2025 17:10:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741367406; cv=none; b=m8aM/y+AU5+hQqqhwKYrrSVWRQzxDaNS6XeD3tYhTVIlxPmIxFc8eYcIWQkwTbFS7sVvCgTQxfeW0CQ9UG9oNYsuLKedptCMN3/ZDaaDvFIxrXEG/0VfyuxOhEMg9H4ZB32e363Uv/ed20mevfuwi+X9hFJeUHsM4Ny1ICYvSSw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741367406; c=relaxed/simple;
	bh=TT2AfG6ZHesJRo0wP63y43jtapS9QCcs1QKJ2hNy/Og=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=h6Fm3GT5joHbBZefHvUrJEyOhEMP51X8YVNLjEzGQOhtrawjeeEWskgcHW19aTtLudqYV/ZFnE7gF3BvzbFWjAPUQfCh3N7AcxeioY/ZBbl++tNMS0uy6QO5/oAxpRUe+CFV45VmdhP1cnOXrr4JN9IRy5vfxKrIEV+MLftMmrE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HNUcyshW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HNUcyshW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741367405; x=1772903405;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TT2AfG6ZHesJRo0wP63y43jtapS9QCcs1QKJ2hNy/Og=;
  b=HNUcyshWby8KrPvBK2QKgS+0jqwtw3MH+feSJ1weTvrhH4Le2VptLpwe
   YJD/v0gvA73VuxLhWL+ByxW/tfbgluYI2FI3eKAEZ/sY/PtDMtQrjpklr
   0Eimf2DaZRzbwpOESD+Ni0gLcfMhIjrcKC6GN+Lbhb9iv1Xjp9IpJLdBN
   W72I63pJ8eSEqoTIkz9MnosApk/AJm6Brvn7TgRXe1xCbfhliClm6PCkO
   hEHIFKeyCpzIwKV7+z+pncfE0VyuxSwZlAFQ3CMxQS7GK4N3pRj2+WAWk
   PCGc/r9JSH/63gTWA/soqvgOQoAlNssrE/dHlhT+XsiW4vbBM9eNuu92P
   Q==;
X-CSE-ConnectionGUID: CCfqwt1FSXm/3cQPeakehg==
X-CSE-MsgGUID: MgijO1EDQESCvy5Pr34o2g==
X-IronPort-AV: E=McAfee;i="6700,10204,11365"; a="52630753"
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="52630753"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Mar 2025 09:10:04 -0800
X-CSE-ConnectionGUID: k6FTHs5nSk6zSHbS1RAQEg==
X-CSE-MsgGUID: 7tD336iCT0in2W1Wcj7hTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,229,1736841600"; 
   d="scan'208";a="119200341"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 07 Mar 2025 09:10:02 -0800
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tqbCy-0000pP-0E;
	Fri, 07 Mar 2025 17:10:00 +0000
Date: Sat, 8 Mar 2025 01:09:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202503080120.II99gux6-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   98d5b0444e788687e54a325fc84907a8bacbe635
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [1365/1365] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250308/202503080120.II99gux6-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503080120.II99gux6-lkp@intel.com/

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
