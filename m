Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC41233EA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Mar 2025 03:13:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743390837; cv=none; b=oHpoAeGr8xiR/mfMeLdL6tqGHLPSO88OEGrONU+jJjYwLBgffCGzmdynNQOH7PkrlVHD+EaQigpVZOjdvxk+Qdm/rPvd/shcWdEA+zPDLsxunEycH27D2mBLAunyaazcJ1D8XPq/zme7XreWrr5njbQ8J1prtN6WkhQR0QwJjW0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743390837; c=relaxed/simple;
	bh=5FwXnqSn3EMcOgz7gFUShwYqXG2zc9WLIJmk5Q8l0ks=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C1CuFTgkejG6BHcexi3Xb1YKr3UZc4xwRDFeICOhejeBJuNziaebPa/ygzUxDxNIyEujpQaapzf9tVIHZ6Twb+Ly5YyDMKG1qR9b9GGF1Ecm2+JZf9x3bs0TAMBfsFsaMqhl6i0GRt+xb4M/k3et59CtOE91sAoHVkii1ePO8yg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a3KX4Osv; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a3KX4Osv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743390835; x=1774926835;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5FwXnqSn3EMcOgz7gFUShwYqXG2zc9WLIJmk5Q8l0ks=;
  b=a3KX4OsvS3PzRjLCwMOorG5I0iUqILdXDF1SdIvIBMNhMptfKjDWtLWc
   xumvxHO9TSq4bL/W8YCZA8UJYTj5pzeUQCxj/JhwErvKhZiAhuSSWMrQW
   KDVL6yd77DamkEhyGsxuSjDqL1Qf4D2TfBUZDaKPVGzAxPUUgevtCFKta
   LA/j7tbJdpG/AJIwahDA8ORPllSpUsBOJviD4Ff8OHtswmLppc/tc9CVA
   v4oOMODphyyjhs3cgFvmMcjMR9rdBUPJUh4+Vu0u+AX+CjyMnAkv4w9TX
   PpIUsfTqJUAuSSHRBUjCjpmGQJ9Z++96dmwXD5F9HnKNo2VUL4xIoQXyF
   g==;
X-CSE-ConnectionGUID: KhVzNKk8TGWnGLJK47jTrA==
X-CSE-MsgGUID: QxMgSAZdS7+Dq8JHUio6iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11389"; a="67147834"
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="67147834"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2025 20:13:53 -0700
X-CSE-ConnectionGUID: 1LxGvEwqQQKlaRAztnIqdQ==
X-CSE-MsgGUID: 1F/d7sRxRaCNW1MiEYRTZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,289,1736841600"; 
   d="scan'208";a="126214212"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 30 Mar 2025 20:13:52 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tz5aw-00090Y-0D;
	Mon, 31 Mar 2025 03:13:50 +0000
Date: Mon, 31 Mar 2025 11:13:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202503311140.R7DpzkNH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   5b56c883c34a890a3f9ca7baa8aea426538c88a8
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [1365/1365] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250331/202503311140.R7DpzkNH-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503311140.R7DpzkNH-lkp@intel.com/

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
