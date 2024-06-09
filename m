Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 251024C627
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Jun 2024 22:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717971158; cv=none; b=NEPtCU7FtH7iSYbfIqfejkvh9dAJWGjcNBkt4cFC+EnNKxdtlwIOG59o4I8vjghGMaYN/n9yrDcTuMGJOnSRDJhA8BfovlMYdmp0xQtxGplNu4ttkJpuMZiTu9WxJwTrRCYzFf65OnX3hIBJQtwLmIvixlouUbbVDELZsdwmkmU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717971158; c=relaxed/simple;
	bh=XX22Wtd3SC/NYGqSoQRJhBZnaGoitMLH2sQbqcY+rlI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=NvZeXSTLc3vlEUefPM269EclL3c74pa6suvglYzQEgLh/8qvb05v03f4DMtrSfg1s1k1FjqJ6m6RwR0Qapbq1u/9nAqt7fsZklLOEiFPzyr/VPvGz6LT/VeMPvooxix/+QvgAXjpDagKbj8P5Ik0xPzmeLa4U7kreEUoo1ed1vY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eRoAv3ss; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eRoAv3ss"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717971156; x=1749507156;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XX22Wtd3SC/NYGqSoQRJhBZnaGoitMLH2sQbqcY+rlI=;
  b=eRoAv3ss9MALWnVYgDbdG9u/UYo5zQgW8jEFzFh3rctfXC0auQ777C2+
   ZR23DRGZhtCktpjcgvXhq0v5egmRQRSTHuceq0Rol3iQ9bA/Fh0TH+ndN
   sJw0qsGv2puwx9lznfrYPxx49PwYT6ArOGnMyFI0SJQTgq5PxKs3Aif0v
   CA09AIcZm7wGpaspo0q6PYp5OV/WqCy6yEteaNtAUc0BCAMBeV/g84q7k
   uMOF3zZW4GtJjXI+z0ktdEecHJBNYhKxOfJVISYsM2w4JE1i3Pkzhy/Hr
   eRg7sEI856oO897eSZ4ZG5j2RbRb54flmsqIV6mGLJZ0wxdczyD9aJ6B+
   A==;
X-CSE-ConnectionGUID: LqCJrzwTQN6IZkkiI/DfOA==
X-CSE-MsgGUID: NkHRIW8bQ1G1Kh60pGMiNw==
X-IronPort-AV: E=McAfee;i="6600,9927,11098"; a="32161465"
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="32161465"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jun 2024 15:12:35 -0700
X-CSE-ConnectionGUID: KXijXYxDTFWcRv1RnA69Mw==
X-CSE-MsgGUID: RcSZ9h99T2OIWCDoxxH7tQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,226,1712646000"; 
   d="scan'208";a="38962503"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 09 Jun 2024 15:12:35 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sGQm7-0001di-34;
	Sun, 09 Jun 2024 22:12:31 +0000
Date: Mon, 10 Jun 2024 06:11:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 18534/22827]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202406100658.RXAKSKac-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6a98543755cf2f636ae3169f3774d226d328d2cf
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [18534/22827] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-103-20240609 (https://download.01.org/0day-ci/archive/20240610/202406100658.RXAKSKac-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406100658.RXAKSKac-lkp@intel.com/

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
