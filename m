Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37A417D355
	for <oe-kbuild-all@lists.linux.dev>; Tue,  8 Apr 2025 03:25:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744082720; cv=none; b=VUVW8PNUMXlf1+a6lnN6xDaRzU/QQVaDPN23tChZa4hb8BOYxG7uZ7TIUdtIUE12NrxV5jq8U1ZoBPlKsI2FGuqCzquGBA7Is7ME282N/kJDwHhmasIFZanq01n5p5hCxyVYRe4grg//OIr+HeSdxJBoUHOH2Nem6vScpG07a2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744082720; c=relaxed/simple;
	bh=I/1hkZAoDK2e7amexMwe34fcsQdpVjoeQawK1sX20lw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ygr4DpiAfM9bib/5CVsaLU+8CslebTo0NRZ1KWlDzzRsgmN7VkcmlFlHWUD1dOLb0Oc/g7deH2CjVYHHs48fUoSuaAMK4KL5HGHKHad2Vap4F+P1914Gd6eTA0NgQG05TEpeFwlbN+yuSBlsqjdVFIlaTfAp+By8n9wDNJpUuOE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fqJHKjTW; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fqJHKjTW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744082719; x=1775618719;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=I/1hkZAoDK2e7amexMwe34fcsQdpVjoeQawK1sX20lw=;
  b=fqJHKjTWBZatt5m6dmO4sKSOVFsXaqB+ofhcp6xadSLh5Mi1/zhHvbel
   IDKMLlHHsw9Dilr2CoWUsSih+N3YiGeLgh+9EXzNh2O6RB7m7LM4xFjRI
   kEhBYe++33WPh6tA3YFICyhJGjsCihJb+nulD5vYBwWRa8OxJymML3l8z
   GVN/Oi0CK8R6tG051JRviv6ot4fgLfhgMrnpyz4fSbqFwlj5qfxQoHatb
   tYMk9807lsowfuO+4CM3md0NLxdIxX6gBkEXrM5kusLLUf/YpjERj2PkQ
   6V7IyyELgyrDB1KhyLlIwVfSWOgTHZeqImCCRw9vRhsEF4aHwvyWWamMg
   w==;
X-CSE-ConnectionGUID: ff744wiqT7miMjJsSCjp4w==
X-CSE-MsgGUID: QsGGtPvtRwOqpn0UaCsebg==
X-IronPort-AV: E=McAfee;i="6700,10204,11397"; a="55682511"
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="55682511"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2025 20:25:18 -0700
X-CSE-ConnectionGUID: +fqeTc9fQmaJpjcNh6F69g==
X-CSE-MsgGUID: LBRaYTb8QNOQ48y3GC/Mgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,196,1739865600"; 
   d="scan'208";a="128996443"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 07 Apr 2025 20:25:17 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u1zaM-00044T-29;
	Tue, 08 Apr 2025 03:25:14 +0000
Date: Tue, 8 Apr 2025 11:24:16 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202504081127.rMMmKSGb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   3191c9e4e7c581bfe0a40ee198ffcbd5c3dea53e
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [1365/1365] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250408/202504081127.rMMmKSGb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504081127.rMMmKSGb-lkp@intel.com/

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
