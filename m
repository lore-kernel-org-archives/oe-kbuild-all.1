Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 939001BBBCD
	for <oe-kbuild-all@lists.linux.dev>; Thu, 10 Oct 2024 07:55:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728546905; cv=none; b=i56+HkcuNf6iUkebTFH2ggqinCQmH79UkSr4s9CU85qDTBML3G2+goU/80q68Wm2srD4qWXr0CRGjZw62+BsUEDub78jdGUI2XVLbMcaZvQLA0tmnjmPNso9kNQ7n5X2I8G/+NQ6MzZdy6yIy5X2VMD/gWt+lGDOD17wUpnTbHc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728546905; c=relaxed/simple;
	bh=LHUqUOZHAHUkuozX69ZVkrTOrbuooif05lDHqBm22Kg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RohRtRgLVcjBidulFV4EzOjs9VJY72eKn8l95BP7cedv/VvZXH8T//W/CSsYeJSsk/4JrYS3aAy4d68wnur0MQmyXxXComZfG7HnvOr6F9xi/9OO1U+Xrt/0SMk84Ho7mW2JQ8EAjEtEZ4JSJEzjwBbNx0wMyqekdMQe3iV+Z+c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D292XyIJ; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D292XyIJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1728546904; x=1760082904;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LHUqUOZHAHUkuozX69ZVkrTOrbuooif05lDHqBm22Kg=;
  b=D292XyIJ31bu1drDrR7MjIsYsIh7Zf4V2L8G/TCcqgAXNLqGG2fXUkvy
   he7VF4BFRCDt94Byup9TEjMx+GJquyOwy0XPelYzV4OZ5i55XvvGQLZHE
   j9shMJQZemuRXFPlbUWAj8NDbpRS7NSDHTqcfWjMbYhT5K0VGPK/tQL3B
   wE5Gy8Z1oSrnOAiZ6/7R9RX0ma2qVGn0feWspzqwkLRAyOMvk9jIp3Var
   RUI1KNO5qgxIhsJBdrq0DjNy5M26muT2ZghlJJ0QTNqixlPV6j6IZePsW
   gtaUpYsMaf8nTe1lx61UXRCKS1Jyi6NNlD9UnxOzHh3hhzn6kiO98m9B2
   w==;
X-CSE-ConnectionGUID: OolmrmeCTUO9zBulRg+SgQ==
X-CSE-MsgGUID: 6ZtQPepFQ52unOPqslKj+g==
X-IronPort-AV: E=McAfee;i="6700,10204,11220"; a="30760900"
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="30760900"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2024 00:55:00 -0700
X-CSE-ConnectionGUID: 7W8Q8F/PRa6QjIbCbcYUQA==
X-CSE-MsgGUID: wZenQbicRE2P5tS1o3Z/KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,192,1725346800"; 
   d="scan'208";a="99837448"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 10 Oct 2024 00:54:56 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1syo0b-000AMn-0q;
	Thu, 10 Oct 2024 07:54:53 +0000
Date: Thu, 10 Oct 2024 15:54:33 +0800
From: kernel test robot <lkp@intel.com>
To: Kelvin Zhang <kelvin.zhang@amlogic.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Neil Armstrong <neil.armstrong@linaro.org>
Subject: [linux-next:master 2981/3639]
 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:787.22-795.6: Warning
 (simple_bus_reg): /soc/bus@fe000000/pwm@54000: simple-bus unit address
 format error, expected "d2f0"
Message-ID: <202410101529.bPahDY7V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   0cca97bf23640ff68a6e8a74e9b6659fdc27f48c
commit: be90cd4bd422e8ae235f534a2fa46d40dae0816b [2981/3639] arm64: dts: amlogic: Add Amlogic C3 PWM
config: arm64-randconfig-051-20241010 (https://download.01.org/0day-ci/archive/20241010/202410101529.bPahDY7V-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev4+g577c1ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241010/202410101529.bPahDY7V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410101529.bPahDY7V-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:787.22-795.6: Warning (simple_bus_reg): /soc/bus@fe000000/pwm@54000: simple-bus unit address format error, expected "d2f0"
   arch/arm64/boot/dts/amlogic/amlogic-c3-c302x-aw409.dtb: pwm@54000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['amlogic,c3-pwm', 'amlogic,meson-s4-pwm'] is too long
   	'amlogic,c3-pwm' is not one of ['amlogic,meson8b-pwm', 'amlogic,meson-gxbb-pwm', 'amlogic,meson-gxbb-ao-pwm', 'amlogic,meson-axg-ee-pwm', 'amlogic,meson-axg-ao-pwm', 'amlogic,meson-g12a-ee-pwm', 'amlogic,meson-g12a-ao-pwm-ab', 'amlogic,meson-g12a-ao-pwm-cd']
   	'amlogic,meson-gx-pwm' was expected
   	'amlogic,meson-gx-ao-pwm' was expected
   	'amlogic,meson8-pwm' was expected
   	'amlogic,c3-pwm' is not one of ['amlogic,meson8-pwm-v2', 'amlogic,meson-s4-pwm']
   	'amlogic,c3-pwm' is not one of ['amlogic,meson-a1-pwm']
   	'amlogic,c3-pwm' is not one of ['amlogic,meson8b-pwm-v2', 'amlogic,meson-gxbb-pwm-v2', 'amlogic,meson-axg-pwm-v2', 'amlogic,meson-g12-pwm-v2']
   	'amlogic,meson-gxbb-pwm' was expected
--
>> arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi:787.22-795.6: Warning (simple_bus_reg): /soc/bus@fe000000/pwm@54000: simple-bus unit address format error, expected "d2f0"
   arch/arm64/boot/dts/amlogic/amlogic-c3-c308l-aw419.dtb: pwm@54000: compatible: 'oneOf' conditional failed, one must be fixed:
   	['amlogic,c3-pwm', 'amlogic,meson-s4-pwm'] is too long
   	'amlogic,c3-pwm' is not one of ['amlogic,meson8b-pwm', 'amlogic,meson-gxbb-pwm', 'amlogic,meson-gxbb-ao-pwm', 'amlogic,meson-axg-ee-pwm', 'amlogic,meson-axg-ao-pwm', 'amlogic,meson-g12a-ee-pwm', 'amlogic,meson-g12a-ao-pwm-ab', 'amlogic,meson-g12a-ao-pwm-cd']
   	'amlogic,meson-gx-pwm' was expected
   	'amlogic,meson-gx-ao-pwm' was expected
   	'amlogic,meson8-pwm' was expected
   	'amlogic,c3-pwm' is not one of ['amlogic,meson8-pwm-v2', 'amlogic,meson-s4-pwm']
   	'amlogic,c3-pwm' is not one of ['amlogic,meson-a1-pwm']
   	'amlogic,c3-pwm' is not one of ['amlogic,meson8b-pwm-v2', 'amlogic,meson-gxbb-pwm-v2', 'amlogic,meson-axg-pwm-v2', 'amlogic,meson-g12-pwm-v2']
   	'amlogic,meson-gxbb-pwm' was expected

vim +/d2f0 +787 arch/arm64/boot/dts/amlogic/amlogic-c3.dtsi

    15	
    16	/ {
    17		cpus {
    18			#address-cells = <2>;
    19			#size-cells = <0>;
    20	
    21			cpu0: cpu@0 {
    22				device_type = "cpu";
    23				compatible = "arm,cortex-a35";
    24				reg = <0x0 0x0>;
    25				enable-method = "psci";
    26			};
    27	
    28			cpu1: cpu@1 {
    29				device_type = "cpu";
    30				compatible = "arm,cortex-a35";
    31				reg = <0x0 0x1>;
    32				enable-method = "psci";
    33			};
    34		};
    35	
    36		timer {
    37			compatible = "arm,armv8-timer";
    38			interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
    39				     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
    40				     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>,
    41				     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_LOW)>;
    42		};
    43	
    44		psci {
    45			compatible = "arm,psci-1.0";
    46			method = "smc";
    47		};
    48	
    49		xtal: xtal-clk {
    50			compatible = "fixed-clock";
    51			clock-frequency = <24000000>;
    52			clock-output-names = "xtal";
    53			#clock-cells = <0>;
    54		};
    55	
    56		sm: secure-monitor {
    57			compatible = "amlogic,meson-gxbb-sm";
    58	
    59			pwrc: power-controller {
    60				compatible = "amlogic,c3-pwrc";
    61				#power-domain-cells = <1>;
    62			};
    63		};
    64	
    65		sram@7f50e00 {
    66			compatible = "mmio-sram";
    67			reg = <0x0 0x07f50e00 0x0 0x100>;
    68			#address-cells = <1>;
    69			#size-cells = <1>;
    70			ranges = <0 0x0 0x07f50e00 0x100>;
    71	
    72			scmi_shmem: sram@0 {
    73				compatible = "arm,scmi-shmem";
    74				reg = <0x0 0x100>;
    75			};
    76		};
    77	
    78		firmware {
    79			scmi: scmi {
    80				compatible = "arm,scmi-smc";
    81				arm,smc-id = <0x820000C1>;
    82				shmem = <&scmi_shmem>;
    83				#address-cells = <1>;
    84				#size-cells = <0>;
    85	
    86				scmi_clk: protocol@14 {
    87					reg = <0x14>;
    88					#clock-cells = <1>;
    89				};
    90			};
    91		};
    92	
    93		soc {
    94			compatible = "simple-bus";
    95			#address-cells = <2>;
    96			#size-cells = <2>;
    97			ranges;
    98	
    99			gic: interrupt-controller@fff01000 {
   100				compatible = "arm,gic-400";
   101				#interrupt-cells = <3>;
   102				#address-cells = <0>;
   103				interrupt-controller;
   104				reg = <0x0 0xfff01000 0 0x1000>,
   105				      <0x0 0xfff02000 0 0x2000>,
   106				      <0x0 0xfff04000 0 0x2000>,
   107				      <0x0 0xfff06000 0 0x2000>;
   108				interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
   109			};
   110	
   111			apb4: bus@fe000000 {
   112				compatible = "simple-bus";
   113				reg = <0x0 0xfe000000 0x0 0x480000>;
   114				#address-cells = <2>;
   115				#size-cells = <2>;
   116				ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
   117	
   118				clkc_periphs: clock-controller@0 {
   119					compatible = "amlogic,c3-peripherals-clkc";
   120					reg = <0x0 0x0 0x0 0x49c>;
   121					#clock-cells = <1>;
   122					clocks = <&xtal>,
   123						 <&scmi_clk CLKID_OSC>,
   124						 <&scmi_clk CLKID_FIXED_PLL_OSC>,
   125						 <&clkc_pll CLKID_FCLK_DIV2>,
   126						 <&clkc_pll CLKID_FCLK_DIV2P5>,
   127						 <&clkc_pll CLKID_FCLK_DIV3>,
   128						 <&clkc_pll CLKID_FCLK_DIV4>,
   129						 <&clkc_pll CLKID_FCLK_DIV5>,
   130						 <&clkc_pll CLKID_FCLK_DIV7>,
   131						 <&clkc_pll CLKID_GP0_PLL>,
   132						 <&scmi_clk CLKID_GP1_PLL_OSC>,
   133						 <&clkc_pll CLKID_HIFI_PLL>,
   134						 <&scmi_clk CLKID_SYS_CLK>,
   135						 <&scmi_clk CLKID_AXI_CLK>,
   136						 <&scmi_clk CLKID_SYS_PLL_DIV16>,
   137						 <&scmi_clk CLKID_CPU_CLK_DIV16>;
   138					clock-names = "xtal_24m",
   139						      "oscin",
   140						      "fix",
   141						      "fdiv2",
   142						      "fdiv2p5",
   143						      "fdiv3",
   144						      "fdiv4",
   145						      "fdiv5",
   146						      "fdiv7",
   147						      "gp0",
   148						      "gp1",
   149						      "hifi",
   150						      "sysclk",
   151						      "axiclk",
   152						      "sysplldiv16",
   153						      "cpudiv16";
   154				};
   155	
   156				reset: reset-controller@2000 {
   157					compatible = "amlogic,c3-reset";
   158					reg = <0x0 0x2000 0x0 0x98>;
   159					#reset-cells = <1>;
   160				};
   161	
   162				watchdog@2100 {
   163					compatible = "amlogic,c3-wdt", "amlogic,t7-wdt";
   164					reg = <0x0 0x2100 0x0 0x10>;
   165					clocks = <&xtal>;
   166				};
   167	
   168				periphs_pinctrl: pinctrl@4000 {
   169					compatible = "amlogic,c3-periphs-pinctrl";
   170					#address-cells = <2>;
   171					#size-cells = <2>;
   172					ranges = <0x0 0x0 0x0 0x4000 0x0 0x02de>;
   173	
   174					gpio: bank@0 {
   175						reg = <0x0 0x0 0x0 0x004c>,
   176						      <0x0 0x100 0x0 0x01de>;
   177						reg-names = "mux", "gpio";
   178						gpio-controller;
   179						#gpio-cells = <2>;
   180						gpio-ranges = <&periphs_pinctrl 0 0 55>;
   181					};
   182	
   183					i2c0_pins1: i2c0-pins1 {
   184						mux {
   185							groups = "i2c0_sda_e",
   186								 "i2c0_scl_e";
   187							function = "i2c0";
   188							bias-disable;
   189							drive-strength-microamp = <3000>;
   190						};
   191					};
   192	
   193					i2c0_pins2: i2c0-pins2 {
   194						mux {
   195							groups = "i2c0_sda_d",
   196								 "i2c0_scl_d";
   197							function = "i2c0";
   198							bias-disable;
   199							drive-strength-microamp = <3000>;
   200						};
   201					};
   202	
   203					i2c1_pins1: i2c1-pins1 {
   204						mux {
   205							groups = "i2c1_sda_x",
   206								 "i2c1_scl_x";
   207							function = "i2c1";
   208							bias-disable;
   209							drive-strength-microamp = <3000>;
   210						};
   211					};
   212	
   213					i2c1_pins2: i2c1-pins2 {
   214						mux {
   215							groups = "i2c1_sda_d",
   216								 "i2c1_scl_d";
   217							function = "i2c1";
   218							bias-disable;
   219							drive-strength-microamp = <3000>;
   220						};
   221					};
   222	
   223					i2c1_pins3: i2c1-pins3 {
   224						mux {
   225							groups = "i2c1_sda_a",
   226								 "i2c1_scl_a";
   227							function = "i2c1";
   228							bias-disable;
   229							drive-strength-microamp = <3000>;
   230						};
   231					};
   232	
   233					i2c1_pins4: i2c1-pins4 {
   234						mux {
   235							groups = "i2c1_sda_b",
   236								 "i2c1_scl_b";
   237							function = "i2c1";
   238							bias-disable;
   239							drive-strength-microamp = <3000>;
   240						};
   241					};
   242	
   243					i2c2_pins1: i2c2-pins1 {
   244						mux {
   245							groups = "i2c2_sda",
   246								 "i2c2_scl";
   247							function = "i2c2";
   248							bias-disable;
   249							drive-strength-microamp = <3000>;
   250						};
   251					};
   252	
   253					i2c3_pins1: i2c3-pins1 {
   254						mux {
   255							groups = "i2c3_sda_c",
   256								 "i2c3_scl_c";
   257							function = "i2c3";
   258							bias-disable;
   259							drive-strength-microamp = <3000>;
   260						};
   261					};
   262	
   263					i2c3_pins2: i2c3-pins2 {
   264						mux {
   265							groups = "i2c3_sda_x",
   266								 "i2c3_scl_x";
   267							function = "i2c3";
   268							bias-disable;
   269							drive-strength-microamp = <3000>;
   270						};
   271					};
   272	
   273					i2c3_pins3: i2c3-pins3 {
   274						mux {
   275							groups = "i2c3_sda_d",
   276								 "i2c3_scl_d";
   277							function = "i2c3";
   278							bias-disable;
   279							drive-strength-microamp = <3000>;
   280						};
   281					};
   282	
   283					nand_pins: nand-pins {
   284						mux {
   285							groups = "emmc_nand_d0",
   286								 "emmc_nand_d1",
   287								 "emmc_nand_d2",
   288								 "emmc_nand_d3",
   289								 "emmc_nand_d4",
   290								 "emmc_nand_d5",
   291								 "emmc_nand_d6",
   292								 "emmc_nand_d7",
   293								 "nand_ce0",
   294								 "nand_ale",
   295								 "nand_cle",
   296								 "nand_wen_clk",
   297								 "nand_ren_wr";
   298							function = "nand";
   299							input-enable;
   300						};
   301					};
   302	
   303					sdcard_pins: sdcard-pins {
   304						mux {
   305							groups = "sdcard_d0",
   306								 "sdcard_d1",
   307								 "sdcard_d2",
   308								 "sdcard_d3",
   309								 "sdcard_clk",
   310								 "sdcard_cmd";
   311							function = "sdcard";
   312							bias-pull-up;
   313							drive-strength-microamp = <4000>;
   314						};
   315					};
   316	
   317					sdcard_clk_gate_pins: sdcard-clk-cmd-pins {
   318						mux {
   319							groups = "GPIOC_4";
   320							function = "gpio_periphs";
   321							bias-pull-down;
   322							drive-strength-microamp = <4000>;
   323						};
   324					};
   325	
   326					sdio_m_clk_gate_pins: sdio-m-clk-cmd-pins {
   327						mux {
   328							groups = "sdio_clk";
   329							function = "sdio";
   330							bias-pull-down;
   331							drive-strength-microamp = <4000>;
   332						};
   333					};
   334	
   335					sdio_m_pins: sdio-m-all-pins {
   336						mux {
   337							groups = "sdio_d0",
   338								 "sdio_d1",
   339								 "sdio_d2",
   340								 "sdio_d3",
   341								 "sdio_clk",
   342								 "sdio_cmd";
   343							function = "sdio";
   344							input-enable;
   345							bias-pull-up;
   346							drive-strength-microamp = <4000>;
   347						};
   348					};
   349	
   350					spicc0_pins1: spicc0-pins1 {
   351						mux {
   352							groups = "spi_a_mosi_b",
   353								 "spi_a_miso_b",
   354								 "spi_a_clk_b";
   355							function = "spi_a";
   356							drive-strength-microamp = <3000>;
   357						};
   358					};
   359	
   360					spicc0_pins2: spicc0-pins2 {
   361						mux {
   362							groups = "spi_a_mosi_c",
   363								 "spi_a_miso_c",
   364								 "spi_a_clk_c";
   365							function = "spi_a";
   366							drive-strength-microamp = <3000>;
   367						};
   368					};
   369	
   370					spicc0_pins3: spicc0-pins3 {
   371						mux {
   372							groups = "spi_a_mosi_x",
   373								 "spi_a_miso_x",
   374								 "spi_a_clk_x";
   375							function = "spi_a";
   376							drive-strength-microamp = <3000>;
   377						};
   378					};
   379	
   380					spicc1_pins1: spicc1-pins1 {
   381						mux {
   382							groups = "spi_b_mosi_d",
   383								 "spi_b_miso_d",
   384								 "spi_b_clk_d";
   385							function = "spi_b";
   386							drive-strength-microamp = <3000>;
   387						};
   388					};
   389	
   390					spicc1_pins2: spicc1-pins2 {
   391						mux {
   392							groups = "spi_b_mosi_x",
   393								 "spi_b_miso_x",
   394								 "spi_b_clk_x";
   395							function = "spi_b";
   396							drive-strength-microamp = <3000>;
   397						};
   398					};
   399	
   400					spifc_pins: spifc-pins {
   401						mux {
   402							groups = "spif_mo",
   403								 "spif_mi",
   404								 "spif_clk",
   405								 "spif_cs",
   406								 "spif_hold",
   407								 "spif_wp",
   408								 "spif_clk_loop";
   409							function = "spif";
   410							drive-strength-microamp = <4000>;
   411						};
   412					};
   413	
   414					pwm_a_pins1: pwm-a-pins1 {
   415						mux {
   416							groups = "pwm_a";
   417							function = "pwm_a";
   418						};
   419					};
   420	
   421					pwm_b_pins1: pwm-b-pins1 {
   422						mux {
   423							groups = "pwm_b";
   424							function = "pwm_b";
   425						};
   426					};
   427	
   428					pwm_c_pins1: pwm-c-pins1 {
   429						mux {
   430							groups = "pwm_c";
   431							function = "pwm_c";
   432						};
   433					};
   434	
   435					pwm_d_pins1: pwm-d-pins1 {
   436						mux {
   437							groups = "pwm_d";
   438							function = "pwm_d";
   439						};
   440					};
   441	
   442					pwm_e_pins1: pwm-e-pins1 {
   443						mux {
   444							groups = "pwm_e";
   445							function = "pwm_e";
   446						};
   447					};
   448	
   449					pwm_f_pins1: pwm-f-pins1 {
   450						mux {
   451							groups = "pwm_f";
   452							function = "pwm_f";
   453						};
   454					};
   455	
   456					pwm_g_pins1: pwm-g-pins1 {
   457						mux {
   458							groups = "pwm_g_b";
   459							function = "pwm_g";
   460						};
   461					};
   462	
   463					pwm_g_pins2: pwm-g-pins2 {
   464						mux {
   465							groups = "pwm_g_c";
   466							function = "pwm_g";
   467						};
   468					};
   469	
   470					pwm_g_pins3: pwm-g-pins3 {
   471						mux {
   472							groups = "pwm_g_d";
   473							function = "pwm_g";
   474						};
   475					};
   476	
   477					pwm_g_pins4: pwm-g-pins4 {
   478						mux {
   479							groups = "pwm_g_x0";
   480							function = "pwm_g";
   481						};
   482					};
   483	
   484					pwm_g_pins5: pwm-g-pins5 {
   485						mux {
   486							groups = "pwm_g_x8";
   487							function = "pwm_g";
   488						};
   489					};
   490	
   491					pwm_h_pins1: pwm-h-pins1 {
   492						mux {
   493							groups = "pwm_h_b";
   494							function = "pwm_h";
   495						};
   496					};
   497	
   498					pwm_h_pins2: pwm-h-pins2 {
   499						mux {
   500							groups = "pwm_h_c";
   501							function = "pwm_h";
   502						};
   503					};
   504	
   505					pwm_h_pins3: pwm-h-pins3 {
   506						mux {
   507							groups = "pwm_h_d";
   508							function = "pwm_h";
   509						};
   510					};
   511	
   512					pwm_h_pins4: pwm-h-pins4 {
   513						mux {
   514							groups = "pwm_h_x1";
   515							function = "pwm_h";
   516						};
   517					};
   518	
   519					pwm_h_pins5: pwm-h-pins5 {
   520						mux {
   521							groups = "pwm_h_x9";
   522							function = "pwm_h";
   523						};
   524					};
   525	
   526					pwm_i_pins1: pwm-i-pins1 {
   527						mux {
   528							groups = "pwm_i_b";
   529							function = "pwm_i";
   530						};
   531					};
   532	
   533					pwm_i_pins2: pwm-i-pins2 {
   534						mux {
   535							groups = "pwm_i_c";
   536							function = "pwm_i";
   537						};
   538					};
   539	
   540					pwm_i_pins3: pwm-i-pins3 {
   541						mux {
   542							groups = "pwm_i_d";
   543							function = "pwm_i";
   544						};
   545					};
   546	
   547					pwm_i_pins4: pwm-i-pins4 {
   548						mux {
   549							groups = "pwm_i_x2";
   550							function = "pwm_i";
   551						};
   552					};
   553	
   554					pwm_i_pins5: pwm-i-pins5 {
   555						mux {
   556							groups = "pwm_i_x10";
   557							function = "pwm_i";
   558						};
   559					};
   560	
   561					pwm_j_pins1: pwm-j-pins1 {
   562						mux {
   563							groups = "pwm_j_c";
   564							function = "pwm_j";
   565						};
   566					};
   567	
   568					pwm_j_pins2: pwm-j-pins2 {
   569						mux {
   570							groups = "pwm_j_d";
   571							function = "pwm_j";
   572						};
   573					};
   574	
   575					pwm_j_pins3: pwm-j-pins3 {
   576						mux {
   577							groups = "pwm_j_b";
   578							function = "pwm_j";
   579						};
   580					};
   581	
   582					pwm_j_pins4: pwm-j-pins4 {
   583						mux {
   584							groups = "pwm_j_x3";
   585							function = "pwm_j";
   586						};
   587					};
   588	
   589					pwm_j_pins5: pwm-j-pins5 {
   590						mux {
   591							groups = "pwm_j_x12";
   592							function = "pwm_j";
   593						};
   594					};
   595	
   596					pwm_k_pins1: pwm-k-pins1 {
   597						mux {
   598							groups = "pwm_k_c";
   599							function = "pwm_k";
   600						};
   601					};
   602	
   603					pwm_k_pins2: pwm-k-pins2 {
   604						mux {
   605							groups = "pwm_k_d";
   606							function = "pwm_k";
   607						};
   608					};
   609	
   610					pwm_k_pins3: pwm-k-pins3 {
   611						mux {
   612							groups = "pwm_k_b";
   613							function = "pwm_k";
   614						};
   615					};
   616	
   617					pwm_k_pins4: pwm-k-pins4 {
   618						mux {
   619							groups = "pwm_k_x4";
   620							function = "pwm_k";
   621						};
   622					};
   623	
   624					pwm_k_pins5: pwm-k-pins5 {
   625						mux {
   626							groups = "pwm_k_x13";
   627							function = "pwm_k";
   628						};
   629					};
   630	
   631					pwm_l_pins1: pwm-l-pins1 {
   632						mux {
   633							groups = "pwm_l_c";
   634							function = "pwm_l";
   635						};
   636					};
   637	
   638					pwm_l_pins2: pwm-l-pins2 {
   639						mux {
   640							groups = "pwm_l_x";
   641							function = "pwm_l";
   642						};
   643					};
   644	
   645					pwm_l_pins3: pwm-l-pins3 {
   646						mux {
   647							groups = "pwm_l_b";
   648							function = "pwm_l";
   649						};
   650					};
   651	
   652					pwm_l_pins4: pwm-l-pins4 {
   653						mux {
   654							groups = "pwm_l_a";
   655							function = "pwm_l";
   656						};
   657					};
   658	
   659					pwm_m_pins1: pwm-m-pins1 {
   660						mux {
   661							groups = "pwm_m_c";
   662							function = "pwm_m";
   663						};
   664					};
   665	
   666					pwm_m_pins2: pwm-m-pins2 {
   667						mux {
   668							groups = "pwm_m_x";
   669							function = "pwm_m";
   670						};
   671					};
   672	
   673					pwm_m_pins3: pwm-m-pins3 {
   674						mux {
   675							groups = "pwm_m_a";
   676							function = "pwm_m";
   677						};
   678					};
   679	
   680					pwm_m_pins4: pwm-m-pins4 {
   681						mux {
   682							groups = "pwm_m_b";
   683							function = "pwm_m";
   684						};
   685					};
   686	
   687					pwm_n_pins1: pwm-n-pins1 {
   688						mux {
   689							groups = "pwm_n_x";
   690							function = "pwm_n";
   691						};
   692					};
   693	
   694					pwm_n_pins2: pwm-n-pins2 {
   695						mux {
   696							groups = "pwm_n_a";
   697							function = "pwm_n";
   698						};
   699					};
   700	
   701					pwm_n_pins3: pwm-n-pins3 {
   702						mux {
   703							groups = "pwm_n_b";
   704							function = "pwm_n";
   705						};
   706					};
   707				};
   708	
   709				gpio_intc: interrupt-controller@4080 {
   710					compatible = "amlogic,c3-gpio-intc", "amlogic,meson-gpio-intc";
   711					reg = <0x0 0x4080 0x0 0x0020>;
   712					interrupt-controller;
   713					#interrupt-cells = <2>;
   714					amlogic,channel-interrupts =
   715						<10 11 12 13 14 15 16 17 18 19 20 21>;
   716				};
   717	
   718				clkc_pll: clock-controller@8000 {
   719					compatible = "amlogic,c3-pll-clkc";
   720					reg = <0x0 0x8000 0x0 0x1a4>;
   721					#clock-cells = <1>;
   722					clocks = <&scmi_clk CLKID_TOP_PLL_OSC>,
   723						 <&scmi_clk CLKID_MCLK_PLL_OSC>,
   724						 <&scmi_clk CLKID_FIXED_PLL_OSC>;
   725					clock-names = "top",
   726						      "mclk",
   727						      "fix";
   728				};
   729	
   730				eth_phy: mdio-multiplexer@28000 {
   731					compatible = "amlogic,g12a-mdio-mux";
   732					reg = <0x0 0x28000 0x0 0xa4>;
   733	
   734					clocks = <&clkc_periphs CLKID_SYS_ETH_PHY>,
   735						 <&xtal>,
   736						 <&clkc_pll CLKID_FCLK_50M>;
   737					clock-names = "pclk", "clkin0", "clkin1";
   738					mdio-parent-bus = <&mdio0>;
   739					#address-cells = <1>;
   740					#size-cells = <0>;
   741	
   742					ext_mdio: mdio@0 {
   743						reg = <0>;
   744						#address-cells = <1>;
   745						#size-cells = <0>;
   746					};
   747	
   748					int_mdio: mdio@1 {
   749						reg = <1>;
   750						#address-cells = <1>;
   751						#size-cells = <0>;
   752	
   753						internal_ephy: ethernet_phy@8 {
   754							compatible = "ethernet-phy-id0180.3301",
   755								     "ethernet-phy-ieee802.3-c22";
   756							interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
   757							reg = <8>;
   758							max-speed = <100>;
   759						};
   760					};
   761				};
   762	
   763				spicc0: spi@50000 {
   764					compatible = "amlogic,meson-g12a-spicc";
   765					reg = <0x0 0x50000 0x0 0x44>;
   766					interrupts = <GIC_SPI 183 IRQ_TYPE_LEVEL_HIGH>;
   767					clocks = <&clkc_periphs CLKID_SYS_SPICC_0>,
   768						 <&clkc_periphs CLKID_SPICC_A>;
   769					clock-names = "core", "pclk";
   770					#address-cells = <1>;
   771					#size-cells = <0>;
   772					status = "disabled";
   773				};
   774	
   775				spicc1: spi@52000 {
   776					compatible = "amlogic,meson-g12a-spicc";
   777					reg = <0x0 0x52000 0x0 0x44>;
   778					interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>;
   779					clocks = <&clkc_periphs CLKID_SYS_SPICC_1>,
   780						 <&clkc_periphs CLKID_SPICC_B>;
   781					clock-names = "core", "pclk";
   782					#address-cells = <1>;
   783					#size-cells = <0>;
   784					status = "disabled";
   785				};
   786	
 > 787				pwm_mn: pwm@54000 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
