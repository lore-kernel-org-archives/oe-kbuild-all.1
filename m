Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A0171E4A2
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Jun 2024 14:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719068214; cv=none; b=JY5Og4DPbeVooeOI9vElXlaNeGhemOXsyWiYGBwVMIHXYZZl/K4cHFpz3WMPmg6GcZPqgw7X/vvBPTj3n1+5reGkPvk1zFCkUJ0900aMtyXAeaSrxZAB9a9ggb0CuhW7yYRPnWT2JfymaDKBSqQ8Is7p2vLnMEqWT25iiCz9LGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719068214; c=relaxed/simple;
	bh=HagfxVuJoK9ZXAMyK6CKdd3RdPk5pRKAh+IDH/q8UbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ps2DTCBtY2IvKLVvVtpkkh7yoObd0722Vf8E3shuM+s6nLtWoglDzYErMlnAiEtlorKtwTFqwWi/T8yNnkwlYk4wQQzwbVbWkl6VMaUCrnnI9hVtE1SNprZBQtgCfolpYgSAdfb25GZcq4COnvilunljdi/tHxxe3PQ2p5tx9/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=inea+C6J; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="inea+C6J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719068213; x=1750604213;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HagfxVuJoK9ZXAMyK6CKdd3RdPk5pRKAh+IDH/q8UbI=;
  b=inea+C6JZxGJc2FH9TICTBCMDXfS8xkwoOncENVBr7BjBkRXOLyj09Ok
   gKEsN1iCxFPBJ83EjeiUVs2JyH/jkr9Qw/ysOjCLOl1l/AXgEIf4am3q8
   acNglMEXW2KbWOG1PWYzbqYQf8irrOeVOvaNDJDCY/cxsMDc12tuOCMzF
   nQlOU2QQ2YdHkfH9MVh0GU0Ai1MOS/DmuGPQfJmdVqDOyBwCjIjBUg70t
   Hs/+lRFLCvrM9ivb8I2H7jhNfg9T5Ks22FIoHf42ahh7dd1+jQCfastZ9
   jXhY6hHobFiSe6uT5ZeUeij9R3x8lAhefwcmnHo28mfgbjdDcN2YZvuqW
   g==;
X-CSE-ConnectionGUID: QsU0Yz6tSjus2Oo9YQjtwg==
X-CSE-MsgGUID: R+ydAD2vSvijJvY+PUW3lA==
X-IronPort-AV: E=McAfee;i="6700,10204,11111"; a="15848514"
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="15848514"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2024 07:56:52 -0700
X-CSE-ConnectionGUID: U2kKRgmwT4WONprI4d7FyA==
X-CSE-MsgGUID: DxOoOvXNRHKiUmfagu3u1w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,257,1712646000"; 
   d="scan'208";a="47311686"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 22 Jun 2024 07:56:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sL2Aa-0009iU-27;
	Sat, 22 Jun 2024 14:56:48 +0000
Date: Sat, 22 Jun 2024 22:56:19 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18534/23028]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202406222234.Hz8OPmay-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   10a294b680ddfda97a09883fe559dd418e5340cd
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [18534/23028] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-103-20240609 (https://download.01.org/0day-ci/archive/20240622/202406222234.Hz8OPmay-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406222234.Hz8OPmay-lkp@intel.com/

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
