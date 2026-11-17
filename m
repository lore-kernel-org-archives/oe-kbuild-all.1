Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794892270;
	b=hBqpxiQfWPPvR9110wd3SJE4N9z3sNTR+EYVDaqQhNXa0w7K+NzRJJ4aNqe76s3gPyVi
	 dr2etzl/96TvloBc9SKL6Udc/yk72rHBOwXBI2mBXX87MVGmANRlH+TKY+pzz1L0OSOnD
	 JX1flyD+TSFEVkLS7v6hnKYkgLfTXZRx/fQteIoR2TWJr6xDsi1hZSk2dP8DR1dhf8TbP
	 b+0eRQhX2XhXzD6saVR3/8MEV6okRAFBa655ZPSSyTV9ibW/RPHP6KTTvMCIe6JpOdzyT
	 A3MR0y4hkJyGRmBQh42UNotfiqeKzd3SZDcrxUyf9iIjBR3MZ2f5RrZ33ktHL+dmOKw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794892270;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=GwtHTS1YH0/WMHt63mXDi525JFgFYpy6p5czSktk0yw=;
	b=uMW0cpne7GanbhcjQHLIbDZdfwopyRRb7wTzYl2Txwcfmm41ue2g4VEkRUaO05ph7IFn
	 eVQzcQZqdnjenWZUKcCQU6RE46DqLF9ELfAd3HcuxCYqHVG0WGCEq7Q3X3ckBBy8w6Ifo
	 fdB8GC1RxtaO6RyY8BtLvkCg30XYqz3mElLL614NlcX/8t9D8l2uSD+/atJzkLSsZ9ErP
	 zoduwCc8+sG1M26yF1UTtcK4P3QKUKbkPxCpULUpO9t3US2dTs0j+BgUXlCJIjr4Mjlga
	 kJi9ip2oVrrms/y+921I9mQiGmwl8JXxebBZUiYqvHOKekOFlWJSiNtFm4E63C7SEwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZiRI8zQS;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FFF0606A31C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Nov 2026 05:11:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FFF0606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=ZiRI8zQS
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794892270; x=1826428270;
  h=date:from:to:cc:subject:message-id;
  bh=64wGPANlyejgWhDXmtGbYb9HEjI1T+d4s/ay5Aeh/BY=;
  b=ZiRI8zQSyMHPLmaEWSJf02nRbjSx+Z++soI1cWb6Cq2OqviUFCZmy0wH
   h+IyfzygoiwcLcxfbdIJvlO2daiknP2TWKBbMAwt3v1Z+8spQU7hiYmwG
   AA9uHKLK3OvNGFbJNLzxG+tZj5jUOlL6BtisxNZ8OefMFJg9N9usY7HLx
   mtKCQzeIcEBjZbqKFqIrEMVWQ+OtXgDrHC2vqVhGJmTOshXCt0PgdRZv6
   Ja+99k5Q4fqa+564yR7Q07pLD9QAv7bCfneQSFaHEQXK4v3yFjSw1Mlp4
   WfZAW6aEtHF1IjwR6DtxRBxNoTyfcCOxXk8ORgYhe94yqn1yEApb/WV5u
   g==;
X-CSE-ConnectionGUID: OH2XfsR8Q+KaBSPse7cY3Q==
X-CSE-MsgGUID: WU/jSN5fTiyLz4bQiH0sjQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11968"; a="3681084"
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="3681084"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Nov 2026 21:11:10 -0800
X-CSE-ConnectionGUID: tYyO3IE/Tj6A03z+EavJLw==
X-CSE-MsgGUID: uX5HBcT2SOa3pVfezix17A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,218,1787036400"; 
   d="scan'208";a="9742623"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa002.jf.intel.com with ESMTP; 16 Nov 2026 21:11:08 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xTBTE-000000002yY-3kjW;
	Tue, 17 Nov 2026 05:11:04 +0000
Date: Tue, 17 Nov 2026 06:10:25 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-lts 318/318]
 arch/arm64/boot/dts/qcom/lemans-evk.dtb: phy@aec2a00 (qcom,sa8775p-edp-phy):
 clock-names: ['aux', 'cfg_ahb', 'ref'] is too long
Message-ID: <202611170630.9M5tl5m6-lkp@intel.com>
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
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20261117/202611170630.9M5tl5m6-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.2.0
dtschema: 2026.10.dev6+ged91b647c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261117/202611170630.9M5tl5m6-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611170630.9M5tl5m6-lkp@intel.com/

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
