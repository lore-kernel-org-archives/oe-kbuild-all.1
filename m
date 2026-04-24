Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7341A267
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 Apr 2026 09:25:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777022708; cv=none; b=AP1Zz29KJ/EEvPcbPXU1snUdlVaWZ5CNqXw8m3vr1XYygT/AM9VUDjDR5YIG1iRdEmmIKFB5mo/7THD5/dZ9mO0bAWQYTbyGGY/BWtA+qayaUcIIhQ1wg6JBYqiKRMNqpguQ4ExkMNJmBP5fc+l772b5D4TG7mn9sgdIzg8xnV8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777022708; c=relaxed/simple;
	bh=B7KONfNSUsO+whVFraw7Y9K6Mn+rXMpHn/OT9i09mHw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fReDDIoPphiqJpr6IL/mgnai6pzwfyIqt8hWFuVWXoaDbhLQdzwSaqoXMJxFma9wsTJDh2NrxcTW1nWf2GH7wRE81uCExn/rVjGCfaznn5YyaVUfOGD+VEelqYmImluZE3r57mfDOz/YYceQNEKpNm8gqCETena+rcSrbNxgATk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TT5ymLcs; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TT5ymLcs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777022703; x=1808558703;
  h=date:from:to:cc:subject:message-id;
  bh=B7KONfNSUsO+whVFraw7Y9K6Mn+rXMpHn/OT9i09mHw=;
  b=TT5ymLcsY3oVGNyfLw+HdBoPo6REDUUXxd/VZP+AWimeqqjPjJQmTArz
   ypWYA6SrPL6KsIP2HdH/ORZPVnvy1srWwjxwYVGhwSDOPaCGTfHFUMB26
   XOcVn2Z2DTrSNgRFQT5AQV6It5Gxw3yFRKN/7x1HsFZLomgkBnaCbjCLF
   jdRH3jQWT4aOnrAvcUqjUHBE0W9bfeA0GI9jB8rU6aFm9lmATZibVf0S9
   9H19OSdvhPDLTU1kRk9Hy9aHR5dWDVAjhQkJ93GfPDRKUuwC/wr8eCpPM
   LTzuZcHZARBWwCJqI3qnnvASTVsKyUtiK5T33CqvV1wCgvNRRC3sGlzpm
   A==;
X-CSE-ConnectionGUID: 0s/JDFr+RG2L9gc5/WJR8w==
X-CSE-MsgGUID: WwKTNuHZRYeV8IWInj0/AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11765"; a="77166476"
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="77166476"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Apr 2026 02:25:02 -0700
X-CSE-ConnectionGUID: i333TNUURk258LAN3gPivg==
X-CSE-MsgGUID: t0JwOi3wSG+tjFriOworPw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,196,1770624000"; 
   d="scan'208";a="234700367"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa004.fm.intel.com with ESMTP; 24 Apr 2026 02:25:00 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wGCmQ-000000003Eb-2Y8i;
	Fri, 24 Apr 2026 09:24:58 +0000
Date: Fri, 24 Apr 2026 11:23:59 +0200
From: kernel test robot <lkp@intel.com>
To: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev, "Rob Herring (Arm)" <robh@kernel.org>,
 Krzysztof Kozlowski <krzk@kernel.org>
Subject: [linux-next:master 12437/14115]
 arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: sram@0 (mmio-sram):
 pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the
 given schema
Message-ID: <202604241135.Z7429abx-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c7275b05bc428c7373d97aa2da02d3a7fa6b9f66
commit: 738dd185d3e447e1dfa65b5287730fef456089bf [12437/14115] dt-bindings: sram: Allow multiple-word prefixes to sram subnode
config: arm-randconfig-2053-20260411 (https://download.01.org/0day-ci/archive/20260424/202604241135.Z7429abx-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.5.0
dtschema: 2026.5.dev2+g3579443c5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260424/202604241135.Z7429abx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604241135.Z7429abx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir2110.dtb: mpcie-power-switch (regulator-output): 'regulator-name', 'regulator-supplies' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/regulator-output.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir3220.dtb: mpcie-power-switch (regulator-output): 'regulator-name', 'regulator-supplies' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/regulator-output.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am335x-baltos-ir5221.dtb: mpcie-power-switch (regulator-output): 'regulator-name', 'regulator-supplies' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/regulator-output.yaml
--
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-bone.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-bone.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-bone.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-boneblack.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-boneblack-wireless.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am335x-boneblue.dtb: leds (gpio-leds): wifi_led:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'phy0assoc' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'phy0assoc' does not match '^cpu[0-9]*$'
   	'phy0assoc' does not match '^hci[0-9]+-power$'
--
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-wireless.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-bonegreen-eco.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-chiliboard.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-cm-t335.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-evm.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-evm.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am335x-evm.dtb: panel (tfc,s9700rtwv43tr-01b): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/tfc,s9700rtwv43tr-01b.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: gpio_buttons0 (gpio-keys): '#address-cells', '#size-cells', 'switch1', 'switch2', 'switch3', 'switch4' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
   arch/arm/boot/dts/ti/omap/am335x-evmsk.dtb: panel (newhaven,nhd-4.3-480272ef-atxl): 'power-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/display/panel/panel-simple.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /panel: failed to match any schema with compatible: ['ti,tilcdc,panel']
   arch/arm/boot/dts/ti/omap/am335x-guardian.dtb: /mt_keypad@0: failed to match any schema with compatible: ['gpio-mt-keypad']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am335x-icev2.dtb: /gpio-decoder: failed to match any schema with compatible: ['gpio-decoder']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-lxm.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-mba335x.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-mba335x.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-mba335x.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-mba335x.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-mba335x.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-mba335x.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-mba335x.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-mba335x.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-mba335x.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-mba335x.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-mba335x.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-mba335x.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-mba335x.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-mba335x.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-mba335x.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-2101.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-moxa-uc-8100-me-t.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am335x-myirtech-myd.dtb: gpio_buttons (gpio-keys): '#address-cells', '#size-cells', 'button@0', 'button@1' do not match any of the regexes: '^(button|event|key|switch|(button|event|key|switch)-[a-z0-9-]+|[a-z0-9-]+-(button|event|key|switch))$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-nano.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-nano.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: nor@0,0 (cfi-flash): $nodename:0: 'nor@0,0' does not match '^(flash|.*sram|nand)(@.*)?$'
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: nor@0,0 (cfi-flash): Unevaluated properties are not allowed ('partition@0', 'partition@1', 'partition@2', 'partition@3', 'partition@4', 'partition@5', 'partition@6' were unexpected)
   	from schema $id: http://devicetree.org/schemas/mtd/mtd-physmap.yaml
   arch/arm/boot/dts/ti/omap/am335x-nano.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcan-plus-1xx.dtb: mpcie-power-switch (regulator-output): 'regulator-name', 'regulator-supplies' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/regulator-output.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-2xx.dtb: mpcie-power-switch (regulator-output): 'regulator-name', 'regulator-supplies' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/regulator-output.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am335x-netcom-plus-8xx.dtb: mpcie-power-switch (regulator-output): 'regulator-name', 'regulator-supplies' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/regulator/regulator-output.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am335x-pdu001.dtb: /panel: failed to match any schema with compatible: ['ti,tilcdc,panel']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /lcd_panel: failed to match any schema with compatible: ['ti,tilcdc,panel']
   arch/arm/boot/dts/ti/omap/am335x-pepper.dtb: /sound_iface: failed to match any schema with compatible: ['ti,da830-evm-audio']
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-phycore-rdk.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-pocketbeagle.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am335x-regor-rdk.dtb: user-leds (gpio-leds): run_stop-led:linux,default-trigger: 'oneOf' conditional failed, one must be fixed:
   	'gpio' is not one of ['backlight', 'default-on', 'heartbeat', 'disk-activity', 'disk-read', 'disk-write', 'timer', 'pattern', 'audio-micmute', 'audio-mute', 'bluetooth-power', 'flash', 'kbd-capslock', 'mtd', 'nand-disk', 'netdev', 'none', 'rc-feedback', 'torch', 'usb-gadget', 'usb-host', 'usbport']
   	'gpio' does not match '^cpu[0-9]*$'
   	'gpio' does not match '^hci[0-9]+-power$'
--
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-lite.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-sancloud-bbe-extended-wifi.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-shc.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-shc.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-shc.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: /panel: failed to match any schema with compatible: ['ti,tilcdc,panel']
   arch/arm/boot/dts/ti/omap/am335x-sbc-t335.dtb: display-timings: 'dvi', 'lcd' do not match any of the regexes: '^pinctrl-[0-9]+$', '^timing'
   	from schema $id: http://devicetree.org/schemas/display/panel/display-timings.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
   arch/arm/boot/dts/ti/omap/am335x-sl50.dtb: clocks (simple-bus): oscillator@0: 'anyOf' conditional failed, one must be fixed:
   	'reg' is a required property
   	'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
--
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/target-module@49000000/dma@0: failed to match any schema with compatible: ['ti,edma3-tpcc']
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-wega-rdk.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml
--
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/target-module@49800000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/target-module@49900000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/target-module@49a00000/dma@0: failed to match any schema with compatible: ['ti,edma3-tptc']
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/target-module@47400000/usb-phy@1300: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/target-module@47400000/usb@1400: failed to match any schema with compatible: ['ti,musb-am33xx']
   	from schema $id: http://devicetree.org/schemas/interrupts.yaml
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/target-module@47400000/usb-phy@1b00: failed to match any schema with compatible: ['ti,am335x-usb-phy']
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/target-module@47400000/usb@1800: failed to match any schema with compatible: ['ti,musb-am33xx']
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/target-module@47400000/dma-controller@2000: failed to match any schema with compatible: ['ti,am3359-cppi41']
>> arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: sram@0 (mmio-sram): pm-code-sram@0:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
>> arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: sram@0 (mmio-sram): pm-data-sram@1000:compatible: ['ti,sram'] does not contain items matching the given schema
   	from schema $id: http://devicetree.org/schemas/sram/sram.yaml
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/target-module@40300000/sram@0/pm-code-sram@0: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/target-module@40300000/sram@0/pm-data-sram@1000: failed to match any schema with compatible: ['ti,sram']
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: /ocp/target-module@4c000000/emif@0: failed to match any schema with compatible: ['ti,emif-am3352']
   arch/arm/boot/dts/ti/omap/am335x-osd3358-sm-red.dtb: sham@0 (ti,omap4-sham): 'ti,hwmods' is a required property
   	from schema $id: http://devicetree.org/schemas/crypto/ti,omap-sham.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
