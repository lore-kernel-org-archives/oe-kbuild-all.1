Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D14E563CB
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 14:48:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737298134; cv=none; b=Kr+XWIaSyK6Onj/DDGmsZimFWDlnRqvXpyhKE0ufrGbm7LHNSQMzU976xsG8uwiyJUe4qkzvxDIbcouAR+bUmMybUPKxuDff9Q0Kx9aMGDLpw1z2iDbRTipK2nijEySrqMIptAZSK0VTznB5xiDmHHmYM4H5g2cVsolcVOWwn+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737298134; c=relaxed/simple;
	bh=NMtQVARHpRG1VOQ/hd/yCcoJbKHxLIT2yTJOnWae/lU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sA4T4ZnVdlsJuKAVC6j9YOd/njUpmbc/sAK2HE7lBc+o+8P+vtZuyB9DO74Vzyn8m3ubg+rSs+wC3eqjXZ0M4lN5E7uBK3seAnL9Uw0uC34ZPRJ6ZqyKn9TDVUF7UcQblBCynaA0YFMxzwlW+XbdDw5l4+KK/VrSK55T7AObvsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MI7sr1+4; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MI7sr1+4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737298133; x=1768834133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=NMtQVARHpRG1VOQ/hd/yCcoJbKHxLIT2yTJOnWae/lU=;
  b=MI7sr1+48KG/yinbzNFOH/MD9p4qwG1h3ePdkkpWkKE3Jv2LuQc3MkBY
   sn4XZOkdMBEzTZibZE6uhNtXrU7xVSOxwFtnQUeRfzu7TAb8SaWbSKlbG
   L3dlGgVUjTnhCSjM9h4UcWYDtwlqcipPWZPVOlrUnETFSpQ93dT3Niu8c
   LO4x494c49EbhAuGJwGvvt0wPGBCExFK3ruScwjlklE9yDXmu13Tj8K7i
   OT/9rvLifzZ/XbpcD+qWuqDjmkRZ7FL92oMecyW7sVStecum5j5PghPx2
   e8oSroWCDT8MCQXD7tMbklmFl8U00vH4MG3s76qWlz3QVxL7+KSYOP63K
   g==;
X-CSE-ConnectionGUID: 5Qt/IKgSTz2fIjPMAC8cFg==
X-CSE-MsgGUID: SN+QSPtISHOZzLsOffBbXQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11320"; a="37580062"
X-IronPort-AV: E=Sophos;i="6.13,217,1732608000"; 
   d="scan'208";a="37580062"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 06:48:52 -0800
X-CSE-ConnectionGUID: +cG2pRXCRjiujkAJ+ftKww==
X-CSE-MsgGUID: BWNKnH9gT5KJDJX0AP0JWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="107135422"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 19 Jan 2025 06:48:51 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZWbY-000VX1-1o;
	Sun, 19 Jan 2025 14:48:48 +0000
Date: Sun, 19 Jan 2025 22:48:00 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202501192215.87TCB3P8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   52349611d09c6a9a2b558b3ce1cb1dca0d47dbe8
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [1365/1365] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250119/202501192215.87TCB3P8-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501192215.87TCB3P8-lkp@intel.com/

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
