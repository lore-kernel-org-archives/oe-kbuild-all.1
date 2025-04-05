Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C583224D7
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Apr 2025 03:25:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743823538; cv=none; b=IOglrtV1UzS+3DO9oROMIe9iSwZ8c+1o5mnm9jWX9OLe5aLLSYRkYcFcbYwDGM2jM5oEjInQhknKV12foY4oYI1E164HjBsPG5rlf96j47Kpl7topeEOgErTLY7vPEtzrVUAR0T/ZhhL/tu6NxsheID2Qs10C3yEMcqdqqQpj2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743823538; c=relaxed/simple;
	bh=gI4cA6AaH+hsBlruzuA/BR8eY2Fv0/32g/w2x7PR9eE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AYWGZV0B1SvT2pUmhIvYx8IjDq4pYu0qzg4Ygt2O8YP0Fm5zaIu1dYISd5Q8gfsh5P4mqlTv+wRnphKJnp6WQFdJ3e7ohiAW5i26BItA/966OYfCg6VJNL0Psmtb5oflll0gN61pzmdEiZBddULQjkVFfqO2g/kUVw1fhMjQuJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GiXt8/Pn; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GiXt8/Pn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743823536; x=1775359536;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gI4cA6AaH+hsBlruzuA/BR8eY2Fv0/32g/w2x7PR9eE=;
  b=GiXt8/PnUxxyDE+ws81PtIg/K0btYQM0AtRxhwq9WjVbzzoHPe0wmQQK
   bL16U0YTy9FFAPnn0yMFVqC/LE/N3dIvuuPjiwpvF30Twt9/6plXQRHHE
   7ZznoKdqgUXsP45UriDHH2CIWws/fN2KHi/Gk476esk3rMgO+soDSpPTX
   +vw4eUgQoE0MqA9RMfI42rlLEyQNwn+sVs6fDZrKyxMu0A06mY+MDadQ1
   bEcHoZIj3DOITF4jU7oRGLExDRkOuZ7kg79LOuqHFoGTVt7d+y/f7p6Wa
   Qf3qBD1WnDXGQr9mf7ez5RtmkE+ye004dpiJSNzVbprFzQxRB1I87Nf9h
   g==;
X-CSE-ConnectionGUID: BwYmcIxNRQCuHFYtHtCBHA==
X-CSE-MsgGUID: 8oTdAk6OR1GcM6rPfnedWg==
X-IronPort-AV: E=McAfee;i="6700,10204,11394"; a="67750617"
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="67750617"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Apr 2025 20:25:36 -0700
X-CSE-ConnectionGUID: F8wY6gK/R1OB0mCVUhKJ9Q==
X-CSE-MsgGUID: DOSeG4PQQ+GTJ0itbkhH4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,190,1739865600"; 
   d="scan'208";a="128317346"
Received: from lkp-server01.sh.intel.com (HELO b207828170a5) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 04 Apr 2025 20:25:35 -0700
Received: from kbuild by b207828170a5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u0uA0-0001mP-2t;
	Sat, 05 Apr 2025 03:25:32 +0000
Date: Sat, 5 Apr 2025 11:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 44/44]
 drivers/hid/i2c-hid/i2c-hid-acpi.c:104:6: sparse: sparse: symbol
 'init_i2c_hid_acpi_probe_quirks' was not declared. Should it be static?
Message-ID: <202504051158.iBrA6SaH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   122a759d23dc4d66a1cfacabee4c4f0899fa9961
commit: 3a335beff4d27defe6b75e0895f7a5aa37f2acaf [44/44] HACK: CHROMIUM: HID: i2c-hid: acpi: add acpi quriks for HX83121 on meliks
config: i386-randconfig-061-20250405 (https://download.01.org/0day-ci/archive/20250405/202504051158.iBrA6SaH-lkp@intel.com/config)
compiler: clang version 20.1.2 (https://github.com/llvm/llvm-project 58df0ef89dd64126512e4ee27b4ac3fd8ddf6247)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250405/202504051158.iBrA6SaH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504051158.iBrA6SaH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/hid/i2c-hid/i2c-hid-acpi.c:104:6: sparse: sparse: symbol 'init_i2c_hid_acpi_probe_quirks' was not declared. Should it be static?

vim +/init_i2c_hid_acpi_probe_quirks +104 drivers/hid/i2c-hid/i2c-hid-acpi.c

   103	
 > 104	void init_i2c_hid_acpi_probe_quirks(struct i2c_hid_acpi *ihid_acpi)
   105	{
   106		const struct dmi_system_id *system_id =
   107				dmi_first_match(i2c_hid_acpi_dmi_quirks);
   108		struct acpi_device *adev = ihid_acpi->adev;
   109		acpi_handle handle = acpi_device_handle(adev);
   110	
   111		if (system_id) {
   112			if (acpi_match_device_ids(adev, i2c_hid_acpi_extra_delay_devices) == 0) {
   113				acpi_handle_debug(handle, "Start Extra Power Up delay\n");
   114				msleep(1000);
   115				acpi_handle_debug(handle, "End Extra Power Up delay\n");
   116			}
   117		}
   118	}
   119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
