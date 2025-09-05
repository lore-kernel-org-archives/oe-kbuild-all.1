Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F47525DB0D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Sep 2025 22:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757109640; cv=none; b=TfYtrheO8HRvvFIWU5Q8Ko97DvwJTXSNuxjYJXFKp7gbu8J0uBekqPcWeoRpqDHqaJ5ieA5tdJY/zngNGMz4DpQPfodHoVRBKkOIiL0XOL9mrLjRE2bHRuVOBP0Nvoz7aoVjQLcIdkOPhDTZaGTGBNzwvHPv7VyG7KbWhcL/3ec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757109640; c=relaxed/simple;
	bh=iE5RF/Y8ntpm69UQwjaEOWcjC2y+XkFnCLAiOAbz9tE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jFWlEKekucztb+JkWbE0tSKa3UOQxLv8H7gaT0KgvLgkIa0UmzAoxmGKTJfhRCHwg40z2e1xmtAdkoxJgc5i02PXAWif4hgf6GdESF1TD+4hog61daVFpnOkw0jZPnrCpCD/2bp8YAihIwSDEInyWTcNIxg+PJNyvWAlwHQskHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PwIfP3sD; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PwIfP3sD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1757109639; x=1788645639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iE5RF/Y8ntpm69UQwjaEOWcjC2y+XkFnCLAiOAbz9tE=;
  b=PwIfP3sDNWzA+vY/uciJjl7A/2LLGQ0NmEUzVXDkCAU7mW0w4I398a0g
   nro6EzfARsMB1MAjQ7CPnX/hMpjDTq3CzM7wYINM23PF6xyVNXRB373h7
   o2TIPi+m1NG1voOFa+FItVW5ixt1UFbmqArjrSdynE0t3r3/VyY42C0ez
   bl0DvMQ7W461vLaEuSYLa7TVcb8b+f1D8ZNQd+FXB6qWq93OaIj906xV7
   jKhI4tfJaVeqkbBip4bTWMQUQKY3e/QPXIaJc6HzcWKdo2SXJzDxb+rrG
   8dPUYBVmHGbeZ3QIsMAnUw1MOEVNplnHfpp6oL83U0vsngHZ5WNyMSdEj
   Q==;
X-CSE-ConnectionGUID: yiJbCjaFTgWiSP2SOXWHrQ==
X-CSE-MsgGUID: 70ceF1P7RtSs1o9y6whklg==
X-IronPort-AV: E=McAfee;i="6800,10657,11544"; a="70561657"
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="70561657"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Sep 2025 15:00:39 -0700
X-CSE-ConnectionGUID: tn2hcK3+S12rjr6Y/PWPBw==
X-CSE-MsgGUID: iPHRCuQeTRemBKrG+cjXBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,242,1751266800"; 
   d="scan'208";a="203191843"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by fmviesa001.fm.intel.com with ESMTP; 05 Sep 2025 15:00:37 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uueTz-00043r-1D;
	Fri, 05 Sep 2025 22:00:35 +0000
Date: Sat, 6 Sep 2025 00:00:11 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-5.4 2/2]
 arch/arm/boot/dts/bcm47189-luxul-xap-1440.dtb: Warning (pci_device_reg):
 Failed prerequisite 'reg_format'
Message-ID: <202509052352.UESbBuj8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-5.4
head:   dd8b17eff1686a86f89b06958f1dd4488b1b7d85
commit: 69d9fb39480c990e88e77a43df69e1e4703b16e2 [2/2] ARM: dts: BCM53573: Fix Ethernet info for Luxul devices
config: arm-randconfig-2052-20250827 (https://download.01.org/0day-ci/archive/20250905/202509052352.UESbBuj8-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
dtschema version: 2025.8
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250905/202509052352.UESbBuj8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509052352.UESbBuj8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts:57.4-14: Warning (reg_format): /axi@18000000/ethernet@5000/mdio/ethernet-phy@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm/boot/dts/bcm47189-luxul-xap-1440.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm/boot/dts/bcm47189-luxul-xap-1440.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm/boot/dts/bcm47189-luxul-xap-1440.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm/boot/dts/bcm47189-luxul-xap-1440.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm/boot/dts/bcm47189-luxul-xap-1440.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts:56.29-58.5: Warning (avoid_default_addr_size): /axi@18000000/ethernet@5000/mdio/ethernet-phy@0: Relying on default #address-cells value
   arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts:56.29-58.5: Warning (avoid_default_addr_size): /axi@18000000/ethernet@5000/mdio/ethernet-phy@0: Relying on default #size-cells value
>> arch/arm/boot/dts/bcm47189-luxul-xap-1440.dtb: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm/boot/dts/bcm47189-luxul-xap-1440.dtb: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'
--
   arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts:57.4-14: Warning (reg_format): /axi@18000000/ethernet@5000/mdio/ethernet-phy@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm/boot/dts/bcm47189-luxul-xap-1440.dt.yaml: Warning (pci_device_reg): Failed prerequisite 'reg_format'
>> arch/arm/boot/dts/bcm47189-luxul-xap-1440.dt.yaml: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
>> arch/arm/boot/dts/bcm47189-luxul-xap-1440.dt.yaml: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm/boot/dts/bcm47189-luxul-xap-1440.dt.yaml: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm/boot/dts/bcm47189-luxul-xap-1440.dt.yaml: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
   arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts:56.29-58.5: Warning (avoid_default_addr_size): /axi@18000000/ethernet@5000/mdio/ethernet-phy@0: Relying on default #address-cells value
   arch/arm/boot/dts/bcm47189-luxul-xap-1440.dts:56.29-58.5: Warning (avoid_default_addr_size): /axi@18000000/ethernet@5000/mdio/ethernet-phy@0: Relying on default #size-cells value
>> arch/arm/boot/dts/bcm47189-luxul-xap-1440.dt.yaml: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
>> arch/arm/boot/dts/bcm47189-luxul-xap-1440.dt.yaml: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
