Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D17001CE0BD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Jul 2024 19:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719949626; cv=none; b=Vne/B98M96fVzwvW+EANgzZVwNbdwu4oUA3ep8i3N16bCCw5iIasUAsPPlyz72KchmLMr7yEFcyCe4XXHFuvLZgey1Q6T6N6NFMK2X1Q4eiE4rS1iT3tqDgLE7ElAZUYI8zWe9eCuD7EWXynzM3Ol90ql5lz/uL/40IBWY4VBC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719949626; c=relaxed/simple;
	bh=Z/plV+uQLSLN810VMw2Mus0kt4p9CeXHJbDD1RLUlV4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rHK6gq+PS4TPMyJGCBA21ra3m1+1EyLWxkHvCbyBOuuCcnfAy2EJR1O+IXjeVq+59R3mZPGpM6OSVoyrMIGSXvKYt0OAieXQyL1Wdbn9COuAs+7dcC8Z8EEsT3tpvE1klVdvK/w+0WSODGbiLA9GBIRFTyxHaBEDMbMJ6OpiSDU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BkgLtjU0; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BkgLtjU0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719949623; x=1751485623;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Z/plV+uQLSLN810VMw2Mus0kt4p9CeXHJbDD1RLUlV4=;
  b=BkgLtjU0hak5zgYRHMHycXoAnoaWV+92OSTGHu/Jr9VxAMzljUaUHAkz
   LyJbXwi3E+iGp9QA2GcPv/JNyu7sdkJeI5u2YM6Zda6+VM/zjv21VBonB
   eNiFDB6fmHqJ1Sd3aXep6/cl8vDjzlxWcfXnkjIuJx5wvyE2bEvukbBem
   oMqSYi+KBZ8lzttwph8PbfsUHJUCxgEI4ZkTjO0awD/UN3+6BnVsICHXb
   QNCOR3OJGVyoTxgDHSup/ouIa0QoRNttLHts7Lx2f61gNJeX7rovCVaJ6
   wX7+0IQCBJhebCz99Xg69JQnULU57v1PxiFZXn6dpoAaoNd4OIbJ2jA4q
   A==;
X-CSE-ConnectionGUID: 172idlEgRVuF2IiwFF2UMw==
X-CSE-MsgGUID: bn7RCfRmS0+8qtbQitmuwQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28538640"
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="28538640"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2024 12:47:03 -0700
X-CSE-ConnectionGUID: ABVXyPWIT4KsVll3Nl65nA==
X-CSE-MsgGUID: CrOMlD6rRj+HKfSyMORu0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,180,1716274800"; 
   d="scan'208";a="46747295"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 02 Jul 2024 12:47:01 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOjSt-000ObA-0y;
	Tue, 02 Jul 2024 19:46:59 +0000
Date: Wed, 3 Jul 2024 03:46:08 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Mark Brown <broonie@kernel.org>
Subject: [morimoto:renesas-bsp/v6.1-dev 34/44]
 arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: cs35l41@40:
 Unevaluated properties are not allowed ('interrupt-parent', 'interrupts'
 were unexpected)
Message-ID: <202407030338.4sX5cuPa-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-bsp/v6.1-dev
head:   328fdf0cdcabb46dd4d6a4c45281250d2975022a
commit: 0faf0dea698a7c49a86395da5d30138a618e54c4 [34/44] ASoC: dt-bindings: Reference common DAI properties
config: arm64-randconfig-051-20240702 (https://download.01.org/0day-ci/archive/20240703/202407030338.4sX5cuPa-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 326ba38a991250a8587a399a260b0f7af2c9166a)
dtschema version: 2024.6.dev3+g650bf2d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407030338.4sX5cuPa-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407030338.4sX5cuPa-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: soc@0: sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: clock-controller@100000: clocks: [[46, 0], [46, 1], [47]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8250.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: clock-controller@100000: clock-names:1: 'sleep_clk' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8250.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: clock-controller@100000: clock-names: ['bi_tcxo', 'bi_tcxo_ao', 'sleep_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8250.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: clock-controller@100000: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8250.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: cs35l41@40: Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs35l41.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: cs35l41@41: Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs35l41.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: /soc@0/geniqup@ac0000/i2c@a94000/touchscreen@48: failed to match any schema with compatible: ['samsung,s6sy761']
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: pci@1c00000: Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: pci@1c10000: Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx203.dtb: codec@3240000: clocks: [[96, 1], [96, 0], [97, 102, 1], [97, 103, 1], [98, 0], [99]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: soc@0: sound: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: clock-controller@100000: clocks: [[46, 0], [46, 1], [47]] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8250.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: clock-controller@100000: clock-names:1: 'sleep_clk' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8250.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: clock-controller@100000: clock-names: ['bi_tcxo', 'bi_tcxo_ao', 'sleep_clk'] is too long
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8250.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: clock-controller@100000: Unevaluated properties are not allowed ('clock-names', 'clocks' were unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8250.yaml#
>> arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: cs35l41@40: Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs35l41.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: cs35l41@41: Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs35l41.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: /soc@0/geniqup@ac0000/i2c@a94000/touchscreen@48: failed to match any schema with compatible: ['samsung,s6sy761']
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: pci@1c00000: Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: pci@1c10000: Unevaluated properties are not allowed ('dma-coherent', 'iommus' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sm8250-sony-xperia-edo-pdx206.dtb: codec@3240000: clocks: [[96, 1], [96, 0], [97, 102, 1], [97, 103, 1], [98, 0], [99]] is too long
   	from schema $id: http://devicetree.org/schemas/sound/qcom,lpass-wsa-macro.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: clock-controller@100000: clock-names:11: 'usb3_phy_wrapper_gcc_usb30_pipe_clk' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8350.yaml#
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: clock-controller@100000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8350.yaml#
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: dma-controller@800000: compatible: ['qcom,sm8350-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: dma-controller@900000: compatible: ['qcom,sm8350-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: dma-controller@a00000: compatible: ['qcom,sm8350-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: cs35l41@40: Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs35l41.yaml#
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: cs35l41@41: Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs35l41.yaml#
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx214.dtb: cpufreq@18591000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8350-cpufreq-epss', 'qcom,cpufreq-epss'] is too long
   	'qcom,cpufreq-hw' was expected
   	'qcom,sm8350-cpufreq-epss' is not one of ['qcom,sm6375-cpufreq-epss', 'qcom,sm8250-cpufreq-epss']
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-qcom-hw.yaml#
--
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: clock-controller@100000: clock-names:11: 'usb3_phy_wrapper_gcc_usb30_pipe_clk' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8350.yaml#
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: clock-controller@100000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8350.yaml#
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: dma-controller@800000: compatible: ['qcom,sm8350-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: dma-controller@900000: compatible: ['qcom,sm8350-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: dma-controller@a00000: compatible: ['qcom,sm8350-gpi-dma', 'qcom,sm6350-gpi-dma'] is too long
   	from schema $id: http://devicetree.org/schemas/dma/qcom,gpi.yaml#
>> arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: cs35l41@40: Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs35l41.yaml#
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: cs35l41@41: Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs35l41.yaml#
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: power-controller@c300000: '#power-domain-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/power/power-domain.yaml#
   arch/arm64/boot/dts/qcom/sm8350-sony-xperia-sagami-pdx215.dtb: cpufreq@18591000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sm8350-cpufreq-epss', 'qcom,cpufreq-epss'] is too long
   	'qcom,cpufreq-hw' was expected
   	'qcom,sm8350-cpufreq-epss' is not one of ['qcom,sm6375-cpufreq-epss', 'qcom,sm8250-cpufreq-epss']
   	from schema $id: http://devicetree.org/schemas/cpufreq/cpufreq-qcom-hw.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: psci: 'cpu-cluster0', 'cpu0', 'cpu1', 'cpu2', 'cpu3', 'cpu4', 'cpu5', 'cpu6', 'cpu7' do not match any of the regexes: '^power-domain-', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/psci.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@100000: clock-names:1: 'sleep_clk' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8450.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@100000: clock-names:2: 'pcie_0_pipe_clk' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8450.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@100000: clock-names:3: 'pcie_1_pipe_clk' was expected
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8450.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: clock-controller@100000: Unevaluated properties are not allowed ('clock-names' was unexpected)
   	from schema $id: http://devicetree.org/schemas/clock/qcom,gcc-sm8450.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: speaker-amp@40: Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs35l41.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: speaker-amp@41: Unevaluated properties are not allowed ('interrupt-parent', 'interrupts' were unexpected)
   	from schema $id: http://devicetree.org/schemas/sound/cirrus,cs35l41.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: pci@1c00000: Unevaluated properties are not allowed ('iommus', 'power-domain-names' were unexpected)
   	from schema $id: http://devicetree.org/schemas/pci/qcom,pcie.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: interconnect@16e0000: Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,rpmh.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: interconnect@1700000: Unevaluated properties are not allowed ('clocks' was unexpected)
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,rpmh.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: phy@88e3000: compatible: ['qcom,sm8450-usb-hs-phy', 'qcom,usb-snps-hs-7nm-phy'] is too long

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
