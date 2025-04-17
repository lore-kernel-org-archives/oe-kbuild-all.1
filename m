Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB4B321D3E9
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Apr 2025 23:03:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744931005; cv=none; b=eoYxoJfx4OXZBd/CTC2s7kcojN7jhtunq38HTQiu63kyVUnrlc7nbRTmOyI6RmaxOPnqJyKEDUJ2WOa6gRqH+A/rgs69L9PWBp8NycEO1cgF5Oe+oLnbR177VwdbKSLu1tkV576bX1uDN9O1XU0NJ8ghtJvciD+Wk0ODoKHQyBo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744931005; c=relaxed/simple;
	bh=dcp2mpt5rEGfp0nyHh3/NthK4mjAKLuvgJJ4VHIeOlo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=CF2hY/z+YocNqYzt6i5f24ofKSF+q50V3LbfZXpBuBiuwFMI+/POTqgD5tIxT6q31Cv5tkeTV//E9Gv9SA2BT838rSjTmZK64jprEcWq0c55Sw8N3mHTMIIic7/tZ0M3bP2Q9WlwSVmjWW2JBRSES9BsgDox3b3FaV5bIOT7/wE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lb52Bclh; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lb52Bclh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1744931004; x=1776467004;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dcp2mpt5rEGfp0nyHh3/NthK4mjAKLuvgJJ4VHIeOlo=;
  b=Lb52BclhZdiNMXxgEF4A+irFPTa2KXJNgJmuaH3MZJC8LX4EqdTlHPot
   Pxhrai4R/e9M3p9PM2Of7MkJfYvnXyg0Hs7flqS7jO/ePW/Hx/2sOp2Cr
   Zg5co56i5NX5qRGNt3KqrivmoUhizyOUAwBI94E/uuw4iuYqndcKrBzSl
   ED7WuJcapLDG/nvtE9tgmWryVhkIgeHCcia9NxqU6zD/SVuGDZx2gka5D
   QtqsH1eRTWO8+W/AqDVu1M554dvdpSBLMVG8qUV2z6jmrn4dv4GWlUv6F
   TTbsf31fqN0vvi285SV/UV45ydlHl3ItKQ38vXJfjSlqutcRyWLcTKW8a
   Q==;
X-CSE-ConnectionGUID: vJ5LPmABTfOMcGTEjh1B9g==
X-CSE-MsgGUID: OXJsBLtKSAOTdzPdHUWPLw==
X-IronPort-AV: E=McAfee;i="6700,10204,11406"; a="64091143"
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="64091143"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2025 16:03:23 -0700
X-CSE-ConnectionGUID: dNHDn2LYSB+AEHazRQVxuw==
X-CSE-MsgGUID: Q0dU3UktQcO9WotAbvpdUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,220,1739865600"; 
   d="scan'208";a="130913329"
Received: from lkp-server01.sh.intel.com (HELO 61e10e65ea0f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 17 Apr 2025 16:03:22 -0700
Received: from kbuild by 61e10e65ea0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u5YGN-00027z-1z;
	Thu, 17 Apr 2025 23:03:19 +0000
Date: Fri, 18 Apr 2025 07:02:59 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202504180610.JUm54wLX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   c61927b921388695af91d0e58b8709040ed6cb17
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [1365/1365] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250418/202504180610.JUm54wLX-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504180610.JUm54wLX-lkp@intel.com/

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
