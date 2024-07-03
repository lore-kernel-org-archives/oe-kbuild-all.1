Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEC4B440C
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 00:21:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719966083; cv=none; b=STru7ngGPms/4SHBBP9G8xeQ0HSDApnn5/YSTwQL+vpBPbYBj9uEPIrThnXFI6QNO1kAXbBbjGQ35E6ASC6IDTR6fueKaa6oDmvLMVJOK+O4s5tyDkHgVvXkxOmkI77SCqIGbwHVe2YngOT2t2ZqNFm/wMJMhqCDoPLmsJtWmTo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719966083; c=relaxed/simple;
	bh=t0zZFb652AJXBBbHHXzV6WRi79WNeV/pPvKJVOhFP3A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=brnHO1KAa+8aT0tPl7vaVPz1WtGLwXPWxtC8WWtjI44HspDH2i4Zhhzfq9vBthBygkmTm0hV5+bPBXYm6NBUV9dbZWDuYDvCdvH11oQXHZDCmlaFXAYTNAa3xP6s4pTUKKzmH8BPopFFPl+FYe/T1ASrDkurgLxxlGsCZ4BTvgc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f6+/uf+U; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f6+/uf+U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719966081; x=1751502081;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=t0zZFb652AJXBBbHHXzV6WRi79WNeV/pPvKJVOhFP3A=;
  b=f6+/uf+UPaL0sbnZEVevUvpwM7WTNqCQHevVqCBp7nt9WPkMWCsPdj9G
   q0t/hT1VWnFPKmcHLcYHAo/pC65T8LuWui50uekIBqP48oUUJLZ4zaKCR
   I83wltHm377stfZxSsD+UJpVATAvdq43fn8NysCTm2YjtP4uydCLAWa8Y
   zW4MM2xd6WsvjVFPvxEPnyg5PMpMgUHWFxaEiz6qwM23bvMLKxHw1q4VN
   3FtcVjccdOJDm0Vr4luFyiZpvU4gPmp8OMhDli+pwbwXdP3B+m9BZOX1H
   qgcClEsnPiBK68ElN86mUDkH9mXKDkk13ouJe60Q9Q339qBbRQyWanZ+w
   w==;
X-CSE-ConnectionGUID: YYX2G6TlTIS6LESIicGchg==
X-CSE-MsgGUID: fJ/YCOItTL6z/IZe9FTkOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="17304693"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="17304693"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 17:21:20 -0700
X-CSE-ConnectionGUID: OlnnymCITl29VKNZK3Myvg==
X-CSE-MsgGUID: Ld9qSdu1RTyy26OWcGqtIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="51247724"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 02 Jul 2024 17:21:19 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOnkK-000P0J-0e;
	Wed, 03 Jul 2024 00:21:16 +0000
Date: Wed, 3 Jul 2024 08:20:29 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/000-devicetree 82/187]
 arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@2a9808000: compatible:0:
 'apple,t6020-dart' is not one of ['apple,t8103-dart',
 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
Message-ID: <202407030831.teOkAOt9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   1f815c7efb1b452e1f6f3aaaa42b958383f44076
commit: 521888111990907edc2a5abc2a4f372902389620 [82/187] arm64: dts: apple: Add j180d (Mac Pro 2023) device tree
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240703/202407030831.teOkAOt9-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030831.teOkAOt9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030831.teOkAOt9-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@2a9808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/fifo@2a9b14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@389304000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@389304000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@389304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@389304000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@38930c000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@38930c000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@38930c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@38930c000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: mbox@389c08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/mbox@389c08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@39b008000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@39b008000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: pwm@39b030000: compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b040000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: i2c@39b040000: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/power-management@404e80000: failed to match any schema with compatible: ['apple,t6020-pmgr', 'apple,pmgr', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/power-management@404e80000/power-controller@0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@100: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/power-management@404e80000/power-controller@100: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@108: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/power-management@404e80000/power-controller@108: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@702f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@702f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@702f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@702f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@702f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@702f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: usb@702280000: iommus: [[208, 0], [209, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: usb@702280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@b02f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@b02f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@b02f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@b02f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@b02f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@b02f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: usb@b02280000: iommus: [[214, 0], [215, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: usb@b02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/phy@b03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/phy@b03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@f02f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@f02f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@f02f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@f02f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@f02f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@f02f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: usb@f02280000: iommus: [[220, 0], [221, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: usb@f02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/usb@f02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/usb@f02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/phy@f03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/phy@f03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@1302f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@1302f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@1302f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@1302f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@1302f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/iommu@1302f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: usb@1302280000: iommus: [[226, 0], [227, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: usb@1302280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/usb@1302280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@200000000/usb@1302280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/power-management@404e80000: failed to match any schema with compatible: ['apple,t6020-pmgr', 'apple,pmgr', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/power-management@404e80000/power-controller@0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@100: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/power-management@404e80000/power-controller@100: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: power-controller@108: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/power-management@404e80000/power-controller@108: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@702f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@702f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/iommu@702f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@702f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@702f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/iommu@702f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: usb@702280000: iommus: [[308, 0], [309, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: usb@702280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@b02f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@b02f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/iommu@b02f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@b02f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@b02f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/iommu@b02f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: usb@b02280000: iommus: [[314, 0], [315, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: usb@b02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/phy@b03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/phy@b03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@f02f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@f02f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/iommu@f02f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@f02f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@f02f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/iommu@f02f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: usb@f02280000: iommus: [[320, 0], [321, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: usb@f02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/usb@f02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/usb@f02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/phy@f03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/phy@f03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@1302f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@1302f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/iommu@1302f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@1302f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: iommu@1302f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/iommu@1302f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: usb@1302280000: iommus: [[326, 0], [327, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: usb@1302280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/usb@1302280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/usb@1302280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/phy@1303000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/phy@1303000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: mbox@347408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/mbox@347408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: sart@34bc50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6020-sart', 'apple,t6000-sart'] is too long
   	'apple,t8112-sart' was expected
   	'apple,t6020-sart' is not one of ['apple,t6000-sart', 'apple,t8103-sart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,sart.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/sart@34bc50000: failed to match any schema with compatible: ['apple,t6020-sart', 'apple,t6000-sart']
>> arch/arm64/boot/dts/apple/t6022-j180d.dtb: nvme@34bcc0000: compatible:0: 'apple,t6020-nvme-ans2' is not one of ['apple,t8103-nvme-ans2', 'apple,t8112-nvme-ans2', 'apple,t6000-nvme-ans2']
   	from schema $id: http://devicetree.org/schemas/nvme/apple,nvme-ans.yaml#
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /soc@2200000000/nvme@34bcc0000: failed to match any schema with compatible: ['apple,t6020-nvme-ans2', 'apple,nvme-ans2']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /sound: failed to match any schema with compatible: ['apple,j180-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t6022-j180d.dtb: /sound: failed to match any schema with compatible: ['apple,j180-macaudio', 'apple,macaudio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
