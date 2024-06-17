Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB2D8153593
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 14:23:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718634231; cv=none; b=V6088ghRmPLGUfN2OJMsySPnQ8THflNY3Kdb4BOF08nS9FSE/HGnJQwMxrCRe+JZDf8Xs06ahXIDHCq6dPk7Z18j+IEx22NG/7rz9ea2nIcdOJ0lmGUQCfmsDJwlNe0MmOJjYCiAEwP20rxIi0o6V8CdDS/G59Qd9Hf13q7f6ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718634231; c=relaxed/simple;
	bh=1+N3HnlVYPqzul7xVkCSdqhYaQYgxdYBYkPwClKiIK8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pCqUS8ofjSbC5KBDddRv1/wScS0UHhj9n+XxDfoi152cZ/E3wza7t5N24S6/6PxPCAL9lMAkYs/9v9XNPh7/xl5zheXzYWT9nbtFrdZYAHQh+51/ZiN9d2QxMXmG68agnlpWiOLlaUQfO/T7S0xtIS6ZR1DHUb7Wxm4UivZG3Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ONd6P2Yy; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ONd6P2Yy"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718634223; x=1750170223;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1+N3HnlVYPqzul7xVkCSdqhYaQYgxdYBYkPwClKiIK8=;
  b=ONd6P2YyZRXYKULqFSz+8vwsKCpu8wVeHl2MjeEZvHJmzsJwDyAiwOyM
   0urlY5yW+XBaOw5hxAxdlbECG6hIzR4bGkDCraQctuiKB+Ca0863mM1WK
   WDP546HlYdR2lS2Gbc9x4JfzA3QoVDrFVhAmWvP6LaGA3NXim9oxjIEgX
   pKRljoFKujfs/97mDnUSHp3Cad5n0CpIoPBWjiWLHb6XSz18UMapQ5QfU
   qqL4BDJRo5CgCPJendUkpnZhMlvJTTI1bxc6jqteW49OeaTA03Es6SMow
   ZGVaeW2nNT4EAWSgZIM35Kc7IpW9S5AE7OCMB3XeeMdzMHVDGARviu/3p
   Q==;
X-CSE-ConnectionGUID: LIqI5YCkSm6tFIp1YEuUEQ==
X-CSE-MsgGUID: R72rWQArQt2y3+xFF+aJOQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11105"; a="26856738"
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="26856738"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 07:23:42 -0700
X-CSE-ConnectionGUID: fIQ3lYbvQYC5CYz+4Tu4Cw==
X-CSE-MsgGUID: lfYBJ3zpSs+ncOyJjNzU7g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,244,1712646000"; 
   d="scan'208";a="41307287"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 17 Jun 2024 07:23:39 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJDGj-0004OK-21;
	Mon, 17 Jun 2024 14:23:37 +0000
Date: Mon, 17 Jun 2024 22:22:19 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Chintan Vankar <c-vankar@ti.com>
Subject: [ti:ti-rt-linux-6.6.y 35/39]
 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi:2700.34-2709.4: Warning
 (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202406172225.62pJ2ERR-lkp@intel.com>
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
commit: 970fea82f6e21cfeba460d92070134e3caf9f6b6 [35/39] arm64: dts: ti: k3-j784s4-evm: Add MCU CPSW CPTS PPS support
config: arm64-randconfig-003-20240616 (https://download.01.org/0day-ci/archive/20240617/202406172225.62pJ2ERR-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 78ee473784e5ef6f0b19ce4cb111fb6e4d23c6b2)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240617/202406172225.62pJ2ERR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406172225.62pJ2ERR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi:2700.34-2709.4: Warning (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property

vim +2700 arch/arm64/boot/dts/ti/k3-j784s4-main.dtsi

4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19    22  
4664ebd8346adaa Apurva Nandan       2023-01-12    23  &cbass_main {
4664ebd8346adaa Apurva Nandan       2023-01-12    24  	msmc_ram: sram@70000000 {
4664ebd8346adaa Apurva Nandan       2023-01-12    25  		compatible = "mmio-sram";
4664ebd8346adaa Apurva Nandan       2023-01-12    26  		reg = <0x00 0x70000000 0x00 0x800000>;
4664ebd8346adaa Apurva Nandan       2023-01-12    27  		#address-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12    28  		#size-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12    29  		ranges = <0x00 0x00 0x70000000 0x800000>;
4664ebd8346adaa Apurva Nandan       2023-01-12    30  
4664ebd8346adaa Apurva Nandan       2023-01-12    31  		atf-sram@0 {
4664ebd8346adaa Apurva Nandan       2023-01-12    32  			reg = <0x00 0x20000>;
4664ebd8346adaa Apurva Nandan       2023-01-12    33  		};
4664ebd8346adaa Apurva Nandan       2023-01-12    34  
4664ebd8346adaa Apurva Nandan       2023-01-12    35  		tifs-sram@1f0000 {
4664ebd8346adaa Apurva Nandan       2023-01-12    36  			reg = <0x1f0000 0x10000>;
4664ebd8346adaa Apurva Nandan       2023-01-12    37  		};
4664ebd8346adaa Apurva Nandan       2023-01-12    38  
4664ebd8346adaa Apurva Nandan       2023-01-12    39  		l3cache-sram@200000 {
4664ebd8346adaa Apurva Nandan       2023-01-12    40  			reg = <0x200000 0x200000>;
4664ebd8346adaa Apurva Nandan       2023-01-12    41  		};
4664ebd8346adaa Apurva Nandan       2023-01-12    42  	};
4664ebd8346adaa Apurva Nandan       2023-01-12    43  
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    44  	main_ehrpwm0: pwm@3000000 {
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    45  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    46  		#pwm-cells = <3>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    47  		reg = <0x00 0x3000000 0x00 0x100>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    48  		clocks = <&ehrpwm_tbclk 0>, <&k3_clks 219 0>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    49  		clock-names = "tbclk", "fck";
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    50  		power-domains = <&k3_pds 219 TI_SCI_PD_EXCLUSIVE>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    51  		status = "disabled";
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    52  	};
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    53  
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    54  	main_ehrpwm1: pwm@3010000 {
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    55  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    56  		#pwm-cells = <3>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    57  		reg = <0x00 0x3010000 0x00 0x100>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    58  		clocks = <&ehrpwm_tbclk 1>, <&k3_clks 220 0>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    59  		clock-names = "tbclk", "fck";
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    60  		power-domains = <&k3_pds 220 TI_SCI_PD_EXCLUSIVE>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    61  		status = "disabled";
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    62  	};
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    63  
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    64  	main_ehrpwm2: pwm@3020000 {
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    65  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    66  		#pwm-cells = <3>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    67  		reg = <0x00 0x3020000 0x00 0x100>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    68  		clocks = <&ehrpwm_tbclk 2>, <&k3_clks 221 0>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    69  		clock-names = "tbclk", "fck";
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    70  		power-domains = <&k3_pds 221 TI_SCI_PD_EXCLUSIVE>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    71  		status = "disabled";
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    72  	};
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    73  
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    74  	main_ehrpwm3: pwm@3030000 {
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    75  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    76  		#pwm-cells = <3>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    77  		reg = <0x00 0x3030000 0x00 0x100>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    78  		clocks = <&ehrpwm_tbclk 3>, <&k3_clks 222 0>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    79  		clock-names = "tbclk", "fck";
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    80  		power-domains = <&k3_pds 222 TI_SCI_PD_EXCLUSIVE>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    81  		status = "disabled";
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    82  	};
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    83  
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    84  	main_ehrpwm4: pwm@3040000 {
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    85  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    86  		#pwm-cells = <3>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    87  		reg = <0x00 0x3040000 0x00 0x100>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    88  		clocks = <&ehrpwm_tbclk 4>, <&k3_clks 223 0>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    89  		clock-names = "tbclk", "fck";
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    90  		power-domains = <&k3_pds 223 TI_SCI_PD_EXCLUSIVE>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    91  		status = "disabled";
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    92  	};
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    93  
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    94  	main_ehrpwm5: pwm@3050000 {
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    95  		compatible = "ti,am654-ehrpwm", "ti,am3352-ehrpwm";
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    96  		#pwm-cells = <3>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    97  		reg = <0x00 0x3050000 0x00 0x100>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    98  		clocks = <&ehrpwm_tbclk 5>, <&k3_clks 224 0>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03    99  		clock-names = "tbclk", "fck";
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03   100  		power-domains = <&k3_pds 224 TI_SCI_PD_EXCLUSIVE>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03   101  		status = "disabled";
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03   102  	};
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03   103  
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   104  	scm_conf: bus@100000 {
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   105  		compatible = "simple-bus";
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   106  		reg = <0x00 0x00100000 0x00 0x1c000>;
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   107  		#address-cells = <1>;
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   108  		#size-cells = <1>;
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   109  		ranges = <0x00 0x00 0x00100000 0x1c000>;
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   110  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24   111  		cpsw1_phy_gmii_sel: phy@4034 {
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24   112  			compatible = "ti,am654-phy-gmii-sel";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24   113  			reg = <0x4034 0x4>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24   114  			#phy-cells = <1>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24   115  		};
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24   116  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24   117  		cpsw0_phy_gmii_sel: phy@4044 {
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24   118  			compatible = "ti,j784s4-cpsw9g-phy-gmii-sel";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24   119  			reg = <0x4044 0x20>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24   120  			#phy-cells = <1>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24   121  			ti,qsgmii-main-ports = <7>, <7>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24   122  		};
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24   123  
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   124  		pcie0_ctrl: pcie0-ctrl@4070 {
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   125  			compatible = "ti,j784s4-pcie-ctrl", "syscon";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   126  			reg = <0x4070 0x4>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   127  		};
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   128  
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   129  		pcie1_ctrl: pcie1-ctrl@4074 {
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   130  			compatible = "ti,j784s4-pcie-ctrl", "syscon";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   131  			reg = <0x4074 0x4>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   132  		};
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   133  
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   134  		pcie2_ctrl: pcie2-ctrl@4078 {
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   135  			compatible = "ti,j784s4-pcie-ctrl", "syscon";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   136  			reg = <0x4078 0x4>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   137  		};
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   138  
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   139  		pcie3_ctrl: pcie3-ctrl@407c {
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   140  			compatible = "ti,j784s4-pcie-ctrl", "syscon";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   141  			reg = <0x407c 0x4>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   142  		};
3d8a27b48060505 Siddharth Vadapalli 2024-05-25   143  
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   144  		serdes_ln_ctrl: mux-controller@4080 {
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   145  			compatible = "reg-mux";
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   146  			reg = <0x00004080 0x30>;
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   147  			#mux-control-cells = <1>;
f998e5f38561738 Chintan Vankar      2024-05-24   148  			mux-reg-masks = <0x0 0x3>, <0x4 0x3>, /* SERDES0 lane0/1 select */
f998e5f38561738 Chintan Vankar      2024-05-24   149  					<0x8 0x3>, <0xc 0x3>, /* SERDES0 lane2/3 select */
f998e5f38561738 Chintan Vankar      2024-05-24   150  					<0x10 0x3>, <0x14 0x3>, /* SERDES1 lane0/1 select */
f998e5f38561738 Chintan Vankar      2024-05-24   151  					<0x18 0x3>, <0x1c 0x3>, /* SERDES1 lane2/3 select */
f998e5f38561738 Chintan Vankar      2024-05-24   152  					<0x20 0x3>, <0x24 0x3>, /* SERDES2 lane0/1 select */
f998e5f38561738 Chintan Vankar      2024-05-24   153  					<0x28 0x3>, <0x2c 0x3>; /* SERDES2 lane2/3 select */
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   154  			idle-states = <J784S4_SERDES0_LANE0_PCIE1_LANE0>,
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   155  				      <J784S4_SERDES0_LANE1_PCIE1_LANE1>,
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   156  				      <J784S4_SERDES0_LANE2_IP3_UNUSED>,
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   157  				      <J784S4_SERDES0_LANE3_USB>,
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   158  				      <J784S4_SERDES1_LANE0_PCIE0_LANE0>,
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   159  				      <J784S4_SERDES1_LANE1_PCIE0_LANE1>,
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   160  				      <J784S4_SERDES1_LANE2_PCIE0_LANE2>,
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   161  				      <J784S4_SERDES1_LANE3_PCIE0_LANE3>,
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   162  				      <J784S4_SERDES2_LANE0_IP2_UNUSED>,
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   163  				      <J784S4_SERDES2_LANE1_IP2_UNUSED>,
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   164  				      <J784S4_SERDES2_LANE2_QSGMII_LANE1>,
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   165  				      <J784S4_SERDES2_LANE3_QSGMII_LANE2>,
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   166  				      <J784S4_SERDES4_LANE0_EDP_LANE0>,
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   167  				      <J784S4_SERDES4_LANE1_EDP_LANE1>,
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   168  				      <J784S4_SERDES4_LANE2_EDP_LANE2>,
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   169  				      <J784S4_SERDES4_LANE3_EDP_LANE3>;
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   170  		};
37ad8d7220ca0fa Matt Ranostay       2024-05-14   171  
37ad8d7220ca0fa Matt Ranostay       2024-05-14   172  		usb_serdes_mux: mux-controller@4000 {
37ad8d7220ca0fa Matt Ranostay       2024-05-14   173  			compatible = "reg-mux";
37ad8d7220ca0fa Matt Ranostay       2024-05-14   174  			reg = <0x4000 0x4>;
37ad8d7220ca0fa Matt Ranostay       2024-05-14   175  			#mux-control-cells = <1>;
37ad8d7220ca0fa Matt Ranostay       2024-05-14   176  			mux-reg-masks = <0x0 0x8000000>; /* USB0 to SERDES0 lane 3 mux */
37ad8d7220ca0fa Matt Ranostay       2024-05-14   177  		};
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03   178  
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03   179  		ehrpwm_tbclk: clock-controller@4140 {
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03   180  			compatible = "ti,am654-ehrpwm-tbclk";
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03   181  			reg = <0x4140 0x18>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03   182  			#clock-cells = <1>;
f34b1c188e9ae59 Dasnavis Sabiya     2024-06-03   183  		};
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   184  	};
e5512a009bc9756 Siddharth Vadapalli 2023-10-19   185  
4664ebd8346adaa Apurva Nandan       2023-01-12   186  	gic500: interrupt-controller@1800000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   187  		compatible = "arm,gic-v3";
4664ebd8346adaa Apurva Nandan       2023-01-12   188  		#address-cells = <2>;
4664ebd8346adaa Apurva Nandan       2023-01-12   189  		#size-cells = <2>;
4664ebd8346adaa Apurva Nandan       2023-01-12   190  		ranges;
4664ebd8346adaa Apurva Nandan       2023-01-12   191  		#interrupt-cells = <3>;
4664ebd8346adaa Apurva Nandan       2023-01-12   192  		interrupt-controller;
4664ebd8346adaa Apurva Nandan       2023-01-12   193  		reg = <0x00 0x01800000 0x00 0x200000>, /* GICD */
4664ebd8346adaa Apurva Nandan       2023-01-12   194  		      <0x00 0x01900000 0x00 0x100000>, /* GICR */
4664ebd8346adaa Apurva Nandan       2023-01-12   195  		      <0x00 0x6f000000 0x00 0x2000>,   /* GICC */
4664ebd8346adaa Apurva Nandan       2023-01-12   196  		      <0x00 0x6f010000 0x00 0x1000>,   /* GICH */
4664ebd8346adaa Apurva Nandan       2023-01-12   197  		      <0x00 0x6f020000 0x00 0x2000>;   /* GICV */
4664ebd8346adaa Apurva Nandan       2023-01-12   198  
4664ebd8346adaa Apurva Nandan       2023-01-12   199  		/* vcpumntirq: virtual CPU interface maintenance interrupt */
4664ebd8346adaa Apurva Nandan       2023-01-12   200  		interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12   201  
4664ebd8346adaa Apurva Nandan       2023-01-12   202  		gic_its: msi-controller@1820000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   203  			compatible = "arm,gic-v3-its";
4664ebd8346adaa Apurva Nandan       2023-01-12   204  			reg = <0x00 0x01820000 0x00 0x10000>;
4664ebd8346adaa Apurva Nandan       2023-01-12   205  			socionext,synquacer-pre-its = <0x1000000 0x400000>;
4664ebd8346adaa Apurva Nandan       2023-01-12   206  			msi-controller;
4664ebd8346adaa Apurva Nandan       2023-01-12   207  			#msi-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12   208  		};
4664ebd8346adaa Apurva Nandan       2023-01-12   209  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   210  
4664ebd8346adaa Apurva Nandan       2023-01-12   211  	main_gpio_intr: interrupt-controller@a00000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   212  		compatible = "ti,sci-intr";
4664ebd8346adaa Apurva Nandan       2023-01-12   213  		reg = <0x00 0x00a00000 0x00 0x800>;
4664ebd8346adaa Apurva Nandan       2023-01-12   214  		ti,intr-trigger-type = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12   215  		interrupt-controller;
4664ebd8346adaa Apurva Nandan       2023-01-12   216  		interrupt-parent = <&gic500>;
4664ebd8346adaa Apurva Nandan       2023-01-12   217  		#interrupt-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12   218  		ti,sci = <&sms>;
4664ebd8346adaa Apurva Nandan       2023-01-12   219  		ti,sci-dev-id = <10>;
05a1f130101e7a4 Apelete Seketeli    2023-08-10   220  		ti,interrupt-ranges = <8 392 56>;
4664ebd8346adaa Apurva Nandan       2023-01-12   221  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   222  
4664ebd8346adaa Apurva Nandan       2023-01-12   223  	main_pmx0: pinctrl@11c000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   224  		compatible = "pinctrl-single";
4664ebd8346adaa Apurva Nandan       2023-01-12   225  		/* Proxy 0 addressing */
4664ebd8346adaa Apurva Nandan       2023-01-12   226  		reg = <0x00 0x11c000 0x00 0x120>;
4664ebd8346adaa Apurva Nandan       2023-01-12   227  		#pinctrl-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12   228  		pinctrl-single,register-width = <32>;
4664ebd8346adaa Apurva Nandan       2023-01-12   229  		pinctrl-single,function-mask = <0xffffffff>;
4664ebd8346adaa Apurva Nandan       2023-01-12   230  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   231  
5a41bcff08f9c07 Nishanth Menon      2023-05-31   232  	/* TIMERIO pad input CTRLMMR_TIMER*_CTRL registers */
5a41bcff08f9c07 Nishanth Menon      2023-05-31   233  	main_timerio_input: pinctrl@104200 {
5a41bcff08f9c07 Nishanth Menon      2023-05-31   234  		compatible = "pinctrl-single";
5a41bcff08f9c07 Nishanth Menon      2023-05-31   235  		reg = <0x00 0x104200 0x00 0x50>;
5a41bcff08f9c07 Nishanth Menon      2023-05-31   236  		#pinctrl-cells = <1>;
5a41bcff08f9c07 Nishanth Menon      2023-05-31   237  		pinctrl-single,register-width = <32>;
5a41bcff08f9c07 Nishanth Menon      2023-05-31   238  		pinctrl-single,function-mask = <0x00000007>;
5a41bcff08f9c07 Nishanth Menon      2023-05-31   239  	};
5a41bcff08f9c07 Nishanth Menon      2023-05-31   240  
5a41bcff08f9c07 Nishanth Menon      2023-05-31   241  	/* TIMERIO pad output CTCTRLMMR_TIMERIO*_CTRL registers */
5a41bcff08f9c07 Nishanth Menon      2023-05-31   242  	main_timerio_output: pinctrl@104280 {
5a41bcff08f9c07 Nishanth Menon      2023-05-31   243  		compatible = "pinctrl-single";
5a41bcff08f9c07 Nishanth Menon      2023-05-31   244  		reg = <0x00 0x104280 0x00 0x20>;
5a41bcff08f9c07 Nishanth Menon      2023-05-31   245  		#pinctrl-cells = <1>;
5a41bcff08f9c07 Nishanth Menon      2023-05-31   246  		pinctrl-single,register-width = <32>;
5a41bcff08f9c07 Nishanth Menon      2023-05-31   247  		pinctrl-single,function-mask = <0x0000001f>;
5a41bcff08f9c07 Nishanth Menon      2023-05-31   248  	};
5a41bcff08f9c07 Nishanth Menon      2023-05-31   249  
a43f0ac38518333 Jayesh Choudhary    2023-03-14   250  	main_crypto: crypto@4e00000 {
a43f0ac38518333 Jayesh Choudhary    2023-03-14   251  		compatible = "ti,j721e-sa2ul";
a43f0ac38518333 Jayesh Choudhary    2023-03-14   252  		reg = <0x00 0x4e00000 0x00 0x1200>;
a43f0ac38518333 Jayesh Choudhary    2023-03-14   253  		power-domains = <&k3_pds 369 TI_SCI_PD_EXCLUSIVE>;
a43f0ac38518333 Jayesh Choudhary    2023-03-14   254  		#address-cells = <2>;
a43f0ac38518333 Jayesh Choudhary    2023-03-14   255  		#size-cells = <2>;
a43f0ac38518333 Jayesh Choudhary    2023-03-14   256  		ranges = <0x00 0x04e00000 0x00 0x04e00000 0x00 0x30000>;
a43f0ac38518333 Jayesh Choudhary    2023-03-14   257  
a43f0ac38518333 Jayesh Choudhary    2023-03-14   258  		dmas = <&main_udmap 0xca40>, <&main_udmap 0x4a40>,
a43f0ac38518333 Jayesh Choudhary    2023-03-14   259  				<&main_udmap 0x4a41>;
a43f0ac38518333 Jayesh Choudhary    2023-03-14   260  		dma-names = "tx", "rx1", "rx2";
a43f0ac38518333 Jayesh Choudhary    2023-03-14   261  
a43f0ac38518333 Jayesh Choudhary    2023-03-14   262  		rng: rng@4e10000 {
a43f0ac38518333 Jayesh Choudhary    2023-03-14   263  			compatible = "inside-secure,safexcel-eip76";
a43f0ac38518333 Jayesh Choudhary    2023-03-14   264  			reg = <0x00 0x4e10000 0x00 0x7d>;
a43f0ac38518333 Jayesh Choudhary    2023-03-14   265  			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
a43f0ac38518333 Jayesh Choudhary    2023-03-14   266  		};
a43f0ac38518333 Jayesh Choudhary    2023-03-14   267  	};
a43f0ac38518333 Jayesh Choudhary    2023-03-14   268  
833377cf858b24d Nishanth Menon      2023-05-31   269  	main_timer0: timer@2400000 {
833377cf858b24d Nishanth Menon      2023-05-31   270  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   271  		reg = <0x00 0x2400000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   272  		interrupts = <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   273  		clocks = <&k3_clks 97 2>;
833377cf858b24d Nishanth Menon      2023-05-31   274  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   275  		assigned-clocks = <&k3_clks 97 2>;
833377cf858b24d Nishanth Menon      2023-05-31   276  		assigned-clock-parents = <&k3_clks 97 3>;
833377cf858b24d Nishanth Menon      2023-05-31   277  		power-domains = <&k3_pds 97 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   278  		ti,timer-pwm;
448809ccdc05780 Beleswar Padhi      2024-06-10   279  		status = "reserved";
833377cf858b24d Nishanth Menon      2023-05-31   280  	};
833377cf858b24d Nishanth Menon      2023-05-31   281  
833377cf858b24d Nishanth Menon      2023-05-31   282  	main_timer1: timer@2410000 {
833377cf858b24d Nishanth Menon      2023-05-31   283  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   284  		reg = <0x00 0x2410000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   285  		interrupts = <GIC_SPI 225 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   286  		clocks = <&k3_clks 98 2>;
833377cf858b24d Nishanth Menon      2023-05-31   287  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   288  		assigned-clocks = <&k3_clks 98 2>;
833377cf858b24d Nishanth Menon      2023-05-31   289  		assigned-clock-parents = <&k3_clks 98 3>;
833377cf858b24d Nishanth Menon      2023-05-31   290  		power-domains = <&k3_pds 98 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   291  		ti,timer-pwm;
448809ccdc05780 Beleswar Padhi      2024-06-10   292  		status = "reserved";
833377cf858b24d Nishanth Menon      2023-05-31   293  	};
833377cf858b24d Nishanth Menon      2023-05-31   294  
833377cf858b24d Nishanth Menon      2023-05-31   295  	main_timer2: timer@2420000 {
833377cf858b24d Nishanth Menon      2023-05-31   296  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   297  		reg = <0x00 0x2420000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   298  		interrupts = <GIC_SPI 226 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   299  		clocks = <&k3_clks 99 2>;
833377cf858b24d Nishanth Menon      2023-05-31   300  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   301  		assigned-clocks = <&k3_clks 99 2>;
833377cf858b24d Nishanth Menon      2023-05-31   302  		assigned-clock-parents = <&k3_clks 99 3>;
833377cf858b24d Nishanth Menon      2023-05-31   303  		power-domains = <&k3_pds 99 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   304  		ti,timer-pwm;
448809ccdc05780 Beleswar Padhi      2024-06-10   305  		status = "reserved";
833377cf858b24d Nishanth Menon      2023-05-31   306  	};
833377cf858b24d Nishanth Menon      2023-05-31   307  
833377cf858b24d Nishanth Menon      2023-05-31   308  	main_timer3: timer@2430000 {
833377cf858b24d Nishanth Menon      2023-05-31   309  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   310  		reg = <0x00 0x2430000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   311  		interrupts = <GIC_SPI 227 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   312  		clocks = <&k3_clks 100 2>;
833377cf858b24d Nishanth Menon      2023-05-31   313  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   314  		assigned-clocks = <&k3_clks 100 2>;
833377cf858b24d Nishanth Menon      2023-05-31   315  		assigned-clock-parents = <&k3_clks 100 3>;
833377cf858b24d Nishanth Menon      2023-05-31   316  		power-domains = <&k3_pds 100 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   317  		ti,timer-pwm;
448809ccdc05780 Beleswar Padhi      2024-06-10   318  		status = "reserved";
833377cf858b24d Nishanth Menon      2023-05-31   319  	};
833377cf858b24d Nishanth Menon      2023-05-31   320  
833377cf858b24d Nishanth Menon      2023-05-31   321  	main_timer4: timer@2440000 {
833377cf858b24d Nishanth Menon      2023-05-31   322  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   323  		reg = <0x00 0x2440000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   324  		interrupts = <GIC_SPI 228 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   325  		clocks = <&k3_clks 101 2>;
833377cf858b24d Nishanth Menon      2023-05-31   326  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   327  		assigned-clocks = <&k3_clks 101 2>;
833377cf858b24d Nishanth Menon      2023-05-31   328  		assigned-clock-parents = <&k3_clks 101 3>;
833377cf858b24d Nishanth Menon      2023-05-31   329  		power-domains = <&k3_pds 101 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   330  		ti,timer-pwm;
448809ccdc05780 Beleswar Padhi      2024-06-10   331  		status = "reserved";
833377cf858b24d Nishanth Menon      2023-05-31   332  	};
833377cf858b24d Nishanth Menon      2023-05-31   333  
833377cf858b24d Nishanth Menon      2023-05-31   334  	main_timer5: timer@2450000 {
833377cf858b24d Nishanth Menon      2023-05-31   335  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   336  		reg = <0x00 0x2450000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   337  		interrupts = <GIC_SPI 229 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   338  		clocks = <&k3_clks 102 2>;
833377cf858b24d Nishanth Menon      2023-05-31   339  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   340  		assigned-clocks = <&k3_clks 102 2>;
833377cf858b24d Nishanth Menon      2023-05-31   341  		assigned-clock-parents = <&k3_clks 102 3>;
833377cf858b24d Nishanth Menon      2023-05-31   342  		power-domains = <&k3_pds 102 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   343  		ti,timer-pwm;
448809ccdc05780 Beleswar Padhi      2024-06-10   344  		status = "reserved";
833377cf858b24d Nishanth Menon      2023-05-31   345  	};
833377cf858b24d Nishanth Menon      2023-05-31   346  
833377cf858b24d Nishanth Menon      2023-05-31   347  	main_timer6: timer@2460000 {
833377cf858b24d Nishanth Menon      2023-05-31   348  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   349  		reg = <0x00 0x2460000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   350  		interrupts = <GIC_SPI 230 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   351  		clocks = <&k3_clks 103 2>;
833377cf858b24d Nishanth Menon      2023-05-31   352  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   353  		assigned-clocks = <&k3_clks 103 2>;
833377cf858b24d Nishanth Menon      2023-05-31   354  		assigned-clock-parents = <&k3_clks 103 3>;
833377cf858b24d Nishanth Menon      2023-05-31   355  		power-domains = <&k3_pds 103 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   356  		ti,timer-pwm;
448809ccdc05780 Beleswar Padhi      2024-06-10   357  		status = "reserved";
833377cf858b24d Nishanth Menon      2023-05-31   358  	};
833377cf858b24d Nishanth Menon      2023-05-31   359  
833377cf858b24d Nishanth Menon      2023-05-31   360  	main_timer7: timer@2470000 {
833377cf858b24d Nishanth Menon      2023-05-31   361  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   362  		reg = <0x00 0x2470000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   363  		interrupts = <GIC_SPI 231 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   364  		clocks = <&k3_clks 104 2>;
833377cf858b24d Nishanth Menon      2023-05-31   365  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   366  		assigned-clocks = <&k3_clks 104 2>;
833377cf858b24d Nishanth Menon      2023-05-31   367  		assigned-clock-parents = <&k3_clks 104 3>;
833377cf858b24d Nishanth Menon      2023-05-31   368  		power-domains = <&k3_pds 104 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   369  		ti,timer-pwm;
448809ccdc05780 Beleswar Padhi      2024-06-10   370  		status = "reserved";
833377cf858b24d Nishanth Menon      2023-05-31   371  	};
833377cf858b24d Nishanth Menon      2023-05-31   372  
833377cf858b24d Nishanth Menon      2023-05-31   373  	main_timer8: timer@2480000 {
833377cf858b24d Nishanth Menon      2023-05-31   374  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   375  		reg = <0x00 0x2480000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   376  		interrupts = <GIC_SPI 232 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   377  		clocks = <&k3_clks 105 2>;
833377cf858b24d Nishanth Menon      2023-05-31   378  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   379  		assigned-clocks = <&k3_clks 105 2>;
833377cf858b24d Nishanth Menon      2023-05-31   380  		assigned-clock-parents = <&k3_clks 105 3>;
833377cf858b24d Nishanth Menon      2023-05-31   381  		power-domains = <&k3_pds 105 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   382  		ti,timer-pwm;
448809ccdc05780 Beleswar Padhi      2024-06-10   383  		status = "reserved";
833377cf858b24d Nishanth Menon      2023-05-31   384  	};
833377cf858b24d Nishanth Menon      2023-05-31   385  
833377cf858b24d Nishanth Menon      2023-05-31   386  	main_timer9: timer@2490000 {
833377cf858b24d Nishanth Menon      2023-05-31   387  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   388  		reg = <0x00 0x2490000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   389  		interrupts = <GIC_SPI 233 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   390  		clocks = <&k3_clks 106 2>;
833377cf858b24d Nishanth Menon      2023-05-31   391  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   392  		assigned-clocks = <&k3_clks 106 2>;
833377cf858b24d Nishanth Menon      2023-05-31   393  		assigned-clock-parents = <&k3_clks 106 3>;
833377cf858b24d Nishanth Menon      2023-05-31   394  		power-domains = <&k3_pds 106 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   395  		ti,timer-pwm;
448809ccdc05780 Beleswar Padhi      2024-06-10   396  		status = "reserved";
833377cf858b24d Nishanth Menon      2023-05-31   397  	};
833377cf858b24d Nishanth Menon      2023-05-31   398  
833377cf858b24d Nishanth Menon      2023-05-31   399  	main_timer10: timer@24a0000 {
833377cf858b24d Nishanth Menon      2023-05-31   400  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   401  		reg = <0x00 0x24a0000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   402  		interrupts = <GIC_SPI 234 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   403  		clocks = <&k3_clks 107 2>;
833377cf858b24d Nishanth Menon      2023-05-31   404  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   405  		assigned-clocks = <&k3_clks 107 2>;
833377cf858b24d Nishanth Menon      2023-05-31   406  		assigned-clock-parents = <&k3_clks 107 3>;
833377cf858b24d Nishanth Menon      2023-05-31   407  		power-domains = <&k3_pds 107 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   408  		ti,timer-pwm;
833377cf858b24d Nishanth Menon      2023-05-31   409  	};
833377cf858b24d Nishanth Menon      2023-05-31   410  
833377cf858b24d Nishanth Menon      2023-05-31   411  	main_timer11: timer@24b0000 {
833377cf858b24d Nishanth Menon      2023-05-31   412  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   413  		reg = <0x00 0x24b0000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   414  		interrupts = <GIC_SPI 235 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   415  		clocks = <&k3_clks 108 2>;
833377cf858b24d Nishanth Menon      2023-05-31   416  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   417  		assigned-clocks = <&k3_clks 108 2>;
833377cf858b24d Nishanth Menon      2023-05-31   418  		assigned-clock-parents = <&k3_clks 108 3>;
833377cf858b24d Nishanth Menon      2023-05-31   419  		power-domains = <&k3_pds 108 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   420  		ti,timer-pwm;
833377cf858b24d Nishanth Menon      2023-05-31   421  	};
833377cf858b24d Nishanth Menon      2023-05-31   422  
833377cf858b24d Nishanth Menon      2023-05-31   423  	main_timer12: timer@24c0000 {
833377cf858b24d Nishanth Menon      2023-05-31   424  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   425  		reg = <0x00 0x24c0000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   426  		interrupts = <GIC_SPI 236 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   427  		clocks = <&k3_clks 109 2>;
833377cf858b24d Nishanth Menon      2023-05-31   428  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   429  		assigned-clocks = <&k3_clks 109 2>;
833377cf858b24d Nishanth Menon      2023-05-31   430  		assigned-clock-parents = <&k3_clks 109 3>;
833377cf858b24d Nishanth Menon      2023-05-31   431  		power-domains = <&k3_pds 109 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   432  		ti,timer-pwm;
833377cf858b24d Nishanth Menon      2023-05-31   433  	};
833377cf858b24d Nishanth Menon      2023-05-31   434  
833377cf858b24d Nishanth Menon      2023-05-31   435  	main_timer13: timer@24d0000 {
833377cf858b24d Nishanth Menon      2023-05-31   436  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   437  		reg = <0x00 0x24d0000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   438  		interrupts = <GIC_SPI 237 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   439  		clocks = <&k3_clks 110 2>;
833377cf858b24d Nishanth Menon      2023-05-31   440  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   441  		assigned-clocks = <&k3_clks 110 2>;
833377cf858b24d Nishanth Menon      2023-05-31   442  		assigned-clock-parents = <&k3_clks 110 3>;
833377cf858b24d Nishanth Menon      2023-05-31   443  		power-domains = <&k3_pds 110 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   444  		ti,timer-pwm;
833377cf858b24d Nishanth Menon      2023-05-31   445  	};
833377cf858b24d Nishanth Menon      2023-05-31   446  
833377cf858b24d Nishanth Menon      2023-05-31   447  	main_timer14: timer@24e0000 {
833377cf858b24d Nishanth Menon      2023-05-31   448  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   449  		reg = <0x00 0x24e0000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   450  		interrupts = <GIC_SPI 238 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   451  		clocks = <&k3_clks 111 2>;
833377cf858b24d Nishanth Menon      2023-05-31   452  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   453  		assigned-clocks = <&k3_clks 111 2>;
833377cf858b24d Nishanth Menon      2023-05-31   454  		assigned-clock-parents = <&k3_clks 111 3>;
833377cf858b24d Nishanth Menon      2023-05-31   455  		power-domains = <&k3_pds 111 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   456  		ti,timer-pwm;
833377cf858b24d Nishanth Menon      2023-05-31   457  	};
833377cf858b24d Nishanth Menon      2023-05-31   458  
833377cf858b24d Nishanth Menon      2023-05-31   459  	main_timer15: timer@24f0000 {
833377cf858b24d Nishanth Menon      2023-05-31   460  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   461  		reg = <0x00 0x24f0000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   462  		interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   463  		clocks = <&k3_clks 112 2>;
833377cf858b24d Nishanth Menon      2023-05-31   464  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   465  		assigned-clocks = <&k3_clks 112 2>;
833377cf858b24d Nishanth Menon      2023-05-31   466  		assigned-clock-parents = <&k3_clks 112 3>;
833377cf858b24d Nishanth Menon      2023-05-31   467  		power-domains = <&k3_pds 112 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   468  		ti,timer-pwm;
833377cf858b24d Nishanth Menon      2023-05-31   469  	};
833377cf858b24d Nishanth Menon      2023-05-31   470  
833377cf858b24d Nishanth Menon      2023-05-31   471  	main_timer16: timer@2500000 {
833377cf858b24d Nishanth Menon      2023-05-31   472  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   473  		reg = <0x00 0x2500000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   474  		interrupts = <GIC_SPI 240 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   475  		clocks = <&k3_clks 113 2>;
833377cf858b24d Nishanth Menon      2023-05-31   476  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   477  		assigned-clocks = <&k3_clks 113 2>;
833377cf858b24d Nishanth Menon      2023-05-31   478  		assigned-clock-parents = <&k3_clks 113 3>;
833377cf858b24d Nishanth Menon      2023-05-31   479  		power-domains = <&k3_pds 113 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   480  		ti,timer-pwm;
833377cf858b24d Nishanth Menon      2023-05-31   481  	};
833377cf858b24d Nishanth Menon      2023-05-31   482  
833377cf858b24d Nishanth Menon      2023-05-31   483  	main_timer17: timer@2510000 {
833377cf858b24d Nishanth Menon      2023-05-31   484  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   485  		reg = <0x00 0x2510000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   486  		interrupts = <GIC_SPI 241 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   487  		clocks = <&k3_clks 114 2>;
833377cf858b24d Nishanth Menon      2023-05-31   488  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   489  		assigned-clocks = <&k3_clks 114 2>;
833377cf858b24d Nishanth Menon      2023-05-31   490  		assigned-clock-parents = <&k3_clks 114 3>;
833377cf858b24d Nishanth Menon      2023-05-31   491  		power-domains = <&k3_pds 114 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   492  		ti,timer-pwm;
833377cf858b24d Nishanth Menon      2023-05-31   493  	};
833377cf858b24d Nishanth Menon      2023-05-31   494  
833377cf858b24d Nishanth Menon      2023-05-31   495  	main_timer18: timer@2520000 {
833377cf858b24d Nishanth Menon      2023-05-31   496  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   497  		reg = <0x00 0x2520000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   498  		interrupts = <GIC_SPI 242 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   499  		clocks = <&k3_clks 115 2>;
833377cf858b24d Nishanth Menon      2023-05-31   500  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   501  		assigned-clocks = <&k3_clks 115 2>;
833377cf858b24d Nishanth Menon      2023-05-31   502  		assigned-clock-parents = <&k3_clks 115 3>;
833377cf858b24d Nishanth Menon      2023-05-31   503  		power-domains = <&k3_pds 115 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   504  		ti,timer-pwm;
833377cf858b24d Nishanth Menon      2023-05-31   505  	};
833377cf858b24d Nishanth Menon      2023-05-31   506  
833377cf858b24d Nishanth Menon      2023-05-31   507  	main_timer19: timer@2530000 {
833377cf858b24d Nishanth Menon      2023-05-31   508  		compatible = "ti,am654-timer";
833377cf858b24d Nishanth Menon      2023-05-31   509  		reg = <0x00 0x2530000 0x00 0x400>;
833377cf858b24d Nishanth Menon      2023-05-31   510  		interrupts = <GIC_SPI 243 IRQ_TYPE_LEVEL_HIGH>;
833377cf858b24d Nishanth Menon      2023-05-31   511  		clocks = <&k3_clks 116 2>;
833377cf858b24d Nishanth Menon      2023-05-31   512  		clock-names = "fck";
833377cf858b24d Nishanth Menon      2023-05-31   513  		assigned-clocks = <&k3_clks 116 2>;
833377cf858b24d Nishanth Menon      2023-05-31   514  		assigned-clock-parents = <&k3_clks 116 3>;
833377cf858b24d Nishanth Menon      2023-05-31   515  		power-domains = <&k3_pds 116 TI_SCI_PD_EXCLUSIVE>;
833377cf858b24d Nishanth Menon      2023-05-31   516  		ti,timer-pwm;
833377cf858b24d Nishanth Menon      2023-05-31   517  	};
833377cf858b24d Nishanth Menon      2023-05-31   518  
4664ebd8346adaa Apurva Nandan       2023-01-12   519  	main_uart0: serial@2800000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   520  		compatible = "ti,j721e-uart", "ti,am654-uart";
4664ebd8346adaa Apurva Nandan       2023-01-12   521  		reg = <0x00 0x02800000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   522  		interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12   523  		current-speed = <115200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   524  		clocks = <&k3_clks 146 0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   525  		clock-names = "fclk";
4664ebd8346adaa Apurva Nandan       2023-01-12   526  		power-domains = <&k3_pds 146 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   527  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   528  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   529  
4664ebd8346adaa Apurva Nandan       2023-01-12   530  	main_uart1: serial@2810000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   531  		compatible = "ti,j721e-uart", "ti,am654-uart";
4664ebd8346adaa Apurva Nandan       2023-01-12   532  		reg = <0x00 0x02810000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   533  		interrupts = <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12   534  		current-speed = <115200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   535  		clocks = <&k3_clks 388 0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   536  		clock-names = "fclk";
4664ebd8346adaa Apurva Nandan       2023-01-12   537  		power-domains = <&k3_pds 388 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   538  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   539  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   540  
4664ebd8346adaa Apurva Nandan       2023-01-12   541  	main_uart2: serial@2820000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   542  		compatible = "ti,j721e-uart", "ti,am654-uart";
4664ebd8346adaa Apurva Nandan       2023-01-12   543  		reg = <0x00 0x02820000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   544  		interrupts = <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12   545  		current-speed = <115200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   546  		clocks = <&k3_clks 389 0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   547  		clock-names = "fclk";
4664ebd8346adaa Apurva Nandan       2023-01-12   548  		power-domains = <&k3_pds 389 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   549  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   550  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   551  
4664ebd8346adaa Apurva Nandan       2023-01-12   552  	main_uart3: serial@2830000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   553  		compatible = "ti,j721e-uart", "ti,am654-uart";
4664ebd8346adaa Apurva Nandan       2023-01-12   554  		reg = <0x00 0x02830000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   555  		interrupts = <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12   556  		current-speed = <115200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   557  		clocks = <&k3_clks 390 0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   558  		clock-names = "fclk";
4664ebd8346adaa Apurva Nandan       2023-01-12   559  		power-domains = <&k3_pds 390 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   560  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   561  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   562  
4664ebd8346adaa Apurva Nandan       2023-01-12   563  	main_uart4: serial@2840000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   564  		compatible = "ti,j721e-uart", "ti,am654-uart";
4664ebd8346adaa Apurva Nandan       2023-01-12   565  		reg = <0x00 0x02840000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   566  		interrupts = <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12   567  		current-speed = <115200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   568  		clocks = <&k3_clks 391 0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   569  		clock-names = "fclk";
4664ebd8346adaa Apurva Nandan       2023-01-12   570  		power-domains = <&k3_pds 391 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   571  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   572  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   573  
4664ebd8346adaa Apurva Nandan       2023-01-12   574  	main_uart5: serial@2850000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   575  		compatible = "ti,j721e-uart", "ti,am654-uart";
4664ebd8346adaa Apurva Nandan       2023-01-12   576  		reg = <0x00 0x02850000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   577  		interrupts = <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12   578  		current-speed = <115200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   579  		clocks = <&k3_clks 392 0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   580  		clock-names = "fclk";
4664ebd8346adaa Apurva Nandan       2023-01-12   581  		power-domains = <&k3_pds 392 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   582  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   583  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   584  
4664ebd8346adaa Apurva Nandan       2023-01-12   585  	main_uart6: serial@2860000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   586  		compatible = "ti,j721e-uart", "ti,am654-uart";
4664ebd8346adaa Apurva Nandan       2023-01-12   587  		reg = <0x00 0x02860000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   588  		interrupts = <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12   589  		current-speed = <115200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   590  		clocks = <&k3_clks 393 0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   591  		clock-names = "fclk";
4664ebd8346adaa Apurva Nandan       2023-01-12   592  		power-domains = <&k3_pds 393 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   593  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   594  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   595  
4664ebd8346adaa Apurva Nandan       2023-01-12   596  	main_uart7: serial@2870000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   597  		compatible = "ti,j721e-uart", "ti,am654-uart";
4664ebd8346adaa Apurva Nandan       2023-01-12   598  		reg = <0x00 0x02870000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   599  		interrupts = <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12   600  		current-speed = <115200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   601  		clocks = <&k3_clks 394 0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   602  		clock-names = "fclk";
4664ebd8346adaa Apurva Nandan       2023-01-12   603  		power-domains = <&k3_pds 394 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   604  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   605  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   606  
4664ebd8346adaa Apurva Nandan       2023-01-12   607  	main_uart8: serial@2880000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   608  		compatible = "ti,j721e-uart", "ti,am654-uart";
4664ebd8346adaa Apurva Nandan       2023-01-12   609  		reg = <0x00 0x02880000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   610  		interrupts = <GIC_SPI 248 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12   611  		current-speed = <115200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   612  		clocks = <&k3_clks 395 0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   613  		clock-names = "fclk";
4664ebd8346adaa Apurva Nandan       2023-01-12   614  		power-domains = <&k3_pds 395 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   615  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   616  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   617  
4664ebd8346adaa Apurva Nandan       2023-01-12   618  	main_uart9: serial@2890000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   619  		compatible = "ti,j721e-uart", "ti,am654-uart";
4664ebd8346adaa Apurva Nandan       2023-01-12   620  		reg = <0x00 0x02890000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   621  		interrupts = <GIC_SPI 249 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12   622  		current-speed = <115200>;
4664ebd8346adaa Apurva Nandan       2023-01-12   623  		clocks = <&k3_clks 396 0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   624  		clock-names = "fclk";
4664ebd8346adaa Apurva Nandan       2023-01-12   625  		power-domains = <&k3_pds 396 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   626  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   627  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   628  
1996f729d8ed3a3 Randolph Sapp       2024-04-23   629  	gpu: gpu@4e20000000 {
1996f729d8ed3a3 Randolph Sapp       2024-04-23   630  		compatible = "ti,j721s2-pvr", "img,pvr-bxs64";
1996f729d8ed3a3 Randolph Sapp       2024-04-23   631  		reg = <0x4e 0x20000000 0x00 0x80000>;
1996f729d8ed3a3 Randolph Sapp       2024-04-23   632  		interrupts = <GIC_SPI 24 IRQ_TYPE_LEVEL_HIGH>;
13c8fd2a35d5fe1 Randolph Sapp       2024-04-29   633  		power-domains = <&k3_pds 181 TI_SCI_PD_EXCLUSIVE>,
13c8fd2a35d5fe1 Randolph Sapp       2024-04-29   634  				<&k3_pds 182 TI_SCI_PD_EXCLUSIVE>;
13c8fd2a35d5fe1 Randolph Sapp       2024-04-29   635  		power-domain-names = "firmware", "dust";
1996f729d8ed3a3 Randolph Sapp       2024-04-23   636  		clocks = <&k3_clks 181 1>;
13c8fd2a35d5fe1 Randolph Sapp       2024-04-29   637  		assigned-clocks = <&k3_clks 181 1>;
13c8fd2a35d5fe1 Randolph Sapp       2024-04-29   638  		assigned-clock-rates = <800000000>;
13c8fd2a35d5fe1 Randolph Sapp       2024-04-29   639  		clock-names = "core";
1996f729d8ed3a3 Randolph Sapp       2024-04-23   640  	};
1996f729d8ed3a3 Randolph Sapp       2024-04-23   641  
4664ebd8346adaa Apurva Nandan       2023-01-12   642  	main_gpio0: gpio@600000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   643  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
4664ebd8346adaa Apurva Nandan       2023-01-12   644  		reg = <0x00 0x00600000 0x00 0x100>;
4664ebd8346adaa Apurva Nandan       2023-01-12   645  		gpio-controller;
4664ebd8346adaa Apurva Nandan       2023-01-12   646  		#gpio-cells = <2>;
4664ebd8346adaa Apurva Nandan       2023-01-12   647  		interrupt-parent = <&main_gpio_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12   648  		interrupts = <145>, <146>, <147>, <148>, <149>;
4664ebd8346adaa Apurva Nandan       2023-01-12   649  		interrupt-controller;
4664ebd8346adaa Apurva Nandan       2023-01-12   650  		#interrupt-cells = <2>;
4664ebd8346adaa Apurva Nandan       2023-01-12   651  		ti,ngpio = <66>;
4664ebd8346adaa Apurva Nandan       2023-01-12   652  		ti,davinci-gpio-unbanked = <0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   653  		power-domains = <&k3_pds 163 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   654  		clocks = <&k3_clks 163 0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   655  		clock-names = "gpio";
4664ebd8346adaa Apurva Nandan       2023-01-12   656  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   657  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   658  
4664ebd8346adaa Apurva Nandan       2023-01-12   659  	main_gpio2: gpio@610000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   660  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
4664ebd8346adaa Apurva Nandan       2023-01-12   661  		reg = <0x00 0x00610000 0x00 0x100>;
4664ebd8346adaa Apurva Nandan       2023-01-12   662  		gpio-controller;
4664ebd8346adaa Apurva Nandan       2023-01-12   663  		#gpio-cells = <2>;
4664ebd8346adaa Apurva Nandan       2023-01-12   664  		interrupt-parent = <&main_gpio_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12   665  		interrupts = <154>, <155>, <156>, <157>, <158>;
4664ebd8346adaa Apurva Nandan       2023-01-12   666  		interrupt-controller;
4664ebd8346adaa Apurva Nandan       2023-01-12   667  		#interrupt-cells = <2>;
4664ebd8346adaa Apurva Nandan       2023-01-12   668  		ti,ngpio = <66>;
4664ebd8346adaa Apurva Nandan       2023-01-12   669  		ti,davinci-gpio-unbanked = <0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   670  		power-domains = <&k3_pds 164 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   671  		clocks = <&k3_clks 164 0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   672  		clock-names = "gpio";
4664ebd8346adaa Apurva Nandan       2023-01-12   673  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   674  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   675  
4664ebd8346adaa Apurva Nandan       2023-01-12   676  	main_gpio4: gpio@620000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   677  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
4664ebd8346adaa Apurva Nandan       2023-01-12   678  		reg = <0x00 0x00620000 0x00 0x100>;
4664ebd8346adaa Apurva Nandan       2023-01-12   679  		gpio-controller;
4664ebd8346adaa Apurva Nandan       2023-01-12   680  		#gpio-cells = <2>;
4664ebd8346adaa Apurva Nandan       2023-01-12   681  		interrupt-parent = <&main_gpio_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12   682  		interrupts = <163>, <164>, <165>, <166>, <167>;
4664ebd8346adaa Apurva Nandan       2023-01-12   683  		interrupt-controller;
4664ebd8346adaa Apurva Nandan       2023-01-12   684  		#interrupt-cells = <2>;
4664ebd8346adaa Apurva Nandan       2023-01-12   685  		ti,ngpio = <66>;
4664ebd8346adaa Apurva Nandan       2023-01-12   686  		ti,davinci-gpio-unbanked = <0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   687  		power-domains = <&k3_pds 165 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   688  		clocks = <&k3_clks 165 0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   689  		clock-names = "gpio";
4664ebd8346adaa Apurva Nandan       2023-01-12   690  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   691  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   692  
4664ebd8346adaa Apurva Nandan       2023-01-12   693  	main_gpio6: gpio@630000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   694  		compatible = "ti,j721e-gpio", "ti,keystone-gpio";
4664ebd8346adaa Apurva Nandan       2023-01-12   695  		reg = <0x00 0x00630000 0x00 0x100>;
4664ebd8346adaa Apurva Nandan       2023-01-12   696  		gpio-controller;
4664ebd8346adaa Apurva Nandan       2023-01-12   697  		#gpio-cells = <2>;
4664ebd8346adaa Apurva Nandan       2023-01-12   698  		interrupt-parent = <&main_gpio_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12   699  		interrupts = <172>, <173>, <174>, <175>, <176>;
4664ebd8346adaa Apurva Nandan       2023-01-12   700  		interrupt-controller;
4664ebd8346adaa Apurva Nandan       2023-01-12   701  		#interrupt-cells = <2>;
4664ebd8346adaa Apurva Nandan       2023-01-12   702  		ti,ngpio = <66>;
4664ebd8346adaa Apurva Nandan       2023-01-12   703  		ti,davinci-gpio-unbanked = <0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   704  		power-domains = <&k3_pds 166 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   705  		clocks = <&k3_clks 166 0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   706  		clock-names = "gpio";
4664ebd8346adaa Apurva Nandan       2023-01-12   707  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   708  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   709  
37ad8d7220ca0fa Matt Ranostay       2024-05-14   710  	usbss0: usb@4104000 {
37ad8d7220ca0fa Matt Ranostay       2024-05-14   711  		bootph-all;
37ad8d7220ca0fa Matt Ranostay       2024-05-14   712  		compatible = "ti,j721e-usb";
37ad8d7220ca0fa Matt Ranostay       2024-05-14   713  		reg = <0x00 0x4104000 0x00 0x100>;
37ad8d7220ca0fa Matt Ranostay       2024-05-14   714  		dma-coherent;
37ad8d7220ca0fa Matt Ranostay       2024-05-14   715  		power-domains = <&k3_pds 398 TI_SCI_PD_EXCLUSIVE>;
37ad8d7220ca0fa Matt Ranostay       2024-05-14   716  		clocks = <&k3_clks 398 21>, <&k3_clks 398 2>;
37ad8d7220ca0fa Matt Ranostay       2024-05-14   717  		clock-names = "ref", "lpm";
37ad8d7220ca0fa Matt Ranostay       2024-05-14   718  		assigned-clocks = <&k3_clks 398 21>;    /* USB2_REFCLK */
37ad8d7220ca0fa Matt Ranostay       2024-05-14   719  		assigned-clock-parents = <&k3_clks 398 22>; /* HFOSC0 */
37ad8d7220ca0fa Matt Ranostay       2024-05-14   720  		#address-cells = <2>;
37ad8d7220ca0fa Matt Ranostay       2024-05-14   721  		#size-cells = <2>;
37ad8d7220ca0fa Matt Ranostay       2024-05-14   722  		ranges;
37ad8d7220ca0fa Matt Ranostay       2024-05-14   723  
37ad8d7220ca0fa Matt Ranostay       2024-05-14   724  		status = "disabled"; /* Needs lane config */
37ad8d7220ca0fa Matt Ranostay       2024-05-14   725  
37ad8d7220ca0fa Matt Ranostay       2024-05-14   726  		usb0: usb@6000000 {
37ad8d7220ca0fa Matt Ranostay       2024-05-14   727  			bootph-all;
37ad8d7220ca0fa Matt Ranostay       2024-05-14   728  			compatible = "cdns,usb3";
37ad8d7220ca0fa Matt Ranostay       2024-05-14   729  			reg = <0x00 0x6000000 0x00 0x10000>,
37ad8d7220ca0fa Matt Ranostay       2024-05-14   730  			      <0x00 0x6010000 0x00 0x10000>,
37ad8d7220ca0fa Matt Ranostay       2024-05-14   731  			      <0x00 0x6020000 0x00 0x10000>;
37ad8d7220ca0fa Matt Ranostay       2024-05-14   732  			reg-names = "otg", "xhci", "dev";
37ad8d7220ca0fa Matt Ranostay       2024-05-14   733  			interrupts = <GIC_SPI 96 IRQ_TYPE_LEVEL_HIGH>,  /* irq.0 */
37ad8d7220ca0fa Matt Ranostay       2024-05-14   734  				     <GIC_SPI 102 IRQ_TYPE_LEVEL_HIGH>, /* irq.6 */
37ad8d7220ca0fa Matt Ranostay       2024-05-14   735  				     <GIC_SPI 120 IRQ_TYPE_LEVEL_HIGH>; /* otgirq.0 */
37ad8d7220ca0fa Matt Ranostay       2024-05-14   736  			interrupt-names = "host",
37ad8d7220ca0fa Matt Ranostay       2024-05-14   737  					  "peripheral",
37ad8d7220ca0fa Matt Ranostay       2024-05-14   738  					  "otg";
37ad8d7220ca0fa Matt Ranostay       2024-05-14   739  		};
37ad8d7220ca0fa Matt Ranostay       2024-05-14   740  	};
37ad8d7220ca0fa Matt Ranostay       2024-05-14   741  
4664ebd8346adaa Apurva Nandan       2023-01-12   742  	main_i2c0: i2c@2000000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   743  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
4664ebd8346adaa Apurva Nandan       2023-01-12   744  		reg = <0x00 0x02000000 0x00 0x100>;
4664ebd8346adaa Apurva Nandan       2023-01-12   745  		interrupts = <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12   746  		#address-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12   747  		#size-cells = <0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   748  		clocks = <&k3_clks 270 2>;
4664ebd8346adaa Apurva Nandan       2023-01-12   749  		clock-names = "fck";
4664ebd8346adaa Apurva Nandan       2023-01-12   750  		power-domains = <&k3_pds 270 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   751  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   752  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   753  
4664ebd8346adaa Apurva Nandan       2023-01-12   754  	main_i2c1: i2c@2010000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   755  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
4664ebd8346adaa Apurva Nandan       2023-01-12   756  		reg = <0x00 0x02010000 0x00 0x100>;
4664ebd8346adaa Apurva Nandan       2023-01-12   757  		interrupts = <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12   758  		#address-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12   759  		#size-cells = <0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   760  		clocks = <&k3_clks 271 2>;
4664ebd8346adaa Apurva Nandan       2023-01-12   761  		clock-names = "fck";
4664ebd8346adaa Apurva Nandan       2023-01-12   762  		power-domains = <&k3_pds 271 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   763  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   764  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   765  
4664ebd8346adaa Apurva Nandan       2023-01-12   766  	main_i2c2: i2c@2020000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   767  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
4664ebd8346adaa Apurva Nandan       2023-01-12   768  		reg = <0x00 0x02020000 0x00 0x100>;
4664ebd8346adaa Apurva Nandan       2023-01-12   769  		interrupts = <GIC_SPI 202 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12   770  		#address-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12   771  		#size-cells = <0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   772  		clocks = <&k3_clks 272 2>;
4664ebd8346adaa Apurva Nandan       2023-01-12   773  		clock-names = "fck";
4664ebd8346adaa Apurva Nandan       2023-01-12   774  		power-domains = <&k3_pds 272 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   775  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   776  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   777  
4664ebd8346adaa Apurva Nandan       2023-01-12   778  	main_i2c3: i2c@2030000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   779  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
4664ebd8346adaa Apurva Nandan       2023-01-12   780  		reg = <0x00 0x02030000 0x00 0x100>;
4664ebd8346adaa Apurva Nandan       2023-01-12   781  		interrupts = <GIC_SPI 203 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12   782  		#address-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12   783  		#size-cells = <0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   784  		clocks = <&k3_clks 273 2>;
4664ebd8346adaa Apurva Nandan       2023-01-12   785  		clock-names = "fck";
4664ebd8346adaa Apurva Nandan       2023-01-12   786  		power-domains = <&k3_pds 273 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   787  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   788  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   789  
4664ebd8346adaa Apurva Nandan       2023-01-12   790  	main_i2c4: i2c@2040000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   791  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
4664ebd8346adaa Apurva Nandan       2023-01-12   792  		reg = <0x00 0x02040000 0x00 0x100>;
4664ebd8346adaa Apurva Nandan       2023-01-12   793  		interrupts = <GIC_SPI 204 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12   794  		#address-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12   795  		#size-cells = <0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   796  		clocks = <&k3_clks 274 2>;
4664ebd8346adaa Apurva Nandan       2023-01-12   797  		clock-names = "fck";
4664ebd8346adaa Apurva Nandan       2023-01-12   798  		power-domains = <&k3_pds 274 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   799  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   800  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   801  
4664ebd8346adaa Apurva Nandan       2023-01-12   802  	main_i2c5: i2c@2050000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   803  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
4664ebd8346adaa Apurva Nandan       2023-01-12   804  		reg = <0x00 0x02050000 0x00 0x100>;
4664ebd8346adaa Apurva Nandan       2023-01-12   805  		interrupts = <GIC_SPI 205 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12   806  		#address-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12   807  		#size-cells = <0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   808  		clocks = <&k3_clks 275 2>;
4664ebd8346adaa Apurva Nandan       2023-01-12   809  		clock-names = "fck";
4664ebd8346adaa Apurva Nandan       2023-01-12   810  		power-domains = <&k3_pds 275 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   811  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   812  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   813  
4664ebd8346adaa Apurva Nandan       2023-01-12   814  	main_i2c6: i2c@2060000 {
4664ebd8346adaa Apurva Nandan       2023-01-12   815  		compatible = "ti,j721e-i2c", "ti,omap4-i2c";
4664ebd8346adaa Apurva Nandan       2023-01-12   816  		reg = <0x00 0x02060000 0x00 0x100>;
4664ebd8346adaa Apurva Nandan       2023-01-12   817  		interrupts = <GIC_SPI 206 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12   818  		#address-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12   819  		#size-cells = <0>;
4664ebd8346adaa Apurva Nandan       2023-01-12   820  		clocks = <&k3_clks 276 2>;
4664ebd8346adaa Apurva Nandan       2023-01-12   821  		clock-names = "fck";
4664ebd8346adaa Apurva Nandan       2023-01-12   822  		power-domains = <&k3_pds 276 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12   823  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12   824  	};
4664ebd8346adaa Apurva Nandan       2023-01-12   825  
8082731a0c244f9 Vaishnav Achath     2024-02-15   826  	ti_csi2rx0: ticsi2rx@4500000 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   827  		compatible = "ti,j721e-csi2rx-shim";
8082731a0c244f9 Vaishnav Achath     2024-02-15   828  		reg = <0x00 0x04500000 0x00 0x00001000>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   829  		ranges;
8082731a0c244f9 Vaishnav Achath     2024-02-15   830  		#address-cells = <2>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   831  		#size-cells = <2>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   832  		dmas = <&main_bcdma_csi 0 0x4940 0>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   833  		dma-names = "rx0";
8082731a0c244f9 Vaishnav Achath     2024-02-15   834  		power-domains = <&k3_pds 72 TI_SCI_PD_EXCLUSIVE>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   835  		status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   836  
8082731a0c244f9 Vaishnav Achath     2024-02-15   837  		cdns_csi2rx0: csi-bridge@4504000 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   838  			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
8082731a0c244f9 Vaishnav Achath     2024-02-15   839  			reg = <0x00 0x04504000 0x00 0x00001000>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   840  			clocks = <&k3_clks 72 2>, <&k3_clks 72 0>, <&k3_clks 72 2>,
8082731a0c244f9 Vaishnav Achath     2024-02-15   841  				<&k3_clks 72 2>, <&k3_clks 72 3>, <&k3_clks 72 3>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   842  			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
8082731a0c244f9 Vaishnav Achath     2024-02-15   843  				"pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
8082731a0c244f9 Vaishnav Achath     2024-02-15   844  			phys = <&dphy0>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   845  			phy-names = "dphy";
8082731a0c244f9 Vaishnav Achath     2024-02-15   846  
8082731a0c244f9 Vaishnav Achath     2024-02-15   847  			ports {
8082731a0c244f9 Vaishnav Achath     2024-02-15   848  				#address-cells = <1>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   849  				#size-cells = <0>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   850  
8082731a0c244f9 Vaishnav Achath     2024-02-15   851  				csi0_port0: port@0 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   852  					reg = <0>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   853  					status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   854  				};
8082731a0c244f9 Vaishnav Achath     2024-02-15   855  
8082731a0c244f9 Vaishnav Achath     2024-02-15   856  				csi0_port1: port@1 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   857  					reg = <1>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   858  					status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   859  				};
8082731a0c244f9 Vaishnav Achath     2024-02-15   860  
8082731a0c244f9 Vaishnav Achath     2024-02-15   861  				csi0_port2: port@2 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   862  					reg = <2>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   863  					status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   864  				};
8082731a0c244f9 Vaishnav Achath     2024-02-15   865  
8082731a0c244f9 Vaishnav Achath     2024-02-15   866  				csi0_port3: port@3 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   867  					reg = <3>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   868  					status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   869  				};
8082731a0c244f9 Vaishnav Achath     2024-02-15   870  
8082731a0c244f9 Vaishnav Achath     2024-02-15   871  				csi0_port4: port@4 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   872  					reg = <4>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   873  					status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   874  				};
8082731a0c244f9 Vaishnav Achath     2024-02-15   875  			};
8082731a0c244f9 Vaishnav Achath     2024-02-15   876  		};
8082731a0c244f9 Vaishnav Achath     2024-02-15   877  	};
8082731a0c244f9 Vaishnav Achath     2024-02-15   878  
8082731a0c244f9 Vaishnav Achath     2024-02-15   879  	ti_csi2rx1: ticsi2rx@4510000 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   880  		compatible = "ti,j721e-csi2rx-shim";
8082731a0c244f9 Vaishnav Achath     2024-02-15   881  		reg = <0x00 0x04510000 0x00 0x1000>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   882  		ranges;
8082731a0c244f9 Vaishnav Achath     2024-02-15   883  		#address-cells = <2>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   884  		#size-cells = <2>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   885  		dmas = <&main_bcdma_csi 0 0x4960 0>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   886  		dma-names = "rx0";
8082731a0c244f9 Vaishnav Achath     2024-02-15   887  		power-domains = <&k3_pds 73 TI_SCI_PD_EXCLUSIVE>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   888  		status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   889  
8082731a0c244f9 Vaishnav Achath     2024-02-15   890  		cdns_csi2rx1: csi-bridge@4514000 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   891  			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
8082731a0c244f9 Vaishnav Achath     2024-02-15   892  			reg = <0x00 0x04514000 0x00 0x00001000>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   893  			clocks = <&k3_clks 73 2>, <&k3_clks 73 0>, <&k3_clks 73 2>,
8082731a0c244f9 Vaishnav Achath     2024-02-15   894  				<&k3_clks 73 2>, <&k3_clks 73 3>, <&k3_clks 73 3>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   895  			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
8082731a0c244f9 Vaishnav Achath     2024-02-15   896  				"pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
8082731a0c244f9 Vaishnav Achath     2024-02-15   897  			phys = <&dphy1>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   898  			phy-names = "dphy";
8082731a0c244f9 Vaishnav Achath     2024-02-15   899  			ports {
8082731a0c244f9 Vaishnav Achath     2024-02-15   900  				#address-cells = <1>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   901  				#size-cells = <0>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   902  
8082731a0c244f9 Vaishnav Achath     2024-02-15   903  				csi1_port0: port@0 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   904  					reg = <0>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   905  					status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   906  				};
8082731a0c244f9 Vaishnav Achath     2024-02-15   907  
8082731a0c244f9 Vaishnav Achath     2024-02-15   908  				csi1_port1: port@1 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   909  					reg = <1>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   910  					status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   911  				};
8082731a0c244f9 Vaishnav Achath     2024-02-15   912  
8082731a0c244f9 Vaishnav Achath     2024-02-15   913  				csi1_port2: port@2 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   914  					reg = <2>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   915  					status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   916  				};
8082731a0c244f9 Vaishnav Achath     2024-02-15   917  
8082731a0c244f9 Vaishnav Achath     2024-02-15   918  				csi1_port3: port@3 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   919  					reg = <3>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   920  					status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   921  				};
8082731a0c244f9 Vaishnav Achath     2024-02-15   922  
8082731a0c244f9 Vaishnav Achath     2024-02-15   923  				csi1_port4: port@4 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   924  					reg = <4>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   925  					status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   926  				};
8082731a0c244f9 Vaishnav Achath     2024-02-15   927  			};
8082731a0c244f9 Vaishnav Achath     2024-02-15   928  		};
8082731a0c244f9 Vaishnav Achath     2024-02-15   929  	};
8082731a0c244f9 Vaishnav Achath     2024-02-15   930  
8082731a0c244f9 Vaishnav Achath     2024-02-15   931  	ti_csi2rx2: ticsi2rx@4520000 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   932  		compatible = "ti,j721e-csi2rx-shim";
8082731a0c244f9 Vaishnav Achath     2024-02-15   933  		reg = <0x00 0x04520000 0x00 0x00001000>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   934  		ranges;
8082731a0c244f9 Vaishnav Achath     2024-02-15   935  		#address-cells = <2>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   936  		#size-cells = <2>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   937  		dmas = <&main_bcdma_csi 0 0x4980 0>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   938  		dma-names = "rx0";
8082731a0c244f9 Vaishnav Achath     2024-02-15   939  		power-domains = <&k3_pds 74 TI_SCI_PD_EXCLUSIVE>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   940  		status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   941  
8082731a0c244f9 Vaishnav Achath     2024-02-15   942  		cdns_csi2rx2: csi-bridge@4524000 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   943  			compatible = "ti,j721e-csi2rx", "cdns,csi2rx";
8082731a0c244f9 Vaishnav Achath     2024-02-15   944  			reg = <0x00 0x04524000 0x00 0x00001000>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   945  			clocks = <&k3_clks 74 2>, <&k3_clks 74 0>, <&k3_clks 74 2>,
8082731a0c244f9 Vaishnav Achath     2024-02-15   946  				<&k3_clks 74 2>, <&k3_clks 74 3>, <&k3_clks 74 3>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   947  			clock-names = "sys_clk", "p_clk", "pixel_if0_clk",
8082731a0c244f9 Vaishnav Achath     2024-02-15   948  				"pixel_if1_clk", "pixel_if2_clk", "pixel_if3_clk";
8082731a0c244f9 Vaishnav Achath     2024-02-15   949  			phys = <&dphy2>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   950  			phy-names = "dphy";
8082731a0c244f9 Vaishnav Achath     2024-02-15   951  
8082731a0c244f9 Vaishnav Achath     2024-02-15   952  			ports {
8082731a0c244f9 Vaishnav Achath     2024-02-15   953  				#address-cells = <1>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   954  				#size-cells = <0>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   955  
8082731a0c244f9 Vaishnav Achath     2024-02-15   956  				csi2_port0: port@0 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   957  					reg = <0>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   958  					status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   959  				};
8082731a0c244f9 Vaishnav Achath     2024-02-15   960  
8082731a0c244f9 Vaishnav Achath     2024-02-15   961  				csi2_port1: port@1 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   962  					reg = <1>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   963  					status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   964  				};
8082731a0c244f9 Vaishnav Achath     2024-02-15   965  
8082731a0c244f9 Vaishnav Achath     2024-02-15   966  				csi2_port2: port@2 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   967  					reg = <2>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   968  					status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   969  				};
8082731a0c244f9 Vaishnav Achath     2024-02-15   970  
8082731a0c244f9 Vaishnav Achath     2024-02-15   971  				csi2_port3: port@3 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   972  					reg = <3>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   973  					status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   974  				};
8082731a0c244f9 Vaishnav Achath     2024-02-15   975  
8082731a0c244f9 Vaishnav Achath     2024-02-15   976  				csi2_port4: port@4 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   977  					reg = <4>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   978  					status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   979  				};
8082731a0c244f9 Vaishnav Achath     2024-02-15   980  			};
8082731a0c244f9 Vaishnav Achath     2024-02-15   981  		};
8082731a0c244f9 Vaishnav Achath     2024-02-15   982  	};
8082731a0c244f9 Vaishnav Achath     2024-02-15   983  
8082731a0c244f9 Vaishnav Achath     2024-02-15   984  	dphy0: phy@4580000 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   985  		compatible = "cdns,dphy-rx";
8082731a0c244f9 Vaishnav Achath     2024-02-15   986  		reg = <0x00 0x04580000 0x00 0x00001100>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   987  		#phy-cells = <0>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   988  		power-domains = <&k3_pds 212 TI_SCI_PD_EXCLUSIVE>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   989  		status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   990  	};
8082731a0c244f9 Vaishnav Achath     2024-02-15   991  
8082731a0c244f9 Vaishnav Achath     2024-02-15   992  	dphy1: phy@4590000 {
8082731a0c244f9 Vaishnav Achath     2024-02-15   993  		compatible = "cdns,dphy-rx";
8082731a0c244f9 Vaishnav Achath     2024-02-15   994  		reg = <0x00 0x04590000 0x00 0x00001100>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   995  		#phy-cells = <0>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   996  		power-domains = <&k3_pds 213 TI_SCI_PD_EXCLUSIVE>;
8082731a0c244f9 Vaishnav Achath     2024-02-15   997  		status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15   998  	};
8082731a0c244f9 Vaishnav Achath     2024-02-15   999  
8082731a0c244f9 Vaishnav Achath     2024-02-15  1000  	dphy2: phy@45a0000 {
8082731a0c244f9 Vaishnav Achath     2024-02-15  1001  		compatible = "cdns,dphy-rx";
8082731a0c244f9 Vaishnav Achath     2024-02-15  1002  		reg = <0x00 0x045a0000 0x00 0x00001100>;
8082731a0c244f9 Vaishnav Achath     2024-02-15  1003  		#phy-cells = <0>;
8082731a0c244f9 Vaishnav Achath     2024-02-15  1004  		power-domains = <&k3_pds 214 TI_SCI_PD_EXCLUSIVE>;
8082731a0c244f9 Vaishnav Achath     2024-02-15  1005  		status = "disabled";
8082731a0c244f9 Vaishnav Achath     2024-02-15  1006  	};
8082731a0c244f9 Vaishnav Achath     2024-02-15  1007  
3cd27f5e39b9d29 Brandon Brnich      2024-03-08  1008  	vpu0: video-codec@4210000 {
3cd27f5e39b9d29 Brandon Brnich      2024-03-08  1009  		compatible = "ti,j721s2-wave521c", "cnm,wave521c";
3cd27f5e39b9d29 Brandon Brnich      2024-03-08  1010  		reg = <0x00 0x4210000 0x00 0x10000>;
3cd27f5e39b9d29 Brandon Brnich      2024-03-08  1011  		interrupts = <GIC_SPI 182 IRQ_TYPE_LEVEL_HIGH>;
3cd27f5e39b9d29 Brandon Brnich      2024-03-08  1012  		clocks = <&k3_clks 241 2>;
3cd27f5e39b9d29 Brandon Brnich      2024-03-08  1013  		power-domains = <&k3_pds 241 TI_SCI_PD_EXCLUSIVE>;
ebc10b12a1243d2 Brandon Brnich      2024-06-12  1014  		sram = <&main_navss_sram>;
ebc10b12a1243d2 Brandon Brnich      2024-06-12  1015  		sram-size = <0x10000>;
3cd27f5e39b9d29 Brandon Brnich      2024-03-08  1016  	};
3cd27f5e39b9d29 Brandon Brnich      2024-03-08  1017  
3cd27f5e39b9d29 Brandon Brnich      2024-03-08  1018  	vpu1: video-codec@4220000 {
3cd27f5e39b9d29 Brandon Brnich      2024-03-08  1019  		compatible = "ti,j721s2-wave521c", "cnm,wave521c";
3cd27f5e39b9d29 Brandon Brnich      2024-03-08  1020  		reg = <0x00 0x4220000 0x00 0x10000>;
3cd27f5e39b9d29 Brandon Brnich      2024-03-08  1021  		interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
3cd27f5e39b9d29 Brandon Brnich      2024-03-08  1022  		clocks = <&k3_clks 242 2>;
3cd27f5e39b9d29 Brandon Brnich      2024-03-08  1023  		power-domains = <&k3_pds 242 TI_SCI_PD_EXCLUSIVE>;
ebc10b12a1243d2 Brandon Brnich      2024-06-12  1024  		sram = <&main_navss_sram>;
ebc10b12a1243d2 Brandon Brnich      2024-06-12  1025  		sram-size = <0x10000>;
3cd27f5e39b9d29 Brandon Brnich      2024-03-08  1026  	};
3cd27f5e39b9d29 Brandon Brnich      2024-03-08  1027  
4664ebd8346adaa Apurva Nandan       2023-01-12  1028  	main_sdhci0: mmc@4f80000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1029  		compatible = "ti,j721e-sdhci-8bit";
4664ebd8346adaa Apurva Nandan       2023-01-12  1030  		reg = <0x00 0x04f80000 0x00 0x1000>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1031  		      <0x00 0x04f88000 0x00 0x400>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1032  		interrupts = <GIC_SPI 3 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1033  		power-domains = <&k3_pds 140 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1034  		clocks = <&k3_clks 140 1>, <&k3_clks 140 2>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1035  		clock-names = "clk_ahb", "clk_xin";
4664ebd8346adaa Apurva Nandan       2023-01-12  1036  		assigned-clocks = <&k3_clks 140 2>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1037  		assigned-clock-parents = <&k3_clks 140 3>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1038  		bus-width = <8>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1039  		ti,otap-del-sel-legacy = <0x0>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1040  		ti,otap-del-sel-mmc-hs = <0x0>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1041  		ti,otap-del-sel-ddr52 = <0x6>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1042  		ti,otap-del-sel-hs200 = <0x8>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1043  		ti,otap-del-sel-hs400 = <0x5>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1044  		ti,itap-del-sel-legacy = <0x10>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1045  		ti,itap-del-sel-mmc-hs = <0xa>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1046  		ti,strobe-sel = <0x77>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1047  		ti,clkbuf-sel = <0x7>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1048  		ti,trm-icp = <0x8>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1049  		mmc-ddr-1_8v;
4664ebd8346adaa Apurva Nandan       2023-01-12  1050  		mmc-hs200-1_8v;
4664ebd8346adaa Apurva Nandan       2023-01-12  1051  		mmc-hs400-1_8v;
4664ebd8346adaa Apurva Nandan       2023-01-12  1052  		dma-coherent;
4664ebd8346adaa Apurva Nandan       2023-01-12  1053  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1054  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  1055  
4664ebd8346adaa Apurva Nandan       2023-01-12  1056  	main_sdhci1: mmc@4fb0000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1057  		compatible = "ti,j721e-sdhci-4bit";
4664ebd8346adaa Apurva Nandan       2023-01-12  1058  		reg = <0x00 0x04fb0000 0x00 0x1000>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1059  		      <0x00 0x04fb8000 0x00 0x400>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1060  		interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1061  		power-domains = <&k3_pds 141 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1062  		clocks = <&k3_clks 141 3>, <&k3_clks 141 4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1063  		clock-names = "clk_ahb", "clk_xin";
4664ebd8346adaa Apurva Nandan       2023-01-12  1064  		assigned-clocks = <&k3_clks 141 4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1065  		assigned-clock-parents = <&k3_clks 141 5>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1066  		bus-width = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1067  		ti,otap-del-sel-legacy = <0x0>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1068  		ti,otap-del-sel-sd-hs = <0x0>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1069  		ti,otap-del-sel-sdr12 = <0xf>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1070  		ti,otap-del-sel-sdr25 = <0xf>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1071  		ti,otap-del-sel-sdr50 = <0xc>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1072  		ti,otap-del-sel-sdr104 = <0x5>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1073  		ti,otap-del-sel-ddr50 = <0xc>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1074  		ti,itap-del-sel-legacy = <0x0>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1075  		ti,itap-del-sel-sd-hs = <0x0>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1076  		ti,itap-del-sel-sdr12 = <0x0>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1077  		ti,itap-del-sel-sdr25 = <0x0>;
b973ea55ab2630c Bhavya Kapoor       2023-12-01  1078  		ti,itap-del-sel-ddr50 = <0x2>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1079  		ti,clkbuf-sel = <0x7>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1080  		ti,trm-icp = <0x8>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1081  		dma-coherent;
4664ebd8346adaa Apurva Nandan       2023-01-12  1082  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1083  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  1084  
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1085  	pcie0_rc: pcie@2900000 {
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1086  		compatible = "ti,j784s4-pcie-host";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1087  		reg = <0x00 0x02900000 0x00 0x1000>,
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1088  		      <0x00 0x02907000 0x00 0x400>,
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1089  		      <0x00 0x0d000000 0x00 0x00800000>,
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1090  		      <0x00 0x10000000 0x00 0x00001000>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1091  		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1092  		interrupt-names = "link_state";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1093  		interrupts = <GIC_SPI 318 IRQ_TYPE_EDGE_RISING>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1094  		device_type = "pci";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1095  		ti,syscon-pcie-ctrl = <&pcie0_ctrl 0x0>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1096  		max-link-speed = <3>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1097  		num-lanes = <4>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1098  		power-domains = <&k3_pds 332 TI_SCI_PD_EXCLUSIVE>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1099  		clocks = <&k3_clks 332 0>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1100  		clock-names = "fck";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1101  		#address-cells = <3>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1102  		#size-cells = <2>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1103  		bus-range = <0x0 0xff>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1104  		vendor-id = <0x104c>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1105  		device-id = <0xb012>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1106  		msi-map = <0x0 &gic_its 0x0 0x10000>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1107  		dma-coherent;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1108  		ranges = <0x01000000 0x0 0x10001000 0x0 0x10001000 0x0 0x0010000>,
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1109  			 <0x02000000 0x0 0x10011000 0x0 0x10011000 0x0 0x7fef000>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1110  		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1111  		status = "disabled";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1112  	};
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1113  
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1114  	pcie1_rc: pcie@2910000 {
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1115  		compatible = "ti,j784s4-pcie-host";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1116  		reg = <0x00 0x02910000 0x00 0x1000>,
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1117  		      <0x00 0x02917000 0x00 0x400>,
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1118  		      <0x00 0x0d800000 0x00 0x00800000>,
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1119  		      <0x00 0x18000000 0x00 0x00001000>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1120  		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1121  		interrupt-names = "link_state";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1122  		interrupts = <GIC_SPI 330 IRQ_TYPE_EDGE_RISING>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1123  		device_type = "pci";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1124  		ti,syscon-pcie-ctrl = <&pcie1_ctrl 0x0>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1125  		max-link-speed = <3>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1126  		num-lanes = <4>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1127  		power-domains = <&k3_pds 333 TI_SCI_PD_EXCLUSIVE>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1128  		clocks = <&k3_clks 333 0>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1129  		clock-names = "fck";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1130  		#address-cells = <3>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1131  		#size-cells = <2>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1132  		bus-range = <0x0 0xff>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1133  		vendor-id = <0x104c>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1134  		device-id = <0xb012>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1135  		msi-map = <0x0 &gic_its 0x10000 0x10000>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1136  		dma-coherent;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1137  		ranges = <0x01000000 0x0 0x18001000  0x00 0x18001000  0x0 0x0010000>,
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1138  			 <0x02000000 0x0 0x18011000  0x00 0x18011000  0x0 0x7fef000>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1139  		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1140  		status = "disabled";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1141  	};
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1142  
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1143  	pcie2_rc: pcie@2920000 {
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1144  		compatible = "ti,j784s4-pcie-host";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1145  		reg = <0x00 0x02920000 0x00 0x1000>,
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1146  		      <0x00 0x02927000 0x00 0x400>,
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1147  		      <0x00 0x0e000000 0x00 0x00800000>,
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1148  		      <0x44 0x00000000 0x00 0x00001000>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1149  		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1150  		interrupt-names = "link_state";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1151  		interrupts = <GIC_SPI 342 IRQ_TYPE_EDGE_RISING>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1152  		device_type = "pci";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1153  		ti,syscon-pcie-ctrl = <&pcie2_ctrl 0x0>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1154  		max-link-speed = <3>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1155  		num-lanes = <2>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1156  		power-domains = <&k3_pds 334 TI_SCI_PD_EXCLUSIVE>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1157  		clocks = <&k3_clks 334 0>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1158  		clock-names = "fck";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1159  		#address-cells = <3>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1160  		#size-cells = <2>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1161  		bus-range = <0x0 0xff>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1162  		vendor-id = <0x104c>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1163  		device-id = <0xb012>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1164  		msi-map = <0x0 &gic_its 0x20000 0x10000>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1165  		dma-coherent;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1166  		ranges = <0x01000000 0x0 0x00001000 0x44 0x00001000 0x0 0x0010000>,
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1167  			 <0x02000000 0x0 0x00011000 0x44 0x00011000 0x0 0x7fef000>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1168  		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1169  		status = "disabled";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1170  	};
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1171  
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1172  	pcie3_rc: pcie@2930000 {
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1173  		compatible = "ti,j784s4-pcie-host";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1174  		reg = <0x00 0x02930000 0x00 0x1000>,
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1175  		      <0x00 0x02937000 0x00 0x400>,
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1176  		      <0x00 0x0e800000 0x00 0x00800000>,
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1177  		      <0x44 0x10000000 0x00 0x00001000>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1178  		reg-names = "intd_cfg", "user_cfg", "reg", "cfg";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1179  		interrupt-names = "link_state";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1180  		interrupts = <GIC_SPI 354 IRQ_TYPE_EDGE_RISING>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1181  		device_type = "pci";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1182  		ti,syscon-pcie-ctrl = <&pcie3_ctrl 0x0>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1183  		max-link-speed = <3>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1184  		num-lanes = <2>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1185  		power-domains = <&k3_pds 335 TI_SCI_PD_EXCLUSIVE>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1186  		clocks = <&k3_clks 335 0>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1187  		clock-names = "fck";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1188  		#address-cells = <3>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1189  		#size-cells = <2>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1190  		bus-range = <0x0 0xff>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1191  		vendor-id = <0x104c>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1192  		device-id = <0xb012>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1193  		msi-map = <0x0 &gic_its 0x30000 0x10000>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1194  		dma-coherent;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1195  		ranges = <0x01000000 0x0 0x00001000 0x44 0x10001000 0x0 0x0010000>,
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1196  			 <0x02000000 0x0 0x00011000 0x44 0x10011000 0x0 0x7fef000>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1197  		dma-ranges = <0x02000000 0x0 0x0 0x0 0x0 0x10000 0x0>;
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1198  		status = "disabled";
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1199  	};
3d8a27b48060505 Siddharth Vadapalli 2024-05-25  1200  
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1201  	serdes_wiz0: wiz@5060000 {
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1202  		compatible = "ti,j784s4-wiz-10g";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1203  		#address-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1204  		#size-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1205  		power-domains = <&k3_pds 404 TI_SCI_PD_EXCLUSIVE>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1206  		clocks = <&k3_clks 404 2>, <&k3_clks 404 6>, <&serdes_refclk>, <&k3_clks 404 5>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1207  		clock-names = "fck", "core_ref_clk", "ext_ref_clk", "core_ref1_clk";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1208  		assigned-clocks = <&k3_clks 404 6>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1209  		assigned-clock-parents = <&k3_clks 404 10>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1210  		num-lanes = <4>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1211  		#reset-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1212  		#clock-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1213  		ranges = <0x5060000 0x00 0x5060000 0x10000>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1214  		status = "disabled";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1215  
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1216  		serdes0: serdes@5060000 {
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1217  			compatible = "ti,j721e-serdes-10g";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1218  			reg = <0x05060000 0x010000>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1219  			reg-names = "torrent_phy";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1220  			resets = <&serdes_wiz0 0>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1221  			reset-names = "torrent_reset";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1222  			clocks = <&serdes_wiz0 TI_WIZ_PLL0_REFCLK>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1223  				 <&serdes_wiz0 TI_WIZ_PHY_EN_REFCLK>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1224  			clock-names = "refclk", "phy_en_refclk";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1225  			assigned-clocks = <&serdes_wiz0 TI_WIZ_PLL0_REFCLK>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1226  					  <&serdes_wiz0 TI_WIZ_PLL1_REFCLK>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1227  					  <&serdes_wiz0 TI_WIZ_REFCLK_DIG>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1228  			assigned-clock-parents = <&k3_clks 404 6>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1229  						 <&k3_clks 404 6>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1230  						 <&k3_clks 404 6>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1231  			#address-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1232  			#size-cells = <0>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1233  			#clock-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1234  			status = "disabled";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1235  		};
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1236  	};
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1237  
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1238  	serdes_wiz1: wiz@5070000 {
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1239  		compatible = "ti,j784s4-wiz-10g";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1240  		#address-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1241  		#size-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1242  		power-domains = <&k3_pds 405 TI_SCI_PD_EXCLUSIVE>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1243  		clocks = <&k3_clks 405 2>, <&k3_clks 405 6>, <&serdes_refclk>, <&k3_clks 405 5>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1244  		clock-names = "fck", "core_ref_clk", "ext_ref_clk", "core_ref1_clk";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1245  		assigned-clocks = <&k3_clks 405 6>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1246  		assigned-clock-parents = <&k3_clks 405 10>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1247  		num-lanes = <4>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1248  		#reset-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1249  		#clock-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1250  		ranges = <0x05070000 0x00 0x05070000 0x10000>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1251  		status = "disabled";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1252  
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1253  		serdes1: serdes@5070000 {
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1254  			compatible = "ti,j721e-serdes-10g";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1255  			reg = <0x05070000 0x010000>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1256  			reg-names = "torrent_phy";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1257  			resets = <&serdes_wiz1 0>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1258  			reset-names = "torrent_reset";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1259  			clocks = <&serdes_wiz1 TI_WIZ_PLL0_REFCLK>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1260  				 <&serdes_wiz1 TI_WIZ_PHY_EN_REFCLK>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1261  			clock-names = "refclk", "phy_en_refclk";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1262  			assigned-clocks = <&serdes_wiz1 TI_WIZ_PLL0_REFCLK>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1263  					  <&serdes_wiz1 TI_WIZ_PLL1_REFCLK>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1264  					  <&serdes_wiz1 TI_WIZ_REFCLK_DIG>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1265  			assigned-clock-parents = <&k3_clks 405 6>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1266  						 <&k3_clks 405 6>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1267  						 <&k3_clks 405 6>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1268  			#address-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1269  			#size-cells = <0>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1270  			#clock-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1271  			status = "disabled";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1272  		};
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1273  	};
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1274  
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1275  	serdes_wiz2: wiz@5020000 {
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1276  		compatible = "ti,j784s4-wiz-10g";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1277  		#address-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1278  		#size-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1279  		power-domains = <&k3_pds 406 TI_SCI_PD_EXCLUSIVE>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1280  		clocks = <&k3_clks 406 2>, <&k3_clks 406 6>, <&serdes_refclk>, <&k3_clks 406 5>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1281  		clock-names = "fck", "core_ref_clk", "ext_ref_clk", "core_ref1_clk";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1282  		assigned-clocks = <&k3_clks 406 6>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1283  		assigned-clock-parents = <&k3_clks 406 10>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1284  		num-lanes = <4>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1285  		#reset-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1286  		#clock-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1287  		ranges = <0x05020000 0x00 0x05020000 0x10000>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1288  		status = "disabled";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1289  
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1290  		serdes2: serdes@5020000 {
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1291  			compatible = "ti,j721e-serdes-10g";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1292  			reg = <0x05020000 0x010000>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1293  			reg-names = "torrent_phy";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1294  			resets = <&serdes_wiz2 0>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1295  			reset-names = "torrent_reset";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1296  			clocks = <&serdes_wiz2 TI_WIZ_PLL0_REFCLK>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1297  				 <&serdes_wiz2 TI_WIZ_PHY_EN_REFCLK>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1298  			clock-names = "refclk", "phy_en_refclk";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1299  			assigned-clocks = <&serdes_wiz2 TI_WIZ_PLL0_REFCLK>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1300  					  <&serdes_wiz2 TI_WIZ_PLL1_REFCLK>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1301  					  <&serdes_wiz2 TI_WIZ_REFCLK_DIG>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1302  			assigned-clock-parents = <&k3_clks 406 6>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1303  						 <&k3_clks 406 6>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1304  						 <&k3_clks 406 6>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1305  			#address-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1306  			#size-cells = <0>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1307  			#clock-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1308  			status = "disabled";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1309  		};
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1310  	};
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1311  
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1312  	serdes_wiz4: wiz@5050000 {
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1313  		compatible = "ti,j784s4-wiz-10g";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1314  		#address-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1315  		#size-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1316  		power-domains = <&k3_pds 407 TI_SCI_PD_EXCLUSIVE>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1317  		clocks = <&k3_clks 407 2>, <&k3_clks 407 6>, <&serdes_refclk>, <&k3_clks 407 5>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1318  		clock-names = "fck", "core_ref_clk", "ext_ref_clk", "core_ref1_clk";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1319  		assigned-clocks = <&k3_clks 407 6>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1320  		assigned-clock-parents = <&k3_clks 407 10>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1321  		num-lanes = <4>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1322  		#reset-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1323  		#clock-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1324  		ranges = <0x05050000 0x00 0x05050000 0x10000>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1325  			 <0xa030a00 0x00 0xa030a00 0x40>; /* DPTX PHY */
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1326  		status = "disabled";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1327  
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1328  		serdes4: serdes@5050000 {
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1329  			/*
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1330  			 * Note: we also map DPTX PHY registers as the Torrent
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1331  			 * needs to manage those.
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1332  			 */
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1333  			compatible = "ti,j721e-serdes-10g";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1334  			reg = <0x05050000 0x010000>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1335  			      <0x0a030a00 0x40>; /* DPTX PHY */
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1336  			reg-names = "torrent_phy";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1337  			resets = <&serdes_wiz4 0>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1338  			reset-names = "torrent_reset";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1339  			clocks = <&serdes_wiz4 TI_WIZ_PLL0_REFCLK>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1340  				 <&serdes_wiz4 TI_WIZ_PHY_EN_REFCLK>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1341  			clock-names = "refclk", "phy_en_refclk";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1342  			assigned-clocks = <&serdes_wiz4 TI_WIZ_PLL0_REFCLK>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1343  					  <&serdes_wiz4 TI_WIZ_PLL1_REFCLK>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1344  					  <&serdes_wiz4 TI_WIZ_REFCLK_DIG>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1345  			assigned-clock-parents = <&k3_clks 407 6>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1346  						 <&k3_clks 407 6>,
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1347  						 <&k3_clks 407 6>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1348  			#address-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1349  			#size-cells = <0>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1350  			#clock-cells = <1>;
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1351  			status = "disabled";
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1352  		};
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1353  	};
4e5d2cb0b0c4a04 Siddharth Vadapalli 2023-10-19  1354  
4664ebd8346adaa Apurva Nandan       2023-01-12  1355  	main_navss: bus@30000000 {
3a4086985696295 Apurva Nandan       2023-08-12  1356  		bootph-all;
4664ebd8346adaa Apurva Nandan       2023-01-12  1357  		compatible = "simple-bus";
4664ebd8346adaa Apurva Nandan       2023-01-12  1358  		#address-cells = <2>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1359  		#size-cells = <2>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1360  		ranges = <0x00 0x30000000 0x00 0x30000000 0x00 0x0c400000>;
436b288687176bf Jayesh Choudhary    2023-03-14  1361  		ti,sci-dev-id = <280>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1362  		dma-coherent;
4664ebd8346adaa Apurva Nandan       2023-01-12  1363  		dma-ranges;
4664ebd8346adaa Apurva Nandan       2023-01-12  1364  
ebc10b12a1243d2 Brandon Brnich      2024-06-12  1365  		main_navss_sram: navss-sram@30000000{
ebc10b12a1243d2 Brandon Brnich      2024-06-12  1366  			compatible = "mmio-sram";
ebc10b12a1243d2 Brandon Brnich      2024-06-12  1367  			reg = <0x00 0x30000000 0x00 0x10000>;
ebc10b12a1243d2 Brandon Brnich      2024-06-12  1368  			#address-cells = <1>;
ebc10b12a1243d2 Brandon Brnich      2024-06-12  1369  			#size-cells = <1>;
ebc10b12a1243d2 Brandon Brnich      2024-06-12  1370  			ranges = <0x0 0x00 0x30000000 0x10000>;
ebc10b12a1243d2 Brandon Brnich      2024-06-12  1371  		};
ebc10b12a1243d2 Brandon Brnich      2024-06-12  1372  
4664ebd8346adaa Apurva Nandan       2023-01-12  1373  		main_navss_intr: interrupt-controller@310e0000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1374  			compatible = "ti,sci-intr";
4664ebd8346adaa Apurva Nandan       2023-01-12  1375  			reg = <0x00 0x310e0000 0x00 0x4000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1376  			ti,intr-trigger-type = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1377  			interrupt-controller;
4664ebd8346adaa Apurva Nandan       2023-01-12  1378  			interrupt-parent = <&gic500>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1379  			#interrupt-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1380  			ti,sci = <&sms>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1381  			ti,sci-dev-id = <283>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1382  			ti,interrupt-ranges = <0 64 64>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1383  					      <64 448 64>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1384  					      <128 672 64>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1385  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1386  
4664ebd8346adaa Apurva Nandan       2023-01-12  1387  		main_udmass_inta: msi-controller@33d00000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1388  			compatible = "ti,sci-inta";
4664ebd8346adaa Apurva Nandan       2023-01-12  1389  			reg = <0x00 0x33d00000 0x00 0x100000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1390  			interrupt-controller;
4664ebd8346adaa Apurva Nandan       2023-01-12  1391  			#interrupt-cells = <0>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1392  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1393  			msi-controller;
4664ebd8346adaa Apurva Nandan       2023-01-12  1394  			ti,sci = <&sms>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1395  			ti,sci-dev-id = <321>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1396  			ti,interrupt-ranges = <0 0 256>;
3b61c1d88ddce68 Vaishnav Achath     2023-10-10  1397  			ti,unmapped-event-sources = <&main_bcdma_csi>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1398  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1399  
4664ebd8346adaa Apurva Nandan       2023-01-12  1400  		secure_proxy_main: mailbox@32c00000 {
3a4086985696295 Apurva Nandan       2023-08-12  1401  			bootph-all;
4664ebd8346adaa Apurva Nandan       2023-01-12  1402  			compatible = "ti,am654-secure-proxy";
4664ebd8346adaa Apurva Nandan       2023-01-12  1403  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1404  			reg-names = "target_data", "rt", "scfg";
4664ebd8346adaa Apurva Nandan       2023-01-12  1405  			reg = <0x00 0x32c00000 0x00 0x100000>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1406  			      <0x00 0x32400000 0x00 0x100000>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1407  			      <0x00 0x32800000 0x00 0x100000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1408  			interrupt-names = "rx_011";
4664ebd8346adaa Apurva Nandan       2023-01-12  1409  			interrupts = <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1410  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1411  
4664ebd8346adaa Apurva Nandan       2023-01-12  1412  		hwspinlock: hwlock@30e00000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1413  			compatible = "ti,am654-hwspinlock";
4664ebd8346adaa Apurva Nandan       2023-01-12  1414  			reg = <0x00 0x30e00000 0x00 0x1000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1415  			#hwlock-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1416  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1417  
4664ebd8346adaa Apurva Nandan       2023-01-12  1418  		mailbox0_cluster0: mailbox@31f80000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1419  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1420  			reg = <0x00 0x31f80000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1421  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1422  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1423  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1424  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1425  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1426  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1427  
4664ebd8346adaa Apurva Nandan       2023-01-12  1428  		mailbox0_cluster1: mailbox@31f81000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1429  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1430  			reg = <0x00 0x31f81000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1431  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1432  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1433  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1434  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1435  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1436  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1437  
4664ebd8346adaa Apurva Nandan       2023-01-12  1438  		mailbox0_cluster2: mailbox@31f82000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1439  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1440  			reg = <0x00 0x31f82000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1441  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1442  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1443  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1444  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1445  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1446  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1447  
4664ebd8346adaa Apurva Nandan       2023-01-12  1448  		mailbox0_cluster3: mailbox@31f83000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1449  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1450  			reg = <0x00 0x31f83000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1451  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1452  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1453  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1454  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1455  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1456  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1457  
4664ebd8346adaa Apurva Nandan       2023-01-12  1458  		mailbox0_cluster4: mailbox@31f84000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1459  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1460  			reg = <0x00 0x31f84000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1461  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1462  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1463  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1464  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1465  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1466  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1467  
4664ebd8346adaa Apurva Nandan       2023-01-12  1468  		mailbox0_cluster5: mailbox@31f85000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1469  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1470  			reg = <0x00 0x31f85000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1471  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1472  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1473  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1474  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1475  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1476  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1477  
4664ebd8346adaa Apurva Nandan       2023-01-12  1478  		mailbox0_cluster6: mailbox@31f86000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1479  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1480  			reg = <0x00 0x31f86000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1481  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1482  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1483  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1484  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1485  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1486  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1487  
4664ebd8346adaa Apurva Nandan       2023-01-12  1488  		mailbox0_cluster7: mailbox@31f87000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1489  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1490  			reg = <0x00 0x31f87000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1491  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1492  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1493  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1494  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1495  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1496  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1497  
4664ebd8346adaa Apurva Nandan       2023-01-12  1498  		mailbox0_cluster8: mailbox@31f88000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1499  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1500  			reg = <0x00 0x31f88000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1501  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1502  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1503  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1504  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1505  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1506  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1507  
4664ebd8346adaa Apurva Nandan       2023-01-12  1508  		mailbox0_cluster9: mailbox@31f89000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1509  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1510  			reg = <0x00 0x31f89000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1511  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1512  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1513  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1514  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1515  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1516  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1517  
4664ebd8346adaa Apurva Nandan       2023-01-12  1518  		mailbox0_cluster10: mailbox@31f8a000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1519  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1520  			reg = <0x00 0x31f8a000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1521  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1522  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1523  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1524  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1525  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1526  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1527  
4664ebd8346adaa Apurva Nandan       2023-01-12  1528  		mailbox0_cluster11: mailbox@31f8b000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1529  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1530  			reg = <0x00 0x31f8b000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1531  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1532  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1533  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1534  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1535  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1536  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1537  
4664ebd8346adaa Apurva Nandan       2023-01-12  1538  		mailbox1_cluster0: mailbox@31f90000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1539  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1540  			reg = <0x00 0x31f90000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1541  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1542  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1543  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1544  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1545  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1546  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1547  
4664ebd8346adaa Apurva Nandan       2023-01-12  1548  		mailbox1_cluster1: mailbox@31f91000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1549  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1550  			reg = <0x00 0x31f91000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1551  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1552  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1553  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1554  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1555  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1556  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1557  
4664ebd8346adaa Apurva Nandan       2023-01-12  1558  		mailbox1_cluster2: mailbox@31f92000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1559  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1560  			reg = <0x00 0x31f92000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1561  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1562  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1563  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1564  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1565  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1566  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1567  
4664ebd8346adaa Apurva Nandan       2023-01-12  1568  		mailbox1_cluster3: mailbox@31f93000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1569  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1570  			reg = <0x00 0x31f93000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1571  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1572  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1573  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1574  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1575  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1576  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1577  
4664ebd8346adaa Apurva Nandan       2023-01-12  1578  		mailbox1_cluster4: mailbox@31f94000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1579  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1580  			reg = <0x00 0x31f94000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1581  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1582  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1583  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1584  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1585  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1586  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1587  
4664ebd8346adaa Apurva Nandan       2023-01-12  1588  		mailbox1_cluster5: mailbox@31f95000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1589  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1590  			reg = <0x00 0x31f95000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1591  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1592  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1593  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1594  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1595  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1596  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1597  
4664ebd8346adaa Apurva Nandan       2023-01-12  1598  		mailbox1_cluster6: mailbox@31f96000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1599  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1600  			reg = <0x00 0x31f96000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1601  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1602  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1603  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1604  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1605  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1606  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1607  
4664ebd8346adaa Apurva Nandan       2023-01-12  1608  		mailbox1_cluster7: mailbox@31f97000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1609  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1610  			reg = <0x00 0x31f97000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1611  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1612  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1613  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1614  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1615  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1616  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1617  
4664ebd8346adaa Apurva Nandan       2023-01-12  1618  		mailbox1_cluster8: mailbox@31f98000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1619  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1620  			reg = <0x00 0x31f98000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1621  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1622  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1623  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1624  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1625  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1626  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1627  
4664ebd8346adaa Apurva Nandan       2023-01-12  1628  		mailbox1_cluster9: mailbox@31f99000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1629  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1630  			reg = <0x00 0x31f99000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1631  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1632  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1633  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1634  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1635  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1636  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1637  
4664ebd8346adaa Apurva Nandan       2023-01-12  1638  		mailbox1_cluster10: mailbox@31f9a000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1639  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1640  			reg = <0x00 0x31f9a000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1641  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1642  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1643  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1644  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1645  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1646  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1647  
4664ebd8346adaa Apurva Nandan       2023-01-12  1648  		mailbox1_cluster11: mailbox@31f9b000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1649  			compatible = "ti,am654-mailbox";
4664ebd8346adaa Apurva Nandan       2023-01-12  1650  			reg = <0x00 0x31f9b000 0x00 0x200>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1651  			#mbox-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1652  			ti,mbox-num-users = <4>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1653  			ti,mbox-num-fifos = <16>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1654  			interrupt-parent = <&main_navss_intr>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1655  			status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1656  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1657  
4664ebd8346adaa Apurva Nandan       2023-01-12  1658  		main_ringacc: ringacc@3c000000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1659  			compatible = "ti,am654-navss-ringacc";
4664ebd8346adaa Apurva Nandan       2023-01-12  1660  			reg = <0x00 0x3c000000 0x00 0x400000>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1661  			      <0x00 0x38000000 0x00 0x400000>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1662  			      <0x00 0x31120000 0x00 0x100>,
702110c2be999c1 Vignesh Raghavendra 2023-08-09  1663  			      <0x00 0x33000000 0x00 0x40000>,
702110c2be999c1 Vignesh Raghavendra 2023-08-09  1664  			      <0x00 0x31080000 0x00 0x40000>;
702110c2be999c1 Vignesh Raghavendra 2023-08-09  1665  			reg-names = "rt", "fifos", "proxy_gcfg", "proxy_target", "cfg";
4664ebd8346adaa Apurva Nandan       2023-01-12  1666  			ti,num-rings = <1024>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1667  			ti,sci-rm-range-gp-rings = <0x1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1668  			ti,sci = <&sms>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1669  			ti,sci-dev-id = <315>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1670  			msi-parent = <&main_udmass_inta>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1671  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1672  
4664ebd8346adaa Apurva Nandan       2023-01-12  1673  		main_udmap: dma-controller@31150000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1674  			compatible = "ti,j721e-navss-main-udmap";
4664ebd8346adaa Apurva Nandan       2023-01-12  1675  			reg = <0x00 0x31150000 0x00 0x100>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1676  			      <0x00 0x34000000 0x00 0x80000>,
22a8434daa92a0f Manorit Chawdhry    2023-12-13  1677  			      <0x00 0x35000000 0x00 0x200000>,
22a8434daa92a0f Manorit Chawdhry    2023-12-13  1678  			      <0x00 0x30b00000 0x00 0x20000>,
22a8434daa92a0f Manorit Chawdhry    2023-12-13  1679  			      <0x00 0x30c00000 0x00 0x8000>,
22a8434daa92a0f Manorit Chawdhry    2023-12-13  1680  			      <0x00 0x30d00000 0x00 0x4000>;
22a8434daa92a0f Manorit Chawdhry    2023-12-13  1681  			reg-names = "gcfg", "rchanrt", "tchanrt",
22a8434daa92a0f Manorit Chawdhry    2023-12-13  1682  				    "tchan", "rchan", "rflow";
4664ebd8346adaa Apurva Nandan       2023-01-12  1683  			msi-parent = <&main_udmass_inta>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1684  			#dma-cells = <1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1685  
4664ebd8346adaa Apurva Nandan       2023-01-12  1686  			ti,sci = <&sms>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1687  			ti,sci-dev-id = <319>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1688  			ti,ringacc = <&main_ringacc>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1689  
4664ebd8346adaa Apurva Nandan       2023-01-12  1690  			ti,sci-rm-range-tchan = <0x0d>, /* TX_CHAN */
4664ebd8346adaa Apurva Nandan       2023-01-12  1691  						<0x0f>, /* TX_HCHAN */
4664ebd8346adaa Apurva Nandan       2023-01-12  1692  						<0x10>; /* TX_UHCHAN */
4664ebd8346adaa Apurva Nandan       2023-01-12  1693  			ti,sci-rm-range-rchan = <0x0a>, /* RX_CHAN */
4664ebd8346adaa Apurva Nandan       2023-01-12  1694  						<0x0b>, /* RX_HCHAN */
4664ebd8346adaa Apurva Nandan       2023-01-12  1695  						<0x0c>; /* RX_UHCHAN */
4664ebd8346adaa Apurva Nandan       2023-01-12  1696  			ti,sci-rm-range-rflow = <0x00>; /* GP RFLOW */
4664ebd8346adaa Apurva Nandan       2023-01-12  1697  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1698  
3b61c1d88ddce68 Vaishnav Achath     2023-10-10  1699  		main_bcdma_csi: dma-controller@311a0000 {
3b61c1d88ddce68 Vaishnav Achath     2023-10-10  1700  			compatible = "ti,j721s2-dmss-bcdma-csi";
3b61c1d88ddce68 Vaishnav Achath     2023-10-10  1701  			reg = <0x00 0x311a0000 0x00 0x100>,
3b61c1d88ddce68 Vaishnav Achath     2023-10-10  1702  			      <0x00 0x35d00000 0x00 0x20000>,
3b61c1d88ddce68 Vaishnav Achath     2023-10-10  1703  			      <0x00 0x35c00000 0x00 0x10000>,
3b61c1d88ddce68 Vaishnav Achath     2023-10-10  1704  			      <0x00 0x35e00000 0x00 0x80000>;
3b61c1d88ddce68 Vaishnav Achath     2023-10-10  1705  			reg-names = "gcfg", "rchanrt", "tchanrt", "ringrt";
3b61c1d88ddce68 Vaishnav Achath     2023-10-10  1706  			msi-parent = <&main_udmass_inta>;
3b61c1d88ddce68 Vaishnav Achath     2023-10-10  1707  			#dma-cells = <3>;
3b61c1d88ddce68 Vaishnav Achath     2023-10-10  1708  			ti,sci = <&sms>;
3b61c1d88ddce68 Vaishnav Achath     2023-10-10  1709  			ti,sci-dev-id = <281>;
3b61c1d88ddce68 Vaishnav Achath     2023-10-10  1710  			ti,sci-rm-range-rchan = <0x21>;
3b61c1d88ddce68 Vaishnav Achath     2023-10-10  1711  			ti,sci-rm-range-tchan = <0x22>;
3b61c1d88ddce68 Vaishnav Achath     2023-10-10  1712  		};
3b61c1d88ddce68 Vaishnav Achath     2023-10-10  1713  
4664ebd8346adaa Apurva Nandan       2023-01-12  1714  		cpts@310d0000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1715  			compatible = "ti,j721e-cpts";
4664ebd8346adaa Apurva Nandan       2023-01-12  1716  			reg = <0x00 0x310d0000 0x00 0x400>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1717  			reg-names = "cpts";
4664ebd8346adaa Apurva Nandan       2023-01-12  1718  			clocks = <&k3_clks 282 0>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1719  			clock-names = "cpts";
4664ebd8346adaa Apurva Nandan       2023-01-12  1720  			assigned-clocks = <&k3_clks 62 3>; /* CPTS_RFT_CLK */
4664ebd8346adaa Apurva Nandan       2023-01-12  1721  			assigned-clock-parents = <&k3_clks 62 5>; /* MAIN_0_HSDIV6_CLK */
4664ebd8346adaa Apurva Nandan       2023-01-12  1722  			interrupts-extended = <&main_navss_intr 391>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1723  			interrupt-names = "cpts";
4664ebd8346adaa Apurva Nandan       2023-01-12  1724  			ti,cpts-periodic-outputs = <6>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1725  			ti,cpts-ext-ts-inputs = <8>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1726  		};
4664ebd8346adaa Apurva Nandan       2023-01-12  1727  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  1728  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1729  	main_cpsw0: ethernet@c000000 {
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1730  		compatible = "ti,j784s4-cpswxg-nuss";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1731  		reg = <0x00 0xc000000 0x00 0x200000>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1732  		reg-names = "cpsw_nuss";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1733  		ranges = <0x00 0x00 0x00 0xc000000 0x00 0x200000>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1734  		#address-cells = <2>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1735  		#size-cells = <2>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1736  		dma-coherent;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1737  		clocks = <&k3_clks 64 0>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1738  		clock-names = "fck";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1739  		power-domains = <&k3_pds 64 TI_SCI_PD_EXCLUSIVE>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1740  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1741  		dmas = <&main_udmap 0xca00>,
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1742  		       <&main_udmap 0xca01>,
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1743  		       <&main_udmap 0xca02>,
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1744  		       <&main_udmap 0xca03>,
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1745  		       <&main_udmap 0xca04>,
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1746  		       <&main_udmap 0xca05>,
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1747  		       <&main_udmap 0xca06>,
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1748  		       <&main_udmap 0xca07>,
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1749  		       <&main_udmap 0x4a00>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1750  		dma-names = "tx0", "tx1", "tx2", "tx3",
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1751  			    "tx4", "tx5", "tx6", "tx7",
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1752  			    "rx";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1753  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1754  		status = "disabled";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1755  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1756  		ethernet-ports {
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1757  			#address-cells = <1>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1758  			#size-cells = <0>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1759  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1760  			main_cpsw0_port1: port@1 {
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1761  				reg = <1>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1762  				label = "port1";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1763  				ti,mac-only;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1764  				status = "disabled";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1765  			};
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1766  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1767  			main_cpsw0_port2: port@2 {
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1768  				reg = <2>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1769  				label = "port2";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1770  				ti,mac-only;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1771  				status = "disabled";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1772  			};
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1773  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1774  			main_cpsw0_port3: port@3 {
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1775  				reg = <3>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1776  				label = "port3";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1777  				ti,mac-only;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1778  				status = "disabled";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1779  			};
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1780  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1781  			main_cpsw0_port4: port@4 {
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1782  				reg = <4>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1783  				label = "port4";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1784  				ti,mac-only;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1785  				status = "disabled";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1786  			};
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1787  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1788  			main_cpsw0_port5: port@5 {
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1789  				reg = <5>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1790  				label = "port5";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1791  				ti,mac-only;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1792  				status = "disabled";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1793  			};
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1794  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1795  			main_cpsw0_port6: port@6 {
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1796  				reg = <6>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1797  				label = "port6";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1798  				ti,mac-only;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1799  				status = "disabled";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1800  			};
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1801  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1802  			main_cpsw0_port7: port@7 {
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1803  				reg = <7>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1804  				label = "port7";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1805  				ti,mac-only;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1806  				status = "disabled";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1807  			};
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1808  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1809  			main_cpsw0_port8: port@8 {
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1810  				reg = <8>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1811  				label = "port8";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1812  				ti,mac-only;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1813  				status = "disabled";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1814  			};
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1815  		};
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1816  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1817  		main_cpsw0_mdio: mdio@f00 {
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1818  			compatible = "ti,cpsw-mdio","ti,davinci_mdio";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1819  			reg = <0x00 0xf00 0x00 0x100>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1820  			#address-cells = <1>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1821  			#size-cells = <0>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1822  			clocks = <&k3_clks 64 0>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1823  			clock-names = "fck";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1824  			bus_freq = <1000000>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1825  			status = "disabled";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1826  		};
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1827  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1828  		cpts@3d000 {
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1829  			compatible = "ti,am65-cpts";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1830  			reg = <0x00 0x3d000 0x00 0x400>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1831  			clocks = <&k3_clks 64 3>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1832  			clock-names = "cpts";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1833  			interrupts-extended = <&gic500 GIC_SPI 16 IRQ_TYPE_LEVEL_HIGH>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1834  			interrupt-names = "cpts";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1835  			ti,cpts-ext-ts-inputs = <4>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1836  			ti,cpts-periodic-outputs = <2>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1837  		};
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1838  	};
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1839  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1840  	main_cpsw1: ethernet@c200000 {
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1841  		compatible = "ti,j721e-cpsw-nuss";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1842  		reg = <0x00 0xc200000 0x00 0x200000>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1843  		reg-names = "cpsw_nuss";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1844  		ranges = <0x00 0x00 0x00 0xc200000 0x00 0x200000>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1845  		#address-cells = <2>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1846  		#size-cells = <2>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1847  		dma-coherent;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1848  		clocks = <&k3_clks 62 0>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1849  		clock-names = "fck";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1850  		power-domains = <&k3_pds 62 TI_SCI_PD_EXCLUSIVE>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1851  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1852  		dmas = <&main_udmap 0xc640>,
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1853  			<&main_udmap 0xc641>,
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1854  			<&main_udmap 0xc642>,
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1855  			<&main_udmap 0xc643>,
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1856  			<&main_udmap 0xc644>,
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1857  			<&main_udmap 0xc645>,
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1858  			<&main_udmap 0xc646>,
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1859  			<&main_udmap 0xc647>,
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1860  			<&main_udmap 0x4640>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1861  		dma-names = "tx0", "tx1", "tx2", "tx3",
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1862  				"tx4", "tx5", "tx6", "tx7",
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1863  				"rx";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1864  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1865  		status = "disabled";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1866  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1867  		ethernet-ports {
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1868  			#address-cells = <1>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1869  			#size-cells = <0>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1870  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1871  			main_cpsw1_port1: port@1 {
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1872  				reg = <1>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1873  				label = "port1";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1874  				phys = <&cpsw1_phy_gmii_sel 1>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1875  				ti,mac-only;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1876  				status = "disabled";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1877  			};
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1878  		};
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1879  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1880  		main_cpsw1_mdio: mdio@f00 {
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1881  			compatible = "ti,cpsw-mdio", "ti,davinci_mdio";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1882  			reg = <0x00 0xf00 0x00 0x100>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1883  			#address-cells = <1>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1884  			#size-cells = <0>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1885  			clocks = <&k3_clks 62 0>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1886  			clock-names = "fck";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1887  			bus_freq = <1000000>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1888  			status = "disabled";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1889  		};
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1890  
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1891  		cpts@3d000 {
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1892  			compatible = "ti,am65-cpts";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1893  			reg = <0x00 0x3d000 0x00 0x400>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1894  			clocks = <&k3_clks 62 3>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1895  			clock-names = "cpts";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1896  			interrupts-extended = <&gic500 GIC_SPI 21 IRQ_TYPE_LEVEL_HIGH>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1897  			interrupt-names = "cpts";
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1898  			ti,cpts-ext-ts-inputs = <4>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1899  			ti,cpts-periodic-outputs = <2>;
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1900  		};
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1901  	};
1dac25c1ea45325 Siddharth Vadapalli 2024-05-24  1902  
4664ebd8346adaa Apurva Nandan       2023-01-12  1903  	main_mcan0: can@2701000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1904  		compatible = "bosch,m_can";
4664ebd8346adaa Apurva Nandan       2023-01-12  1905  		reg = <0x00 0x02701000 0x00 0x200>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1906  		      <0x00 0x02708000 0x00 0x8000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1907  		reg-names = "m_can", "message_ram";
4664ebd8346adaa Apurva Nandan       2023-01-12  1908  		power-domains = <&k3_pds 245 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1909  		clocks = <&k3_clks 245 6>, <&k3_clks 245 1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1910  		clock-names = "hclk", "cclk";
4664ebd8346adaa Apurva Nandan       2023-01-12  1911  		interrupts = <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1912  			     <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1913  		interrupt-names = "int0", "int1";
4664ebd8346adaa Apurva Nandan       2023-01-12  1914  		bosch,mram-cfg = <0x00 128 64 64 64 64 32 32>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1915  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1916  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  1917  
4664ebd8346adaa Apurva Nandan       2023-01-12  1918  	main_mcan1: can@2711000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1919  		compatible = "bosch,m_can";
4664ebd8346adaa Apurva Nandan       2023-01-12  1920  		reg = <0x00 0x02711000 0x00 0x200>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1921  		      <0x00 0x02718000 0x00 0x8000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1922  		reg-names = "m_can", "message_ram";
4664ebd8346adaa Apurva Nandan       2023-01-12  1923  		power-domains = <&k3_pds 246 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1924  		clocks = <&k3_clks 246 6>, <&k3_clks 246 1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1925  		clock-names = "hclk", "cclk";
4664ebd8346adaa Apurva Nandan       2023-01-12  1926  		interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1927  			     <GIC_SPI 128 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1928  		interrupt-names = "int0", "int1";
4664ebd8346adaa Apurva Nandan       2023-01-12  1929  		bosch,mram-cfg = <0x00 128 64 64 64 64 32 32>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1930  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1931  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  1932  
4664ebd8346adaa Apurva Nandan       2023-01-12  1933  	main_mcan2: can@2721000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1934  		compatible = "bosch,m_can";
4664ebd8346adaa Apurva Nandan       2023-01-12  1935  		reg = <0x00 0x02721000 0x00 0x200>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1936  		      <0x00 0x02728000 0x00 0x8000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1937  		reg-names = "m_can", "message_ram";
4664ebd8346adaa Apurva Nandan       2023-01-12  1938  		power-domains = <&k3_pds 247 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1939  		clocks = <&k3_clks 247 6>, <&k3_clks 247 1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1940  		clock-names = "hclk", "cclk";
4664ebd8346adaa Apurva Nandan       2023-01-12  1941  		interrupts = <GIC_SPI 130 IRQ_TYPE_LEVEL_HIGH>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1942  			     <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1943  		interrupt-names = "int0", "int1";
4664ebd8346adaa Apurva Nandan       2023-01-12  1944  		bosch,mram-cfg = <0x00 128 64 64 64 64 32 32>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1945  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1946  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  1947  
4664ebd8346adaa Apurva Nandan       2023-01-12  1948  	main_mcan3: can@2731000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1949  		compatible = "bosch,m_can";
4664ebd8346adaa Apurva Nandan       2023-01-12  1950  		reg = <0x00 0x02731000 0x00 0x200>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1951  		      <0x00 0x02738000 0x00 0x8000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1952  		reg-names = "m_can", "message_ram";
4664ebd8346adaa Apurva Nandan       2023-01-12  1953  		power-domains = <&k3_pds 248 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1954  		clocks = <&k3_clks 248 6>, <&k3_clks 248 1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1955  		clock-names = "hclk", "cclk";
4664ebd8346adaa Apurva Nandan       2023-01-12  1956  		interrupts = <GIC_SPI 133 IRQ_TYPE_LEVEL_HIGH>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1957  			     <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1958  		interrupt-names = "int0", "int1";
4664ebd8346adaa Apurva Nandan       2023-01-12  1959  		bosch,mram-cfg = <0x00 128 64 64 64 64 32 32>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1960  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1961  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  1962  
4664ebd8346adaa Apurva Nandan       2023-01-12  1963  	main_mcan4: can@2741000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1964  		compatible = "bosch,m_can";
4664ebd8346adaa Apurva Nandan       2023-01-12  1965  		reg = <0x00 0x02741000 0x00 0x200>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1966  		      <0x00 0x02748000 0x00 0x8000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1967  		reg-names = "m_can", "message_ram";
4664ebd8346adaa Apurva Nandan       2023-01-12  1968  		power-domains = <&k3_pds 249 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1969  		clocks = <&k3_clks 249 6>, <&k3_clks 249 1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1970  		clock-names = "hclk", "cclk";
4664ebd8346adaa Apurva Nandan       2023-01-12  1971  		interrupts = <GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1972  			     <GIC_SPI 137 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1973  		interrupt-names = "int0", "int1";
4664ebd8346adaa Apurva Nandan       2023-01-12  1974  		bosch,mram-cfg = <0x00 128 64 64 64 64 32 32>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1975  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1976  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  1977  
4664ebd8346adaa Apurva Nandan       2023-01-12  1978  	main_mcan5: can@2751000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1979  		compatible = "bosch,m_can";
4664ebd8346adaa Apurva Nandan       2023-01-12  1980  		reg = <0x00 0x02751000 0x00 0x200>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1981  		      <0x00 0x02758000 0x00 0x8000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1982  		reg-names = "m_can", "message_ram";
4664ebd8346adaa Apurva Nandan       2023-01-12  1983  		power-domains = <&k3_pds 250 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1984  		clocks = <&k3_clks 250 6>, <&k3_clks 250 1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1985  		clock-names = "hclk", "cclk";
4664ebd8346adaa Apurva Nandan       2023-01-12  1986  		interrupts = <GIC_SPI 139 IRQ_TYPE_LEVEL_HIGH>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1987  			     <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1988  		interrupt-names = "int0", "int1";
4664ebd8346adaa Apurva Nandan       2023-01-12  1989  		bosch,mram-cfg = <0x00 128 64 64 64 64 32 32>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1990  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  1991  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  1992  
4664ebd8346adaa Apurva Nandan       2023-01-12  1993  	main_mcan6: can@2761000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  1994  		compatible = "bosch,m_can";
4664ebd8346adaa Apurva Nandan       2023-01-12  1995  		reg = <0x00 0x02761000 0x00 0x200>,
4664ebd8346adaa Apurva Nandan       2023-01-12  1996  		      <0x00 0x02768000 0x00 0x8000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1997  		reg-names = "m_can", "message_ram";
4664ebd8346adaa Apurva Nandan       2023-01-12  1998  		power-domains = <&k3_pds 251 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  1999  		clocks = <&k3_clks 251 6>, <&k3_clks 251 1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2000  		clock-names = "hclk", "cclk";
4664ebd8346adaa Apurva Nandan       2023-01-12  2001  		interrupts = <GIC_SPI 142 IRQ_TYPE_LEVEL_HIGH>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2002  			     <GIC_SPI 143 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2003  		interrupt-names = "int0", "int1";
4664ebd8346adaa Apurva Nandan       2023-01-12  2004  		bosch,mram-cfg = <0x00 128 64 64 64 64 32 32>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2005  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  2006  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  2007  
4664ebd8346adaa Apurva Nandan       2023-01-12  2008  	main_mcan7: can@2771000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  2009  		compatible = "bosch,m_can";
4664ebd8346adaa Apurva Nandan       2023-01-12  2010  		reg = <0x00 0x02771000 0x00 0x200>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2011  		      <0x00 0x02778000 0x00 0x8000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2012  		reg-names = "m_can", "message_ram";
4664ebd8346adaa Apurva Nandan       2023-01-12  2013  		power-domains = <&k3_pds 252 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2014  		clocks = <&k3_clks 252 6>, <&k3_clks 252 1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2015  		clock-names = "hclk", "cclk";
4664ebd8346adaa Apurva Nandan       2023-01-12  2016  		interrupts = <GIC_SPI 145 IRQ_TYPE_LEVEL_HIGH>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2017  			     <GIC_SPI 146 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2018  		interrupt-names = "int0", "int1";
4664ebd8346adaa Apurva Nandan       2023-01-12  2019  		bosch,mram-cfg = <0x00 128 64 64 64 64 32 32>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2020  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  2021  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  2022  
4664ebd8346adaa Apurva Nandan       2023-01-12  2023  	main_mcan8: can@2781000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  2024  		compatible = "bosch,m_can";
4664ebd8346adaa Apurva Nandan       2023-01-12  2025  		reg = <0x00 0x02781000 0x00 0x200>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2026  		      <0x00 0x02788000 0x00 0x8000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2027  		reg-names = "m_can", "message_ram";
4664ebd8346adaa Apurva Nandan       2023-01-12  2028  		power-domains = <&k3_pds 253 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2029  		clocks = <&k3_clks 253 6>, <&k3_clks 253 1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2030  		clock-names = "hclk", "cclk";
4664ebd8346adaa Apurva Nandan       2023-01-12  2031  		interrupts = <GIC_SPI 576 IRQ_TYPE_LEVEL_HIGH>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2032  			     <GIC_SPI 577 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2033  		interrupt-names = "int0", "int1";
4664ebd8346adaa Apurva Nandan       2023-01-12  2034  		bosch,mram-cfg = <0x00 128 64 64 64 64 32 32>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2035  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  2036  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  2037  
4664ebd8346adaa Apurva Nandan       2023-01-12  2038  	main_mcan9: can@2791000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  2039  		compatible = "bosch,m_can";
4664ebd8346adaa Apurva Nandan       2023-01-12  2040  		reg = <0x00 0x02791000 0x00 0x200>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2041  		      <0x00 0x02798000 0x00 0x8000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2042  		reg-names = "m_can", "message_ram";
4664ebd8346adaa Apurva Nandan       2023-01-12  2043  		power-domains = <&k3_pds 254 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2044  		clocks = <&k3_clks 254 6>, <&k3_clks 254 1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2045  		clock-names = "hclk", "cclk";
4664ebd8346adaa Apurva Nandan       2023-01-12  2046  		interrupts = <GIC_SPI 579 IRQ_TYPE_LEVEL_HIGH>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2047  			     <GIC_SPI 580 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2048  		interrupt-names = "int0", "int1";
4664ebd8346adaa Apurva Nandan       2023-01-12  2049  		bosch,mram-cfg = <0x00 128 64 64 64 64 32 32>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2050  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  2051  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  2052  
4664ebd8346adaa Apurva Nandan       2023-01-12  2053  	main_mcan10: can@27a1000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  2054  		compatible = "bosch,m_can";
4664ebd8346adaa Apurva Nandan       2023-01-12  2055  		reg = <0x00 0x027a1000 0x00 0x200>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2056  		      <0x00 0x027a8000 0x00 0x8000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2057  		reg-names = "m_can", "message_ram";
4664ebd8346adaa Apurva Nandan       2023-01-12  2058  		power-domains = <&k3_pds 255 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2059  		clocks = <&k3_clks 255 6>, <&k3_clks 255 1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2060  		clock-names = "hclk", "cclk";
4664ebd8346adaa Apurva Nandan       2023-01-12  2061  		interrupts = <GIC_SPI 582 IRQ_TYPE_LEVEL_HIGH>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2062  			     <GIC_SPI 583 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2063  		interrupt-names = "int0", "int1";
4664ebd8346adaa Apurva Nandan       2023-01-12  2064  		bosch,mram-cfg = <0x00 128 64 64 64 64 32 32>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2065  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  2066  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  2067  
4664ebd8346adaa Apurva Nandan       2023-01-12  2068  	main_mcan11: can@27b1000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  2069  		compatible = "bosch,m_can";
4664ebd8346adaa Apurva Nandan       2023-01-12  2070  		reg = <0x00 0x027b1000 0x00 0x200>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2071  		      <0x00 0x027b8000 0x00 0x8000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2072  		reg-names = "m_can", "message_ram";
4664ebd8346adaa Apurva Nandan       2023-01-12  2073  		power-domains = <&k3_pds 256 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2074  		clocks = <&k3_clks 256 6>, <&k3_clks 256 1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2075  		clock-names = "hclk", "cclk";
4664ebd8346adaa Apurva Nandan       2023-01-12  2076  		interrupts = <GIC_SPI 585 IRQ_TYPE_LEVEL_HIGH>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2077  			     <GIC_SPI 586 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2078  		interrupt-names = "int0", "int1";
4664ebd8346adaa Apurva Nandan       2023-01-12  2079  		bosch,mram-cfg = <0x00 128 64 64 64 64 32 32>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2080  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  2081  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  2082  
4664ebd8346adaa Apurva Nandan       2023-01-12  2083  	main_mcan12: can@27c1000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  2084  		compatible = "bosch,m_can";
4664ebd8346adaa Apurva Nandan       2023-01-12  2085  		reg = <0x00 0x027c1000 0x00 0x200>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2086  		      <0x00 0x027c8000 0x00 0x8000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2087  		reg-names = "m_can", "message_ram";
4664ebd8346adaa Apurva Nandan       2023-01-12  2088  		power-domains = <&k3_pds 257 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2089  		clocks = <&k3_clks 257 6>, <&k3_clks 257 1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2090  		clock-names = "hclk", "cclk";
4664ebd8346adaa Apurva Nandan       2023-01-12  2091  		interrupts = <GIC_SPI 588 IRQ_TYPE_LEVEL_HIGH>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2092  			     <GIC_SPI 589 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2093  		interrupt-names = "int0", "int1";
4664ebd8346adaa Apurva Nandan       2023-01-12  2094  		bosch,mram-cfg = <0x00 128 64 64 64 64 32 32>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2095  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  2096  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  2097  
4664ebd8346adaa Apurva Nandan       2023-01-12  2098  	main_mcan13: can@27d1000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  2099  		compatible = "bosch,m_can";
4664ebd8346adaa Apurva Nandan       2023-01-12  2100  		reg = <0x00 0x027d1000 0x00 0x200>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2101  		      <0x00 0x027d8000 0x00 0x8000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2102  		reg-names = "m_can", "message_ram";
4664ebd8346adaa Apurva Nandan       2023-01-12  2103  		power-domains = <&k3_pds 258 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2104  		clocks = <&k3_clks 258 6>, <&k3_clks 258 1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2105  		clock-names = "hclk", "cclk";
4664ebd8346adaa Apurva Nandan       2023-01-12  2106  		interrupts = <GIC_SPI 591 IRQ_TYPE_LEVEL_HIGH>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2107  			     <GIC_SPI 592 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2108  		interrupt-names = "int0", "int1";
4664ebd8346adaa Apurva Nandan       2023-01-12  2109  		bosch,mram-cfg = <0x00 128 64 64 64 64 32 32>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2110  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  2111  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  2112  
4664ebd8346adaa Apurva Nandan       2023-01-12  2113  	main_mcan14: can@2681000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  2114  		compatible = "bosch,m_can";
4664ebd8346adaa Apurva Nandan       2023-01-12  2115  		reg = <0x00 0x02681000 0x00 0x200>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2116  		      <0x00 0x02688000 0x00 0x8000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2117  		reg-names = "m_can", "message_ram";
4664ebd8346adaa Apurva Nandan       2023-01-12  2118  		power-domains = <&k3_pds 259 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2119  		clocks = <&k3_clks 259 6>, <&k3_clks 259 1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2120  		clock-names = "hclk", "cclk";
4664ebd8346adaa Apurva Nandan       2023-01-12  2121  		interrupts = <GIC_SPI 594 IRQ_TYPE_LEVEL_HIGH>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2122  			     <GIC_SPI 595 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2123  		interrupt-names = "int0", "int1";
4664ebd8346adaa Apurva Nandan       2023-01-12  2124  		bosch,mram-cfg = <0x00 128 64 64 64 64 32 32>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2125  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  2126  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  2127  
4664ebd8346adaa Apurva Nandan       2023-01-12  2128  	main_mcan15: can@2691000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  2129  		compatible = "bosch,m_can";
4664ebd8346adaa Apurva Nandan       2023-01-12  2130  		reg = <0x00 0x02691000 0x00 0x200>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2131  		      <0x00 0x02698000 0x00 0x8000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2132  		reg-names = "m_can", "message_ram";
4664ebd8346adaa Apurva Nandan       2023-01-12  2133  		power-domains = <&k3_pds 260 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2134  		clocks = <&k3_clks 260 6>, <&k3_clks 260 1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2135  		clock-names = "hclk", "cclk";
4664ebd8346adaa Apurva Nandan       2023-01-12  2136  		interrupts = <GIC_SPI 597 IRQ_TYPE_LEVEL_HIGH>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2137  			     <GIC_SPI 598 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2138  		interrupt-names = "int0", "int1";
4664ebd8346adaa Apurva Nandan       2023-01-12  2139  		bosch,mram-cfg = <0x00 128 64 64 64 64 32 32>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2140  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  2141  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  2142  
4664ebd8346adaa Apurva Nandan       2023-01-12  2143  	main_mcan16: can@26a1000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  2144  		compatible = "bosch,m_can";
4664ebd8346adaa Apurva Nandan       2023-01-12  2145  		reg = <0x00 0x026a1000 0x00 0x200>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2146  		      <0x00 0x026a8000 0x00 0x8000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2147  		reg-names = "m_can", "message_ram";
4664ebd8346adaa Apurva Nandan       2023-01-12  2148  		power-domains = <&k3_pds 261 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2149  		clocks = <&k3_clks 261 6>, <&k3_clks 261 1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2150  		clock-names = "hclk", "cclk";
4664ebd8346adaa Apurva Nandan       2023-01-12  2151  		interrupts = <GIC_SPI 784 IRQ_TYPE_LEVEL_HIGH>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2152  			     <GIC_SPI 785 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2153  		interrupt-names = "int0", "int1";
4664ebd8346adaa Apurva Nandan       2023-01-12  2154  		bosch,mram-cfg = <0x00 128 64 64 64 64 32 32>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2155  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  2156  	};
4664ebd8346adaa Apurva Nandan       2023-01-12  2157  
4664ebd8346adaa Apurva Nandan       2023-01-12  2158  	main_mcan17: can@26b1000 {
4664ebd8346adaa Apurva Nandan       2023-01-12  2159  		compatible = "bosch,m_can";
4664ebd8346adaa Apurva Nandan       2023-01-12  2160  		reg = <0x00 0x026b1000 0x00 0x200>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2161  		      <0x00 0x026b8000 0x00 0x8000>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2162  		reg-names = "m_can", "message_ram";
4664ebd8346adaa Apurva Nandan       2023-01-12  2163  		power-domains = <&k3_pds 262 TI_SCI_PD_EXCLUSIVE>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2164  		clocks = <&k3_clks 262 6>, <&k3_clks 262 1>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2165  		clock-names = "hclk", "cclk";
4664ebd8346adaa Apurva Nandan       2023-01-12  2166  		interrupts = <GIC_SPI 787 IRQ_TYPE_LEVEL_HIGH>,
4664ebd8346adaa Apurva Nandan       2023-01-12  2167  			     <GIC_SPI 788 IRQ_TYPE_LEVEL_HIGH>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2168  		interrupt-names = "int0", "int1";
4664ebd8346adaa Apurva Nandan       2023-01-12  2169  		bosch,mram-cfg = <0x00 128 64 64 64 64 32 32>;
4664ebd8346adaa Apurva Nandan       2023-01-12  2170  		status = "disabled";
4664ebd8346adaa Apurva Nandan       2023-01-12  2171  	};
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2172  
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2173  	main_spi0: spi@2100000 {
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2174  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2175  		reg = <0x00 0x02100000 0x00 0x400>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2176  		interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2177  		#address-cells = <1>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2178  		#size-cells = <0>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2179  		power-domains = <&k3_pds 376 TI_SCI_PD_EXCLUSIVE>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2180  		clocks = <&k3_clks 376 1>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2181  		status = "disabled";
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2182  	};
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2183  
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2184  	main_spi1: spi@2110000 {
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2185  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2186  		reg = <0x00 0x02110000 0x00 0x400>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2187  		interrupts = <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2188  		#address-cells = <1>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2189  		#size-cells = <0>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2190  		power-domains = <&k3_pds 377 TI_SCI_PD_EXCLUSIVE>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2191  		clocks = <&k3_clks 377 1>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2192  		status = "disabled";
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2193  	};
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2194  
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2195  	main_spi2: spi@2120000 {
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2196  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2197  		reg = <0x00 0x02120000 0x00 0x400>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2198  		interrupts = <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2199  		#address-cells = <1>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2200  		#size-cells = <0>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2201  		power-domains = <&k3_pds 378 TI_SCI_PD_EXCLUSIVE>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2202  		clocks = <&k3_clks 378 1>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2203  		status = "disabled";
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2204  	};
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2205  
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2206  	main_spi3: spi@2130000 {
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2207  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2208  		reg = <0x00 0x02130000 0x00 0x400>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2209  		interrupts = <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2210  		#address-cells = <1>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2211  		#size-cells = <0>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2212  		power-domains = <&k3_pds 379 TI_SCI_PD_EXCLUSIVE>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2213  		clocks = <&k3_clks 379 1>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2214  		status = "disabled";
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2215  	};
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2216  
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2217  	main_spi4: spi@2140000 {
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2218  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2219  		reg = <0x00 0x02140000 0x00 0x400>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2220  		interrupts = <GIC_SPI 188 IRQ_TYPE_LEVEL_HIGH>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2221  		#address-cells = <1>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2222  		#size-cells = <0>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2223  		power-domains = <&k3_pds 380 TI_SCI_PD_EXCLUSIVE>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2224  		clocks = <&k3_clks 380 1>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2225  		status = "disabled";
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2226  	};
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2227  
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2228  	main_spi5: spi@2150000 {
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2229  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2230  		reg = <0x00 0x02150000 0x00 0x400>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2231  		interrupts = <GIC_SPI 189 IRQ_TYPE_LEVEL_HIGH>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2232  		#address-cells = <1>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2233  		#size-cells = <0>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2234  		power-domains = <&k3_pds 381 TI_SCI_PD_EXCLUSIVE>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2235  		clocks = <&k3_clks 381 1>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2236  		status = "disabled";
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2237  	};
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2238  
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2239  	main_spi6: spi@2160000 {
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2240  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2241  		reg = <0x00 0x02160000 0x00 0x400>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2242  		interrupts = <GIC_SPI 190 IRQ_TYPE_LEVEL_HIGH>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2243  		#address-cells = <1>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2244  		#size-cells = <0>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2245  		power-domains = <&k3_pds 382 TI_SCI_PD_EXCLUSIVE>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2246  		clocks = <&k3_clks 382 1>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2247  		status = "disabled";
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2248  	};
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2249  
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2250  	main_spi7: spi@2170000 {
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2251  		compatible = "ti,am654-mcspi","ti,omap4-mcspi";
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2252  		reg = <0x00 0x02170000 0x00 0x400>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2253  		interrupts = <GIC_SPI 191 IRQ_TYPE_LEVEL_HIGH>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2254  		#address-cells = <1>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2255  		#size-cells = <0>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2256  		power-domains = <&k3_pds 383 TI_SCI_PD_EXCLUSIVE>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2257  		clocks = <&k3_clks 383 1>;
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2258  		status = "disabled";
e23d5a3d116dce2 Vaishnav Achath     2023-03-21  2259  	};
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2260  
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2261  	ufs_wrapper: ufs-wrapper@4e80000 {
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2262  		compatible = "ti,j721e-ufs";
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2263  		reg = <0x00 0x4e80000 0x00 0x100>;
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2264  		power-domains = <&k3_pds 387 TI_SCI_PD_EXCLUSIVE>;
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2265  		clocks = <&k3_clks 387 3>;
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2266  		assigned-clocks = <&k3_clks 387 3>;
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2267  		assigned-clock-parents = <&k3_clks 387 6>;
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2268  		ranges;
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2269  		#address-cells = <2>;
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2270  		#size-cells = <2>;
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2271  		status = "disabled";
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2272  
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2273  		ufs@4e84000 {
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2274  			compatible = "cdns,ufshc-m31-16nm", "jedec,ufs-2.0";
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2275  			reg = <0x00 0x4e84000 0x00 0x10000>;
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2276  			interrupts = <GIC_SPI 17 IRQ_TYPE_LEVEL_HIGH>;
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2277  			freq-table-hz = <250000000 250000000>, <19200000 19200000>,
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2278  					<19200000 19200000>;
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2279  			clocks = <&k3_clks 387 1>, <&k3_clks 387 3>, <&k3_clks 387 3>;
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2280  			clock-names = "core_clk", "phy_clk", "ref_clk";
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2281  			dma-coherent;
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2282  		};
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2283  	};
f33f5e4c801b7f1 Udit Kumar          2023-07-25  2284  
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2285  	main_r5fss0: r5fss@5c00000 {
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2286  		compatible = "ti,j721s2-r5fss";
3ba0e9eee9b96c2 Apurva Nandan       2024-06-10  2287  		ti,cluster-mode = <0>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2288  		#address-cells = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2289  		#size-cells = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2290  		ranges = <0x5c00000 0x00 0x5c00000 0x20000>,
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2291  			 <0x5d00000 0x00 0x5d00000 0x20000>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2292  		power-domains = <&k3_pds 336 TI_SCI_PD_EXCLUSIVE>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2293  
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2294  		main_r5fss0_core0: r5f@5c00000 {
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2295  			compatible = "ti,j721s2-r5f";
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2296  			reg = <0x5c00000 0x00010000>,
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2297  			      <0x5c10000 0x00010000>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2298  			reg-names = "atcm", "btcm";
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2299  			ti,sci = <&sms>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2300  			ti,sci-dev-id = <339>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2301  			ti,sci-proc-ids = <0x06 0xff>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2302  			resets = <&k3_reset 339 1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2303  			firmware-name = "j784s4-main-r5f0_0-fw";
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2304  			ti,atcm-enable = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2305  			ti,btcm-enable = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2306  			ti,loczrama = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2307  		};
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2308  
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2309  		main_r5fss0_core1: r5f@5d00000 {
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2310  			compatible = "ti,j721s2-r5f";
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2311  			reg = <0x5d00000 0x00010000>,
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2312  			      <0x5d10000 0x00010000>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2313  			reg-names = "atcm", "btcm";
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2314  			ti,sci = <&sms>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2315  			ti,sci-dev-id = <340>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2316  			ti,sci-proc-ids = <0x07 0xff>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2317  			resets = <&k3_reset 340 1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2318  			firmware-name = "j784s4-main-r5f0_1-fw";
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2319  			ti,atcm-enable = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2320  			ti,btcm-enable = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2321  			ti,loczrama = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2322  		};
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2323  	};
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2324  
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2325  	main_r5fss1: r5fss@5e00000 {
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2326  		compatible = "ti,j721s2-r5fss";
3ba0e9eee9b96c2 Apurva Nandan       2024-06-10  2327  		ti,cluster-mode = <0>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2328  		#address-cells = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2329  		#size-cells = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2330  		ranges = <0x5e00000 0x00 0x5e00000 0x20000>,
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2331  			 <0x5f00000 0x00 0x5f00000 0x20000>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2332  		power-domains = <&k3_pds 337 TI_SCI_PD_EXCLUSIVE>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2333  
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2334  		main_r5fss1_core0: r5f@5e00000 {
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2335  			compatible = "ti,j721s2-r5f";
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2336  			reg = <0x5e00000 0x00010000>,
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2337  			      <0x5e10000 0x00010000>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2338  			reg-names = "atcm", "btcm";
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2339  			ti,sci = <&sms>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2340  			ti,sci-dev-id = <341>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2341  			ti,sci-proc-ids = <0x08 0xff>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2342  			resets = <&k3_reset 341 1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2343  			firmware-name = "j784s4-main-r5f1_0-fw";
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2344  			ti,atcm-enable = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2345  			ti,btcm-enable = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2346  			ti,loczrama = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2347  		};
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2348  
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2349  		main_r5fss1_core1: r5f@5f00000 {
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2350  			compatible = "ti,j721s2-r5f";
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2351  			reg = <0x5f00000 0x00010000>,
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2352  			      <0x5f10000 0x00010000>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2353  			reg-names = "atcm", "btcm";
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2354  			ti,sci = <&sms>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2355  			ti,sci-dev-id = <342>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2356  			ti,sci-proc-ids = <0x09 0xff>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2357  			resets = <&k3_reset 342 1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2358  			firmware-name = "j784s4-main-r5f1_1-fw";
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2359  			ti,atcm-enable = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2360  			ti,btcm-enable = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2361  			ti,loczrama = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2362  		};
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2363  	};
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2364  
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2365  	main_r5fss2: r5fss@5900000 {
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2366  		compatible = "ti,j721s2-r5fss";
3ba0e9eee9b96c2 Apurva Nandan       2024-06-10  2367  		ti,cluster-mode = <0>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2368  		#address-cells = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2369  		#size-cells = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2370  		ranges = <0x5900000 0x00 0x5900000 0x20000>,
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2371  			 <0x5a00000 0x00 0x5a00000 0x20000>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2372  		power-domains = <&k3_pds 338 TI_SCI_PD_EXCLUSIVE>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2373  
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2374  		main_r5fss2_core0: r5f@5900000 {
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2375  			compatible = "ti,j721s2-r5f";
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2376  			reg = <0x5900000 0x00010000>,
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2377  			      <0x5910000 0x00010000>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2378  			reg-names = "atcm", "btcm";
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2379  			ti,sci = <&sms>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2380  			ti,sci-dev-id = <343>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2381  			ti,sci-proc-ids = <0x0a 0xff>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2382  			resets = <&k3_reset 343 1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2383  			firmware-name = "j784s4-main-r5f2_0-fw";
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2384  			ti,atcm-enable = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2385  			ti,btcm-enable = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2386  			ti,loczrama = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2387  		};
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2388  
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2389  		main_r5fss2_core1: r5f@5a00000 {
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2390  			compatible = "ti,j721s2-r5f";
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2391  			reg = <0x5a00000 0x00010000>,
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2392  			      <0x5a10000 0x00010000>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2393  			reg-names = "atcm", "btcm";
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2394  			ti,sci = <&sms>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2395  			ti,sci-dev-id = <344>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2396  			ti,sci-proc-ids = <0x0b 0xff>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2397  			resets = <&k3_reset 344 1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2398  			firmware-name = "j784s4-main-r5f2_1-fw";
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2399  			ti,atcm-enable = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2400  			ti,btcm-enable = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2401  			ti,loczrama = <1>;
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2402  		};
7e5fd896c3d1ecf Hari Nagalla        2023-05-02  2403  	};
257d206b6d117d8 Hari Nagalla        2023-05-02  2404  
257d206b6d117d8 Hari Nagalla        2023-05-02  2405  	c71_0: dsp@64800000 {
257d206b6d117d8 Hari Nagalla        2023-05-02  2406  		compatible = "ti,j721s2-c71-dsp";
257d206b6d117d8 Hari Nagalla        2023-05-02  2407  		reg = <0x00 0x64800000 0x00 0x00080000>,
257d206b6d117d8 Hari Nagalla        2023-05-02  2408  		      <0x00 0x64e00000 0x00 0x0000c000>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2409  		reg-names = "l2sram", "l1dram";
257d206b6d117d8 Hari Nagalla        2023-05-02  2410  		ti,sci = <&sms>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2411  		ti,sci-dev-id = <30>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2412  		ti,sci-proc-ids = <0x30 0xff>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2413  		resets = <&k3_reset 30 1>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2414  		firmware-name = "j784s4-c71_0-fw";
c23b203b929f22f Andrew Davis        2023-08-09  2415  		status = "disabled";
257d206b6d117d8 Hari Nagalla        2023-05-02  2416  	};
257d206b6d117d8 Hari Nagalla        2023-05-02  2417  
257d206b6d117d8 Hari Nagalla        2023-05-02  2418  	c71_1: dsp@65800000 {
257d206b6d117d8 Hari Nagalla        2023-05-02  2419  		compatible = "ti,j721s2-c71-dsp";
257d206b6d117d8 Hari Nagalla        2023-05-02  2420  		reg = <0x00 0x65800000 0x00 0x00080000>,
257d206b6d117d8 Hari Nagalla        2023-05-02  2421  		      <0x00 0x65e00000 0x00 0x0000c000>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2422  		reg-names = "l2sram", "l1dram";
257d206b6d117d8 Hari Nagalla        2023-05-02  2423  		ti,sci = <&sms>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2424  		ti,sci-dev-id = <33>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2425  		ti,sci-proc-ids = <0x31 0xff>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2426  		resets = <&k3_reset 33 1>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2427  		firmware-name = "j784s4-c71_1-fw";
c23b203b929f22f Andrew Davis        2023-08-09  2428  		status = "disabled";
257d206b6d117d8 Hari Nagalla        2023-05-02  2429  	};
257d206b6d117d8 Hari Nagalla        2023-05-02  2430  
257d206b6d117d8 Hari Nagalla        2023-05-02  2431  	c71_2: dsp@66800000 {
257d206b6d117d8 Hari Nagalla        2023-05-02  2432  		compatible = "ti,j721s2-c71-dsp";
257d206b6d117d8 Hari Nagalla        2023-05-02  2433  		reg = <0x00 0x66800000 0x00 0x00080000>,
257d206b6d117d8 Hari Nagalla        2023-05-02  2434  		      <0x00 0x66e00000 0x00 0x0000c000>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2435  		reg-names = "l2sram", "l1dram";
257d206b6d117d8 Hari Nagalla        2023-05-02  2436  		ti,sci = <&sms>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2437  		ti,sci-dev-id = <37>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2438  		ti,sci-proc-ids = <0x32 0xff>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2439  		resets = <&k3_reset 37 1>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2440  		firmware-name = "j784s4-c71_2-fw";
c23b203b929f22f Andrew Davis        2023-08-09  2441  		status = "disabled";
257d206b6d117d8 Hari Nagalla        2023-05-02  2442  	};
257d206b6d117d8 Hari Nagalla        2023-05-02  2443  
257d206b6d117d8 Hari Nagalla        2023-05-02  2444  	c71_3: dsp@67800000 {
257d206b6d117d8 Hari Nagalla        2023-05-02  2445  		compatible = "ti,j721s2-c71-dsp";
257d206b6d117d8 Hari Nagalla        2023-05-02  2446  		reg = <0x00 0x67800000 0x00 0x00080000>,
257d206b6d117d8 Hari Nagalla        2023-05-02  2447  		      <0x00 0x67e00000 0x00 0x0000c000>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2448  		reg-names = "l2sram", "l1dram";
257d206b6d117d8 Hari Nagalla        2023-05-02  2449  		ti,sci = <&sms>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2450  		ti,sci-dev-id = <40>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2451  		ti,sci-proc-ids = <0x33 0xff>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2452  		resets = <&k3_reset 40 1>;
257d206b6d117d8 Hari Nagalla        2023-05-02  2453  		firmware-name = "j784s4-c71_3-fw";
c23b203b929f22f Andrew Davis        2023-08-09  2454  		status = "disabled";
257d206b6d117d8 Hari Nagalla        2023-05-02  2455  	};
671b42bdb7d4b6a Keerthy             2023-10-08  2456  
671b42bdb7d4b6a Keerthy             2023-10-08  2457  	main_esm: esm@700000 {
671b42bdb7d4b6a Keerthy             2023-10-08  2458  		compatible = "ti,j721e-esm";
671b42bdb7d4b6a Keerthy             2023-10-08  2459  		reg = <0x00 0x700000 0x00 0x1000>;
671b42bdb7d4b6a Keerthy             2023-10-08  2460  		ti,esm-pins = <688>, <689>, <690>, <691>, <692>, <693>, <694>,
671b42bdb7d4b6a Keerthy             2023-10-08  2461  			      <695>;
671b42bdb7d4b6a Keerthy             2023-10-08  2462  		bootph-pre-ram;
671b42bdb7d4b6a Keerthy             2023-10-08  2463  	};
20af8c446ba60f1 Keerthy             2023-10-08  2464  
20af8c446ba60f1 Keerthy             2023-10-08  2465  	watchdog0: watchdog@2200000 {
20af8c446ba60f1 Keerthy             2023-10-08  2466  		compatible = "ti,j7-rti-wdt";
20af8c446ba60f1 Keerthy             2023-10-08  2467  		reg = <0x00 0x2200000 0x00 0x100>;
20af8c446ba60f1 Keerthy             2023-10-08  2468  		clocks = <&k3_clks 348 1>;
20af8c446ba60f1 Keerthy             2023-10-08  2469  		power-domains = <&k3_pds 348 TI_SCI_PD_EXCLUSIVE>;
20af8c446ba60f1 Keerthy             2023-10-08  2470  		assigned-clocks = <&k3_clks 348 0>;
20af8c446ba60f1 Keerthy             2023-10-08  2471  		assigned-clock-parents = <&k3_clks 348 4>;
20af8c446ba60f1 Keerthy             2023-10-08  2472  	};
20af8c446ba60f1 Keerthy             2023-10-08  2473  
20af8c446ba60f1 Keerthy             2023-10-08  2474  	watchdog1: watchdog@2210000 {
20af8c446ba60f1 Keerthy             2023-10-08  2475  		compatible = "ti,j7-rti-wdt";
20af8c446ba60f1 Keerthy             2023-10-08  2476  		reg = <0x00 0x2210000 0x00 0x100>;
20af8c446ba60f1 Keerthy             2023-10-08  2477  		clocks = <&k3_clks 349 1>;
20af8c446ba60f1 Keerthy             2023-10-08  2478  		power-domains = <&k3_pds 349 TI_SCI_PD_EXCLUSIVE>;
20af8c446ba60f1 Keerthy             2023-10-08  2479  		assigned-clocks = <&k3_clks 349 0>;
20af8c446ba60f1 Keerthy             2023-10-08  2480  		assigned-clock-parents = <&k3_clks 349 4>;
20af8c446ba60f1 Keerthy             2023-10-08  2481  	};
20af8c446ba60f1 Keerthy             2023-10-08  2482  
20af8c446ba60f1 Keerthy             2023-10-08  2483  	watchdog2: watchdog@2220000 {
20af8c446ba60f1 Keerthy             2023-10-08  2484  		compatible = "ti,j7-rti-wdt";
20af8c446ba60f1 Keerthy             2023-10-08  2485  		reg = <0x00 0x2220000 0x00 0x100>;
20af8c446ba60f1 Keerthy             2023-10-08  2486  		clocks = <&k3_clks 350 1>;
20af8c446ba60f1 Keerthy             2023-10-08  2487  		power-domains = <&k3_pds 350 TI_SCI_PD_EXCLUSIVE>;
20af8c446ba60f1 Keerthy             2023-10-08  2488  		assigned-clocks = <&k3_clks 350 0>;
20af8c446ba60f1 Keerthy             2023-10-08  2489  		assigned-clock-parents = <&k3_clks 350 4>;
20af8c446ba60f1 Keerthy             2023-10-08  2490  	};
20af8c446ba60f1 Keerthy             2023-10-08  2491  
20af8c446ba60f1 Keerthy             2023-10-08  2492  	watchdog3: watchdog@2230000 {
20af8c446ba60f1 Keerthy             2023-10-08  2493  		compatible = "ti,j7-rti-wdt";
20af8c446ba60f1 Keerthy             2023-10-08  2494  		reg = <0x00 0x2230000 0x00 0x100>;
20af8c446ba60f1 Keerthy             2023-10-08  2495  		clocks = <&k3_clks 351 1>;
20af8c446ba60f1 Keerthy             2023-10-08  2496  		power-domains = <&k3_pds 351 TI_SCI_PD_EXCLUSIVE>;
20af8c446ba60f1 Keerthy             2023-10-08  2497  		assigned-clocks = <&k3_clks 351 0>;
20af8c446ba60f1 Keerthy             2023-10-08  2498  		assigned-clock-parents = <&k3_clks 351 4>;
20af8c446ba60f1 Keerthy             2023-10-08  2499  	};
20af8c446ba60f1 Keerthy             2023-10-08  2500  
20af8c446ba60f1 Keerthy             2023-10-08  2501  	watchdog4: watchdog@2240000 {
20af8c446ba60f1 Keerthy             2023-10-08  2502  		compatible = "ti,j7-rti-wdt";
20af8c446ba60f1 Keerthy             2023-10-08  2503  		reg = <0x00 0x2240000 0x00 0x100>;
20af8c446ba60f1 Keerthy             2023-10-08  2504  		clocks = <&k3_clks 352 1>;
20af8c446ba60f1 Keerthy             2023-10-08  2505  		power-domains = <&k3_pds 352 TI_SCI_PD_EXCLUSIVE>;
20af8c446ba60f1 Keerthy             2023-10-08  2506  		assigned-clocks = <&k3_clks 352 0>;
20af8c446ba60f1 Keerthy             2023-10-08  2507  		assigned-clock-parents = <&k3_clks 352 4>;
20af8c446ba60f1 Keerthy             2023-10-08  2508  	};
20af8c446ba60f1 Keerthy             2023-10-08  2509  
20af8c446ba60f1 Keerthy             2023-10-08  2510  	watchdog5: watchdog@2250000 {
20af8c446ba60f1 Keerthy             2023-10-08  2511  		compatible = "ti,j7-rti-wdt";
20af8c446ba60f1 Keerthy             2023-10-08  2512  		reg = <0x00 0x2250000 0x00 0x100>;
20af8c446ba60f1 Keerthy             2023-10-08  2513  		clocks = <&k3_clks 353 1>;
20af8c446ba60f1 Keerthy             2023-10-08  2514  		power-domains = <&k3_pds 353 TI_SCI_PD_EXCLUSIVE>;
20af8c446ba60f1 Keerthy             2023-10-08  2515  		assigned-clocks = <&k3_clks 353 0>;
20af8c446ba60f1 Keerthy             2023-10-08  2516  		assigned-clock-parents = <&k3_clks 353 4>;
20af8c446ba60f1 Keerthy             2023-10-08  2517  	};
20af8c446ba60f1 Keerthy             2023-10-08  2518  
20af8c446ba60f1 Keerthy             2023-10-08  2519  	watchdog6: watchdog@2260000 {
20af8c446ba60f1 Keerthy             2023-10-08  2520  		compatible = "ti,j7-rti-wdt";
20af8c446ba60f1 Keerthy             2023-10-08  2521  		reg = <0x00 0x2260000 0x00 0x100>;
20af8c446ba60f1 Keerthy             2023-10-08  2522  		clocks = <&k3_clks 354 1>;
20af8c446ba60f1 Keerthy             2023-10-08  2523  		power-domains = <&k3_pds 354 TI_SCI_PD_EXCLUSIVE>;
20af8c446ba60f1 Keerthy             2023-10-08  2524  		assigned-clocks = <&k3_clks 354 0>;
20af8c446ba60f1 Keerthy             2023-10-08  2525  		assigned-clock-parents = <&k3_clks 354 4>;
20af8c446ba60f1 Keerthy             2023-10-08  2526  	};
20af8c446ba60f1 Keerthy             2023-10-08  2527  
20af8c446ba60f1 Keerthy             2023-10-08  2528  	watchdog7: watchdog@2270000 {
20af8c446ba60f1 Keerthy             2023-10-08  2529  		compatible = "ti,j7-rti-wdt";
20af8c446ba60f1 Keerthy             2023-10-08  2530  		reg = <0x00 0x2270000 0x00 0x100>;
20af8c446ba60f1 Keerthy             2023-10-08  2531  		clocks = <&k3_clks 355 1>;
20af8c446ba60f1 Keerthy             2023-10-08  2532  		power-domains = <&k3_pds 355 TI_SCI_PD_EXCLUSIVE>;
20af8c446ba60f1 Keerthy             2023-10-08  2533  		assigned-clocks = <&k3_clks 355 0>;
20af8c446ba60f1 Keerthy             2023-10-08  2534  		assigned-clock-parents = <&k3_clks 355 4>;
20af8c446ba60f1 Keerthy             2023-10-08  2535  	};
20af8c446ba60f1 Keerthy             2023-10-08  2536  
20af8c446ba60f1 Keerthy             2023-10-08  2537  	/*
20af8c446ba60f1 Keerthy             2023-10-08  2538  	 * The following RTI instances are coupled with MCU R5Fs, c7x and
20af8c446ba60f1 Keerthy             2023-10-08  2539  	 * GPU so keeping them reserved as these will be used by their
20af8c446ba60f1 Keerthy             2023-10-08  2540  	 * respective firmware
20af8c446ba60f1 Keerthy             2023-10-08  2541  	 */
20af8c446ba60f1 Keerthy             2023-10-08  2542  	watchdog8: watchdog@22f0000 {
20af8c446ba60f1 Keerthy             2023-10-08  2543  		compatible = "ti,j7-rti-wdt";
20af8c446ba60f1 Keerthy             2023-10-08  2544  		reg = <0x00 0x22f0000 0x00 0x100>;
20af8c446ba60f1 Keerthy             2023-10-08  2545  		clocks = <&k3_clks 360 1>;
20af8c446ba60f1 Keerthy             2023-10-08  2546  		power-domains = <&k3_pds 360 TI_SCI_PD_EXCLUSIVE>;
20af8c446ba60f1 Keerthy             2023-10-08  2547  		assigned-clocks = <&k3_clks 360 0>;
20af8c446ba60f1 Keerthy             2023-10-08  2548  		assigned-clock-parents = <&k3_clks 360 4>;
20af8c446ba60f1 Keerthy             2023-10-08  2549  		/* reserved for GPU */
20af8c446ba60f1 Keerthy             2023-10-08  2550  		status = "reserved";
20af8c446ba60f1 Keerthy             2023-10-08  2551  	};
20af8c446ba60f1 Keerthy             2023-10-08  2552  
20af8c446ba60f1 Keerthy             2023-10-08  2553  	watchdog9: watchdog@2300000 {
20af8c446ba60f1 Keerthy             2023-10-08  2554  		compatible = "ti,j7-rti-wdt";
20af8c446ba60f1 Keerthy             2023-10-08  2555  		reg = <0x00 0x2300000 0x00 0x100>;
20af8c446ba60f1 Keerthy             2023-10-08  2556  		clocks = <&k3_clks 356 1>;
20af8c446ba60f1 Keerthy             2023-10-08  2557  		power-domains = <&k3_pds 356 TI_SCI_PD_EXCLUSIVE>;
20af8c446ba60f1 Keerthy             2023-10-08  2558  		assigned-clocks = <&k3_clks 356 0>;
20af8c446ba60f1 Keerthy             2023-10-08  2559  		assigned-clock-parents = <&k3_clks 356 4>;
20af8c446ba60f1 Keerthy             2023-10-08  2560  		/* reserved for C7X_0 DSP */
20af8c446ba60f1 Keerthy             2023-10-08  2561  		status = "reserved";
20af8c446ba60f1 Keerthy             2023-10-08  2562  	};
20af8c446ba60f1 Keerthy             2023-10-08  2563  
20af8c446ba60f1 Keerthy             2023-10-08  2564  	watchdog10: watchdog@2310000 {
20af8c446ba60f1 Keerthy             2023-10-08  2565  		compatible = "ti,j7-rti-wdt";
20af8c446ba60f1 Keerthy             2023-10-08  2566  		reg = <0x00 0x2310000 0x00 0x100>;
20af8c446ba60f1 Keerthy             2023-10-08  2567  		clocks = <&k3_clks 357 1>;
20af8c446ba60f1 Keerthy             2023-10-08  2568  		power-domains = <&k3_pds 357 TI_SCI_PD_EXCLUSIVE>;
20af8c446ba60f1 Keerthy             2023-10-08  2569  		assigned-clocks = <&k3_clks 357 0>;
20af8c446ba60f1 Keerthy             2023-10-08  2570  		assigned-clock-parents = <&k3_clks 357 4>;
20af8c446ba60f1 Keerthy             2023-10-08  2571  		/* reserved for C7X_1 DSP */
20af8c446ba60f1 Keerthy             2023-10-08  2572  		status = "reserved";
20af8c446ba60f1 Keerthy             2023-10-08  2573  	};
20af8c446ba60f1 Keerthy             2023-10-08  2574  
20af8c446ba60f1 Keerthy             2023-10-08  2575  	watchdog11: watchdog@2320000 {
20af8c446ba60f1 Keerthy             2023-10-08  2576  		compatible = "ti,j7-rti-wdt";
20af8c446ba60f1 Keerthy             2023-10-08  2577  		reg = <0x00 0x2320000 0x00 0x100>;
20af8c446ba60f1 Keerthy             2023-10-08  2578  		clocks = <&k3_clks 358 1>;
20af8c446ba60f1 Keerthy             2023-10-08  2579  		power-domains = <&k3_pds 358 TI_SCI_PD_EXCLUSIVE>;
20af8c446ba60f1 Keerthy             2023-10-08  2580  		assigned-clocks = <&k3_clks 358 0>;
20af8c446ba60f1 Keerthy             2023-10-08  2581  		assigned-clock-parents = <&k3_clks 358 4>;
20af8c446ba60f1 Keerthy             2023-10-08  2582  		/* reserved for C7X_2 DSP */
20af8c446ba60f1 Keerthy             2023-10-08  2583  		status = "reserved";
20af8c446ba60f1 Keerthy             2023-10-08  2584  	};
20af8c446ba60f1 Keerthy             2023-10-08  2585  
20af8c446ba60f1 Keerthy             2023-10-08  2586  	watchdog12: watchdog@2330000 {
20af8c446ba60f1 Keerthy             2023-10-08  2587  		compatible = "ti,j7-rti-wdt";
20af8c446ba60f1 Keerthy             2023-10-08  2588  		reg = <0x00 0x2330000 0x00 0x100>;
20af8c446ba60f1 Keerthy             2023-10-08  2589  		clocks = <&k3_clks 359 1>;
20af8c446ba60f1 Keerthy             2023-10-08  2590  		power-domains = <&k3_pds 359 TI_SCI_PD_EXCLUSIVE>;
20af8c446ba60f1 Keerthy             2023-10-08  2591  		assigned-clocks = <&k3_clks 359 0>;
20af8c446ba60f1 Keerthy             2023-10-08  2592  		assigned-clock-parents = <&k3_clks 359 4>;
20af8c446ba60f1 Keerthy             2023-10-08  2593  		/* reserved for C7X_3 DSP */
20af8c446ba60f1 Keerthy             2023-10-08  2594  		status = "reserved";
20af8c446ba60f1 Keerthy             2023-10-08  2595  	};
20af8c446ba60f1 Keerthy             2023-10-08  2596  
20af8c446ba60f1 Keerthy             2023-10-08  2597  	watchdog13: watchdog@23c0000 {
20af8c446ba60f1 Keerthy             2023-10-08  2598  		compatible = "ti,j7-rti-wdt";
20af8c446ba60f1 Keerthy             2023-10-08  2599  		reg = <0x00 0x23c0000 0x00 0x100>;
20af8c446ba60f1 Keerthy             2023-10-08  2600  		clocks = <&k3_clks 361 1>;
20af8c446ba60f1 Keerthy             2023-10-08  2601  		power-domains = <&k3_pds 361 TI_SCI_PD_EXCLUSIVE>;
20af8c446ba60f1 Keerthy             2023-10-08  2602  		assigned-clocks = <&k3_clks 361 0>;
20af8c446ba60f1 Keerthy             2023-10-08  2603  		assigned-clock-parents = <&k3_clks 361 4>;
20af8c446ba60f1 Keerthy             2023-10-08  2604  		/* reserved for MAIN_R5F0_0 */
20af8c446ba60f1 Keerthy             2023-10-08  2605  		status = "reserved";
20af8c446ba60f1 Keerthy             2023-10-08  2606  	};
20af8c446ba60f1 Keerthy             2023-10-08  2607  
20af8c446ba60f1 Keerthy             2023-10-08  2608  	watchdog14: watchdog@23d0000 {
20af8c446ba60f1 Keerthy             2023-10-08  2609  		compatible = "ti,j7-rti-wdt";
20af8c446ba60f1 Keerthy             2023-10-08  2610  		reg = <0x00 0x23d0000 0x00 0x100>;
20af8c446ba60f1 Keerthy             2023-10-08  2611  		clocks = <&k3_clks 362 1>;
20af8c446ba60f1 Keerthy             2023-10-08  2612  		power-domains = <&k3_pds 362 TI_SCI_PD_EXCLUSIVE>;
20af8c446ba60f1 Keerthy             2023-10-08  2613  		assigned-clocks = <&k3_clks 362 0>;
20af8c446ba60f1 Keerthy             2023-10-08  2614  		assigned-clock-parents = <&k3_clks 362 4>;
20af8c446ba60f1 Keerthy             2023-10-08  2615  		/* reserved for MAIN_R5F0_1 */
20af8c446ba60f1 Keerthy             2023-10-08  2616  		status = "reserved";
20af8c446ba60f1 Keerthy             2023-10-08  2617  	};
20af8c446ba60f1 Keerthy             2023-10-08  2618  
20af8c446ba60f1 Keerthy             2023-10-08  2619  	watchdog15: watchdog@23e0000 {
20af8c446ba60f1 Keerthy             2023-10-08  2620  		compatible = "ti,j7-rti-wdt";
20af8c446ba60f1 Keerthy             2023-10-08  2621  		reg = <0x00 0x23e0000 0x00 0x100>;
20af8c446ba60f1 Keerthy             2023-10-08  2622  		clocks = <&k3_clks 363 1>;
20af8c446ba60f1 Keerthy             2023-10-08  2623  		power-domains = <&k3_pds 363 TI_SCI_PD_EXCLUSIVE>;
20af8c446ba60f1 Keerthy             2023-10-08  2624  		assigned-clocks = <&k3_clks 363 0>;
20af8c446ba60f1 Keerthy             2023-10-08  2625  		assigned-clock-parents = <&k3_clks 363 4>;
20af8c446ba60f1 Keerthy             2023-10-08  2626  		/* reserved for MAIN_R5F1_0 */
20af8c446ba60f1 Keerthy             2023-10-08  2627  		status = "reserved";
20af8c446ba60f1 Keerthy             2023-10-08  2628  	};
20af8c446ba60f1 Keerthy             2023-10-08  2629  
20af8c446ba60f1 Keerthy             2023-10-08  2630  	watchdog16: watchdog@23f0000 {
20af8c446ba60f1 Keerthy             2023-10-08  2631  		compatible = "ti,j7-rti-wdt";
20af8c446ba60f1 Keerthy             2023-10-08  2632  		reg = <0x00 0x23f0000 0x00 0x100>;
20af8c446ba60f1 Keerthy             2023-10-08  2633  		clocks = <&k3_clks 364 1>;
20af8c446ba60f1 Keerthy             2023-10-08  2634  		power-domains = <&k3_pds 364 TI_SCI_PD_EXCLUSIVE>;
20af8c446ba60f1 Keerthy             2023-10-08  2635  		assigned-clocks = <&k3_clks 364 0>;
20af8c446ba60f1 Keerthy             2023-10-08  2636  		assigned-clock-parents = <&k3_clks 364 4>;
20af8c446ba60f1 Keerthy             2023-10-08  2637  		/* reserved for MAIN_R5F1_1 */
20af8c446ba60f1 Keerthy             2023-10-08  2638  		status = "reserved";
20af8c446ba60f1 Keerthy             2023-10-08  2639  	};
20af8c446ba60f1 Keerthy             2023-10-08  2640  
20af8c446ba60f1 Keerthy             2023-10-08  2641  	watchdog17: watchdog@2540000 {
20af8c446ba60f1 Keerthy             2023-10-08  2642  		compatible = "ti,j7-rti-wdt";
20af8c446ba60f1 Keerthy             2023-10-08  2643  		reg = <0x00 0x2540000 0x00 0x100>;
20af8c446ba60f1 Keerthy             2023-10-08  2644  		clocks = <&k3_clks 365 1>;
20af8c446ba60f1 Keerthy             2023-10-08  2645  		power-domains = <&k3_pds 365 TI_SCI_PD_EXCLUSIVE>;
20af8c446ba60f1 Keerthy             2023-10-08  2646  		assigned-clocks = <&k3_clks 365 0>;
20af8c446ba60f1 Keerthy             2023-10-08  2647  		assigned-clock-parents = <&k3_clks 366 4>;
20af8c446ba60f1 Keerthy             2023-10-08  2648  		/* reserved for MAIN_R5F2_0 */
20af8c446ba60f1 Keerthy             2023-10-08  2649  		status = "reserved";
20af8c446ba60f1 Keerthy             2023-10-08  2650  	};
20af8c446ba60f1 Keerthy             2023-10-08  2651  
20af8c446ba60f1 Keerthy             2023-10-08  2652  	watchdog18: watchdog@2550000 {
20af8c446ba60f1 Keerthy             2023-10-08  2653  		compatible = "ti,j7-rti-wdt";
20af8c446ba60f1 Keerthy             2023-10-08  2654  		reg = <0x00 0x2550000 0x00 0x100>;
20af8c446ba60f1 Keerthy             2023-10-08  2655  		clocks = <&k3_clks 366 1>;
20af8c446ba60f1 Keerthy             2023-10-08  2656  		power-domains = <&k3_pds 366 TI_SCI_PD_EXCLUSIVE>;
20af8c446ba60f1 Keerthy             2023-10-08  2657  		assigned-clocks = <&k3_clks 366 0>;
20af8c446ba60f1 Keerthy             2023-10-08  2658  		assigned-clock-parents = <&k3_clks 366 4>;
20af8c446ba60f1 Keerthy             2023-10-08  2659  		/* reserved for MAIN_R5F2_1 */
20af8c446ba60f1 Keerthy             2023-10-08  2660  		status = "reserved";
20af8c446ba60f1 Keerthy             2023-10-08  2661  	};
402d699511b86c3 Rahul T R           2023-10-19  2662  
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2663  	dphy_tx0: phy@4480000 {
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2664  		compatible = "ti,j721e-dphy";
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2665  		reg = <0x0 0x04480000 0x0 0x1000>;
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2666  		clocks = <&k3_clks 402 20>, <&k3_clks 402 3>;
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2667  		clock-names = "psm", "pll_ref";
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2668  		#phy-cells = <0>;
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2669  		power-domains = <&k3_pds 402 TI_SCI_PD_EXCLUSIVE>;
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2670  		assigned-clocks = <&k3_clks 402 3>;
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2671  		assigned-clock-parents = <&k3_clks 402 4>;
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2672  		assigned-clock-rates = <19200000>;
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2673  		status = "disabled";
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2674  	};
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2675  
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2676  	dsi0: dsi@4800000 {
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2677  		compatible = "ti,j721e-dsi";
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2678  		reg = <0x0 0x04800000 0x0 0x100000>, <0x0 0x04710000 0x0 0x100>;
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2679  		clocks = <&k3_clks 215 2>, <&k3_clks 215 5>;
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2680  		clock-names = "dsi_p_clk", "dsi_sys_clk";
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2681  		power-domains = <&k3_pds 215 TI_SCI_PD_EXCLUSIVE>;
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2682  		interrupt-parent = <&gic500>;
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2683  		interrupts = <GIC_SPI 600 IRQ_TYPE_LEVEL_HIGH>;
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2684  		phys = <&dphy_tx0>;
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2685  		phy-names = "dphy";
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2686  		status = "disabled";
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2687  
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2688  		dsi0_ports: ports {
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2689  			#address-cells = <1>;
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2690  			#size-cells = <0>;
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2691  			port@0 {
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2692  				reg = <0>;
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2693  			};
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2694  			port@1 {
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2695  				reg = <1>;
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2696  			};
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2697  		};
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2698  	};
bc96c0ec73b64b5 Jayesh Choudhary    2024-05-28  2699  
56bf54e5d319fe5 Siddharth Vadapalli 2024-06-13 @2700  	timesync_router: pinctrl@a40000 {

:::::: The code at line 2700 was first introduced by commit
:::::: 56bf54e5d319fe5f95970b0a91b77fed7ff39335 arm64: dts: ti: k3-j784s4-main: Add timesync_router node

:::::: TO: Siddharth Vadapalli <s-vadapalli@ti.com>
:::::: CC: Udit Kumar <u-kumar1@ti.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
