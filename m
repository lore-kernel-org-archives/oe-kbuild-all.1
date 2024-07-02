Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C14BC1BC06B
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 16:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719939356; cv=none; b=ZcKvHrk4rvme0yfAuYt/tgIMBCL5fbMS5ZovYI1RkUA3wWZX8Doagsx9uAFpRsRQ9OhCSVhBPKE04T2ZgUjs0CmgWBAfi8E0zkEV+bGMjom7LQdmL/mpJIoZuRfqPplFGJozQ+mlpb0CiZCiKf43XL/v9O11YU/OOcpxE49tJkw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719939356; c=relaxed/simple;
	bh=ovINzTrHONevmA/tCzy1wABJqe9woMbS4He8sEmHPwE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=r9BlY9J3GWbijXCgN3ZvlJhuSpY1hlfjtiWquOiNRbi6fpuboXrz3KZEbRQPGExbCT97BUyvqc2V/csnnNd64s406EctWRYTR9cgoy68wB8XqbAsWzLWJLBIvx66ycoAgXf3qVx30VOIkjwqgov1YklGQrhmo29eVKAEzIY1nPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uueo+ZDt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uueo+ZDt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719939351; x=1751475351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ovINzTrHONevmA/tCzy1wABJqe9woMbS4He8sEmHPwE=;
  b=Uueo+ZDtmKwEo4MAH4eJjeds5HxP+SxXi9AqxLVzVOlRbn8G9Os+uYxJ
   /UdxxGrlSjoZ6mQp1bKIYS+KGm2tZP1f5EtUy8Xd0gTBEx1upLtLzXCYk
   hgibNCFZZjWB1B0rNZFgBn9z7P6KOHIgsW30BdzkYIW1ilkGLcIOkYHbJ
   k3qoQKOMvhliIzZp7d1R3ZImo7WFDueoSoGl+MCTTnvIWoLAOQqJnvJcA
   i6KIZmhmBA3/xFuKkRfYwfMCT7mBXvxvuIyVFasgXdaWznzMoCA7juch5
   n1zCGPd16fPWik3471cBTTADpUVw/uZQ3miqn5nyJ338cjmxLZSO6D/SV
   A==;
X-CSE-ConnectionGUID: 94hm0TTgQXCNit2ICdxWVQ==
X-CSE-MsgGUID: qphdE+Q6RtO1ovh2Nm8SXw==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="20996461"
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="20996461"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 09:55:51 -0700
X-CSE-ConnectionGUID: spp4xrddSceoeHh/euuy8w==
X-CSE-MsgGUID: HG/6838sSKqAGRXEgxsApw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,178,1716274800"; 
   d="scan'208";a="45947323"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 02 Jul 2024 09:55:49 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOgnD-000ORA-0j;
	Tue, 02 Jul 2024 16:55:47 +0000
Date: Wed, 3 Jul 2024 00:54:52 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/000-devicetree 70/187]
 arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@2a9808000: compatible:0:
 'apple,t6020-dart' is not one of ['apple,t8103-dart',
 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
Message-ID: <202407030002.coecki8f-lkp@intel.com>
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
commit: 25b478bb2d180dcc27249891b40f074b68db4f04 [70/187] arm64: dts: apple: Add MTP nodes to t6020x
config: arm64-randconfig-051-20240629 (https://download.01.org/0day-ci/archive/20240703/202407030002.coecki8f-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030002.coecki8f-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030002.coecki8f-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@2a9808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/fifo@2a9b14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@389304000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@389304000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@389304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@389304000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@38930c000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@38930c000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@38930c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@38930c000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: mbox@389c08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/mbox@389c08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j414', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j414', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j414', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@39b008000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@39b008000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: pwm@39b030000: compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b040000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: i2c@39b040000: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: efuse@29e2cc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/efuse@29e2cc000: failed to match any schema with compatible: ['apple,t6020-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: pinctrl@2a6820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/pinctrl@2a6820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@702f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@702f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@702f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@702f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@702f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@702f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: usb@702280000: iommus: [[165, 0], [166, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: usb@702280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@b02f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@b02f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@b02f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@b02f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@b02f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@b02f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: usb@b02280000: iommus: [[171, 0], [172, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: usb@b02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@f02f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@f02f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@f02f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@f02f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@f02f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@f02f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: usb@f02280000: iommus: [[177, 0], [178, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: usb@f02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@1302f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@1302f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@1302f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@1302f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: iommu@1302f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/iommu@1302f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: usb@1302280000: iommus: [[183, 0], [184, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6020-j414s.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
--
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@2a9808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/fifo@2a9b14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@389304000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@389304000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@389304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@389304000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@38930c000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@38930c000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@38930c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@38930c000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: mbox@389c08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/mbox@389c08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j414', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j414', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j414', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@39b008000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@39b008000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: pwm@39b030000: compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b040000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: i2c@39b040000: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: efuse@29e2cc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/efuse@29e2cc000: failed to match any schema with compatible: ['apple,t6020-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: pinctrl@2a6820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/pinctrl@2a6820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@702f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@702f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@702f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@702f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@702f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@702f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: usb@702280000: iommus: [[179, 0], [180, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: usb@702280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@b02f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@b02f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@b02f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@b02f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@b02f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@b02f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: usb@b02280000: iommus: [[185, 0], [186, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: usb@b02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@f02f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@f02f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@f02f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@f02f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@f02f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@f02f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: usb@f02280000: iommus: [[191, 0], [192, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: usb@f02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@1302f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@1302f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@1302f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@1302f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: iommu@1302f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/iommu@1302f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: usb@1302280000: iommus: [[197, 0], [198, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6021-j414c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
--
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@2a9808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/fifo@2a9b14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@389304000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@389304000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@389304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@389304000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@38930c000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@38930c000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@38930c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@38930c000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: mbox@389c08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/mbox@389c08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j416', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j416', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j416', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@39b008000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@39b008000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: pwm@39b030000: compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b040000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: i2c@39b040000: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: efuse@29e2cc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/efuse@29e2cc000: failed to match any schema with compatible: ['apple,t6020-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: pinctrl@2a6820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/pinctrl@2a6820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@702f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@702f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@702f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@702f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@702f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@702f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: usb@702280000: iommus: [[165, 0], [166, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: usb@702280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@b02f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@b02f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@b02f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@b02f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@b02f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@b02f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: usb@b02280000: iommus: [[171, 0], [172, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: usb@b02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@f02f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@f02f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@f02f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@f02f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@f02f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@f02f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: usb@f02280000: iommus: [[177, 0], [178, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: usb@f02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@1302f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@1302f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@1302f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@1302f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: iommu@1302f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/iommu@1302f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: usb@1302280000: iommus: [[183, 0], [184, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6020-j416s.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
--
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@2a9808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/fifo@2a9b14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@389304000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@389304000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@389304000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@389304000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@38930c000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@38930c000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@38930c000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@38930c000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: mbox@389c08000: compatible: 'oneOf' conditional failed, one must be fixed:
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-asc-mailbox', 'apple,t8112-asc-mailbox', 'apple,t6000-asc-mailbox']
   	'apple,t6020-asc-mailbox' is not one of ['apple,t8103-m3-mailbox', 'apple,t8112-m3-mailbox', 'apple,t6000-m3-mailbox']
   	'apple,m3-mailbox-v2' was expected
   	from schema $id: http://devicetree.org/schemas/mailbox/apple,mailbox.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/mbox@389c08000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/dcp@389c00000: failed to match any schema with compatible: ['apple,t6020-dcp', 'apple,dcp']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j416', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j416', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/dcp@389c00000/panel: failed to match any schema with compatible: ['apple,panel-j416', 'apple,panel-mini-led', 'apple,panel']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/display-subsystem: failed to match any schema with compatible: ['apple,display-subsystem']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@39b008000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@39b008000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@39b008000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: pwm@39b030000: compatible:0: 'apple,t6020-fpwm' is not one of ['apple,t8103-fpwm', 'apple,t6000-fpwm', 'apple,t8112-fpwm']
   	from schema $id: http://devicetree.org/schemas/pwm/apple,s5l-fpwm.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/pwm@39b030000: failed to match any schema with compatible: ['apple,t6020-fpwm', 'apple,s5l-fpwm']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b040000: compatible:0: 'apple,t6020-i2c' is not one of ['apple,t8103-i2c', 'apple,t8112-i2c', 'apple,t6000-i2c']
   	from schema $id: http://devicetree.org/schemas/i2c/apple,i2c.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: i2c@39b040000: Unevaluated properties are not allowed ('compatible' was unexpected)
--
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: efuse@29e2cc000: Unevaluated properties are not allowed ('compatible' was unexpected)
   	from schema $id: http://devicetree.org/schemas/nvmem/apple,efuses.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/efuse@29e2cc000: failed to match any schema with compatible: ['apple,t6020-efuses', 'apple,efuses']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: pinctrl@2a6820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/pinctrl@2a6820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: pinctrl@39b028000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/pinctrl@39b028000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@702f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@702f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@702f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@702f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@702f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@702f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: usb@702280000: iommus: [[179, 0], [180, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: usb@702280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/usb@702280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/phy@703000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@b02f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@b02f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@b02f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@b02f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@b02f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@b02f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: usb@b02280000: iommus: [[185, 0], [186, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: usb@b02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/usb@b02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/phy@b03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@f02f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@f02f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@f02f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@f02f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@f02f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@f02f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: usb@f02280000: iommus: [[191, 0], [192, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: usb@f02280000: Unevaluated properties are not allowed ('iommus' was unexpected)
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/usb@f02280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/phy@f03000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@1302f00000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@1302f00000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@1302f00000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
>> arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@1302f80000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: iommu@1302f80000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/iommu@1302f80000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: usb@1302280000: iommus: [[197, 0], [198, 1]] is too long
   	from schema $id: http://devicetree.org/schemas/usb/snps,dwc3.yaml#
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/usb@1302280000: failed to match any schema with compatible: ['apple,t6020-dwc3', 'apple,dwc3', 'snps,dwc3']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
   arch/arm64/boot/dts/apple/t6021-j416c.dtb: /soc/phy@1303000000: failed to match any schema with compatible: ['apple,t6020-atcphy', 'apple,t8103-atcphy']
--
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mbox@2a2408000: failed to match any schema with compatible: ['apple,t6020-asc-mailbox', 'apple,asc-mailbox-v4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/smc@2a2400000: failed to match any schema with compatible: ['apple,t6020-smc', 'apple,smc']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: pinctrl@2a2820000: compatible:0: 'apple,t6020-pinctrl' is not one of ['apple,t8103-pinctrl', 'apple,t8112-pinctrl', 'apple,t6000-pinctrl']
   	from schema $id: http://devicetree.org/schemas/pinctrl/apple,pinctrl.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/pinctrl@2a2820000: failed to match any schema with compatible: ['apple,t6020-pinctrl', 'apple,pinctrl']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/mtp@2a9400000: failed to match any schema with compatible: ['apple,t6020-mtp', 'apple,t6020-rtk-helper-asc4', 'apple,mtp', 'apple,rtk-helper-asc4']
>> arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@2a9808000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@2a9808000: compatible: ['apple,t6020-dart', 'apple,t8110-dart'] is too long
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@2a9808000: 'apple,dma-range' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/iommu/apple,dart.yaml#
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/iommu@2a9808000: failed to match any schema with compatible: ['apple,t6020-dart', 'apple,t8110-dart']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/fifo@2a9b14000: failed to match any schema with compatible: ['apple,t6020-dockchannel', 'apple,dockchannel']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: /soc/fifo@2a9b14000/input@8000: failed to match any schema with compatible: ['apple,dockchannel-hid']
   arch/arm64/boot/dts/apple/t6020-j474s.dtb: iommu@389304000: compatible:0: 'apple,t6020-dart' is not one of ['apple,t8103-dart', 'apple,t8103-usb4-dart', 'apple,t8110-dart', 'apple,t6000-dart']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
