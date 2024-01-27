Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2413011C86
	for <oe-kbuild-all@lists.linux.dev>; Sat, 27 Jan 2024 12:44:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706359498; cv=none; b=JZd3TVrrnWjnHZYXz+yNkMM78A5I+cDq35bi8tx/6ATt4pfBuMDhOPOEU40FblLL0w0AcVNmi9tumZGjdvcgZgjfEHRf76Qqyd+2k+0hDVDd/occAwa89Xa73NSHWxqVFNo9ETuSdwiBgz6QEko43Tu3qn/L+iS8PWcz/p317R0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706359498; c=relaxed/simple;
	bh=FKc4KPeMZq3SMvuQe2iwI4+XiVhOdBneszbP3ef+FNM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KPIFooVv8TBDnoNFBGXzCuBu9SOcOE9QRYADoey2rKKQHRWim6y92Dgo/k96RIdZWq2j3lCQBMFdqropT8CiqWLoARdVL3EKmTHzsyVvxseLjtaxGGnuc+jxuX//377YgGDxXyAWRAHLj3BjrYc4Dh67YCbgU8nlEP2rALIfmNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hpCA9yo7; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hpCA9yo7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706359495; x=1737895495;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FKc4KPeMZq3SMvuQe2iwI4+XiVhOdBneszbP3ef+FNM=;
  b=hpCA9yo7nFhrT5P22XD8qo2iJAz+8zbna1fAm9SA0HiYiz/3oryQD21I
   RYHutw3EWzU5B1ASc6w0fua2hE8ynquPAXE7vusirAh3s+9YPO7R79VOo
   oKu4WFjGJXQ2MmJ2f9pby4WJ4j2+RLcjiTHLlwf8fmW5sY1eZXnNb5lxI
   478gD21qeW0X3SSeHrByBbkXsa1Evgt+obnp1jOybOFYqy/Um+ak4KM2R
   HUJw/DIZWekifhUpgy4d8tPnihTNA9zoMII4a5hmlKfam98+yMWgx98CD
   VVPI6SUOmZGv2WEt5ESV+AQBHEkpLLhcvtV7FArXnIpx2b7ifj4oAGmYA
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10964"; a="9791556"
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="9791556"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Jan 2024 04:44:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,220,1701158400"; 
   d="scan'208";a="2854684"
Received: from lkp-server01.sh.intel.com (HELO 370188f8dc87) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Jan 2024 04:44:53 -0800
Received: from kbuild by 370188f8dc87 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rTi3H-0002Jw-0U;
	Sat, 27 Jan 2024 12:44:51 +0000
Date: Sat, 27 Jan 2024 20:44:46 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 21291/21579]
 drivers/spi/spi-phytium-plat.c:192:36: warning: 'phytium_spi_acpi_match'
 defined but not used
Message-ID: <202401272041.NCqS8joD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   acf72db532a7791fde53af3dc7b4d0a6adcf6eff
commit: e8483fcd43fc1dbb8d21bb7eacce804cbab6a7c6 [21291/21579] spi: add phytium spi support
config: arm64-randconfig-002-20240125 (https://download.01.org/0day-ci/archive/20240127/202401272041.NCqS8joD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240127/202401272041.NCqS8joD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401272041.NCqS8joD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/spi/spi-phytium-plat.c:192:36: warning: 'phytium_spi_acpi_match' defined but not used [-Wunused-const-variable=]
     192 | static const struct acpi_device_id phytium_spi_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~


vim +/phytium_spi_acpi_match +192 drivers/spi/spi-phytium-plat.c

   191	
 > 192	static const struct acpi_device_id phytium_spi_acpi_match[] = {
   193		{"PHYT000E", 0},
   194		{}
   195	};
   196	MODULE_DEVICE_TABLE(acpi, phytium_spi_acpi_match);
   197	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
