Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F06F3B3BEC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 31 Aug 2026 04:22:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788150143; cv=none; b=OD9wRQKY5oV7foz4ztY0ZYTZLwH0QseR35w7eqmbet0mE2q7/x+T4pbteifu3Hng7F4Im+abvAoXCtWJYtR6luDSIKy+3lF3Hms4b0Cb1YQgq4mjjllIfigSDkP57uEqDuM1RMKtSpllWru+1bsSkbnkIEsp/jeLR246RTyhkSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788150143; c=relaxed/simple;
	bh=nbOvqVns6tW81D+BtPxFkFw+PNuepHL7TO/U3ysQrS8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OazD3l7LGeYkVQC9R6+MyqQ7iLaDj0i0mPALxRzk0pSLln8r0Ly5AAUkNvFkKzYcGyrFSmB2HyPNobe58yT9bhaecudOz2D3B78MkKfxAyqgTCyG6E0shcRMjkTzYl76FDfiS/UsZG4XQ5q1WNBsJ7p8ZQ0Uu0nxLgjTh5GdP8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lq2ZOY0O; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lq2ZOY0O"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788150140; x=1819686140;
  h=date:from:to:cc:subject:message-id;
  bh=nbOvqVns6tW81D+BtPxFkFw+PNuepHL7TO/U3ysQrS8=;
  b=lq2ZOY0O4bg+ZtZNE2qQqJD95hfTvTOEDZpwjBqbXbS7WFuOn/GbaGx2
   stwhvIgu6PQSR30am8EZ4nndvkcCEEx7ZwBpo5kOLAGz8UeCbUw6YSC3r
   ad5WTxYGH6VS6GvdiHga7am88+D5ihUBcj3I3uMxDG62UO1Igr47YxcuG
   +rdJeb1u/zJSb15SSXXeRRAEImJV98eZmcDqsEy1UWP4oM8rDC8ypoz4k
   YdaYKNL+RXgTtdfZoGLaSXoQm6K9wBOKY6SAztjCzHMNIiykjtcWD7n0j
   Kgo9IH1FTC796ziYDYwuhF6JZWuQogxRmxgQy9cjyqPj84+pX3m89IFth
   A==;
X-CSE-ConnectionGUID: xIT/myR9RwGeZVfqU7wOzg==
X-CSE-MsgGUID: bDiYEoUASOeB/XwtKsD6sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11891"; a="99707762"
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="99707762"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2026 21:22:19 -0700
X-CSE-ConnectionGUID: PkMJ0D5pRx2FevW7Umuumg==
X-CSE-MsgGUID: vBJfyng5RK6X2aiGro+vDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,252,1779174000"; 
   d="scan'208";a="264939054"
Received: from igk-lkp-server01.igk.intel.com (HELO 32268bdb9915) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 30 Aug 2026 21:22:18 -0700
Received: from kbuild by 32268bdb9915 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x0tXE-000000000OT-283A;
	Mon, 31 Aug 2026 04:22:16 +0000
Date: Mon, 31 Aug 2026 06:22:10 +0200
From: kernel test robot <lkp@intel.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [groeck-staging:hwmon-next 18/32]
 drivers/hwmon/hwmon.c:321:13: warning: 'is_hwmon_device' defined but not used
Message-ID: <202608310633.tZeEG9Yn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-staging.git hwmon-next
head:   6d28113b5ea75542b72d9f73ab9aaf0d0a49a104
commit: 40b20f8e6b53ea701f250fe2d3cac82e07c18468 [18/32] hwmon: Ensure that 'dev' passed to hwmon_notify_event() is a hwmon device
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260831/202608310633.tZeEG9Yn-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260831/202608310633.tZeEG9Yn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608310633.tZeEG9Yn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/hwmon/hwmon.c:344:13: error: redefinition of 'is_hwmon_device'
     344 | static bool is_hwmon_device(struct device *dev)
         |             ^~~~~~~~~~~~~~~
   drivers/hwmon/hwmon.c:321:13: note: previous definition of 'is_hwmon_device' with type 'bool(struct device *)' {aka '_Bool(struct device *)'}
     321 | static bool is_hwmon_device(struct device *dev)
         |             ^~~~~~~~~~~~~~~
>> drivers/hwmon/hwmon.c:321:13: warning: 'is_hwmon_device' defined but not used [-Wunused-function]


vim +/is_hwmon_device +321 drivers/hwmon/hwmon.c

61b8ab2c5481dc4 Nicolin Chen  2018-10-09  320  
a40a97b27cd6bd8 Guenter Roeck 2026-08-20 @321  static bool is_hwmon_device(struct device *dev)
a40a97b27cd6bd8 Guenter Roeck 2026-08-20  322  {
a40a97b27cd6bd8 Guenter Roeck 2026-08-20  323  	return dev->class == &hwmon_class;
a40a97b27cd6bd8 Guenter Roeck 2026-08-20  324  }
a40a97b27cd6bd8 Guenter Roeck 2026-08-20  325  

:::::: The code at line 321 was first introduced by commit
:::::: a40a97b27cd6bd8465937439418964468f784bc4 hwmon: Ensure that 'dev' passed to hwmon_notify_event() is a hwmon device

:::::: TO: Guenter Roeck <linux@roeck-us.net>
:::::: CC: Guenter Roeck <linux@roeck-us.net>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
