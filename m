Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B55C025DD10
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 18:59:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746039553; cv=none; b=SW+EPjzEBMXPE2c7ghflwTaHzbJxi9fQfh5nViqDZkZyHxn5fgWYbPhngyGHVUwZ2gdpm7snK2SBd1JqB6hSH4yeBo8bL8Irky8nFDUtNBCPCuWgH+4cY9Hxh8ndME3m2o0kKD/wA56mb8xP9vS5+tLzwdNT8QUGfMklIwpO7Ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746039553; c=relaxed/simple;
	bh=/eEH+OO59+Gh/NdVTx8IPs27wycGJkfVsjdOKWvi54M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X/H/L9zoiUfjHSllHNhKdRJkxYofHtXn1K+KJXG9Y7KNzdmtdmdsbcsCFOKSd9H8bN8b4IiLEe35C1al6JnCk1uUA2iPSltY0Xwd96IvtMcS4uf9IAWUaBhDDIHIYAzu8o/yRAuim2b7NI74uzriITGhhQ8LonPiDrIGJXTeJ0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T/MgT9cf; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T/MgT9cf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746039552; x=1777575552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/eEH+OO59+Gh/NdVTx8IPs27wycGJkfVsjdOKWvi54M=;
  b=T/MgT9cfnwfjQFuupG9hs5V7TTKl+ik/xcy6xKuC1ABqamzQ6h79EpEb
   R8X9TY2w57lx4/qfEu2uOMNhm3yiHXMxGbn3fo0zcmbtEPAtyBHUFu9d2
   mMm6r9Aba/Jveb6AgiUtluDNSA3AFw5IgdWlBD7ej4VCEpaCggkAalP4U
   N4hJKgaQdOSRjq/47VCezYTLMUO6EOiavfYVdgDbP7WAjie+bRqftp069
   Fa18aup4bVvttLeHR6CwTsenO5t0RYl8MlDcL5PC1WcqniILFhqfLnK3j
   uQO390UGB8KsBSu40LCBIGtqVK+Da62UZITeDEICt2/81yTpgluF5/Ew+
   g==;
X-CSE-ConnectionGUID: sCDMkrlXQUi6b3FcollKxw==
X-CSE-MsgGUID: 4SXbPypzS/qfem3MhS3I7g==
X-IronPort-AV: E=McAfee;i="6700,10204,11419"; a="51533411"
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="51533411"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Apr 2025 11:59:11 -0700
X-CSE-ConnectionGUID: hz4sdwGbSQyOOiJTViRA7g==
X-CSE-MsgGUID: HssUDcKkRb6v6oo60tCilg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,252,1739865600"; 
   d="scan'208";a="134142669"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 30 Apr 2025 11:59:09 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uACeB-0003iA-1c;
	Wed, 30 Apr 2025 18:59:07 +0000
Date: Thu, 1 May 2025 02:58:26 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202505010210.KOXBibOl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   a48a35466505c8a52da57596944bd0b4485e825f
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [1365/1365] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250501/202505010210.KOXBibOl-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505010210.KOXBibOl-lkp@intel.com/

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
