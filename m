Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07EE465C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Jun 2024 00:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718324306; cv=none; b=Ba1ufVkn6UA7jBBFpGYNUsTV2lOjt8qN8sDRBw43f33QHeA0BX8W9Gzx22z6qKjs0PFnjbtjbmnYusr90sJdknHLMX4bU8UU4xFfiLzY42a2ETdZM1ATZMq4rSUVJnd6dqHfxfIajtKh6lmCuupSF3dkW9L6tfD0Q9C3GZ0r/IE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718324306; c=relaxed/simple;
	bh=p6xfD/6gtwwWj4fOSZ7AEhMY/vpGc9SVan8J2ZVj8ik=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B9+4wVWQCyYPDL60reDUsNAJdeHP/0HSyLRCI1m4j5irgm5lYUJLQkUup7gCfXWraFoKJPhTjLOotLbHiICM8r/TWdDzYCQfzyzfAv0hNeWrFvtPL1wYxHYDIn9pqOUKsLeWxOt6y1AryeEWLOi23jbDS8TmDAncjTgoyI8+V/g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LiS0r67c; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LiS0r67c"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718324304; x=1749860304;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=p6xfD/6gtwwWj4fOSZ7AEhMY/vpGc9SVan8J2ZVj8ik=;
  b=LiS0r67cvWFXgFPiy5b0U9YNQSRUrWs1pdcmsEXZxZYuGEZcauwKJKFb
   q24cvHqj0bgbJexHscUzkuJJIig3Y6WCWtkIhbJi1kZ1D3mnmwNDv5R2S
   tMP8MQBbyD5IxbummeMlowydZ8SAYtlpufzwLoLfZPRtQoQfB8+YnqIC4
   fn1K7zVC72ddpEKZ8sbg1PPdnL7w0aShgM+kDJYj+dk5h3Z+sjBwp3GhA
   FTzPuZaXbFtMTNn157iLxRNBMXqgFIPf+y75mtRy+2AAzxBbq5NGGExLD
   H8kyBtYOa/B4JC6Fnn+k2FtQuJqqYm34tI+fNhBRKavaWTT6LOasxjSWy
   w==;
X-CSE-ConnectionGUID: pr1uJohkSHmydmsGGdoVeQ==
X-CSE-MsgGUID: mY09JqrqSW2acMPlHh0eKA==
X-IronPort-AV: E=McAfee;i="6700,10204,11102"; a="26591901"
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="26591901"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jun 2024 17:18:21 -0700
X-CSE-ConnectionGUID: w0AMDmgHQVmy0g1bgRxyfA==
X-CSE-MsgGUID: N9miTe08SC6SY2qLHELoOA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,236,1712646000"; 
   d="scan'208";a="40822789"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 13 Jun 2024 17:18:20 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sHue1-0000Xz-2B;
	Fri, 14 Jun 2024 00:18:17 +0000
Date: Fri, 14 Jun 2024 08:18:03 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [krzk-github:b4/dt-bindings-mfd-syscon-split 16/18]
 arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: syscon@9a10000: compatible:
 ['syscon'] is too short
Message-ID: <202406140816.LTM0AG5O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/krzk/linux b4/dt-bindings-mfd-syscon-split
head:   035b86aab61498947d010dd7a1dd95f7343d5477
commit: d62bcc0529c132bdd0826953ebd81888d90c9d7f [16/18] dt-bindings: mfd: syscon: Split and enforce documenting MFD children
config: arm64-randconfig-051-20240614 (https://download.01.org/0day-ci/archive/20240614/202406140816.LTM0AG5O-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240614/202406140816.LTM0AG5O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406140816.LTM0AG5O-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@6af8800: 'extcon' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: usb@76f8800: 'extcon' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: syscon@9a10000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: /sound: failed to match any schema with compatible: ['qcom,apq8096-sndcard']
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: /usb2-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
   arch/arm64/boot/dts/qcom/apq8096-db820c.dtb: /usb3-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/apq8096-ifc6640.dtb: syscon@9a10000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
--
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-mtp.dtb: syscon@9a10000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
--
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: syscon@9a10000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3.dtb: /sound: failed to match any schema with compatible: ['qcom,apq8096-sndcard']
--
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: syscon@9a10000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/qcom/msm8996-oneplus3t.dtb: /sound: failed to match any schema with compatible: ['qcom,apq8096-sndcard']
--
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: syscon@9a10000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-dora.dtb: /usb3-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: syscon@9a10000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-kagura.dtb: /usb3-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: usb@6af8800: interrupts: [[0, 347, 4], [0, 243, 4]] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: usb@6af8800: interrupt-names:0: 'pwr_event' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: syscon@9a10000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/qcom/msm8996-sony-xperia-tone-keyaki.dtb: /usb3-id: failed to match any schema with compatible: ['linux,extcon-usb-gpio']
--
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: usb@6af8800: 'extcon' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: phy@7411000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: drv2604@5a: 'enable-gpios' is a required property
   	from schema $id: http://devicetree.org/schemas/input/ti,drv260x.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: syscon@9a10000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/qcom/msm8996-xiaomi-gemini.dtb: /sound: failed to match any schema with compatible: ['qcom,apq8096-sndcard']
--
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: usb@6af8800: 'extcon' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: phy@7411000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: syscon@9a10000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-natrium.dtb: /sound: failed to match any schema with compatible: ['qcom,apq8096-sndcard']
--
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800: interrupt-names:1: 'qusb2_phy' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800: interrupt-names: ['hs_phy_irq', 'ss_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@6af8800: 'extcon' does not match any of the regexes: '^usb@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: phy@7411000: 'vdd-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,qusb2-phy.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: usb@76f8800: interrupt-names: ['pwr_event', 'qusb2_phy', 'hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: syscon@9a10000: compatible: ['syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml#
   arch/arm64/boot/dts/qcom/msm8996pro-xiaomi-scorpio.dtb: /sound: failed to match any schema with compatible: ['qcom,apq8096-sndcard']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
