Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E972E2FB0BD
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Sep 2025 16:06:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758125206; cv=none; b=RWEbMfTMHAnuo6zMbkM8bXab6pEmWWU8ROHnXUOWWZUQBmp47XcBcMpbcloAuEoDs52F1OSaH4WdvXEoViU4aYU4S5LVlVUCCh70U1sj3ts8lOhsef7dWWutBvmfdaKWLGxHwSwDg/hN4MWhoafXvPKjjZDqU1t3mpGLUHV35ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758125206; c=relaxed/simple;
	bh=SbaRmZjCJxATnde8O+sCBrELofh1qW4GdT4ojqIqdoQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=iPsglUj6a817IHW876wxqAlB/PFHHZt5QNMMM52raYPHNDd+jGVX0ZlaxxH07CKNhB0NabLBzUcvG9B7tKt16T9s/Nc5bzyaCRc5xB4hce9eTW3kauxIKkctxIUMJ6OnxRrR+g5M7xgV3pCTnV7wDrzqSsYstQOLNZTY8WTOL5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eQzRveyP; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eQzRveyP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758125205; x=1789661205;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SbaRmZjCJxATnde8O+sCBrELofh1qW4GdT4ojqIqdoQ=;
  b=eQzRveyPPecggi7U2tQQC5KtAXhVHTIuisS6wurnNCd5VobfmjmRpPrK
   NQ3od8I4jHzfIc/wtrvBoI2aG4IpMUPJZLUhlbsGdlIfXIXD35EWAu8Dg
   Gi9NTcShu5w9CNY7Jc1EoYtb7rOWa/P0D9WEwYGjIvOR6zOPZgfjjq5fe
   B7VLlTuB5XbCQ7yi6yMns5Mr/sTJjGgAI+UauV5vXo/BScYm3gFlSm5Dk
   7/Kd6jLq4ywPXXZpQqBx6iVEdvRK2TYJHlU1MjFCR2SwhB3hGubh8G42B
   q1Lpve6kVgOPpbuWAnhB5DgLrhez3KW9yOOz1j/OiIbcbGW5Rhr0oNSjA
   Q==;
X-CSE-ConnectionGUID: iJxddkkQSAu7HpAgafkhng==
X-CSE-MsgGUID: iJQnXEVUToC3AoiYmPpZJw==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="64240113"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="64240113"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Sep 2025 09:06:45 -0700
X-CSE-ConnectionGUID: PLx9HhNiQDW60t7T6xCqmA==
X-CSE-MsgGUID: IZWsNJlcS7uo3MEw3alESQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,272,1751266800"; 
   d="scan'208";a="180557038"
Received: from lkp-server01.sh.intel.com (HELO 84a20bd60769) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 17 Sep 2025 09:06:43 -0700
Received: from kbuild by 84a20bd60769 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uyug5-0002Bl-0j;
	Wed, 17 Sep 2025 16:06:41 +0000
Date: Thu, 18 Sep 2025 00:06:09 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1-lts 1/1]
 arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: flash@0
 (jedec,spi-nor): Unevaluated properties are not allowed ('vcc-supply' was
 unexpected)
Message-ID: <202509172328.gZ6TnG2W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1-lts
head:   8c8937bc84545d6e04812fafa04bcf969f3a5cab
commit: 9cfaaaa79951665cb7c127cda2f3481abc696ade [1/1] arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3399-pinebook-pro
config: arm64-randconfig-052-20250917 (https://download.01.org/0day-ci/archive/20250917/202509172328.gZ6TnG2W-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.4.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250917/202509172328.gZ6TnG2W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509172328.gZ6TnG2W-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: usb@fe900000 (rockchip,rk3399-dwc3): Unevaluated properties are not allowed ('#address-cells', '#size-cells', 'clock-names', 'clocks', 'compatible', 'ranges', 'usb@fe900000' were unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/rockchip,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: usb@fe900000 (snps,dwc3): Unevaluated properties are not allowed ('power-domains' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: /dp@fec00000: failed to match any schema with compatible: ['rockchip,rk3399-cdn-dp']
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: interrupt-controller@fee00000 (arm,gic-v3): interrupt-controller@fee20000: False schema does not allow {'compatible': ['arm,gic-v3-its'], 'msi-controller': True, '#msi-cells': 1, 'reg': [[0, 4276224000, 0, 131072]], 'phandle': 22}
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic-v3.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: spi@ff1d0000 (rockchip,rk3399-spi): Unevaluated properties are not allowed ('max-freq' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-rockchip.yaml#
>> arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: flash@0 (jedec,spi-nor): Unevaluated properties are not allowed ('vcc-supply' was unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/jedec,spi-nor.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: /i2c@ff3c0000/regulator@40: failed to match any schema with compatible: ['silergy,syr827']
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: /i2c@ff3c0000/regulator@41: failed to match any schema with compatible: ['silergy,syr828']
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: /i2c@ff3d0000/fusb30x@22: failed to match any schema with compatible: ['fcs,fusb302']
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: /dfi@ff630000: failed to match any schema with compatible: ['rockchip,rk3399-dfi']
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: syscon@ff770000 (rockchip,rk3399-grf): usb2phy@e450: Unevaluated properties are not allowed ('port' was unexpected)
   	from schema $id: http://devicetree.org/schemas/soc/rockchip/grf.yaml#
   arch/arm64/boot/dts/rockchip/rk3399-pinebook-pro.dtb: usb2phy@e450 (rockchip,rk3399-usb2phy): 'port' does not match any of the regexes: '^pinctrl-[0-9]+$'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
