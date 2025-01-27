Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6657C18D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jan 2025 13:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737984066; cv=none; b=P91BRFeyNxBvlnjbjWHk4pUiVE3P6CibGiVm2esluzW104oim0TpaO21U9t45Owce4220PnyYD1jva6NeAouOccpxXJKq5dquL5tJjaYtJlZMbj1FWvOpD7azP2Ajs2eXPwxXhBelB4SHFQYVU0vZG/DXbegAFuErXv0A2tW88E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737984066; c=relaxed/simple;
	bh=nx2pyeAN5TQWP7gY/Wao0KN7tQELtcP5S1kYr1bPFNk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gO/v5vyz3RK+66y2fct3aVRhBas9shRgCGU8vZ7yZx7QrUetsdKzW7QUEBSax93Hrx6Eh3EXXysz/AbII3QUf+C07TEQ45JoEyOLtq465+8MR//7/g6U27RTlAJG8rzNDONyXm17bL+iso6zVu9rt6F9AanpZcOx0WTFrDmTX5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XcXQ/1I2; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XcXQ/1I2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737984065; x=1769520065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nx2pyeAN5TQWP7gY/Wao0KN7tQELtcP5S1kYr1bPFNk=;
  b=XcXQ/1I2MZkD6sOfPBF/giQWF10U8FpbINU7aAgBq1kidyByTseVzM4Q
   wda5k8th+p7HB4kp64Zsk5CeVlhQ3zGS9RM963mzxaafEGL/wmYjFJEQs
   oR+/c4R5TzGEcpREdkiZV3gB4DygV19uKzgVCmYlPmpb+JGzddPUPW1bk
   L+KHRWhVy0SZRAEhqMs9aNG4vxwI5emuQKxs4oUlCb6PGKDxiYSSCMBeW
   T7UBvtxs2DOYERUFq5bqoLhtFVndwT7ijMpgN60TlLSeutxVEn7CQcpgX
   UpVKZMHMtGWW6hBBTQlNKpF4fiJhOhOh0U83d9byT/NuNs6MxKLU0gNgR
   Q==;
X-CSE-ConnectionGUID: mpQ4blblRNWgbm+Nj6kh8g==
X-CSE-MsgGUID: jNYaxjIoR1GvaUOlhyNmdA==
X-IronPort-AV: E=McAfee;i="6700,10204,11328"; a="55865974"
X-IronPort-AV: E=Sophos;i="6.13,238,1732608000"; 
   d="scan'208";a="55865974"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2025 05:21:04 -0800
X-CSE-ConnectionGUID: geDvDTMATYOXcBwpbvB4Sg==
X-CSE-MsgGUID: ngp89+k6SeSvWVAdkadx6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="113579295"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 27 Jan 2025 05:21:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcP2y-000gnS-2O;
	Mon, 27 Jan 2025 13:21:00 +0000
Date: Mon, 27 Jan 2025 21:20:57 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202501272114.s699yjVJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   da51139d17e9d53d61a9877d9042e43b85d71ee1
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [1365/1365] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250127/202501272114.s699yjVJ-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501272114.s699yjVJ-lkp@intel.com/

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
