Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6988D2147E8
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Feb 2025 15:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738684346; cv=none; b=P9/XjuaI45oTuL0nOjHUqcC7cCjaSWy9fD0nyixj35tdF5/KetlyScGLC03+1qc8XcsfQq0NnslA0cj8Z30x6u6cX79uU9ETIVQZiRzxr/tGDyK//aC2lGbYxiWbwLU6NOZ6Dl5c+JZewRnoHsHISiCWNPfUFFqXxpWirYcMPfI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738684346; c=relaxed/simple;
	bh=v/4BCgg/vUEViSDqBbbYAvhB41wQjeMHDhXjMeZNDw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=T7kUdeuHL9ACx6p/pBOh1xA+GNkV9zTDpMxdSASEhUFgRDPAE2gmHsmfkqu47ef2D1qkpybDM88o5sMzuZbruFLAJSyffWNheyzFQTO9GSVZsn36bIz2QFLIAAvvhPZJEScUmdEUsNMYekA/dhdOAzHtvwQhmHJW/1QI4z6YEwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KblConTY; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KblConTY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738684344; x=1770220344;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v/4BCgg/vUEViSDqBbbYAvhB41wQjeMHDhXjMeZNDw4=;
  b=KblConTYzp9pnCdYQLxNin2l98BKf7j2vdyJmk0LCKr+oz0lCMKqRRJg
   WPkm/gz/N9q9Af96Yx6iQoP8sr2EWeMl8FKCWgQ+PDvWpDQr2TaDIMdCW
   zQhyCs2b3IvIW4Up/E5pbv7syyqlQOnSfNfpUEaN5f38bKCnEi3/XC4QB
   xi4PZGIr9SwlsTuZm71jd+bZ31SGcdbXhZM4Sc8JNd4Sbwz/KPLzA1cUI
   f9IvPkO41FBhi8zsBkivXwTrj0tP9IQPmPnPAQusxsvejUo/cdBYoDqm5
   WLF4ddAM1mq4bXW3nwpy4Gb5qxZHeJgOolnXJRy0OKQEzxl4QG8jPpvfK
   g==;
X-CSE-ConnectionGUID: ANLl4GZ2SmSK7Qd0NR9ywQ==
X-CSE-MsgGUID: yCfDNfCoRf+oixOWTsZkgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11336"; a="50609694"
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="50609694"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2025 07:52:21 -0800
X-CSE-ConnectionGUID: kWm/yYb0SEKhkL2Qm1/FFw==
X-CSE-MsgGUID: zRA2C6/tQrCuTFKpXQmgjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,258,1732608000"; 
   d="scan'208";a="110462329"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Feb 2025 07:52:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tfLDm-000seF-1S;
	Tue, 04 Feb 2025 15:52:18 +0000
Date: Tue, 4 Feb 2025 23:51:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202502042318.pGS3sedi-lkp@intel.com>
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
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250204/202502042318.pGS3sedi-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502042318.pGS3sedi-lkp@intel.com/

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
