Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC135442380
	for <oe-kbuild-all@lists.linux.dev>; Sun, 18 Oct 2026 07:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792309961; cv=none; b=FLP04J4K/SPMfp5aYlc2cikwUZHs9SBkvVtRsm4FXERn7O9NxLWwwXl4VTpFnshsrZM07bAvFUz0ek5UOxLSXKnSB4n27yiyOBJG5GD1yzRgtE5CzU4KnqTQrrzN+va3AnY+UHkh3z8Ymo9whao82al0wxwZv0VOmeaej+cRHM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792309961; c=relaxed/simple;
	bh=6bn4ZnvRLgJ4+pzD6xiZ1C4xsePLrJ2fl+pDJegf1eE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XBPQ/OyNLCSeuWhrxFrmI/Zzo3WIIKyJs3/cLJ2GV4guAr3ymVchncDJU8epRO+ukyijtFYMvyjNOuddxrmumMMaO5Lmldy7/zlER6l6i2cAdUlFEG71e4Pxt9y9Da8IgPHw5sWNq4P+WbAHB0/BtQrNb4KPgUpcQRkSSuspP3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XjDu++Mp; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XjDu++Mp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792309960; x=1823845960;
  h=date:from:to:cc:subject:message-id;
  bh=6bn4ZnvRLgJ4+pzD6xiZ1C4xsePLrJ2fl+pDJegf1eE=;
  b=XjDu++MpdLTmxqZRmBUYEwy8emH8M4J1F/CRKUOLqvEmRXhW2Vrb0BrM
   mLLk9Qvb3BQFFbs5Sr4Smbbhl6ImUQcBeFEPy+GNZgTRmn3Kjn9CBXFsu
   41s/d2FuZHdjx5tqoHvNMgNieLeX167QLUWMH85FtjMTz/GG+1HGtFzIP
   5ZIo06Ki6NpJMDACiQrzZdNARbb8agWsSjN6fL6MO9+LwGSefFWcNCqcT
   K2QS1kle3FpFu2oSD89fPkR1pML18sgLtd3IAJDSRPo9hyLGAxihmuZt8
   k0fKhXo292IPhK/b2uZBSqFFqwO2ZEWEA9KVthvjCsMO1UwOxfjqPHzBm
   A==;
X-CSE-ConnectionGUID: YKu2Nh+OSiCnBB4E225NKw==
X-CSE-MsgGUID: oCM3gXkpRb2WTZvLZ8fpMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11938"; a="908850"
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="908850"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2026 00:52:36 -0700
X-CSE-ConnectionGUID: Fz15OFYLQP+iq+J6u1S3/w==
X-CSE-MsgGUID: IdBM3+UnSGW+GeCgzEEG3A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,165,1787036400"; 
   d="scan'208";a="4115550"
Received: from igk-lkp-server01.igk.intel.com (HELO 3c253b998be3) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 18 Oct 2026 00:52:35 -0700
Received: from kbuild by 3c253b998be3 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xILh2-000000004x7-3ZCj;
	Sun, 18 Oct 2026 07:52:32 +0000
Date: Sun, 18 Oct 2026 09:50:40 +0200
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Vinod Koul <vkoul@kernel.org>
Subject: [linux-next:master 12707/18293]
 arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: dma@f7370000
 (hisilicon,k3-dma-1.0): $nodename:0: 'dma@f7370000' does not match
 '^dma-controller(@.*)?$'
Message-ID: <202610180619.POWUccUw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2efb7a11f1aa4d2dc285fe2680cca22cb9f72f64
commit: 6b0089d88669c87d69df6fa118c198024494a033 [12707/18293] dt-bindings: dma: Convert hisilicon,k3-dma-1.0 to DT schema
config: arm64-randconfig-2402-20261006 (https://download.01.org/0day-ci/archive/20261018/202610180619.POWUccUw-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema: 2026.10.dev4+g568711590
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261018/202610180619.POWUccUw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610180619.POWUccUw-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: soc (simple-bus): replicator: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: soc (simple-bus): stub_clock: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/acpu_sctrl@f6504000: failed to match any schema with compatible: ['hisilicon,hi6220-acpu-sctrl', 'syscon']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: medianoc_ade@f4520000 (syscon): compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: /soc/stub_clock: failed to match any schema with compatible: ['hisilicon,hi6220-stub-clk']
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: stub_clock (hisilicon,hi6220-stub-clk): hisilicon,hi6220-clk-sram: b'\x00\x00\x00\x10' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
>> arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: dma@f7370000 (hisilicon,k3-dma-1.0): $nodename:0: 'dma@f7370000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/hisilicon,k3-dma-1.0.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'avdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'a2vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi6220-hikey.dtb: adv7533@39 (adi,adv7533): 'v3p3-supply' is a required property
--
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: adv7533@39 (adi,adv7533): 'avdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: adv7533@39 (adi,adv7533): 'dvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: adv7533@39 (adi,adv7533): 'pvdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: adv7533@39 (adi,adv7533): 'a2vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: adv7533@39 (adi,adv7533): 'v3p3-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/bridge/adi,adv7533.yaml
>> arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: dma@fdf30000 (hisilicon,k3-dma-1.0): $nodename:0: 'dma@fdf30000' does not match '^dma-controller(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/dma/hisilicon,k3-dma-1.0.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: spi@ffd68000 (arm,pl022): Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: spi@ff3b3000 (arm,pl022): Unevaluated properties are not allowed ('label' was unexpected)
   	from schema $id: http://devicetree.org/schemas/spi/spi-pl022.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: usb@ff100000 (snps,dwc3): resets: [[31, 144, 8], [31, 144, 7], [31, 144, 6], [31, 144, 5]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: funnel (arm,coresight-static-funnel): 'clock-names', 'clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-funnel.yaml
   arch/arm64/boot/dts/hisilicon/hi3660-hikey960.dtb: reboot-mode-syscon@32100000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
