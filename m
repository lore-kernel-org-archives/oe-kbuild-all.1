Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F314014AD2B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 23 Mar 2025 05:26:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742707595; cv=none; b=mj6cAdfLY1jkZWKO5iXWJQR+akbzepWod0ePcLcUzQM6R5eKJ0GBAwLHR2IpC+KLGsuvx3dcR6kXHztH5WQtQYwPJX+P5BabI8MhL07CQwhwjcXY1TtluTJ6olmqBLTa7ZWztnv5PUHbp0/bqjTiFHwwXE8dY/KOJL/9HNiIcy8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742707595; c=relaxed/simple;
	bh=lFlTgbG+EAl4wrjMWIk5/GuFPb1iR5JmTVn+Pkqs6Og=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eTM3B+s3Qwn5NNL5ETA5rIKfeAJ7uQ29tAomwwa86Ma15MxsZRB/glBjBAAYgF8z/4k63bZOi9H6Nc+bNZuqPpwDhbhq8s8Wc9hRvh/+fec2W2fwChsReIs9E4Vqu1kzYbmZKR1d18uEc0MxQe0U35WnG/IYfF+TYlvVi7GKF2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vfk/SCgZ; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vfk/SCgZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742707593; x=1774243593;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lFlTgbG+EAl4wrjMWIk5/GuFPb1iR5JmTVn+Pkqs6Og=;
  b=Vfk/SCgZCyCfnnU84RlPgR5gL6E614CgWC+QBWsb7y0kMGNV7GBkx6Nq
   ZTYFzBGEk58bFFi3sMxjLoLPQUNzrDVu4lbw03bLHMZAKxvylZeTfL7bh
   gn2Bj5qLCYzBU0QxBlPusrzyIuv8xP1WL8mRUj3sCfpQ1ALl8Ly/c/hey
   5QruYsXrWBoFY556o1AH5RJGFA1X+dHLSs0SBuYBkj/cp5Xm4aP4UZrUS
   loGNwjGLWXB0Y53PxNIMm6Kh96XFrPP50ADMJXg5t2ql2WDdrqiWMfhpl
   xiY4rHV4uiEu6YiD2MTajjsBe79lXiL4MZ7u7KdvyCSK3T3LfXqL3sfd6
   w==;
X-CSE-ConnectionGUID: NzmLhKonRfKsp8nI2Co+Iw==
X-CSE-MsgGUID: Zc3+6cVPQCGZlwm3U4d2Jg==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="66395646"
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="66395646"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 22:26:32 -0700
X-CSE-ConnectionGUID: YdZ9HuPdShajvP5KvPdEgQ==
X-CSE-MsgGUID: LJ3NcaH9S5ykTWzAkfDfXA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,269,1736841600"; 
   d="scan'208";a="154758865"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 22 Mar 2025 22:26:31 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1twDqv-0002bz-17;
	Sun, 23 Mar 2025 05:26:29 +0000
Date: Sun, 23 Mar 2025 13:25:53 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1365/1365]
 drivers/acpi/cppc_acpi.c:614:3-8: WARNING: NULL check before some freeing
 functions is not needed.
Message-ID: <202503231359.qdyINbl7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   abf385ef625e6aeb4923da42fef9ebce788f4ecf
commit: b8815fbbe89b0d15fa3296c3e57d2197a92f5bc0 [1365/1365] ACPI: CPPC: Fix cppc_cpufreq_init failed in CPU Hotplug situation
config: x86_64-randconfig-102-20250103 (https://download.01.org/0day-ci/archive/20250323/202503231359.qdyINbl7-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503231359.qdyINbl7-lkp@intel.com/

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
