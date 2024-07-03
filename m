Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F0AC18307D
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 16:46:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720025207; cv=none; b=haqjv6FNkKkJLdhPRyrVLdHLmmcylYgJ+Y8U1eDbo3aK83jkJF51LaI0NkG12xQy20M6t044RqQ2krRUV1znW4MJJ20pDi03soWwxwe9ja7Y8BAwCEx8a2Zc//7fThHIOOiwB+Fa4c7s6sA+z+tJKJyrWBbb/irOCMvQdoPAUuE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720025207; c=relaxed/simple;
	bh=/z6N11g3cV3pyujhdINVc8YXF0xdbdSodKgJf9eRujc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pCLqtEsl4K3bB2Guzcv1XPXEFU23FFN9t39uip8pyPcMqXku8wy1dwXEZGmw+9ErnhYf+oAskYkUoYTiZc9pm6NE4KAwXB8vURxI6m1lSJWs/XOHiRpPNwBYfyPdCbXlX9qOM+XhFMmDssam9LfmYFPSdSs7VBrIVem/9qiDOwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkYI85G4; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EkYI85G4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720025204; x=1751561204;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/z6N11g3cV3pyujhdINVc8YXF0xdbdSodKgJf9eRujc=;
  b=EkYI85G4y8xsaia+AtuUm7iWOGlyuAmv5JJ/TbJQRLaCOKb2Tk3UKjLl
   LzE2CohvwkBrAW7Dz7SA0ZHasmlAQAn7Aa+6SbTcOCxlKBX2K5UaXPJng
   GU8AABCOhB5rIT606+fXP5AbnOBEYwnl5kCKCkr4XKBx2+Bai97olRoxW
   A/xO4qvifcFudhs7ZED58ciN8syBJhCMxTcDo6bHIfkfKEsN3Fzqng6w1
   PjwdDce+3WXyfEOFr8m6ApHb+Ed2MM4JbVUtEbTxq7+6Nc79ckB89teKg
   j2V8NaxwDxBtopIJCRQvN0Gogy5OcV7n2waJREiBedBRB8AsYl6un6V34
   g==;
X-CSE-ConnectionGUID: 804VqSKYSjOkd6EKTHg7fw==
X-CSE-MsgGUID: cwiooEy6TlGp8SW+7UxvMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11122"; a="17387568"
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="17387568"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 09:46:42 -0700
X-CSE-ConnectionGUID: 8bxvkpPiTl+y3Ii0I7hoMA==
X-CSE-MsgGUID: mhZihKc3TSqW+6oRiuF9Hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,182,1716274800"; 
   d="scan'208";a="46190802"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 03 Jul 2024 09:46:40 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sP37u-000Q0J-20;
	Wed, 03 Jul 2024 16:46:38 +0000
Date: Thu, 4 Jul 2024 00:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: Janne Grunau <j@jannau.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:bits/000-devicetree 93/187]
 arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@2a9808000: compatible:0:
 'apple,t6020-dart' is not one of ['apple,t8103-dart',
 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
Message-ID: <202407040054.UKWk92qV-lkp@intel.com>
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
commit: 1b3766cb8102fc2444b6e520c650ae3d946c5a47 [93/187] arm64: dts: apple: t602x: Add initial Mac Studio (2023) device trees
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240704/202407040054.UKWk92qV-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240704/202407040054.UKWk92qV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407040054.UKWk92qV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@2a9808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/fifo@2a9b14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@389304000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@389304000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@389304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@389304000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@38930c000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@38930c000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@38930c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@38930c000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: mbox@389c08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/mbox@389c08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@39b008000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@39b008000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: pwm@39b030000: compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b040000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: i2c@39b040000: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/power-management@404e80000: failed to match any schema with compatible: ['apple,t6020-pmgr', 'apple,pmgr', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-controller@0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/power-management@404e80000/power-controller@0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-controller@100: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/power-management@404e80000/power-controller@100: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: power-controller@108: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/power-management@404e80000/power-controller@108: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@702f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@702f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@702f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@702f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@702f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@702f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: usb@702280000: iommus: [[183, 0], [184, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: usb@702280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@b02f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@b02f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@b02f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@b02f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@b02f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@b02f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: usb@b02280000: iommus: [[189, 0], [190, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: usb@b02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@f02f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@f02f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@f02f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@f02f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@f02f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@f02f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: usb@f02280000: iommus: [[195, 0], [196, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: usb@f02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@1302f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@1302f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@1302f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@1302f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: iommu@1302f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/iommu@1302f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: usb@1302280000: iommus: [[201, 0], [202, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: usb@1302280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j475c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@2a9808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/fifo@2a9b14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: display-subsystem: iommus: True is not of type 'array'
   	from schema $id: http://devicetree.org/schemas/iommu/iommu.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@39b008000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@39b008000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: pwm@39b030000: compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b040000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: i2c@39b040000: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mca@39b600000: failed to match any schema with compatible: ['apple,t6020-mca', 'apple,mca']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/gpu@406400000: failed to match any schema with compatible: ['apple,agx-t6022', 'apple,agx-g14x']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/gpu@406400000: failed to match any schema with compatible: ['apple,agx-t6022', 'apple,agx-g14x']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: mbox@406408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/mbox@406408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/pcie@580000000: failed to match any schema with compatible: ['apple,t6020-pcie']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@594000000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@594000000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@594000000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@595000000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@595000000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@595000000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@596000000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
--
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/power-management@404e80000: failed to match any schema with compatible: ['apple,t6020-pmgr', 'apple,pmgr', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/power-management@404e80000/power-controller@0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@100: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/power-management@404e80000/power-controller@100: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@108: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/power-management@404e80000/power-controller@108: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@702f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@702f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@702f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@702f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@702f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@702f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: usb@702280000: iommus: [[195, 0], [196, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: usb@702280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@b02f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@b02f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@b02f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@b02f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@b02f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@b02f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: usb@b02280000: iommus: [[201, 0], [202, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: usb@b02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/phy@b03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/phy@b03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@f02f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@f02f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@f02f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@f02f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@f02f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@f02f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: usb@f02280000: iommus: [[207, 0], [208, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: usb@f02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/usb@f02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/usb@f02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/phy@f03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/phy@f03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@1302f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@1302f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@1302f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@1302f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@1302f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/iommu@1302f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: usb@1302280000: iommus: [[213, 0], [214, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: usb@1302280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/usb@1302280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@200000000/usb@1302280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/power-management@404e80000: failed to match any schema with compatible: ['apple,t6020-pmgr', 'apple,pmgr', 'syscon', 'simple-mfd']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@0: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/power-management@404e80000/power-controller@0: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@100: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/power-management@404e80000/power-controller@100: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: power-controller@108: compatible:0: 'apple,t6020-pmgr-pwrstate' is not one of ['apple,t8103-pmgr-pwrstate', 'apple,t8112-pmgr-pwrstate', 'apple,t6000-pmgr-pwrstate']
   	from schema $id: http://devicetree.org/schemas/power/apple,pmgr-pwrstate.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/power-management@404e80000/power-controller@108: failed to match any schema with compatible: ['apple,t6020-pmgr-pwrstate', 'apple,pmgr-pwrstate']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@702f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@702f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/iommu@702f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@702f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@702f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/iommu@702f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: usb@702280000: iommus: [[298, 0], [299, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: usb@702280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@b02f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@b02f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/iommu@b02f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@b02f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@b02f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/iommu@b02f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: usb@b02280000: iommus: [[304, 0], [305, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: usb@b02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
--
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: iommu@1694000000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/iommu@1694000000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: mbox@347408000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/mbox@347408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: sart@34bc50000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['apple,t6020-sart', 'apple,t6000-sart'] is too long
   	'apple,t8112-sart' was expected
   	'apple,t6020-sart' is not one of ['apple,t6000-sart', 'apple,t8103-sart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,sart.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/sart@34bc50000: failed to match any schema with compatible: ['apple,t6020-sart', 'apple,t6000-sart']
>> arch/arm64/boot/dts/apple/t6022-j475d.dtb: nvme@34bcc0000: compatible:0: 'apple,t6020-nvme-ans2' is not one of ['apple,t8103-nvme-ans2', 'apple,t8112-nvme-ans2', 'apple,t6000-nvme-ans2']
   	from schema $id: http://devicetree.org/schemas/nvme/apple,nvme-ans.yaml#
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /soc@2200000000/nvme@34bcc0000: failed to match any schema with compatible: ['apple,t6020-nvme-ans2', 'apple,nvme-ans2']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /sound: failed to match any schema with compatible: ['apple,j475-macaudio', 'apple,j375-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /sound: failed to match any schema with compatible: ['apple,j475-macaudio', 'apple,j375-macaudio', 'apple,macaudio']
   arch/arm64/boot/dts/apple/t6022-j475d.dtb: /sound: failed to match any schema with compatible: ['apple,j475-macaudio', 'apple,j375-macaudio', 'apple,macaudio']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
