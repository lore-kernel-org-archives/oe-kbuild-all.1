Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E23F394464
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Mar 2026 08:13:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774426414; cv=none; b=k+sc4lbyyUfWDcJKO4yHgosnpUCBQr+EHUJW4IpHPMI6TYHaeFMldXrCYgqvmX2C+G62AHAeZztcTlIGYTAdaO/ydkqYg9N80CwJJUA9MLrZh2jPKYDFhKzspkugH0HlMGkMkZAcsA76Tapi0EL7GhlZnpRTvdGnz/WpaVfyjO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774426414; c=relaxed/simple;
	bh=HNn7EDQywEJX+gVeKleGiQDRKcBmgyu509R5Xi6zokU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=LAAwVnOm9ICUJpyKIKrUbpa5DYKTokB1cVjjiB3x3P2qZK4hQn9VipMNgcI+45R4ed7WRxiHTVKsb4PfcEBU5R5TafLfw6He1sEANlJuALaLCnnEIARXF/NyYrwUF+5YVfBs/eqPi6fKgvs5T9kYGjFmQa3kj3L2p1yoUZ/kzBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f9jDbXrb; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f9jDbXrb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774426412; x=1805962412;
  h=date:from:to:cc:subject:message-id;
  bh=HNn7EDQywEJX+gVeKleGiQDRKcBmgyu509R5Xi6zokU=;
  b=f9jDbXrbdIy0lSD8DTXy1dASaJW9EMN3MZeXEYRCcGqAv2kp/Xhtv7HC
   +NNvYBdCbydcyIQMhenAW0q5cz3NXGXVbvX++rZGvix3g7LbAef423dpO
   JkO9O43XXCyFanc6AvvfCfZKEO5scKWK4or1O0TNL14btDD4OWBbYdDbC
   xFcYyp80mvGidaTQUeVrqrEL/VnVtVuz9KrZIcN8gCocCP9xobLBQN+Hw
   Akx162Q24cK82kPdfQoFsyeepSZ6bXYZ6ACmSOZ8Uk1kJZaJeYTuhN2NK
   PoPDn7vTqcXdS+LYnG57aKVGYGKY4hJ2/Gay4eo+Tr6tPcQzIGlM0FLyc
   Q==;
X-CSE-ConnectionGUID: QBwfcW+FRQCcO82Y5uBLMA==
X-CSE-MsgGUID: 3i/zIgIQRGW9zYgpVvebAQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11739"; a="75526351"
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="75526351"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Mar 2026 01:13:31 -0700
X-CSE-ConnectionGUID: HeCb7w5EQuCmV5gPEbw9Xw==
X-CSE-MsgGUID: NzUZlmlgT422cXo/4BgBIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,139,1770624000"; 
   d="scan'208";a="262538004"
Received: from igk-lkp-server01.igk.intel.com (HELO 9958d990ccf2) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 25 Mar 2026 01:13:29 -0700
Received: from kbuild by 9958d990ccf2 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w5JMk-0000000073d-3Zy6;
	Wed, 25 Mar 2026 08:13:26 +0000
Date: Wed, 25 Mar 2026 09:12:31 +0100
From: kernel test robot <lkp@intel.com>
To: Wesley Cheng <wesley.cheng@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abel Vesa <abel.vesa@oss.qualcomm.com>
Subject: [linux-next:master 7247/8611]
 arch/arm64/boot/dts/qcom/glymur-crd.dtb: clock-controller@100000
 (qcom,glymur-gcc): clocks: [[58, 0], [58, 1], [59], [0], [0], [0], [0], [0],
 [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [60], [61], [62],
 [63], [0], [0], [0], [0], [0], [0], [0],...
Message-ID: <202603250928.hGD5tCON-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   85964cdcad0fac9a0eb7b87a0f9d88cc074b854c
commit: 83f88b7dda2c71fd5ff0b0b44b47e20a51270ae4 [7247/8611] arm64: dts: qcom: glymur: Add USB related nodes
config: arm64-randconfig-2051-20260324 (https://download.01.org/0day-ci/archive/20260325/202603250928.hGD5tCON-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project f43d6834093b19baf79beda8c0337ab020ac5f17)
dtschema: 2025.13.dev8+g0515abdd9
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260325/202603250928.hGD5tCON-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603250928.hGD5tCON-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/glymur.dtsi:3998.23-4064.5: Warning (simple_bus_reg): /soc@0/usb@a2f8800: simple-bus unit address format error, expected "a200000"
   arch/arm64/boot/dts/qcom/glymur.dtsi:5422.36-5454.5: Warning (simple_bus_reg): /soc@0/system-cache-controller@20400000: simple-bus unit address format error, expected "21800000"
   arch/arm64/boot/dts/qcom/glymur.dtsi:5463.23-5480.5: Warning (simple_bus_reg): /soc@0/sram@81e08000: simple-bus unit address format error, expected "81e08600"
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: clock-controller@100000 (qcom,glymur-gcc): clocks: [[58, 0], [58, 1], [59], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [60], [61], [62], [63], [0], [0], [0], [0], [0], [0], [0], [0], [0], [64, 0], [65, 0], [66, 0], [67], [0], [68], [0], [0], [0], [0], [0], [0], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@fa3000 (qcom,glymur-qmp-usb3-uni-phy): clock-names:1: 'ref' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@fa3000 (qcom,glymur-qmp-usb3-uni-phy): clock-names:2: 'com_aux' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@fa3000 (qcom,glymur-qmp-usb3-uni-phy): clock-names:3: 'pipe' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@fa3000 (qcom,glymur-qmp-usb3-uni-phy): clock-names: ['aux', 'clkref', 'ref', 'com_aux', 'pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@fa3000 (qcom,glymur-qmp-usb3-uni-phy): clocks: [[70, 329], [42, 9], [58, 0], [70, 331], [70, 332]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@fa5000 (qcom,glymur-qmp-usb3-uni-phy): clock-names:1: 'ref' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@fa5000 (qcom,glymur-qmp-usb3-uni-phy): clock-names:2: 'com_aux' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@fa5000 (qcom,glymur-qmp-usb3-uni-phy): clock-names:3: 'pipe' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@fa5000 (qcom,glymur-qmp-usb3-uni-phy): clock-names: ['aux', 'clkref', 'ref', 'com_aux', 'pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@fa5000 (qcom,glymur-qmp-usb3-uni-phy): clocks: [[70, 329], [42, 10], [58, 0], [70, 331], [70, 334]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@fde000 (qcom,glymur-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'clkref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@fde000 (qcom,glymur-qmp-usb3-dp-phy): clocks: [[70, 341], [58, 0], [70, 343], [70, 344], [42, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@fde000 (qcom,glymur-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@88e1000 (qcom,glymur-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'clkref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@88e1000 (qcom,glymur-qmp-usb3-dp-phy): clocks: [[70, 346], [58, 0], [70, 348], [70, 349], [42, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/glymur-crd.dtb: phy@88e1000 (qcom,glymur-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/glymur-crd.dtb: usb@a2f8800 (qcom,glymur-dwc3): interrupt-names:4: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
--
   arch/arm64/boot/dts/qcom/glymur.dtsi:3998.23-4064.5: Warning (simple_bus_reg): /soc@0/usb@a2f8800: simple-bus unit address format error, expected "a200000"
   arch/arm64/boot/dts/qcom/glymur.dtsi:5422.36-5454.5: Warning (simple_bus_reg): /soc@0/system-cache-controller@20400000: simple-bus unit address format error, expected "21800000"
   arch/arm64/boot/dts/qcom/glymur.dtsi:5463.23-5480.5: Warning (simple_bus_reg): /soc@0/sram@81e08000: simple-bus unit address format error, expected "81e08600"
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: interconnect-0 (qcom,mahua-clk-virt): compatible:0: 'qcom,mahua-clk-virt' is not one of ['qcom,glymur-aggre1-noc', 'qcom,glymur-aggre2-noc', 'qcom,glymur-aggre3-noc', 'qcom,glymur-aggre4-noc', 'qcom,glymur-clk-virt', 'qcom,glymur-cnoc-cfg', 'qcom,glymur-cnoc-main', 'qcom,glymur-hscnoc', 'qcom,glymur-lpass-ag-noc', 'qcom,glymur-lpass-lpiaon-noc', 'qcom,glymur-lpass-lpicx-noc', 'qcom,glymur-mc-virt', 'qcom,glymur-mmss-noc', 'qcom,glymur-nsinoc', 'qcom,glymur-nsp-noc', 'qcom,glymur-oobm-ss-noc', 'qcom,glymur-pcie-east-anoc', 'qcom,glymur-pcie-east-slv-noc', 'qcom,glymur-pcie-west-anoc', 'qcom,glymur-pcie-west-slv-noc', 'qcom,glymur-system-noc']
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,glymur-rpmh.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: interconnect-0 (qcom,mahua-clk-virt): compatible: ['qcom,mahua-clk-virt', 'qcom,glymur-clk-virt'] is too long
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,glymur-rpmh.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: /interconnect-0: failed to match any schema with compatible: ['qcom,mahua-clk-virt', 'qcom,glymur-clk-virt']
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: /interconnect-1: failed to match any schema with compatible: ['qcom,mahua-mc-virt']
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: clock-controller@100000 (qcom,glymur-gcc): clocks: [[44, 0], [44, 1], [45], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [0], [46], [47], [48], [49], [0], [0], [0], [0], [0], [0], [0], [0], [0], [50, 0], [51, 0], [52, 0], [53], [0], [54], [0], [0], [0], [0], [0], [0], [0]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,glymur-gcc.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@fa3000 (qcom,glymur-qmp-usb3-uni-phy): clock-names:1: 'ref' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@fa3000 (qcom,glymur-qmp-usb3-uni-phy): clock-names:2: 'com_aux' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@fa3000 (qcom,glymur-qmp-usb3-uni-phy): clock-names:3: 'pipe' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@fa3000 (qcom,glymur-qmp-usb3-uni-phy): clock-names: ['aux', 'clkref', 'ref', 'com_aux', 'pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@fa3000 (qcom,glymur-qmp-usb3-uni-phy): clocks: [[56, 329], [29, 9], [44, 0], [56, 331], [56, 332]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@fa5000 (qcom,glymur-qmp-usb3-uni-phy): clock-names:1: 'ref' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@fa5000 (qcom,glymur-qmp-usb3-uni-phy): clock-names:2: 'com_aux' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@fa5000 (qcom,glymur-qmp-usb3-uni-phy): clock-names:3: 'pipe' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@fa5000 (qcom,glymur-qmp-usb3-uni-phy): clock-names: ['aux', 'clkref', 'ref', 'com_aux', 'pipe'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@fa5000 (qcom,glymur-qmp-usb3-uni-phy): clocks: [[56, 329], [29, 10], [44, 0], [56, 331], [56, 334]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb3-uni-phy.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@fde000 (qcom,glymur-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'clkref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@fde000 (qcom,glymur-qmp-usb3-dp-phy): clocks: [[56, 341], [44, 0], [56, 343], [56, 344], [29, 11]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@fde000 (qcom,glymur-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: interconnect@1500000 (qcom,mahua-cnoc-main): compatible:0: 'qcom,mahua-cnoc-main' is not one of ['qcom,glymur-aggre1-noc', 'qcom,glymur-aggre2-noc', 'qcom,glymur-aggre3-noc', 'qcom,glymur-aggre4-noc', 'qcom,glymur-clk-virt', 'qcom,glymur-cnoc-cfg', 'qcom,glymur-cnoc-main', 'qcom,glymur-hscnoc', 'qcom,glymur-lpass-ag-noc', 'qcom,glymur-lpass-lpiaon-noc', 'qcom,glymur-lpass-lpicx-noc', 'qcom,glymur-mc-virt', 'qcom,glymur-mmss-noc', 'qcom,glymur-nsinoc', 'qcom,glymur-nsp-noc', 'qcom,glymur-oobm-ss-noc', 'qcom,glymur-pcie-east-anoc', 'qcom,glymur-pcie-east-slv-noc', 'qcom,glymur-pcie-west-anoc', 'qcom,glymur-pcie-west-slv-noc', 'qcom,glymur-system-noc']
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,glymur-rpmh.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: interconnect@1500000 (qcom,mahua-cnoc-main): compatible: ['qcom,mahua-cnoc-main', 'qcom,glymur-cnoc-main'] is too long
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,glymur-rpmh.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: /soc@0/interconnect@1500000: failed to match any schema with compatible: ['qcom,mahua-cnoc-main', 'qcom,glymur-cnoc-main']
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: /soc@0/interconnect@1600000: failed to match any schema with compatible: ['qcom,mahua-cnoc-cfg']
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: interconnect@1680000 (qcom,mahua-system-noc): compatible:0: 'qcom,mahua-system-noc' is not one of ['qcom,glymur-aggre1-noc', 'qcom,glymur-aggre2-noc', 'qcom,glymur-aggre3-noc', 'qcom,glymur-aggre4-noc', 'qcom,glymur-clk-virt', 'qcom,glymur-cnoc-cfg', 'qcom,glymur-cnoc-main', 'qcom,glymur-hscnoc', 'qcom,glymur-lpass-ag-noc', 'qcom,glymur-lpass-lpiaon-noc', 'qcom,glymur-lpass-lpicx-noc', 'qcom,glymur-mc-virt', 'qcom,glymur-mmss-noc', 'qcom,glymur-nsinoc', 'qcom,glymur-nsp-noc', 'qcom,glymur-oobm-ss-noc', 'qcom,glymur-pcie-east-anoc', 'qcom,glymur-pcie-east-slv-noc', 'qcom,glymur-pcie-west-anoc', 'qcom,glymur-pcie-west-slv-noc', 'qcom,glymur-system-noc']
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,glymur-rpmh.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: interconnect@1680000 (qcom,mahua-system-noc): compatible: ['qcom,mahua-system-noc', 'qcom,glymur-system-noc'] is too long
--
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: interconnect@7420000 (qcom,mahua-lpass-lpicx-noc): compatible:0: 'qcom,mahua-lpass-lpicx-noc' is not one of ['qcom,glymur-aggre1-noc', 'qcom,glymur-aggre2-noc', 'qcom,glymur-aggre3-noc', 'qcom,glymur-aggre4-noc', 'qcom,glymur-clk-virt', 'qcom,glymur-cnoc-cfg', 'qcom,glymur-cnoc-main', 'qcom,glymur-hscnoc', 'qcom,glymur-lpass-ag-noc', 'qcom,glymur-lpass-lpiaon-noc', 'qcom,glymur-lpass-lpicx-noc', 'qcom,glymur-mc-virt', 'qcom,glymur-mmss-noc', 'qcom,glymur-nsinoc', 'qcom,glymur-nsp-noc', 'qcom,glymur-oobm-ss-noc', 'qcom,glymur-pcie-east-anoc', 'qcom,glymur-pcie-east-slv-noc', 'qcom,glymur-pcie-west-anoc', 'qcom,glymur-pcie-west-slv-noc', 'qcom,glymur-system-noc']
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,glymur-rpmh.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: interconnect@7420000 (qcom,mahua-lpass-lpicx-noc): compatible: ['qcom,mahua-lpass-lpicx-noc', 'qcom,glymur-lpass-lpicx-noc'] is too long
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,glymur-rpmh.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: /soc@0/interconnect@7420000: failed to match any schema with compatible: ['qcom,mahua-lpass-lpicx-noc', 'qcom,glymur-lpass-lpicx-noc']
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: interconnect@7e40000 (qcom,mahua-lpass-ag-noc): compatible:0: 'qcom,mahua-lpass-ag-noc' is not one of ['qcom,glymur-aggre1-noc', 'qcom,glymur-aggre2-noc', 'qcom,glymur-aggre3-noc', 'qcom,glymur-aggre4-noc', 'qcom,glymur-clk-virt', 'qcom,glymur-cnoc-cfg', 'qcom,glymur-cnoc-main', 'qcom,glymur-hscnoc', 'qcom,glymur-lpass-ag-noc', 'qcom,glymur-lpass-lpiaon-noc', 'qcom,glymur-lpass-lpicx-noc', 'qcom,glymur-mc-virt', 'qcom,glymur-mmss-noc', 'qcom,glymur-nsinoc', 'qcom,glymur-nsp-noc', 'qcom,glymur-oobm-ss-noc', 'qcom,glymur-pcie-east-anoc', 'qcom,glymur-pcie-east-slv-noc', 'qcom,glymur-pcie-west-anoc', 'qcom,glymur-pcie-west-slv-noc', 'qcom,glymur-system-noc']
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,glymur-rpmh.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: interconnect@7e40000 (qcom,mahua-lpass-ag-noc): compatible: ['qcom,mahua-lpass-ag-noc', 'qcom,glymur-lpass-ag-noc'] is too long
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,glymur-rpmh.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: /soc@0/interconnect@7e40000: failed to match any schema with compatible: ['qcom,mahua-lpass-ag-noc', 'qcom,glymur-lpass-ag-noc']
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@88e1000 (qcom,glymur-qmp-usb3-dp-phy): clock-names: ['aux', 'ref', 'com_aux', 'usb3_pipe', 'clkref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@88e1000 (qcom,glymur-qmp-usb3-dp-phy): clocks: [[56, 346], [44, 0], [56, 348], [56, 349], [29, 12]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
>> arch/arm64/boot/dts/qcom/mahua-crd.dtb: phy@88e1000 (qcom,glymur-qmp-usb3-dp-phy): clock-names:4: 'cfg_ahb' was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-usb43dp-phy.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: usb@a2f8800 (qcom,glymur-dwc3): interrupt-names:4: 'ss_phy_irq' was expected
   	from schema $id: http://devicetree.org/schemas/usb/qcom,snps-dwc3.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: interconnect@1d600000 (qcom,mahua-nsinoc): compatible:0: 'qcom,mahua-nsinoc' is not one of ['qcom,glymur-aggre1-noc', 'qcom,glymur-aggre2-noc', 'qcom,glymur-aggre3-noc', 'qcom,glymur-aggre4-noc', 'qcom,glymur-clk-virt', 'qcom,glymur-cnoc-cfg', 'qcom,glymur-cnoc-main', 'qcom,glymur-hscnoc', 'qcom,glymur-lpass-ag-noc', 'qcom,glymur-lpass-lpiaon-noc', 'qcom,glymur-lpass-lpicx-noc', 'qcom,glymur-mc-virt', 'qcom,glymur-mmss-noc', 'qcom,glymur-nsinoc', 'qcom,glymur-nsp-noc', 'qcom,glymur-oobm-ss-noc', 'qcom,glymur-pcie-east-anoc', 'qcom,glymur-pcie-east-slv-noc', 'qcom,glymur-pcie-west-anoc', 'qcom,glymur-pcie-west-slv-noc', 'qcom,glymur-system-noc']
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,glymur-rpmh.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: interconnect@1d600000 (qcom,mahua-nsinoc): compatible: ['qcom,mahua-nsinoc', 'qcom,glymur-nsinoc'] is too long
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,glymur-rpmh.yaml
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: /soc@0/interconnect@1d600000: failed to match any schema with compatible: ['qcom,mahua-nsinoc', 'qcom,glymur-nsinoc']
   arch/arm64/boot/dts/qcom/mahua-crd.dtb: interconnect@1f300000 (qcom,mahua-oobm-ss-noc): compatible:0: 'qcom,mahua-oobm-ss-noc' is not one of ['qcom,glymur-aggre1-noc', 'qcom,glymur-aggre2-noc', 'qcom,glymur-aggre3-noc', 'qcom,glymur-aggre4-noc', 'qcom,glymur-clk-virt', 'qcom,glymur-cnoc-cfg', 'qcom,glymur-cnoc-main', 'qcom,glymur-hscnoc', 'qcom,glymur-lpass-ag-noc', 'qcom,glymur-lpass-lpiaon-noc', 'qcom,glymur-lpass-lpicx-noc', 'qcom,glymur-mc-virt', 'qcom,glymur-mmss-noc', 'qcom,glymur-nsinoc', 'qcom,glymur-nsp-noc', 'qcom,glymur-oobm-ss-noc', 'qcom,glymur-pcie-east-anoc', 'qcom,glymur-pcie-east-slv-noc', 'qcom,glymur-pcie-west-anoc', 'qcom,glymur-pcie-west-slv-noc', 'qcom,glymur-system-noc']
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,glymur-rpmh.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
