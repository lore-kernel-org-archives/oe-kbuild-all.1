Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B44D119D89B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 01:46:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718502372; cv=none; b=pFSshd7wzBwLebMKpFSKCOtbBBbiAaz+QUehWXIgHhiXheyXUY8IwEmj0tpxiUZTcBOwnhkbHVA5QuPvq4Px5IQ8Qs2NBOb82gtHrE53aKsziz2/EF+jfN8SCvF3uWyHU5iDEknsgf4MwABlJ5oe1qh80S/wUX+NrVG+8ZwULhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718502372; c=relaxed/simple;
	bh=/afPxUsDDj/C4t7kDUzV1Nhywy5R+aG0N3DZSoU3Yq4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rT1AOmgR5i0ybvjPzlIsoMOI60AM/He/G5JCmTzSqXoUchRn8f/YTyyttR8OQCFWXhnaHyn4mLN6VOnrv7MtciyrZebzuMzjXIwaKXV02fDX4Ywlyfra7+bzO2CmiJbc1rgsM0NOkI+xPQ+OLBFXyOSzB/Rquaeg5Z4WKAks4t0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXSZbeW9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXSZbeW9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718502370; x=1750038370;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/afPxUsDDj/C4t7kDUzV1Nhywy5R+aG0N3DZSoU3Yq4=;
  b=FXSZbeW91O8nxeE9trEoK50eEJyaRzJV+60aQjO17vyiEjqqpxM8wEDn
   igDSlJa/jpLKJRN0L5iQ6Zxa3MWDAjvamFfQ/P/a3Srrt3aQfTyn9dmwC
   ZrHsKTT9gkBBDYDQIg1X3EW4lNkmdpEaWRtYZD8hqcHUFd4zeEylTxEyx
   Pc+tpSH1JExj9s/VUo2LFFD/+Wg0oAQqbqpiqTM85nJs9GqGw3dkS9QIi
   5S7X/p9AYd+XGkwDN5zgkEv7nOPP6gQH+cBeMXyp/4c/9LauhUnP5Unox
   xI0FkpmDhIR3mBmoDNUp3PghMZCEOBWIRBefy75jwq4dzN1grB4AFatez
   w==;
X-CSE-ConnectionGUID: DjzIVQoDTjGKvj58U126Gw==
X-CSE-MsgGUID: 5xgYppzUSh22oNwOCozcSA==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15197749"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="15197749"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 18:46:09 -0700
X-CSE-ConnectionGUID: LjvTpsXoSaiInIltAcqxpA==
X-CSE-MsgGUID: 0xZVd+vZQvWcQcsE4t9uZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="78340699"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 15 Jun 2024 18:46:09 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIey6-0000he-0u;
	Sun, 16 Jun 2024 01:46:06 +0000
Date: Sun, 16 Jun 2024 09:45:59 +0800
From: kernel test robot <lkp@intel.com>
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [pinchartl:nxp/v6.10/dev/rpi-cam-mipi 45/129]
 arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:9.3-16: Warning
 (reg_format): /fragment@0/__overlay__/controller@10:reg: property has
 invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
Message-ID: <202406160916.Jjo4azBk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/pinchartl/linux.git nxp/v6.10/dev/rpi-cam-mipi
head:   5a42e32f7a80b2729b81fa757c9531a7ec7127f9
commit: 5b9651c867530f77724858692126d437c1c9f49a [45/129] arm64: dts: freescale: Add IMX296 camera overlays for Variscite DART
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240616/202406160916.Jjo4azBk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406160916.Jjo4azBk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160916.Jjo4azBk-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:9.3-16: Warning (reg_format): /fragment@0/__overlay__/controller@10:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:16.3-16: Warning (reg_format): /fragment@0/__overlay__/camera@1a:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:45.10-50.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi0-imx296.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi0-imx296.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi0-imx296.dtbo: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi0-imx296.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi0-imx296.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:7.27-12.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/controller@10: Relying on default #address-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:7.27-12.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/controller@10: Relying on default #size-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:14.12-34.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/camera@1a: Relying on default #address-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:14.12-34.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/camera@1a: Relying on default #size-cells value
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi0-imx296.dtbo: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi0-imx296.dtbo: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'
--
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:9.3-16: Warning (reg_format): /fragment@0/__overlay__/controller@10:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:16.3-16: Warning (reg_format): /fragment@0/__overlay__/camera@1a:reg: property has invalid length (4 bytes) (#address-cells == 2, #size-cells == 1)
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:45.10-50.5: Warning (unit_address_vs_reg): /fragment@2/__overlay__/ports/port@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi1-imx296.dtbo: Warning (pci_device_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi1-imx296.dtbo: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi1-imx296.dtbo: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi1-imx296.dtbo: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi1-imx296.dtbo: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:7.27-12.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/controller@10: Relying on default #address-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:7.27-12.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/controller@10: Relying on default #size-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:14.12-34.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/camera@1a: Relying on default #address-cells value
>> arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi:14.12-34.4: Warning (avoid_default_addr_size): /fragment@0/__overlay__/camera@1a: Relying on default #size-cells value
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi1-imx296.dtbo: Warning (avoid_unnecessary_addr_size): Failed prerequisite 'avoid_default_addr_size'
   arch/arm64/boot/dts/freescale/imx8mp-var-dart-csi1-imx296.dtbo: Warning (unique_unit_address_if_enabled): Failed prerequisite 'avoid_default_addr_size'

vim +9 arch/arm64/boot/dts/freescale/imx8mp-var-dart-imx296.dtsi

   > 7		VC_CTRL: controller@10 {
     8			compatible = "vision-components,mipi-module";
   > 9			reg = <0x10>;
    10			#clock-cells = <0>;
    11			clock-frequency = <54000000>;
    12		};
    13	
  > 14		camera@1a {
    15			compatible = "sony,imx296lq";
  > 16			reg = <0x1a>;
    17	
    18			clocks = <&VC_CTRL>;
    19			clock-names = "inck";
    20	
    21			avdd-supply = <&VC_CTRL>;
    22			dvdd-supply = <&VC_CTRL>;
    23			ovdd-supply = <&VC_CTRL>;
    24	
    25			orientation = <0>;	/* Front */
    26			rotation = <0>;
    27	
    28			port {
    29				IMX296_EP: endpoint {
    30					data-lanes = <1>;
    31					remote-endpoint = <&CSI_EP>;
    32				};
    33			};
    34		};
    35	};
    36	
    37	&isi_0 {
    38		status = "okay";
    39	};
    40	
    41	&CSI {
    42		status = "okay";
    43	
    44		ports {
  > 45			port@0 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
