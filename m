Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51FC725E469
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Mar 2026 05:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772862768; cv=none; b=Oy7RtWdZrlbalftOYcXBNvbElyV4x0S3aVE0FayxEXmEKVejZ4oAEcV8TqmUL1Np5jEHUeKHVrk59SQqkDERjKlJXJPtWyD/7IdIXHySeXM8buzG5K9oc7uDv5u9hRZoJozECR7vFAHylApXmTGlYFZu3c8HMZmsBH+GCQ7B1OY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772862768; c=relaxed/simple;
	bh=e9kHsnE0faefIHaS16TNq69SGMXXUXhYosrXLsoNUac=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lP4Zi99VHQyVdF4e4idLPDW3gQBK/vN5i8bp8iPCOhPoiq0JrFwZeoH9rT6reISgQJkb+pDvr4DV765cqtGLJ2gw00aiRQ2gQdOa49u7LZ3L98nkGBXbVslRcego1Hvl5tAg9B/hn0M9Rmw3tflRZtcfqECMtvSseEJ+8aqYyGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hls3My9w; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hls3My9w"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772862767; x=1804398767;
  h=date:from:to:cc:subject:message-id;
  bh=e9kHsnE0faefIHaS16TNq69SGMXXUXhYosrXLsoNUac=;
  b=hls3My9wTktLjq6uQmiTRYSxZB6UEFnBq3Z79d5lFal/X/zB4MZ9MjIx
   J1EgMmOpFqtEQRGLkvDXwCjMpx+yMrKgAushDElhWP139CDSUOQ3eW8Bj
   ly3BBpIhYHK+LsoZmtK2AomXNWX6mM3LWvWRlGhRb5w5DJUDgX+wf0Fs4
   gF+XY0aavK9gENtQ01m/t94mvF1/TiOi/7bV3WZ/yqi3F3wZ0D7iJH6pL
   AIEGatqJeidwF3mgQB2UMpTtqIxC7yvtboOxo4/Bi0MHc7YkmvkBGpoxy
   ZxmHTrCHWobH5PdJDuul+Jul+gCA8+4Rlepg2zqB2V5doyBbh0y5W3e8A
   w==;
X-CSE-ConnectionGUID: yzxQkZ1aSTaVrPIyMY+PgA==
X-CSE-MsgGUID: BCAWOt+JQCuCMAMoNZCCzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11721"; a="73871413"
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="73871413"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Mar 2026 21:52:46 -0800
X-CSE-ConnectionGUID: Yrz9po5FT1iZnVSOZm/qnQ==
X-CSE-MsgGUID: nyOmS3RNSXiAynWB5ZC+Jw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,106,1770624000"; 
   d="scan'208";a="223693120"
Received: from lkp-server01.sh.intel.com (HELO 058beb05654c) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 06 Mar 2026 21:52:45 -0800
Received: from kbuild by 058beb05654c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vykag-000000001kD-2IaW;
	Sat, 07 Mar 2026 05:52:42 +0000
Date: Sat, 07 Mar 2026 13:51:44 +0800
From: kernel test robot <lkp@intel.com>
To: Khai Wen Ng <khai.wen.ng@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, "sys_oak" <sys_oak@intel.com>,
 "Yew, Chang Ching" <chang.ching.yew@intel.com>
Subject: [acrn:6.17/linux 3121/3134]
 drivers/i2c/i2c-core-acpi.c:321:1: error: label at end of compound statement
Message-ID: <202603071342.3StYPDF8-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/projectacrn/acrn-kernel 6.17/linux
head:   d2ae39d099178698dc32d2165a32f4d6d13d107b
commit: f5ccdd6257bea670f612e8bdabe5052d698dd031 [3121/3134] i2c: i2c-core-acpi: clear dependency for MUX or ATR adapters
config: arm64-randconfig-004-20260307 (https://download.01.org/0day-ci/archive/20260307/202603071342.3StYPDF8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260307/202603071342.3StYPDF8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603071342.3StYPDF8-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/i2c/i2c-core-acpi.c: In function 'i2c_acpi_register_device':
>> drivers/i2c/i2c-core-acpi.c:321:1: error: label at end of compound statement
    err:
    ^~~


vim +321 drivers/i2c/i2c-core-acpi.c

   276	
   277	static void i2c_acpi_register_device(struct i2c_adapter *adapter,
   278					     struct acpi_device *adev,
   279					     struct i2c_board_info *info)
   280	{
   281		/*
   282		 * Skip registration on boards where the ACPI tables are
   283		 * known to contain bogus I2C devices.
   284		 */
   285		if (acpi_quirk_skip_i2c_client_enumeration(adev))
   286			return;
   287	
   288		/* Check if Device is on ATR or MUX adapter */
   289		if (adapter->is_atr || adapter->is_mux) {
   290			u32 channel;
   291	
   292			if (fwnode_property_present(&adev->fwnode, "channel")) {
   293				if (fwnode_property_read_u32(&adev->fwnode, "channel", &channel)) {
   294					dev_err(&adev->dev, "failed to read channel property\n");
   295					return;
   296				}
   297	
   298				if (adapter->chan_id != channel) {
   299					dev_err(&adev->dev, "device is not on current adapter %d\n",
   300						adapter->chan_id);
   301					goto err;
   302				} else {
   303					acpi_dev_clear_dependencies(ACPI_COMPANION(adapter->dev.parent));
   304				}
   305	
   306				if (adev->dep_unmet) {
   307					dev_err(&adev->dev, "device has unmet dependencies\n");
   308					return;
   309				}
   310			} else {
   311				dev_err(&adev->dev, "channel property not present\n");
   312				return;
   313			}
   314		}
   315	
   316		adev->power.flags.ignore_parent = true;
   317		acpi_device_set_enumerated(adev);
   318	
   319		if (IS_ERR(i2c_new_client_device(adapter, info)))
   320			adev->power.flags.ignore_parent = false;
 > 321	err:
   322	}
   323	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
