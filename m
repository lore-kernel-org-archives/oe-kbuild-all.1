Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3FA8235052
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 May 2025 07:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747811611; cv=none; b=onT1/gJacQ6/KpqwHroMRKp8+qp5DcaU6bBwubR3kGku7A8BZmRQDGDT8vDdOSPkHi3QbhzdflApiwRpporb5tZqoYgpTKHSQlIMlZ4gLVAbsMxTiYbptM422XiEiv3VBEq85/1xybgR1dtVD/TwWDRpJF/69T5SgyAe3+DoVg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747811611; c=relaxed/simple;
	bh=+O6ZvMw4hsWCnlVxxOx86uEH5HsBlX+Vg4/MuSowpDo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VN1NYFhGXH+5xtYIhscFHyL6b72+zmwFRCupKAcFn3QVebzbKt+c51rBhMkL3jzTiHDNGMo514T44SgiadgpjkkOvIsWJ2U/kaPS5cCUpcM7lVeiTHndIdSGDxuTCeqeQE1JbHuVxswZCzoQSa3e5zc/TmFbdxB54Ed0QtKYVvw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ZQXgnOl8; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQXgnOl8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747811610; x=1779347610;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+O6ZvMw4hsWCnlVxxOx86uEH5HsBlX+Vg4/MuSowpDo=;
  b=ZQXgnOl8Fc3wEWZO8E08MRMLNIGDqzK3nI7A4PRzFY/fIXcffdGzqQYx
   afUBGAKBc/Js8IgE6YqOWmtiX07x3gKNxFE5DJwU5oveDacmQx0+9Hua3
   jZU6VbCbCaM0cdHDbuQsAY2pxWx1MtlB7oxenQG9qjt2sAGeQ64kzoDq7
   INOQD4SD90WBiqHiKlwq/C4z2zgxfWXf1KAXtm6eB/DDnu41GnCe4+5zF
   ObJTYDLktk4itwr4pT5vSaPH+ChOMOCi04prQz7wyMy7ULmaPFw3ZeBET
   0tdlicAFt9v6XdRk3cNEJyLwpLgvmgp/kGEx54CFfJTV91vYb33RJR5um
   A==;
X-CSE-ConnectionGUID: jqDRu7iVRE2Kusj7FDBIqA==
X-CSE-MsgGUID: hvnzK/lQSp6MbBxIRBaBgQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11439"; a="60006892"
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="60006892"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 May 2025 00:13:30 -0700
X-CSE-ConnectionGUID: fdW3JNXzR92i2rL5EeIomw==
X-CSE-MsgGUID: t3EEweTCRU2eFEg22PT45A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,303,1739865600"; 
   d="scan'208";a="139834079"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 21 May 2025 00:13:29 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uHddm-000Nyu-0a;
	Wed, 21 May 2025 07:13:26 +0000
Date: Wed, 21 May 2025 15:13:01 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202505211556.GuPF6Fy4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   2eb609d2f89b2d85d89cb018c3f97050989807e2
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [1365/1365] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250521/202505211556.GuPF6Fy4-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505211556.GuPF6Fy4-lkp@intel.com/

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
