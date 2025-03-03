Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47A8A23F383
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 05:28:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740979710; cv=none; b=elWzPQDnPU5NkFky4sjR6ym3Pexss3o2/Kdo+rQSJ4RoLrtqoAei9PLe0mdOLwaYsLClfoPQoV7m1ag+hYeFKYI8aDYIGjVJXbf734en1uzc16KJNN2sxWg8+v7JYcUU1ysvGmUuMDc4AM1AcAusW5XTrlEUThABIKO68rgyPuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740979710; c=relaxed/simple;
	bh=nOnCQKohJKBuYXT3eHrjDcp5MsTP4UyYEPxGctGOtFM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OKWgrv6QY8pgmRBtGQ/LZ36mwO1foTr6u4vLjn8/htHGctP08nDkPVMpmwpD2L4pFCfMVgjb6ZsO4zifxpRrHPcYfbBs5VPR2W2rKpJZYtq3ik7/xkclaS8B5tsqy9YMcQ6FMDvVxUjUwvCWDwkQa/Y+I4QJQjs5xMdbgivb+cg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=em+/Fw1c; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="em+/Fw1c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740979708; x=1772515708;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=nOnCQKohJKBuYXT3eHrjDcp5MsTP4UyYEPxGctGOtFM=;
  b=em+/Fw1cf5aeebCqhExKaPPWw7kylmJpxvbek7iBYzmA9IR1Dzqc5n1E
   n6jcSGYFTRoeKexeNh2civK2ESK2ynM1iDYMXj4fq1K8U2CTkHHUcnF3U
   U+1SOayYko9T4e5/CenF7jYPYVh4nrjtlckUB4tCM8egJwyMfRwLmuZnF
   RbkulPcxhf6jtx7hZSlpMCTJODWiInFsNr6S9kQp+/iqoPENEKgxiWszb
   /nHafuUaN5vyVLCZmnT/pi5vNXGD8U20rZUT7O3uaCjcGCwolxQNcYHVq
   AYTJX5RiylcI3tYtspxeNRiq/g2kgNU7scwE4H0KuK55TeehXI4xuf65V
   w==;
X-CSE-ConnectionGUID: /hYzEkqLQSSsStlvc5NlqA==
X-CSE-MsgGUID: SaLb44e5SBmYJW1Q1Xt22w==
X-IronPort-AV: E=McAfee;i="6700,10204,5688"; a="29427201"
X-IronPort-AV: E=Sophos;i="6.10,1,1719903600"; 
   d="scan'208";a="29427201"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2025 21:28:27 -0800
X-CSE-ConnectionGUID: j8cYTojYRlu7XvaOnHe/cg==
X-CSE-MsgGUID: hyuycBbWRo2oVbD7ibIvtw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,328,1732608000"; 
   d="scan'208";a="141117146"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 02 Mar 2025 21:28:26 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toyLo-000HyB-0m;
	Mon, 03 Mar 2025 05:28:24 +0000
Date: Mon, 3 Mar 2025 13:27:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202503031330.RPH0chUc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   df3541670ca99b09f2f70d1733516ef7a2289b29
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [1365/1365] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250303/202503031330.RPH0chUc-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503031330.RPH0chUc-lkp@intel.com/

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
