Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E284F18801A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jan 2025 09:27:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736587649; cv=none; b=ZEqr+Agqxh4diOHofKB2qHajmR7MmeQ19gcLneQdf3BAkR7DIiDy185wl09y1B3sJe/GBpFAYiw6E68FOvd0aA9HGLJUQI0niCfwioWUWP0qm3u170nw4JZWKz/Y7El0JDGWblmBiuoPfKFlJsG88DkRDZV+pcxunn8LMlzP5Qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736587649; c=relaxed/simple;
	bh=vl9dCFvxKZZWPp2MBlQ6cBIFYgHWeEDjelQi/bmvAI8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=akIy4mXpAvTgl5+Q8b4sJT0nPaT2MA3x3p+m1Jn8/xYAmYonLY0n8mgwYpsLWdMTr7ZNM81hrTf47nJtI/zWoyhV+ujRsEMqphILoE60z5dJO/eEUhmNIEx/F9VO3SkHWUEwsyzc5Cak0NeCl5f7xqK8uUTnk+FrnzmomOFM15E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bgoBtgD/; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bgoBtgD/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736587648; x=1768123648;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vl9dCFvxKZZWPp2MBlQ6cBIFYgHWeEDjelQi/bmvAI8=;
  b=bgoBtgD//kzdQ61REfrxqv49xmtZD9wgmzU2yjzVocB1drSe+pOfbN/e
   H9XJsJbxmRiSWGwIGioOWgKvDXb+KdwjbOIE18cHLO8qH2YVaDrIvERSb
   l3jk8hAQAKPrqgVL37v8RhvHuOvfjNVcUo8mEydNMC25d8D6SVlnzSMYQ
   MPU5zk2kFxtSHuNOc4Bseir8zbErnMSukxRaBj7QkFgk6qd6feiNqccc9
   BrOpHYUE0OZQCy3E3T5VHxtXO2jwKb0Ti9YWgQdAoZLdyJz1QyajKnOgj
   HihDpkb9XY1CLccdCgJg/eXGcoYFFYTq5wv9BgQkB1h7BCD81WsIXVBFI
   Q==;
X-CSE-ConnectionGUID: 8h9jVIqUQ9ekrxdfSej+7A==
X-CSE-MsgGUID: PlMjNKnUTmGkhoQzckPhhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11311"; a="36781789"
X-IronPort-AV: E=Sophos;i="6.12,306,1728975600"; 
   d="scan'208";a="36781789"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jan 2025 01:27:26 -0800
X-CSE-ConnectionGUID: V7Q8wD/CQZqXcTrPIxcnJA==
X-CSE-MsgGUID: AbARwZcTTGC21C+py0mn9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="108988527"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jan 2025 01:27:24 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tWXm5-000KR3-2i;
	Sat, 11 Jan 2025 09:27:21 +0000
Date: Sat, 11 Jan 2025 17:26:47 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202501111728.shzgfnXO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   97f98c391a1fd153ae010a2faf73f9e03270da6e
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [1365/1365] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250111/202501111728.shzgfnXO-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501111728.shzgfnXO-lkp@intel.com/

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
