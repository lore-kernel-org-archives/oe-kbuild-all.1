Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4921CA81
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 15:40:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747150844; cv=none; b=oo2E2XvdLGXNL8hzH0K87xzzYIQFy0B0Vnqfx0ilXmIr+e0sqeLSbb3m1QlhGEre+IsRYX/0iWeOIhxN03OcoXNeV0A4XoSST4J/nOXOllhYgTZq9OeTE96ZRMDrA2Hmwr4OftePiWV5G+zhtrEQhQXZcXtd0q/ueZz+fmPByWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747150844; c=relaxed/simple;
	bh=J45LP1EeN0UUHNj0lKY8ADaJXkByl7iYS7Fxv4bYMYk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EvpPSX9wV6M2UzBDv1+zcgpLPPuWKL/bQRRbBcsb/UnA0RyP4EsydPkSD53lTqGCC5nvfx14Q/6cew1xWu0WYwmK40MtRXgt2Nb4l+1quE/v7e1/5ynbEyBE1uXK3It6l1F21qntN/BG5NL63uQLpbB97yH5o1WQAcyxbLNMKIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MdorOv/l; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MdorOv/l"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747150839; x=1778686839;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=J45LP1EeN0UUHNj0lKY8ADaJXkByl7iYS7Fxv4bYMYk=;
  b=MdorOv/l47jjvv8tCK0SKDUWWz7+J3qC8wdT6vMmCNgyho0iIulRZ7X7
   Ctf0raDMp2Fdui4cPkRPwujJ7coWP1Ap7WuDCRD99N8JUxWmNfg0GlmIW
   B7A/hZsU6RShz6VmDl+YRKnHKLmLGZrTf4h4zj7A87rpHACEz4PvLxcjL
   F9sVB7JbBFxYM7idiwISpRxFX+vMAs4qNuYeltQF4wsAmCudcGSsCO1B9
   isAtlJsuTiuHirYwg6pinZWQ9sLpA/3TQlZWoF2fBkJjjmdTQfgXu1U2w
   rRCxNIkVSOC5H/DWl06t8SmVPzWGAAvQoaBD08CDxcUtRHsUvcexikkOS
   g==;
X-CSE-ConnectionGUID: ehL+5g7WRMKOVAxqPyg89w==
X-CSE-MsgGUID: 55U5hzyKQAuzS8ks8ofqQg==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="66413388"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="66413388"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 08:40:37 -0700
X-CSE-ConnectionGUID: a2jps/Y7SHKT/EAOyBwjSg==
X-CSE-MsgGUID: q0cyD3P7TsmEW00L2VaZsQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="161029527"
Received: from igk-lkp-server01.igk.intel.com (HELO b9ffd1689040) ([10.211.3.150])
  by fmviesa002.fm.intel.com with ESMTP; 13 May 2025 08:40:35 -0700
Received: from kbuild by b9ffd1689040 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uErk8-00010U-1S;
	Tue, 13 May 2025 15:40:32 +0000
Date: Tue, 13 May 2025 23:40:06 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [linux-next:master 8707/10774]
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning
 (spi_bus_bridge): /soc/spi@e6ea0000: incorrect #address-cells for SPI bus
Message-ID: <202505132343.F6czsY4O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   aa94665adc28f3fdc3de2979ac1e98bae961d6ca
commit: ca764d5321a2cee7c4901b981bb0be06d8d9a9d7 [8707/10774] arm64: dts: renesas: sparrow-hawk: Add MSIOF Sound support
config: arm64-randconfig-2052-20250513 (https://download.01.org/0day-ci/archive/20250513/202505132343.F6czsY4O-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
dtschema version: 2025.3.dev21+ge6ea659
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250513/202505132343.F6czsY4O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505132343.F6czsY4O-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning (spi_bus_bridge): /soc/spi@e6ea0000: incorrect #address-cells for SPI bus
>> arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1269.24-1283.5: Warning (spi_bus_bridge): /soc/spi@e6ea0000: incorrect #size-cells for SPI bus
>> arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: Warning (spi_bus_reg): Failed prerequisite 'spi_bus_bridge'
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1364.12-1374.7: Warning (graph_child_address): /soc/video@e6ef0000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1393.12-1403.7: Warning (graph_child_address): /soc/video@e6ef1000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1422.12-1432.7: Warning (graph_child_address): /soc/video@e6ef2000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1451.12-1461.7: Warning (graph_child_address): /soc/video@e6ef3000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1480.12-1490.7: Warning (graph_child_address): /soc/video@e6ef4000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1509.12-1519.7: Warning (graph_child_address): /soc/video@e6ef5000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1538.12-1548.7: Warning (graph_child_address): /soc/video@e6ef6000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:1567.12-1577.7: Warning (graph_child_address): /soc/video@e6ef7000/ports/port@2: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g0.dtsi:2298.12-2308.7: Warning (graph_child_address): /soc/isp@fed00000/ports/port@0: graph node has single child node 'endpoint@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dtb: / (retronix,sparrow-hawk): compatible: 'oneOf' conditional failed, one must be fixed:

vim +1269 arch/arm64/boot/dts/renesas/r8a779g0.dtsi

987da486d84a56 Yoshihiro Shimoda  2022-04-28    11  
987da486d84a56 Yoshihiro Shimoda  2022-04-28    12  / {
987da486d84a56 Yoshihiro Shimoda  2022-04-28    13  	compatible = "renesas,r8a779g0";
987da486d84a56 Yoshihiro Shimoda  2022-04-28    14  	#address-cells = <2>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28    15  	#size-cells = <2>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28    16  
6cf8e3d73ebe83 Kuninori Morimoto  2023-03-06    17  	/* External Audio clock - to be overridden by boards that provide it */
6cf8e3d73ebe83 Kuninori Morimoto  2023-03-06    18  	audio_clkin: audio_clkin {
6cf8e3d73ebe83 Kuninori Morimoto  2023-03-06    19  		compatible = "fixed-clock";
6cf8e3d73ebe83 Kuninori Morimoto  2023-03-06    20  		#clock-cells = <0>;
6cf8e3d73ebe83 Kuninori Morimoto  2023-03-06    21  		clock-frequency = <0>;
6cf8e3d73ebe83 Kuninori Morimoto  2023-03-06    22  	};
6cf8e3d73ebe83 Kuninori Morimoto  2023-03-06    23  
5056a0c7286237 Geert Uytterhoeven 2023-01-23    24  	/* External CAN clock - to be overridden by boards that provide it */
5056a0c7286237 Geert Uytterhoeven 2023-01-23    25  	can_clk: can {
5056a0c7286237 Geert Uytterhoeven 2023-01-23    26  		compatible = "fixed-clock";
5056a0c7286237 Geert Uytterhoeven 2023-01-23    27  		#clock-cells = <0>;
5056a0c7286237 Geert Uytterhoeven 2023-01-23    28  		clock-frequency = <0>;
5056a0c7286237 Geert Uytterhoeven 2023-01-23    29  	};
5056a0c7286237 Geert Uytterhoeven 2023-01-23    30  
9a0e630655361c Geert Uytterhoeven 2022-11-14    31  	cluster0_opp: opp-table-0 {
9a0e630655361c Geert Uytterhoeven 2022-11-14    32  		compatible = "operating-points-v2";
9a0e630655361c Geert Uytterhoeven 2022-11-14    33  		opp-shared;
9a0e630655361c Geert Uytterhoeven 2022-11-14    34  
9a0e630655361c Geert Uytterhoeven 2022-11-14    35  		opp-500000000 {
9a0e630655361c Geert Uytterhoeven 2022-11-14    36  			opp-hz = /bits/ 64 <500000000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    37  			opp-microvolt = <825000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    38  			clock-latency-ns = <500000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    39  		};
9a0e630655361c Geert Uytterhoeven 2022-11-14    40  		opp-1000000000 {
9a0e630655361c Geert Uytterhoeven 2022-11-14    41  			opp-hz = /bits/ 64 <1000000000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    42  			opp-microvolt = <825000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    43  			clock-latency-ns = <500000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    44  		};
9a0e630655361c Geert Uytterhoeven 2022-11-14    45  		opp-1500000000 {
9a0e630655361c Geert Uytterhoeven 2022-11-14    46  			opp-hz = /bits/ 64 <1500000000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    47  			opp-microvolt = <825000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    48  			clock-latency-ns = <500000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    49  		};
9a0e630655361c Geert Uytterhoeven 2022-11-14    50  		opp-1700000000 {
9a0e630655361c Geert Uytterhoeven 2022-11-14    51  			opp-hz = /bits/ 64 <1700000000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    52  			opp-microvolt = <825000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    53  			clock-latency-ns = <500000>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    54  			opp-suspend;
9a0e630655361c Geert Uytterhoeven 2022-11-14    55  		};
87d85b48f81099 Geert Uytterhoeven 2022-12-08    56  		opp-1800000000 {
87d85b48f81099 Geert Uytterhoeven 2022-12-08    57  			opp-hz = /bits/ 64 <1800000000>;
87d85b48f81099 Geert Uytterhoeven 2022-12-08    58  			opp-microvolt = <880000>;
87d85b48f81099 Geert Uytterhoeven 2022-12-08    59  			clock-latency-ns = <500000>;
87d85b48f81099 Geert Uytterhoeven 2022-12-08    60  			turbo-mode;
87d85b48f81099 Geert Uytterhoeven 2022-12-08    61  		};
9a0e630655361c Geert Uytterhoeven 2022-11-14    62  	};
9a0e630655361c Geert Uytterhoeven 2022-11-14    63  
987da486d84a56 Yoshihiro Shimoda  2022-04-28    64  	cpus {
987da486d84a56 Yoshihiro Shimoda  2022-04-28    65  		#address-cells = <1>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28    66  		#size-cells = <0>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28    67  
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    68  		cpu-map {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    69  			cluster0 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    70  				core0 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    71  					cpu = <&a76_0>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    72  				};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    73  				core1 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    74  					cpu = <&a76_1>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    75  				};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    76  			};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    77  
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    78  			cluster1 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    79  				core0 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    80  					cpu = <&a76_2>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    81  				};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    82  				core1 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    83  					cpu = <&a76_3>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    84  				};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    85  			};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    86  		};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    87  
987da486d84a56 Yoshihiro Shimoda  2022-04-28    88  		a76_0: cpu@0 {
987da486d84a56 Yoshihiro Shimoda  2022-04-28    89  			compatible = "arm,cortex-a76";
987da486d84a56 Yoshihiro Shimoda  2022-04-28    90  			reg = <0>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28    91  			device_type = "cpu";
987da486d84a56 Yoshihiro Shimoda  2022-04-28    92  			power-domains = <&sysc R8A779G0_PD_A1E0D0C0>;
f08407210db921 Geert Uytterhoeven 2022-11-14    93  			next-level-cache = <&L3_CA76_0>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    94  			enable-method = "psci";
5bb355a8d62383 Geert Uytterhoeven 2022-11-14    95  			cpu-idle-states = <&CPU_SLEEP_0>;
ee8ce199c70171 Geert Uytterhoeven 2022-11-14    96  			clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
9a0e630655361c Geert Uytterhoeven 2022-11-14    97  			operating-points-v2 = <&cluster0_opp>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    98  		};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14    99  
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   100  		a76_1: cpu@100 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   101  			compatible = "arm,cortex-a76";
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   102  			reg = <0x100>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   103  			device_type = "cpu";
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   104  			power-domains = <&sysc R8A779G0_PD_A1E0D0C1>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   105  			next-level-cache = <&L3_CA76_0>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   106  			enable-method = "psci";
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   107  			cpu-idle-states = <&CPU_SLEEP_0>;
ee8ce199c70171 Geert Uytterhoeven 2022-11-14   108  			clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
9a0e630655361c Geert Uytterhoeven 2022-11-14   109  			operating-points-v2 = <&cluster0_opp>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   110  		};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   111  
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   112  		a76_2: cpu@10000 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   113  			compatible = "arm,cortex-a76";
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   114  			reg = <0x10000>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   115  			device_type = "cpu";
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   116  			power-domains = <&sysc R8A779G0_PD_A1E0D1C0>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   117  			next-level-cache = <&L3_CA76_1>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   118  			enable-method = "psci";
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   119  			cpu-idle-states = <&CPU_SLEEP_0>;
ee8ce199c70171 Geert Uytterhoeven 2022-11-14   120  			clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
9a0e630655361c Geert Uytterhoeven 2022-11-14   121  			operating-points-v2 = <&cluster0_opp>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   122  		};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   123  
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   124  		a76_3: cpu@10100 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   125  			compatible = "arm,cortex-a76";
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   126  			reg = <0x10100>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   127  			device_type = "cpu";
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   128  			power-domains = <&sysc R8A779G0_PD_A1E0D1C1>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   129  			next-level-cache = <&L3_CA76_1>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   130  			enable-method = "psci";
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   131  			cpu-idle-states = <&CPU_SLEEP_0>;
ee8ce199c70171 Geert Uytterhoeven 2022-11-14   132  			clocks = <&cpg CPG_CORE R8A779G0_CLK_Z0>;
9a0e630655361c Geert Uytterhoeven 2022-11-14   133  			operating-points-v2 = <&cluster0_opp>;
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   134  		};
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   135  
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   136  		idle-states {
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   137  			entry-method = "psci";
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   138  
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   139  			CPU_SLEEP_0: cpu-sleep-0 {
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   140  				compatible = "arm,idle-state";
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   141  				arm,psci-suspend-param = <0x0010000>;
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   142  				local-timer-stop;
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   143  				entry-latency-us = <400>;
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   144  				exit-latency-us = <500>;
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   145  				min-residency-us = <4000>;
5bb355a8d62383 Geert Uytterhoeven 2022-11-14   146  			};
f08407210db921 Geert Uytterhoeven 2022-11-14   147  	       };
f08407210db921 Geert Uytterhoeven 2022-11-14   148  
f08407210db921 Geert Uytterhoeven 2022-11-14   149  		L3_CA76_0: cache-controller-0 {
f08407210db921 Geert Uytterhoeven 2022-11-14   150  			compatible = "cache";
f08407210db921 Geert Uytterhoeven 2022-11-14   151  			power-domains = <&sysc R8A779G0_PD_A2E0D0>;
f08407210db921 Geert Uytterhoeven 2022-11-14   152  			cache-unified;
f08407210db921 Geert Uytterhoeven 2022-11-14   153  			cache-level = <3>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   154  		};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   155  
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   156  		L3_CA76_1: cache-controller-1 {
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   157  			compatible = "cache";
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   158  			power-domains = <&sysc R8A779G0_PD_A2E0D1>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   159  			cache-unified;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   160  			cache-level = <3>;
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   161  		};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   162  	};
68c9c53d45fa9c Geert Uytterhoeven 2022-11-14   163  
987da486d84a56 Yoshihiro Shimoda  2022-04-28   164  	extal_clk: extal {
987da486d84a56 Yoshihiro Shimoda  2022-04-28   165  		compatible = "fixed-clock";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   166  		#clock-cells = <0>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   167  		/* This value must be overridden by the board */
987da486d84a56 Yoshihiro Shimoda  2022-04-28   168  		clock-frequency = <0>;
399f14ff6625cb Marek Vasut        2025-02-09   169  		bootph-all;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   170  	};
987da486d84a56 Yoshihiro Shimoda  2022-04-28   171  
987da486d84a56 Yoshihiro Shimoda  2022-04-28   172  	extalr_clk: extalr {
987da486d84a56 Yoshihiro Shimoda  2022-04-28   173  		compatible = "fixed-clock";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   174  		#clock-cells = <0>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   175  		/* This value must be overridden by the board */
987da486d84a56 Yoshihiro Shimoda  2022-04-28   176  		clock-frequency = <0>;
399f14ff6625cb Marek Vasut        2025-02-09   177  		bootph-all;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   178  	};
987da486d84a56 Yoshihiro Shimoda  2022-04-28   179  
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   180  	pcie0_clkref: pcie0-clkref {
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   181  		compatible = "fixed-clock";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   182  		#clock-cells = <0>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   183  		/* This value must be overridden by the board */
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   184  		clock-frequency = <0>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   185  	};
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   186  
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   187  	pcie1_clkref: pcie1-clkref {
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   188  		compatible = "fixed-clock";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   189  		#clock-cells = <0>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   190  		/* This value must be overridden by the board */
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   191  		clock-frequency = <0>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   192  	};
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   193  
987da486d84a56 Yoshihiro Shimoda  2022-04-28   194  	pmu_a76 {
987da486d84a56 Yoshihiro Shimoda  2022-04-28   195  		compatible = "arm,cortex-a76-pmu";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   196  		interrupts-extended = <&gic GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   197  	};
987da486d84a56 Yoshihiro Shimoda  2022-04-28   198  
8b93657c976a61 Geert Uytterhoeven 2024-01-15   199  	psci {
8b93657c976a61 Geert Uytterhoeven 2024-01-15   200  		compatible = "arm,psci-1.0", "arm,psci-0.2";
8b93657c976a61 Geert Uytterhoeven 2024-01-15   201  		method = "smc";
8b93657c976a61 Geert Uytterhoeven 2024-01-15   202  	};
8b93657c976a61 Geert Uytterhoeven 2024-01-15   203  
08e799f6bce80d Geert Uytterhoeven 2024-01-18   204  	/* External SCIF clocks - to be overridden by boards that provide them */
987da486d84a56 Yoshihiro Shimoda  2022-04-28   205  	scif_clk: scif {
987da486d84a56 Yoshihiro Shimoda  2022-04-28   206  		compatible = "fixed-clock";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   207  		#clock-cells = <0>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   208  		clock-frequency = <0>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   209  	};
987da486d84a56 Yoshihiro Shimoda  2022-04-28   210  
08e799f6bce80d Geert Uytterhoeven 2024-01-18   211  	scif_clk2: scif2 {
08e799f6bce80d Geert Uytterhoeven 2024-01-18   212  		compatible = "fixed-clock";
08e799f6bce80d Geert Uytterhoeven 2024-01-18   213  		#clock-cells = <0>;
08e799f6bce80d Geert Uytterhoeven 2024-01-18   214  		clock-frequency = <0>;
08e799f6bce80d Geert Uytterhoeven 2024-01-18   215  	};
08e799f6bce80d Geert Uytterhoeven 2024-01-18   216  
987da486d84a56 Yoshihiro Shimoda  2022-04-28   217  	soc: soc {
987da486d84a56 Yoshihiro Shimoda  2022-04-28   218  		compatible = "simple-bus";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   219  		interrupt-parent = <&gic>;
399f14ff6625cb Marek Vasut        2025-02-09   220  		bootph-all;
399f14ff6625cb Marek Vasut        2025-02-09   221  
987da486d84a56 Yoshihiro Shimoda  2022-04-28   222  		#address-cells = <2>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   223  		#size-cells = <2>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   224  		ranges;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   225  
a43306faeea860 Geert Uytterhoeven 2022-09-09   226  		rwdt: watchdog@e6020000 {
a43306faeea860 Geert Uytterhoeven 2022-09-09   227  			compatible = "renesas,r8a779g0-wdt",
a43306faeea860 Geert Uytterhoeven 2022-09-09   228  				     "renesas,rcar-gen4-wdt";
a43306faeea860 Geert Uytterhoeven 2022-09-09   229  			reg = <0 0xe6020000 0 0x0c>;
a43306faeea860 Geert Uytterhoeven 2022-09-09   230  			interrupts = <GIC_SPI 330 IRQ_TYPE_LEVEL_HIGH>;
a43306faeea860 Geert Uytterhoeven 2022-09-09   231  			clocks = <&cpg CPG_MOD 907>;
a43306faeea860 Geert Uytterhoeven 2022-09-09   232  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
a43306faeea860 Geert Uytterhoeven 2022-09-09   233  			resets = <&cpg 907>;
a43306faeea860 Geert Uytterhoeven 2022-09-09   234  			status = "disabled";
a43306faeea860 Geert Uytterhoeven 2022-09-09   235  		};
a43306faeea860 Geert Uytterhoeven 2022-09-09   236  
4cebce2577239f Geert Uytterhoeven 2022-09-09   237  		pfc: pinctrl@e6050000 {
4cebce2577239f Geert Uytterhoeven 2022-09-09   238  			compatible = "renesas,pfc-r8a779g0";
4cebce2577239f Geert Uytterhoeven 2022-09-09   239  			reg = <0 0xe6050000 0 0x16c>, <0 0xe6050800 0 0x16c>,
4cebce2577239f Geert Uytterhoeven 2022-09-09   240  			      <0 0xe6058000 0 0x16c>, <0 0xe6058800 0 0x16c>,
4cebce2577239f Geert Uytterhoeven 2022-09-09   241  			      <0 0xe6060000 0 0x16c>, <0 0xe6060800 0 0x16c>,
4cebce2577239f Geert Uytterhoeven 2022-09-09   242  			      <0 0xe6061000 0 0x16c>, <0 0xe6061800 0 0x16c>,
4cebce2577239f Geert Uytterhoeven 2022-09-09   243  			      <0 0xe6068000 0 0x16c>;
399f14ff6625cb Marek Vasut        2025-02-09   244  			bootph-all;
4cebce2577239f Geert Uytterhoeven 2022-09-09   245  		};
4cebce2577239f Geert Uytterhoeven 2022-09-09   246  
120c7a58388f49 Geert Uytterhoeven 2022-09-09   247  		gpio0: gpio@e6050180 {
120c7a58388f49 Geert Uytterhoeven 2022-09-09   248  			compatible = "renesas,gpio-r8a779g0",
120c7a58388f49 Geert Uytterhoeven 2022-09-09   249  				     "renesas,rcar-gen4-gpio";
120c7a58388f49 Geert Uytterhoeven 2022-09-09   250  			reg = <0 0xe6050180 0 0x54>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   251  			interrupts = <GIC_SPI 619 IRQ_TYPE_LEVEL_HIGH>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   252  			clocks = <&cpg CPG_MOD 915>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   253  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   254  			resets = <&cpg 915>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   255  			gpio-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   256  			#gpio-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   257  			gpio-ranges = <&pfc 0 0 19>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   258  			interrupt-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   259  			#interrupt-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   260  		};
120c7a58388f49 Geert Uytterhoeven 2022-09-09   261  
120c7a58388f49 Geert Uytterhoeven 2022-09-09   262  		gpio1: gpio@e6050980 {
120c7a58388f49 Geert Uytterhoeven 2022-09-09   263  			compatible = "renesas,gpio-r8a779g0",
120c7a58388f49 Geert Uytterhoeven 2022-09-09   264  				     "renesas,rcar-gen4-gpio";
120c7a58388f49 Geert Uytterhoeven 2022-09-09   265  			reg = <0 0xe6050980 0 0x54>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   266  			interrupts = <GIC_SPI 623 IRQ_TYPE_LEVEL_HIGH>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   267  			clocks = <&cpg CPG_MOD 915>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   268  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   269  			resets = <&cpg 915>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   270  			gpio-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   271  			#gpio-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   272  			gpio-ranges = <&pfc 0 32 29>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   273  			interrupt-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   274  			#interrupt-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   275  		};
120c7a58388f49 Geert Uytterhoeven 2022-09-09   276  
120c7a58388f49 Geert Uytterhoeven 2022-09-09   277  		gpio2: gpio@e6058180 {
120c7a58388f49 Geert Uytterhoeven 2022-09-09   278  			compatible = "renesas,gpio-r8a779g0",
120c7a58388f49 Geert Uytterhoeven 2022-09-09   279  				     "renesas,rcar-gen4-gpio";
120c7a58388f49 Geert Uytterhoeven 2022-09-09   280  			reg = <0 0xe6058180 0 0x54>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   281  			interrupts = <GIC_SPI 627 IRQ_TYPE_LEVEL_HIGH>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   282  			clocks = <&cpg CPG_MOD 916>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   283  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   284  			resets = <&cpg 916>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   285  			gpio-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   286  			#gpio-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   287  			gpio-ranges = <&pfc 0 64 20>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   288  			interrupt-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   289  			#interrupt-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   290  		};
120c7a58388f49 Geert Uytterhoeven 2022-09-09   291  
120c7a58388f49 Geert Uytterhoeven 2022-09-09   292  		gpio3: gpio@e6058980 {
120c7a58388f49 Geert Uytterhoeven 2022-09-09   293  			compatible = "renesas,gpio-r8a779g0",
120c7a58388f49 Geert Uytterhoeven 2022-09-09   294  				     "renesas,rcar-gen4-gpio";
120c7a58388f49 Geert Uytterhoeven 2022-09-09   295  			reg = <0 0xe6058980 0 0x54>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   296  			interrupts = <GIC_SPI 631 IRQ_TYPE_LEVEL_HIGH>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   297  			clocks = <&cpg CPG_MOD 916>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   298  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   299  			resets = <&cpg 916>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   300  			gpio-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   301  			#gpio-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   302  			gpio-ranges = <&pfc 0 96 30>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   303  			interrupt-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   304  			#interrupt-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   305  		};
120c7a58388f49 Geert Uytterhoeven 2022-09-09   306  
120c7a58388f49 Geert Uytterhoeven 2022-09-09   307  		gpio4: gpio@e6060180 {
120c7a58388f49 Geert Uytterhoeven 2022-09-09   308  			compatible = "renesas,gpio-r8a779g0",
120c7a58388f49 Geert Uytterhoeven 2022-09-09   309  				     "renesas,rcar-gen4-gpio";
120c7a58388f49 Geert Uytterhoeven 2022-09-09   310  			reg = <0 0xe6060180 0 0x54>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   311  			interrupts = <GIC_SPI 635 IRQ_TYPE_LEVEL_HIGH>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   312  			clocks = <&cpg CPG_MOD 917>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   313  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   314  			resets = <&cpg 917>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   315  			gpio-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   316  			#gpio-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   317  			gpio-ranges = <&pfc 0 128 25>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   318  			interrupt-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   319  			#interrupt-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   320  		};
120c7a58388f49 Geert Uytterhoeven 2022-09-09   321  
120c7a58388f49 Geert Uytterhoeven 2022-09-09   322  		gpio5: gpio@e6060980 {
120c7a58388f49 Geert Uytterhoeven 2022-09-09   323  			compatible = "renesas,gpio-r8a779g0",
120c7a58388f49 Geert Uytterhoeven 2022-09-09   324  				     "renesas,rcar-gen4-gpio";
120c7a58388f49 Geert Uytterhoeven 2022-09-09   325  			reg = <0 0xe6060980 0 0x54>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   326  			interrupts = <GIC_SPI 639 IRQ_TYPE_LEVEL_HIGH>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   327  			clocks = <&cpg CPG_MOD 917>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   328  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   329  			resets = <&cpg 917>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   330  			gpio-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   331  			#gpio-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   332  			gpio-ranges = <&pfc 0 160 21>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   333  			interrupt-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   334  			#interrupt-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   335  		};
120c7a58388f49 Geert Uytterhoeven 2022-09-09   336  
120c7a58388f49 Geert Uytterhoeven 2022-09-09   337  		gpio6: gpio@e6061180 {
120c7a58388f49 Geert Uytterhoeven 2022-09-09   338  			compatible = "renesas,gpio-r8a779g0",
120c7a58388f49 Geert Uytterhoeven 2022-09-09   339  				     "renesas,rcar-gen4-gpio";
120c7a58388f49 Geert Uytterhoeven 2022-09-09   340  			reg = <0 0xe6061180 0 0x54>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   341  			interrupts = <GIC_SPI 643 IRQ_TYPE_LEVEL_HIGH>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   342  			clocks = <&cpg CPG_MOD 917>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   343  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   344  			resets = <&cpg 917>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   345  			gpio-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   346  			#gpio-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   347  			gpio-ranges = <&pfc 0 192 21>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   348  			interrupt-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   349  			#interrupt-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   350  		};
120c7a58388f49 Geert Uytterhoeven 2022-09-09   351  
120c7a58388f49 Geert Uytterhoeven 2022-09-09   352  		gpio7: gpio@e6061980 {
120c7a58388f49 Geert Uytterhoeven 2022-09-09   353  			compatible = "renesas,gpio-r8a779g0",
120c7a58388f49 Geert Uytterhoeven 2022-09-09   354  				     "renesas,rcar-gen4-gpio";
120c7a58388f49 Geert Uytterhoeven 2022-09-09   355  			reg = <0 0xe6061980 0 0x54>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   356  			interrupts = <GIC_SPI 647 IRQ_TYPE_LEVEL_HIGH>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   357  			clocks = <&cpg CPG_MOD 917>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   358  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   359  			resets = <&cpg 917>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   360  			gpio-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   361  			#gpio-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   362  			gpio-ranges = <&pfc 0 224 21>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   363  			interrupt-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   364  			#interrupt-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   365  		};
120c7a58388f49 Geert Uytterhoeven 2022-09-09   366  
120c7a58388f49 Geert Uytterhoeven 2022-09-09   367  		gpio8: gpio@e6068180 {
120c7a58388f49 Geert Uytterhoeven 2022-09-09   368  			compatible = "renesas,gpio-r8a779g0",
120c7a58388f49 Geert Uytterhoeven 2022-09-09   369  				     "renesas,rcar-gen4-gpio";
120c7a58388f49 Geert Uytterhoeven 2022-09-09   370  			reg = <0 0xe6068180 0 0x54>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   371  			interrupts = <GIC_SPI 651 IRQ_TYPE_LEVEL_HIGH>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   372  			clocks = <&cpg CPG_MOD 918>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   373  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   374  			resets = <&cpg 918>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   375  			gpio-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   376  			#gpio-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   377  			gpio-ranges = <&pfc 0 256 14>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   378  			interrupt-controller;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   379  			#interrupt-cells = <2>;
120c7a58388f49 Geert Uytterhoeven 2022-09-09   380  		};
120c7a58388f49 Geert Uytterhoeven 2022-09-09   381  
40a6dd7b94172d Thanh Quan         2022-11-04   382  		cmt0: timer@e60f0000 {
40a6dd7b94172d Thanh Quan         2022-11-04   383  			compatible = "renesas,r8a779g0-cmt0",
40a6dd7b94172d Thanh Quan         2022-11-04   384  				     "renesas,rcar-gen4-cmt0";
40a6dd7b94172d Thanh Quan         2022-11-04   385  			reg = <0 0xe60f0000 0 0x1004>;
40a6dd7b94172d Thanh Quan         2022-11-04   386  			interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   387  				     <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>;
40a6dd7b94172d Thanh Quan         2022-11-04   388  			clocks = <&cpg CPG_MOD 910>;
40a6dd7b94172d Thanh Quan         2022-11-04   389  			clock-names = "fck";
40a6dd7b94172d Thanh Quan         2022-11-04   390  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
40a6dd7b94172d Thanh Quan         2022-11-04   391  			resets = <&cpg 910>;
40a6dd7b94172d Thanh Quan         2022-11-04   392  			status = "disabled";
40a6dd7b94172d Thanh Quan         2022-11-04   393  		};
40a6dd7b94172d Thanh Quan         2022-11-04   394  
40a6dd7b94172d Thanh Quan         2022-11-04   395  		cmt1: timer@e6130000 {
40a6dd7b94172d Thanh Quan         2022-11-04   396  			compatible = "renesas,r8a779g0-cmt1",
40a6dd7b94172d Thanh Quan         2022-11-04   397  				     "renesas,rcar-gen4-cmt1";
40a6dd7b94172d Thanh Quan         2022-11-04   398  			reg = <0 0xe6130000 0 0x1004>;
40a6dd7b94172d Thanh Quan         2022-11-04   399  			interrupts = <GIC_SPI 262 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   400  				     <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   401  				     <GIC_SPI 264 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   402  				     <GIC_SPI 265 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   403  				     <GIC_SPI 266 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   404  				     <GIC_SPI 267 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   405  				     <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   406  				     <GIC_SPI 269 IRQ_TYPE_LEVEL_HIGH>;
40a6dd7b94172d Thanh Quan         2022-11-04   407  			clocks = <&cpg CPG_MOD 911>;
40a6dd7b94172d Thanh Quan         2022-11-04   408  			clock-names = "fck";
40a6dd7b94172d Thanh Quan         2022-11-04   409  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
40a6dd7b94172d Thanh Quan         2022-11-04   410  			resets = <&cpg 911>;
40a6dd7b94172d Thanh Quan         2022-11-04   411  			status = "disabled";
40a6dd7b94172d Thanh Quan         2022-11-04   412  		};
40a6dd7b94172d Thanh Quan         2022-11-04   413  
40a6dd7b94172d Thanh Quan         2022-11-04   414  		cmt2: timer@e6140000 {
40a6dd7b94172d Thanh Quan         2022-11-04   415  			compatible = "renesas,r8a779g0-cmt1",
40a6dd7b94172d Thanh Quan         2022-11-04   416  				     "renesas,rcar-gen4-cmt1";
40a6dd7b94172d Thanh Quan         2022-11-04   417  			reg = <0 0xe6140000 0 0x1004>;
40a6dd7b94172d Thanh Quan         2022-11-04   418  			interrupts = <GIC_SPI 270 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   419  				     <GIC_SPI 271 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   420  				     <GIC_SPI 272 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   421  				     <GIC_SPI 273 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   422  				     <GIC_SPI 274 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   423  				     <GIC_SPI 275 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   424  				     <GIC_SPI 276 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   425  				     <GIC_SPI 277 IRQ_TYPE_LEVEL_HIGH>;
40a6dd7b94172d Thanh Quan         2022-11-04   426  			clocks = <&cpg CPG_MOD 912>;
40a6dd7b94172d Thanh Quan         2022-11-04   427  			clock-names = "fck";
40a6dd7b94172d Thanh Quan         2022-11-04   428  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
40a6dd7b94172d Thanh Quan         2022-11-04   429  			resets = <&cpg 912>;
40a6dd7b94172d Thanh Quan         2022-11-04   430  			status = "disabled";
40a6dd7b94172d Thanh Quan         2022-11-04   431  		};
40a6dd7b94172d Thanh Quan         2022-11-04   432  
40a6dd7b94172d Thanh Quan         2022-11-04   433  		cmt3: timer@e6148000 {
40a6dd7b94172d Thanh Quan         2022-11-04   434  			compatible = "renesas,r8a779g0-cmt1",
40a6dd7b94172d Thanh Quan         2022-11-04   435  				     "renesas,rcar-gen4-cmt1";
40a6dd7b94172d Thanh Quan         2022-11-04   436  			reg = <0 0xe6148000 0 0x1004>;
40a6dd7b94172d Thanh Quan         2022-11-04   437  			interrupts = <GIC_SPI 278 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   438  				     <GIC_SPI 279 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   439  				     <GIC_SPI 280 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   440  				     <GIC_SPI 281 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   441  				     <GIC_SPI 282 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   442  				     <GIC_SPI 283 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   443  				     <GIC_SPI 284 IRQ_TYPE_LEVEL_HIGH>,
40a6dd7b94172d Thanh Quan         2022-11-04   444  				     <GIC_SPI 285 IRQ_TYPE_LEVEL_HIGH>;
40a6dd7b94172d Thanh Quan         2022-11-04   445  			clocks = <&cpg CPG_MOD 913>;
40a6dd7b94172d Thanh Quan         2022-11-04   446  			clock-names = "fck";
40a6dd7b94172d Thanh Quan         2022-11-04   447  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
40a6dd7b94172d Thanh Quan         2022-11-04   448  			resets = <&cpg 913>;
40a6dd7b94172d Thanh Quan         2022-11-04   449  			status = "disabled";
40a6dd7b94172d Thanh Quan         2022-11-04   450  		};
40a6dd7b94172d Thanh Quan         2022-11-04   451  
987da486d84a56 Yoshihiro Shimoda  2022-04-28   452  		cpg: clock-controller@e6150000 {
987da486d84a56 Yoshihiro Shimoda  2022-04-28   453  			compatible = "renesas,r8a779g0-cpg-mssr";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   454  			reg = <0 0xe6150000 0 0x4000>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   455  			clocks = <&extal_clk>, <&extalr_clk>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   456  			clock-names = "extal", "extalr";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   457  			#clock-cells = <2>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   458  			#power-domain-cells = <0>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   459  			#reset-cells = <1>;
399f14ff6625cb Marek Vasut        2025-02-09   460  			bootph-all;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   461  		};
987da486d84a56 Yoshihiro Shimoda  2022-04-28   462  
987da486d84a56 Yoshihiro Shimoda  2022-04-28   463  		rst: reset-controller@e6160000 {
987da486d84a56 Yoshihiro Shimoda  2022-04-28   464  			compatible = "renesas,r8a779g0-rst";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   465  			reg = <0 0xe6160000 0 0x4000>;
399f14ff6625cb Marek Vasut        2025-02-09   466  			bootph-all;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   467  		};
987da486d84a56 Yoshihiro Shimoda  2022-04-28   468  
987da486d84a56 Yoshihiro Shimoda  2022-04-28   469  		sysc: system-controller@e6180000 {
987da486d84a56 Yoshihiro Shimoda  2022-04-28   470  			compatible = "renesas,r8a779g0-sysc";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   471  			reg = <0 0xe6180000 0 0x4000>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   472  			#power-domain-cells = <1>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   473  		};
987da486d84a56 Yoshihiro Shimoda  2022-04-28   474  
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   475  		tsc: thermal@e6198000 {
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   476  			compatible = "renesas,r8a779g0-thermal";
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   477  			reg = <0 0xe6198000 0 0x200>,
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   478  			      <0 0xe61a0000 0 0x200>,
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   479  			      <0 0xe61a8000 0 0x200>,
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   480  			      <0 0xe61b0000 0 0x200>;
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   481  			clocks = <&cpg CPG_MOD 919>;
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   482  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   483  			resets = <&cpg 919>;
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   484  			#thermal-sensor-cells = <1>;
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   485  		};
d8ac71d2966002 Geert Uytterhoeven 2023-02-09   486  
5a910676b1d68a Geert Uytterhoeven 2024-10-03   487  		otp: otp@e61be000 {
5a910676b1d68a Geert Uytterhoeven 2024-10-03   488  			compatible = "renesas,r8a779g0-otp";
5a910676b1d68a Geert Uytterhoeven 2024-10-03   489  			reg = <0 0xe61be000 0 0x1000>, <0 0xe61bf000 0 0x1000>;
5a910676b1d68a Geert Uytterhoeven 2024-10-03   490  		};
5a910676b1d68a Geert Uytterhoeven 2024-10-03   491  
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   492  		intc_ex: interrupt-controller@e61c0000 {
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   493  			compatible = "renesas,intc-ex-r8a779g0", "renesas,irqc";
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   494  			#interrupt-cells = <2>;
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   495  			interrupt-controller;
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   496  			reg = <0 0xe61c0000 0 0x200>;
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   497  			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>,
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   498  				     <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>,
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   499  				     <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>,
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   500  				     <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>,
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   501  				     <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>,
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   502  				     <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   503  			clocks = <&cpg CPG_MOD 611>;
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   504  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   505  			resets = <&cpg 611>;
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   506  		};
b6ce840b974f9b Geert Uytterhoeven 2022-09-28   507  
524789257264ca Wolfram Sang       2022-11-03   508  		tmu0: timer@e61e0000 {
524789257264ca Wolfram Sang       2022-11-03   509  			compatible = "renesas,tmu-r8a779g0", "renesas,tmu";
524789257264ca Wolfram Sang       2022-11-03   510  			reg = <0 0xe61e0000 0 0x30>;
524789257264ca Wolfram Sang       2022-11-03   511  			interrupts = <GIC_SPI 289 IRQ_TYPE_LEVEL_HIGH>,
524789257264ca Wolfram Sang       2022-11-03   512  				     <GIC_SPI 290 IRQ_TYPE_LEVEL_HIGH>,
524789257264ca Wolfram Sang       2022-11-03   513  				     <GIC_SPI 291 IRQ_TYPE_LEVEL_HIGH>;
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   514  			interrupt-names = "tuni0", "tuni1", "tuni2";
524789257264ca Wolfram Sang       2022-11-03   515  			clocks = <&cpg CPG_MOD 713>;
524789257264ca Wolfram Sang       2022-11-03   516  			clock-names = "fck";
524789257264ca Wolfram Sang       2022-11-03   517  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
524789257264ca Wolfram Sang       2022-11-03   518  			resets = <&cpg 713>;
524789257264ca Wolfram Sang       2022-11-03   519  			status = "disabled";
524789257264ca Wolfram Sang       2022-11-03   520  		};
524789257264ca Wolfram Sang       2022-11-03   521  
524789257264ca Wolfram Sang       2022-11-03   522  		tmu1: timer@e6fc0000 {
524789257264ca Wolfram Sang       2022-11-03   523  			compatible = "renesas,tmu-r8a779g0", "renesas,tmu";
524789257264ca Wolfram Sang       2022-11-03   524  			reg = <0 0xe6fc0000 0 0x30>;
524789257264ca Wolfram Sang       2022-11-03   525  			interrupts = <GIC_SPI 292 IRQ_TYPE_LEVEL_HIGH>,
524789257264ca Wolfram Sang       2022-11-03   526  				     <GIC_SPI 293 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   527  				     <GIC_SPI 294 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   528  				     <GIC_SPI 295 IRQ_TYPE_LEVEL_HIGH>;
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   529  			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
524789257264ca Wolfram Sang       2022-11-03   530  			clocks = <&cpg CPG_MOD 714>;
524789257264ca Wolfram Sang       2022-11-03   531  			clock-names = "fck";
524789257264ca Wolfram Sang       2022-11-03   532  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
524789257264ca Wolfram Sang       2022-11-03   533  			resets = <&cpg 714>;
524789257264ca Wolfram Sang       2022-11-03   534  			status = "disabled";
524789257264ca Wolfram Sang       2022-11-03   535  		};
524789257264ca Wolfram Sang       2022-11-03   536  
524789257264ca Wolfram Sang       2022-11-03   537  		tmu2: timer@e6fd0000 {
524789257264ca Wolfram Sang       2022-11-03   538  			compatible = "renesas,tmu-r8a779g0", "renesas,tmu";
524789257264ca Wolfram Sang       2022-11-03   539  			reg = <0 0xe6fd0000 0 0x30>;
524789257264ca Wolfram Sang       2022-11-03   540  			interrupts = <GIC_SPI 296 IRQ_TYPE_LEVEL_HIGH>,
524789257264ca Wolfram Sang       2022-11-03   541  				     <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   542  				     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   543  				     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>;
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   544  			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
524789257264ca Wolfram Sang       2022-11-03   545  			clocks = <&cpg CPG_MOD 715>;
524789257264ca Wolfram Sang       2022-11-03   546  			clock-names = "fck";
524789257264ca Wolfram Sang       2022-11-03   547  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
524789257264ca Wolfram Sang       2022-11-03   548  			resets = <&cpg 715>;
524789257264ca Wolfram Sang       2022-11-03   549  			status = "disabled";
524789257264ca Wolfram Sang       2022-11-03   550  		};
524789257264ca Wolfram Sang       2022-11-03   551  
524789257264ca Wolfram Sang       2022-11-03   552  		tmu3: timer@e6fe0000 {
524789257264ca Wolfram Sang       2022-11-03   553  			compatible = "renesas,tmu-r8a779g0", "renesas,tmu";
524789257264ca Wolfram Sang       2022-11-03   554  			reg = <0 0xe6fe0000 0 0x30>;
524789257264ca Wolfram Sang       2022-11-03   555  			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
524789257264ca Wolfram Sang       2022-11-03   556  				     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   557  				     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   558  				     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>;
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   559  			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
524789257264ca Wolfram Sang       2022-11-03   560  			clocks = <&cpg CPG_MOD 716>;
524789257264ca Wolfram Sang       2022-11-03   561  			clock-names = "fck";
524789257264ca Wolfram Sang       2022-11-03   562  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
524789257264ca Wolfram Sang       2022-11-03   563  			resets = <&cpg 716>;
524789257264ca Wolfram Sang       2022-11-03   564  			status = "disabled";
524789257264ca Wolfram Sang       2022-11-03   565  		};
524789257264ca Wolfram Sang       2022-11-03   566  
524789257264ca Wolfram Sang       2022-11-03   567  		tmu4: timer@ffc00000 {
524789257264ca Wolfram Sang       2022-11-03   568  			compatible = "renesas,tmu-r8a779g0", "renesas,tmu";
524789257264ca Wolfram Sang       2022-11-03   569  			reg = <0 0xffc00000 0 0x30>;
524789257264ca Wolfram Sang       2022-11-03   570  			interrupts = <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>,
524789257264ca Wolfram Sang       2022-11-03   571  				     <GIC_SPI 305 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   572  				     <GIC_SPI 306 IRQ_TYPE_LEVEL_HIGH>,
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   573  				     <GIC_SPI 307 IRQ_TYPE_LEVEL_HIGH>;
c53866cb27fb3a Geert Uytterhoeven 2024-01-15   574  			interrupt-names = "tuni0", "tuni1", "tuni2", "ticpi2";
524789257264ca Wolfram Sang       2022-11-03   575  			clocks = <&cpg CPG_MOD 717>;
524789257264ca Wolfram Sang       2022-11-03   576  			clock-names = "fck";
524789257264ca Wolfram Sang       2022-11-03   577  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
524789257264ca Wolfram Sang       2022-11-03   578  			resets = <&cpg 717>;
524789257264ca Wolfram Sang       2022-11-03   579  			status = "disabled";
524789257264ca Wolfram Sang       2022-11-03   580  		};
524789257264ca Wolfram Sang       2022-11-03   581  
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   582  		tsn0: ethernet@e6460000 {
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   583  			compatible = "renesas,r8a779g0-ethertsn", "renesas,rcar-gen4-ethertsn";
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   584  			reg = <0 0xe6460000 0 0x7000>,
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   585  			      <0 0xe6449000 0 0x500>;
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   586  			reg-names = "tsnes", "gptp";
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   587  			interrupts = <GIC_SPI 429 IRQ_TYPE_LEVEL_HIGH>,
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   588  				     <GIC_SPI 430 IRQ_TYPE_LEVEL_HIGH>;
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   589  			interrupt-names = "tx", "rx";
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   590  			clocks = <&cpg CPG_MOD 2723>;
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   591  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   592  			resets = <&cpg 2723>;
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   593  			status = "disabled";
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   594  		};
c7b4d6e7fa837e Niklas Söderlund   2024-07-01   595  
ff77ba0514855c Geert Uytterhoeven 2022-09-09   596  		i2c0: i2c@e6500000 {
ff77ba0514855c Geert Uytterhoeven 2022-09-09   597  			compatible = "renesas,i2c-r8a779g0",
ff77ba0514855c Geert Uytterhoeven 2022-09-09   598  				     "renesas,rcar-gen4-i2c";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   599  			reg = <0 0xe6500000 0 0x40>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   600  			interrupts = <GIC_SPI 610 IRQ_TYPE_LEVEL_HIGH>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   601  			clocks = <&cpg CPG_MOD 518>;
08f282888effdf Geert Uytterhoeven 2022-09-26   602  			dmas = <&dmac0 0x91>, <&dmac0 0x90>,
08f282888effdf Geert Uytterhoeven 2022-09-26   603  			       <&dmac1 0x91>, <&dmac1 0x90>;
08f282888effdf Geert Uytterhoeven 2022-09-26   604  			dma-names = "tx", "rx", "tx", "rx";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   605  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   606  			resets = <&cpg 518>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   607  			i2c-scl-internal-delay-ns = <110>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   608  			#address-cells = <1>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   609  			#size-cells = <0>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   610  			status = "disabled";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   611  		};
ff77ba0514855c Geert Uytterhoeven 2022-09-09   612  
ff77ba0514855c Geert Uytterhoeven 2022-09-09   613  		i2c1: i2c@e6508000 {
ff77ba0514855c Geert Uytterhoeven 2022-09-09   614  			compatible = "renesas,i2c-r8a779g0",
ff77ba0514855c Geert Uytterhoeven 2022-09-09   615  				     "renesas,rcar-gen4-i2c";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   616  			reg = <0 0xe6508000 0 0x40>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   617  			interrupts = <GIC_SPI 611 IRQ_TYPE_LEVEL_HIGH>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   618  			clocks = <&cpg CPG_MOD 519>;
08f282888effdf Geert Uytterhoeven 2022-09-26   619  			dmas = <&dmac0 0x93>, <&dmac0 0x92>,
08f282888effdf Geert Uytterhoeven 2022-09-26   620  			       <&dmac1 0x93>, <&dmac1 0x92>;
08f282888effdf Geert Uytterhoeven 2022-09-26   621  			dma-names = "tx", "rx", "tx", "rx";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   622  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   623  			resets = <&cpg 519>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   624  			i2c-scl-internal-delay-ns = <110>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   625  			#address-cells = <1>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   626  			#size-cells = <0>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   627  			status = "disabled";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   628  		};
ff77ba0514855c Geert Uytterhoeven 2022-09-09   629  
ff77ba0514855c Geert Uytterhoeven 2022-09-09   630  		i2c2: i2c@e6510000 {
ff77ba0514855c Geert Uytterhoeven 2022-09-09   631  			compatible = "renesas,i2c-r8a779g0",
ff77ba0514855c Geert Uytterhoeven 2022-09-09   632  				     "renesas,rcar-gen4-i2c";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   633  			reg = <0 0xe6510000 0 0x40>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   634  			interrupts = <GIC_SPI 612 IRQ_TYPE_LEVEL_HIGH>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   635  			clocks = <&cpg CPG_MOD 520>;
08f282888effdf Geert Uytterhoeven 2022-09-26   636  			dmas = <&dmac0 0x95>, <&dmac0 0x94>,
08f282888effdf Geert Uytterhoeven 2022-09-26   637  			       <&dmac1 0x95>, <&dmac1 0x94>;
08f282888effdf Geert Uytterhoeven 2022-09-26   638  			dma-names = "tx", "rx", "tx", "rx";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   639  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   640  			resets = <&cpg 520>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   641  			i2c-scl-internal-delay-ns = <110>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   642  			#address-cells = <1>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   643  			#size-cells = <0>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   644  			status = "disabled";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   645  		};
ff77ba0514855c Geert Uytterhoeven 2022-09-09   646  
ff77ba0514855c Geert Uytterhoeven 2022-09-09   647  		i2c3: i2c@e66d0000 {
ff77ba0514855c Geert Uytterhoeven 2022-09-09   648  			compatible = "renesas,i2c-r8a779g0",
ff77ba0514855c Geert Uytterhoeven 2022-09-09   649  				     "renesas,rcar-gen4-i2c";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   650  			reg = <0 0xe66d0000 0 0x40>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   651  			interrupts = <GIC_SPI 613 IRQ_TYPE_LEVEL_HIGH>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   652  			clocks = <&cpg CPG_MOD 521>;
08f282888effdf Geert Uytterhoeven 2022-09-26   653  			dmas = <&dmac0 0x97>, <&dmac0 0x96>,
08f282888effdf Geert Uytterhoeven 2022-09-26   654  			       <&dmac1 0x97>, <&dmac1 0x96>;
08f282888effdf Geert Uytterhoeven 2022-09-26   655  			dma-names = "tx", "rx", "tx", "rx";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   656  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   657  			resets = <&cpg 521>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   658  			i2c-scl-internal-delay-ns = <110>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   659  			#address-cells = <1>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   660  			#size-cells = <0>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   661  			status = "disabled";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   662  		};
ff77ba0514855c Geert Uytterhoeven 2022-09-09   663  
ff77ba0514855c Geert Uytterhoeven 2022-09-09   664  		i2c4: i2c@e66d8000 {
ff77ba0514855c Geert Uytterhoeven 2022-09-09   665  			compatible = "renesas,i2c-r8a779g0",
ff77ba0514855c Geert Uytterhoeven 2022-09-09   666  				     "renesas,rcar-gen4-i2c";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   667  			reg = <0 0xe66d8000 0 0x40>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   668  			interrupts = <GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   669  			clocks = <&cpg CPG_MOD 522>;
08f282888effdf Geert Uytterhoeven 2022-09-26   670  			dma-names = "tx", "rx", "tx", "rx";
08f282888effdf Geert Uytterhoeven 2022-09-26   671  			dmas = <&dmac0 0x99>, <&dmac0 0x98>,
08f282888effdf Geert Uytterhoeven 2022-09-26   672  			       <&dmac1 0x99>, <&dmac1 0x98>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   673  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   674  			resets = <&cpg 522>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   675  			i2c-scl-internal-delay-ns = <110>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   676  			#address-cells = <1>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   677  			#size-cells = <0>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   678  			status = "disabled";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   679  		};
ff77ba0514855c Geert Uytterhoeven 2022-09-09   680  
ff77ba0514855c Geert Uytterhoeven 2022-09-09   681  		i2c5: i2c@e66e0000 {
ff77ba0514855c Geert Uytterhoeven 2022-09-09   682  			compatible = "renesas,i2c-r8a779g0",
ff77ba0514855c Geert Uytterhoeven 2022-09-09   683  				     "renesas,rcar-gen4-i2c";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   684  			reg = <0 0xe66e0000 0 0x40>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   685  			interrupts = <GIC_SPI 615 IRQ_TYPE_LEVEL_HIGH>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   686  			clocks = <&cpg CPG_MOD 523>;
08f282888effdf Geert Uytterhoeven 2022-09-26   687  			dmas = <&dmac0 0x9b>, <&dmac0 0x9a>,
08f282888effdf Geert Uytterhoeven 2022-09-26   688  			       <&dmac1 0x9b>, <&dmac1 0x9a>;
08f282888effdf Geert Uytterhoeven 2022-09-26   689  			dma-names = "tx", "rx", "tx", "rx";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   690  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   691  			resets = <&cpg 523>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   692  			i2c-scl-internal-delay-ns = <110>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   693  			#address-cells = <1>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   694  			#size-cells = <0>;
ff77ba0514855c Geert Uytterhoeven 2022-09-09   695  			status = "disabled";
ff77ba0514855c Geert Uytterhoeven 2022-09-09   696  		};
ff77ba0514855c Geert Uytterhoeven 2022-09-09   697  
987da486d84a56 Yoshihiro Shimoda  2022-04-28   698  		hscif0: serial@e6540000 {
987da486d84a56 Yoshihiro Shimoda  2022-04-28   699  			compatible = "renesas,hscif-r8a779g0",
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   700  				     "renesas,rcar-gen4-hscif", "renesas,hscif";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   701  			reg = <0 0xe6540000 0 0x60>;
ab2866f12ca187 Geert Uytterhoeven 2022-08-25   702  			interrupts = <GIC_SPI 246 IRQ_TYPE_LEVEL_HIGH>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   703  			clocks = <&cpg CPG_MOD 514>,
a4290d407aa9fd Geert Uytterhoeven 2022-10-07   704  				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
987da486d84a56 Yoshihiro Shimoda  2022-04-28   705  				 <&scif_clk>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   706  			clock-names = "fck", "brg_int", "scif_clk";
08f282888effdf Geert Uytterhoeven 2022-09-26   707  			dmas = <&dmac0 0x31>, <&dmac0 0x30>,
08f282888effdf Geert Uytterhoeven 2022-09-26   708  			       <&dmac1 0x31>, <&dmac1 0x30>;
08f282888effdf Geert Uytterhoeven 2022-09-26   709  			dma-names = "tx", "rx", "tx", "rx";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   710  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   711  			resets = <&cpg 514>;
987da486d84a56 Yoshihiro Shimoda  2022-04-28   712  			status = "disabled";
987da486d84a56 Yoshihiro Shimoda  2022-04-28   713  		};
987da486d84a56 Yoshihiro Shimoda  2022-04-28   714  
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   715  		hscif1: serial@e6550000 {
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   716  			compatible = "renesas,hscif-r8a779g0",
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   717  				     "renesas,rcar-gen4-hscif", "renesas,hscif";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   718  			reg = <0 0xe6550000 0 0x60>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   719  			interrupts = <GIC_SPI 247 IRQ_TYPE_LEVEL_HIGH>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   720  			clocks = <&cpg CPG_MOD 515>,
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   721  				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   722  				 <&scif_clk>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   723  			clock-names = "fck", "brg_int", "scif_clk";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   724  			dmas = <&dmac0 0x33>, <&dmac0 0x32>,
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   725  			       <&dmac1 0x33>, <&dmac1 0x32>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   726  			dma-names = "tx", "rx", "tx", "rx";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   727  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   728  			resets = <&cpg 515>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   729  			status = "disabled";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   730  		};
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   731  
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   732  		hscif2: serial@e6560000 {
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   733  			compatible = "renesas,hscif-r8a779g0",
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   734  				     "renesas,rcar-gen4-hscif", "renesas,hscif";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   735  			reg = <0 0xe6560000 0 0x60>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   736  			interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   737  			clocks = <&cpg CPG_MOD 516>,
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   738  				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
08e799f6bce80d Geert Uytterhoeven 2024-01-18   739  				 <&scif_clk2>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   740  			clock-names = "fck", "brg_int", "scif_clk";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   741  			dmas = <&dmac0 0x35>, <&dmac0 0x34>,
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   742  			       <&dmac1 0x35>, <&dmac1 0x34>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   743  			dma-names = "tx", "rx", "tx", "rx";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   744  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   745  			resets = <&cpg 516>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   746  			status = "disabled";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   747  		};
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   748  
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   749  		hscif3: serial@e66a0000 {
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   750  			compatible = "renesas,hscif-r8a779g0",
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   751  				     "renesas,rcar-gen4-hscif", "renesas,hscif";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   752  			reg = <0 0xe66a0000 0 0x60>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   753  			interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   754  			clocks = <&cpg CPG_MOD 517>,
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   755  				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   756  				 <&scif_clk>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   757  			clock-names = "fck", "brg_int", "scif_clk";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   758  			dmas = <&dmac0 0x37>, <&dmac0 0x36>,
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   759  			       <&dmac1 0x37>, <&dmac1 0x36>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   760  			dma-names = "tx", "rx", "tx", "rx";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   761  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   762  			resets = <&cpg 517>;
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   763  			status = "disabled";
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   764  		};
39d9dfc6fbe186 Geert Uytterhoeven 2022-10-21   765  
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   766  		pciec0: pcie@e65d0000 {
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   767  			compatible = "renesas,r8a779g0-pcie",
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   768  				     "renesas,rcar-gen4-pcie";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   769  			reg = <0 0xe65d0000 0 0x1000>, <0 0xe65d2000 0 0x0800>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   770  			      <0 0xe65d3000 0 0x2000>, <0 0xe65d5000 0 0x1200>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   771  			      <0 0xe65d6200 0 0x0e00>, <0 0xe65d7000 0 0x0400>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   772  			      <0 0xfe000000 0 0x400000>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   773  			reg-names = "dbi", "dbi2", "atu", "dma", "app", "phy", "config";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   774  			interrupts = <GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   775  				     <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   776  				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   777  				     <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   778  			interrupt-names = "msi", "dma", "sft_ce", "app";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   779  			clocks = <&cpg CPG_MOD 624>, <&pcie0_clkref>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   780  			clock-names = "core", "ref";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   781  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   782  			resets = <&cpg 624>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   783  			reset-names = "pwr";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   784  			max-link-speed = <4>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   785  			num-lanes = <2>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   786  			#address-cells = <3>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   787  			#size-cells = <2>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   788  			bus-range = <0x00 0xff>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   789  			device_type = "pci";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   790  			ranges = <0x01000000 0 0x00000000 0 0xfe000000 0 0x00400000>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   791  				 <0x02000000 0 0x30000000 0 0x30000000 0 0x10000000>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   792  			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   793  			#interrupt-cells = <1>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   794  			interrupt-map-mask = <0 0 0 7>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   795  			interrupt-map = <0 0 0 1 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   796  					<0 0 0 2 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   797  					<0 0 0 3 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   798  					<0 0 0 4 &gic GIC_SPI 449 IRQ_TYPE_LEVEL_HIGH>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   799  			snps,enable-cdm-check;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   800  			status = "disabled";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   801  		};
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   802  
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   803  		pciec1: pcie@e65d8000 {
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   804  			compatible = "renesas,r8a779g0-pcie",
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   805  				     "renesas,rcar-gen4-pcie";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   806  			reg = <0 0xe65d8000 0 0x1000>, <0 0xe65da000 0 0x0800>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   807  			      <0 0xe65db000 0 0x2000>, <0 0xe65dd000 0 0x1200>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   808  			      <0 0xe65de200 0 0x0e00>, <0 0xe65df000 0 0x0400>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   809  			      <0 0xee900000 0 0x400000>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   810  			reg-names = "dbi", "dbi2", "atu", "dma", "app", "phy", "config";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   811  			interrupts = <GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   812  				     <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   813  				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   814  				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   815  			interrupt-names = "msi", "dma", "sft_ce", "app";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   816  			clocks = <&cpg CPG_MOD 625>, <&pcie1_clkref>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   817  			clock-names = "core", "ref";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   818  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   819  			resets = <&cpg 625>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   820  			reset-names = "pwr";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   821  			max-link-speed = <4>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   822  			num-lanes = <2>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   823  			#address-cells = <3>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   824  			#size-cells = <2>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   825  			bus-range = <0x00 0xff>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   826  			device_type = "pci";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   827  			ranges = <0x01000000 0 0x00000000 0 0xee900000 0 0x00400000>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   828  				 <0x02000000 0 0xc0000000 0 0xc0000000 0 0x10000000>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   829  			dma-ranges = <0x42000000 0 0x00000000 0 0x00000000 1 0x00000000>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   830  			#interrupt-cells = <1>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   831  			interrupt-map-mask = <0 0 0 7>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   832  			interrupt-map = <0 0 0 1 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   833  					<0 0 0 2 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   834  					<0 0 0 3 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   835  					<0 0 0 4 &gic GIC_SPI 456 IRQ_TYPE_LEVEL_HIGH>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   836  			snps,enable-cdm-check;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   837  			status = "disabled";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   838  		};
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   839  
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   840  		pciec0_ep: pcie-ep@e65d0000 {
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   841  			compatible = "renesas,r8a779g0-pcie-ep",
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   842  				     "renesas,rcar-gen4-pcie-ep";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   843  			reg = <0 0xe65d0000 0 0x2000>, <0 0xe65d2000 0 0x1000>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   844  			      <0 0xe65d3000 0 0x2000>, <0 0xe65d5000 0 0x1200>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   845  			      <0 0xe65d6200 0 0x0e00>, <0 0xe65d7000 0 0x0400>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   846  			      <0 0xfe000000 0 0x400000>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   847  			reg-names = "dbi", "dbi2", "atu", "dma", "app", "phy", "addr_space";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   848  			interrupts = <GIC_SPI 450 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   849  				     <GIC_SPI 451 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   850  				     <GIC_SPI 455 IRQ_TYPE_LEVEL_HIGH>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   851  			interrupt-names = "dma", "sft_ce", "app";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   852  			clocks = <&cpg CPG_MOD 624>, <&pcie0_clkref>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   853  			clock-names = "core", "ref";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   854  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   855  			resets = <&cpg 624>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   856  			reset-names = "pwr";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   857  			max-link-speed = <4>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   858  			num-lanes = <2>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   859  			max-functions = /bits/ 8 <2>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   860  			status = "disabled";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   861  		};
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   862  
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   863  		pciec1_ep: pcie-ep@e65d8000 {
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   864  			compatible = "renesas,r8a779g0-pcie-ep",
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   865  				     "renesas,rcar-gen4-pcie-ep";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   866  			reg = <0 0xe65d8000 0 0x2000>, <0 0xe65da000 0 0x1000>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   867  			      <0 0xe65db000 0 0x2000>, <0 0xe65dd000 0 0x1200>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   868  			      <0 0xe65de200 0 0x0e00>, <0 0xe65df000 0 0x0400>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   869  			      <0 0xee900000 0 0x400000>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   870  			reg-names = "dbi", "dbi2", "atu", "dma", "app", "phy", "addr_space";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   871  			interrupts = <GIC_SPI 457 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   872  				     <GIC_SPI 458 IRQ_TYPE_LEVEL_HIGH>,
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   873  				     <GIC_SPI 462 IRQ_TYPE_LEVEL_HIGH>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   874  			interrupt-names = "dma", "sft_ce", "app";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   875  			clocks = <&cpg CPG_MOD 625>, <&pcie1_clkref>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   876  			clock-names = "core", "ref";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   877  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   878  			resets = <&cpg 625>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   879  			reset-names = "pwr";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   880  			max-link-speed = <4>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   881  			num-lanes = <2>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   882  			max-functions = /bits/ 8 <2>;
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   883  			status = "disabled";
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   884  		};
9b3e59b707f25b Yoshihiro Shimoda  2024-08-22   885  
5056a0c7286237 Geert Uytterhoeven 2023-01-23   886  		canfd: can@e6660000 {
5056a0c7286237 Geert Uytterhoeven 2023-01-23   887  			compatible = "renesas,r8a779g0-canfd",
5056a0c7286237 Geert Uytterhoeven 2023-01-23   888  				     "renesas,rcar-gen4-canfd";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   889  			reg = <0 0xe6660000 0 0x8500>;
5056a0c7286237 Geert Uytterhoeven 2023-01-23   890  			interrupts = <GIC_SPI 412 IRQ_TYPE_LEVEL_HIGH>,
5056a0c7286237 Geert Uytterhoeven 2023-01-23   891  				     <GIC_SPI 413 IRQ_TYPE_LEVEL_HIGH>;
5056a0c7286237 Geert Uytterhoeven 2023-01-23   892  			interrupt-names = "ch_int", "g_int";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   893  			clocks = <&cpg CPG_MOD 328>,
5056a0c7286237 Geert Uytterhoeven 2023-01-23   894  				 <&cpg CPG_CORE R8A779G0_CLK_CANFD>,
5056a0c7286237 Geert Uytterhoeven 2023-01-23   895  				 <&can_clk>;
5056a0c7286237 Geert Uytterhoeven 2023-01-23   896  			clock-names = "fck", "canfd", "can_clk";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   897  			assigned-clocks = <&cpg CPG_CORE R8A779G0_CLK_CANFD>;
5056a0c7286237 Geert Uytterhoeven 2023-01-23   898  			assigned-clock-rates = <80000000>;
5056a0c7286237 Geert Uytterhoeven 2023-01-23   899  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5056a0c7286237 Geert Uytterhoeven 2023-01-23   900  			resets = <&cpg 328>;
5056a0c7286237 Geert Uytterhoeven 2023-01-23   901  			status = "disabled";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   902  
5056a0c7286237 Geert Uytterhoeven 2023-01-23   903  			channel0 {
5056a0c7286237 Geert Uytterhoeven 2023-01-23   904  				status = "disabled";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   905  			};
5056a0c7286237 Geert Uytterhoeven 2023-01-23   906  
5056a0c7286237 Geert Uytterhoeven 2023-01-23   907  			channel1 {
5056a0c7286237 Geert Uytterhoeven 2023-01-23   908  				status = "disabled";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   909  			};
5056a0c7286237 Geert Uytterhoeven 2023-01-23   910  
5056a0c7286237 Geert Uytterhoeven 2023-01-23   911  			channel2 {
5056a0c7286237 Geert Uytterhoeven 2023-01-23   912  				status = "disabled";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   913  			};
5056a0c7286237 Geert Uytterhoeven 2023-01-23   914  
5056a0c7286237 Geert Uytterhoeven 2023-01-23   915  			channel3 {
5056a0c7286237 Geert Uytterhoeven 2023-01-23   916  				status = "disabled";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   917  			};
5056a0c7286237 Geert Uytterhoeven 2023-01-23   918  
5056a0c7286237 Geert Uytterhoeven 2023-01-23   919  			channel4 {
5056a0c7286237 Geert Uytterhoeven 2023-01-23   920  				status = "disabled";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   921  			};
5056a0c7286237 Geert Uytterhoeven 2023-01-23   922  
5056a0c7286237 Geert Uytterhoeven 2023-01-23   923  			channel5 {
5056a0c7286237 Geert Uytterhoeven 2023-01-23   924  				status = "disabled";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   925  			};
5056a0c7286237 Geert Uytterhoeven 2023-01-23   926  
5056a0c7286237 Geert Uytterhoeven 2023-01-23   927  			channel6 {
5056a0c7286237 Geert Uytterhoeven 2023-01-23   928  				status = "disabled";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   929  			};
5056a0c7286237 Geert Uytterhoeven 2023-01-23   930  
5056a0c7286237 Geert Uytterhoeven 2023-01-23   931  			channel7 {
5056a0c7286237 Geert Uytterhoeven 2023-01-23   932  				status = "disabled";
5056a0c7286237 Geert Uytterhoeven 2023-01-23   933  			};
5056a0c7286237 Geert Uytterhoeven 2023-01-23   934  		};
5056a0c7286237 Geert Uytterhoeven 2023-01-23   935  
848c82db56923a Geert Uytterhoeven 2022-09-09   936  		avb0: ethernet@e6800000 {
848c82db56923a Geert Uytterhoeven 2022-09-09   937  			compatible = "renesas,etheravb-r8a779g0",
848c82db56923a Geert Uytterhoeven 2022-09-09   938  				     "renesas,etheravb-rcar-gen4";
7edbb5880dc331 Geert Uytterhoeven 2024-02-11   939  			reg = <0 0xe6800000 0 0x1000>;
848c82db56923a Geert Uytterhoeven 2022-09-09   940  			interrupts = <GIC_SPI 335 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   941  				     <GIC_SPI 336 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   942  				     <GIC_SPI 337 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   943  				     <GIC_SPI 338 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   944  				     <GIC_SPI 339 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   945  				     <GIC_SPI 340 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   946  				     <GIC_SPI 341 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   947  				     <GIC_SPI 342 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   948  				     <GIC_SPI 343 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   949  				     <GIC_SPI 344 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   950  				     <GIC_SPI 345 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   951  				     <GIC_SPI 346 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   952  				     <GIC_SPI 347 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   953  				     <GIC_SPI 348 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   954  				     <GIC_SPI 349 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   955  				     <GIC_SPI 350 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   956  				     <GIC_SPI 351 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   957  				     <GIC_SPI 352 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   958  				     <GIC_SPI 353 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   959  				     <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   960  				     <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   961  				     <GIC_SPI 356 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   962  				     <GIC_SPI 357 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   963  				     <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   964  				     <GIC_SPI 359 IRQ_TYPE_LEVEL_HIGH>;
848c82db56923a Geert Uytterhoeven 2022-09-09   965  			interrupt-names = "ch0", "ch1", "ch2", "ch3", "ch4",
848c82db56923a Geert Uytterhoeven 2022-09-09   966  					  "ch5", "ch6", "ch7", "ch8", "ch9",
848c82db56923a Geert Uytterhoeven 2022-09-09   967  					  "ch10", "ch11", "ch12", "ch13",
848c82db56923a Geert Uytterhoeven 2022-09-09   968  					  "ch14", "ch15", "ch16", "ch17",
848c82db56923a Geert Uytterhoeven 2022-09-09   969  					  "ch18", "ch19", "ch20", "ch21",
848c82db56923a Geert Uytterhoeven 2022-09-09   970  					  "ch22", "ch23", "ch24";
848c82db56923a Geert Uytterhoeven 2022-09-09   971  			clocks = <&cpg CPG_MOD 211>;
848c82db56923a Geert Uytterhoeven 2022-09-09   972  			clock-names = "fck";
848c82db56923a Geert Uytterhoeven 2022-09-09   973  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
848c82db56923a Geert Uytterhoeven 2022-09-09   974  			resets = <&cpg 211>;
848c82db56923a Geert Uytterhoeven 2022-09-09   975  			phy-mode = "rgmii";
848c82db56923a Geert Uytterhoeven 2022-09-09   976  			rx-internal-delay-ps = <0>;
848c82db56923a Geert Uytterhoeven 2022-09-09   977  			tx-internal-delay-ps = <0>;
c313c77babc72b Geert Uytterhoeven 2024-07-08   978  			iommus = <&ipmmu_hc 0>;
848c82db56923a Geert Uytterhoeven 2022-09-09   979  			status = "disabled";
848c82db56923a Geert Uytterhoeven 2022-09-09   980  		};
848c82db56923a Geert Uytterhoeven 2022-09-09   981  
848c82db56923a Geert Uytterhoeven 2022-09-09   982  		avb1: ethernet@e6810000 {
848c82db56923a Geert Uytterhoeven 2022-09-09   983  			compatible = "renesas,etheravb-r8a779g0",
848c82db56923a Geert Uytterhoeven 2022-09-09   984  				     "renesas,etheravb-rcar-gen4";
7edbb5880dc331 Geert Uytterhoeven 2024-02-11   985  			reg = <0 0xe6810000 0 0x1000>;
848c82db56923a Geert Uytterhoeven 2022-09-09   986  			interrupts = <GIC_SPI 360 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   987  				     <GIC_SPI 361 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   988  				     <GIC_SPI 362 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   989  				     <GIC_SPI 363 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   990  				     <GIC_SPI 364 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   991  				     <GIC_SPI 365 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   992  				     <GIC_SPI 366 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   993  				     <GIC_SPI 367 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   994  				     <GIC_SPI 368 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   995  				     <GIC_SPI 369 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   996  				     <GIC_SPI 370 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   997  				     <GIC_SPI 371 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   998  				     <GIC_SPI 372 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09   999  				     <GIC_SPI 373 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1000  				     <GIC_SPI 374 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1001  				     <GIC_SPI 375 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1002  				     <GIC_SPI 376 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1003  				     <GIC_SPI 377 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1004  				     <GIC_SPI 378 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1005  				     <GIC_SPI 379 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1006  				     <GIC_SPI 380 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1007  				     <GIC_SPI 381 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1008  				     <GIC_SPI 382 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1009  				     <GIC_SPI 383 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1010  				     <GIC_SPI 384 IRQ_TYPE_LEVEL_HIGH>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1011  			interrupt-names = "ch0", "ch1", "ch2", "ch3", "ch4",
848c82db56923a Geert Uytterhoeven 2022-09-09  1012  					  "ch5", "ch6", "ch7", "ch8", "ch9",
848c82db56923a Geert Uytterhoeven 2022-09-09  1013  					  "ch10", "ch11", "ch12", "ch13",
848c82db56923a Geert Uytterhoeven 2022-09-09  1014  					  "ch14", "ch15", "ch16", "ch17",
848c82db56923a Geert Uytterhoeven 2022-09-09  1015  					  "ch18", "ch19", "ch20", "ch21",
848c82db56923a Geert Uytterhoeven 2022-09-09  1016  					  "ch22", "ch23", "ch24";
848c82db56923a Geert Uytterhoeven 2022-09-09  1017  			clocks = <&cpg CPG_MOD 212>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1018  			clock-names = "fck";
848c82db56923a Geert Uytterhoeven 2022-09-09  1019  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1020  			resets = <&cpg 212>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1021  			phy-mode = "rgmii";
848c82db56923a Geert Uytterhoeven 2022-09-09  1022  			rx-internal-delay-ps = <0>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1023  			tx-internal-delay-ps = <0>;
c313c77babc72b Geert Uytterhoeven 2024-07-08  1024  			iommus = <&ipmmu_hc 1>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1025  			status = "disabled";
848c82db56923a Geert Uytterhoeven 2022-09-09  1026  		};
848c82db56923a Geert Uytterhoeven 2022-09-09  1027  
848c82db56923a Geert Uytterhoeven 2022-09-09  1028  		avb2: ethernet@e6820000 {
848c82db56923a Geert Uytterhoeven 2022-09-09  1029  			compatible = "renesas,etheravb-r8a779g0",
848c82db56923a Geert Uytterhoeven 2022-09-09  1030  				     "renesas,etheravb-rcar-gen4";
848c82db56923a Geert Uytterhoeven 2022-09-09  1031  			reg = <0 0xe6820000 0 0x1000>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1032  			interrupts = <GIC_SPI 385 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1033  				     <GIC_SPI 386 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1034  				     <GIC_SPI 387 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1035  				     <GIC_SPI 388 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1036  				     <GIC_SPI 389 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1037  				     <GIC_SPI 390 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1038  				     <GIC_SPI 391 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1039  				     <GIC_SPI 392 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1040  				     <GIC_SPI 393 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1041  				     <GIC_SPI 394 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1042  				     <GIC_SPI 395 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1043  				     <GIC_SPI 396 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1044  				     <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1045  				     <GIC_SPI 398 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1046  				     <GIC_SPI 399 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1047  				     <GIC_SPI 400 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1048  				     <GIC_SPI 401 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1049  				     <GIC_SPI 402 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1050  				     <GIC_SPI 403 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1051  				     <GIC_SPI 404 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1052  				     <GIC_SPI 405 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1053  				     <GIC_SPI 406 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1054  				     <GIC_SPI 407 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1055  				     <GIC_SPI 408 IRQ_TYPE_LEVEL_HIGH>,
848c82db56923a Geert Uytterhoeven 2022-09-09  1056  				     <GIC_SPI 409 IRQ_TYPE_LEVEL_HIGH>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1057  			interrupt-names = "ch0", "ch1", "ch2", "ch3", "ch4",
848c82db56923a Geert Uytterhoeven 2022-09-09  1058  					  "ch5", "ch6", "ch7", "ch8", "ch9",
848c82db56923a Geert Uytterhoeven 2022-09-09  1059  					  "ch10", "ch11", "ch12", "ch13",
848c82db56923a Geert Uytterhoeven 2022-09-09  1060  					  "ch14", "ch15", "ch16", "ch17",
848c82db56923a Geert Uytterhoeven 2022-09-09  1061  					  "ch18", "ch19", "ch20", "ch21",
848c82db56923a Geert Uytterhoeven 2022-09-09  1062  					  "ch22", "ch23", "ch24";
848c82db56923a Geert Uytterhoeven 2022-09-09  1063  			clocks = <&cpg CPG_MOD 213>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1064  			clock-names = "fck";
848c82db56923a Geert Uytterhoeven 2022-09-09  1065  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1066  			resets = <&cpg 213>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1067  			phy-mode = "rgmii";
848c82db56923a Geert Uytterhoeven 2022-09-09  1068  			rx-internal-delay-ps = <0>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1069  			tx-internal-delay-ps = <0>;
c313c77babc72b Geert Uytterhoeven 2024-07-08  1070  			iommus = <&ipmmu_hc 2>;
848c82db56923a Geert Uytterhoeven 2022-09-09  1071  			status = "disabled";
848c82db56923a Geert Uytterhoeven 2022-09-09  1072  		};
848c82db56923a Geert Uytterhoeven 2022-09-09  1073  
5b9d1306ef463f CongDang           2022-10-07  1074  		pwm0: pwm@e6e30000 {
5b9d1306ef463f CongDang           2022-10-07  1075  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1076  			reg = <0 0xe6e30000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1077  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1078  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1079  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1080  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1081  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1082  		};
5b9d1306ef463f CongDang           2022-10-07  1083  
5b9d1306ef463f CongDang           2022-10-07  1084  		pwm1: pwm@e6e31000 {
5b9d1306ef463f CongDang           2022-10-07  1085  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1086  			reg = <0 0xe6e31000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1087  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1088  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1089  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1090  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1091  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1092  		};
5b9d1306ef463f CongDang           2022-10-07  1093  
5b9d1306ef463f CongDang           2022-10-07  1094  		pwm2: pwm@e6e32000 {
5b9d1306ef463f CongDang           2022-10-07  1095  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1096  			reg = <0 0xe6e32000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1097  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1098  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1099  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1100  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1101  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1102  		};
5b9d1306ef463f CongDang           2022-10-07  1103  
5b9d1306ef463f CongDang           2022-10-07  1104  		pwm3: pwm@e6e33000 {
5b9d1306ef463f CongDang           2022-10-07  1105  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1106  			reg = <0 0xe6e33000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1107  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1108  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1109  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1110  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1111  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1112  		};
5b9d1306ef463f CongDang           2022-10-07  1113  
5b9d1306ef463f CongDang           2022-10-07  1114  		pwm4: pwm@e6e34000 {
5b9d1306ef463f CongDang           2022-10-07  1115  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1116  			reg = <0 0xe6e34000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1117  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1118  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1119  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1120  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1121  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1122  		};
5b9d1306ef463f CongDang           2022-10-07  1123  
5b9d1306ef463f CongDang           2022-10-07  1124  		pwm5: pwm@e6e35000 {
5b9d1306ef463f CongDang           2022-10-07  1125  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1126  			reg = <0 0xe6e35000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1127  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1128  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1129  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1130  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1131  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1132  		};
5b9d1306ef463f CongDang           2022-10-07  1133  
5b9d1306ef463f CongDang           2022-10-07  1134  		pwm6: pwm@e6e36000 {
5b9d1306ef463f CongDang           2022-10-07  1135  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1136  			reg = <0 0xe6e36000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1137  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1138  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1139  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1140  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1141  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1142  		};
5b9d1306ef463f CongDang           2022-10-07  1143  
5b9d1306ef463f CongDang           2022-10-07  1144  		pwm7: pwm@e6e37000 {
5b9d1306ef463f CongDang           2022-10-07  1145  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1146  			reg = <0 0xe6e37000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1147  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1148  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1149  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1150  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1151  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1152  		};
5b9d1306ef463f CongDang           2022-10-07  1153  
5b9d1306ef463f CongDang           2022-10-07  1154  		pwm8: pwm@e6e38000 {
5b9d1306ef463f CongDang           2022-10-07  1155  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1156  			reg = <0 0xe6e38000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1157  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1158  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1159  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1160  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1161  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1162  		};
5b9d1306ef463f CongDang           2022-10-07  1163  
5b9d1306ef463f CongDang           2022-10-07  1164  		pwm9: pwm@e6e39000 {
5b9d1306ef463f CongDang           2022-10-07  1165  			compatible = "renesas,pwm-r8a779g0", "renesas,pwm-rcar";
5b9d1306ef463f CongDang           2022-10-07  1166  			reg = <0 0xe6e39000 0 0x10>;
5b9d1306ef463f CongDang           2022-10-07  1167  			#pwm-cells = <2>;
5b9d1306ef463f CongDang           2022-10-07  1168  			clocks = <&cpg CPG_MOD 628>;
5b9d1306ef463f CongDang           2022-10-07  1169  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
5b9d1306ef463f CongDang           2022-10-07  1170  			resets = <&cpg 628>;
5b9d1306ef463f CongDang           2022-10-07  1171  			status = "disabled";
5b9d1306ef463f CongDang           2022-10-07  1172  		};
5b9d1306ef463f CongDang           2022-10-07  1173  
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1174  		scif0: serial@e6e60000 {
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1175  			compatible = "renesas,scif-r8a779g0",
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1176  				     "renesas,rcar-gen4-scif", "renesas,scif";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1177  			reg = <0 0xe6e60000 0 64>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1178  			interrupts = <GIC_SPI 251 IRQ_TYPE_LEVEL_HIGH>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1179  			clocks = <&cpg CPG_MOD 702>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1180  				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1181  				 <&scif_clk>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1182  			clock-names = "fck", "brg_int", "scif_clk";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1183  			dmas = <&dmac0 0x51>, <&dmac0 0x50>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1184  			       <&dmac1 0x51>, <&dmac1 0x50>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1185  			dma-names = "tx", "rx", "tx", "rx";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1186  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1187  			resets = <&cpg 702>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1188  			status = "disabled";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1189  		};
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1190  
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1191  		scif1: serial@e6e68000 {
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1192  			compatible = "renesas,scif-r8a779g0",
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1193  				     "renesas,rcar-gen4-scif", "renesas,scif";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1194  			reg = <0 0xe6e68000 0 64>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1195  			interrupts = <GIC_SPI 252 IRQ_TYPE_LEVEL_HIGH>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1196  			clocks = <&cpg CPG_MOD 703>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1197  				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1198  				 <&scif_clk>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1199  			clock-names = "fck", "brg_int", "scif_clk";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1200  			dmas = <&dmac0 0x53>, <&dmac0 0x52>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1201  			       <&dmac1 0x53>, <&dmac1 0x52>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1202  			dma-names = "tx", "rx", "tx", "rx";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1203  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1204  			resets = <&cpg 703>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1205  			status = "disabled";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1206  		};
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1207  
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1208  		scif3: serial@e6c50000 {
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1209  			compatible = "renesas,scif-r8a779g0",
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1210  				     "renesas,rcar-gen4-scif", "renesas,scif";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1211  			reg = <0 0xe6c50000 0 64>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1212  			interrupts = <GIC_SPI 253 IRQ_TYPE_LEVEL_HIGH>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1213  			clocks = <&cpg CPG_MOD 704>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1214  				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1215  				 <&scif_clk>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1216  			clock-names = "fck", "brg_int", "scif_clk";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1217  			dmas = <&dmac0 0x57>, <&dmac0 0x56>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1218  			       <&dmac1 0x57>, <&dmac1 0x56>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1219  			dma-names = "tx", "rx", "tx", "rx";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1220  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1221  			resets = <&cpg 704>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1222  			status = "disabled";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1223  		};
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1224  
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1225  		scif4: serial@e6c40000 {
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1226  			compatible = "renesas,scif-r8a779g0",
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1227  				     "renesas,rcar-gen4-scif", "renesas,scif";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1228  			reg = <0 0xe6c40000 0 64>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1229  			interrupts = <GIC_SPI 254 IRQ_TYPE_LEVEL_HIGH>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1230  			clocks = <&cpg CPG_MOD 705>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1231  				 <&cpg CPG_CORE R8A779G0_CLK_SASYNCPERD1>,
08e799f6bce80d Geert Uytterhoeven 2024-01-18  1232  				 <&scif_clk2>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1233  			clock-names = "fck", "brg_int", "scif_clk";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1234  			dmas = <&dmac0 0x59>, <&dmac0 0x58>,
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1235  			       <&dmac1 0x59>, <&dmac1 0x58>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1236  			dma-names = "tx", "rx", "tx", "rx";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1237  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1238  			resets = <&cpg 705>;
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1239  			status = "disabled";
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1240  		};
a4c31c56d2d356 Geert Uytterhoeven 2022-10-21  1241  
4a76d4ab8487aa CongDang           2022-10-07  1242  		tpu: pwm@e6e80000 {
4a76d4ab8487aa CongDang           2022-10-07  1243  			compatible = "renesas,tpu-r8a779g0", "renesas,tpu";
4a76d4ab8487aa CongDang           2022-10-07  1244  			reg = <0 0xe6e80000 0 0x148>;
4a76d4ab8487aa CongDang           2022-10-07  1245  			interrupts = <GIC_SPI 308 IRQ_TYPE_LEVEL_HIGH>;
4a76d4ab8487aa CongDang           2022-10-07  1246  			clocks = <&cpg CPG_MOD 718>;
4a76d4ab8487aa CongDang           2022-10-07  1247  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
4a76d4ab8487aa CongDang           2022-10-07  1248  			resets = <&cpg 718>;
4a76d4ab8487aa CongDang           2022-10-07  1249  			#pwm-cells = <3>;
4a76d4ab8487aa CongDang           2022-10-07  1250  			status = "disabled";
4a76d4ab8487aa CongDang           2022-10-07  1251  		};
4a76d4ab8487aa CongDang           2022-10-07  1252  
e076807315cb62 Geert Uytterhoeven 2022-09-26  1253  		msiof0: spi@e6e90000 {
e076807315cb62 Geert Uytterhoeven 2022-09-26  1254  			compatible = "renesas,msiof-r8a779g0",
e076807315cb62 Geert Uytterhoeven 2022-09-26  1255  				     "renesas,rcar-gen4-msiof";
e076807315cb62 Geert Uytterhoeven 2022-09-26  1256  			reg = <0 0xe6e90000 0 0x0064>;
e076807315cb62 Geert Uytterhoeven 2022-09-26  1257  			interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
e076807315cb62 Geert Uytterhoeven 2022-09-26  1258  			clocks = <&cpg CPG_MOD 618>;
e076807315cb62 Geert Uytterhoeven 2022-09-26  1259  			dmas = <&dmac0 0x41>, <&dmac0 0x40>,
e076807315cb62 Geert Uytterhoeven 2022-09-26  1260  			       <&dmac1 0x41>, <&dmac1 0x40>;
e076807315cb62 Geert Uytterhoeven 2022-09-26  1261  			dma-names = "tx", "rx", "tx", "rx";
e076807315cb62 Geert Uytterhoeven 2022-09-26  1262  			power-domains = <&sysc R8A779G0_PD_ALWAYS_ON>;
e076807315cb62 Geert Uytterhoeven 2022-09-26  1263  			resets = <&cpg 618>;
e076807315cb62 Geert Uytterhoeven 2022-09-26  1264  			#address-cells = <1>;
e076807315cb62 Geert Uytterhoeven 2022-09-26  1265  			#size-cells = <0>;
e076807315cb62 Geert Uytterhoeven 2022-09-26  1266  			status = "disabled";
e076807315cb62 Geert Uytterhoeven 2022-09-26  1267  		};
e076807315cb62 Geert Uytterhoeven 2022-09-26  1268  
e076807315cb62 Geert Uytterhoeven 2022-09-26 @1269  		msiof1: spi@e6ea0000 {

:::::: The code at line 1269 was first introduced by commit
:::::: e076807315cb62ec3bc94f9a473bcb0caf4f2760 arm64: dts: renesas: r8a779g0: Add MSIOF nodes

:::::: TO: Geert Uytterhoeven <geert+renesas@glider.be>
:::::: CC: Geert Uytterhoeven <geert+renesas@glider.be>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
