Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3584F23BB
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Feb 2025 12:51:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739623905; cv=none; b=R2Uj01DXBoUY8Bz6tgSWLN63jqYLqaCKvYLW+lL0vSXq5xRlEHj0F6HPsyNexb2sniceoId+3D+DoUHkxi2xzXbOfAFJOATXJqiO40K4gJB4Pv/qgy7X6YZGFt2DX9bZrlZkA15WfwNaIEmQIldgNABwoAqH2T3+vn1vZ/7/t/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739623905; c=relaxed/simple;
	bh=Vl0liPTJAnSY7SnbzpF3opPYkJuO7MSGXiFPcVWO0hc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sbM1mu6SnguDHZL/V3ggBro2Pm3BAHOpS3OPwPU0Rj05hwTjF1O8iXfluLnqB2kWr/HEFrRlxVFXe0xOAT0qc6sUQ7NtqVhimhCVYt74oMAXVj4Kk5QdrjsJ9dpYcZooefWI/3aCHK+YAYdJ8eQytdYOd+ZR8I4zRIGnwwcvJG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QBoUu1/x; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QBoUu1/x"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739623903; x=1771159903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Vl0liPTJAnSY7SnbzpF3opPYkJuO7MSGXiFPcVWO0hc=;
  b=QBoUu1/x23ELF2XKIUBaJ3lYxZqZfAshZPkCwhKVctE7H4k/ScNANURw
   9eocvArHTqBmg9cujln5rsm11zulepFY6dm2EvowgE5HFk8Im7fEd44mZ
   VT1iRb+LgihDTVfypVu+SLA3/G3FK1IKkDVITBzzWEthHsb7EHgCLZM6f
   es2zv5UR6MsKfsHWcwW+90+8Te9Bw4AMpklt9zTS0d9bDtSXoqYB2S6Qn
   IyQ7hB0weMxeC4ZoEoMxV/9LAucHA/5NrDd3B/XCnkRFjgfCjmERQapPx
   7DRkS+aLwPWnMMVHqIJxDBAiSUo+ecGvR2iEZYldZ7Rr3KWTreTMzygP5
   w==;
X-CSE-ConnectionGUID: LTrcndLrSrqfZTtpP9toyw==
X-CSE-MsgGUID: cXN7Bd4VRKuoS15U+t3KDg==
X-IronPort-AV: E=McAfee;i="6700,10204,11346"; a="44294609"
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="44294609"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Feb 2025 04:51:42 -0800
X-CSE-ConnectionGUID: 6AP7v2DdTXCLCVxWqXJijg==
X-CSE-MsgGUID: d5E4whwjQBujasPLl46qrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,288,1732608000"; 
   d="scan'208";a="114324867"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 15 Feb 2025 04:51:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tjHdz-001Ao7-1E;
	Sat, 15 Feb 2025 12:51:39 +0000
Date: Sat, 15 Feb 2025 20:51:12 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202502152003.YgfLX405-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   6a6cc2b6b95dc80ae01221670e21a8059229a023
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [1365/1365] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250215/202502152003.YgfLX405-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502152003.YgfLX405-lkp@intel.com/

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
