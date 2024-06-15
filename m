Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8AA416426
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 19:27:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718479661; cv=none; b=VEnp9BZHwrZpurEYfVi8q94gCbUyuGWvke0Sjl28aUWaNap5twnjcSGkrUurk3c3eN3dempmTsQy1cd9ReOPsPzo4kfmnGHs4UjY/GmN+o3bWtxRG48fVQFNFwKTC4GCnGCrg2Ws+Lb12DXLKYiaDNBdM/B9PWy6B4ReHz81flA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718479661; c=relaxed/simple;
	bh=1HwrW5+9yPlEKkXZvDv6QiUUlplU0qOLF4+5aoIPUIc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nFH6EQX2qXlH975FZNwFzskJII0oW2JDrK624lkF/3IBubBKC9tq8l7XcMhXi3q/LSlJS5O09+PDg4aezj8E8/x2CNJugMc17tVMYJ+eRwJH21J2ms7pm2J6YDIzNjctWP3R61bg2078zZAoq5CRA1AwJ8J02jwxtn30Vg05Vqw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+LRfG4H; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+LRfG4H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718479659; x=1750015659;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1HwrW5+9yPlEKkXZvDv6QiUUlplU0qOLF4+5aoIPUIc=;
  b=f+LRfG4H8lsQqW9gtTlc/iNTpTvce1qdUyC7lj+qlROwDnlNHdtQ0H7Q
   TKzJJudnj5CYUAhE24EvCOehEnmEXpUZej9I4NcwdcZywPD1C+Ld483WC
   PgcQlSW3flc217gbL2R1xS2QkKhTY5UrbDMB9lA9se5W6w6+JuUmjGPr/
   sn+Bf4c7v91KlTAuysQAAs/QjyPsf9Nb4t/yui37gdxKzmLZHIjoZTtNy
   IEkonMTMeVFRza47XOPTf0lmyx9kpa3EgtahmlgwSFV1AC2ctBqvYzMr1
   5RupqeIffPTOkKvzY3yg2oBDyMIvLzbVnS6E/1we2SpwSzwnIByJSfE6i
   Q==;
X-CSE-ConnectionGUID: YaNcjqWMQiWYo0Kg2v2RLQ==
X-CSE-MsgGUID: eUnALswsQ4yQYdaGyRHxPQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11104"; a="15080454"
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="15080454"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jun 2024 12:27:38 -0700
X-CSE-ConnectionGUID: r10GnI6eTZSyBiR8Q4ZJRA==
X-CSE-MsgGUID: GSLEzf7VR4G7wQw4vQxkXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,241,1712646000"; 
   d="scan'208";a="41302212"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 15 Jun 2024 12:27:36 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIZ3m-0000R8-15;
	Sat, 15 Jun 2024 19:27:34 +0000
Date: Sun, 16 Jun 2024 03:26:43 +0800
From: kernel test robot <lkp@intel.com>
To: Unnathi Chalicheemala <quic_uchalich@quicinc.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>
Subject: [qcom:drivers-for-6.11 16/20]
 arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: system-cache-controller@19200000:
 reg: [[0, 421527552, 0, 524288], [0, 425721856, 0, 524288], [0, 422576128,
 0, 524288], [0, 426770432, 0, 524288], [0, 429916160, 0, 524288]] is too
 short
Message-ID: <202406160346.FmNRhxL5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux drivers-for-6.11
head:   75287992f58a74271a083fef0356bc81d629f671
commit: c190f390a852a2b892dbc8a70fed08118ef056ff [16/20] dt-bindings: arm: msm: Add llcc Broadcast_AND register
config: arm64-randconfig-051-20240615 (https://download.01.org/0day-ci/archive/20240616/202406160346.FmNRhxL5-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406160346.FmNRhxL5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406160346.FmNRhxL5-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3149.27-3220.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3241.27-3293.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: phy@1c0e000: clock-output-names: ['pcie_1_pipe_clk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: phy@1c0e000: #clock-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: system-cache-controller@19200000: reg: [[0, 421527552, 0, 524288], [0, 425721856, 0, 524288], [0, 422576128, 0, 524288], [0, 426770432, 0, 524288], [0, 429916160, 0, 524288]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: system-cache-controller@19200000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-hdk.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3149.27-3220.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3241.27-3293.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3112.11-3122.7: Warning (graph_child_address): /soc@0/display-subsystem@ae00000/displayport-controller@ae90000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: phy@1c0e000: clock-output-names: ['pcie_1_pipe_clk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: phy@1c0e000: #clock-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: system-cache-controller@19200000: reg: [[0, 421527552, 0, 524288], [0, 425721856, 0, 524288], [0, 422576128, 0, 524288], [0, 426770432, 0, 524288], [0, 429916160, 0, 524288]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: system-cache-controller@19200000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
   arch/arm64/boot/dts/qcom/sm8450-qrd.dtb: phy@1d87000: 'power-domains' is a required property
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-ufs-phy.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3149.27-3220.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3241.27-3293.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3112.11-3122.7: Warning (graph_child_address): /soc@0/display-subsystem@ae00000/displayport-controller@ae90000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: phy@1c0e000: clock-output-names: ['pcie_1_pipe_clk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: phy@1c0e000: #clock-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: system-cache-controller@19200000: reg: [[0, 421527552, 0, 524288], [0, 425721856, 0, 524288], [0, 422576128, 0, 524288], [0, 426770432, 0, 524288], [0, 429916160, 0, 524288]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx223.dtb: system-cache-controller@19200000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3149.27-3220.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3241.27-3293.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8450.dtsi:3112.11-3122.7: Warning (graph_child_address): /soc@0/display-subsystem@ae00000/displayport-controller@ae90000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: phy@1c0e000: clock-output-names: ['pcie_1_pipe_clk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: phy@1c0e000: #clock-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: system-cache-controller@19200000: reg: [[0, 421527552, 0, 524288], [0, 425721856, 0, 524288], [0, 422576128, 0, 524288], [0, 426770432, 0, 524288], [0, 429916160, 0, 524288]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8450-sony-xperia-nagara-pdx224.dtb: system-cache-controller@19200000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:2942.27-3016.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3037.27-3092.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: phy@1c0e000: clock-output-names: ['pcie1_pipe_clk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: phy@1c0e000: #clock-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-hdk.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3037.27-3092.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: phy@1c0e000: clock-output-names: ['pcie1_pipe_clk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: phy@1c0e000: #clock-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-mtp.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3037.27-3092.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: phy@1c0e000: clock-output-names: ['pcie1_pipe_clk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: phy@1c0e000: #clock-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-qrd.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8550.dtsi:2942.27-3016.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550.dtsi:3037.27-3092.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: pcie-1-phy-aux-clk: 'clock-frequency' is a required property
   	from schema $id: http://devicetree.org/schemas/clock/fixed-clock.yaml#
   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: phy@1c0e000: clock-output-names: ['pcie1_pipe_clk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: phy@1c0e000: #clock-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 622854144, 0, 2097152], [0, 624951296, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8550-sony-xperia-yodo-pdx234.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3523.27-3579.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: phy@1c0e000: clock-output-names: ['pcie1_pipe_clk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: phy@1c0e000: #clock-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 624951296, 0, 2097152], [0, 622854144, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-mtp.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
--
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3523.27-3579.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: phy@1c0e000: clock-output-names: ['pcie1_pipe_clk'] is too short
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
   arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: phy@1c0e000: #clock-cells:0:0: 1 was expected
   	from schema $id: http://devicetree.org/schemas/phy/qcom,sc8280xp-qmp-pcie-phy.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: system-cache-controller@25000000: reg: [[0, 620756992, 0, 2097152], [0, 624951296, 0, 2097152], [0, 622854144, 0, 2097152], [0, 627048448, 0, 2097152], [0, 629145600, 0, 2097152]] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#
>> arch/arm64/boot/dts/qcom/sm8650-qrd.dtb: system-cache-controller@25000000: reg-names: ['llcc0_base', 'llcc1_base', 'llcc2_base', 'llcc3_base', 'llcc_broadcast_base'] is too short
   	from schema $id: http://devicetree.org/schemas/cache/qcom,llcc.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
