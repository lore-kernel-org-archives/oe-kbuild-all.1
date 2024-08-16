Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 634151E4AF
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Aug 2024 15:21:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723821666; cv=none; b=PAMdGCxHeOGENQheyKbuDy7VgiMu+AQ8Z2E9SD/Gb8yKqLWNeV/vNhPM/uXHPla3qTloRl5Xz0PTWknLeKcJhxUHXpNJmpGdsBRgV3jZcvY8SzmfaU/yAbJS9GT7+b+q3Uj9zkG3Nq88VoS5ipQfhjRzzVZHEXuGPKtjnnjU4r0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723821666; c=relaxed/simple;
	bh=OC4seUTfGERVdIt9uujSi+i51mq4kDiPnNIaO+3x2oU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b2A5J+js5zQo0h/HVVFGN1VJZiLGO7eeTlSwpne7/AqJdru16feXaskcu9Z0hwu/I9LlF9Lqn6RLJ52kVU1ovd1e6Vm7aCkKYXGnFik0k3VDdwa23nt3x5VgpYZEGFLrebwtGDeBPddxAx7boTTwLQ0wWxxWGJw+w8zmiqrmyPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XtzW+SI4; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XtzW+SI4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723821664; x=1755357664;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OC4seUTfGERVdIt9uujSi+i51mq4kDiPnNIaO+3x2oU=;
  b=XtzW+SI4a9cXgw3PynMHQhTS3BTMttgG/fvlZBwQgrabUapLGnZ6A4/W
   S/4ddHOVGT2MVXO4+vk7DX/XH5Vk6kDnNvWRF6EbOQ3bP75yMdq7uK/oO
   hzKDmSm0020FrPHaZ6dXPvERiwBeVB7eujwiGyVhdtXNXguFTSmGD7lpk
   U/z+embla/Mrx7Wd7WmpOzKLkD2LxjpN/+IkvWdQ2YgxOsVBy9Fh3kjV6
   YxRAacZ+BL6NpPaymHsD29w0Ece5LY2JsQOkhhzdrrEgCjwM3LNb/nxHa
   2oFsVjsrw8GVfKiU+AE4Ldgj5uta1vHPtQlkXIfe5QkklHLVMvSFW7Tmt
   Q==;
X-CSE-ConnectionGUID: /JpK22TXQgqon/IO+Ggz+g==
X-CSE-MsgGUID: MTA/XvaySQyNj5MPkA34yw==
X-IronPort-AV: E=McAfee;i="6700,10204,11166"; a="22267969"
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="22267969"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2024 08:21:03 -0700
X-CSE-ConnectionGUID: aA+SLqj+SmCYBDAN9L3Myg==
X-CSE-MsgGUID: QtY8cXtQQTSBeSreNesJUA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,152,1719903600"; 
   d="scan'208";a="90429283"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 16 Aug 2024 08:21:00 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1seyl8-0006Zm-1m;
	Fri, 16 Aug 2024 15:20:58 +0000
Date: Fri, 16 Aug 2024 23:20:37 +0800
From: kernel test robot <lkp@intel.com>
To: Tengfei Fan <quic_tengfan@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Bjorn Andersson <andersson@kernel.org>
Subject: [linux-next:master 4780/5190]
 arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pmu@9091000: compatible: 'oneOf'
 conditional failed, one must be fixed:
Message-ID: <202408162302.x7uGlWKo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   367b5c3d53e57d51a5878816804652963da90950
commit: 1dd1a6d2b1851f8908643343c4e714af2e48352d [4780/5190] arm64: dts: qcom: sa8775p: Add CPU and LLCC BWMON
config: arm64-randconfig-052-20240816 (https://download.01.org/0day-ci/archive/20240816/202408162302.x7uGlWKo-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
dtschema version: 2024.6.dev10+ge5d88ac
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240816/202408162302.x7uGlWKo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408162302.x7uGlWKo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: usb@a4f8800: interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pmu@9091000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-llcc-bwmon', 'qcom,sc7280-llcc-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,sa8775p-llcc-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon', 'qcom,x1e80100-cpu-bwmon']
   	'qcom,sa8775p-llcc-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon', 'qcom,x1e80100-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	'qcom,sdm845-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/pmu@9091000: failed to match any schema with compatible: ['qcom,sa8775p-llcc-bwmon', 'qcom,sc7280-llcc-bwmon']
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pmu@90b5400: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,sa8775p-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon', 'qcom,x1e80100-cpu-bwmon']
   	'qcom,sa8775p-cpu-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon', 'qcom,x1e80100-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/pmu@90b5400: failed to match any schema with compatible: ['qcom,sa8775p-cpu-bwmon', 'qcom,sdm845-bwmon']
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: pmu@90b6400: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,sa8775p-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon', 'qcom,x1e80100-cpu-bwmon']
   	'qcom,sa8775p-cpu-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon', 'qcom,x1e80100-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: /soc@0/pmu@90b6400: failed to match any schema with compatible: ['qcom,sa8775p-cpu-bwmon', 'qcom,sdm845-bwmon']
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
--
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: usb@a4f8800: interrupt-names: ['pwr_event', 'hs_phy_irq', 'dp_hs_phy_irq', 'dm_hs_phy_irq'] is too short
   	from schema $id: http://devicetree.org/schemas/usb/qcom,dwc3.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pmu@9091000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-llcc-bwmon', 'qcom,sc7280-llcc-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,sa8775p-llcc-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon', 'qcom,x1e80100-cpu-bwmon']
   	'qcom,sa8775p-llcc-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon', 'qcom,x1e80100-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	'qcom,sdm845-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/pmu@9091000: failed to match any schema with compatible: ['qcom,sa8775p-llcc-bwmon', 'qcom,sc7280-llcc-bwmon']
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pmu@90b5400: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,sa8775p-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon', 'qcom,x1e80100-cpu-bwmon']
   	'qcom,sa8775p-cpu-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon', 'qcom,x1e80100-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/pmu@90b5400: failed to match any schema with compatible: ['qcom,sa8775p-cpu-bwmon', 'qcom,sdm845-bwmon']
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: pmu@90b6400: compatible: 'oneOf' conditional failed, one must be fixed:
   	['qcom,sa8775p-cpu-bwmon', 'qcom,sdm845-bwmon'] is too long
   	'qcom,msm8998-bwmon' was expected
   	'qcom,sa8775p-cpu-bwmon' is not one of ['qcom,qcm2290-cpu-bwmon', 'qcom,sc7180-cpu-bwmon', 'qcom,sc7280-cpu-bwmon', 'qcom,sc8280xp-cpu-bwmon', 'qcom,sdm845-cpu-bwmon', 'qcom,sm6115-cpu-bwmon', 'qcom,sm6350-llcc-bwmon', 'qcom,sm8250-cpu-bwmon', 'qcom,sm8550-cpu-bwmon', 'qcom,sm8650-cpu-bwmon', 'qcom,x1e80100-cpu-bwmon']
   	'qcom,sa8775p-cpu-bwmon' is not one of ['qcom,sc7180-llcc-bwmon', 'qcom,sc8280xp-llcc-bwmon', 'qcom,sm6350-cpu-bwmon', 'qcom,sm8250-llcc-bwmon', 'qcom,sm8550-llcc-bwmon', 'qcom,sm8650-llcc-bwmon', 'qcom,x1e80100-llcc-bwmon']
   	'qcom,sc7280-llcc-bwmon' was expected
   	'qcom,sdm845-llcc-bwmon' was expected
   	from schema $id: http://devicetree.org/schemas/interconnect/qcom,msm8998-bwmon.yaml#
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: /soc@0/pmu@90b6400: failed to match any schema with compatible: ['qcom,sa8775p-cpu-bwmon', 'qcom,sdm845-bwmon']
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: rsc@18200000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/soc/qcom/qcom,rpmh-rsc.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: tx-queues-config: 'snps,tx-sched-sp' does not match any of the regexes: '^queue[0-9]$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000: Unevaluated properties are not allowed ('interconnect-names', 'interconnects', 'mdio', 'phy-handle', 'phy-mode', 'power-domains', 'rx-fifo-depth', 'rx-queues-config', 'snps,mtl-rx-config', 'snps,mtl-tx-config', 'snps,pbl', 'snps,ps-speed', 'snps,tso', 'tx-fifo-depth', 'tx-queues-config' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
