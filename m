Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E49EF1D54F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jun 2024 15:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717773402; cv=none; b=awLXcfMxP2i8FPiTIEev+S28drFv67yXjz0sM+D3g/mDUa+/Z53eBa1tJdXySEhKFsK7EIBv0Dm2BaqVkGmZpBn9Vd1d4AFs1WmkoV64ym7LxZ2txm2m0mj1KKDiZf5lK42wlfWKqLdbR+JdZyRYjYoBE2gWWcMjjjEqMs+BqZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717773402; c=relaxed/simple;
	bh=folljIAQX2con0jH9phl68A02e41yoLK3FOJdss2Hms=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZMTDfZPScIU7ZRK0gnCWiVXy9GXMCcfMlgzmOWCzpuWTWMcbwor/GEb1hSlgZQwTjia7mHqf0UXIJNB2G6XMa6O+45DAmtybbfO85DK75nn3M64Szk1QU9ZNqb8Q7nbI9IXRuYZWOrnAB0jmlYtqMHKpT9XO7FWC6BuOmbrTqEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Xf0IecIZ; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Xf0IecIZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717773400; x=1749309400;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=folljIAQX2con0jH9phl68A02e41yoLK3FOJdss2Hms=;
  b=Xf0IecIZssdOScMZ2DZlReiXQX8/FBvO7vVimdfvc6Od1qxXXnMJQe1U
   6zcj3lYVuQP7gHH4T7u2s8AO1Fx0CibAiAVo31byf4n/5saokNxtc3iug
   9E8PlfoUN1VcGBNjKED//q8n8veAfRuhUIBsUydDPZbhhMR6Dwi6dOXNl
   30zXu0NWeh5bZ3+t+KMuJlNwtcnUZPcMi7kDrmGYLpXUGU0eUWlsHjjoC
   R5tNLoXtYyerUvlQVwZY9ZhdLNzjFqVGZ88bjacVZyvBT7tvyrvKAMlHZ
   7hGaLeY2ckd2Iuo1o0L8fmw6R000+oeUVt3DqU05xOKVvWsTeBwchf2L2
   A==;
X-CSE-ConnectionGUID: cjN+ZNT9QbC3Rza36GBMFQ==
X-CSE-MsgGUID: etBAebxhQQu9ql3AG4PkBQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="25126498"
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="25126498"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 08:16:39 -0700
X-CSE-ConnectionGUID: l5usbp3WQj2Bp3qIW8nBrw==
X-CSE-MsgGUID: 6weTSr0mSb+QerTJWGWbKA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,221,1712646000"; 
   d="scan'208";a="42916841"
Received: from lkp-server01.sh.intel.com (HELO b4d3d4be9bbf) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 07 Jun 2024 08:15:06 -0700
Received: from kbuild by b4d3d4be9bbf with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFbIy-00001S-1O;
	Fri, 07 Jun 2024 15:15:00 +0000
Date: Fri, 7 Jun 2024 23:14:04 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/000-devicetree 3/184]
 arch/arm64/boot/dts/apple/t8112.dtsi:644.28-720.5: Warning (simple_bus_reg):
 /soc/spmi@23d0d9300: simple-bus unit address format error, expected
 "23d714000"
Message-ID: <202406072306.FZBbLGRp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   f5ebb40d8ef5b574bedcdf949aadfdce5a590d7d
commit: e5ae788556676046804c1fe1036ac183f125947a [3/184] arm64: dts: apple: t8112: Add PMU NVMEM and SMC RTC/reboot nodes
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240607/202406072306.FZBbLGRp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406072306.FZBbLGRp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t8112.dtsi:644.28-720.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/t8112.dtsi:684.43-687.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)

vim +/23d714000 +644 arch/arm64/boot/dts/apple/t8112.dtsi

    15	
    16	/ {
    17		compatible = "apple,t8112", "apple,arm-platform";
    18	
    19		#address-cells = <2>;
    20		#size-cells = <2>;
    21	
    22		cpus {
    23			#address-cells = <2>;
    24			#size-cells = <0>;
    25	
    26			cpu-map {
    27				cluster0 {
    28					core0 {
    29						cpu = <&cpu_e0>;
    30					};
    31					core1 {
    32						cpu = <&cpu_e1>;
    33					};
    34					core2 {
    35						cpu = <&cpu_e2>;
    36					};
    37					core3 {
    38						cpu = <&cpu_e3>;
    39					};
    40				};
    41	
    42				cluster1 {
    43					core0 {
    44						cpu = <&cpu_p0>;
    45					};
    46					core1 {
    47						cpu = <&cpu_p1>;
    48					};
    49					core2 {
    50						cpu = <&cpu_p2>;
    51					};
    52					core3 {
    53						cpu = <&cpu_p3>;
    54					};
    55				};
    56			};
    57	
    58			cpu_e0: cpu@0 {
    59				compatible = "apple,blizzard";
    60				device_type = "cpu";
    61				reg = <0x0 0x0>;
    62				enable-method = "spin-table";
    63				cpu-release-addr = <0 0>; /* To be filled by loader */
    64				operating-points-v2 = <&ecluster_opp>;
    65				capacity-dmips-mhz = <756>;
    66				performance-domains = <&cpufreq_e>;
    67				next-level-cache = <&l2_cache_0>;
    68				i-cache-size = <0x20000>;
    69				d-cache-size = <0x10000>;
    70			};
    71	
    72			cpu_e1: cpu@1 {
    73				compatible = "apple,blizzard";
    74				device_type = "cpu";
    75				reg = <0x0 0x1>;
    76				enable-method = "spin-table";
    77				cpu-release-addr = <0 0>; /* To be filled by loader */
    78				operating-points-v2 = <&ecluster_opp>;
    79				capacity-dmips-mhz = <756>;
    80				performance-domains = <&cpufreq_e>;
    81				next-level-cache = <&l2_cache_0>;
    82				i-cache-size = <0x20000>;
    83				d-cache-size = <0x10000>;
    84			};
    85	
    86			cpu_e2: cpu@2 {
    87				compatible = "apple,blizzard";
    88				device_type = "cpu";
    89				reg = <0x0 0x2>;
    90				enable-method = "spin-table";
    91				cpu-release-addr = <0 0>; /* To be filled by loader */
    92				operating-points-v2 = <&ecluster_opp>;
    93				capacity-dmips-mhz = <756>;
    94				performance-domains = <&cpufreq_e>;
    95				next-level-cache = <&l2_cache_0>;
    96				i-cache-size = <0x20000>;
    97				d-cache-size = <0x10000>;
    98			};
    99	
   100			cpu_e3: cpu@3 {
   101				compatible = "apple,blizzard";
   102				device_type = "cpu";
   103				reg = <0x0 0x3>;
   104				enable-method = "spin-table";
   105				cpu-release-addr = <0 0>; /* To be filled by loader */
   106				operating-points-v2 = <&ecluster_opp>;
   107				capacity-dmips-mhz = <756>;
   108				performance-domains = <&cpufreq_e>;
   109				next-level-cache = <&l2_cache_0>;
   110				i-cache-size = <0x20000>;
   111				d-cache-size = <0x10000>;
   112			};
   113	
   114			cpu_p0: cpu@10100 {
   115				compatible = "apple,avalanche";
   116				device_type = "cpu";
   117				reg = <0x0 0x10100>;
   118				enable-method = "spin-table";
   119				cpu-release-addr = <0 0>; /* To be filled by loader */
   120				operating-points-v2 = <&pcluster_opp>;
   121				capacity-dmips-mhz = <1024>;
   122				performance-domains = <&cpufreq_p>;
   123				next-level-cache = <&l2_cache_1>;
   124				i-cache-size = <0x30000>;
   125				d-cache-size = <0x20000>;
   126			};
   127	
   128			cpu_p1: cpu@10101 {
   129				compatible = "apple,avalanche";
   130				device_type = "cpu";
   131				reg = <0x0 0x10101>;
   132				enable-method = "spin-table";
   133				cpu-release-addr = <0 0>; /* To be filled by loader */
   134				operating-points-v2 = <&pcluster_opp>;
   135				capacity-dmips-mhz = <1024>;
   136				performance-domains = <&cpufreq_p>;
   137				next-level-cache = <&l2_cache_1>;
   138				i-cache-size = <0x30000>;
   139				d-cache-size = <0x20000>;
   140			};
   141	
   142			cpu_p2: cpu@10102 {
   143				compatible = "apple,avalanche";
   144				device_type = "cpu";
   145				reg = <0x0 0x10102>;
   146				enable-method = "spin-table";
   147				cpu-release-addr = <0 0>; /* To be filled by loader */
   148				operating-points-v2 = <&pcluster_opp>;
   149				capacity-dmips-mhz = <1024>;
   150				performance-domains = <&cpufreq_p>;
   151				next-level-cache = <&l2_cache_1>;
   152				i-cache-size = <0x30000>;
   153				d-cache-size = <0x20000>;
   154			};
   155	
   156			cpu_p3: cpu@10103 {
   157				compatible = "apple,avalanche";
   158				device_type = "cpu";
   159				reg = <0x0 0x10103>;
   160				enable-method = "spin-table";
   161				cpu-release-addr = <0 0>; /* To be filled by loader */
   162				operating-points-v2 = <&pcluster_opp>;
   163				capacity-dmips-mhz = <1024>;
   164				performance-domains = <&cpufreq_p>;
   165				next-level-cache = <&l2_cache_1>;
   166				i-cache-size = <0x30000>;
   167				d-cache-size = <0x20000>;
   168			};
   169	
   170			l2_cache_0: l2-cache-0 {
   171				compatible = "cache";
   172				cache-level = <2>;
   173				cache-unified;
   174				cache-size = <0x400000>;
   175			};
   176	
   177			l2_cache_1: l2-cache-1 {
   178				compatible = "cache";
   179				cache-level = <2>;
   180				cache-unified;
   181				cache-size = <0x1000000>;
   182			};
   183		};
   184	
   185		ecluster_opp: opp-table-0 {
   186			compatible = "operating-points-v2";
   187			opp-shared;
   188	
   189			opp01 {
   190				opp-hz = /bits/ 64 <600000000>;
   191				opp-level = <1>;
   192				clock-latency-ns = <7500>;
   193			};
   194			opp02 {
   195				opp-hz = /bits/ 64 <912000000>;
   196				opp-level = <2>;
   197				clock-latency-ns = <20000>;
   198			};
   199			opp03 {
   200				opp-hz = /bits/ 64 <1284000000>;
   201				opp-level = <3>;
   202				clock-latency-ns = <22000>;
   203			};
   204			opp04 {
   205				opp-hz = /bits/ 64 <1752000000>;
   206				opp-level = <4>;
   207				clock-latency-ns = <30000>;
   208			};
   209			opp05 {
   210				opp-hz = /bits/ 64 <2004000000>;
   211				opp-level = <5>;
   212				clock-latency-ns = <35000>;
   213			};
   214			opp06 {
   215				opp-hz = /bits/ 64 <2256000000>;
   216				opp-level = <6>;
   217				clock-latency-ns = <39000>;
   218			};
   219			opp07 {
   220				opp-hz = /bits/ 64 <2424000000>;
   221				opp-level = <7>;
   222				clock-latency-ns = <53000>;
   223			};
   224		};
   225	
   226		pcluster_opp: opp-table-1 {
   227			compatible = "operating-points-v2";
   228			opp-shared;
   229	
   230			opp01 {
   231				opp-hz = /bits/ 64 <660000000>;
   232				opp-level = <1>;
   233				clock-latency-ns = <9000>;
   234			};
   235			opp02 {
   236				opp-hz = /bits/ 64 <924000000>;
   237				opp-level = <2>;
   238				clock-latency-ns = <19000>;
   239			};
   240			opp03 {
   241				opp-hz = /bits/ 64 <1188000000>;
   242				opp-level = <3>;
   243				clock-latency-ns = <22000>;
   244			};
   245			opp04 {
   246				opp-hz = /bits/ 64 <1452000000>;
   247				opp-level = <4>;
   248				clock-latency-ns = <24000>;
   249			};
   250			opp05 {
   251				opp-hz = /bits/ 64 <1704000000>;
   252				opp-level = <5>;
   253				clock-latency-ns = <26000>;
   254			};
   255			opp06 {
   256				opp-hz = /bits/ 64 <1968000000>;
   257				opp-level = <6>;
   258				clock-latency-ns = <28000>;
   259			};
   260			opp07 {
   261				opp-hz = /bits/ 64 <2208000000>;
   262				opp-level = <7>;
   263				clock-latency-ns = <30000>;
   264			};
   265			opp08 {
   266				opp-hz = /bits/ 64 <2400000000>;
   267				opp-level = <8>;
   268				clock-latency-ns = <33000>;
   269			};
   270			opp09 {
   271				opp-hz = /bits/ 64 <2568000000>;
   272				opp-level = <9>;
   273				clock-latency-ns = <34000>;
   274			};
   275			opp10 {
   276				opp-hz = /bits/ 64 <2724000000>;
   277				opp-level = <10>;
   278				clock-latency-ns = <36000>;
   279			};
   280			opp11 {
   281				opp-hz = /bits/ 64 <2868000000>;
   282				opp-level = <11>;
   283				clock-latency-ns = <41000>;
   284			};
   285			opp12 {
   286				opp-hz = /bits/ 64 <2988000000>;
   287				opp-level = <12>;
   288				clock-latency-ns = <42000>;
   289			};
   290			opp13 {
   291				opp-hz = /bits/ 64 <3096000000>;
   292				opp-level = <13>;
   293				clock-latency-ns = <44000>;
   294			};
   295			opp14 {
   296				opp-hz = /bits/ 64 <3204000000>;
   297				opp-level = <14>;
   298				clock-latency-ns = <46000>;
   299			};
   300			/* Not available until CPU deep sleep is implemented */
   301	#if 0
   302			opp15 {
   303				opp-hz = /bits/ 64 <3324000000>;
   304				opp-level = <15>;
   305				clock-latency-ns = <62000>;
   306				turbo-mode;
   307			};
   308			opp16 {
   309				opp-hz = /bits/ 64 <3408000000>;
   310				opp-level = <16>;
   311				clock-latency-ns = <62000>;
   312				turbo-mode;
   313			};
   314			opp17 {
   315				opp-hz = /bits/ 64 <3504000000>;
   316				opp-level = <17>;
   317				clock-latency-ns = <62000>;
   318				turbo-mode;
   319			};
   320	#endif
   321		};
   322	
   323		timer {
   324			compatible = "arm,armv8-timer";
   325			interrupt-parent = <&aic>;
   326			interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
   327			interrupts = <AIC_FIQ AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
   328				     <AIC_FIQ AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
   329				     <AIC_FIQ AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
   330				     <AIC_FIQ AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
   331		};
   332	
   333		pmu-e {
   334			compatible = "apple,blizzard-pmu";
   335			interrupt-parent = <&aic>;
   336			interrupts = <AIC_FIQ AIC_CPU_PMU_E IRQ_TYPE_LEVEL_HIGH>;
   337		};
   338	
   339		pmu-p {
   340			compatible = "apple,avalanche-pmu";
   341			interrupt-parent = <&aic>;
   342			interrupts = <AIC_FIQ AIC_CPU_PMU_P IRQ_TYPE_LEVEL_HIGH>;
   343		};
   344	
   345		clkref: clock-ref {
   346			compatible = "fixed-clock";
   347			#clock-cells = <0>;
   348			clock-frequency = <24000000>;
   349			clock-output-names = "clkref";
   350		};
   351	
   352		/*
   353		 * This is a fabulated representation of the input clock
   354		 * to NCO since we don't know the true clock tree.
   355		 */
   356		nco_clkref: clock-ref-nco {
   357			compatible = "fixed-clock";
   358			#clock-cells = <0>;
   359			clock-output-names = "nco_ref";
   360		};
   361	
   362		soc {
   363			compatible = "simple-bus";
   364			#address-cells = <2>;
   365			#size-cells = <2>;
   366	
   367			ranges;
   368			nonposted-mmio;
   369	
   370			cpufreq_e: cpufreq@210e20000 {
   371				compatible = "apple,t8112-cluster-cpufreq", "apple,cluster-cpufreq";
   372				reg = <0x2 0x10e20000 0 0x1000>;
   373				#performance-domain-cells = <0>;
   374			};
   375	
   376			cpufreq_p: cpufreq@211e20000 {
   377				compatible = "apple,t8112-cluster-cpufreq", "apple,cluster-cpufreq";
   378				reg = <0x2 0x11e20000 0 0x1000>;
   379				#performance-domain-cells = <0>;
   380			};
   381	
   382			sio_dart: iommu@235004000 {
   383				compatible = "apple,t8110-dart";
   384				reg = <0x2 0x35004000 0x0 0x4000>;
   385				interrupt-parent = <&aic>;
   386				interrupts = <AIC_IRQ 769 IRQ_TYPE_LEVEL_HIGH>;
   387				#iommu-cells = <1>;
   388				power-domains = <&ps_sio_cpu>;
   389			};
   390	
   391			i2c0: i2c@235010000 {
   392				compatible = "apple,t8112-i2c", "apple,i2c";
   393				reg = <0x2 0x35010000 0x0 0x4000>;
   394				clocks = <&clkref>;
   395				interrupt-parent = <&aic>;
   396				interrupts = <AIC_IRQ 761 IRQ_TYPE_LEVEL_HIGH>;
   397				pinctrl-0 = <&i2c0_pins>;
   398				pinctrl-names = "default";
   399				#address-cells = <0x1>;
   400				#size-cells = <0x0>;
   401				power-domains = <&ps_i2c0>;
   402				status = "disabled";
   403			};
   404	
   405			i2c1: i2c@235014000 {
   406				compatible = "apple,t8112-i2c", "apple,i2c";
   407				reg = <0x2 0x35014000 0x0 0x4000>;
   408				clocks = <&clkref>;
   409				interrupt-parent = <&aic>;
   410				interrupts = <AIC_IRQ 762 IRQ_TYPE_LEVEL_HIGH>;
   411				pinctrl-0 = <&i2c1_pins>;
   412				pinctrl-names = "default";
   413				#address-cells = <0x1>;
   414				#size-cells = <0x0>;
   415				power-domains = <&ps_i2c1>;
   416				status = "disabled";
   417			};
   418	
   419			i2c2: i2c@235018000 {
   420				compatible = "apple,t8112-i2c", "apple,i2c";
   421				reg = <0x2 0x35018000 0x0 0x4000>;
   422				clocks = <&clkref>;
   423				interrupt-parent = <&aic>;
   424				interrupts = <AIC_IRQ 763 IRQ_TYPE_LEVEL_HIGH>;
   425				pinctrl-0 = <&i2c2_pins>;
   426				pinctrl-names = "default";
   427				#address-cells = <0x1>;
   428				#size-cells = <0x0>;
   429				power-domains = <&ps_i2c2>;
   430				status = "disabled";
   431			};
   432	
   433			i2c3: i2c@23501c000 {
   434				compatible = "apple,t8112-i2c", "apple,i2c";
   435				reg = <0x2 0x3501c000 0x0 0x4000>;
   436				clocks = <&clkref>;
   437				interrupt-parent = <&aic>;
   438				interrupts = <AIC_IRQ 764 IRQ_TYPE_LEVEL_HIGH>;
   439				pinctrl-0 = <&i2c3_pins>;
   440				pinctrl-names = "default";
   441				#address-cells = <0x1>;
   442				#size-cells = <0x0>;
   443				power-domains = <&ps_i2c3>;
   444				status = "disabled";
   445			};
   446	
   447			i2c4: i2c@235020000 {
   448				compatible = "apple,t8112-i2c", "apple,i2c";
   449				reg = <0x2 0x35020000 0x0 0x4000>;
   450				clocks = <&clkref>;
   451				interrupt-parent = <&aic>;
   452				interrupts = <AIC_IRQ 765 IRQ_TYPE_LEVEL_HIGH>;
   453				pinctrl-0 = <&i2c4_pins>;
   454				pinctrl-names = "default";
   455				#address-cells = <0x1>;
   456				#size-cells = <0x0>;
   457				power-domains = <&ps_i2c4>;
   458				status = "disabled";
   459			};
   460	
   461			fpwm1: pwm@235044000 {
   462				compatible = "apple,t8112-fpwm", "apple,s5l-fpwm";
   463				reg = <0x2 0x35044000 0x0 0x4000>;
   464				power-domains = <&ps_fpwm1>;
   465				clocks = <&clkref>;
   466				#pwm-cells = <2>;
   467				status = "disabled";
   468			};
   469	
   470			serial0: serial@235200000 {
   471				compatible = "apple,s5l-uart";
   472				reg = <0x2 0x35200000 0x0 0x1000>;
   473				reg-io-width = <4>;
   474				interrupt-parent = <&aic>;
   475				interrupts = <AIC_IRQ 739 IRQ_TYPE_LEVEL_HIGH>;
   476				/*
   477				 * TODO: figure out the clocking properly, there may
   478				 * be a third selectable clock.
   479				 */
   480				clocks = <&clkref>, <&clkref>;
   481				clock-names = "uart", "clk_uart_baud0";
   482				power-domains = <&ps_uart0>;
   483				status = "disabled";
   484			};
   485	
   486			serial2: serial@235208000 {
   487				compatible = "apple,s5l-uart";
   488				reg = <0x2 0x35208000 0x0 0x1000>;
   489				reg-io-width = <4>;
   490				interrupt-parent = <&aic>;
   491				interrupts = <AIC_IRQ 741 IRQ_TYPE_LEVEL_HIGH>;
   492				clocks = <&clkref>, <&clkref>;
   493				clock-names = "uart", "clk_uart_baud0";
   494				power-domains = <&ps_uart2>;
   495				status = "disabled";
   496			};
   497	
   498			admac: dma-controller@238200000 {
   499				compatible = "apple,t8112-admac", "apple,admac";
   500				reg = <0x2 0x38200000 0x0 0x34000>;
   501				dma-channels = <24>;
   502				interrupts-extended = <0>,
   503						      <&aic AIC_IRQ 760 IRQ_TYPE_LEVEL_HIGH>,
   504						      <0>,
   505						      <0>;
   506				#dma-cells = <1>;
   507				iommus = <&sio_dart 2>;
   508				power-domains = <&ps_sio_adma>;
   509				resets = <&ps_audio_p>;
   510			};
   511	
   512			mca: i2s@238400000 {
   513				compatible = "apple,t8112-mca", "apple,mca";
   514				reg = <0x2 0x38400000 0x0 0x18000>,
   515				      <0x2 0x38300000 0x0 0x30000>;
   516	
   517				interrupt-parent = <&aic>;
   518				interrupts = <AIC_IRQ 753 IRQ_TYPE_LEVEL_HIGH>,
   519					     <AIC_IRQ 754 IRQ_TYPE_LEVEL_HIGH>,
   520					     <AIC_IRQ 755 IRQ_TYPE_LEVEL_HIGH>,
   521					     <AIC_IRQ 756 IRQ_TYPE_LEVEL_HIGH>,
   522					     <AIC_IRQ 757 IRQ_TYPE_LEVEL_HIGH>,
   523					     <AIC_IRQ 758 IRQ_TYPE_LEVEL_HIGH>;
   524	
   525				resets = <&ps_audio_p>;
   526				clocks = <&nco 0>, <&nco 1>, <&nco 2>,
   527					 <&nco 3>, <&nco 4>, <&nco 4>;
   528				power-domains = <&ps_audio_p>, <&ps_mca0>, <&ps_mca1>,
   529						<&ps_mca2>, <&ps_mca3>, <&ps_mca4>, <&ps_mca5>;
   530				dmas = <&admac 0>, <&admac 1>, <&admac 2>, <&admac 3>,
   531				       <&admac 4>, <&admac 5>, <&admac 6>, <&admac 7>,
   532				       <&admac 8>, <&admac 9>, <&admac 10>, <&admac 11>,
   533				       <&admac 12>, <&admac 13>, <&admac 14>, <&admac 15>,
   534				       <&admac 16>, <&admac 17>, <&admac 18>, <&admac 19>,
   535				       <&admac 20>, <&admac 21>, <&admac 22>, <&admac 23>;
   536				dma-names = "tx0a", "rx0a", "tx0b", "rx0b",
   537					    "tx1a", "rx1a", "tx1b", "rx1b",
   538					    "tx2a", "rx2a", "tx2b", "rx2b",
   539					    "tx3a", "rx3a", "tx3b", "rx3b",
   540					    "tx4a", "rx4a", "tx4b", "rx4b",
   541					    "tx5a", "rx5a", "tx5b", "rx5b";
   542	
   543				#sound-dai-cells = <1>;
   544			};
   545	
   546			nco: clock-controller@23b044000 {
   547				compatible = "apple,t8112-nco", "apple,nco";
   548				reg = <0x2 0x3b044000 0x0 0x14000>;
   549				clocks = <&nco_clkref>;
   550				#clock-cells = <1>;
   551			};
   552	
   553			aic: interrupt-controller@23b0c0000 {
   554				compatible = "apple,t8112-aic", "apple,aic2";
   555				#interrupt-cells = <3>;
   556				interrupt-controller;
   557				reg = <0x2 0x3b0c0000 0x0 0x8000>,
   558					<0x2 0x3b0c8000 0x0 0x4>;
   559				reg-names = "core", "event";
   560				power-domains = <&ps_aic>;
   561	
   562				affinities {
   563					e-core-pmu-affinity {
   564						apple,fiq-index = <AIC_CPU_PMU_E>;
   565						cpus = <&cpu_e0 &cpu_e1 &cpu_e2 &cpu_e3>;
   566					};
   567	
   568					p-core-pmu-affinity {
   569						apple,fiq-index = <AIC_CPU_PMU_P>;
   570						cpus = <&cpu_p0 &cpu_p1 &cpu_p2 &cpu_p3>;
   571					};
   572				};
   573			};
   574	
   575			pmgr: power-management@23b700000 {
   576				compatible = "apple,t8112-pmgr", "apple,pmgr", "syscon", "simple-mfd";
   577				#address-cells = <1>;
   578				#size-cells = <1>;
   579				reg = <0x2 0x3b700000 0 0x14000>;
   580				/* child nodes are added in t8103-pmgr.dtsi */
   581			};
   582	
   583			pinctrl_ap: pinctrl@23c100000 {
   584				compatible = "apple,t8112-pinctrl", "apple,pinctrl";
   585				reg = <0x2 0x3c100000 0x0 0x100000>;
   586				power-domains = <&ps_gpio>;
   587	
   588				gpio-controller;
   589				#gpio-cells = <2>;
   590				gpio-ranges = <&pinctrl_ap 0 0 213>;
   591				apple,npins = <213>;
   592	
   593				interrupt-controller;
   594				#interrupt-cells = <2>;
   595				interrupt-parent = <&aic>;
   596				interrupts = <AIC_IRQ 199 IRQ_TYPE_LEVEL_HIGH>,
   597					     <AIC_IRQ 200 IRQ_TYPE_LEVEL_HIGH>,
   598					     <AIC_IRQ 201 IRQ_TYPE_LEVEL_HIGH>,
   599					     <AIC_IRQ 202 IRQ_TYPE_LEVEL_HIGH>,
   600					     <AIC_IRQ 203 IRQ_TYPE_LEVEL_HIGH>,
   601					     <AIC_IRQ 204 IRQ_TYPE_LEVEL_HIGH>,
   602					     <AIC_IRQ 205 IRQ_TYPE_LEVEL_HIGH>;
   603	
   604				i2c0_pins: i2c0-pins {
   605					pinmux = <APPLE_PINMUX(111, 1)>,
   606						 <APPLE_PINMUX(110, 1)>;
   607				};
   608	
   609				i2c1_pins: i2c1-pins {
   610					pinmux = <APPLE_PINMUX(113, 1)>,
   611						 <APPLE_PINMUX(112, 1)>;
   612				};
   613	
   614				i2c2_pins: i2c2-pins {
   615					pinmux = <APPLE_PINMUX(87, 1)>,
   616						 <APPLE_PINMUX(86, 1)>;
   617				};
   618	
   619				i2c3_pins: i2c3-pins {
   620					pinmux = <APPLE_PINMUX(54, 1)>,
   621						 <APPLE_PINMUX(53, 1)>;
   622				};
   623	
   624				i2c4_pins: i2c4-pins {
   625					pinmux = <APPLE_PINMUX(131, 1)>,
   626						 <APPLE_PINMUX(130, 1)>;
   627				};
   628	
   629				spi3_pins: spi3-pins {
   630					pinmux = <APPLE_PINMUX(46, 1)>,
   631						<APPLE_PINMUX(47, 1)>,
   632						<APPLE_PINMUX(48, 1)>,
   633						<APPLE_PINMUX(49, 1)>;
   634				};
   635	
   636				pcie_pins: pcie-pins {
   637					pinmux = <APPLE_PINMUX(162, 1)>,
   638						 <APPLE_PINMUX(163, 1)>,
   639						 <APPLE_PINMUX(164, 1)>;
   640					// TODO: 1 more CLKREQs
   641				};
   642			};
   643	
 > 644			nub_spmi: spmi@23d0d9300 {
   645				compatible = "apple,t8112-spmi", "apple,spmi";
   646				reg = <0x2 0x3d714000 0x0 0x100>;
   647				#address-cells = <2>;
   648				#size-cells = <0>;
   649				interrupt-parent = <&aic>;
   650				interrupts = <AIC_IRQ 256 IRQ_TYPE_LEVEL_HIGH>,
   651					<AIC_IRQ 384 IRQ_TYPE_LEVEL_HIGH>;
   652	
   653				pmu1: pmu@e {
   654					compatible = "apple,stowe-pmu", "apple,spmi-pmu";
   655					reg = <0xe SPMI_USID>;
   656					#address-cells = <1>;
   657					#size-cells = <1>;
   658	
   659					rtc_nvmem@f800 {
   660						compatible = "apple,spmi-pmu-nvmem";
   661						reg = <0xf800 0x300>;
   662						#address-cells = <1>;
   663						#size-cells = <1>;
   664	
   665						pm_setting: pm-setting@1 {
   666							reg = <0x1 0x1>;
   667						};
   668	
   669						rtc_offset: rtc-offset@100 {
   670							reg = <0x100 0x6>;
   671						};
   672					};
   673	
   674					legacy_nvmem@f700 {
   675						compatible = "apple,spmi-pmu-nvmem";
   676						reg = <0xf700 0x20>;
   677						#address-cells = <1>;
   678						#size-cells = <1>;
   679	
   680						boot_stage: boot-stage@1 {
   681							reg = <0x1 0x1>;
   682						};
   683	
   684						boot_error_count: boot-error-count@2 {
   685							reg = <0x2 0x1>;
   686							bits = <0 4>;
   687						};
   688	
   689						panic_count: panic-count@2 {
   690							reg = <0x2 0x1>;
   691							bits = <4 4>;
   692						};
   693	
   694						boot_error_stage: boot-error-stage@3 {
   695							reg = <0x3 0x1>;
   696						};
   697	
   698						shutdown_flag: shutdown-flag@f {
   699							reg = <0xf 0x1>;
   700							bits = <3 1>;
   701						};
   702					};
   703	
   704					scrpad_nvmem@8000 {
   705						compatible = "apple,spmi-pmu-nvmem";
   706						reg = <0x8000 0x2800>;
   707						#address-cells = <1>;
   708						#size-cells = <1>;
   709	
   710						fault_shadow: fault-shadow@67b {
   711							reg = <0x67b 0x10>;
   712						};
   713	
   714						socd: socd@b00 {
   715							reg = <0xb00 0x400>;
   716						};
   717					};
   718	
   719				};
   720			};
   721	
   722			pinctrl_nub: pinctrl@23d1f0000 {
   723				compatible = "apple,t8112-pinctrl", "apple,pinctrl";
   724				reg = <0x2 0x3d1f0000 0x0 0x4000>;
   725				power-domains = <&ps_nub_gpio>;
   726	
   727				gpio-controller;
   728				#gpio-cells = <2>;
   729				gpio-ranges = <&pinctrl_nub 0 0 24>;
   730				apple,npins = <24>;
   731	
   732				interrupt-controller;
   733				#interrupt-cells = <2>;
   734				interrupt-parent = <&aic>;
   735				interrupts = <AIC_IRQ 371 IRQ_TYPE_LEVEL_HIGH>,
   736					     <AIC_IRQ 372 IRQ_TYPE_LEVEL_HIGH>,
   737					     <AIC_IRQ 373 IRQ_TYPE_LEVEL_HIGH>,
   738					     <AIC_IRQ 374 IRQ_TYPE_LEVEL_HIGH>,
   739					     <AIC_IRQ 375 IRQ_TYPE_LEVEL_HIGH>,
   740					     <AIC_IRQ 376 IRQ_TYPE_LEVEL_HIGH>,
   741					     <AIC_IRQ 377 IRQ_TYPE_LEVEL_HIGH>;
   742			};
   743	
   744			pmgr_mini: power-management@23d280000 {
   745				compatible = "apple,t8112-pmgr", "apple,pmgr", "syscon", "simple-mfd";
   746				#address-cells = <1>;
   747				#size-cells = <1>;
   748				reg = <0x2 0x3d280000 0 0x4000>;
   749				/* child nodes are added in t8103-pmgr.dtsi */
   750			};
   751	
   752			wdt: watchdog@23d2b0000 {
   753				compatible = "apple,t8112-wdt", "apple,wdt";
   754				reg = <0x2 0x3d2b0000 0x0 0x4000>;
   755				clocks = <&clkref>;
   756				interrupt-parent = <&aic>;
   757				interrupts = <AIC_IRQ 379 IRQ_TYPE_LEVEL_HIGH>;
   758			};
   759	
   760			pinctrl_smc: pinctrl@23e820000 {
   761				compatible = "apple,t8112-pinctrl", "apple,pinctrl";
   762				reg = <0x2 0x3e820000 0x0 0x4000>;
   763	
   764				gpio-controller;
   765				#gpio-cells = <2>;
   766				gpio-ranges = <&pinctrl_smc 0 0 18>;
   767				apple,npins = <18>;
   768	
   769				interrupt-controller;
   770				#interrupt-cells = <2>;
   771				interrupt-parent = <&aic>;
   772				interrupts = <AIC_IRQ 490 IRQ_TYPE_LEVEL_HIGH>,
   773					     <AIC_IRQ 491 IRQ_TYPE_LEVEL_HIGH>,
   774					     <AIC_IRQ 492 IRQ_TYPE_LEVEL_HIGH>,
   775					     <AIC_IRQ 493 IRQ_TYPE_LEVEL_HIGH>,
   776					     <AIC_IRQ 494 IRQ_TYPE_LEVEL_HIGH>,
   777					     <AIC_IRQ 495 IRQ_TYPE_LEVEL_HIGH>,
   778					     <AIC_IRQ 496 IRQ_TYPE_LEVEL_HIGH>;
   779			};
   780	
   781			pinctrl_aop: pinctrl@24a820000 {
   782				compatible = "apple,t8112-pinctrl", "apple,pinctrl";
   783				reg = <0x2 0x4a820000 0x0 0x4000>;
   784	
   785				gpio-controller;
   786				#gpio-cells = <2>;
   787				gpio-ranges = <&pinctrl_aop 0 0 54>;
   788				apple,npins = <54>;
   789	
   790				interrupt-controller;
   791				#interrupt-cells = <2>;
   792				interrupt-parent = <&aic>;
   793				interrupts = <AIC_IRQ 301 IRQ_TYPE_LEVEL_HIGH>,
   794					     <AIC_IRQ 302 IRQ_TYPE_LEVEL_HIGH>,
   795					     <AIC_IRQ 303 IRQ_TYPE_LEVEL_HIGH>,
   796					     <AIC_IRQ 304 IRQ_TYPE_LEVEL_HIGH>,
   797					     <AIC_IRQ 305 IRQ_TYPE_LEVEL_HIGH>,
   798					     <AIC_IRQ 306 IRQ_TYPE_LEVEL_HIGH>,
   799					     <AIC_IRQ 307 IRQ_TYPE_LEVEL_HIGH>;
   800			};
   801	
   802			ans_mbox: mbox@277408000 {
   803				compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
   804				reg = <0x2 0x77408000 0x0 0x4000>;
   805				interrupt-parent = <&aic>;
   806				interrupts = <AIC_IRQ 717 IRQ_TYPE_LEVEL_HIGH>,
   807					<AIC_IRQ 718 IRQ_TYPE_LEVEL_HIGH>,
   808					<AIC_IRQ 719 IRQ_TYPE_LEVEL_HIGH>,
   809					<AIC_IRQ 720 IRQ_TYPE_LEVEL_HIGH>;
   810				interrupt-names = "send-empty", "send-not-empty",
   811					"recv-empty", "recv-not-empty";
   812				#mbox-cells = <0>;
   813				power-domains = <&ps_ans>;
   814			};
   815	
   816			sart: sart@27bc50000 {
   817				compatible = "apple,t8112-sart", "apple,t6000-sart";
   818				reg = <0x2 0x7bc50000 0x0 0x10000>;
   819				power-domains = <&ps_ans>;
   820			};
   821	
   822			nvme@27bcc0000 {
   823				compatible = "apple,t8112-nvme-ans2", "apple,nvme-ans2";
   824				reg = <0x2 0x7bcc0000 0x0 0x40000>,
   825					<0x2 0x77400000 0x0 0x4000>;
   826				reg-names = "nvme", "ans";
   827				interrupt-parent = <&aic>;
   828				interrupts = <AIC_IRQ 724 IRQ_TYPE_LEVEL_HIGH>;
   829				mboxes = <&ans_mbox>;
   830				apple,sart = <&sart>;
   831				power-domains = <&ps_ans>, <&ps_apcie_st>;
   832				power-domain-names = "ans", "apcie0";
   833				resets = <&ps_ans>;
   834			};
   835	
   836			pcie0_dart: iommu@681008000 {
   837				compatible = "apple,t8110-dart";
   838				reg = <0x6 0x81008000 0x0 0x4000>;
   839				#iommu-cells = <1>;
   840				interrupt-parent = <&aic>;
   841				interrupts = <AIC_IRQ 782 IRQ_TYPE_LEVEL_HIGH>;
   842				power-domains = <&ps_apcie_gp>;
   843			};
   844	
   845			pcie1_dart: iommu@682008000 {
   846				compatible = "apple,t8110-dart";
   847				reg = <0x6 0x82008000 0x0 0x4000>;
   848				#iommu-cells = <1>;
   849				interrupt-parent = <&aic>;
   850				interrupts = <AIC_IRQ 785 IRQ_TYPE_LEVEL_HIGH>;
   851				power-domains = <&ps_apcie_gp>;
   852				status = "disabled";
   853			};
   854	
   855			pcie2_dart: iommu@683008000 {
   856				compatible = "apple,t8110-dart";
   857				reg = <0x6 0x83008000 0x0 0x4000>;
   858				#iommu-cells = <1>;
   859				interrupt-parent = <&aic>;
   860				interrupts = <AIC_IRQ 788 IRQ_TYPE_LEVEL_HIGH>;
   861				power-domains = <&ps_apcie_gp>;
   862				status = "disabled";
   863			};
   864	
   865			pcie3_dart: iommu@684008000 {
   866				compatible = "apple,t8110-dart";
   867				reg = <0x6 0x84008000 0x0 0x4000>;
   868				#iommu-cells = <1>;
   869				interrupt-parent = <&aic>;
   870				interrupts = <AIC_IRQ 791 IRQ_TYPE_LEVEL_HIGH>;
   871				power-domains = <&ps_apcie_gp>;
   872				status = "disabled";
   873			};
   874	
   875			pcie0: pcie@690000000 {
   876				compatible = "apple,t8112-pcie", "apple,pcie";
   877				device_type = "pci";
   878	
   879				reg = <0x6 0x90000000 0x0 0x1000000>,
   880				      <0x6 0x80000000 0x0 0x100000>,
   881				      <0x6 0x81000000 0x0 0x4000>,
   882				      <0x6 0x82000000 0x0 0x4000>,
   883				      <0x6 0x83000000 0x0 0x4000>,
   884				      <0x6 0x84000000 0x0 0x4000>;
   885				reg-names = "config", "rc", "port0", "port1", "port2", "port3";
   886	
   887				interrupt-parent = <&aic>;
   888				interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>,
   889					     <AIC_IRQ 784 IRQ_TYPE_LEVEL_HIGH>,
   890					     <AIC_IRQ 787 IRQ_TYPE_LEVEL_HIGH>,
   891					     <AIC_IRQ 790 IRQ_TYPE_LEVEL_HIGH>;
   892	
   893				msi-controller;
   894				msi-parent = <&pcie0>;
   895				msi-ranges = <&aic AIC_IRQ 793 IRQ_TYPE_EDGE_RISING 32>;
   896	
   897				iommu-map = <0x100 &pcie0_dart 0 1>,
   898					    <0x200 &pcie1_dart 1 1>,
   899					    <0x300 &pcie2_dart 2 1>,
   900					    <0x400 &pcie3_dart 3 1>;
   901				iommu-map-mask = <0xff00>;
   902	
   903				bus-range = <0 4>;
   904				#address-cells = <3>;
   905				#size-cells = <2>;
   906				ranges = <0x43000000 0x6 0xa0000000 0x6 0xa0000000 0x0 0x20000000>,
   907					 <0x02000000 0x0 0xc0000000 0x6 0xc0000000 0x0 0x40000000>;
   908	
   909				power-domains = <&ps_apcie_gp>;
   910				pinctrl-0 = <&pcie_pins>;
   911				pinctrl-names = "default";
   912	
   913				port00: pci@0,0 {
   914					device_type = "pci";
   915					reg = <0x0 0x0 0x0 0x0 0x0>;
   916					reset-gpios = <&pinctrl_ap 166 GPIO_ACTIVE_LOW>;
   917	
   918					#address-cells = <3>;
   919					#size-cells = <2>;
   920					ranges;
   921	
   922					interrupt-controller;
   923					#interrupt-cells = <1>;
   924	
   925					interrupt-map-mask = <0 0 0 7>;
   926					interrupt-map = <0 0 0 1 &port00 0 0 0 0>,
   927							<0 0 0 2 &port00 0 0 0 1>,
   928							<0 0 0 3 &port00 0 0 0 2>,
   929							<0 0 0 4 &port00 0 0 0 3>;
   930				};
   931	
   932				port01: pci@1,0 {
   933					device_type = "pci";
   934					reg = <0x800 0x0 0x0 0x0 0x0>;
   935					reset-gpios = <&pinctrl_ap 167 GPIO_ACTIVE_LOW>;
   936	
   937					#address-cells = <3>;
   938					#size-cells = <2>;
   939					ranges;
   940	
   941					interrupt-controller;
   942					#interrupt-cells = <1>;
   943	
   944					interrupt-map-mask = <0 0 0 7>;
   945					interrupt-map = <0 0 0 1 &port01 0 0 0 0>,
   946							<0 0 0 2 &port01 0 0 0 1>,
   947							<0 0 0 3 &port01 0 0 0 2>,
   948							<0 0 0 4 &port01 0 0 0 3>;
   949	
   950					status = "disabled";
   951				};
   952	
   953				port02: pci@2,0 {
   954					device_type = "pci";
   955					reg = <0x1000 0x0 0x0 0x0 0x0>;
   956					reset-gpios = <&pinctrl_ap 168 GPIO_ACTIVE_LOW>;
   957	
   958					#address-cells = <3>;
   959					#size-cells = <2>;
   960					ranges;
   961	
   962					interrupt-controller;
   963					#interrupt-cells = <1>;
   964	
   965					interrupt-map-mask = <0 0 0 7>;
   966					interrupt-map = <0 0 0 1 &port02 0 0 0 0>,
   967							<0 0 0 2 &port02 0 0 0 1>,
   968							<0 0 0 3 &port02 0 0 0 2>,
   969							<0 0 0 4 &port02 0 0 0 3>;
   970	
   971					status = "disabled";
   972				};
   973	
   974				/* TODO: GPIO unknown */
   975				port03: pci@3,0 {
   976					device_type = "pci";
   977					reg = <0x1800 0x0 0x0 0x0 0x0>;
   978					//reset-gpios = <&pinctrl_ap 33 GPIO_ACTIVE_LOW>;
   979	
   980					#address-cells = <3>;
   981					#size-cells = <2>;
   982					ranges;
   983	
   984					interrupt-controller;
   985					#interrupt-cells = <1>;
   986	
   987					interrupt-map-mask = <0 0 0 7>;
   988					interrupt-map = <0 0 0 1 &port03 0 0 0 0>,
   989							<0 0 0 2 &port03 0 0 0 1>,
   990							<0 0 0 3 &port03 0 0 0 2>,
   991							<0 0 0 4 &port03 0 0 0 3>;
   992	
   993					status = "disabled";
   994				};
   995			};
   996		};
   997	};
   998	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
