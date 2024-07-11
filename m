Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7389F13D626
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jul 2024 20:32:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720729972; cv=none; b=RyXAjibxR+7uIhqlI9yq8WpUo2/OA+7XVbHkeCA8rmhxfOSJQUCeIkHg2zUMKZIU5udDo92QZhYDoKFPSdQtdnWR0WdPmP4Ye98ub8FJ588uFTvpav1yEr/PglM9+FPW+3mLhXHM8SY7yg1KnVOVlo9NlapOf+nVuU+9K2Cu1dY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720729972; c=relaxed/simple;
	bh=Q5KasP7CQ+5hwyyUuYWbsMgvSif+XxJiphl+iCkjw+w=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q3m5ipOYTmS2DDs8M2Q1RVUzSbGAA1jH++enwwTZUhhcCtV08AlKbMS1jod/jzRMSS6szEiyaZV+7hstRdiiL9drx/7FtuD2HSPCxiMxOmtBIPPgQ2iJqkZGInxri/nd7edU6x+/QVvGBdv/e8+1gtwI7kSYKEzHpspIpyUlydY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kuw2ZcIh; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kuw2ZcIh"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720729970; x=1752265970;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Q5KasP7CQ+5hwyyUuYWbsMgvSif+XxJiphl+iCkjw+w=;
  b=kuw2ZcIheTXxgobNH6clvKrI3SnAT3Yq9QniUAN2fV0C6K+AgdtiAcsH
   KN9Tzd8z63r9P+rdxzapyqqPcsY85UiWKMHqXF2A7vg9+yBVQ/Fs0xD09
   J4/UorekaXygStAM2ZyBVqU4ZczGoi2yi70SZNRxcAAn/CLf0CRtLkraY
   UVdYI0m9Zu26TiiRh9qdHtpFmOp2p1+wA/KBtutewpGXFL2yQIxf58QeC
   PPkrendBgtKjFaBi5Br+bOQeyyaSNd5cu9d2/JhEDT6HL+UfF99E/VQU4
   5/wkgxZIsoxpLswgQtn/jUpg++uDl22ATBG1QrxGPrXmuWG1Y+2whJwsR
   w==;
X-CSE-ConnectionGUID: e8eU1Cz7TvyHFKiIjtbgoA==
X-CSE-MsgGUID: x/XTfZ+tSvGXOeeesJC5Zw==
X-IronPort-AV: E=McAfee;i="6700,10204,11130"; a="28817141"
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="28817141"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2024 13:32:49 -0700
X-CSE-ConnectionGUID: yoKd44+qTVuZicecS0B1Kg==
X-CSE-MsgGUID: AzZ5nfmASz2akuLnnYVmyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,201,1716274800"; 
   d="scan'208";a="79373279"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 11 Jul 2024 13:32:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sS0T6-000Zra-2y;
	Thu, 11 Jul 2024 20:32:44 +0000
Date: Fri, 12 Jul 2024 04:32:30 +0800
From: kernel test robot <lkp@intel.com>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 12569/12643]
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi:926.13-1137.4: Warning
 (avoid_unnecessary_addr_size): /soc/pwrap@1000d000/pmic: unnecessary
 #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg"
 property
Message-ID: <202407120448.0fDj3eOo-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f477dd6eede3ecedc8963478571d99ec3bf3f762
commit: e60d42bf54c13b65949032f19bae93e5096d0ec4 [12569/12643] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/robh/linux.git
config: arm64-randconfig-r011-20221003 (https://download.01.org/0day-ci/archive/20240712/202407120448.0fDj3eOo-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240712/202407120448.0fDj3eOo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407120448.0fDj3eOo-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi:926.13-1137.4: Warning (avoid_unnecessary_addr_size): /soc/pwrap@1000d000/pmic: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
--
>> arch/arm64/boot/dts/qcom/msm8976.dtsi:945.27-1019.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/msm8976.dtsi:1021.27-1076.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@1a00000/dsi@1a96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8004.dtsi:14.23-23.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@5: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8950.dtsi:168.9-177.4: Warning (avoid_unnecessary_addr_size): /soc@0/spmi@200f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8976.dtsi:509.27-512.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s0-p1@219: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s0-p2@219)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:529.27-532.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s2-p1@21c: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s2-p2@21c)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:554.27-557.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s4-p1@221: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s4-p2@221)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:574.27-577.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s6-p1@224: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s6-p2@224)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:594.25-597.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/mode@228: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s8-p1@228)
   arch/arm64/boot/dts/qcom/msm8976.dtsi:604.27-607.6: Warning (unique_unit_address_if_enabled): /soc@0/qfprom@a4000/s8-p2@229: duplicate unit-address (also used in node /soc@0/qfprom@a4000/s9-p1@229)
--
>> arch/arm64/boot/dts/qcom/sm8650.dtsi:3459.27-3534.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae94000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650.dtsi:3556.27-3612.6: Warning (avoid_unnecessary_addr_size): /soc@0/display-subsystem@ae00000/dsi@ae96000: unnecessary #address-cells/#size-cells without "ranges", "dma-ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/sm8650-hdk.dts:841.9-852.5: Warning (graph_child_address): /soc@0/geniqup@ac0000/i2c@a8c000/typec-mux@e/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +926 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi

689b937beddebf Hsin-Yi Wang               2020-02-10   924  
689b937beddebf Hsin-Yi Wang               2020-02-10   925  &pwrap {
2d812e9e1dfd00 Alexandre Mergnat          2023-01-02  @926  	pmic: pmic {
689b937beddebf Hsin-Yi Wang               2020-02-10   927  		compatible = "mediatek,mt6397";
689b937beddebf Hsin-Yi Wang               2020-02-10   928  		#address-cells = <1>;
689b937beddebf Hsin-Yi Wang               2020-02-10   929  		#size-cells = <1>;
355f0a4c696584 AngeloGioacchino Del Regno 2023-10-25   930  		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_HIGH>;
689b937beddebf Hsin-Yi Wang               2020-02-10   931  		interrupt-controller;
689b937beddebf Hsin-Yi Wang               2020-02-10   932  		#interrupt-cells = <2>;
689b937beddebf Hsin-Yi Wang               2020-02-10   933  
689b937beddebf Hsin-Yi Wang               2020-02-10   934  		clock: mt6397clock {
689b937beddebf Hsin-Yi Wang               2020-02-10   935  			compatible = "mediatek,mt6397-clk";
689b937beddebf Hsin-Yi Wang               2020-02-10   936  			#clock-cells = <1>;
689b937beddebf Hsin-Yi Wang               2020-02-10   937  		};
689b937beddebf Hsin-Yi Wang               2020-02-10   938  
689b937beddebf Hsin-Yi Wang               2020-02-10   939  		pio6397: pinctrl {
689b937beddebf Hsin-Yi Wang               2020-02-10   940  			compatible = "mediatek,mt6397-pinctrl";
689b937beddebf Hsin-Yi Wang               2020-02-10   941  			gpio-controller;
689b937beddebf Hsin-Yi Wang               2020-02-10   942  			#gpio-cells = <2>;
689b937beddebf Hsin-Yi Wang               2020-02-10   943  		};
689b937beddebf Hsin-Yi Wang               2020-02-10   944  
689b937beddebf Hsin-Yi Wang               2020-02-10   945  		regulator: mt6397regulator {
689b937beddebf Hsin-Yi Wang               2020-02-10   946  			compatible = "mediatek,mt6397-regulator";
689b937beddebf Hsin-Yi Wang               2020-02-10   947  
689b937beddebf Hsin-Yi Wang               2020-02-10   948  			mt6397_vpca15_reg: buck_vpca15 {
689b937beddebf Hsin-Yi Wang               2020-02-10   949  				regulator-compatible = "buck_vpca15";
689b937beddebf Hsin-Yi Wang               2020-02-10   950  				regulator-name = "vpca15";
689b937beddebf Hsin-Yi Wang               2020-02-10   951  				regulator-min-microvolt = < 700000>;
689b937beddebf Hsin-Yi Wang               2020-02-10   952  				regulator-max-microvolt = <1350000>;
689b937beddebf Hsin-Yi Wang               2020-02-10   953  				regulator-ramp-delay = <12500>;
689b937beddebf Hsin-Yi Wang               2020-02-10   954  				regulator-always-on;
689b937beddebf Hsin-Yi Wang               2020-02-10   955  				regulator-allowed-modes = <0 1>;
689b937beddebf Hsin-Yi Wang               2020-02-10   956  			};
689b937beddebf Hsin-Yi Wang               2020-02-10   957  
689b937beddebf Hsin-Yi Wang               2020-02-10   958  			mt6397_vpca7_reg: buck_vpca7 {
689b937beddebf Hsin-Yi Wang               2020-02-10   959  				regulator-compatible = "buck_vpca7";
689b937beddebf Hsin-Yi Wang               2020-02-10   960  				regulator-name = "vpca7";
689b937beddebf Hsin-Yi Wang               2020-02-10   961  				regulator-min-microvolt = < 700000>;
689b937beddebf Hsin-Yi Wang               2020-02-10   962  				regulator-max-microvolt = <1350000>;
689b937beddebf Hsin-Yi Wang               2020-02-10   963  				regulator-ramp-delay = <12500>;
689b937beddebf Hsin-Yi Wang               2020-02-10   964  				regulator-enable-ramp-delay = <115>;
689b937beddebf Hsin-Yi Wang               2020-02-10   965  				regulator-always-on;
689b937beddebf Hsin-Yi Wang               2020-02-10   966  			};
689b937beddebf Hsin-Yi Wang               2020-02-10   967  
689b937beddebf Hsin-Yi Wang               2020-02-10   968  			mt6397_vsramca15_reg: buck_vsramca15 {
689b937beddebf Hsin-Yi Wang               2020-02-10   969  				regulator-compatible = "buck_vsramca15";
689b937beddebf Hsin-Yi Wang               2020-02-10   970  				regulator-name = "vsramca15";
689b937beddebf Hsin-Yi Wang               2020-02-10   971  				regulator-min-microvolt = < 700000>;
689b937beddebf Hsin-Yi Wang               2020-02-10   972  				regulator-max-microvolt = <1350000>;
689b937beddebf Hsin-Yi Wang               2020-02-10   973  				regulator-ramp-delay = <12500>;
689b937beddebf Hsin-Yi Wang               2020-02-10   974  				regulator-always-on;
689b937beddebf Hsin-Yi Wang               2020-02-10   975  			};
689b937beddebf Hsin-Yi Wang               2020-02-10   976  
689b937beddebf Hsin-Yi Wang               2020-02-10   977  			mt6397_vsramca7_reg: buck_vsramca7 {
689b937beddebf Hsin-Yi Wang               2020-02-10   978  				regulator-compatible = "buck_vsramca7";
689b937beddebf Hsin-Yi Wang               2020-02-10   979  				regulator-name = "vsramca7";
689b937beddebf Hsin-Yi Wang               2020-02-10   980  				regulator-min-microvolt = < 700000>;
689b937beddebf Hsin-Yi Wang               2020-02-10   981  				regulator-max-microvolt = <1350000>;
689b937beddebf Hsin-Yi Wang               2020-02-10   982  				regulator-ramp-delay = <12500>;
689b937beddebf Hsin-Yi Wang               2020-02-10   983  				regulator-always-on;
689b937beddebf Hsin-Yi Wang               2020-02-10   984  			};
689b937beddebf Hsin-Yi Wang               2020-02-10   985  
689b937beddebf Hsin-Yi Wang               2020-02-10   986  			mt6397_vcore_reg: buck_vcore {
689b937beddebf Hsin-Yi Wang               2020-02-10   987  				regulator-compatible = "buck_vcore";
689b937beddebf Hsin-Yi Wang               2020-02-10   988  				regulator-name = "vcore";
689b937beddebf Hsin-Yi Wang               2020-02-10   989  				regulator-min-microvolt = < 700000>;
689b937beddebf Hsin-Yi Wang               2020-02-10   990  				regulator-max-microvolt = <1350000>;
689b937beddebf Hsin-Yi Wang               2020-02-10   991  				regulator-ramp-delay = <12500>;
689b937beddebf Hsin-Yi Wang               2020-02-10   992  				regulator-always-on;
689b937beddebf Hsin-Yi Wang               2020-02-10   993  			};
689b937beddebf Hsin-Yi Wang               2020-02-10   994  
689b937beddebf Hsin-Yi Wang               2020-02-10   995  			mt6397_vgpu_reg: buck_vgpu {
689b937beddebf Hsin-Yi Wang               2020-02-10   996  				regulator-compatible = "buck_vgpu";
689b937beddebf Hsin-Yi Wang               2020-02-10   997  				regulator-name = "vgpu";
689b937beddebf Hsin-Yi Wang               2020-02-10   998  				regulator-min-microvolt = < 700000>;
689b937beddebf Hsin-Yi Wang               2020-02-10   999  				regulator-max-microvolt = <1350000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1000  				regulator-ramp-delay = <12500>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1001  				regulator-enable-ramp-delay = <115>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1002  			};
689b937beddebf Hsin-Yi Wang               2020-02-10  1003  
689b937beddebf Hsin-Yi Wang               2020-02-10  1004  			mt6397_vdrm_reg: buck_vdrm {
689b937beddebf Hsin-Yi Wang               2020-02-10  1005  				regulator-compatible = "buck_vdrm";
689b937beddebf Hsin-Yi Wang               2020-02-10  1006  				regulator-name = "vdrm";
689b937beddebf Hsin-Yi Wang               2020-02-10  1007  				regulator-min-microvolt = <1200000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1008  				regulator-max-microvolt = <1400000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1009  				regulator-ramp-delay = <12500>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1010  				regulator-always-on;
689b937beddebf Hsin-Yi Wang               2020-02-10  1011  			};
689b937beddebf Hsin-Yi Wang               2020-02-10  1012  
689b937beddebf Hsin-Yi Wang               2020-02-10  1013  			mt6397_vio18_reg: buck_vio18 {
689b937beddebf Hsin-Yi Wang               2020-02-10  1014  				regulator-compatible = "buck_vio18";
689b937beddebf Hsin-Yi Wang               2020-02-10  1015  				regulator-name = "vio18";
689b937beddebf Hsin-Yi Wang               2020-02-10  1016  				regulator-min-microvolt = <1620000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1017  				regulator-max-microvolt = <1980000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1018  				regulator-ramp-delay = <12500>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1019  				regulator-always-on;
689b937beddebf Hsin-Yi Wang               2020-02-10  1020  			};
689b937beddebf Hsin-Yi Wang               2020-02-10  1021  
689b937beddebf Hsin-Yi Wang               2020-02-10  1022  			mt6397_vtcxo_reg: ldo_vtcxo {
689b937beddebf Hsin-Yi Wang               2020-02-10  1023  				regulator-compatible = "ldo_vtcxo";
689b937beddebf Hsin-Yi Wang               2020-02-10  1024  				regulator-name = "vtcxo";
689b937beddebf Hsin-Yi Wang               2020-02-10  1025  				regulator-always-on;
689b937beddebf Hsin-Yi Wang               2020-02-10  1026  			};
689b937beddebf Hsin-Yi Wang               2020-02-10  1027  
689b937beddebf Hsin-Yi Wang               2020-02-10  1028  			mt6397_va28_reg: ldo_va28 {
689b937beddebf Hsin-Yi Wang               2020-02-10  1029  				regulator-compatible = "ldo_va28";
689b937beddebf Hsin-Yi Wang               2020-02-10  1030  				regulator-name = "va28";
689b937beddebf Hsin-Yi Wang               2020-02-10  1031  			};
689b937beddebf Hsin-Yi Wang               2020-02-10  1032  
689b937beddebf Hsin-Yi Wang               2020-02-10  1033  			mt6397_vcama_reg: ldo_vcama {
689b937beddebf Hsin-Yi Wang               2020-02-10  1034  				regulator-compatible = "ldo_vcama";
689b937beddebf Hsin-Yi Wang               2020-02-10  1035  				regulator-name = "vcama";
689b937beddebf Hsin-Yi Wang               2020-02-10  1036  				regulator-min-microvolt = <1800000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1037  				regulator-max-microvolt = <1800000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1038  				regulator-enable-ramp-delay = <218>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1039  			};
689b937beddebf Hsin-Yi Wang               2020-02-10  1040  
689b937beddebf Hsin-Yi Wang               2020-02-10  1041  			mt6397_vio28_reg: ldo_vio28 {
689b937beddebf Hsin-Yi Wang               2020-02-10  1042  				regulator-compatible = "ldo_vio28";
689b937beddebf Hsin-Yi Wang               2020-02-10  1043  				regulator-name = "vio28";
689b937beddebf Hsin-Yi Wang               2020-02-10  1044  				regulator-always-on;
689b937beddebf Hsin-Yi Wang               2020-02-10  1045  			};
689b937beddebf Hsin-Yi Wang               2020-02-10  1046  
689b937beddebf Hsin-Yi Wang               2020-02-10  1047  			mt6397_vusb_reg: ldo_vusb {
689b937beddebf Hsin-Yi Wang               2020-02-10  1048  				regulator-compatible = "ldo_vusb";
689b937beddebf Hsin-Yi Wang               2020-02-10  1049  				regulator-name = "vusb";
689b937beddebf Hsin-Yi Wang               2020-02-10  1050  			};
689b937beddebf Hsin-Yi Wang               2020-02-10  1051  
689b937beddebf Hsin-Yi Wang               2020-02-10  1052  			mt6397_vmc_reg: ldo_vmc {
689b937beddebf Hsin-Yi Wang               2020-02-10  1053  				regulator-compatible = "ldo_vmc";
689b937beddebf Hsin-Yi Wang               2020-02-10  1054  				regulator-name = "vmc";
689b937beddebf Hsin-Yi Wang               2020-02-10  1055  				regulator-min-microvolt = <1800000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1056  				regulator-max-microvolt = <3300000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1057  				regulator-enable-ramp-delay = <218>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1058  			};
689b937beddebf Hsin-Yi Wang               2020-02-10  1059  
689b937beddebf Hsin-Yi Wang               2020-02-10  1060  			mt6397_vmch_reg: ldo_vmch {
689b937beddebf Hsin-Yi Wang               2020-02-10  1061  				regulator-compatible = "ldo_vmch";
689b937beddebf Hsin-Yi Wang               2020-02-10  1062  				regulator-name = "vmch";
689b937beddebf Hsin-Yi Wang               2020-02-10  1063  				regulator-min-microvolt = <3000000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1064  				regulator-max-microvolt = <3300000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1065  				regulator-enable-ramp-delay = <218>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1066  			};
689b937beddebf Hsin-Yi Wang               2020-02-10  1067  
689b937beddebf Hsin-Yi Wang               2020-02-10  1068  			mt6397_vemc_3v3_reg: ldo_vemc3v3 {
689b937beddebf Hsin-Yi Wang               2020-02-10  1069  				regulator-compatible = "ldo_vemc3v3";
689b937beddebf Hsin-Yi Wang               2020-02-10  1070  				regulator-name = "vemc_3v3";
689b937beddebf Hsin-Yi Wang               2020-02-10  1071  				regulator-min-microvolt = <3000000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1072  				regulator-max-microvolt = <3300000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1073  				regulator-enable-ramp-delay = <218>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1074  			};
689b937beddebf Hsin-Yi Wang               2020-02-10  1075  
689b937beddebf Hsin-Yi Wang               2020-02-10  1076  			mt6397_vgp1_reg: ldo_vgp1 {
689b937beddebf Hsin-Yi Wang               2020-02-10  1077  				regulator-compatible = "ldo_vgp1";
689b937beddebf Hsin-Yi Wang               2020-02-10  1078  				regulator-name = "vcamd";
689b937beddebf Hsin-Yi Wang               2020-02-10  1079  				regulator-min-microvolt = <1800000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1080  				regulator-max-microvolt = <1800000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1081  				regulator-enable-ramp-delay = <240>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1082  			};
689b937beddebf Hsin-Yi Wang               2020-02-10  1083  
689b937beddebf Hsin-Yi Wang               2020-02-10  1084  			mt6397_vgp2_reg: ldo_vgp2 {
689b937beddebf Hsin-Yi Wang               2020-02-10  1085  				regulator-compatible = "ldo_vgp2";
689b937beddebf Hsin-Yi Wang               2020-02-10  1086  				regulator-name = "vcamio";
689b937beddebf Hsin-Yi Wang               2020-02-10  1087  				regulator-min-microvolt = <3300000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1088  				regulator-max-microvolt = <3300000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1089  				regulator-enable-ramp-delay = <218>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1090  			};
689b937beddebf Hsin-Yi Wang               2020-02-10  1091  
689b937beddebf Hsin-Yi Wang               2020-02-10  1092  			mt6397_vgp3_reg: ldo_vgp3 {
689b937beddebf Hsin-Yi Wang               2020-02-10  1093  				regulator-compatible = "ldo_vgp3";
689b937beddebf Hsin-Yi Wang               2020-02-10  1094  				regulator-name = "vcamaf";
689b937beddebf Hsin-Yi Wang               2020-02-10  1095  				regulator-min-microvolt = <1800000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1096  				regulator-max-microvolt = <1800000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1097  				regulator-enable-ramp-delay = <218>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1098  			};
689b937beddebf Hsin-Yi Wang               2020-02-10  1099  
689b937beddebf Hsin-Yi Wang               2020-02-10  1100  			mt6397_vgp4_reg: ldo_vgp4 {
689b937beddebf Hsin-Yi Wang               2020-02-10  1101  				regulator-compatible = "ldo_vgp4";
689b937beddebf Hsin-Yi Wang               2020-02-10  1102  				regulator-name = "vgp4";
689b937beddebf Hsin-Yi Wang               2020-02-10  1103  				regulator-min-microvolt = <1200000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1104  				regulator-max-microvolt = <3300000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1105  				regulator-enable-ramp-delay = <218>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1106  			};
689b937beddebf Hsin-Yi Wang               2020-02-10  1107  
689b937beddebf Hsin-Yi Wang               2020-02-10  1108  			mt6397_vgp5_reg: ldo_vgp5 {
689b937beddebf Hsin-Yi Wang               2020-02-10  1109  				regulator-compatible = "ldo_vgp5";
689b937beddebf Hsin-Yi Wang               2020-02-10  1110  				regulator-name = "vgp5";
689b937beddebf Hsin-Yi Wang               2020-02-10  1111  				regulator-min-microvolt = <1200000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1112  				regulator-max-microvolt = <3000000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1113  				regulator-enable-ramp-delay = <218>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1114  			};
689b937beddebf Hsin-Yi Wang               2020-02-10  1115  
689b937beddebf Hsin-Yi Wang               2020-02-10  1116  			mt6397_vgp6_reg: ldo_vgp6 {
689b937beddebf Hsin-Yi Wang               2020-02-10  1117  				regulator-compatible = "ldo_vgp6";
689b937beddebf Hsin-Yi Wang               2020-02-10  1118  				regulator-name = "vgp6";
689b937beddebf Hsin-Yi Wang               2020-02-10  1119  				regulator-min-microvolt = <3300000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1120  				regulator-max-microvolt = <3300000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1121  				regulator-enable-ramp-delay = <218>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1122  				regulator-always-on;
689b937beddebf Hsin-Yi Wang               2020-02-10  1123  			};
689b937beddebf Hsin-Yi Wang               2020-02-10  1124  
689b937beddebf Hsin-Yi Wang               2020-02-10  1125  			mt6397_vibr_reg: ldo_vibr {
689b937beddebf Hsin-Yi Wang               2020-02-10  1126  				regulator-compatible = "ldo_vibr";
689b937beddebf Hsin-Yi Wang               2020-02-10  1127  				regulator-name = "vibr";
689b937beddebf Hsin-Yi Wang               2020-02-10  1128  				regulator-min-microvolt = <1300000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1129  				regulator-max-microvolt = <3300000>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1130  				regulator-enable-ramp-delay = <218>;
689b937beddebf Hsin-Yi Wang               2020-02-10  1131  			};
689b937beddebf Hsin-Yi Wang               2020-02-10  1132  		};
689b937beddebf Hsin-Yi Wang               2020-02-10  1133  
689b937beddebf Hsin-Yi Wang               2020-02-10  1134  		rtc: mt6397rtc {
689b937beddebf Hsin-Yi Wang               2020-02-10  1135  			compatible = "mediatek,mt6397-rtc";
689b937beddebf Hsin-Yi Wang               2020-02-10  1136  		};
689b937beddebf Hsin-Yi Wang               2020-02-10  1137  	};
689b937beddebf Hsin-Yi Wang               2020-02-10  1138  };
689b937beddebf Hsin-Yi Wang               2020-02-10  1139  

:::::: The code at line 926 was first introduced by commit
:::::: 2d812e9e1dfd00e70c990a87c29c37db90977a5f arm64: dts: mt8173: change node name

:::::: TO: Alexandre Mergnat <amergnat@baylibre.com>
:::::: CC: Matthias Brugger <matthias.bgg@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
