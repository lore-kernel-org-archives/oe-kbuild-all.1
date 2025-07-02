Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C79423ABB9
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 08:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751445846; cv=none; b=Jug71LvCht5jDCvxkrwvBtkU1jWRnK4t1wyCEbYbHFofQ5bCqcH1zDgWiIIU3bMz4ui2BQ/9OY0X9PdqPxpWI4fwprS6D493jEacudgrZgfuXqfAi16OxIwB6QYNrihoiTH9gHo6wKfK74y0tFIK+aKZOeC+KkbKh4JnKrF0hWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751445846; c=relaxed/simple;
	bh=lqZduYlgzzc76eqaJDohdtz1My7H00iKDiI2lKI/Mu8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ceLkwvKPDgb7TGuQgr416SRnhT711iF+GQ6n/vKK4KkTEFKw0Bx7PAQRKt+JtOli7KQI09y/NXKSGf9u4LFnWajfW4IxRHyyXgVo7KJ2F4JeD9deD48btrnlfzOc2drcKNi90AlctObIGN/mb1R38aSIzjoQd4r0jpBEI9dBNtM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLuMxy3f; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLuMxy3f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751445843; x=1782981843;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lqZduYlgzzc76eqaJDohdtz1My7H00iKDiI2lKI/Mu8=;
  b=WLuMxy3f/ZFgBTJrKrEw4TsUAL1HkHmZ52C5G4zOlvL7p/dJ8JS+CHl5
   d43cvRaJHgpP2HVkxklgV7184QfVaH5EE5BcReZ99qgQbLNBFZ/7qEkW+
   fAucqnsSD+qeiwNxow3vCMlP1Yjb1n6PLYg4AtkIBSRHihWeVjBUIz9Ib
   kOK0MrHE0hX7SU502aeE5HZbYqr28U/SKzKJbOaVZNJh5iYk+XeT2CrsH
   93W12KbPFXlKqGX4SI3Cf+D0fA04oHjl4mgo6/l/uuHXRe2HrDAoLRriG
   0qnfxrvh2qeBkfc4G8n6slnGdVEjlJF5lgtPdvH8lodXy+A+hWsb8JAAn
   g==;
X-CSE-ConnectionGUID: SZfqv4QZR7GjOCeUCvYMTA==
X-CSE-MsgGUID: oQX0iU/rTwas6+/ImcLSqw==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="71159367"
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="71159367"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jul 2025 01:44:02 -0700
X-CSE-ConnectionGUID: ml1ngKsUTUKNzWvXl/JCwg==
X-CSE-MsgGUID: 5gr08IXxSTOLEMyWVfpJIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,281,1744095600"; 
   d="scan'208";a="185050938"
Received: from igk-lkp-server01.igk.intel.com (HELO 030a839a1121) ([10.91.175.65])
  by orviesa002.jf.intel.com with ESMTP; 02 Jul 2025 01:43:59 -0700
Received: from kbuild by 030a839a1121 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWt4P-0000FJ-10;
	Wed, 02 Jul 2025 08:43:57 +0000
Date: Wed, 2 Jul 2025 10:43:33 +0200
From: kernel test robot <lkp@intel.com>
To: Kevin Widjaja <kevin.widjaja21@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Bjorn Andersson <andersson@kernel.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Luca Weiss <luca@lucaweiss.eu>
Subject: [linux-next:master 1610/6384]
 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:553.28-565.5: Warning
 (avoid_unnecessary_addr_size): /soc/i2c@f9924000: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202507021059.cIueyBzg-lkp@intel.com>
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
head:   3f804361f3b9af33e00b90ec9cb5afcc96831e60
commit: 3d8663cb9e21912ad9554701bfb3a8254cf0a4ef [1610/6384] ARM: dts: qcom: Add initial support for Sony Xperia Z Ultra (togari)
config: arm-randconfig-2051-20250630 (https://download.01.org/0day-ci/archive/20250702/202507021059.cIueyBzg-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
dtschema version: 2025.6.1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507021059.cIueyBzg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507021059.cIueyBzg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:553.28-565.5: Warning (avoid_unnecessary_addr_size): /soc/i2c@f9924000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/pm8941.dtsi:199.19-207.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pm8941@1/pwm: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1956.28-2009.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922800: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:2029.28-2082.6: Warning (avoid_unnecessary_addr_size): /soc/display-subsystem@fd900000/dsi@fd922e00: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1253.26-1256.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1@d2: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1@d2)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1268.26-1271.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1@d4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1@d4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1288.26-1291.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1@d7: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode@d7)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1298.26-1301.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s9-p1@d8: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s10-p1@d8)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1323.26-1326.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s2-p2@dc: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s3-p2@dc)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1348.26-1351.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s7-p2@e0: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s8-p2@e0)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1368.40-1371.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s5-p2-backup@e3: duplicate unit-address (also used in node /soc/efuse@fc4bc000/mode-backup@e3)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1378.40-1381.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s6-p2-backup@e4: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s7-p2-backup@e4)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1413.41-1416.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p1-backup@442: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p1-backup@442)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1428.41-1431.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s4-p1-backup@444: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s5-p1-backup@444)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1453.41-1456.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s8-p1-backup@448: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s9-p1-backup@448)
   arch/arm/boot/dts/qcom/qcom-msm8974.dtsi:1478.41-1481.6: Warning (unique_unit_address_if_enabled): /soc/efuse@fc4bc000/s1-p2-backup@44c: duplicate unit-address (also used in node /soc/efuse@fc4bc000/s2-p2-backup@44c)
>> arch/arm/boot/dts/qcom/qcom-msm8974-sony-xperia-rhine-togari.dtb: l2-cache (cache): Unevaluated properties are not allowed ('qcom,saw' was unexpected)
   	from schema $id: http://devicetree.org/schemas/cache.yaml#

vim +553 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi

3933d267835c8b arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2014-01-16   12  
2aec37c659500b arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-12-20   13  / {
abe60a3a7afb40 arch/arm/boot/dts/qcom-msm8974.dtsi      Rob Herring                  2019-01-09   14  	#address-cells = <1>;
abe60a3a7afb40 arch/arm/boot/dts/qcom-msm8974.dtsi      Rob Herring                  2019-01-09   15  	#size-cells = <1>;
2aec37c659500b arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-12-20   16  	interrupt-parent = <&intc>;
2aec37c659500b arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-12-20   17  
7018981366d496 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-03-18   18  	chosen { };
7018981366d496 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-03-18   19  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   20  	clocks {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   21  		xo_board: xo_board {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   22  			compatible = "fixed-clock";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   23  			#clock-cells = <0>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   24  			clock-frequency = <19200000>;
973111981b2de9 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   25  		};
973111981b2de9 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28   26  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   27  		sleep_clk: sleep_clk {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   28  			compatible = "fixed-clock";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   29  			#clock-cells = <0>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15   30  			clock-frequency = <32768>;
ca3971cf77f0bc arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27   31  		};
6297c4b242f5b1 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-06-26   32  	};
6297c4b242f5b1 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-06-26   33  
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   34  	cpus {
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   35  		#address-cells = <1>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   36  		#size-cells = <0>;
81924ec7a0d50f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2023-12-05   37  		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   38  
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   39  		cpu0: cpu@0 {
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28   40  			compatible = "qcom,krait";
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28   41  			enable-method = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   42  			device_type = "cpu";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   43  			reg = <0>;
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   44  			next-level-cache = <&l2>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   45  			qcom,acc = <&acc0>;
8c76a6382eb0c4 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   46  			qcom,saw = <&saw0>;
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   47  			cpu-idle-states = <&cpu_spc>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   48  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   49  
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   50  		cpu1: cpu@1 {
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28   51  			compatible = "qcom,krait";
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28   52  			enable-method = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   53  			device_type = "cpu";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   54  			reg = <1>;
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   55  			next-level-cache = <&l2>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   56  			qcom,acc = <&acc1>;
8c76a6382eb0c4 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   57  			qcom,saw = <&saw1>;
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   58  			cpu-idle-states = <&cpu_spc>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   59  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   60  
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   61  		cpu2: cpu@2 {
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28   62  			compatible = "qcom,krait";
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28   63  			enable-method = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   64  			device_type = "cpu";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   65  			reg = <2>;
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   66  			next-level-cache = <&l2>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   67  			qcom,acc = <&acc2>;
8c76a6382eb0c4 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   68  			qcom,saw = <&saw2>;
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   69  			cpu-idle-states = <&cpu_spc>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   70  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   71  
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   72  		cpu3: cpu@3 {
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28   73  			compatible = "qcom,krait";
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28   74  			enable-method = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   75  			device_type = "cpu";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   76  			reg = <3>;
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   77  			next-level-cache = <&l2>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   78  			qcom,acc = <&acc3>;
8c76a6382eb0c4 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   79  			qcom,saw = <&saw3>;
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   80  			cpu-idle-states = <&cpu_spc>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   81  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   82  
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   83  		l2: l2-cache {
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   84  			compatible = "cache";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   85  			cache-level = <2>;
925a80af6106a5 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2023-04-16   86  			cache-unified;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   87  			qcom,saw = <&saw_l2>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   88  		};
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   89  
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   90  		idle-states {
7b49c9cf4b77a6 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2024-10-22   91  			cpu_spc: cpu-spc {
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   92  				compatible = "qcom,idle-state-spc",
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   93  						"arm,idle-state";
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   94  				entry-latency-us = <150>;
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   95  				exit-latency-us = <200>;
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   96  				min-residency-us = <2000>;
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   97  			};
d596d620d82f64 arch/arm/boot/dts/qcom-msm8974.dtsi      Lina Iyer                    2015-03-25   98  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01   99  	};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  100  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  101  	firmware {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  102  		scm {
363c1b04cfce56 arch/arm/boot/dts/qcom-msm8974.dtsi      David Heidelberg             2022-06-26  103  			compatible = "qcom,scm-msm8974", "qcom,scm";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  104  			clocks = <&gcc GCC_CE1_CLK>, <&gcc GCC_CE1_AXI_CLK>, <&gcc GCC_CE1_AHB_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  105  			clock-names = "core", "bus", "iface";
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  106  		};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  107  	};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  108  
cad23ffd46e220 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-03-18  109  	memory@0 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  110  		device_type = "memory";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  111  		reg = <0x0 0x0>;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  112  	};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  113  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  114  	pmu {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  115  		compatible = "qcom,krait-pmu";
81924ec7a0d50f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2023-12-05  116  		interrupts = <GIC_PPI 7 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  117  	};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  118  
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  119  	rpm: remoteproc {
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  120  		compatible = "qcom,msm8974-rpm-proc", "qcom,rpm-proc";
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  121  
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  122  		master-stats {
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  123  			compatible = "qcom,rpm-master-stats";
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  124  			qcom,rpm-msg-ram = <&apss_master_stats>,
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  125  					   <&mpss_master_stats>,
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  126  					   <&lpss_master_stats>,
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  127  					   <&pronto_master_stats>;
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  128  			qcom,master-names = "APSS",
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  129  					    "MPSS",
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  130  					    "LPSS",
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  131  					    "PRONTO";
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  132  		};
02c58ac774a03f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-09-22  133  
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  134  		smd-edge {
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  135  			interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
d904c09b73fe9b arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-24  136  			mboxes = <&apcs 0>;
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  137  			qcom,smd-edge = <15>;
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  138  
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  139  			rpm_requests: rpm-requests {
a11a87a9a66e5e arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-07-29  140  				compatible = "qcom,rpm-msm8974", "qcom,smd-rpm";
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  141  				qcom,smd-channels = "rpm_requests";
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  142  
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  143  				rpmcc: clock-controller {
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  144  					compatible = "qcom,rpmcc-msm8974", "qcom,rpmcc";
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  145  					#clock-cells = <1>;
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  146  					clocks = <&xo_board>;
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  147  					clock-names = "xo";
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  148  				};
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  149  			};
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  150  		};
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  151  	};
b471a1bc797429 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Stephan Gerhold              2023-06-15  152  
56080a49773935 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Bingwu Zhang                 2024-07-15  153  	reserved_memory: reserved-memory {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  154  		#address-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  155  		#size-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  156  		ranges;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  157  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  158  		mpss_region: mpss@8000000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  159  			reg = <0x08000000 0x5100000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  160  			no-map;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  161  		};
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  162  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  163  		mba_region: mba@d100000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  164  			reg = <0x0d100000 0x100000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  165  			no-map;
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  166  		};
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  167  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  168  		wcnss_region: wcnss@d200000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  169  			reg = <0x0d200000 0xa00000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  170  			no-map;
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  171  		};
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  172  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  173  		adsp_region: adsp@dc00000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  174  			reg = <0x0dc00000 0x1900000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  175  			no-map;
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  176  		};
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  177  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  178  		venus_region: memory@f500000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  179  			reg = <0x0f500000 0x500000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  180  			no-map;
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  181  		};
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  182  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  183  		smem_region: smem@fa00000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  184  			reg = <0xfa00000 0x200000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  185  			no-map;
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  186  		};
140647f84dd8d8 arch/arm/boot/dts/qcom-msm8974.dtsi      Amit Kucheria                2019-10-21  187  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  188  		tz_region: memory@fc00000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  189  			reg = <0x0fc00000 0x160000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  190  			no-map;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  191  		};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  192  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  193  		rfsa_mem: memory@fd60000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  194  			reg = <0x0fd60000 0x20000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  195  			no-map;
3bff54740369d1 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2014-02-21  196  		};
3bff54740369d1 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2014-02-21  197  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  198  		rmtfs@fd80000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  199  			compatible = "qcom,rmtfs-mem";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  200  			reg = <0x0fd80000 0x180000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  201  			no-map;
30fc4212d54175 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2016-01-06  202  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  203  			qcom,client-id = <1>;
30fc4212d54175 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2016-01-06  204  		};
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28  205  	};
ba08220aa81e75 arch/arm/boot/dts/qcom-msm8974.dtsi      Kumar Gala                   2014-05-28  206  
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08  207  	smem {
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08  208  		compatible = "qcom,smem";
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08  209  
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08  210  		memory-region = <&smem_region>;
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08  211  		qcom,rpm-msg-ram = <&rpm_msg_ram>;
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08  212  
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08  213  		hwlocks = <&tcsr_mutex 3>;
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08  214  	};
d0bfd7c9b16261 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2015-10-08  215  
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  216  	smp2p-adsp {
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  217  		compatible = "qcom,smp2p";
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  218  		qcom,smem = <443>, <429>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  219  
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  220  		interrupt-parent = <&intc>;
12d2de2e50e0da arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  221  		interrupts = <GIC_SPI 158 IRQ_TYPE_EDGE_RISING>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  222  
d904c09b73fe9b arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-24  223  		mboxes = <&apcs 10>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  224  
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  225  		qcom,local-pid = <0>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  226  		qcom,remote-pid = <2>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  227  
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  228  		adsp_smp2p_out: master-kernel {
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  229  			qcom,entry-name = "master-kernel";
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  230  			#qcom,smem-state-cells = <1>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  231  		};
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  232  
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  233  		adsp_smp2p_in: slave-kernel {
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  234  			qcom,entry-name = "slave-kernel";
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  235  
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  236  			interrupt-controller;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  237  			#interrupt-cells = <2>;
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  238  		};
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  239  	};
3028cbab945ae0 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-08-22  240  
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  241  	smp2p-modem {
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  242  		compatible = "qcom,smp2p";
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  243  		qcom,smem = <435>, <428>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  244  
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  245  		interrupt-parent = <&intc>;
12d2de2e50e0da arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  246  		interrupts = <GIC_SPI 27 IRQ_TYPE_EDGE_RISING>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  247  
d904c09b73fe9b arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-24  248  		mboxes = <&apcs 14>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  249  
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  250  		qcom,local-pid = <0>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  251  		qcom,remote-pid = <1>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  252  
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  253  		modem_smp2p_out: master-kernel {
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  254  			qcom,entry-name = "master-kernel";
30f1e2dde68d22 arch/arm/boot/dts/qcom-msm8974.dtsi      Andy Gross                   2016-06-12  255  			#qcom,smem-state-cells = <1>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  256  		};
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  257  
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  258  		modem_smp2p_in: slave-kernel {
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  259  			qcom,entry-name = "slave-kernel";
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  260  
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  261  			interrupt-controller;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  262  			#interrupt-cells = <2>;
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  263  		};
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  264  	};
5d3178c82739ae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2016-03-28  265  
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  266  	smp2p-wcnss {
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  267  		compatible = "qcom,smp2p";
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  268  		qcom,smem = <451>, <431>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  269  
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  270  		interrupt-parent = <&intc>;
12d2de2e50e0da arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  271  		interrupts = <GIC_SPI 143 IRQ_TYPE_EDGE_RISING>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  272  
d904c09b73fe9b arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-24  273  		mboxes = <&apcs 18>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  274  
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  275  		qcom,local-pid = <0>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  276  		qcom,remote-pid = <4>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  277  
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  278  		wcnss_smp2p_out: master-kernel {
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  279  			qcom,entry-name = "master-kernel";
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  280  
30f1e2dde68d22 arch/arm/boot/dts/qcom-msm8974.dtsi      Andy Gross                   2016-06-12  281  			#qcom,smem-state-cells = <1>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  282  		};
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  283  
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  284  		wcnss_smp2p_in: slave-kernel {
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  285  			qcom,entry-name = "slave-kernel";
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  286  
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  287  			interrupt-controller;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  288  			#interrupt-cells = <2>;
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  289  		};
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  290  	};
7ccb11e7b770de arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  291  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  292  	smsm {
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  293  		compatible = "qcom,smsm";
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  294  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  295  		#address-cells = <1>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  296  		#size-cells = <0>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  297  
368a5aed131271 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-06-19  298  		mboxes = <0>, <&apcs 13>, <&apcs 9>, <&apcs 19>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  299  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  300  		apps_smsm: apps@0 {
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  301  			reg = <0>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  302  
30f1e2dde68d22 arch/arm/boot/dts/qcom-msm8974.dtsi      Andy Gross                   2016-06-12  303  			#qcom,smem-state-cells = <1>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  304  		};
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  305  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  306  		modem_smsm: modem@1 {
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  307  			reg = <1>;
12d2de2e50e0da arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  308  			interrupts = <GIC_SPI 26 IRQ_TYPE_EDGE_RISING>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  309  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  310  			interrupt-controller;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  311  			#interrupt-cells = <2>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  312  		};
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  313  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  314  		adsp_smsm: adsp@2 {
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  315  			reg = <2>;
12d2de2e50e0da arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  316  			interrupts = <GIC_SPI 157 IRQ_TYPE_EDGE_RISING>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  317  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  318  			interrupt-controller;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  319  			#interrupt-cells = <2>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  320  		};
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  321  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  322  		wcnss_smsm: wcnss@7 {
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  323  			reg = <7>;
12d2de2e50e0da arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  324  			interrupts = <GIC_SPI 144 IRQ_TYPE_EDGE_RISING>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  325  
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  326  			interrupt-controller;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  327  			#interrupt-cells = <2>;
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  328  		};
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  329  	};
9af88b2deda865 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2015-12-27  330  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  331  	soc: soc {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  332  		#address-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  333  		#size-cells = <1>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  334  		ranges;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  335  		compatible = "simple-bus";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  336  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  337  		intc: interrupt-controller@f9000000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  338  			compatible = "qcom,msm-qgic2";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  339  			interrupt-controller;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  340  			#interrupt-cells = <3>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  341  			reg = <0xf9000000 0x1000>,
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  342  			      <0xf9002000 0x1000>;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  343  		};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  344  
c133cfc12cd717 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-08  345  		apcs: mailbox@f9011000 {
c133cfc12cd717 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-08  346  			compatible = "qcom,msm8974-apcs-kpss-global",
c133cfc12cd717 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-08  347  				     "qcom,msm8994-apcs-kpss-global", "syscon";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  348  			reg = <0xf9011000 0x1000>;
c133cfc12cd717 arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2024-04-08  349  			#mbox-cells = <1>;
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  350  		};
c59ffb51935753 arch/arm/boot/dts/qcom-msm8974.dtsi      Rajendra Nayak               2016-08-17  351  
e624dc495a425d arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-01-02  352  		saw_l2: power-manager@f9012000 {
c0fe5442b1e5bc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-01-02  353  			compatible = "qcom,msm8974-saw2-v2.1-l2", "qcom,saw2";
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  354  			reg = <0xf9012000 0x1000>;
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  355  		};
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  356  
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11  357  		watchdog@f9017000 {
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11  358  			compatible = "qcom,apss-wdt-msm8974", "qcom,kpss-wdt";
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11  359  			reg = <0xf9017000 0x1000>;
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11  360  			interrupts = <GIC_SPI 3 IRQ_TYPE_EDGE_RISING>,
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11  361  				     <GIC_SPI 4 IRQ_TYPE_EDGE_RISING>;
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11  362  			clocks = <&sleep_clk>;
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11  363  		};
95053f6bc8ffca arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Matti Lehtimäki              2023-10-11  364  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  365  		timer@f9020000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  366  			#address-cells = <1>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  367  			#size-cells = <1>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  368  			ranges;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  369  			compatible = "arm,armv7-timer-mem";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  370  			reg = <0xf9020000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  371  			clock-frequency = <19200000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  372  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  373  			frame@f9021000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  374  				frame-number = <0>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  375  				interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>,
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  376  					     <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  377  				reg = <0xf9021000 0x1000>,
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  378  				      <0xf9022000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  379  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  380  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  381  			frame@f9023000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  382  				frame-number = <1>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  383  				interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  384  				reg = <0xf9023000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  385  				status = "disabled";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  386  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  387  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  388  			frame@f9024000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  389  				frame-number = <2>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  390  				interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  391  				reg = <0xf9024000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  392  				status = "disabled";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  393  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  394  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  395  			frame@f9025000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  396  				frame-number = <3>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  397  				interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  398  				reg = <0xf9025000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  399  				status = "disabled";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  400  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  401  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  402  			frame@f9026000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  403  				frame-number = <4>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  404  				interrupts = <GIC_SPI 12 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  405  				reg = <0xf9026000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  406  				status = "disabled";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  407  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  408  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  409  			frame@f9027000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  410  				frame-number = <5>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  411  				interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  412  				reg = <0xf9027000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  413  				status = "disabled";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  414  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  415  
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  416  			frame@f9028000 {
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  417  				frame-number = <6>;
1e19d44e8e60e4 arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  418  				interrupts = <GIC_SPI 14 IRQ_TYPE_LEVEL_HIGH>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  419  				reg = <0xf9028000 0x1000>;
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  420  				status = "disabled";
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  421  			};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  422  		};
47c5a5d6fd5839 arch/arm/boot/dts/qcom-msm8974.dtsi      Stephen Boyd                 2013-12-20  423  
158ce4b3e1dfcf arch/arm/boot/dts/qcom-msm8974.dtsi      Christian Marangi            2023-01-16  424  		acc0: power-manager@f9088000 {
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  425  			compatible = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  426  			reg = <0xf9088000 0x1000>, <0xf9008000 0x1000>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  427  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  428  
e624dc495a425d arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-01-02  429  		saw0: power-manager@f9089000 {
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  430  			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  431  			reg = <0xf9089000 0x1000>, <0xf9009000 0x1000>;
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  432  		};
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  433  
158ce4b3e1dfcf arch/arm/boot/dts/qcom-msm8974.dtsi      Christian Marangi            2023-01-16  434  		acc1: power-manager@f9098000 {
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  435  			compatible = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  436  			reg = <0xf9098000 0x1000>, <0xf9008000 0x1000>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  437  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  438  
e624dc495a425d arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-01-02  439  		saw1: power-manager@f9099000 {
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  440  			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  441  			reg = <0xf9099000 0x1000>, <0xf9009000 0x1000>;
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  442  		};
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  443  
158ce4b3e1dfcf arch/arm/boot/dts/qcom-msm8974.dtsi      Christian Marangi            2023-01-16  444  		acc2: power-manager@f90a8000 {
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  445  			compatible = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  446  			reg = <0xf90a8000 0x1000>, <0xf9008000 0x1000>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  447  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  448  
e624dc495a425d arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-01-02  449  		saw2: power-manager@f90a9000 {
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  450  			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  451  			reg = <0xf90a9000 0x1000>, <0xf9009000 0x1000>;
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  452  		};
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  453  
158ce4b3e1dfcf arch/arm/boot/dts/qcom-msm8974.dtsi      Christian Marangi            2023-01-16  454  		acc3: power-manager@f90b8000 {
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  455  			compatible = "qcom,kpss-acc-v2";
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  456  			reg = <0xf90b8000 0x1000>, <0xf9008000 0x1000>;
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  457  		};
2ab27991c0f098 arch/arm/boot/dts/qcom-msm8974.dtsi      Rohit Vaswani                2013-11-01  458  
e624dc495a425d arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Dmitry Baryshkov             2024-01-02  459  		saw3: power-manager@f90b9000 {
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  460  			compatible = "qcom,msm8974-saw2-v2.1-cpu", "qcom,saw2";
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  461  			reg = <0xf90b9000 0x1000>, <0xf9009000 0x1000>;
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  462  		};
4960e06d386ecc arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Luca Weiss                   2023-06-27  463  
2477d81901a23a arch/arm/boot/dts/qcom-msm8974.dtsi      Bhupesh Sharma               2022-05-15  464  		sdhc_1: mmc@f9824900 {
28d13d317bacd7 arch/arm/boot/dts/qcom-msm8974.dtsi      Douglas Anderson             2018-11-05  465  			compatible = "qcom,msm8974-sdhci", "qcom,sdhci-msm-v4";
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31  466  			reg = <0xf9824900 0x11c>, <0xf9824000 0x800>;
5eb82ddb7273bd arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  467  			reg-names = "hc", "core";
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  468  			interrupts = <GIC_SPI 123 IRQ_TYPE_LEVEL_HIGH>,
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  469  				     <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31  470  			interrupt-names = "hc_irq", "pwr_irq";
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  471  			clocks = <&gcc GCC_SDCC1_AHB_CLK>,
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  472  				 <&gcc GCC_SDCC1_APPS_CLK>,
a91b2e690d4094 arch/arm/boot/dts/qcom-msm8974.dtsi      Ritesh Harjani               2016-11-21  473  				 <&xo_board>;
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  474  			clock-names = "iface", "core", "xo";
64cf62683b5398 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  475  			bus-width = <8>;
64cf62683b5398 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  476  			non-removable;
64cf62683b5398 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  477  
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31  478  			status = "disabled";
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31  479  		};
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31  480  
2477d81901a23a arch/arm/boot/dts/qcom-msm8974.dtsi      Bhupesh Sharma               2022-05-15  481  		sdhc_3: mmc@f9864900 {
28d13d317bacd7 arch/arm/boot/dts/qcom-msm8974.dtsi      Douglas Anderson             2018-11-05  482  			compatible = "qcom,msm8974-sdhci", "qcom,sdhci-msm-v4";
ab80661883deae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2017-10-04  483  			reg = <0xf9864900 0x11c>, <0xf9864000 0x800>;
5eb82ddb7273bd arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  484  			reg-names = "hc", "core";
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  485  			interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>,
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  486  				     <GIC_SPI 224 IRQ_TYPE_LEVEL_HIGH>;
ab80661883deae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2017-10-04  487  			interrupt-names = "hc_irq", "pwr_irq";
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  488  			clocks = <&gcc GCC_SDCC3_AHB_CLK>,
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  489  				 <&gcc GCC_SDCC3_APPS_CLK>,
ab80661883deae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2017-10-04  490  				 <&xo_board>;
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  491  			clock-names = "iface", "core", "xo";
64cf62683b5398 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  492  			bus-width = <4>;
64cf62683b5398 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  493  
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  494  			#address-cells = <1>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  495  			#size-cells = <0>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  496  
ab80661883deae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2017-10-04  497  			status = "disabled";
ab80661883deae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2017-10-04  498  		};
ab80661883deae arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2017-10-04  499  
2477d81901a23a arch/arm/boot/dts/qcom-msm8974.dtsi      Bhupesh Sharma               2022-05-15  500  		sdhc_2: mmc@f98a4900 {
28d13d317bacd7 arch/arm/boot/dts/qcom-msm8974.dtsi      Douglas Anderson             2018-11-05  501  			compatible = "qcom,msm8974-sdhci", "qcom,sdhci-msm-v4";
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31  502  			reg = <0xf98a4900 0x11c>, <0xf98a4000 0x800>;
5eb82ddb7273bd arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  503  			reg-names = "hc", "core";
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  504  			interrupts = <GIC_SPI 125 IRQ_TYPE_LEVEL_HIGH>,
dcf145011400ca arch/arm/boot/dts/qcom-msm8974.dtsi      Frank Rowand                 2018-09-06  505  				     <GIC_SPI 221 IRQ_TYPE_LEVEL_HIGH>;
3e944c7693b7ea arch/arm/boot/dts/qcom-msm8974.dtsi      Georgi Djakov                2014-01-31  506  			interrupt-names = "hc_irq", "pwr_irq";
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  507  			clocks = <&gcc GCC_SDCC2_AHB_CLK>,
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  508  				 <&gcc GCC_SDCC2_APPS_CLK>,
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  509  				 <&xo_board>;
49c19337d0aca2 arch/arm/boot/dts/qcom-msm8974.dtsi      Krzysztof Kozlowski          2022-07-12  510  			clock-names = "iface", "core", "xo";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  511  			bus-width = <4>;
c7c0edecfba8b6 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2019-11-04  512  
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  513  			#address-cells = <1>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  514  			#size-cells = <0>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  515  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  516  			status = "disabled";
c7c0edecfba8b6 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2019-11-04  517  		};
c7c0edecfba8b6 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2019-11-04  518  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  519  		blsp1_uart1: serial@f991d000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  520  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  521  			reg = <0xf991d000 0x1000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  522  			interrupts = <GIC_SPI 107 IRQ_TYPE_LEVEL_HIGH>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  523  			clocks = <&gcc GCC_BLSP1_UART1_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  524  			clock-names = "core", "iface";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  525  			status = "disabled";
c7c0edecfba8b6 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2019-11-04  526  		};
c7c0edecfba8b6 arch/arm/boot/dts/qcom-msm8974.dtsi      Bjorn Andersson              2019-11-04  527  
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  528  		blsp1_uart2: serial@f991e000 {
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  529  			compatible = "qcom,msm-uartdm-v1.4", "qcom,msm-uartdm";
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  530  			reg = <0xf991e000 0x1000>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  531  			interrupts = <GIC_SPI 108 IRQ_TYPE_LEVEL_HIGH>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  532  			clocks = <&gcc GCC_BLSP1_UART2_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  533  			clock-names = "core", "iface";
03110b46c99bb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-06-06  534  			pinctrl-names = "default";
03110b46c99bb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Luca Weiss                   2022-06-06  535  			pinctrl-0 = <&blsp1_uart2_default>;
f300826d27be7f arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  536  			status = "disabled";
7d7db8db67003e arch/arm/boot/dts/qcom-msm8974.dtsi      Ivan T. Ivanov               2014-02-06  537  		};
bf7f6b0432871c arch/arm/boot/dts/qcom-msm8974.dtsi      kiran.padwal@smartplayin.com 2014-09-16  538  
bb167546d06847 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  539  		blsp1_i2c1: i2c@f9923000 {
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31  540  			status = "disabled";
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31  541  			compatible = "qcom,i2c-qup-v2.1.1";
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31  542  			reg = <0xf9923000 0x1000>;
81924ec7a0d50f arch/arm/boot/dts/qcom/qcom-msm8974.dtsi Krzysztof Kozlowski          2023-12-05  543  			interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31  544  			clocks = <&gcc GCC_BLSP1_QUP1_I2C_APPS_CLK>, <&gcc GCC_BLSP1_AHB_CLK>;
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31  545  			clock-names = "core", "iface";
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  546  			pinctrl-names = "default", "sleep";
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  547  			pinctrl-0 = <&blsp1_i2c1_default>;
1dfe967ec7cfb0 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15  548  			pinctrl-1 = <&blsp1_i2c1_sleep>;
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31  549  			#address-cells = <1>;
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31  550  			#size-cells = <0>;
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31  551  		};
fb143fcbb9ad36 arch/arm/boot/dts/qcom-msm8974.dtsi      Brian Masney                 2018-10-31  552  
bb167546d06847 arch/arm/boot/dts/qcom-msm8974.dtsi      Konrad Dybcio                2022-04-15 @553  		blsp1_i2c2: i2c@f9924000 {

:::::: The code at line 553 was first introduced by commit
:::::: bb167546d06847a8729c973fe5165a231fd5c39d ARM: dts: qcom-msm8974*: Fix I2C labels

:::::: TO: Konrad Dybcio <konrad.dybcio@somainline.org>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
