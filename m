Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CA7ADDA8
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Jun 2024 14:21:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718547692; cv=none; b=FbulvCDX+UMIPkEMl6W4XexJdI4YKdei8e1Hg36zYz1EEAnQSz6KoX/Ix+4NjMkhw3gxeTscFf/Wu0inid+UI3Kw6ItQ72SywoTDA20udqM4+twL4DEAGdo3jleOdJQXgDrdN7NmMR6YOmY3LBv6MhkAPIYL1xJ/TMgN2mTSxUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718547692; c=relaxed/simple;
	bh=gECz5L/fZFduXLL7hFPp6ZZEvGIyLXG7T76vzGK5l4c=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=H3LudcgrDsYpVjIVSDYFEfNjierLrhk8uqavW1sLrtKtUazktPIj/FiOfdssjv1+F62fyPApjuhQ5b9Ae+cakmKCpGGax1FYtG5N8Nap+I0wPs77lSOhYt18sEVlfbhDUPrKPzKdf5al1hD5lDlGBA3LAaRJIAWenHXmAYeMhfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dWo4hmNA; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dWo4hmNA"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718547684; x=1750083684;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gECz5L/fZFduXLL7hFPp6ZZEvGIyLXG7T76vzGK5l4c=;
  b=dWo4hmNA6DXqJonbnaVq+ZGF/0Rr+1VpfONqc24qQkhYZCJ5NirQ80ap
   yVgcRsyc7O+YsJC2i6HEqJCG9IUv9vnBzu7WoHZfsxINt+ir5xl/0Cl8g
   C4uyhB2Q8gC/A01AOSzV9Xj2fz8/xHSEIZVBCprwSYsO/QLYIcUoCuA5v
   6QaXYubrLyBmrmV6thQOBp4xBjwKAnxzHky3UkyVdru3TT0kwFza+4J6v
   U6fWi1Tn4UFWnuFIfkVRBG7mE6CKr94n+8mFajDOyUymSgJg6wdTes2ly
   pPkMlqKDXivvKC5q1KbkvxDWgwRP9Cf/VnshfG72g0k7v0zD9g6Fd+1f+
   A==;
X-CSE-ConnectionGUID: qA2yAoYiS8+9m5dXjHxOJA==
X-CSE-MsgGUID: wXpybT9oSw+Jrdqt53Paag==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="40801558"
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="40801558"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2024 07:21:23 -0700
X-CSE-ConnectionGUID: mnbSYFFsQYeMx8kVtQzMsQ==
X-CSE-MsgGUID: 6S1RMxWARsOAw4khvzRd6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,242,1712646000"; 
   d="scan'208";a="45347385"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 16 Jun 2024 07:21:21 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIqkx-0002u0-0l;
	Sun, 16 Jun 2024 14:21:19 +0000
Date: Sun, 16 Jun 2024 22:20:19 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Chintan Vankar <c-vankar@ti.com>
Subject: [ti:ti-rt-linux-6.6.y 32/39]
 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:2306.34-2315.4: Warning
 (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202406162240.YLgpFAmx-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y
head:   eeca5715c9a5b742423bd83ed587fac26268771c
commit: f74099ea2c2d694cb6069145155e5e738cd957fc [32/39] arm64: dts: ti: k3-j721e-common-proc-board: Add MCU CPSW CPTS PPS support
config: arm64-randconfig-003-20240616 (https://download.01.org/0day-ci/archive/20240616/202406162240.YLgpFAmx-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240616/202406162240.YLgpFAmx-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406162240.YLgpFAmx-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:1880.21-1896.4: Warning (simple_bus_reg): /bus@100000/dsi@48000000: simple-bus unit address format error, expected "4800000"
>> arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:2306.34-2315.4: Warning (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +2306 arch/arm64/boot/dts/ti/k3-j721e-main.dtsi

5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03    26  
2d87061e70dea4 Nishanth Menon         2019-05-22    27  &cbass_main {
2d87061e70dea4 Nishanth Menon         2019-05-22    28  	msmc_ram: sram@70000000 {
2d87061e70dea4 Nishanth Menon         2019-05-22    29  		compatible = "mmio-sram";
2d87061e70dea4 Nishanth Menon         2019-05-22    30  		reg = <0x0 0x70000000 0x0 0x800000>;
2d87061e70dea4 Nishanth Menon         2019-05-22    31  		#address-cells = <1>;
2d87061e70dea4 Nishanth Menon         2019-05-22    32  		#size-cells = <1>;
2d87061e70dea4 Nishanth Menon         2019-05-22    33  		ranges = <0x0 0x0 0x70000000 0x800000>;
2d87061e70dea4 Nishanth Menon         2019-05-22    34  
2d87061e70dea4 Nishanth Menon         2019-05-22    35  		atf-sram@0 {
2d87061e70dea4 Nishanth Menon         2019-05-22    36  			reg = <0x0 0x20000>;
2d87061e70dea4 Nishanth Menon         2019-05-22    37  		};
2d87061e70dea4 Nishanth Menon         2019-05-22    38  	};
2d87061e70dea4 Nishanth Menon         2019-05-22    39  
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29    40  	scm_conf: scm-conf@100000 {
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29    41  		compatible = "ti,j721e-system-controller", "syscon", "simple-mfd";
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29    42  		reg = <0 0x00100000 0 0x1c000>; /* excludes pinctrl region */
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29    43  		#address-cells = <1>;
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29    44  		#size-cells = <1>;
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29    45  		ranges = <0x0 0x0 0x00100000 0x1c000>;
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29    46  
3f92a5be6084b7 Kishon Vijay Abraham I 2021-11-26    47  		serdes_ln_ctrl: mux-controller@4080 {
dd225c6aaefd6c Andrew Davis           2024-01-24    48  			compatible = "reg-mux";
dd225c6aaefd6c Andrew Davis           2024-01-24    49  			reg = <0x4080 0x50>;
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29    50  			#mux-control-cells = <1>;
dd225c6aaefd6c Andrew Davis           2024-01-24    51  			mux-reg-masks = <0x0 0x3>, <0x4 0x3>, /* SERDES0 lane0/1 select */
dd225c6aaefd6c Andrew Davis           2024-01-24    52  					<0x10 0x3>, <0x14 0x3>, /* SERDES1 lane0/1 select */
dd225c6aaefd6c Andrew Davis           2024-01-24    53  					<0x20 0x3>, <0x24 0x3>, /* SERDES2 lane0/1 select */
dd225c6aaefd6c Andrew Davis           2024-01-24    54  					<0x30 0x3>, <0x34 0x3>, /* SERDES3 lane0/1 select */
dd225c6aaefd6c Andrew Davis           2024-01-24    55  					<0x40 0x3>, <0x44 0x3>, /* SERDES4 lane0/1 select */
dd225c6aaefd6c Andrew Davis           2024-01-24    56  					<0x48 0x3>, <0x4c 0x3>; /* SERDES4 lane2/3 select */
c65176fd49f45b Roger Quadros          2020-09-18    57  			idle-states = <J721E_SERDES0_LANE0_PCIE0_LANE0>, <J721E_SERDES0_LANE1_PCIE0_LANE1>,
c65176fd49f45b Roger Quadros          2020-09-18    58  				      <J721E_SERDES1_LANE0_PCIE1_LANE0>, <J721E_SERDES1_LANE1_PCIE1_LANE1>,
c65176fd49f45b Roger Quadros          2020-09-18    59  				      <J721E_SERDES2_LANE0_PCIE2_LANE0>, <J721E_SERDES2_LANE1_PCIE2_LANE1>,
c65176fd49f45b Roger Quadros          2020-09-18    60  				      <MUX_IDLE_AS_IS>, <J721E_SERDES3_LANE1_USB3_0>,
c65176fd49f45b Roger Quadros          2020-09-18    61  				      <J721E_SERDES4_LANE0_EDP_LANE0>, <J721E_SERDES4_LANE1_EDP_LANE1>,
c65176fd49f45b Roger Quadros          2020-09-18    62  				      <J721E_SERDES4_LANE2_EDP_LANE2>, <J721E_SERDES4_LANE3_EDP_LANE3>;
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29    63  		};
4716053a0a7bed Roger Quadros          2020-06-29    64  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15    65  		cpsw0_phy_gmii_sel: phy@4044 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15    66  			compatible = "ti,j721e-cpsw9g-phy-gmii-sel";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15    67  			ti,qsgmii-main-ports = <2>, <2>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15    68  			reg = <0x4044 0x20>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15    69  			#phy-cells = <1>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15    70  		};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15    71  
4716053a0a7bed Roger Quadros          2020-06-29    72  		usb_serdes_mux: mux-controller@4000 {
9dba895d8f20c1 Andrew Davis           2024-01-24    73  			compatible = "reg-mux";
9dba895d8f20c1 Andrew Davis           2024-01-24    74  			reg = <0x4000 0x20>;
4716053a0a7bed Roger Quadros          2020-06-29    75  			#mux-control-cells = <1>;
9dba895d8f20c1 Andrew Davis           2024-01-24    76  			mux-reg-masks = <0x0 0x8000000>, /* USB0 to SERDES0/3 mux */
9dba895d8f20c1 Andrew Davis           2024-01-24    77  					<0x10 0x8000000>; /* USB1 to SERDES1/2 mux */
4716053a0a7bed Roger Quadros          2020-06-29    78  		};
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    79  
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    80  		ehrpwm_tbclk: clock-controller@4140 {
2a7cc7bedb58d4 Nishanth Menon         2023-07-13    81  			compatible = "ti,am654-ehrpwm-tbclk";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    82  			reg = <0x4140 0x18>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    83  			#clock-cells = <1>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    84  		};
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    85  	};
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    86  
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    87  	main_ehrpwm0: pwm@3000000 {
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    88  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    89  		#pwm-cells = <3>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    90  		reg = <0x00 0x3000000 0x00 0x100>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    91  		power-domains = <&k3_pds 83 TI_SCI_PD_EXCLUSIVE>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    92  		clocks = <&ehrpwm_tbclk 0>, <&k3_clks 83 0>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    93  		clock-names = "tbclk", "fck";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    94  		status = "disabled";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    95  	};
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    96  
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    97  	main_ehrpwm1: pwm@3010000 {
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    98  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07    99  		#pwm-cells = <3>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   100  		reg = <0x00 0x3010000 0x00 0x100>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   101  		power-domains = <&k3_pds 84 TI_SCI_PD_EXCLUSIVE>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   102  		clocks = <&ehrpwm_tbclk 1>, <&k3_clks 84 0>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   103  		clock-names = "tbclk", "fck";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   104  		status = "disabled";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   105  	};
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   106  
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   107  	main_ehrpwm2: pwm@3020000 {
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   108  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   109  		#pwm-cells = <3>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   110  		reg = <0x00 0x3020000 0x00 0x100>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   111  		power-domains = <&k3_pds 85 TI_SCI_PD_EXCLUSIVE>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   112  		clocks = <&ehrpwm_tbclk 2>, <&k3_clks 85 0>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   113  		clock-names = "tbclk", "fck";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   114  		status = "disabled";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   115  	};
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   116  
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   117  	main_ehrpwm3: pwm@3030000 {
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   118  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   119  		#pwm-cells = <3>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   120  		reg = <0x00 0x3030000 0x00 0x100>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   121  		power-domains = <&k3_pds 86 TI_SCI_PD_EXCLUSIVE>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   122  		clocks = <&ehrpwm_tbclk 3>, <&k3_clks 86 0>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   123  		clock-names = "tbclk", "fck";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   124  		status = "disabled";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   125  	};
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   126  
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   127  	main_ehrpwm4: pwm@3040000 {
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   128  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   129  		#pwm-cells = <3>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   130  		reg = <0x00 0x3040000 0x00 0x100>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   131  		power-domains = <&k3_pds 87 TI_SCI_PD_EXCLUSIVE>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   132  		clocks = <&ehrpwm_tbclk 4>, <&k3_clks 87 0>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   133  		clock-names = "tbclk", "fck";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   134  		status = "disabled";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   135  	};
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   136  
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   137  	main_ehrpwm5: pwm@3050000 {
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   138  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   139  		#pwm-cells = <3>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   140  		reg = <0x00 0x3050000 0x00 0x100>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   141  		power-domains = <&k3_pds 88 TI_SCI_PD_EXCLUSIVE>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   142  		clocks = <&ehrpwm_tbclk 5>, <&k3_clks 88 0>;
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   143  		clock-names = "tbclk", "fck";
20f67d1dfc6ad6 Vijay Pothukuchi       2022-11-07   144  		status = "disabled";
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29   145  	};
b766e3b0d5f698 Kishon Vijay Abraham I 2020-06-29   146  
2d87061e70dea4 Nishanth Menon         2019-05-22   147  	gic500: interrupt-controller@1800000 {
2d87061e70dea4 Nishanth Menon         2019-05-22   148  		compatible = "arm,gic-v3";
2d87061e70dea4 Nishanth Menon         2019-05-22   149  		#address-cells = <2>;
2d87061e70dea4 Nishanth Menon         2019-05-22   150  		#size-cells = <2>;
2d87061e70dea4 Nishanth Menon         2019-05-22   151  		ranges;
2d87061e70dea4 Nishanth Menon         2019-05-22   152  		#interrupt-cells = <3>;
2d87061e70dea4 Nishanth Menon         2019-05-22   153  		interrupt-controller;
2d87061e70dea4 Nishanth Menon         2019-05-22   154  		reg = <0x00 0x01800000 0x00 0x10000>,	/* GICD */
a06ed27f3bc63a Nishanth Menon         2022-02-15   155  		      <0x00 0x01900000 0x00 0x100000>,	/* GICR */
a06ed27f3bc63a Nishanth Menon         2022-02-15   156  		      <0x00 0x6f000000 0x00 0x2000>,	/* GICC */
a06ed27f3bc63a Nishanth Menon         2022-02-15   157  		      <0x00 0x6f010000 0x00 0x1000>,	/* GICH */
a06ed27f3bc63a Nishanth Menon         2022-02-15   158  		      <0x00 0x6f020000 0x00 0x2000>;	/* GICV */
2d87061e70dea4 Nishanth Menon         2019-05-22   159  
2d87061e70dea4 Nishanth Menon         2019-05-22   160  		/* vcpumntirq: virtual CPU interface maintenance interrupt */
2d87061e70dea4 Nishanth Menon         2019-05-22   161  		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22   162  
6e6972f9b2e25c Grygorii Strashko      2020-06-26   163  		gic_its: msi-controller@1820000 {
2d87061e70dea4 Nishanth Menon         2019-05-22   164  			compatible = "arm,gic-v3-its";
2d87061e70dea4 Nishanth Menon         2019-05-22   165  			reg = <0x00 0x01820000 0x00 0x10000>;
2d87061e70dea4 Nishanth Menon         2019-05-22   166  			socionext,synquacer-pre-its = <0x1000000 0x400000>;
2d87061e70dea4 Nishanth Menon         2019-05-22   167  			msi-controller;
2d87061e70dea4 Nishanth Menon         2019-05-22   168  			#msi-cells = <1>;
2d87061e70dea4 Nishanth Menon         2019-05-22   169  		};
2d87061e70dea4 Nishanth Menon         2019-05-22   170  	};
2d87061e70dea4 Nishanth Menon         2019-05-22   171  
cab12badfc99f9 Nishanth Menon         2021-05-11   172  	main_gpio_intr: interrupt-controller@a00000 {
073086fc68d7f6 Lokesh Vutla           2019-06-14   173  		compatible = "ti,sci-intr";
cab12badfc99f9 Nishanth Menon         2021-05-11   174  		reg = <0x00 0x00a00000 0x00 0x800>;
073086fc68d7f6 Lokesh Vutla           2019-06-14   175  		ti,intr-trigger-type = <1>;
073086fc68d7f6 Lokesh Vutla           2019-06-14   176  		interrupt-controller;
073086fc68d7f6 Lokesh Vutla           2019-06-14   177  		interrupt-parent = <&gic500>;
8d523f096da535 Lokesh Vutla           2020-08-06   178  		#interrupt-cells = <1>;
073086fc68d7f6 Lokesh Vutla           2019-06-14   179  		ti,sci = <&dmsc>;
8d523f096da535 Lokesh Vutla           2020-08-06   180  		ti,sci-dev-id = <131>;
8d523f096da535 Lokesh Vutla           2020-08-06   181  		ti,interrupt-ranges = <8 392 56>;
073086fc68d7f6 Lokesh Vutla           2019-06-14   182  	};
073086fc68d7f6 Lokesh Vutla           2019-06-14   183  
9ecdb6d6b11434 Nishanth Menon         2021-05-10   184  	main_navss: bus@30000000 {
18965c655c8024 Vignesh Raghavendra    2023-10-05   185  		compatible = "simple-bus";
1463a70dfc871a Suman Anna             2019-05-30   186  		#address-cells = <2>;
1463a70dfc871a Suman Anna             2019-05-30   187  		#size-cells = <2>;
9ecdb6d6b11434 Nishanth Menon         2021-05-10   188  		ranges = <0x00 0x30000000 0x00 0x30000000 0x00 0x0c400000>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   189  		dma-coherent;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   190  		dma-ranges;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   191  
6f73c1e599c422 Peter Ujfalusi         2020-01-23   192  		ti,sci-dev-id = <199>;
1463a70dfc871a Suman Anna             2019-05-30   193  
cab12badfc99f9 Nishanth Menon         2021-05-11   194  		main_navss_intr: interrupt-controller@310e0000 {
1463a70dfc871a Suman Anna             2019-05-30   195  			compatible = "ti,sci-intr";
cab12badfc99f9 Nishanth Menon         2021-05-11   196  			reg = <0x0 0x310e0000 0x0 0x4000>;
1463a70dfc871a Suman Anna             2019-05-30   197  			ti,intr-trigger-type = <4>;
1463a70dfc871a Suman Anna             2019-05-30   198  			interrupt-controller;
1463a70dfc871a Suman Anna             2019-05-30   199  			interrupt-parent = <&gic500>;
8d523f096da535 Lokesh Vutla           2020-08-06   200  			#interrupt-cells = <1>;
1463a70dfc871a Suman Anna             2019-05-30   201  			ti,sci = <&dmsc>;
8d523f096da535 Lokesh Vutla           2020-08-06   202  			ti,sci-dev-id = <213>;
8d523f096da535 Lokesh Vutla           2020-08-06   203  			ti,interrupt-ranges = <0 64 64>,
8d523f096da535 Lokesh Vutla           2020-08-06   204  					      <64 448 64>,
8d523f096da535 Lokesh Vutla           2020-08-06   205  					      <128 672 64>;
1463a70dfc871a Suman Anna             2019-05-30   206  		};
073086fc68d7f6 Lokesh Vutla           2019-06-14   207  
073086fc68d7f6 Lokesh Vutla           2019-06-14   208  		main_udmass_inta: interrupt-controller@33d00000 {
073086fc68d7f6 Lokesh Vutla           2019-06-14   209  			compatible = "ti,sci-inta";
073086fc68d7f6 Lokesh Vutla           2019-06-14   210  			reg = <0x0 0x33d00000 0x0 0x100000>;
073086fc68d7f6 Lokesh Vutla           2019-06-14   211  			interrupt-controller;
073086fc68d7f6 Lokesh Vutla           2019-06-14   212  			interrupt-parent = <&main_navss_intr>;
073086fc68d7f6 Lokesh Vutla           2019-06-14   213  			msi-controller;
15ffd94a904baf Sekhar Nori            2020-11-28   214  			#interrupt-cells = <0>;
073086fc68d7f6 Lokesh Vutla           2019-06-14   215  			ti,sci = <&dmsc>;
073086fc68d7f6 Lokesh Vutla           2019-06-14   216  			ti,sci-dev-id = <209>;
8d523f096da535 Lokesh Vutla           2020-08-06   217  			ti,interrupt-ranges = <0 0 256>;
073086fc68d7f6 Lokesh Vutla           2019-06-14   218  		};
7b472ced17b05e Suman Anna             2019-07-22   219  
515c034013542b Peter Ujfalusi         2020-01-23   220  		secure_proxy_main: mailbox@32c00000 {
515c034013542b Peter Ujfalusi         2020-01-23   221  			compatible = "ti,am654-secure-proxy";
515c034013542b Peter Ujfalusi         2020-01-23   222  			#mbox-cells = <1>;
515c034013542b Peter Ujfalusi         2020-01-23   223  			reg-names = "target_data", "rt", "scfg";
515c034013542b Peter Ujfalusi         2020-01-23   224  			reg = <0x00 0x32c00000 0x00 0x100000>,
515c034013542b Peter Ujfalusi         2020-01-23   225  			      <0x00 0x32400000 0x00 0x100000>,
515c034013542b Peter Ujfalusi         2020-01-23   226  			      <0x00 0x32800000 0x00 0x100000>;
515c034013542b Peter Ujfalusi         2020-01-23   227  			interrupt-names = "rx_011";
515c034013542b Peter Ujfalusi         2020-01-23   228  			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
515c034013542b Peter Ujfalusi         2020-01-23   229  		};
515c034013542b Peter Ujfalusi         2020-01-23   230  
d0c72c7759d463 Grygorii Strashko      2020-06-26   231  		smmu0: iommu@36600000 {
515c034013542b Peter Ujfalusi         2020-01-23   232  			compatible = "arm,smmu-v3";
515c034013542b Peter Ujfalusi         2020-01-23   233  			reg = <0x0 0x36600000 0x0 0x100000>;
515c034013542b Peter Ujfalusi         2020-01-23   234  			interrupt-parent = <&gic500>;
515c034013542b Peter Ujfalusi         2020-01-23   235  			interrupts = <GIC_SPI 772 IRQ_TYPE_EDGE_RISING>,
515c034013542b Peter Ujfalusi         2020-01-23   236  				     <GIC_SPI 768 IRQ_TYPE_EDGE_RISING>;
515c034013542b Peter Ujfalusi         2020-01-23   237  			interrupt-names = "eventq", "gerror";
515c034013542b Peter Ujfalusi         2020-01-23   238  			#iommu-cells = <1>;
515c034013542b Peter Ujfalusi         2020-01-23   239  		};
515c034013542b Peter Ujfalusi         2020-01-23   240  
7b472ced17b05e Suman Anna             2019-07-22   241  		hwspinlock: spinlock@30e00000 {
7b472ced17b05e Suman Anna             2019-07-22   242  			compatible = "ti,am654-hwspinlock";
7b472ced17b05e Suman Anna             2019-07-22   243  			reg = <0x00 0x30e00000 0x00 0x1000>;
7b472ced17b05e Suman Anna             2019-07-22   244  			#hwlock-cells = <1>;
7b472ced17b05e Suman Anna             2019-07-22   245  		};
56f185826db242 Suman Anna             2019-07-24   246  
56f185826db242 Suman Anna             2019-07-24   247  		mailbox0_cluster0: mailbox@31f80000 {
56f185826db242 Suman Anna             2019-07-24   248  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   249  			reg = <0x00 0x31f80000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   250  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   251  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   252  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   253  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   254  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   255  		};
56f185826db242 Suman Anna             2019-07-24   256  
56f185826db242 Suman Anna             2019-07-24   257  		mailbox0_cluster1: mailbox@31f81000 {
56f185826db242 Suman Anna             2019-07-24   258  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   259  			reg = <0x00 0x31f81000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   260  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   261  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   262  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   263  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   264  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   265  		};
56f185826db242 Suman Anna             2019-07-24   266  
56f185826db242 Suman Anna             2019-07-24   267  		mailbox0_cluster2: mailbox@31f82000 {
56f185826db242 Suman Anna             2019-07-24   268  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   269  			reg = <0x00 0x31f82000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   270  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   271  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   272  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   273  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   274  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   275  		};
56f185826db242 Suman Anna             2019-07-24   276  
56f185826db242 Suman Anna             2019-07-24   277  		mailbox0_cluster3: mailbox@31f83000 {
56f185826db242 Suman Anna             2019-07-24   278  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   279  			reg = <0x00 0x31f83000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   280  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   281  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   282  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   283  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   284  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   285  		};
56f185826db242 Suman Anna             2019-07-24   286  
56f185826db242 Suman Anna             2019-07-24   287  		mailbox0_cluster4: mailbox@31f84000 {
56f185826db242 Suman Anna             2019-07-24   288  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   289  			reg = <0x00 0x31f84000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   290  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   291  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   292  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   293  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   294  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   295  		};
56f185826db242 Suman Anna             2019-07-24   296  
56f185826db242 Suman Anna             2019-07-24   297  		mailbox0_cluster5: mailbox@31f85000 {
56f185826db242 Suman Anna             2019-07-24   298  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   299  			reg = <0x00 0x31f85000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   300  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   301  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   302  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   303  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   304  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   305  		};
56f185826db242 Suman Anna             2019-07-24   306  
56f185826db242 Suman Anna             2019-07-24   307  		mailbox0_cluster6: mailbox@31f86000 {
56f185826db242 Suman Anna             2019-07-24   308  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   309  			reg = <0x00 0x31f86000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   310  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   311  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   312  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   313  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   314  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   315  		};
56f185826db242 Suman Anna             2019-07-24   316  
56f185826db242 Suman Anna             2019-07-24   317  		mailbox0_cluster7: mailbox@31f87000 {
56f185826db242 Suman Anna             2019-07-24   318  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   319  			reg = <0x00 0x31f87000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   320  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   321  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   322  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   323  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   324  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   325  		};
56f185826db242 Suman Anna             2019-07-24   326  
56f185826db242 Suman Anna             2019-07-24   327  		mailbox0_cluster8: mailbox@31f88000 {
56f185826db242 Suman Anna             2019-07-24   328  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   329  			reg = <0x00 0x31f88000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   330  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   331  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   332  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   333  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   334  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   335  		};
56f185826db242 Suman Anna             2019-07-24   336  
56f185826db242 Suman Anna             2019-07-24   337  		mailbox0_cluster9: mailbox@31f89000 {
56f185826db242 Suman Anna             2019-07-24   338  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   339  			reg = <0x00 0x31f89000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   340  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   341  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   342  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   343  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   344  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   345  		};
56f185826db242 Suman Anna             2019-07-24   346  
56f185826db242 Suman Anna             2019-07-24   347  		mailbox0_cluster10: mailbox@31f8a000 {
56f185826db242 Suman Anna             2019-07-24   348  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   349  			reg = <0x00 0x31f8a000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   350  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   351  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   352  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   353  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   354  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   355  		};
56f185826db242 Suman Anna             2019-07-24   356  
56f185826db242 Suman Anna             2019-07-24   357  		mailbox0_cluster11: mailbox@31f8b000 {
56f185826db242 Suman Anna             2019-07-24   358  			compatible = "ti,am654-mailbox";
56f185826db242 Suman Anna             2019-07-24   359  			reg = <0x00 0x31f8b000 0x00 0x200>;
56f185826db242 Suman Anna             2019-07-24   360  			#mbox-cells = <1>;
56f185826db242 Suman Anna             2019-07-24   361  			ti,mbox-num-users = <4>;
56f185826db242 Suman Anna             2019-07-24   362  			ti,mbox-num-fifos = <16>;
56f185826db242 Suman Anna             2019-07-24   363  			interrupt-parent = <&main_navss_intr>;
7e48b665100ee8 Andrew Davis           2022-10-20   364  			status = "disabled";
56f185826db242 Suman Anna             2019-07-24   365  		};
6f73c1e599c422 Peter Ujfalusi         2020-01-23   366  
6f73c1e599c422 Peter Ujfalusi         2020-01-23   367  		main_ringacc: ringacc@3c000000 {
6f73c1e599c422 Peter Ujfalusi         2020-01-23   368  			compatible = "ti,am654-navss-ringacc";
6f73c1e599c422 Peter Ujfalusi         2020-01-23   369  			reg = <0x0 0x3c000000 0x0 0x400000>,
6f73c1e599c422 Peter Ujfalusi         2020-01-23   370  			      <0x0 0x38000000 0x0 0x400000>,
6f73c1e599c422 Peter Ujfalusi         2020-01-23   371  			      <0x0 0x31120000 0x0 0x100>,
702110c2be999c Vignesh Raghavendra    2023-08-09   372  			      <0x0 0x33000000 0x0 0x40000>,
702110c2be999c Vignesh Raghavendra    2023-08-09   373  			      <0x0 0x31080000 0x0 0x40000>;
702110c2be999c Vignesh Raghavendra    2023-08-09   374  			reg-names = "rt", "fifos", "proxy_gcfg", "proxy_target", "cfg";
6f73c1e599c422 Peter Ujfalusi         2020-01-23   375  			ti,num-rings = <1024>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   376  			ti,sci-rm-range-gp-rings = <0x1>; /* GP ring range */
6f73c1e599c422 Peter Ujfalusi         2020-01-23   377  			ti,sci = <&dmsc>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   378  			ti,sci-dev-id = <211>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   379  			msi-parent = <&main_udmass_inta>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   380  		};
6f73c1e599c422 Peter Ujfalusi         2020-01-23   381  
6f73c1e599c422 Peter Ujfalusi         2020-01-23   382  		main_udmap: dma-controller@31150000 {
6f73c1e599c422 Peter Ujfalusi         2020-01-23   383  			compatible = "ti,j721e-navss-main-udmap";
6f73c1e599c422 Peter Ujfalusi         2020-01-23   384  			reg = <0x0 0x31150000 0x0 0x100>,
6f73c1e599c422 Peter Ujfalusi         2020-01-23   385  			      <0x0 0x34000000 0x0 0x100000>,
22a8434daa92a0 Manorit Chawdhry       2023-12-13   386  			      <0x0 0x35000000 0x0 0x100000>,
22a8434daa92a0 Manorit Chawdhry       2023-12-13   387  			      <0x0 0x30b00000 0x0 0x20000>,
22a8434daa92a0 Manorit Chawdhry       2023-12-13   388  			      <0x0 0x30c00000 0x0 0x10000>,
22a8434daa92a0 Manorit Chawdhry       2023-12-13   389  			      <0x0 0x30d00000 0x0 0x8000>;
22a8434daa92a0 Manorit Chawdhry       2023-12-13   390  			reg-names = "gcfg", "rchanrt", "tchanrt",
22a8434daa92a0 Manorit Chawdhry       2023-12-13   391  				    "tchan", "rchan", "rflow";
6f73c1e599c422 Peter Ujfalusi         2020-01-23   392  			msi-parent = <&main_udmass_inta>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   393  			#dma-cells = <1>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   394  
6f73c1e599c422 Peter Ujfalusi         2020-01-23   395  			ti,sci = <&dmsc>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   396  			ti,sci-dev-id = <212>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   397  			ti,ringacc = <&main_ringacc>;
6f73c1e599c422 Peter Ujfalusi         2020-01-23   398  
6f73c1e599c422 Peter Ujfalusi         2020-01-23   399  			ti,sci-rm-range-tchan = <0x0d>, /* TX_CHAN */
6f73c1e599c422 Peter Ujfalusi         2020-01-23   400  						<0x0f>, /* TX_HCHAN */
6f73c1e599c422 Peter Ujfalusi         2020-01-23   401  						<0x10>; /* TX_UHCHAN */
6f73c1e599c422 Peter Ujfalusi         2020-01-23   402  			ti,sci-rm-range-rchan = <0x0a>, /* RX_CHAN */
6f73c1e599c422 Peter Ujfalusi         2020-01-23   403  						<0x0b>, /* RX_HCHAN */
6f73c1e599c422 Peter Ujfalusi         2020-01-23   404  						<0x0c>; /* RX_UHCHAN */
6f73c1e599c422 Peter Ujfalusi         2020-01-23   405  			ti,sci-rm-range-rflow = <0x00>; /* GP RFLOW */
6f73c1e599c422 Peter Ujfalusi         2020-01-23   406  		};
461d6d058cff60 Grygorii Strashko      2020-05-01   407  
461d6d058cff60 Grygorii Strashko      2020-05-01   408  		cpts@310d0000 {
461d6d058cff60 Grygorii Strashko      2020-05-01   409  			compatible = "ti,j721e-cpts";
461d6d058cff60 Grygorii Strashko      2020-05-01   410  			reg = <0x0 0x310d0000 0x0 0x400>;
461d6d058cff60 Grygorii Strashko      2020-05-01   411  			reg-names = "cpts";
461d6d058cff60 Grygorii Strashko      2020-05-01   412  			clocks = <&k3_clks 201 1>;
461d6d058cff60 Grygorii Strashko      2020-05-01   413  			clock-names = "cpts";
8d523f096da535 Lokesh Vutla           2020-08-06   414  			interrupts-extended = <&main_navss_intr 391>;
461d6d058cff60 Grygorii Strashko      2020-05-01   415  			interrupt-names = "cpts";
461d6d058cff60 Grygorii Strashko      2020-05-01   416  			ti,cpts-periodic-outputs = <6>;
461d6d058cff60 Grygorii Strashko      2020-05-01   417  			ti,cpts-ext-ts-inputs = <8>;
461d6d058cff60 Grygorii Strashko      2020-05-01   418  		};
1463a70dfc871a Suman Anna             2019-05-30   419  	};
1463a70dfc871a Suman Anna             2019-05-30   420  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   421  	cpsw0: ethernet@c000000 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   422  		compatible = "ti,j721e-cpswxg-nuss";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   423  		#address-cells = <2>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   424  		#size-cells = <2>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   425  		reg = <0x0 0xc000000 0x0 0x200000>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   426  		reg-names = "cpsw_nuss";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   427  		ranges = <0x0 0x0 0x0 0x0c000000 0x0 0x200000>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   428  		clocks = <&k3_clks 19 89>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   429  		clock-names = "fck";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   430  		power-domains = <&k3_pds 19 TI_SCI_PD_EXCLUSIVE>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   431  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   432  		dmas = <&main_udmap 0xca00>,
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   433  		       <&main_udmap 0xca01>,
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   434  		       <&main_udmap 0xca02>,
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   435  		       <&main_udmap 0xca03>,
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   436  		       <&main_udmap 0xca04>,
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   437  		       <&main_udmap 0xca05>,
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   438  		       <&main_udmap 0xca06>,
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   439  		       <&main_udmap 0xca07>,
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   440  		       <&main_udmap 0x4a00>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   441  		dma-names = "tx0", "tx1", "tx2", "tx3",
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   442  			    "tx4", "tx5", "tx6", "tx7",
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   443  			    "rx";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   444  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   445  		status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   446  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   447  		ethernet-ports {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   448  			#address-cells = <1>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   449  			#size-cells = <0>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   450  			cpsw0_port1: port@1 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   451  				reg = <1>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   452  				ti,mac-only;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   453  				label = "port1";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   454  				status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   455  			};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   456  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   457  			cpsw0_port2: port@2 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   458  				reg = <2>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   459  				ti,mac-only;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   460  				label = "port2";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   461  				status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   462  			};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   463  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   464  			cpsw0_port3: port@3 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   465  				reg = <3>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   466  				ti,mac-only;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   467  				label = "port3";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   468  				status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   469  			};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   470  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   471  			cpsw0_port4: port@4 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   472  				reg = <4>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   473  				ti,mac-only;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   474  				label = "port4";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   475  				status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   476  			};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   477  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   478  			cpsw0_port5: port@5 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   479  				reg = <5>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   480  				ti,mac-only;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   481  				label = "port5";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   482  				status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   483  			};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   484  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   485  			cpsw0_port6: port@6 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   486  				reg = <6>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   487  				ti,mac-only;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   488  				label = "port6";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   489  				status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   490  			};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   491  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   492  			cpsw0_port7: port@7 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   493  				reg = <7>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   494  				ti,mac-only;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   495  				label = "port7";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   496  				status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   497  			};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   498  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   499  			cpsw0_port8: port@8 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   500  				reg = <8>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   501  				ti,mac-only;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   502  				label = "port8";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   503  				status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   504  			};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   505  		};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   506  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   507  		cpsw9g_mdio: mdio@f00 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   508  			compatible = "ti,cpsw-mdio","ti,davinci_mdio";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   509  			reg = <0x0 0xf00 0x0 0x100>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   510  			#address-cells = <1>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   511  			#size-cells = <0>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   512  			clocks = <&k3_clks 19 89>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   513  			clock-names = "fck";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   514  			bus_freq = <1000000>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   515  			status = "disabled";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   516  		};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   517  
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   518  		cpts@3d000 {
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   519  			compatible = "ti,j721e-cpts";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   520  			reg = <0x0 0x3d000 0x0 0x400>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   521  			clocks = <&k3_clks 19 16>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   522  			clock-names = "cpts";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   523  			interrupts-extended = <&gic500 GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   524  			interrupt-names = "cpts";
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   525  			ti,cpts-ext-ts-inputs = <4>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   526  			ti,cpts-periodic-outputs = <2>;
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   527  		};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   528  	};
a2ff7f1108f6ee Siddharth Vadapalli    2023-03-15   529  
8ebcaaae801746 Keerthy                2020-08-26   530  	main_crypto: crypto@4e00000 {
8ebcaaae801746 Keerthy                2020-08-26   531  		compatible = "ti,j721e-sa2ul";
8ebcaaae801746 Keerthy                2020-08-26   532  		reg = <0x0 0x4e00000 0x0 0x1200>;
8ebcaaae801746 Keerthy                2020-08-26   533  		power-domains = <&k3_pds 264 TI_SCI_PD_EXCLUSIVE>;
8ebcaaae801746 Keerthy                2020-08-26   534  		#address-cells = <2>;
8ebcaaae801746 Keerthy                2020-08-26   535  		#size-cells = <2>;
8ebcaaae801746 Keerthy                2020-08-26   536  		ranges = <0x0 0x04e00000 0x00 0x04e00000 0x0 0x30000>;
8ebcaaae801746 Keerthy                2020-08-26   537  
8ebcaaae801746 Keerthy                2020-08-26   538  		dmas = <&main_udmap 0xc000>, <&main_udmap 0x4000>,
8ebcaaae801746 Keerthy                2020-08-26   539  				<&main_udmap 0x4001>;
8ebcaaae801746 Keerthy                2020-08-26   540  		dma-names = "tx", "rx1", "rx2";
8ebcaaae801746 Keerthy                2020-08-26   541  
8ebcaaae801746 Keerthy                2020-08-26   542  		rng: rng@4e10000 {
8ebcaaae801746 Keerthy                2020-08-26   543  			compatible = "inside-secure,safexcel-eip76";
8ebcaaae801746 Keerthy                2020-08-26   544  			reg = <0x0 0x4e10000 0x0 0x7d>;
8ebcaaae801746 Keerthy                2020-08-26   545  			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
8ebcaaae801746 Keerthy                2020-08-26   546  		};
8ebcaaae801746 Keerthy                2020-08-26   547  	};
8ebcaaae801746 Keerthy                2020-08-26   548  
dcccf77067e427 Nishanth Menon         2020-09-03   549  	main_pmx0: pinctrl@11c000 {
2d87061e70dea4 Nishanth Menon         2019-05-22   550  		compatible = "pinctrl-single";
2d87061e70dea4 Nishanth Menon         2019-05-22   551  		/* Proxy 0 addressing */
2d87061e70dea4 Nishanth Menon         2019-05-22   552  		reg = <0x0 0x11c000 0x0 0x2b4>;
2d87061e70dea4 Nishanth Menon         2019-05-22   553  		#pinctrl-cells = <1>;
2d87061e70dea4 Nishanth Menon         2019-05-22   554  		pinctrl-single,register-width = <32>;
2d87061e70dea4 Nishanth Menon         2019-05-22   555  		pinctrl-single,function-mask = <0xffffffff>;
2d87061e70dea4 Nishanth Menon         2019-05-22   556  	};
2d87061e70dea4 Nishanth Menon         2019-05-22   557  
72a44d1c473486 Nishanth Menon         2023-05-31   558  	/* TIMERIO pad input CTRLMMR_TIMER*_CTRL registers */
72a44d1c473486 Nishanth Menon         2023-05-31   559  	main_timerio_input: pinctrl@104200 {
72a44d1c473486 Nishanth Menon         2023-05-31   560  		compatible = "pinctrl-single";
72a44d1c473486 Nishanth Menon         2023-05-31   561  		reg = <0x00 0x104200 0x00 0x50>;
72a44d1c473486 Nishanth Menon         2023-05-31   562  		#pinctrl-cells = <1>;
72a44d1c473486 Nishanth Menon         2023-05-31   563  		pinctrl-single,register-width = <32>;
72a44d1c473486 Nishanth Menon         2023-05-31   564  		pinctrl-single,function-mask = <0x00000007>;
72a44d1c473486 Nishanth Menon         2023-05-31   565  	};
72a44d1c473486 Nishanth Menon         2023-05-31   566  
72a44d1c473486 Nishanth Menon         2023-05-31   567  	/* TIMERIO pad output CTCTRLMMR_TIMERIO*_CTRL registers */
72a44d1c473486 Nishanth Menon         2023-05-31   568  	main_timerio_output: pinctrl@104280 {
72a44d1c473486 Nishanth Menon         2023-05-31   569  		compatible = "pinctrl-single";
72a44d1c473486 Nishanth Menon         2023-05-31   570  		reg = <0x00 0x104280 0x00 0x20>;
72a44d1c473486 Nishanth Menon         2023-05-31   571  		#pinctrl-cells = <1>;
72a44d1c473486 Nishanth Menon         2023-05-31   572  		pinctrl-single,register-width = <32>;
72a44d1c473486 Nishanth Menon         2023-05-31   573  		pinctrl-single,function-mask = <0x0000001f>;
72a44d1c473486 Nishanth Menon         2023-05-31   574  	};
72a44d1c473486 Nishanth Menon         2023-05-31   575  
4fc18f67fb223f Vaishnav Achath        2024-02-15   576  	ti_csi2rx0: ticsi2rx@4500000 {
4fc18f67fb223f Vaishnav Achath        2024-02-15   577  		compatible = "ti,j721e-csi2rx-shim";
4fc18f67fb223f Vaishnav Achath        2024-02-15   578  		reg = <0x0 0x4500000 0x0 0x1000>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   579  		ranges;
4fc18f67fb223f Vaishnav Achath        2024-02-15   580  		#address-cells = <2>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   581  		#size-cells = <2>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   582  		dmas = <&main_udmap 0x4940>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   583  		dma-names = "rx0";
4fc18f67fb223f Vaishnav Achath        2024-02-15   584  		power-domains = <&k3_pds 26 TI_SCI_PD_EXCLUSIVE>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   585  		status = "disabled";
4fc18f67fb223f Vaishnav Achath        2024-02-15   586  
4fc18f67fb223f Vaishnav Achath        2024-02-15   587  		cdns_csi2rx0: csi-bridge@4504000 {
4fc18f67fb223f Vaishnav Achath        2024-02-15   588  			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
4fc18f67fb223f Vaishnav Achath        2024-02-15   589  			reg = <0x0 0x4504000 0x0 0x1000>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   590  			clocks = <&k3_clks 26 2>, <&k3_clks 26 0>, <&k3_clks 26 2>,
4fc18f67fb223f Vaishnav Achath        2024-02-15   591  				<&k3_clks 26 2>, <&k3_clks 26 3>, <&k3_clks 26 3>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   592  			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
4fc18f67fb223f Vaishnav Achath        2024-02-15   593  				"pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
4fc18f67fb223f Vaishnav Achath        2024-02-15   594  			phys = <&dphy0>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   595  			phy-names = "dphy";
4fc18f67fb223f Vaishnav Achath        2024-02-15   596  
4fc18f67fb223f Vaishnav Achath        2024-02-15   597  			ports {
4fc18f67fb223f Vaishnav Achath        2024-02-15   598  				#address-cells = <1>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   599  				#size-cells = <0>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   600  
4fc18f67fb223f Vaishnav Achath        2024-02-15   601  				csi0_port0: port@0 {
4fc18f67fb223f Vaishnav Achath        2024-02-15   602  					reg = <0>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   603  					status = "disabled";
4fc18f67fb223f Vaishnav Achath        2024-02-15   604  				};
4fc18f67fb223f Vaishnav Achath        2024-02-15   605  
4fc18f67fb223f Vaishnav Achath        2024-02-15   606  				csi0_port1: port@1 {
4fc18f67fb223f Vaishnav Achath        2024-02-15   607  					reg = <1>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   608  					status = "disabled";
4fc18f67fb223f Vaishnav Achath        2024-02-15   609  				};
4fc18f67fb223f Vaishnav Achath        2024-02-15   610  
4fc18f67fb223f Vaishnav Achath        2024-02-15   611  				csi0_port2: port@2 {
4fc18f67fb223f Vaishnav Achath        2024-02-15   612  					reg = <2>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   613  					status = "disabled";
4fc18f67fb223f Vaishnav Achath        2024-02-15   614  				};
4fc18f67fb223f Vaishnav Achath        2024-02-15   615  
4fc18f67fb223f Vaishnav Achath        2024-02-15   616  				csi0_port3: port@3 {
4fc18f67fb223f Vaishnav Achath        2024-02-15   617  					reg = <3>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   618  					status = "disabled";
4fc18f67fb223f Vaishnav Achath        2024-02-15   619  				};
4fc18f67fb223f Vaishnav Achath        2024-02-15   620  
4fc18f67fb223f Vaishnav Achath        2024-02-15   621  				csi0_port4: port@4 {
4fc18f67fb223f Vaishnav Achath        2024-02-15   622  					reg = <4>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   623  					status = "disabled";
4fc18f67fb223f Vaishnav Achath        2024-02-15   624  				};
4fc18f67fb223f Vaishnav Achath        2024-02-15   625  			};
4fc18f67fb223f Vaishnav Achath        2024-02-15   626  		};
4fc18f67fb223f Vaishnav Achath        2024-02-15   627  	};
4fc18f67fb223f Vaishnav Achath        2024-02-15   628  
4fc18f67fb223f Vaishnav Achath        2024-02-15   629  	ti_csi2rx1: ticsi2rx@4510000 {
4fc18f67fb223f Vaishnav Achath        2024-02-15   630  		compatible = "ti,j721e-csi2rx-shim";
4fc18f67fb223f Vaishnav Achath        2024-02-15   631  		reg = <0x0 0x4510000 0x0 0x1000>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   632  		ranges;
4fc18f67fb223f Vaishnav Achath        2024-02-15   633  		#address-cells = <2>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   634  		#size-cells = <2>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   635  		dmas = <&main_udmap 0x4960>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   636  		dma-names = "rx0";
4fc18f67fb223f Vaishnav Achath        2024-02-15   637  		power-domains = <&k3_pds 27 TI_SCI_PD_EXCLUSIVE>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   638  		status = "disabled";
4fc18f67fb223f Vaishnav Achath        2024-02-15   639  
4fc18f67fb223f Vaishnav Achath        2024-02-15   640  		cdns_csi2rx1: csi-bridge@4514000 {
4fc18f67fb223f Vaishnav Achath        2024-02-15   641  			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
4fc18f67fb223f Vaishnav Achath        2024-02-15   642  			reg = <0x0 0x4514000 0x0 0x1000>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   643  			clocks = <&k3_clks 27 2>, <&k3_clks 27 0>, <&k3_clks 27 2>,
4fc18f67fb223f Vaishnav Achath        2024-02-15   644  				 <&k3_clks 27 2>, <&k3_clks 27 3>, <&k3_clks 27 3>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   645  			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
4fc18f67fb223f Vaishnav Achath        2024-02-15   646  				      "pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
4fc18f67fb223f Vaishnav Achath        2024-02-15   647  			phys = <&dphy1>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   648  			phy-names = "dphy";
4fc18f67fb223f Vaishnav Achath        2024-02-15   649  
4fc18f67fb223f Vaishnav Achath        2024-02-15   650  			ports {
4fc18f67fb223f Vaishnav Achath        2024-02-15   651  				#address-cells = <1>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   652  				#size-cells = <0>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   653  
4fc18f67fb223f Vaishnav Achath        2024-02-15   654  				csi1_port0: port@0 {
4fc18f67fb223f Vaishnav Achath        2024-02-15   655  					reg = <0>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   656  					status = "disabled";
4fc18f67fb223f Vaishnav Achath        2024-02-15   657  				};
4fc18f67fb223f Vaishnav Achath        2024-02-15   658  
4fc18f67fb223f Vaishnav Achath        2024-02-15   659  				csi1_port1: port@1 {
4fc18f67fb223f Vaishnav Achath        2024-02-15   660  					reg = <1>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   661  					status = "disabled";
4fc18f67fb223f Vaishnav Achath        2024-02-15   662  				};
4fc18f67fb223f Vaishnav Achath        2024-02-15   663  
4fc18f67fb223f Vaishnav Achath        2024-02-15   664  				csi1_port2: port@2 {
4fc18f67fb223f Vaishnav Achath        2024-02-15   665  					reg = <2>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   666  					status = "disabled";
4fc18f67fb223f Vaishnav Achath        2024-02-15   667  				};
4fc18f67fb223f Vaishnav Achath        2024-02-15   668  
4fc18f67fb223f Vaishnav Achath        2024-02-15   669  				csi1_port3: port@3 {
4fc18f67fb223f Vaishnav Achath        2024-02-15   670  					reg = <3>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   671  					status = "disabled";
4fc18f67fb223f Vaishnav Achath        2024-02-15   672  				};
4fc18f67fb223f Vaishnav Achath        2024-02-15   673  
4fc18f67fb223f Vaishnav Achath        2024-02-15   674  				csi1_port4: port@4 {
4fc18f67fb223f Vaishnav Achath        2024-02-15   675  					reg = <4>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   676  					status = "disabled";
4fc18f67fb223f Vaishnav Achath        2024-02-15   677  				};
4fc18f67fb223f Vaishnav Achath        2024-02-15   678  			};
4fc18f67fb223f Vaishnav Achath        2024-02-15   679  		};
4fc18f67fb223f Vaishnav Achath        2024-02-15   680  	};
4fc18f67fb223f Vaishnav Achath        2024-02-15   681  
4fc18f67fb223f Vaishnav Achath        2024-02-15   682  	dphy0: phy@4580000 {
4fc18f67fb223f Vaishnav Achath        2024-02-15   683  		compatible = "cdns,dphy-rx";
4fc18f67fb223f Vaishnav Achath        2024-02-15   684  		reg = <0x0 0x4580000 0x0 0x1100>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   685  		#phy-cells = <0>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   686  		power-domains = <&k3_pds 147 TI_SCI_PD_EXCLUSIVE>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   687  		status = "disabled";
4fc18f67fb223f Vaishnav Achath        2024-02-15   688  	};
4fc18f67fb223f Vaishnav Achath        2024-02-15   689  
4fc18f67fb223f Vaishnav Achath        2024-02-15   690  	dphy1: phy@4590000 {
4fc18f67fb223f Vaishnav Achath        2024-02-15   691  		compatible = "cdns,dphy-rx";
4fc18f67fb223f Vaishnav Achath        2024-02-15   692  		reg = <0x0 0x4590000 0x0 0x1100>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   693  		#phy-cells = <0>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   694  		power-domains = <&k3_pds 148 TI_SCI_PD_EXCLUSIVE>;
4fc18f67fb223f Vaishnav Achath        2024-02-15   695  		status = "disabled";
4fc18f67fb223f Vaishnav Achath        2024-02-15   696  	};
4fc18f67fb223f Vaishnav Achath        2024-02-15   697  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   698  	serdes_wiz0: wiz@5000000 {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   699  		compatible = "ti,j721e-wiz-16g";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   700  		#address-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   701  		#size-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   702  		power-domains = <&k3_pds 292 TI_SCI_PD_EXCLUSIVE>;
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   703  		clocks = <&k3_clks 292 5>, <&k3_clks 292 11>, <&cmn_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   704  		clock-names = "fck", "core_ref_clk", "ext_ref_clk";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   705  		assigned-clocks = <&k3_clks 292 11>, <&k3_clks 292 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   706  		assigned-clock-parents = <&k3_clks 292 15>, <&k3_clks 292 4>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   707  		num-lanes = <2>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   708  		#reset-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   709  		ranges = <0x5000000 0x0 0x5000000 0x10000>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   710  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   711  		wiz0_pll0_refclk: pll0-refclk {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   712  			clocks = <&k3_clks 292 11>, <&cmn_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   713  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   714  			assigned-clocks = <&wiz0_pll0_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   715  			assigned-clock-parents = <&k3_clks 292 11>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   716  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   717  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   718  		wiz0_pll1_refclk: pll1-refclk {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   719  			clocks = <&k3_clks 292 0>, <&cmn_refclk1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   720  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   721  			assigned-clocks = <&wiz0_pll1_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   722  			assigned-clock-parents = <&k3_clks 292 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   723  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   724  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   725  		wiz0_refclk_dig: refclk-dig {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   726  			clocks = <&k3_clks 292 11>, <&k3_clks 292 0>, <&cmn_refclk>, <&cmn_refclk1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   727  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   728  			assigned-clocks = <&wiz0_refclk_dig>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   729  			assigned-clock-parents = <&k3_clks 292 11>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   730  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   731  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   732  		wiz0_cmn_refclk_dig_div: cmn-refclk-dig-div {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   733  			clocks = <&wiz0_refclk_dig>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   734  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   735  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   736  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   737  		wiz0_cmn_refclk1_dig_div: cmn-refclk1-dig-div {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   738  			clocks = <&wiz0_pll1_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   739  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   740  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   741  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   742  		serdes0: serdes@5000000 {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   743  			compatible = "ti,sierra-phy-t0";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   744  			reg-names = "serdes";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   745  			reg = <0x5000000 0x10000>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   746  			#address-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   747  			#size-cells = <0>;
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   748  			#clock-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   749  			resets = <&serdes_wiz0 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   750  			reset-names = "sierra_reset";
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   751  			clocks = <&wiz0_cmn_refclk_dig_div>, <&wiz0_cmn_refclk1_dig_div>,
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   752  				 <&wiz0_pll0_refclk>, <&wiz0_pll1_refclk>;
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   753  			clock-names = "cmn_refclk_dig_div", "cmn_refclk1_dig_div",
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   754  				      "pll0_refclk", "pll1_refclk";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   755  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   756  	};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   757  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   758  	serdes_wiz1: wiz@5010000 {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   759  		compatible = "ti,j721e-wiz-16g";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   760  		#address-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   761  		#size-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   762  		power-domains = <&k3_pds 293 TI_SCI_PD_EXCLUSIVE>;
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   763  		clocks = <&k3_clks 293 5>, <&k3_clks 293 13>, <&cmn_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   764  		clock-names = "fck", "core_ref_clk", "ext_ref_clk";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   765  		assigned-clocks = <&k3_clks 293 13>, <&k3_clks 293 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   766  		assigned-clock-parents = <&k3_clks 293 17>, <&k3_clks 293 4>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   767  		num-lanes = <2>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   768  		#reset-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   769  		ranges = <0x5010000 0x0 0x5010000 0x10000>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   770  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   771  		wiz1_pll0_refclk: pll0-refclk {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   772  			clocks = <&k3_clks 293 13>, <&cmn_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   773  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   774  			assigned-clocks = <&wiz1_pll0_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   775  			assigned-clock-parents = <&k3_clks 293 13>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   776  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   777  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   778  		wiz1_pll1_refclk: pll1-refclk {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   779  			clocks = <&k3_clks 293 0>, <&cmn_refclk1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   780  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   781  			assigned-clocks = <&wiz1_pll1_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   782  			assigned-clock-parents = <&k3_clks 293 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   783  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   784  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   785  		wiz1_refclk_dig: refclk-dig {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   786  			clocks = <&k3_clks 293 13>, <&k3_clks 293 0>, <&cmn_refclk>, <&cmn_refclk1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   787  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   788  			assigned-clocks = <&wiz1_refclk_dig>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   789  			assigned-clock-parents = <&k3_clks 293 13>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   790  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   791  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   792  		wiz1_cmn_refclk_dig_div: cmn-refclk-dig-div {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   793  			clocks = <&wiz1_refclk_dig>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   794  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   795  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   796  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   797  		wiz1_cmn_refclk1_dig_div: cmn-refclk1-dig-div {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   798  			clocks = <&wiz1_pll1_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   799  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   800  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   801  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   802  		serdes1: serdes@5010000 {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   803  			compatible = "ti,sierra-phy-t0";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   804  			reg-names = "serdes";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   805  			reg = <0x5010000 0x10000>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   806  			#address-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   807  			#size-cells = <0>;
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   808  			#clock-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   809  			resets = <&serdes_wiz1 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   810  			reset-names = "sierra_reset";
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   811  			clocks = <&wiz1_cmn_refclk_dig_div>, <&wiz1_cmn_refclk1_dig_div>,
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   812  				 <&wiz1_pll0_refclk>, <&wiz1_pll1_refclk>;
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   813  			clock-names = "cmn_refclk_dig_div", "cmn_refclk1_dig_div",
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   814  				      "pll0_refclk", "pll1_refclk";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   815  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   816  	};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   817  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   818  	serdes_wiz2: wiz@5020000 {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   819  		compatible = "ti,j721e-wiz-16g";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   820  		#address-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   821  		#size-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   822  		power-domains = <&k3_pds 294 TI_SCI_PD_EXCLUSIVE>;
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   823  		clocks = <&k3_clks 294 5>, <&k3_clks 294 11>, <&cmn_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   824  		clock-names = "fck", "core_ref_clk", "ext_ref_clk";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   825  		assigned-clocks = <&k3_clks 294 11>, <&k3_clks 294 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   826  		assigned-clock-parents = <&k3_clks 294 15>, <&k3_clks 294 4>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   827  		num-lanes = <2>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   828  		#reset-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   829  		ranges = <0x5020000 0x0 0x5020000 0x10000>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   830  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   831  		wiz2_pll0_refclk: pll0-refclk {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   832  			clocks = <&k3_clks 294 11>, <&cmn_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   833  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   834  			assigned-clocks = <&wiz2_pll0_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   835  			assigned-clock-parents = <&k3_clks 294 11>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   836  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   837  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   838  		wiz2_pll1_refclk: pll1-refclk {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   839  			clocks = <&k3_clks 294 0>, <&cmn_refclk1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   840  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   841  			assigned-clocks = <&wiz2_pll1_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   842  			assigned-clock-parents = <&k3_clks 294 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   843  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   844  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   845  		wiz2_refclk_dig: refclk-dig {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   846  			clocks = <&k3_clks 294 11>, <&k3_clks 294 0>, <&cmn_refclk>, <&cmn_refclk1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   847  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   848  			assigned-clocks = <&wiz2_refclk_dig>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   849  			assigned-clock-parents = <&k3_clks 294 11>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   850  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   851  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   852  		wiz2_cmn_refclk_dig_div: cmn-refclk-dig-div {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   853  			clocks = <&wiz2_refclk_dig>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   854  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   855  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   856  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   857  		wiz2_cmn_refclk1_dig_div: cmn-refclk1-dig-div {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   858  			clocks = <&wiz2_pll1_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   859  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   860  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   861  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   862  		serdes2: serdes@5020000 {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   863  			compatible = "ti,sierra-phy-t0";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   864  			reg-names = "serdes";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   865  			reg = <0x5020000 0x10000>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   866  			#address-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   867  			#size-cells = <0>;
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   868  			#clock-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   869  			resets = <&serdes_wiz2 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   870  			reset-names = "sierra_reset";
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   871  			clocks = <&wiz2_cmn_refclk_dig_div>, <&wiz2_cmn_refclk1_dig_div>,
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   872  				 <&wiz2_pll0_refclk>, <&wiz2_pll1_refclk>;
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   873  			clock-names = "cmn_refclk_dig_div", "cmn_refclk1_dig_div",
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   874  				      "pll0_refclk", "pll1_refclk";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   875  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   876  	};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   877  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   878  	serdes_wiz3: wiz@5030000 {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   879  		compatible = "ti,j721e-wiz-16g";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   880  		#address-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   881  		#size-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   882  		power-domains = <&k3_pds 295 TI_SCI_PD_EXCLUSIVE>;
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   883  		clocks = <&k3_clks 295 5>, <&k3_clks 295 9>, <&cmn_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   884  		clock-names = "fck", "core_ref_clk", "ext_ref_clk";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   885  		assigned-clocks = <&k3_clks 295 9>, <&k3_clks 295 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   886  		assigned-clock-parents = <&k3_clks 295 13>, <&k3_clks 295 4>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   887  		num-lanes = <2>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   888  		#reset-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   889  		ranges = <0x5030000 0x0 0x5030000 0x10000>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   890  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   891  		wiz3_pll0_refclk: pll0-refclk {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   892  			clocks = <&k3_clks 295 9>, <&cmn_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   893  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   894  			assigned-clocks = <&wiz3_pll0_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   895  			assigned-clock-parents = <&k3_clks 295 9>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   896  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   897  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   898  		wiz3_pll1_refclk: pll1-refclk {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   899  			clocks = <&k3_clks 295 0>, <&cmn_refclk1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   900  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   901  			assigned-clocks = <&wiz3_pll1_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   902  			assigned-clock-parents = <&k3_clks 295 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   903  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   904  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   905  		wiz3_refclk_dig: refclk-dig {
5c6d0b55b46aeb Kishon Vijay Abraham I 2021-06-03   906  			clocks = <&k3_clks 295 9>, <&k3_clks 295 0>, <&cmn_refclk>, <&cmn_refclk1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   907  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   908  			assigned-clocks = <&wiz3_refclk_dig>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   909  			assigned-clock-parents = <&k3_clks 295 9>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   910  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   911  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   912  		wiz3_cmn_refclk_dig_div: cmn-refclk-dig-div {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   913  			clocks = <&wiz3_refclk_dig>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   914  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   915  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   916  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   917  		wiz3_cmn_refclk1_dig_div: cmn-refclk1-dig-div {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   918  			clocks = <&wiz3_pll1_refclk>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   919  			#clock-cells = <0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   920  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   921  
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   922  		serdes3: serdes@5030000 {
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   923  			compatible = "ti,sierra-phy-t0";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   924  			reg-names = "serdes";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   925  			reg = <0x5030000 0x10000>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   926  			#address-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   927  			#size-cells = <0>;
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   928  			#clock-cells = <1>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   929  			resets = <&serdes_wiz3 0>;
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   930  			reset-names = "sierra_reset";
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   931  			clocks = <&wiz3_cmn_refclk_dig_div>, <&wiz3_cmn_refclk1_dig_div>,
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   932  				 <&wiz3_pll0_refclk>, <&wiz3_pll1_refclk>;
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   933  			clock-names = "cmn_refclk_dig_div", "cmn_refclk1_dig_div",
2427bfb335eb5f Kishon Vijay Abraham I 2021-06-03   934  				      "pll0_refclk", "pll1_refclk";
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   935  		};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   936  	};
afd094ebe69f91 Kishon Vijay Abraham I 2020-06-29   937  
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   938  	pcie0_rc: pcie@2900000 {
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   939  		compatible = "ti,j721e-pcie-host";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   940  		reg = <0x00 0x02900000 0x00 0x1000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   941  		      <0x00 0x02907000 0x00 0x400>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   942  		      <0x00 0x0d000000 0x00 0x00800000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   943  		      <0x00 0x10000000 0x00 0x00001000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   944  		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   945  		interrupt-names = "link_state";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   946  		interrupts = <GIC_SPI 318 IRQ_TYPE_EDGE_RISING>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   947  		device_type = "pci";
edb96779f3bcbe Kishon Vijay Abraham I 2021-01-05   948  		ti,syscon-pcie-ctrl = <&scm_conf 0x4070>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   949  		max-link-speed = <3>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   950  		num-lanes = <2>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   951  		power-domains = <&k3_pds 239 TI_SCI_PD_EXCLUSIVE>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   952  		clocks = <&k3_clks 239 1>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   953  		clock-names = "fck";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   954  		#address-cells = <3>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   955  		#size-cells = <2>;
5f46633565b1c1 Kishon Vijay Abraham I 2021-09-15   956  		bus-range = <0x0 0xff>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   957  		vendor-id = <0x104c>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   958  		device-id = <0xb00d>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   959  		msi-map = <0x0 &gic_its 0x0 0x10000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   960  		dma-coherent;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   961  		ranges = <0x01000000 0x0 0x10001000 0x0 0x10001000 0x0 0x0010000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   962  			 <0x02000000 0x0 0x10011000 0x0 0x10011000 0x0 0x7fef000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   963  		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
731c6deda85ffc Andrew Davis           2023-05-15   964  		status = "disabled";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   965  	};
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   966  
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   967  	pcie1_rc: pcie@2910000 {
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   968  		compatible = "ti,j721e-pcie-host";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   969  		reg = <0x00 0x02910000 0x00 0x1000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   970  		      <0x00 0x02917000 0x00 0x400>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   971  		      <0x00 0x0d800000 0x00 0x00800000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   972  		      <0x00 0x18000000 0x00 0x00001000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   973  		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   974  		interrupt-names = "link_state";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   975  		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   976  		device_type = "pci";
edb96779f3bcbe Kishon Vijay Abraham I 2021-01-05   977  		ti,syscon-pcie-ctrl = <&scm_conf 0x4074>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   978  		max-link-speed = <3>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   979  		num-lanes = <2>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   980  		power-domains = <&k3_pds 240 TI_SCI_PD_EXCLUSIVE>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   981  		clocks = <&k3_clks 240 1>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   982  		clock-names = "fck";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   983  		#address-cells = <3>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   984  		#size-cells = <2>;
5f46633565b1c1 Kishon Vijay Abraham I 2021-09-15   985  		bus-range = <0x0 0xff>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   986  		vendor-id = <0x104c>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   987  		device-id = <0xb00d>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   988  		msi-map = <0x0 &gic_its 0x10000 0x10000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   989  		dma-coherent;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   990  		ranges = <0x01000000 0x0 0x18001000 0x0 0x18001000 0x0 0x0010000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   991  			 <0x02000000 0x0 0x18011000 0x0 0x18011000 0x0 0x7fef000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   992  		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
731c6deda85ffc Andrew Davis           2023-05-15   993  		status = "disabled";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   994  	};
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   995  
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   996  	pcie2_rc: pcie@2920000 {
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   997  		compatible = "ti,j721e-pcie-host";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   998  		reg = <0x00 0x02920000 0x00 0x1000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14   999  		      <0x00 0x02927000 0x00 0x400>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1000  		      <0x00 0x0e000000 0x00 0x00800000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1001  		      <0x44 0x00000000 0x00 0x00001000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1002  		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1003  		interrupt-names = "link_state";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1004  		interrupts = <GIC_SPI 342 IRQ_TYPE_EDGE_RISING>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1005  		device_type = "pci";
edb96779f3bcbe Kishon Vijay Abraham I 2021-01-05  1006  		ti,syscon-pcie-ctrl = <&scm_conf 0x4078>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1007  		max-link-speed = <3>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1008  		num-lanes = <2>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1009  		power-domains = <&k3_pds 241 TI_SCI_PD_EXCLUSIVE>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1010  		clocks = <&k3_clks 241 1>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1011  		clock-names = "fck";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1012  		#address-cells = <3>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1013  		#size-cells = <2>;
5f46633565b1c1 Kishon Vijay Abraham I 2021-09-15  1014  		bus-range = <0x0 0xff>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1015  		vendor-id = <0x104c>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1016  		device-id = <0xb00d>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1017  		msi-map = <0x0 &gic_its 0x20000 0x10000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1018  		dma-coherent;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1019  		ranges = <0x01000000 0x0 0x00001000 0x44 0x00001000 0x0 0x0010000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1020  			 <0x02000000 0x0 0x00011000 0x44 0x00011000 0x0 0x7fef000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1021  		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
731c6deda85ffc Andrew Davis           2023-05-15  1022  		status = "disabled";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1023  	};
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1024  
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1025  	pcie3_rc: pcie@2930000 {
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1026  		compatible = "ti,j721e-pcie-host";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1027  		reg = <0x00 0x02930000 0x00 0x1000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1028  		      <0x00 0x02937000 0x00 0x400>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1029  		      <0x00 0x0e800000 0x00 0x00800000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1030  		      <0x44 0x10000000 0x00 0x00001000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1031  		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1032  		interrupt-names = "link_state";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1033  		interrupts = <GIC_SPI 354 IRQ_TYPE_EDGE_RISING>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1034  		device_type = "pci";
edb96779f3bcbe Kishon Vijay Abraham I 2021-01-05  1035  		ti,syscon-pcie-ctrl = <&scm_conf 0x407c>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1036  		max-link-speed = <3>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1037  		num-lanes = <2>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1038  		power-domains = <&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1039  		clocks = <&k3_clks 242 1>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1040  		clock-names = "fck";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1041  		#address-cells = <3>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1042  		#size-cells = <2>;
5f46633565b1c1 Kishon Vijay Abraham I 2021-09-15  1043  		bus-range = <0x0 0xff>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1044  		vendor-id = <0x104c>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1045  		device-id = <0xb00d>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1046  		msi-map = <0x0 &gic_its 0x30000 0x10000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1047  		dma-coherent;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1048  		ranges = <0x01000000 0x0 0x00001000 0x44 0x10001000 0x0 0x0010000>,
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1049  			 <0x02000000 0x0 0x00011000 0x44 0x10011000 0x0 0x7fef000>;
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1050  		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
731c6deda85ffc Andrew Davis           2023-05-15  1051  		status = "disabled";
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1052  	};
4e5833884f6656 Kishon Vijay Abraham I 2020-09-14  1053  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1054  	serdes_wiz4: wiz@5050000 {
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1055  		compatible = "ti,am64-wiz-10g";
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1056  		#address-cells = <1>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1057  		#size-cells = <1>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1058  		power-domains = <&k3_pds 297 TI_SCI_PD_EXCLUSIVE>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1059  		clocks = <&k3_clks 297 1>, <&k3_clks 297 9>, <&cmn_refclk>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1060  		clock-names = "fck", "core_ref_clk", "ext_ref_clk";
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1061  		assigned-clocks = <&k3_clks 297 9>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1062  		assigned-clock-parents = <&k3_clks 297 10>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1063  		assigned-clock-rates = <19200000>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1064  		num-lanes = <4>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1065  		#reset-cells = <1>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1066  		#clock-cells = <1>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1067  		ranges = <0x05050000 0x00 0x05050000 0x010000>,
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1068  			<0x0a030a00 0x00 0x0a030a00 0x40>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1069  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1070  		serdes4: serdes@5050000 {
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1071  			/*
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1072  			 * Note: we also map DPTX PHY registers as the Torrent
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1073  			 * needs to manage those.
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1074  			 */
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1075  			compatible = "ti,j721e-serdes-10g";
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1076  			reg = <0x05050000 0x010000>,
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1077  			      <0x0a030a00 0x40>; /* DPTX PHY */
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1078  			reg-names = "torrent_phy", "dptx_phy";
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1079  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1080  			resets = <&serdes_wiz4 0>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1081  			reset-names = "torrent_reset";
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1082  			clocks = <&serdes_wiz4 TI_WIZ_PLL0_REFCLK>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1083  			clock-names = "refclk";
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1084  			assigned-clocks = <&serdes_wiz4 TI_WIZ_PLL0_REFCLK>,
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1085  					  <&serdes_wiz4 TI_WIZ_PLL1_REFCLK>,
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1086  					  <&serdes_wiz4 TI_WIZ_REFCLK_DIG>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1087  			assigned-clock-parents = <&k3_clks 297 9>,
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1088  						 <&k3_clks 297 9>,
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1089  						 <&k3_clks 297 9>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1090  			#address-cells = <1>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1091  			#size-cells = <0>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1092  		};
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1093  	};
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1094  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1095  	main_timer0: timer@2400000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1096  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1097  		reg = <0x00 0x2400000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1098  		interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1099  		clocks = <&k3_clks 49 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1100  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1101  		assigned-clocks = <&k3_clks 49 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1102  		assigned-clock-parents = <&k3_clks 49 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1103  		power-domains = <&k3_pds 49 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1104  		ti,timer-pwm;
448809ccdc0578 Beleswar Padhi         2024-06-10  1105  		status = "reserved";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1106  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1107  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1108  	main_timer1: timer@2410000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1109  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1110  		reg = <0x00 0x2410000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1111  		interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1112  		clocks = <&k3_clks 50 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1113  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1114  		assigned-clocks = <&k3_clks 50 1>, <&k3_clks 327 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1115  		assigned-clock-parents = <&k3_clks 50 2>, <&k3_clks 327 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1116  		power-domains = <&k3_pds 50 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1117  		ti,timer-pwm;
448809ccdc0578 Beleswar Padhi         2024-06-10  1118  		status = "reserved";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1119  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1120  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1121  	main_timer2: timer@2420000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1122  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1123  		reg = <0x00 0x2420000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1124  		interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1125  		clocks = <&k3_clks 51 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1126  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1127  		assigned-clocks = <&k3_clks 51 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1128  		assigned-clock-parents = <&k3_clks 51 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1129  		power-domains = <&k3_pds 51 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1130  		ti,timer-pwm;
448809ccdc0578 Beleswar Padhi         2024-06-10  1131  		status = "reserved";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1132  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1133  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1134  	main_timer3: timer@2430000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1135  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1136  		reg = <0x00 0x2430000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1137  		interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1138  		clocks = <&k3_clks 52 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1139  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1140  		assigned-clocks = <&k3_clks 52 1>, <&k3_clks 328 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1141  		assigned-clock-parents = <&k3_clks 52 2>, <&k3_clks 328 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1142  		power-domains = <&k3_pds 52 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1143  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1144  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1145  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1146  	main_timer4: timer@2440000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1147  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1148  		reg = <0x00 0x2440000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1149  		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1150  		clocks = <&k3_clks 53 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1151  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1152  		assigned-clocks = <&k3_clks 53 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1153  		assigned-clock-parents = <&k3_clks 53 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1154  		power-domains = <&k3_pds 53 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1155  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1156  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1157  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1158  	main_timer5: timer@2450000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1159  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1160  		reg = <0x00 0x2450000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1161  		interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1162  		clocks = <&k3_clks 54 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1163  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1164  		assigned-clocks = <&k3_clks 54 1>, <&k3_clks 329 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1165  		assigned-clock-parents = <&k3_clks 54 2>, <&k3_clks 329 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1166  		power-domains = <&k3_pds 54 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1167  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1168  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1169  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1170  	main_timer6: timer@2460000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1171  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1172  		reg = <0x00 0x2460000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1173  		interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1174  		clocks = <&k3_clks 55 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1175  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1176  		assigned-clocks = <&k3_clks 55 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1177  		assigned-clock-parents = <&k3_clks 55 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1178  		power-domains = <&k3_pds 55 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1179  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1180  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1181  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1182  	main_timer7: timer@2470000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1183  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1184  		reg = <0x00 0x2470000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1185  		interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1186  		clocks = <&k3_clks 57 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1187  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1188  		assigned-clocks = <&k3_clks 57 1>, <&k3_clks 330 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1189  		assigned-clock-parents = <&k3_clks 57 2>, <&k3_clks 330 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1190  		power-domains = <&k3_pds 57 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1191  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1192  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1193  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1194  	main_timer8: timer@2480000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1195  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1196  		reg = <0x00 0x2480000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1197  		interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1198  		clocks = <&k3_clks 58 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1199  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1200  		assigned-clocks = <&k3_clks 58 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1201  		assigned-clock-parents = <&k3_clks 58 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1202  		power-domains = <&k3_pds 58 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1203  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1204  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1205  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1206  	main_timer9: timer@2490000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1207  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1208  		reg = <0x00 0x2490000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1209  		interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1210  		clocks = <&k3_clks 59 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1211  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1212  		assigned-clocks = <&k3_clks 59 1>, <&k3_clks 331 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1213  		assigned-clock-parents = <&k3_clks 59 2>, <&k3_clks 331 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1214  		power-domains = <&k3_pds 59 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1215  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1216  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1217  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1218  	main_timer10: timer@24a0000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1219  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1220  		reg = <0x00 0x24a0000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1221  		interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1222  		clocks = <&k3_clks 60 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1223  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1224  		assigned-clocks = <&k3_clks 60 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1225  		assigned-clock-parents = <&k3_clks 60 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1226  		power-domains = <&k3_pds 60 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1227  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1228  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1229  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1230  	main_timer11: timer@24b0000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1231  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1232  		reg = <0x00 0x24b0000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1233  		interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1234  		clocks = <&k3_clks 62 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1235  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1236  		assigned-clocks = <&k3_clks 62 1>, <&k3_clks 332 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1237  		assigned-clock-parents = <&k3_clks 62 2>, <&k3_clks 332 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1238  		power-domains = <&k3_pds 62 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1239  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1240  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1241  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1242  	main_timer12: timer@24c0000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1243  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1244  		reg = <0x00 0x24c0000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1245  		interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1246  		clocks = <&k3_clks 63 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1247  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1248  		assigned-clocks = <&k3_clks 63 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1249  		assigned-clock-parents = <&k3_clks 63 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1250  		power-domains = <&k3_pds 63 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1251  		ti,timer-pwm;
448809ccdc0578 Beleswar Padhi         2024-06-10  1252  		status = "reserved";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1253  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1254  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1255  	main_timer13: timer@24d0000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1256  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1257  		reg = <0x00 0x24d0000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1258  		interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1259  		clocks = <&k3_clks 64 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1260  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1261  		assigned-clocks = <&k3_clks 64 1>, <&k3_clks 333 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1262  		assigned-clock-parents = <&k3_clks 64 2>, <&k3_clks 333 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1263  		power-domains = <&k3_pds 64 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1264  		ti,timer-pwm;
448809ccdc0578 Beleswar Padhi         2024-06-10  1265  		status = "reserved";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1266  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1267  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1268  	main_timer14: timer@24e0000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1269  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1270  		reg = <0x00 0x24e0000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1271  		interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1272  		clocks = <&k3_clks 65 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1273  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1274  		assigned-clocks = <&k3_clks 65 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1275  		assigned-clock-parents = <&k3_clks 65 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1276  		power-domains = <&k3_pds 65 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1277  		ti,timer-pwm;
448809ccdc0578 Beleswar Padhi         2024-06-10  1278  		status = "reserved";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1279  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1280  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1281  	main_timer15: timer@24f0000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1282  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1283  		reg = <0x00 0x24f0000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1284  		interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1285  		clocks = <&k3_clks 66 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1286  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1287  		assigned-clocks = <&k3_clks 66 1>, <&k3_clks 334 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1288  		assigned-clock-parents = <&k3_clks 66 2>, <&k3_clks 334 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1289  		power-domains = <&k3_pds 66 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1290  		ti,timer-pwm;
448809ccdc0578 Beleswar Padhi         2024-06-10  1291  		status = "reserved";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1292  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1293  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1294  	main_timer16: timer@2500000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1295  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1296  		reg = <0x00 0x2500000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1297  		interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1298  		clocks = <&k3_clks 67 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1299  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1300  		assigned-clocks = <&k3_clks 67 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1301  		assigned-clock-parents = <&k3_clks 67 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1302  		power-domains = <&k3_pds 67 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1303  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1304  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1305  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1306  	main_timer17: timer@2510000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1307  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1308  		reg = <0x00 0x2510000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1309  		interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1310  		clocks = <&k3_clks 68 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1311  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1312  		assigned-clocks = <&k3_clks 68 1>, <&k3_clks 335 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1313  		assigned-clock-parents = <&k3_clks 68 2>, <&k3_clks 335 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1314  		power-domains = <&k3_pds 68 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1315  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1316  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1317  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1318  	main_timer18: timer@2520000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1319  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1320  		reg = <0x00 0x2520000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1321  		interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1322  		clocks = <&k3_clks 69 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1323  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1324  		assigned-clocks = <&k3_clks 69 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1325  		assigned-clock-parents = <&k3_clks 69 2>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1326  		power-domains = <&k3_pds 69 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1327  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1328  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1329  
7f209dd1267ce2 Nishanth Menon         2023-05-31  1330  	main_timer19: timer@2530000 {
7f209dd1267ce2 Nishanth Menon         2023-05-31  1331  		compatible = "ti,am654-timer";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1332  		reg = <0x00 0x2530000 0x00 0x400>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1333  		interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1334  		clocks = <&k3_clks 70 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1335  		clock-names = "fck";
7f209dd1267ce2 Nishanth Menon         2023-05-31  1336  		assigned-clocks = <&k3_clks 70 1>, <&k3_clks 336 0>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1337  		assigned-clock-parents = <&k3_clks 70 2>, <&k3_clks 336 1>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1338  		power-domains = <&k3_pds 70 TI_SCI_PD_EXCLUSIVE>;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1339  		ti,timer-pwm;
7f209dd1267ce2 Nishanth Menon         2023-05-31  1340  	};
7f209dd1267ce2 Nishanth Menon         2023-05-31  1341  
2d87061e70dea4 Nishanth Menon         2019-05-22  1342  	main_uart0: serial@2800000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1343  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1344  		reg = <0x00 0x02800000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1345  		interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1346  		clock-frequency = <48000000>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1347  		current-speed = <115200>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1348  		power-domains = <&k3_pds 146 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1349  		clocks = <&k3_clks 146 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1350  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1351  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1352  	};
2d87061e70dea4 Nishanth Menon         2019-05-22  1353  
2d87061e70dea4 Nishanth Menon         2019-05-22  1354  	main_uart1: serial@2810000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1355  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1356  		reg = <0x00 0x02810000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1357  		interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1358  		clock-frequency = <48000000>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1359  		current-speed = <115200>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1360  		power-domains = <&k3_pds 278 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1361  		clocks = <&k3_clks 278 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1362  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1363  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1364  	};
2d87061e70dea4 Nishanth Menon         2019-05-22  1365  
2d87061e70dea4 Nishanth Menon         2019-05-22  1366  	main_uart2: serial@2820000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1367  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1368  		reg = <0x00 0x02820000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1369  		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1370  		clock-frequency = <48000000>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1371  		current-speed = <115200>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1372  		power-domains = <&k3_pds 279 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1373  		clocks = <&k3_clks 279 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1374  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1375  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1376  	};
2d87061e70dea4 Nishanth Menon         2019-05-22  1377  
2d87061e70dea4 Nishanth Menon         2019-05-22  1378  	main_uart3: serial@2830000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1379  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1380  		reg = <0x00 0x02830000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1381  		interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1382  		clock-frequency = <48000000>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1383  		current-speed = <115200>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1384  		power-domains = <&k3_pds 280 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1385  		clocks = <&k3_clks 280 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1386  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1387  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1388  	};
2d87061e70dea4 Nishanth Menon         2019-05-22  1389  
2d87061e70dea4 Nishanth Menon         2019-05-22  1390  	main_uart4: serial@2840000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1391  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1392  		reg = <0x00 0x02840000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1393  		interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1394  		clock-frequency = <48000000>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1395  		current-speed = <115200>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1396  		power-domains = <&k3_pds 281 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1397  		clocks = <&k3_clks 281 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1398  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1399  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1400  	};
2d87061e70dea4 Nishanth Menon         2019-05-22  1401  
2d87061e70dea4 Nishanth Menon         2019-05-22  1402  	main_uart5: serial@2850000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1403  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1404  		reg = <0x00 0x02850000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1405  		interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1406  		clock-frequency = <48000000>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1407  		current-speed = <115200>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1408  		power-domains = <&k3_pds 282 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1409  		clocks = <&k3_clks 282 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1410  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1411  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1412  	};
2d87061e70dea4 Nishanth Menon         2019-05-22  1413  
2d87061e70dea4 Nishanth Menon         2019-05-22  1414  	main_uart6: serial@2860000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1415  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1416  		reg = <0x00 0x02860000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1417  		interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1418  		clock-frequency = <48000000>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1419  		current-speed = <115200>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1420  		power-domains = <&k3_pds 283 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1421  		clocks = <&k3_clks 283 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1422  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1423  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1424  	};
2d87061e70dea4 Nishanth Menon         2019-05-22  1425  
2d87061e70dea4 Nishanth Menon         2019-05-22  1426  	main_uart7: serial@2870000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1427  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1428  		reg = <0x00 0x02870000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1429  		interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1430  		clock-frequency = <48000000>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1431  		current-speed = <115200>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1432  		power-domains = <&k3_pds 284 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1433  		clocks = <&k3_clks 284 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1434  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1435  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1436  	};
2d87061e70dea4 Nishanth Menon         2019-05-22  1437  
2d87061e70dea4 Nishanth Menon         2019-05-22  1438  	main_uart8: serial@2880000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1439  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1440  		reg = <0x00 0x02880000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1441  		interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1442  		clock-frequency = <48000000>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1443  		current-speed = <115200>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1444  		power-domains = <&k3_pds 285 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1445  		clocks = <&k3_clks 285 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1446  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1447  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1448  	};
2d87061e70dea4 Nishanth Menon         2019-05-22  1449  
2d87061e70dea4 Nishanth Menon         2019-05-22  1450  	main_uart9: serial@2890000 {
2d87061e70dea4 Nishanth Menon         2019-05-22  1451  		compatible = "ti,j721e-uart", "ti,am654-uart";
2d87061e70dea4 Nishanth Menon         2019-05-22  1452  		reg = <0x00 0x02890000 0x00 0x100>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1453  		interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1454  		clock-frequency = <48000000>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1455  		current-speed = <115200>;
bf146a1a7cd485 Lokesh Vutla           2019-07-29  1456  		power-domains = <&k3_pds 286 TI_SCI_PD_EXCLUSIVE>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1457  		clocks = <&k3_clks 286 0>;
2d87061e70dea4 Nishanth Menon         2019-05-22  1458  		clock-names = "fclk";
fe17e20fde14c6 Andrew Davis           2022-10-20  1459  		status = "disabled";
2d87061e70dea4 Nishanth Menon         2019-05-22  1460  	};
248f3eae99485b Lokesh Vutla           2019-08-09  1461  
248f3eae99485b Lokesh Vutla           2019-08-09  1462  	main_gpio0: gpio@600000 {
248f3eae99485b Lokesh Vutla           2019-08-09  1463  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
248f3eae99485b Lokesh Vutla           2019-08-09  1464  		reg = <0x0 0x00600000 0x0 0x100>;
248f3eae99485b Lokesh Vutla           2019-08-09  1465  		gpio-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1466  		#gpio-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1467  		interrupt-parent = <&main_gpio_intr>;
8d523f096da535 Lokesh Vutla           2020-08-06  1468  		interrupts = <256>, <257>, <258>, <259>,
8d523f096da535 Lokesh Vutla           2020-08-06  1469  			     <260>, <261>, <262>, <263>;
248f3eae99485b Lokesh Vutla           2019-08-09  1470  		interrupt-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1471  		#interrupt-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1472  		ti,ngpio = <128>;
248f3eae99485b Lokesh Vutla           2019-08-09  1473  		ti,davinci-gpio-unbanked = <0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1474  		power-domains = <&k3_pds 105 TI_SCI_PD_EXCLUSIVE>;
248f3eae99485b Lokesh Vutla           2019-08-09  1475  		clocks = <&k3_clks 105 0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1476  		clock-names = "gpio";
8757108b59e149 Andrew Davis           2023-08-09  1477  		status = "disabled";
248f3eae99485b Lokesh Vutla           2019-08-09  1478  	};
248f3eae99485b Lokesh Vutla           2019-08-09  1479  
248f3eae99485b Lokesh Vutla           2019-08-09  1480  	main_gpio1: gpio@601000 {
248f3eae99485b Lokesh Vutla           2019-08-09  1481  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
248f3eae99485b Lokesh Vutla           2019-08-09  1482  		reg = <0x0 0x00601000 0x0 0x100>;
248f3eae99485b Lokesh Vutla           2019-08-09  1483  		gpio-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1484  		#gpio-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1485  		interrupt-parent = <&main_gpio_intr>;
8d523f096da535 Lokesh Vutla           2020-08-06  1486  		interrupts = <288>, <289>, <290>;
248f3eae99485b Lokesh Vutla           2019-08-09  1487  		interrupt-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1488  		#interrupt-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1489  		ti,ngpio = <36>;
248f3eae99485b Lokesh Vutla           2019-08-09  1490  		ti,davinci-gpio-unbanked = <0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1491  		power-domains = <&k3_pds 106 TI_SCI_PD_EXCLUSIVE>;
248f3eae99485b Lokesh Vutla           2019-08-09  1492  		clocks = <&k3_clks 106 0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1493  		clock-names = "gpio";
8757108b59e149 Andrew Davis           2023-08-09  1494  		status = "disabled";
248f3eae99485b Lokesh Vutla           2019-08-09  1495  	};
248f3eae99485b Lokesh Vutla           2019-08-09  1496  
248f3eae99485b Lokesh Vutla           2019-08-09  1497  	main_gpio2: gpio@610000 {
248f3eae99485b Lokesh Vutla           2019-08-09  1498  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
248f3eae99485b Lokesh Vutla           2019-08-09  1499  		reg = <0x0 0x00610000 0x0 0x100>;
248f3eae99485b Lokesh Vutla           2019-08-09  1500  		gpio-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1501  		#gpio-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1502  		interrupt-parent = <&main_gpio_intr>;
8d523f096da535 Lokesh Vutla           2020-08-06  1503  		interrupts = <264>, <265>, <266>, <267>,
8d523f096da535 Lokesh Vutla           2020-08-06  1504  			     <268>, <269>, <270>, <271>;
248f3eae99485b Lokesh Vutla           2019-08-09  1505  		interrupt-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1506  		#interrupt-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1507  		ti,ngpio = <128>;
248f3eae99485b Lokesh Vutla           2019-08-09  1508  		ti,davinci-gpio-unbanked = <0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1509  		power-domains = <&k3_pds 107 TI_SCI_PD_EXCLUSIVE>;
248f3eae99485b Lokesh Vutla           2019-08-09  1510  		clocks = <&k3_clks 107 0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1511  		clock-names = "gpio";
8757108b59e149 Andrew Davis           2023-08-09  1512  		status = "disabled";
248f3eae99485b Lokesh Vutla           2019-08-09  1513  	};
248f3eae99485b Lokesh Vutla           2019-08-09  1514  
248f3eae99485b Lokesh Vutla           2019-08-09  1515  	main_gpio3: gpio@611000 {
248f3eae99485b Lokesh Vutla           2019-08-09  1516  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
248f3eae99485b Lokesh Vutla           2019-08-09  1517  		reg = <0x0 0x00611000 0x0 0x100>;
248f3eae99485b Lokesh Vutla           2019-08-09  1518  		gpio-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1519  		#gpio-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1520  		interrupt-parent = <&main_gpio_intr>;
8d523f096da535 Lokesh Vutla           2020-08-06  1521  		interrupts = <292>, <293>, <294>;
248f3eae99485b Lokesh Vutla           2019-08-09  1522  		interrupt-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1523  		#interrupt-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1524  		ti,ngpio = <36>;
248f3eae99485b Lokesh Vutla           2019-08-09  1525  		ti,davinci-gpio-unbanked = <0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1526  		power-domains = <&k3_pds 108 TI_SCI_PD_EXCLUSIVE>;
248f3eae99485b Lokesh Vutla           2019-08-09  1527  		clocks = <&k3_clks 108 0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1528  		clock-names = "gpio";
8757108b59e149 Andrew Davis           2023-08-09  1529  		status = "disabled";
248f3eae99485b Lokesh Vutla           2019-08-09  1530  	};
248f3eae99485b Lokesh Vutla           2019-08-09  1531  
248f3eae99485b Lokesh Vutla           2019-08-09  1532  	main_gpio4: gpio@620000 {
248f3eae99485b Lokesh Vutla           2019-08-09  1533  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
248f3eae99485b Lokesh Vutla           2019-08-09  1534  		reg = <0x0 0x00620000 0x0 0x100>;
248f3eae99485b Lokesh Vutla           2019-08-09  1535  		gpio-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1536  		#gpio-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1537  		interrupt-parent = <&main_gpio_intr>;
8d523f096da535 Lokesh Vutla           2020-08-06  1538  		interrupts = <272>, <273>, <274>, <275>,
8d523f096da535 Lokesh Vutla           2020-08-06  1539  			     <276>, <277>, <278>, <279>;
248f3eae99485b Lokesh Vutla           2019-08-09  1540  		interrupt-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1541  		#interrupt-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1542  		ti,ngpio = <128>;
248f3eae99485b Lokesh Vutla           2019-08-09  1543  		ti,davinci-gpio-unbanked = <0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1544  		power-domains = <&k3_pds 109 TI_SCI_PD_EXCLUSIVE>;
248f3eae99485b Lokesh Vutla           2019-08-09  1545  		clocks = <&k3_clks 109 0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1546  		clock-names = "gpio";
8757108b59e149 Andrew Davis           2023-08-09  1547  		status = "disabled";
248f3eae99485b Lokesh Vutla           2019-08-09  1548  	};
248f3eae99485b Lokesh Vutla           2019-08-09  1549  
248f3eae99485b Lokesh Vutla           2019-08-09  1550  	main_gpio5: gpio@621000 {
248f3eae99485b Lokesh Vutla           2019-08-09  1551  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
248f3eae99485b Lokesh Vutla           2019-08-09  1552  		reg = <0x0 0x00621000 0x0 0x100>;
248f3eae99485b Lokesh Vutla           2019-08-09  1553  		gpio-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1554  		#gpio-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1555  		interrupt-parent = <&main_gpio_intr>;
8d523f096da535 Lokesh Vutla           2020-08-06  1556  		interrupts = <296>, <297>, <298>;
248f3eae99485b Lokesh Vutla           2019-08-09  1557  		interrupt-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1558  		#interrupt-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1559  		ti,ngpio = <36>;
248f3eae99485b Lokesh Vutla           2019-08-09  1560  		ti,davinci-gpio-unbanked = <0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1561  		power-domains = <&k3_pds 110 TI_SCI_PD_EXCLUSIVE>;
248f3eae99485b Lokesh Vutla           2019-08-09  1562  		clocks = <&k3_clks 110 0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1563  		clock-names = "gpio";
8757108b59e149 Andrew Davis           2023-08-09  1564  		status = "disabled";
248f3eae99485b Lokesh Vutla           2019-08-09  1565  	};
248f3eae99485b Lokesh Vutla           2019-08-09  1566  
248f3eae99485b Lokesh Vutla           2019-08-09  1567  	main_gpio6: gpio@630000 {
248f3eae99485b Lokesh Vutla           2019-08-09  1568  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
248f3eae99485b Lokesh Vutla           2019-08-09  1569  		reg = <0x0 0x00630000 0x0 0x100>;
248f3eae99485b Lokesh Vutla           2019-08-09  1570  		gpio-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1571  		#gpio-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1572  		interrupt-parent = <&main_gpio_intr>;
8d523f096da535 Lokesh Vutla           2020-08-06  1573  		interrupts = <280>, <281>, <282>, <283>,
8d523f096da535 Lokesh Vutla           2020-08-06  1574  			     <284>, <285>, <286>, <287>;
248f3eae99485b Lokesh Vutla           2019-08-09  1575  		interrupt-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1576  		#interrupt-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1577  		ti,ngpio = <128>;
248f3eae99485b Lokesh Vutla           2019-08-09  1578  		ti,davinci-gpio-unbanked = <0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1579  		power-domains = <&k3_pds 111 TI_SCI_PD_EXCLUSIVE>;
248f3eae99485b Lokesh Vutla           2019-08-09  1580  		clocks = <&k3_clks 111 0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1581  		clock-names = "gpio";
8757108b59e149 Andrew Davis           2023-08-09  1582  		status = "disabled";
248f3eae99485b Lokesh Vutla           2019-08-09  1583  	};
248f3eae99485b Lokesh Vutla           2019-08-09  1584  
248f3eae99485b Lokesh Vutla           2019-08-09  1585  	main_gpio7: gpio@631000 {
248f3eae99485b Lokesh Vutla           2019-08-09  1586  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
248f3eae99485b Lokesh Vutla           2019-08-09  1587  		reg = <0x0 0x00631000 0x0 0x100>;
248f3eae99485b Lokesh Vutla           2019-08-09  1588  		gpio-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1589  		#gpio-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1590  		interrupt-parent = <&main_gpio_intr>;
8d523f096da535 Lokesh Vutla           2020-08-06  1591  		interrupts = <300>, <301>, <302>;
248f3eae99485b Lokesh Vutla           2019-08-09  1592  		interrupt-controller;
248f3eae99485b Lokesh Vutla           2019-08-09  1593  		#interrupt-cells = <2>;
248f3eae99485b Lokesh Vutla           2019-08-09  1594  		ti,ngpio = <36>;
248f3eae99485b Lokesh Vutla           2019-08-09  1595  		ti,davinci-gpio-unbanked = <0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1596  		power-domains = <&k3_pds 112 TI_SCI_PD_EXCLUSIVE>;
248f3eae99485b Lokesh Vutla           2019-08-09  1597  		clocks = <&k3_clks 112 0>;
248f3eae99485b Lokesh Vutla           2019-08-09  1598  		clock-names = "gpio";
8757108b59e149 Andrew Davis           2023-08-09  1599  		status = "disabled";
248f3eae99485b Lokesh Vutla           2019-08-09  1600  	};
e6dc10f200dae6 Faiz Abbas             2019-09-19  1601  
0cf73209ce2c60 Grygorii Strashko      2021-01-15  1602  	main_sdhci0: mmc@4f80000 {
e6dc10f200dae6 Faiz Abbas             2019-09-19  1603  		compatible = "ti,j721e-sdhci-8bit";
e6dc10f200dae6 Faiz Abbas             2019-09-19  1604  		reg = <0x0 0x4f80000 0x0 0x1000>, <0x0 0x4f88000 0x0 0x400>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1605  		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1606  		power-domains = <&k3_pds 91 TI_SCI_PD_EXCLUSIVE>;
0cf73209ce2c60 Grygorii Strashko      2021-01-15  1607  		clock-names = "clk_ahb", "clk_xin";
0cf73209ce2c60 Grygorii Strashko      2021-01-15  1608  		clocks = <&k3_clks 91 0>, <&k3_clks 91 1>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1609  		assigned-clocks = <&k3_clks 91 1>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1610  		assigned-clock-parents = <&k3_clks 91 2>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1611  		bus-width = <8>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1612  		mmc-hs200-1_8v;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1613  		mmc-ddr-1_8v;
af398252d68edb Bhavya Kapoor          2023-04-24  1614  		ti,otap-del-sel-legacy = <0x0>;
af398252d68edb Bhavya Kapoor          2023-04-24  1615  		ti,otap-del-sel-mmc-hs = <0x0>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1616  		ti,otap-del-sel-ddr52 = <0x5>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1617  		ti,otap-del-sel-hs200 = <0x6>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1618  		ti,otap-del-sel-hs400 = <0x0>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1619  		ti,itap-del-sel-legacy = <0x10>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1620  		ti,itap-del-sel-mmc-hs = <0xa>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1621  		ti,itap-del-sel-ddr52 = <0x3>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1622  		ti,trm-icp = <0x8>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1623  		dma-coherent;
6fbd1310f99fc9 Andrew Davis           2023-08-09  1624  		status = "disabled";
e6dc10f200dae6 Faiz Abbas             2019-09-19  1625  	};
e6dc10f200dae6 Faiz Abbas             2019-09-19  1626  
0cf73209ce2c60 Grygorii Strashko      2021-01-15  1627  	main_sdhci1: mmc@4fb0000 {
e6dc10f200dae6 Faiz Abbas             2019-09-19  1628  		compatible = "ti,j721e-sdhci-4bit";
e6dc10f200dae6 Faiz Abbas             2019-09-19  1629  		reg = <0x0 0x04fb0000 0x0 0x1000>, <0x0 0x4fb8000 0x0 0x400>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1630  		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1631  		power-domains = <&k3_pds 92 TI_SCI_PD_EXCLUSIVE>;
0cf73209ce2c60 Grygorii Strashko      2021-01-15  1632  		clock-names = "clk_ahb", "clk_xin";
0cf73209ce2c60 Grygorii Strashko      2021-01-15  1633  		clocks = <&k3_clks 92 5>, <&k3_clks 92 0>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1634  		assigned-clocks = <&k3_clks 92 0>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1635  		assigned-clock-parents = <&k3_clks 92 1>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1636  		ti,otap-del-sel-legacy = <0x0>;
af398252d68edb Bhavya Kapoor          2023-04-24  1637  		ti,otap-del-sel-sd-hs = <0x0>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1638  		ti,otap-del-sel-sdr12 = <0xf>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1639  		ti,otap-del-sel-sdr25 = <0xf>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1640  		ti,otap-del-sel-sdr50 = <0xc>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1641  		ti,otap-del-sel-ddr50 = <0xc>;
af398252d68edb Bhavya Kapoor          2023-04-24  1642  		ti,otap-del-sel-sdr104 = <0x5>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1643  		ti,itap-del-sel-legacy = <0x0>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1644  		ti,itap-del-sel-sd-hs = <0x0>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1645  		ti,itap-del-sel-sdr12 = <0x0>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1646  		ti,itap-del-sel-sdr25 = <0x0>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1647  		ti,itap-del-sel-ddr50 = <0x2>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1648  		ti,trm-icp = <0x8>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1649  		ti,clkbuf-sel = <0x7>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1650  		dma-coherent;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1651  		sdhci-caps-mask = <0x2 0x0>;
6fbd1310f99fc9 Andrew Davis           2023-08-09  1652  		status = "disabled";
e6dc10f200dae6 Faiz Abbas             2019-09-19  1653  	};
e6dc10f200dae6 Faiz Abbas             2019-09-19  1654  
0cf73209ce2c60 Grygorii Strashko      2021-01-15  1655  	main_sdhci2: mmc@4f98000 {
e6dc10f200dae6 Faiz Abbas             2019-09-19  1656  		compatible = "ti,j721e-sdhci-4bit";
e6dc10f200dae6 Faiz Abbas             2019-09-19  1657  		reg = <0x0 0x4f98000 0x0 0x1000>, <0x0 0x4f90000 0x0 0x400>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1658  		interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1659  		power-domains = <&k3_pds 93 TI_SCI_PD_EXCLUSIVE>;
0cf73209ce2c60 Grygorii Strashko      2021-01-15  1660  		clock-names = "clk_ahb", "clk_xin";
0cf73209ce2c60 Grygorii Strashko      2021-01-15  1661  		clocks = <&k3_clks 93 5>, <&k3_clks 93 0>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1662  		assigned-clocks = <&k3_clks 93 0>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1663  		assigned-clock-parents = <&k3_clks 93 1>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1664  		ti,otap-del-sel-legacy = <0x0>;
af398252d68edb Bhavya Kapoor          2023-04-24  1665  		ti,otap-del-sel-sd-hs = <0x0>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1666  		ti,otap-del-sel-sdr12 = <0xf>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1667  		ti,otap-del-sel-sdr25 = <0xf>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1668  		ti,otap-del-sel-sdr50 = <0xc>;
09ff4e90e04148 Faiz Abbas             2020-11-29  1669  		ti,otap-del-sel-ddr50 = <0xc>;
af398252d68edb Bhavya Kapoor          2023-04-24  1670  		ti,otap-del-sel-sdr104 = <0x5>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1671  		ti,itap-del-sel-legacy = <0x0>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1672  		ti,itap-del-sel-sd-hs = <0x0>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1673  		ti,itap-del-sel-sdr12 = <0x0>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1674  		ti,itap-del-sel-sdr25 = <0x0>;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1675  		ti,itap-del-sel-ddr50 = <0x2>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1676  		ti,trm-icp = <0x8>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1677  		ti,clkbuf-sel = <0x7>;
e6dc10f200dae6 Faiz Abbas             2019-09-19  1678  		dma-coherent;
eb8f6194e8074d Aswath Govindraju      2021-03-05  1679  		sdhci-caps-mask = <0x2 0x0>;
6fbd1310f99fc9 Andrew Davis           2023-08-09  1680  		status = "disabled";
e6dc10f200dae6 Faiz Abbas             2019-09-19  1681  	};
451555c80bc665 Roger Quadros          2019-10-28  1682  
e5c956c4f36cdd Nishanth Menon         2020-09-03  1683  	usbss0: cdns-usb@4104000 {
451555c80bc665 Roger Quadros          2019-10-28  1684  		compatible = "ti,j721e-usb";
451555c80bc665 Roger Quadros          2019-10-28  1685  		reg = <0x00 0x4104000 0x00 0x100>;
451555c80bc665 Roger Quadros          2019-10-28  1686  		dma-coherent;
451555c80bc665 Roger Quadros          2019-10-28  1687  		power-domains = <&k3_pds 288 TI_SCI_PD_EXCLUSIVE>;
451555c80bc665 Roger Quadros          2019-10-28  1688  		clocks = <&k3_clks 288 15>, <&k3_clks 288 3>;
451555c80bc665 Roger Quadros          2019-10-28  1689  		clock-names = "ref", "lpm";
451555c80bc665 Roger Quadros          2019-10-28  1690  		assigned-clocks = <&k3_clks 288 15>;	/* USB2_REFCLK */
451555c80bc665 Roger Quadros          2019-10-28  1691  		assigned-clock-parents = <&k3_clks 288 16>; /* HFOSC0 */
451555c80bc665 Roger Quadros          2019-10-28  1692  		#address-cells = <2>;
451555c80bc665 Roger Quadros          2019-10-28  1693  		#size-cells = <2>;
451555c80bc665 Roger Quadros          2019-10-28  1694  		ranges;
451555c80bc665 Roger Quadros          2019-10-28  1695  
451555c80bc665 Roger Quadros          2019-10-28  1696  		usb0: usb@6000000 {
451555c80bc665 Roger Quadros          2019-10-28  1697  			compatible = "cdns,usb3";
451555c80bc665 Roger Quadros          2019-10-28  1698  			reg = <0x00 0x6000000 0x00 0x10000>,
451555c80bc665 Roger Quadros          2019-10-28  1699  			      <0x00 0x6010000 0x00 0x10000>,
451555c80bc665 Roger Quadros          2019-10-28  1700  			      <0x00 0x6020000 0x00 0x10000>;
451555c80bc665 Roger Quadros          2019-10-28  1701  			reg-names = "otg", "xhci", "dev";
451555c80bc665 Roger Quadros          2019-10-28  1702  			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,	/* irq.0 */
451555c80bc665 Roger Quadros          2019-10-28  1703  				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>,	/* irq.6 */
451555c80bc665 Roger Quadros          2019-10-28  1704  				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>;	/* otgirq.0 */
451555c80bc665 Roger Quadros          2019-10-28  1705  			interrupt-names = "host",
451555c80bc665 Roger Quadros          2019-10-28  1706  					  "peripheral",
451555c80bc665 Roger Quadros          2019-10-28  1707  					  "otg";
451555c80bc665 Roger Quadros          2019-10-28  1708  			maximum-speed = "super-speed";
451555c80bc665 Roger Quadros          2019-10-28  1709  			dr_mode = "otg";
451555c80bc665 Roger Quadros          2019-10-28  1710  		};
451555c80bc665 Roger Quadros          2019-10-28  1711  	};
451555c80bc665 Roger Quadros          2019-10-28  1712  
e5c956c4f36cdd Nishanth Menon         2020-09-03  1713  	usbss1: cdns-usb@4114000 {
451555c80bc665 Roger Quadros          2019-10-28  1714  		compatible = "ti,j721e-usb";
451555c80bc665 Roger Quadros          2019-10-28  1715  		reg = <0x00 0x4114000 0x00 0x100>;
451555c80bc665 Roger Quadros          2019-10-28  1716  		dma-coherent;
451555c80bc665 Roger Quadros          2019-10-28  1717  		power-domains = <&k3_pds 289 TI_SCI_PD_EXCLUSIVE>;
451555c80bc665 Roger Quadros          2019-10-28  1718  		clocks = <&k3_clks 289 15>, <&k3_clks 289 3>;
451555c80bc665 Roger Quadros          2019-10-28  1719  		clock-names = "ref", "lpm";
451555c80bc665 Roger Quadros          2019-10-28  1720  		assigned-clocks = <&k3_clks 289 15>;	/* USB2_REFCLK */
451555c80bc665 Roger Quadros          2019-10-28  1721  		assigned-clock-parents = <&k3_clks 289 16>; /* HFOSC0 */
451555c80bc665 Roger Quadros          2019-10-28  1722  		#address-cells = <2>;
451555c80bc665 Roger Quadros          2019-10-28  1723  		#size-cells = <2>;
451555c80bc665 Roger Quadros          2019-10-28  1724  		ranges;
451555c80bc665 Roger Quadros          2019-10-28  1725  
451555c80bc665 Roger Quadros          2019-10-28  1726  		usb1: usb@6400000 {
451555c80bc665 Roger Quadros          2019-10-28  1727  			compatible = "cdns,usb3";
451555c80bc665 Roger Quadros          2019-10-28  1728  			reg = <0x00 0x6400000 0x00 0x10000>,
451555c80bc665 Roger Quadros          2019-10-28  1729  			      <0x00 0x6410000 0x00 0x10000>,
451555c80bc665 Roger Quadros          2019-10-28  1730  			      <0x00 0x6420000 0x00 0x10000>;
451555c80bc665 Roger Quadros          2019-10-28  1731  			reg-names = "otg", "xhci", "dev";
451555c80bc665 Roger Quadros          2019-10-28  1732  			interrupts = <GIC_SPI 104 IRQ_TYPE_LEVEL_HIGH>,	/* irq.0 */
451555c80bc665 Roger Quadros          2019-10-28  1733  				     <GIC_SPI 110 IRQ_TYPE_LEVEL_HIGH>,	/* irq.6 */
451555c80bc665 Roger Quadros          2019-10-28  1734  				     <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>;	/* otgirq.0 */
451555c80bc665 Roger Quadros          2019-10-28  1735  			interrupt-names = "host",
451555c80bc665 Roger Quadros          2019-10-28  1736  					  "peripheral",
451555c80bc665 Roger Quadros          2019-10-28  1737  					  "otg";
451555c80bc665 Roger Quadros          2019-10-28  1738  			maximum-speed = "super-speed";
451555c80bc665 Roger Quadros          2019-10-28  1739  			dr_mode = "otg";
451555c80bc665 Roger Quadros          2019-10-28  1740  		};
451555c80bc665 Roger Quadros          2019-10-28  1741  	};
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1742  
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1743  	main_i2c0: i2c@2000000 {
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1744  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1745  		reg = <0x0 0x2000000 0x0 0x100>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1746  		interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1747  		#address-cells = <1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1748  		#size-cells = <0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1749  		clock-names = "fck";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1750  		clocks = <&k3_clks 187 0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1751  		power-domains = <&k3_pds 187 TI_SCI_PD_SHARED>;
282c4ad3b8c1da Andrew Davis           2022-10-20  1752  		status = "disabled";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1753  	};
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1754  
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1755  	main_i2c1: i2c@2010000 {
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1756  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1757  		reg = <0x0 0x2010000 0x0 0x100>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1758  		interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1759  		#address-cells = <1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1760  		#size-cells = <0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1761  		clock-names = "fck";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1762  		clocks = <&k3_clks 188 0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1763  		power-domains = <&k3_pds 188 TI_SCI_PD_EXCLUSIVE>;
282c4ad3b8c1da Andrew Davis           2022-10-20  1764  		status = "disabled";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1765  	};
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1766  
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1767  	main_i2c2: i2c@2020000 {
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1768  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1769  		reg = <0x0 0x2020000 0x0 0x100>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1770  		interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1771  		#address-cells = <1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1772  		#size-cells = <0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1773  		clock-names = "fck";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1774  		clocks = <&k3_clks 189 0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1775  		power-domains = <&k3_pds 189 TI_SCI_PD_EXCLUSIVE>;
282c4ad3b8c1da Andrew Davis           2022-10-20  1776  		status = "disabled";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1777  	};
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1778  
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1779  	main_i2c3: i2c@2030000 {
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1780  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1781  		reg = <0x0 0x2030000 0x0 0x100>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1782  		interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1783  		#address-cells = <1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1784  		#size-cells = <0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1785  		clock-names = "fck";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1786  		clocks = <&k3_clks 190 0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1787  		power-domains = <&k3_pds 190 TI_SCI_PD_EXCLUSIVE>;
282c4ad3b8c1da Andrew Davis           2022-10-20  1788  		status = "disabled";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1789  	};
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1790  
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1791  	main_i2c4: i2c@2040000 {
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1792  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1793  		reg = <0x0 0x2040000 0x0 0x100>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1794  		interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1795  		#address-cells = <1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1796  		#size-cells = <0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1797  		clock-names = "fck";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1798  		clocks = <&k3_clks 191 0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1799  		power-domains = <&k3_pds 191 TI_SCI_PD_EXCLUSIVE>;
282c4ad3b8c1da Andrew Davis           2022-10-20  1800  		status = "disabled";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1801  	};
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1802  
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1803  	main_i2c5: i2c@2050000 {
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1804  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1805  		reg = <0x0 0x2050000 0x0 0x100>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1806  		interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1807  		#address-cells = <1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1808  		#size-cells = <0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1809  		clock-names = "fck";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1810  		clocks = <&k3_clks 192 0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1811  		power-domains = <&k3_pds 192 TI_SCI_PD_EXCLUSIVE>;
282c4ad3b8c1da Andrew Davis           2022-10-20  1812  		status = "disabled";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1813  	};
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1814  
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1815  	main_i2c6: i2c@2060000 {
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1816  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1817  		reg = <0x0 0x2060000 0x0 0x100>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1818  		interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1819  		#address-cells = <1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1820  		#size-cells = <0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1821  		clock-names = "fck";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1822  		clocks = <&k3_clks 193 0>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1823  		power-domains = <&k3_pds 193 TI_SCI_PD_EXCLUSIVE>;
282c4ad3b8c1da Andrew Davis           2022-10-20  1824  		status = "disabled";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1825  	};
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1826  
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1827  	ufs_wrapper: ufs-wrapper@4e80000 {
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1828  		compatible = "ti,j721e-ufs";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1829  		reg = <0x0 0x4e80000 0x0 0x100>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1830  		power-domains = <&k3_pds 277 TI_SCI_PD_EXCLUSIVE>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1831  		clocks = <&k3_clks 277 1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1832  		assigned-clocks = <&k3_clks 277 1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1833  		assigned-clock-parents = <&k3_clks 277 4>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1834  		ranges;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1835  		#address-cells = <2>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1836  		#size-cells = <2>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1837  
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1838  		ufs@4e84000 {
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1839  			compatible = "cdns,ufshc-m31-16nm", "jedec,ufs-2.0";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1840  			reg = <0x0 0x4e84000 0x0 0x10000>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1841  			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1842  			freq-table-hz = <250000000 250000000>, <19200000 19200000>, <19200000 19200000>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1843  			clocks = <&k3_clks 277 0>, <&k3_clks 277 1>, <&k3_clks 277 1>;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1844  			clock-names = "core_clk", "phy_clk", "ref_clk";
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1845  			dma-coherent;
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1846  		};
cb27354b38f3b4 Vignesh Raghavendra    2019-12-11  1847  	};
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1848  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1849  	mhdp: dp-bridge@a000000 {
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1850  		compatible = "ti,j721e-mhdp8546";
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1851  		/*
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1852  		 * Note: we do not map DPTX PHY area, as that is handled by
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1853  		 * the PHY driver.
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1854  		 */
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1855  		reg = <0x00 0x0a000000 0x00 0x030a00>, /* DSS_EDP0_V2A_CORE_VP_REGS_APB */
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1856  		      <0x00 0x04f40000 0x00 0x20>;    /* DSS_EDP0_INTG_CFG_VP */
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1857  		reg-names = "mhdptx", "j721e-intg";
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1858  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1859  		clocks = <&k3_clks 151 36>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1860  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1861  		interrupt-parent = <&gic500>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1862  		interrupts = <GIC_SPI 614 IRQ_TYPE_LEVEL_HIGH>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1863  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1864  		power-domains = <&k3_pds 151 TI_SCI_PD_EXCLUSIVE>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1865  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1866  		dp0_ports: ports {
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1867  			#address-cells = <1>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1868  			#size-cells = <0>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1869  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1870  			port@0 {
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1871  			    reg = <0>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1872  			};
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1873  
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1874  			port@4 {
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1875  			    reg = <4>;
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1876  			};
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1877  		};
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1878  	};
92c996f4ceabd5 Tomi Valkeinen         2022-04-29  1879  
bfeee37402c99b Rahul T R              2024-05-16  1880  	dsi0: dsi@48000000 {
bfeee37402c99b Rahul T R              2024-05-16  1881  		compatible = "ti,j721e-dsi";
bfeee37402c99b Rahul T R              2024-05-16  1882  		reg = <0x0 0x04800000 0x0 0x100000>, <0x0 0x04710000 0x0 0x100>;
bfeee37402c99b Rahul T R              2024-05-16  1883  		clocks = <&k3_clks 150 1>, <&k3_clks 150 5>;
bfeee37402c99b Rahul T R              2024-05-16  1884  		clock-names = "dsi_p_clk", "dsi_sys_clk";
bfeee37402c99b Rahul T R              2024-05-16  1885  		power-domains = <&k3_pds 150 TI_SCI_PD_EXCLUSIVE>;
bfeee37402c99b Rahul T R              2024-05-16  1886  		interrupt-parent = <&gic500>;
bfeee37402c99b Rahul T R              2024-05-16  1887  		interrupts = <GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH>;
bfeee37402c99b Rahul T R              2024-05-16  1888  		phys = <&dphy2>;
bfeee37402c99b Rahul T R              2024-05-16  1889  		phy-names = "dphy";
bfeee37402c99b Rahul T R              2024-05-16  1890  		status = "disabled";
bfeee37402c99b Rahul T R              2024-05-16  1891  
bfeee37402c99b Rahul T R              2024-05-16  1892  		dsi0_ports: ports {
bfeee37402c99b Rahul T R              2024-05-16  1893  			#address-cells = <1>;
bfeee37402c99b Rahul T R              2024-05-16  1894  			#size-cells = <0>;
bfeee37402c99b Rahul T R              2024-05-16  1895  		};
bfeee37402c99b Rahul T R              2024-05-16  1896  	};
bfeee37402c99b Rahul T R              2024-05-16  1897  
cfbf17e69ae82f Nishanth Menon         2020-11-04  1898  	dss: dss@4a00000 {
76921f15acc075 Tomi Valkeinen         2020-04-22  1899  		compatible = "ti,j721e-dss";
76921f15acc075 Tomi Valkeinen         2020-04-22  1900  		reg =
76921f15acc075 Tomi Valkeinen         2020-04-22  1901  			<0x00 0x04a00000 0x00 0x10000>, /* common_m */
76921f15acc075 Tomi Valkeinen         2020-04-22  1902  			<0x00 0x04a10000 0x00 0x10000>, /* common_s0*/
76921f15acc075 Tomi Valkeinen         2020-04-22  1903  			<0x00 0x04b00000 0x00 0x10000>, /* common_s1*/
76921f15acc075 Tomi Valkeinen         2020-04-22  1904  			<0x00 0x04b10000 0x00 0x10000>, /* common_s2*/
76921f15acc075 Tomi Valkeinen         2020-04-22  1905  
76921f15acc075 Tomi Valkeinen         2020-04-22  1906  			<0x00 0x04a20000 0x00 0x10000>, /* vidl1 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1907  			<0x00 0x04a30000 0x00 0x10000>, /* vidl2 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1908  			<0x00 0x04a50000 0x00 0x10000>, /* vid1 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1909  			<0x00 0x04a60000 0x00 0x10000>, /* vid2 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1910  
76921f15acc075 Tomi Valkeinen         2020-04-22  1911  			<0x00 0x04a70000 0x00 0x10000>, /* ovr1 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1912  			<0x00 0x04a90000 0x00 0x10000>, /* ovr2 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1913  			<0x00 0x04ab0000 0x00 0x10000>, /* ovr3 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1914  			<0x00 0x04ad0000 0x00 0x10000>, /* ovr4 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1915  
76921f15acc075 Tomi Valkeinen         2020-04-22  1916  			<0x00 0x04a80000 0x00 0x10000>, /* vp1 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1917  			<0x00 0x04aa0000 0x00 0x10000>, /* vp2 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1918  			<0x00 0x04ac0000 0x00 0x10000>, /* vp3 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1919  			<0x00 0x04ae0000 0x00 0x10000>, /* vp4 */
76921f15acc075 Tomi Valkeinen         2020-04-22  1920  			<0x00 0x04af0000 0x00 0x10000>; /* wb */
76921f15acc075 Tomi Valkeinen         2020-04-22  1921  
76921f15acc075 Tomi Valkeinen         2020-04-22  1922  		reg-names = "common_m", "common_s0",
76921f15acc075 Tomi Valkeinen         2020-04-22  1923  			"common_s1", "common_s2",
76921f15acc075 Tomi Valkeinen         2020-04-22  1924  			"vidl1", "vidl2","vid1","vid2",
76921f15acc075 Tomi Valkeinen         2020-04-22  1925  			"ovr1", "ovr2", "ovr3", "ovr4",
76921f15acc075 Tomi Valkeinen         2020-04-22  1926  			"vp1", "vp2", "vp3", "vp4",
76921f15acc075 Tomi Valkeinen         2020-04-22  1927  			"wb";
76921f15acc075 Tomi Valkeinen         2020-04-22  1928  
76921f15acc075 Tomi Valkeinen         2020-04-22  1929  		clocks = <&k3_clks 152 0>,
76921f15acc075 Tomi Valkeinen         2020-04-22  1930  			 <&k3_clks 152 1>,
76921f15acc075 Tomi Valkeinen         2020-04-22  1931  			 <&k3_clks 152 4>,
76921f15acc075 Tomi Valkeinen         2020-04-22  1932  			 <&k3_clks 152 9>,
76921f15acc075 Tomi Valkeinen         2020-04-22  1933  			 <&k3_clks 152 13>;
76921f15acc075 Tomi Valkeinen         2020-04-22  1934  		clock-names = "fck", "vp1", "vp2", "vp3", "vp4";
76921f15acc075 Tomi Valkeinen         2020-04-22  1935  
76921f15acc075 Tomi Valkeinen         2020-04-22  1936  		power-domains = <&k3_pds 152 TI_SCI_PD_EXCLUSIVE>;
76921f15acc075 Tomi Valkeinen         2020-04-22  1937  
76921f15acc075 Tomi Valkeinen         2020-04-22  1938  		interrupts = <GIC_SPI 602 IRQ_TYPE_LEVEL_HIGH>,
76921f15acc075 Tomi Valkeinen         2020-04-22  1939  			     <GIC_SPI 603 IRQ_TYPE_LEVEL_HIGH>,
76921f15acc075 Tomi Valkeinen         2020-04-22  1940  			     <GIC_SPI 604 IRQ_TYPE_LEVEL_HIGH>,
76921f15acc075 Tomi Valkeinen         2020-04-22  1941  			     <GIC_SPI 605 IRQ_TYPE_LEVEL_HIGH>;
76921f15acc075 Tomi Valkeinen         2020-04-22  1942  		interrupt-names = "common_m",
76921f15acc075 Tomi Valkeinen         2020-04-22  1943  				  "common_s0",
76921f15acc075 Tomi Valkeinen         2020-04-22  1944  				  "common_s1",
76921f15acc075 Tomi Valkeinen         2020-04-22  1945  				  "common_s2";
76921f15acc075 Tomi Valkeinen         2020-04-22  1946  
76921f15acc075 Tomi Valkeinen         2020-04-22  1947  		dss_ports: ports {
76921f15acc075 Tomi Valkeinen         2020-04-22  1948  		};
76921f15acc075 Tomi Valkeinen         2020-04-22  1949  	};
76921f15acc075 Tomi Valkeinen         2020-04-22  1950  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1951  	mcasp0: mcasp@2b00000 {
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1952  		compatible = "ti,am33xx-mcasp-audio";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1953  		reg = <0x0 0x02b00000 0x0 0x2000>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1954  			<0x0 0x02b08000 0x0 0x1000>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1955  		reg-names = "mpu","dat";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1956  		interrupts = <GIC_SPI 544 IRQ_TYPE_LEVEL_HIGH>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1957  				<GIC_SPI 545 IRQ_TYPE_LEVEL_HIGH>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1958  		interrupt-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1959  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1960  		dmas = <&main_udmap 0xc400>, <&main_udmap 0x4400>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1961  		dma-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1962  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1963  		clocks = <&k3_clks 174 1>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1964  		clock-names = "fck";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1965  		power-domains = <&k3_pds 174 TI_SCI_PD_EXCLUSIVE>;
256596ad158c80 Andrew Davis           2022-10-20  1966  		status = "disabled";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1967  	};
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1968  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1969  	mcasp1: mcasp@2b10000 {
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1970  		compatible = "ti,am33xx-mcasp-audio";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1971  		reg = <0x0 0x02b10000 0x0 0x2000>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1972  			<0x0 0x02b18000 0x0 0x1000>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1973  		reg-names = "mpu","dat";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1974  		interrupts = <GIC_SPI 546 IRQ_TYPE_LEVEL_HIGH>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1975  				<GIC_SPI 547 IRQ_TYPE_LEVEL_HIGH>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1976  		interrupt-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1977  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1978  		dmas = <&main_udmap 0xc401>, <&main_udmap 0x4401>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1979  		dma-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1980  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1981  		clocks = <&k3_clks 175 1>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1982  		clock-names = "fck";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1983  		power-domains = <&k3_pds 175 TI_SCI_PD_EXCLUSIVE>;
256596ad158c80 Andrew Davis           2022-10-20  1984  		status = "disabled";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1985  	};
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1986  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1987  	mcasp2: mcasp@2b20000 {
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1988  		compatible = "ti,am33xx-mcasp-audio";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1989  		reg = <0x0 0x02b20000 0x0 0x2000>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1990  			<0x0 0x02b28000 0x0 0x1000>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1991  		reg-names = "mpu","dat";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1992  		interrupts = <GIC_SPI 548 IRQ_TYPE_LEVEL_HIGH>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1993  				<GIC_SPI 549 IRQ_TYPE_LEVEL_HIGH>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1994  		interrupt-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1995  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1996  		dmas = <&main_udmap 0xc402>, <&main_udmap 0x4402>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1997  		dma-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1998  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  1999  		clocks = <&k3_clks 176 1>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2000  		clock-names = "fck";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2001  		power-domains = <&k3_pds 176 TI_SCI_PD_EXCLUSIVE>;
256596ad158c80 Andrew Davis           2022-10-20  2002  		status = "disabled";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2003  	};
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2004  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2005  	mcasp3: mcasp@2b30000 {
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2006  		compatible = "ti,am33xx-mcasp-audio";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2007  		reg = <0x0 0x02b30000 0x0 0x2000>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2008  			<0x0 0x02b38000 0x0 0x1000>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2009  		reg-names = "mpu","dat";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2010  		interrupts = <GIC_SPI 550 IRQ_TYPE_LEVEL_HIGH>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2011  				<GIC_SPI 551 IRQ_TYPE_LEVEL_HIGH>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2012  		interrupt-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2013  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2014  		dmas = <&main_udmap 0xc500>, <&main_udmap 0x4500>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2015  		dma-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2016  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2017  		clocks = <&k3_clks 177 1>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2018  		clock-names = "fck";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2019  		power-domains = <&k3_pds 177 TI_SCI_PD_EXCLUSIVE>;
256596ad158c80 Andrew Davis           2022-10-20  2020  		status = "disabled";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2021  	};
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2022  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2023  	mcasp4: mcasp@2b40000 {
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2024  		compatible = "ti,am33xx-mcasp-audio";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2025  		reg = <0x0 0x02b40000 0x0 0x2000>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2026  			<0x0 0x02b48000 0x0 0x1000>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2027  		reg-names = "mpu","dat";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2028  		interrupts = <GIC_SPI 552 IRQ_TYPE_LEVEL_HIGH>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2029  				<GIC_SPI 553 IRQ_TYPE_LEVEL_HIGH>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2030  		interrupt-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2031  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2032  		dmas = <&main_udmap 0xc501>, <&main_udmap 0x4501>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2033  		dma-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2034  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2035  		clocks = <&k3_clks 178 1>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2036  		clock-names = "fck";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2037  		power-domains = <&k3_pds 178 TI_SCI_PD_EXCLUSIVE>;
256596ad158c80 Andrew Davis           2022-10-20  2038  		status = "disabled";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2039  	};
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2040  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2041  	mcasp5: mcasp@2b50000 {
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2042  		compatible = "ti,am33xx-mcasp-audio";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2043  		reg = <0x0 0x02b50000 0x0 0x2000>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2044  			<0x0 0x02b58000 0x0 0x1000>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2045  		reg-names = "mpu","dat";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2046  		interrupts = <GIC_SPI 554 IRQ_TYPE_LEVEL_HIGH>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2047  				<GIC_SPI 555 IRQ_TYPE_LEVEL_HIGH>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2048  		interrupt-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2049  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2050  		dmas = <&main_udmap 0xc502>, <&main_udmap 0x4502>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2051  		dma-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2052  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2053  		clocks = <&k3_clks 179 1>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2054  		clock-names = "fck";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2055  		power-domains = <&k3_pds 179 TI_SCI_PD_EXCLUSIVE>;
256596ad158c80 Andrew Davis           2022-10-20  2056  		status = "disabled";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2057  	};
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2058  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2059  	mcasp6: mcasp@2b60000 {
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2060  		compatible = "ti,am33xx-mcasp-audio";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2061  		reg = <0x0 0x02b60000 0x0 0x2000>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2062  			<0x0 0x02b68000 0x0 0x1000>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2063  		reg-names = "mpu","dat";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2064  		interrupts = <GIC_SPI 556 IRQ_TYPE_LEVEL_HIGH>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2065  				<GIC_SPI 557 IRQ_TYPE_LEVEL_HIGH>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2066  		interrupt-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2067  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2068  		dmas = <&main_udmap 0xc503>, <&main_udmap 0x4503>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2069  		dma-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2070  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2071  		clocks = <&k3_clks 180 1>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2072  		clock-names = "fck";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2073  		power-domains = <&k3_pds 180 TI_SCI_PD_EXCLUSIVE>;
256596ad158c80 Andrew Davis           2022-10-20  2074  		status = "disabled";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2075  	};
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2076  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2077  	mcasp7: mcasp@2b70000 {
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2078  		compatible = "ti,am33xx-mcasp-audio";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2079  		reg = <0x0 0x02b70000 0x0 0x2000>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2080  			<0x0 0x02b78000 0x0 0x1000>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2081  		reg-names = "mpu","dat";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2082  		interrupts = <GIC_SPI 558 IRQ_TYPE_LEVEL_HIGH>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2083  				<GIC_SPI 559 IRQ_TYPE_LEVEL_HIGH>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2084  		interrupt-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2085  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2086  		dmas = <&main_udmap 0xc504>, <&main_udmap 0x4504>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2087  		dma-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2088  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2089  		clocks = <&k3_clks 181 1>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2090  		clock-names = "fck";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2091  		power-domains = <&k3_pds 181 TI_SCI_PD_EXCLUSIVE>;
256596ad158c80 Andrew Davis           2022-10-20  2092  		status = "disabled";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2093  	};
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2094  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2095  	mcasp8: mcasp@2b80000 {
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2096  		compatible = "ti,am33xx-mcasp-audio";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2097  		reg = <0x0 0x02b80000 0x0 0x2000>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2098  			<0x0 0x02b88000 0x0 0x1000>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2099  		reg-names = "mpu","dat";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2100  		interrupts = <GIC_SPI 560 IRQ_TYPE_LEVEL_HIGH>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2101  				<GIC_SPI 561 IRQ_TYPE_LEVEL_HIGH>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2102  		interrupt-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2103  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2104  		dmas = <&main_udmap 0xc505>, <&main_udmap 0x4505>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2105  		dma-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2106  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2107  		clocks = <&k3_clks 182 1>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2108  		clock-names = "fck";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2109  		power-domains = <&k3_pds 182 TI_SCI_PD_EXCLUSIVE>;
256596ad158c80 Andrew Davis           2022-10-20  2110  		status = "disabled";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2111  	};
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2112  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2113  	mcasp9: mcasp@2b90000 {
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2114  		compatible = "ti,am33xx-mcasp-audio";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2115  		reg = <0x0 0x02b90000 0x0 0x2000>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2116  			<0x0 0x02b98000 0x0 0x1000>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2117  		reg-names = "mpu","dat";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2118  		interrupts = <GIC_SPI 562 IRQ_TYPE_LEVEL_HIGH>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2119  				<GIC_SPI 563 IRQ_TYPE_LEVEL_HIGH>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2120  		interrupt-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2121  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2122  		dmas = <&main_udmap 0xc506>, <&main_udmap 0x4506>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2123  		dma-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2124  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2125  		clocks = <&k3_clks 183 1>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2126  		clock-names = "fck";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2127  		power-domains = <&k3_pds 183 TI_SCI_PD_EXCLUSIVE>;
256596ad158c80 Andrew Davis           2022-10-20  2128  		status = "disabled";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2129  	};
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2130  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2131  	mcasp10: mcasp@2ba0000 {
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2132  		compatible = "ti,am33xx-mcasp-audio";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2133  		reg = <0x0 0x02ba0000 0x0 0x2000>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2134  			<0x0 0x02ba8000 0x0 0x1000>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2135  		reg-names = "mpu","dat";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2136  		interrupts = <GIC_SPI 564 IRQ_TYPE_LEVEL_HIGH>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2137  				<GIC_SPI 565 IRQ_TYPE_LEVEL_HIGH>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2138  		interrupt-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2139  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2140  		dmas = <&main_udmap 0xc507>, <&main_udmap 0x4507>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2141  		dma-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2142  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2143  		clocks = <&k3_clks 184 1>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2144  		clock-names = "fck";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2145  		power-domains = <&k3_pds 184 TI_SCI_PD_EXCLUSIVE>;
256596ad158c80 Andrew Davis           2022-10-20  2146  		status = "disabled";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2147  	};
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2148  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2149  	mcasp11: mcasp@2bb0000 {
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2150  		compatible = "ti,am33xx-mcasp-audio";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2151  		reg = <0x0 0x02bb0000 0x0 0x2000>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2152  			<0x0 0x02bb8000 0x0 0x1000>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2153  		reg-names = "mpu","dat";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2154  		interrupts = <GIC_SPI 566 IRQ_TYPE_LEVEL_HIGH>,
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2155  				<GIC_SPI 567 IRQ_TYPE_LEVEL_HIGH>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2156  		interrupt-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2157  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2158  		dmas = <&main_udmap 0xc508>, <&main_udmap 0x4508>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2159  		dma-names = "tx", "rx";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2160  
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2161  		clocks = <&k3_clks 185 1>;
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2162  		clock-names = "fck";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2163  		power-domains = <&k3_pds 185 TI_SCI_PD_EXCLUSIVE>;
256596ad158c80 Andrew Davis           2022-10-20  2164  		status = "disabled";
1c4d35265fb294 Peter Ujfalusi         2020-01-23  2165  	};
cae809434da104 Tero Kristo            2019-09-26  2166  
cae809434da104 Tero Kristo            2019-09-26  2167  	watchdog0: watchdog@2200000 {
cae809434da104 Tero Kristo            2019-09-26  2168  		compatible = "ti,j7-rti-wdt";
cae809434da104 Tero Kristo            2019-09-26  2169  		reg = <0x0 0x2200000 0x0 0x100>;
cae809434da104 Tero Kristo            2019-09-26  2170  		clocks = <&k3_clks 252 1>;
cae809434da104 Tero Kristo            2019-09-26  2171  		power-domains = <&k3_pds 252 TI_SCI_PD_EXCLUSIVE>;
cae809434da104 Tero Kristo            2019-09-26  2172  		assigned-clocks = <&k3_clks 252 1>;
cae809434da104 Tero Kristo            2019-09-26  2173  		assigned-clock-parents = <&k3_clks 252 5>;
cae809434da104 Tero Kristo            2019-09-26  2174  	};
cae809434da104 Tero Kristo            2019-09-26  2175  
cae809434da104 Tero Kristo            2019-09-26  2176  	watchdog1: watchdog@2210000 {
cae809434da104 Tero Kristo            2019-09-26  2177  		compatible = "ti,j7-rti-wdt";
cae809434da104 Tero Kristo            2019-09-26  2178  		reg = <0x0 0x2210000 0x0 0x100>;
cae809434da104 Tero Kristo            2019-09-26  2179  		clocks = <&k3_clks 253 1>;
cae809434da104 Tero Kristo            2019-09-26  2180  		power-domains = <&k3_pds 253 TI_SCI_PD_EXCLUSIVE>;
cae809434da104 Tero Kristo            2019-09-26  2181  		assigned-clocks = <&k3_clks 253 1>;
cae809434da104 Tero Kristo            2019-09-26  2182  		assigned-clock-parents = <&k3_clks 253 5>;
cae809434da104 Tero Kristo            2019-09-26  2183  	};
eb9a2a637ae5b2 Suman Anna             2020-08-25  2184  
df445ff9de8931 Suman Anna             2020-10-28  2185  	main_r5fss0: r5fss@5c00000 {
df445ff9de8931 Suman Anna             2020-10-28  2186  		compatible = "ti,j721e-r5fss";
8fd161e27608c7 Suman Anna             2024-06-10  2187  		ti,cluster-mode = <0>;
df445ff9de8931 Suman Anna             2020-10-28  2188  		#address-cells = <1>;
df445ff9de8931 Suman Anna             2020-10-28  2189  		#size-cells = <1>;
df445ff9de8931 Suman Anna             2020-10-28  2190  		ranges = <0x5c00000 0x00 0x5c00000 0x20000>,
df445ff9de8931 Suman Anna             2020-10-28  2191  			 <0x5d00000 0x00 0x5d00000 0x20000>;
df445ff9de8931 Suman Anna             2020-10-28  2192  		power-domains = <&k3_pds 243 TI_SCI_PD_EXCLUSIVE>;
df445ff9de8931 Suman Anna             2020-10-28  2193  
df445ff9de8931 Suman Anna             2020-10-28  2194  		main_r5fss0_core0: r5f@5c00000 {
df445ff9de8931 Suman Anna             2020-10-28  2195  			compatible = "ti,j721e-r5f";
df445ff9de8931 Suman Anna             2020-10-28  2196  			reg = <0x5c00000 0x00008000>,
df445ff9de8931 Suman Anna             2020-10-28  2197  			      <0x5c10000 0x00008000>;
df445ff9de8931 Suman Anna             2020-10-28  2198  			reg-names = "atcm", "btcm";
df445ff9de8931 Suman Anna             2020-10-28  2199  			ti,sci = <&dmsc>;
df445ff9de8931 Suman Anna             2020-10-28  2200  			ti,sci-dev-id = <245>;
df445ff9de8931 Suman Anna             2020-10-28  2201  			ti,sci-proc-ids = <0x06 0xff>;
df445ff9de8931 Suman Anna             2020-10-28  2202  			resets = <&k3_reset 245 1>;
df445ff9de8931 Suman Anna             2020-10-28  2203  			firmware-name = "j7-main-r5f0_0-fw";
df445ff9de8931 Suman Anna             2020-10-28  2204  			ti,atcm-enable = <1>;
df445ff9de8931 Suman Anna             2020-10-28  2205  			ti,btcm-enable = <1>;
df445ff9de8931 Suman Anna             2020-10-28  2206  			ti,loczrama = <1>;
df445ff9de8931 Suman Anna             2020-10-28  2207  		};
df445ff9de8931 Suman Anna             2020-10-28  2208  
df445ff9de8931 Suman Anna             2020-10-28  2209  		main_r5fss0_core1: r5f@5d00000 {
df445ff9de8931 Suman Anna             2020-10-28  2210  			compatible = "ti,j721e-r5f";
df445ff9de8931 Suman Anna             2020-10-28  2211  			reg = <0x5d00000 0x00008000>,
df445ff9de8931 Suman Anna             2020-10-28  2212  			      <0x5d10000 0x00008000>;
df445ff9de8931 Suman Anna             2020-10-28  2213  			reg-names = "atcm", "btcm";
df445ff9de8931 Suman Anna             2020-10-28  2214  			ti,sci = <&dmsc>;
df445ff9de8931 Suman Anna             2020-10-28  2215  			ti,sci-dev-id = <246>;
df445ff9de8931 Suman Anna             2020-10-28  2216  			ti,sci-proc-ids = <0x07 0xff>;
df445ff9de8931 Suman Anna             2020-10-28  2217  			resets = <&k3_reset 246 1>;
df445ff9de8931 Suman Anna             2020-10-28  2218  			firmware-name = "j7-main-r5f0_1-fw";
df445ff9de8931 Suman Anna             2020-10-28  2219  			ti,atcm-enable = <1>;
df445ff9de8931 Suman Anna             2020-10-28  2220  			ti,btcm-enable = <1>;
df445ff9de8931 Suman Anna             2020-10-28  2221  			ti,loczrama = <1>;
df445ff9de8931 Suman Anna             2020-10-28  2222  		};
df445ff9de8931 Suman Anna             2020-10-28  2223  	};
df445ff9de8931 Suman Anna             2020-10-28  2224  
df445ff9de8931 Suman Anna             2020-10-28  2225  	main_r5fss1: r5fss@5e00000 {
df445ff9de8931 Suman Anna             2020-10-28  2226  		compatible = "ti,j721e-r5fss";
8fd161e27608c7 Suman Anna             2024-06-10  2227  		ti,cluster-mode = <0>;
df445ff9de8931 Suman Anna             2020-10-28  2228  		#address-cells = <1>;
df445ff9de8931 Suman Anna             2020-10-28  2229  		#size-cells = <1>;
df445ff9de8931 Suman Anna             2020-10-28  2230  		ranges = <0x5e00000 0x00 0x5e00000 0x20000>,
df445ff9de8931 Suman Anna             2020-10-28  2231  			 <0x5f00000 0x00 0x5f00000 0x20000>;
df445ff9de8931 Suman Anna             2020-10-28  2232  		power-domains = <&k3_pds 244 TI_SCI_PD_EXCLUSIVE>;
df445ff9de8931 Suman Anna             2020-10-28  2233  
df445ff9de8931 Suman Anna             2020-10-28  2234  		main_r5fss1_core0: r5f@5e00000 {
df445ff9de8931 Suman Anna             2020-10-28  2235  			compatible = "ti,j721e-r5f";
df445ff9de8931 Suman Anna             2020-10-28  2236  			reg = <0x5e00000 0x00008000>,
df445ff9de8931 Suman Anna             2020-10-28  2237  			      <0x5e10000 0x00008000>;
df445ff9de8931 Suman Anna             2020-10-28  2238  			reg-names = "atcm", "btcm";
df445ff9de8931 Suman Anna             2020-10-28  2239  			ti,sci = <&dmsc>;
df445ff9de8931 Suman Anna             2020-10-28  2240  			ti,sci-dev-id = <247>;
df445ff9de8931 Suman Anna             2020-10-28  2241  			ti,sci-proc-ids = <0x08 0xff>;
df445ff9de8931 Suman Anna             2020-10-28  2242  			resets = <&k3_reset 247 1>;
df445ff9de8931 Suman Anna             2020-10-28  2243  			firmware-name = "j7-main-r5f1_0-fw";
df445ff9de8931 Suman Anna             2020-10-28  2244  			ti,atcm-enable = <1>;
df445ff9de8931 Suman Anna             2020-10-28  2245  			ti,btcm-enable = <1>;
df445ff9de8931 Suman Anna             2020-10-28  2246  			ti,loczrama = <1>;
df445ff9de8931 Suman Anna             2020-10-28  2247  		};
df445ff9de8931 Suman Anna             2020-10-28  2248  
df445ff9de8931 Suman Anna             2020-10-28  2249  		main_r5fss1_core1: r5f@5f00000 {
df445ff9de8931 Suman Anna             2020-10-28  2250  			compatible = "ti,j721e-r5f";
df445ff9de8931 Suman Anna             2020-10-28  2251  			reg = <0x5f00000 0x00008000>,
df445ff9de8931 Suman Anna             2020-10-28  2252  			      <0x5f10000 0x00008000>;
df445ff9de8931 Suman Anna             2020-10-28  2253  			reg-names = "atcm", "btcm";
df445ff9de8931 Suman Anna             2020-10-28  2254  			ti,sci = <&dmsc>;
df445ff9de8931 Suman Anna             2020-10-28  2255  			ti,sci-dev-id = <248>;
df445ff9de8931 Suman Anna             2020-10-28  2256  			ti,sci-proc-ids = <0x09 0xff>;
df445ff9de8931 Suman Anna             2020-10-28  2257  			resets = <&k3_reset 248 1>;
df445ff9de8931 Suman Anna             2020-10-28  2258  			firmware-name = "j7-main-r5f1_1-fw";
df445ff9de8931 Suman Anna             2020-10-28  2259  			ti,atcm-enable = <1>;
df445ff9de8931 Suman Anna             2020-10-28  2260  			ti,btcm-enable = <1>;
df445ff9de8931 Suman Anna             2020-10-28  2261  			ti,loczrama = <1>;
df445ff9de8931 Suman Anna             2020-10-28  2262  		};
df445ff9de8931 Suman Anna             2020-10-28  2263  	};
df445ff9de8931 Suman Anna             2020-10-28  2264  
eb9a2a637ae5b2 Suman Anna             2020-08-25  2265  	c66_0: dsp@4d80800000 {
eb9a2a637ae5b2 Suman Anna             2020-08-25  2266  		compatible = "ti,j721e-c66-dsp";
eb9a2a637ae5b2 Suman Anna             2020-08-25  2267  		reg = <0x4d 0x80800000 0x00 0x00048000>,
eb9a2a637ae5b2 Suman Anna             2020-08-25  2268  		      <0x4d 0x80e00000 0x00 0x00008000>,
eb9a2a637ae5b2 Suman Anna             2020-08-25  2269  		      <0x4d 0x80f00000 0x00 0x00008000>;
eb9a2a637ae5b2 Suman Anna             2020-08-25  2270  		reg-names = "l2sram", "l1pram", "l1dram";
eb9a2a637ae5b2 Suman Anna             2020-08-25  2271  		ti,sci = <&dmsc>;
eb9a2a637ae5b2 Suman Anna             2020-08-25  2272  		ti,sci-dev-id = <142>;
eb9a2a637ae5b2 Suman Anna             2020-08-25  2273  		ti,sci-proc-ids = <0x03 0xff>;
eb9a2a637ae5b2 Suman Anna             2020-08-25  2274  		resets = <&k3_reset 142 1>;
eb9a2a637ae5b2 Suman Anna             2020-08-25  2275  		firmware-name = "j7-c66_0-fw";
00ae4c39cd16ef Andrew Davis           2023-08-09  2276  		status = "disabled";
eb9a2a637ae5b2 Suman Anna             2020-08-25  2277  	};
eb9a2a637ae5b2 Suman Anna             2020-08-25  2278  
eb9a2a637ae5b2 Suman Anna             2020-08-25  2279  	c66_1: dsp@4d81800000 {
eb9a2a637ae5b2 Suman Anna             2020-08-25  2280  		compatible = "ti,j721e-c66-dsp";
eb9a2a637ae5b2 Suman Anna             2020-08-25  2281  		reg = <0x4d 0x81800000 0x00 0x00048000>,
eb9a2a637ae5b2 Suman Anna             2020-08-25  2282  		      <0x4d 0x81e00000 0x00 0x00008000>,
eb9a2a637ae5b2 Suman Anna             2020-08-25  2283  		      <0x4d 0x81f00000 0x00 0x00008000>;
eb9a2a637ae5b2 Suman Anna             2020-08-25  2284  		reg-names = "l2sram", "l1pram", "l1dram";
eb9a2a637ae5b2 Suman Anna             2020-08-25  2285  		ti,sci = <&dmsc>;
eb9a2a637ae5b2 Suman Anna             2020-08-25  2286  		ti,sci-dev-id = <143>;
eb9a2a637ae5b2 Suman Anna             2020-08-25  2287  		ti,sci-proc-ids = <0x04 0xff>;
eb9a2a637ae5b2 Suman Anna             2020-08-25  2288  		resets = <&k3_reset 143 1>;
eb9a2a637ae5b2 Suman Anna             2020-08-25  2289  		firmware-name = "j7-c66_1-fw";
00ae4c39cd16ef Andrew Davis           2023-08-09  2290  		status = "disabled";
eb9a2a637ae5b2 Suman Anna             2020-08-25  2291  	};
804a4cc7fe3cc7 Suman Anna             2020-08-25  2292  
804a4cc7fe3cc7 Suman Anna             2020-08-25  2293  	c71_0: dsp@64800000 {
804a4cc7fe3cc7 Suman Anna             2020-08-25  2294  		compatible = "ti,j721e-c71-dsp";
804a4cc7fe3cc7 Suman Anna             2020-08-25  2295  		reg = <0x00 0x64800000 0x00 0x00080000>,
804a4cc7fe3cc7 Suman Anna             2020-08-25  2296  		      <0x00 0x64e00000 0x00 0x0000c000>;
804a4cc7fe3cc7 Suman Anna             2020-08-25  2297  		reg-names = "l2sram", "l1dram";
804a4cc7fe3cc7 Suman Anna             2020-08-25  2298  		ti,sci = <&dmsc>;
804a4cc7fe3cc7 Suman Anna             2020-08-25  2299  		ti,sci-dev-id = <15>;
804a4cc7fe3cc7 Suman Anna             2020-08-25  2300  		ti,sci-proc-ids = <0x30 0xff>;
804a4cc7fe3cc7 Suman Anna             2020-08-25  2301  		resets = <&k3_reset 15 1>;
804a4cc7fe3cc7 Suman Anna             2020-08-25  2302  		firmware-name = "j7-c71_0-fw";
35dba715971733 Andrew Davis           2023-08-09  2303  		status = "disabled";
804a4cc7fe3cc7 Suman Anna             2020-08-25  2304  	};
4c842af368398a Suman Anna             2021-03-04  2305  
9b65e4338f099c Grygorii Strashko      2024-06-13 @2306  	timesync_router: pinctrl@a40000 {

:::::: The code at line 2306 was first introduced by commit
:::::: 9b65e4338f099cf7dfab2386fa10c584b805c89d arm64: dts: ti: k3-j721e-main: add timesync_router node

:::::: TO: Grygorii Strashko <grygorii.strashko@ti.com>
:::::: CC: Udit Kumar <u-kumar1@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
