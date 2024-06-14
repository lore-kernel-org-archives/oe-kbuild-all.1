Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 851B1811FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 12:00:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718366461; cv=none; b=LIWgm7Wl2TDxiUgYsng39NVJao1NDaEhWNcpzwkt4+SN7ll5a6G1wzXGwHU8r6j6ouwHfrmo6Z6fKheINkqRTtlE7I1opKPgSvhzoIex0ObXxO4Kt9nMFgN6WvVwwq/QFUYzJA3V6RQRM8eMIacU+ZIoDEiNPKukdJGSLF+dLr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718366461; c=relaxed/simple;
	bh=M+N8TVgH/9w+04rGCCKZrdvMbiAI1WDDP84fffZv9A8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dq2aTtu55GFvta6MexO4sCtvoyIOOHD17ys069EeLqKOzkfRpC6Oe/NuROh4GIZzLhN5KBwRdGWtrvemEU4UDEThvAHNtiN0vnUKnAEShHReqI0y1z6NWxHaPl20UJZeveu1Ir5Woa4GnXJ74U4o1GQZ3UX8Z5Qw86hgt9ulWfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=JmluhYL9; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JmluhYL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718366459; x=1749902459;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=M+N8TVgH/9w+04rGCCKZrdvMbiAI1WDDP84fffZv9A8=;
  b=JmluhYL9R/qG/zdQ+d+dHQru7t+krfppTYSH9vNd4j5Z6a1Ga2waXQOT
   z9fTrTPtFmy7f5qjuTSx0YEo7lH+rM+ROOxaVyT1zzOSJ9vXR/62Y4FDD
   KSXiNgvm1JWG9O0YRXUiFKpeOHuCLKh+W3W0REwXZmTgO0+PDNE/uUrtX
   JcrgaVNd9aRHI37vjZmWMGnim+3/dLn+b8/6M3i/57sNLlEJGULOIoKEL
   5vTXgnefQX2VfWv9mCUfUsqlYOnJnbmSYDvgXMHoPYt/+WDRT7Kkggusv
   hAvZoZn+yhxIfXa39ScOU4jk0/rBW9je2xKgnc0OsH60Ea9ZZ/RBitO1w
   w==;
X-CSE-ConnectionGUID: IjXG38gETHisbFjCCibYLw==
X-CSE-MsgGUID: LUjJ1qF5QQ6P9hTYfBd00w==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="18168882"
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="18168882"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 05:00:59 -0700
X-CSE-ConnectionGUID: 8KNa9sZ2QdWMz6s1vDBN9Q==
X-CSE-MsgGUID: 9ruEvkm6SJKstooEoD6HWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,237,1712646000"; 
   d="scan'208";a="40446075"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 14 Jun 2024 05:00:58 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sI5c0-0001H9-03;
	Fri, 14 Jun 2024 12:00:56 +0000
Date: Fri, 14 Jun 2024 20:00:35 +0800
From: kernel test robot <lkp@intel.com>
To: Dongjin Kim <tobetter@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.1.y 35/91]
 arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft32.dts:23.5-15: Warning
 (reg_format): /fragment@0/__overlay__/display@0:reg: property has invalid
 length (4 bytes) (#address-cells == 2, #size-cells == 1)
Message-ID: <202406141946.JDuX4t5F-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/tobetter/linux odroid-6.1.y
head:   a50c6922e2b4c1d7c895bde521d13096ba16a863
commit: 77a18fbcbb33a2e3a35988e0c104c5762167645d [35/91] ODROID-N2/C4: arm64/dts: add device tree overlay support
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240614/202406141946.JDuX4t5F-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141946.JDuX4t5F-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141946.JDuX4t5F-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft32.dts:23.5-15: Warning (reg_format): /fragment@0/__overlay__/display@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft32.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft32.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft32.dtbo: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft32.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft32.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft32.dts:16.23-29.6: Warning (avoid_default_addr_size): /fragment@0/__overlay__/display@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft32.dts:16.23-29.6: Warning (avoid_default_addr_size): /fragment@0/__overlay__/display@0: Relying on default #size-cells value
   arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft32.dtbo: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft32.dtbo: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'
--
>> arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft35.dts:23.5-37: Warning (reg_format): /fragment@0/__overlay__/display:reg: property has invalid length (16 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft35.dts:17.21-50.6: Warning (unit_address_vs_reg): /fragment@0/__overlay__/display: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft35.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft35.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft35.dtbo: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft35.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft35.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft35.dts:17.21-50.6: Warning (avoid_default_addr_size): /fragment@0/__overlay__/display: Relying on default #address-cells value
>> arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft35.dts:17.21-50.6: Warning (avoid_default_addr_size): /fragment@0/__overlay__/display: Relying on default #size-cells value
   arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft35.dtbo: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft35.dtbo: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'
--
>> arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft35.dts:23.5-37: Warning (reg_format): /fragment@0/__overlay__/display:reg: property has invalid length (16 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft35.dts:17.21-50.6: Warning (unit_address_vs_reg): /fragment@0/__overlay__/display: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft35.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft35.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft35.dtbo: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft35.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft35.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft35.dts:17.21-50.6: Warning (avoid_default_addr_size): /fragment@0/__overlay__/display: Relying on default #address-cells value
>> arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft35.dts:17.21-50.6: Warning (avoid_default_addr_size): /fragment@0/__overlay__/display: Relying on default #size-cells value
   arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft35.dtbo: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/amlogic/overlays/odroidn2/hktft35.dtbo: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'

vim +23 arch/arm64/boot/dts/amlogic/overlays/odroidc4/hktft32.dts

     6	
     7	/ {
     8		fragment@0 {
     9			target = <&spicc0>;
    10	
    11			__overlay__ {
    12				status = "okay";
    13	
    14				cs-gpios = <&gpio GPIOX_10 GPIO_ACTIVE_LOW>;
    15	
  > 16				display: display@0 {
    17					#address-cells = <0x1>;
    18					#size-cells = <0x0>;
    19	
    20					status = "okay";
    21	
    22					compatible = "hardkernel,hktft32";
  > 23					reg = <0>;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
