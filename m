Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E90524F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 14:05:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736172304; cv=none; b=sCqWdQnsMe8ZChw9S5T/ob+W3xx9tnTuVsFNGtK6JY/XFiKRkS8d9Mmg7/ZxFYtqkt5UmMPV9XTArnRHiq1yIyTo7jUqmEJLHffAxLpOUvgzZi2wUXFIGEToPc2KS4jYMleElN214/TMxj3GxgpbI7VCe9rVdVmGobAgW/TWUFc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736172304; c=relaxed/simple;
	bh=SZ67gmYiLmVfAFRqnBlOaonsqhStwKP6R00An2AFlmg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b3dcaDjvJBZm5ipVIHlwq/QsfVmp1Cca1tOV1lBhPzdctHA6p/bUXpwtsi6Nj5GNM0k6P90fO4BxZ5bLhCFxYB1SwZ+/AyVC/bNIJX5KOjh0FkdiVH9ffL6CDFWrTCeSb16Z598ozpAkgYFtUYbFhOG+FHGcw14CXLIxWY2LNSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dIY41AbL; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dIY41AbL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736172303; x=1767708303;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SZ67gmYiLmVfAFRqnBlOaonsqhStwKP6R00An2AFlmg=;
  b=dIY41AbLu9NYvw+iriUHIThNg0CYTyyXh84HkENO7trQJMnnxz6sg3nM
   VqBFd6gE1+P7+1VNh/9WTqKCBiFTWWbjD1PyOzPc/HWiuNXgB75+qKvjn
   MAVkP/xT2ZcEeG8uuOgPf55MZy7UmRJnEEiYmDFpewvE2T7A9XXSijrWx
   ffR47sP11vhtUfR7YCEXtd6yfUbZf43GQ3eqs7Jz4Td1/WbsaysWnj6R5
   9jmjVzVOhSSYfIwv2umFYKA8PQh5JBzUcfj7Or7nkcTeG5x8AZYx/ugz+
   rv2CsoCsj3xcE4qzK/F55Fn/Dsxrfd+8xgnECHr2K90gk6q1LACeIA85c
   Q==;
X-CSE-ConnectionGUID: 2kRun6V2RPeYkyrfG81upA==
X-CSE-MsgGUID: oV5NVbE2TzuuuMJdU/43YA==
X-IronPort-AV: E=McAfee;i="6700,10204,11307"; a="61694185"
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="61694185"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Jan 2025 06:05:03 -0800
X-CSE-ConnectionGUID: QR/sBIcnSFWMCnI5tMSx9g==
X-CSE-MsgGUID: 2E0rJ39cSk25VwEsBbb/Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,292,1728975600"; 
   d="scan'208";a="102340819"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 06 Jan 2025 06:05:01 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUnj1-000CgF-1F;
	Mon, 06 Jan 2025 14:04:59 +0000
Date: Mon, 6 Jan 2025 22:04:01 +0800
From: kernel test robot <lkp@intel.com>
To: jason.zeng@intel.com, lin.x.wang@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bytedance:5.15-velinux 17859/25291] drivers/acpi/arm64/apmt.c:74:
 warning: Function parameter or member 'fwnode' not described in
 'apmt_add_platform_device'
Message-ID: <202501062155.bf0zQWNT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/bytedance/kernel.git 5.15-velinux
head:   272d9bd3d7e15bb1ad1efac12d9921350f961339
commit: 95f431f2d4ee840cbd09e2f047198df937805194 [17859/25291] ACPI: ARM Performance Monitoring Unit Table (APMT) initial support
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250106/202501062155.bf0zQWNT-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250106/202501062155.bf0zQWNT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501062155.bf0zQWNT-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/acpi/arm64/apmt.c:74: warning: Function parameter or member 'fwnode' not described in 'apmt_add_platform_device'


vim +74 drivers/acpi/arm64/apmt.c

    65	
    66	/**
    67	 * apmt_add_platform_device() - Allocate a platform device for APMT node
    68	 * @node: Pointer to device ACPI APMT node
    69	 *
    70	 * Returns: 0 on success, <0 failure
    71	 */
    72	static int __init apmt_add_platform_device(struct acpi_apmt_node *node,
    73								struct fwnode_handle *fwnode)
  > 74	{
    75		struct platform_device *pdev;
    76		int ret, count;
    77		struct resource res[DEV_MAX_RESOURCE_COUNT];
    78	
    79		pdev = platform_device_alloc(DEV_NAME, PLATFORM_DEVID_AUTO);
    80		if (!pdev)
    81			return -ENOMEM;
    82	
    83		memset(res, 0, sizeof(res));
    84	
    85		count = apmt_init_resources(res, node);
    86	
    87		ret = platform_device_add_resources(pdev, res, count);
    88		if (ret)
    89			goto dev_put;
    90	
    91		/*
    92		 * Add a copy of APMT node pointer to platform_data to be used to
    93		 * retrieve APMT data information.
    94		 */
    95		ret = platform_device_add_data(pdev, &node, sizeof(node));
    96		if (ret)
    97			goto dev_put;
    98	
    99		pdev->dev.fwnode = fwnode;
   100	
   101		ret = platform_device_add(pdev);
   102	
   103		if (ret)
   104			goto dev_put;
   105	
   106		return 0;
   107	
   108	dev_put:
   109		platform_device_put(pdev);
   110	
   111		return ret;
   112	}
   113	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
