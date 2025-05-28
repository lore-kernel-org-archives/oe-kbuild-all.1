Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5846F2882A1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 May 2025 13:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748440398; cv=none; b=JACmikYTCQ5jMPu75ES7G5nq/WZ55tuO+gzMYjbCvwDOfe1P++/SRl6s167zHAWwd3INrigy+JdKOfZPHP6RSViLdvk1AqET7XSqqx3WiyThUgIyhZDQYgxIM8ES4DbgMTO8WkbLMmpKx5QOVH9aeSWl0oSjqOQ2jk0cgPK6e7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748440398; c=relaxed/simple;
	bh=LIK+qdJBpTwfoGjnIOstN4bU2bGM9PBi9JNXFR02MQA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U+cSnXOjmwTd5Nu3JgpLxTL5YxclMutJxy31UzbYmcZqu5o1X+1dVDR/pHIDZclYEzCCb3RFK6K5gcRyXPG+69b3O5srcsRdLegnXX+7CzQvVeetU9ysqi9JvAgtOE+Zw7KSKaiK445iqs7F0EYP4HFQwcm7R1pXT7EZo+8Tsi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bAfUa1Kr; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bAfUa1Kr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748440396; x=1779976396;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LIK+qdJBpTwfoGjnIOstN4bU2bGM9PBi9JNXFR02MQA=;
  b=bAfUa1Kr5tOHvB1tEKsHqYtJW6NhyzicFDDLP5G0RwX1n4e9C9yuI6Q/
   g4xNhx00hT54YhtGrHm6fKlb9T/XAs2yVsuQlzlSClrUvYYqdIlsWhq1x
   kP7zMO47Npz0YtD5o3OpFFEOUkroyWKo6Bx2a6iuNWIAf9qpo1R6xPAMd
   bBt+0/YSlZXHx+B/IU69ISI7nfzjyLdGhLaFyCfxKdvAkmUqIfW/W52nz
   DIXrIHU5fiaAzqns3WN+0DvQ1iwojz5RVxoHlcS2TxUTc6Ruy2eWsqJXl
   554pU7E9m5XZ/Y/YmIifvAKJlQOGcv3+SE+duMJjJMZvycqzO03fQ2+Nx
   Q==;
X-CSE-ConnectionGUID: w/1aIHgARUaCwKG7bQYH1w==
X-CSE-MsgGUID: NWvh64AZSSGNYGfyt7JyEA==
X-IronPort-AV: E=McAfee;i="6700,10204,11447"; a="50623584"
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="50623584"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 May 2025 06:53:13 -0700
X-CSE-ConnectionGUID: 785SJ25DTk2o7Gn164lcug==
X-CSE-MsgGUID: sYcYm3k/QC+qL3jTKf2skQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,321,1739865600"; 
   d="scan'208";a="148536317"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 28 May 2025 06:53:11 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uKHDQ-000VjE-2H;
	Wed, 28 May 2025 13:53:08 +0000
Date: Wed, 28 May 2025 21:53:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202505282104.4h1iEHGb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5ae76523ccf96ec8b8d73d541e305bf15b6b697e
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [1365/1365] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250528/202505282104.4h1iEHGb-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505282104.4h1iEHGb-lkp@intel.com/

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
