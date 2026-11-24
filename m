Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.13
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795564531;
	b=O2vZoByDO8J2k3iTZtD0tJ7VBx9dXoc7Mhcrt/wP1B4v73TLWtzypAaF8ZozKvXNX4B4
	 tKQ2FQ2t8gLynVQ7BqiB/apuc5PALCs3mAoevClu5AAShGkLRw2v/OpB/FfYeTIWcxXnS
	 ZjCWIcNRC0s6v+HFvwC6KhhIqP4yETr5xRUHdRQMheJSdrADVuJlYuaGATXL7fti3c+1V
	 e/AAynq28W/YJMOY/mssY9xBmLMklJ10ro/6deA5IJccORxuunIijxZuS2mJNnPdN+ay3
	 KrBi4HTJ2KN1sv1Aun8t+fOivRXZYc7u5mSKNvPSbO6C9y9h/EW5j5zrV4rTXy4Q50Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795564531;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=2oGbqJpPJIrsetPBWDHttZruI5ob49t9KGIsWtibO1M=;
	b=UjE/HZX0LzXM8fb8MnV6SgAaW0h9gjEXC91EuT4z6UeLRV3cNqseDYaIVleANiGDJMgC
	 vmevCiEySrbtAyeVl0cZrga9u2SEsZ25yZ5ziIii9vgzOWBXiFgCuIQl2bdqR7R1QBNi1
	 OkhGKXcOowNsS/uJXayiT7tupk7n5v97UQ/NmBsYsDD2bnVh617F6uoALjAkpBPwNxGHl
	 lcQG9mRFhJU1EeNQ5XfFaYKHko+1+X7jUTIZIYR3RlRGd46rVE8h0qidqQHL1jBBboHu2
	 uulqg1iVO5C19E98CwlIEJ8Xv6dj8YQYjSP9x2JXuyUmAsoWN5dkNVhsi7kNLdYkdOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GLHVc3dk;
	arc=none smtp.remote-ip=198.175.65.13
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5AD1606A321
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Nov 2026 23:55:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B5AD1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=GLHVc3dk
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795564531; x=1827100531;
  h=date:from:to:cc:subject:message-id;
  bh=X5NQvN0+oKEA7fGZ6Kp6MTBWPAhBvfnKJ6iIYlu8xDU=;
  b=GLHVc3dkE3USpEmoSAkPzA3Ib17jHK3aZpfiIoB4iSAZ9koCeD7ulpHq
   t6oOtb8TU0HjPEL/HzIOZe5WOukSMj2MYxDSQDeINHiwtbzuzzrbDfJr9
   s5zj4c/IcFZZvQR+/11pg6G1cNTzTYGQq6xKdu7Lp9uv7k663wuDhznXm
   xl9DEVbJPqzqXjDeireydz5P8geSCcep3FOpRTxpr1hSWNip7qa6MQeuV
   0eP7Rt6N5pzyAKJBQUnjr6sCvnm2+CBpcRN8UQI2SYQSVn2n6ZfsrXt2K
   ikwTv+T4RoM0HUh0ahKDxvGp4/KX0o/abGCqOA9iLeYTeQB+jUdm47Ryz
   Q==;
X-CSE-ConnectionGUID: GQCXNfFsQRmLHZ1SeEXN7g==
X-CSE-MsgGUID: AH588FkLRz+w0wrCvaREGg==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4329648"
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="4329648"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2026 15:55:30 -0800
X-CSE-ConnectionGUID: sEkgwStBQvSgEdpsccE4IA==
X-CSE-MsgGUID: aK5UiXjYT8evH1ihPNPDaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,231,1787036400"; 
   d="scan'208";a="11691676"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 24 Nov 2026 15:55:28 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xW0M9-000000005Lp-1W1V;
	Tue, 24 Nov 2026 23:55:25 +0000
Date: Wed, 25 Nov 2026 00:54:32 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-lts 318/318]
 arch/arm64/boot/dts/qcom/qcs9100-ride.dtb: phy@aec2a00
 (qcom,sa8775p-edp-phy): clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
Message-ID: <20261125004618.gu7E3Iom-lkp@intel.com>
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
head:   aeb47e4961274be51dd582e00796110922f558e7
commit: 2469039f0fd687ed351591984622e763196bff32 [318/318] arm64: dts: qcom: lemans: Add eDP ref clock for eDP PHYs
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261125/20261125004618.gu7E3Iom-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev7+g0fcb8d81a
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261125/20261125004618.gu7E3Iom-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261125004618.gu7E3Iom-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
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
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
