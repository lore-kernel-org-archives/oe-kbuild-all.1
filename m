Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CB3E14A4CF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 20:38:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718397505; cv=none; b=KsIFv06xusmF9HCS+aqtyk3cG/IK9BxNNFnZh5QOh9YGYv5/L2MLBWqli6eY376ZA/+X8crvQYoDOkPu46JUqzr4eQt/N7u9yb5VyXAywaRxhzL1ObngDqpaHl3513YH8CKaQKrEZBZTket1joJ70TkyPiIMnLqn+9f15Rm9QRY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718397505; c=relaxed/simple;
	bh=170vrWOA80bzy5FSDk3vda8JzfY1waqn58ALzdxQIOI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jiBLrD5RS3XXSlj7MH0MtHyRgzs1o5Pg3hNsYdgCWjyoSdJpdgOX4GOywZv9Df54PzQv9RJrK76yLUp07HoQ8UrVNBc6FcCn0UVtTarsaPbOmdR2yROXGMJCKeEyddASpRXOYlR4XEgbPCZzSZ510RuWRnFlSWkpAUayf1A8Ze0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PlETLwXB; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PlETLwXB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718397504; x=1749933504;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=170vrWOA80bzy5FSDk3vda8JzfY1waqn58ALzdxQIOI=;
  b=PlETLwXBkrYE5WeeMQa3e3OW2/nWx0giDMckTXCfU6WSmNiSXSsDUmgz
   qIigpGgwjurukyJyDONLEA42H7Y1RUy1GNvzg48G61HwLXPeRspWfZazz
   wOWXm4BwJ3rXJodUdqdfTt5sWUA78NmRNFYrph6moL1Ni+OvV7XTg3NrP
   3+IzQ7jg3PA1ayPV2U5KBQ9Bqkz3yWVGnxYdOYTNRLJ0nXnbodaU/7nOS
   4s/QZC8GEwaeHS0wOS6Aoo86zHmBWmHOfuHO+NMhBNtwyboJsgjLsPn+u
   mNHjQdZPo1bJ8d3MbYu+kQ8rZ+Bgxm+XcWiHj8/Hl70fqgtsPKGgyMgEs
   g==;
X-CSE-ConnectionGUID: YGN6UGXDTV+bLj5gRWJcSg==
X-CSE-MsgGUID: mA6uMPQ6TuitvSAKs2YM3w==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="25983128"
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="25983128"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 13:38:23 -0700
X-CSE-ConnectionGUID: PD/PLOAwR+uDiUI8tuw96w==
X-CSE-MsgGUID: yiqekueFSCenqUdz4llAaQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,238,1712646000"; 
   d="scan'208";a="71385982"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 14 Jun 2024 13:38:22 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIDgh-0001m1-1i;
	Fri, 14 Jun 2024 20:38:19 +0000
Date: Sat, 15 Jun 2024 04:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: Steve Jeong <steve@how2flow.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [tobetter:odroid-6.1.y 2/3]
 arch/arm64/boot/dts/rockchip/overlays/odroidm1s/spi0.dts:14.5-15: Warning
 (reg_format): /fragment@0/__overlay__/spidev@0:reg: property has invalid
 length (4 bytes) (#address-cells == 2, #size-cells == 1)
Message-ID: <202406150439.CK7CZwUg-lkp@intel.com>
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
commit: 0f614ed2754bf0e21ab57ae4e6eb5be46893a4de [2/3] ODROID-M1S: dtb/dtbo: Add odroidm1s basic alt dtb overlays
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240615/202406150439.CK7CZwUg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406150439.CK7CZwUg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406150439.CK7CZwUg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/overlays/odroidm1s/spi0.dts:14.5-15: Warning (reg_format): /fragment@0/__overlay__/spidev@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlays/odroidm1s/spi0.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1s/spi0.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1s/spi0.dtbo: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1s/spi0.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1s/spi0.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/rockchip/overlays/odroidm1s/spi0.dts:11.21-16.6: Warning (avoid_default_addr_size): /fragment@0/__overlay__/spidev@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/rockchip/overlays/odroidm1s/spi0.dts:11.21-16.6: Warning (avoid_default_addr_size): /fragment@0/__overlay__/spidev@0: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlays/odroidm1s/spi0.dtbo: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1s/spi0.dtbo: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'

vim +14 arch/arm64/boot/dts/rockchip/overlays/odroidm1s/spi0.dts

     3	
     4	/ {
     5		fragment@0 {
     6			target = <&spi1>;
     7	
     8			__overlay__ {
     9				status = "okay";
    10	
  > 11				spidev: spidev@0 {
    12					status = "okay";
    13					compatible = "odroid,spi-dev";
  > 14					reg = <0>;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
