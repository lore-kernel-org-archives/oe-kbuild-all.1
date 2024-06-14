Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DE288479
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 04:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718339749; cv=none; b=bT22mZDt+7ckQc5CZT+h/UxmgfvZ0No06ns1szaRnGWglkmpw0CfxkgFaZSHt/gBzS41Oned+qXRmGiOG3Kwn3NR1Nk815B0e6a+amDHFlK445St7nxZYoVt8S+KzIs2QB3ibQiNJKxCeWyqwTUU02dY3lgUn1BsBeknNaDqXiw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718339749; c=relaxed/simple;
	bh=gqg2WHROdhZ4NqBu+wx8/cgTSTN2v3aYZHkdN7I7Ies=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qy7mNbYgzFvf4fp74N7WMkxOxOnS6DTHCDr1i2izvo1ZCF2IwcHjFr8N6V6wPDul5/U+cByYeeUXEzuRL92EfO3+Zdea8GevNUhBl3D3sdN3kBp7GdlPPfxkgaZ66I/JOBtYzT2n+4tz6xXwk0E1qJ1+Z4sMgLpdcxeLNd7Mvkk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eOBJjuUS; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eOBJjuUS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718339747; x=1749875747;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gqg2WHROdhZ4NqBu+wx8/cgTSTN2v3aYZHkdN7I7Ies=;
  b=eOBJjuUS53djDnwfu46sN0qiWOSVUrCF8nu8b4qRxgd89iEFXJw71rj7
   nlnB1occOZoO3lOGV/jSXDIx3PSmLqFFJcU8dO0ug6PGthTHpTNEE7j+q
   7BL8Yi3akJfaYna7AAaXHvRZZUib7PWLB56qVSyZyig+1VJCPQIGgB2CX
   7/YZE3M0/qMjMRqnY4/Ha5d6HZPI8f0dWxbAI3Cmn8StKK/Lo35SAAq/J
   FzEJPMQhzRZODb507xkKs96dKc9ebTYtud1JF4uczzHmo2cz1p5j2Moc6
   G0kyEZ48xCVDK21guxnwFc9vbU5MuFvsBm3kFs7zoxhO40u4tsrs90U46
   A==;
X-CSE-ConnectionGUID: fbnDBoRASoSrWvt/b81O2A==
X-CSE-MsgGUID: pNHQZ57VQkGRo8TRFeakpQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="25884699"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="25884699"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 21:35:38 -0700
X-CSE-ConnectionGUID: JTcmXgUKTIOk3m5Hc9f3NQ==
X-CSE-MsgGUID: dPLqfhc7R7m4sXn19XHoog==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="40872763"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Jun 2024 21:35:35 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHyey-0000p4-1Q;
	Fri, 14 Jun 2024 04:35:32 +0000
Date: Fri, 14 Jun 2024 12:34:57 +0800
From: kernel test robot <lkp@intel.com>
To: "steve.jeong" <jkhpro1003@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-6.1.y 62/91]
 arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dts:16.5-15: Warning
 (reg_format): /fragment@0/__overlay__/spidev@0:reg: property has invalid
 length (4 bytes) (#address-cells == 2, #size-cells == 1)
Message-ID: <202406141215.2TdZyfCc-lkp@intel.com>
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
commit: 0f3e23be0aac626b96e1f5fcee1620c5bcf9b799 [62/91] ODROID-M1: dtb/dtbo: Add spi overlay
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20240614/202406141215.2TdZyfCc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406141215.2TdZyfCc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406141215.2TdZyfCc-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dts:16.5-15: Warning (reg_format): /fragment@0/__overlay__/spidev@0:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dtbo: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dts:13.21-19.6: Warning (avoid_default_addr_size): /fragment@0/__overlay__/spidev@0: Relying on default #address-cells value
>> arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dts:13.21-19.6: Warning (avoid_default_addr_size): /fragment@0/__overlay__/spidev@0: Relying on default #size-cells value
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dtbo: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dtbo: Warning (unique_unit_address): Failed prerequisite 'avoid_default_addr_size'

vim +16 arch/arm64/boot/dts/rockchip/overlays/odroidm1/spi0.dts

     3	
     4	/ {
     5		fragment@0 {
     6			target = <&spi0>;
     7	
     8			__overlay__ {
     9				status = "okay";
    10	
    11				pinctrl-0 = <&spi0m1_cs0 &spi0m1_pins>;
    12	
  > 13				spidev: spidev@0 {
    14					status = "okay";
    15					compatible = "odroid,spi-dev";
  > 16					reg = <0>;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
