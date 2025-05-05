Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6FF81F5842
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 May 2025 13:02:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746450149; cv=none; b=bgyjoQpTIgx8fymEgawTWnGfeh0DRgDEO0KTNanwP84imU3faU55CRpApsH2HZHmz9VgnICH/mV31i9eDFH9LOoqUzyc2nz26eO9rl8/nZLGeCLpPb3/not/QcPf1F9lNaiF6i9I1LSfv/0UdSF/wg7QIEgevSVE1QowXcJy9MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746450149; c=relaxed/simple;
	bh=sXzxrUr2B4L+xATWcdAVGonE9o2NOsDgQ4IGjatkTkQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=e+fzkp0h9vgzGW8OkcctCgNC7GB+5slkoYjjFTD0YQqZ1S5zs4mMOhL/v6/WjyWpgg2ZdFf9uwCC0njY8laUpju3wRnK7Do+MELDz2sVSVpJL1enjzGZRbDKWFNGkPNECNlyAY3ATkiHRKgdYKHSy7vYLFwBk8O5pOxNMMGpPFg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c8P/axpO; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c8P/axpO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746450145; x=1777986145;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sXzxrUr2B4L+xATWcdAVGonE9o2NOsDgQ4IGjatkTkQ=;
  b=c8P/axpOX42Qf1GTVqbExyttbSTkyggGILtW0/w0Ptqddi1WV8kGjjNT
   Xcpl9gN6y0msVlzP53ujASLSO4rvoTkoE6XGPdNWK6f/eA0UOyXv9nE0P
   gQE183es+mnkVSWlvVdWxtadqzbbYtN3UaJo5M96tqIm9Qii0xq4/L0UN
   pfp8Bcu5XVOX1bt9GmhzvGGgfkeFeAWxXCRvlgnDCv0lK1Awg3gMKLYQR
   u1o4GXhElGIv5lmxmy19iA+iZPO/WmQ1PQwF0HaWNF0FMOGin9b1U3IC8
   7N0dRiO9+E241jsEdayYxO9M9b7FpbYXMLKFPkBPuvbwFqSU57QdprioM
   w==;
X-CSE-ConnectionGUID: JxOQcCpIQWe0NM+INz7gEg==
X-CSE-MsgGUID: n1Ot7EeOTgihaEdM05IpSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="48193912"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="48193912"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 May 2025 06:02:25 -0700
X-CSE-ConnectionGUID: FbRnatwMTO2eQR+mUjpt2Q==
X-CSE-MsgGUID: SWvHPJNmRWWQ6iwxwH7oxQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
   d="scan'208";a="139265374"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 05 May 2025 06:02:24 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uBvSf-0005j5-39;
	Mon, 05 May 2025 13:02:21 +0000
Date: Mon, 5 May 2025 21:01:50 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202505052008.Vj0WP8gn-lkp@intel.com>
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
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250505/202505052008.Vj0WP8gn-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505052008.Vj0WP8gn-lkp@intel.com/

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
