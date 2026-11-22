Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795373106;
	b=5i9M0LN226ZcH/LIJHDzwTiglMS3Rh2e3drTBTgwGACQvkCJLFfsQ0dn06lqWJoSiAhA
	 EN02Zfewn6K7j0cEUbLteXmveHW88W7fXNIoo7mpNBjKa0UCZGTZeK0D9kodyR/rIcgZO
	 lZnN935vaDCfJArnMGy5CHlYCgw4C6YcRziU7cw7G4FjfnQgeF3uld5qIxiMJ4XHxmk0H
	 y51zyiYbo2GEnjFKMarimJPifLbGFtBQHLFmYit+YIqnrz94bM//xoWeKQ+7H4uM38J/t
	 L5cfG3sCGPHDJCYlHE5lJtKgniJwaX5A6wSUDomJvX2Z1vT4XxSyUDKEI0oIufzQ9oA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795373106;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=9+4ONieOhE43GcATuehZmtmSpXyVIoLs/q/9EQscoXQ=;
	b=PpcQ24EID4fP4L+PSnG9w9WJS5yx4iIYqw0PIrLniof1fXwRvDhBxT4VWolNSkQP+MNG
	 SBLtQLHLwkScQ1Xf0JCbTXhYfmn52kThekYc9tbRGuxHBXovFTazMllDNmn/QFr680Xk0
	 Nq08jJOAmIow+WYuJn2Y+uoUGdV78z//5TdME9Gq9KYvcUVJtGE05nZ7SPYYLMJqzKQj6
	 fmAeMjV8zxPeyseRSLew79kNF3+18zf3wf49oBgvPhZOzsA53sGB1A5JZuAVMwfMKb5Px
	 T6a+jqLN0Mcl1SjRAbBD+mWR8Ox8NDbG/IEoYE0SBzNN5AoGaI9u3Kd4Ej3cLaKUO7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A8BVLJs+;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6242D606A69D
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Nov 2026 18:45:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6242D606A69D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=A8BVLJs+
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795373104; x=1826909104;
  h=date:from:to:cc:subject:message-id;
  bh=MbmpPhhgHkm/xuJ0IoKb/34dC+/cGfAQ14QyP8X8JZw=;
  b=A8BVLJs+4jJZy/hTG2RW0KktnmO1XSJCmrVbBUnXAaKx9Iy9xqbCC1Jv
   stEpfRBlFq46oJ89HmhrwqjbGE2WZDhweqT9GWzlm4sibeKhQ0UcebX/2
   uQS707tYCGpj1Dd0XVofZ1MUOb0y4ghPl2UKlJkcJ4AZqe4goAyXq1Bvf
   FBarFuSBIUisZ48E3wfxAilTH5h1bdnI2YBOT8Hm0LNTi1Z30Kwy+laGc
   TC1NEUTWu+wsVp2yw+vaScpAG2U1jyPe3Fy0XqzQ5lO5HgEiWUBgbsA24
   KcY9xLTCoQ4tdv8k2xLq9btaiGovlWZqIrJtWff/O2HOy32FoI0dfZowm
   w==;
X-CSE-ConnectionGUID: ndNoklKNTt6uJQvmrIMJvg==
X-CSE-MsgGUID: QBTogKQ/ToWosDW69EgcHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11974"; a="4071437"
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="4071437"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2026 10:45:04 -0800
X-CSE-ConnectionGUID: 8jwcCGyRTZ2MVTlWO8jSFw==
X-CSE-MsgGUID: 7GRMAdHzQ3muoZm7u3zaLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,227,1787036400"; 
   d="scan'208";a="11455050"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa006.fm.intel.com with ESMTP; 22 Nov 2026 10:45:02 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xVCYd-000000004ak-2u36;
	Sun, 22 Nov 2026 18:44:59 +0000
Date: Sun, 22 Nov 2026 19:44:27 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-lts 318/318]
 arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy):
 clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
Message-ID: <20261122193645.56UxdaTs-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android17-6.18-lts
head:   c29a11a6da74fe6ffbc7bc4bbcb21f2e579e814d
commit: 2469039f0fd687ed351591984622e763196bff32 [318/318] arm64: dts: qcom: lemans: Add eDP ref clock for eDP PHYs
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261122/20261122193645.56UxdaTs-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261122/20261122193645.56UxdaTs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261122193645.56UxdaTs-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/lemans.dtsi:4878.28-4939.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans.dtsi:4960.28-5012.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" or "ranges" property
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: crypto@1d88000 (qcom,sa8775p-inline-crypto-engine): 'clock-names', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: crypto@1d88000 (qcom,sa8775p-inline-crypto-engine): clocks: [[56, 199], [56, 196]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clocks: [[253, 11], [253, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clocks: [[253, 28], [253, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
   arch/arm64/boot/dts/qcom/lemans-evk.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml
--
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: crypto@1d88000 (qcom,sa8775p-inline-crypto-engine): 'clock-names', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: crypto@1d88000 (qcom,sa8775p-inline-crypto-engine): clocks: [[56, 199], [56, 196]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clocks: [[267, 11], [267, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clocks: [[267, 28], [267, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
--
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: crypto@1d88000 (qcom,sa8775p-inline-crypto-engine): 'clock-names', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: crypto@1d88000 (qcom,sa8775p-inline-crypto-engine): clocks: [[56, 199], [56, 196]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clocks: [[267, 11], [267, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clocks: [[267, 28], [267, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
   arch/arm64/boot/dts/qcom/qcs9100-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
--
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: crypto@1d88000 (qcom,sa8775p-inline-crypto-engine): 'clock-names', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: crypto@1d88000 (qcom,sa8775p-inline-crypto-engine): clocks: [[57, 199], [57, 196]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clocks: [[268, 11], [268, 1], [57, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clocks: [[268, 28], [268, 1], [57, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
--
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlcx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddwlmx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: bluetooth (qcom,wcn6855-bt): 'vddrfa1p8-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/net/bluetooth/qualcomm-bluetooth.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: crypto@1d88000 (qcom,sa8775p-inline-crypto-engine): 'clock-names', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: crypto@1d88000 (qcom,sa8775p-inline-crypto-engine): clocks: [[57, 199], [57, 196]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clocks: [[268, 11], [268, 1], [57, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clocks: [[268, 28], [268, 1], [57, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23000000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmumx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
   arch/arm64/boot/dts/qcom/sa8775p-ride-r3.dtb: wcn6855-pmu (qcom,wcn6855-pmu): 'vddpmucx-supply' is a required property
   	from schema $id: http://devicetree.org/schemas/regulator/qcom,qca6390-pmu.yaml
--
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: crypto@1d88000 (qcom,sa8775p-inline-crypto-engine): 'clock-names', 'power-domains' do not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: crypto@1d88000 (qcom,sa8775p-inline-crypto-engine): clocks: [[56, 199], [56, 196]] is too long
   	from schema $id: http://devicetree.org/schemas/crypto/qcom,inline-crypto-engine.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy): clocks: [[253, 11], [253, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
>> arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: phy@aec5a00 (qcom,sa8775p-edp-phy): clocks: [[253, 28], [253, 1], [56, 32]] is too long
   	from schema $id: http://devicetree.org/schemas/phy/qcom,edp-phy.yaml
   arch/arm64/boot/dts/qcom/lemans-evk-camera-csi1-imx577.dtb: ethernet@23040000 (qcom,sa8775p-ethqos): Unevaluated properties are not allowed ('interconnect-names', 'interconnects' were unexpected)
   	from schema $id: http://devicetree.org/schemas/net/qcom,ethqos.yaml

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
