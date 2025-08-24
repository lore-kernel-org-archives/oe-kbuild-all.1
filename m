Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B1A6393DD5
	for <oe-kbuild-all@lists.linux.dev>; Sun, 24 Aug 2025 03:22:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756005731; cv=none; b=qhnACnP+YfkAL8yPgHtSshAGReTR8uF/2siZIkkAE1slvufB25uZtxrzz/mOlo2ODbBEm0cTmNpTdVJcl1R44uCk4ZC0HOodjDoR7gmGSVNoMqt35xchiebhBBXOheAFKoIyY+fjfQDEfRF9qV+zq8x2EkxKKb7qH34WMduKm8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756005731; c=relaxed/simple;
	bh=e5DDe3bCau56V9zIZJD5xW3mPnxvlSz1jOKyc0hQFn0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nm5ECydq5WI5kx9uk023zbxmuVFoRN3nWZNa2neq3f1l5XQa0ZivRS3kKwjIAaEDqSbEZkX+oWrP7I5w10k7kpaDUNlDSMn2+mYoFFokf8YlWUt92fHHntNPs7ZbOB3wLujPPMA5KxV6lc6H4ouGcPdFkWtgFZh/Y0P7yaDYoKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Vf8zKx21; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Vf8zKx21"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756005729; x=1787541729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e5DDe3bCau56V9zIZJD5xW3mPnxvlSz1jOKyc0hQFn0=;
  b=Vf8zKx218LvAR7hMb/10kBXpLlB48IdAr8eOLnHtjAPjClChdIAWXgRR
   2+vhCcWNdCzHavycnICv+SVu/JKDLvrePZNwLDwB+8qaUoH0OJ8XksPmd
   6JqtGpBGyj4wZFGCdQfVMDdNgx9jdoid3JHH/VE+bnVknYRT24SqrPBDA
   A1PTKYi2Zzb3zYKI2hjFGrTt0XX+QyM5ecerg/iMD9NIZzNQOUbgRp+1G
   /fp3n9c8REHn7W9itccY9vg+Yux8Bg4owUhHOT9Ed8Prh3QhJls3iHm50
   62Ng0FcNogctH3JM6plSQcVLl/NG4tfNhk66YxNE+sVUhlvD2BhpV9MxQ
   A==;
X-CSE-ConnectionGUID: NSeEz4ABTtKeuKZQr+M2Ig==
X-CSE-MsgGUID: NkxxJ2BXSie6fMvGbM1jUg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="68854696"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="68854696"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 20:22:08 -0700
X-CSE-ConnectionGUID: dpy7qAbfREyTtVvMwQ7VPg==
X-CSE-MsgGUID: TUJLmxlVQvyl2iwFHgzn5w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="169191765"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa008.jf.intel.com with ESMTP; 23 Aug 2025 20:22:08 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uq1Iz-0002BT-05;
	Sun, 24 Aug 2025 03:22:05 +0000
Date: Sun, 24 Aug 2025 05:21:39 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 2/2]
 arch/arm64/boot/dts/qcom/apq8016-sbc.dts:359.22-367.4: Warning
 (unit_address_vs_reg): /soc/sound@7702000/external-dai-link@0: node has a
 unit name, but no reg or ranges property
Message-ID: <202508240521.xi8bS0J3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Stephan,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   00510ce05bf395fdead13baf52262847776bab0c
commit: 8d139a395dbe3209e73555977b91e27690efcc82 [2/2] arm64: dts: qcom: Drop unneeded extra device-specific includes
config: arm64-randconfig-2051-20250823 (https://download.01.org/0day-ci/archive/20250824/202508240521.xi8bS0J3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240521.xi8bS0J3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508240521.xi8bS0J3-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:417.11-1880.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/qcom/apq8016-sbc.dts:359.22-367.4: Warning (unit_address_vs_reg): /soc/sound@7702000/external-dai-link@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/qcom/apq8016-sbc.dts:369.37-377.4: Warning (unit_address_vs_reg): /soc/sound@7702000/internal-codec-playback-dai-link@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/qcom/apq8016-sbc.dts:379.36-387.4: Warning (unit_address_vs_reg): /soc/sound@7702000/internal-codec-capture-dai-link@0: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/qcom/apq8016-sbc.dts:102.12-106.5: Warning (unit_address_vs_reg): /gpio-keys/button@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/apq8016-sbc.dts:117.9-122.5: Warning (unit_address_vs_reg): /leds/led@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/apq8016-sbc.dts:124.9-129.5: Warning (unit_address_vs_reg): /leds/led@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/apq8016-sbc.dts:131.9-136.5: Warning (unit_address_vs_reg): /leds/led@3: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/apq8016-sbc.dts:138.9-144.5: Warning (unit_address_vs_reg): /leds/led@4: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/apq8016-sbc.dts:146.9-151.5: Warning (unit_address_vs_reg): /leds/led@5: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/apq8016-sbc.dts:153.9-158.5: Warning (unit_address_vs_reg): /leds/led@6: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1428.25-1444.5: Warning (simple_bus_reg): /soc/sdhci@7824000: simple-bus unit address format error, expected "7824900"
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1446.25-1460.5: Warning (simple_bus_reg): /soc/sdhci@7864000: simple-bus unit address format error, expected "7864900"
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1732.30-1796.5: Warning (simple_bus_reg): /soc/remoteproc@a21b000: simple-bus unit address format error, expected "a204000"
   arch/arm64/boot/dts/qcom/msm8916.dtsi:999.22-1047.6: Warning (avoid_unnecessary_addr_size): /soc/mdss@1a00000/dsi@1a98000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/apq8016-sbc.dts:93.12-107.4: Warning (avoid_unnecessary_addr_size): /gpio-keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1501.26-1514.5: Warning (unique_unit_address): /soc/i2c@78b5000: duplicate unit-address (also used in node /soc/spi@78b5000)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1533.26-1546.5: Warning (unique_unit_address): /soc/i2c@78b6000: duplicate unit-address (also used in node /soc/spi@78b6000)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1565.26-1578.5: Warning (unique_unit_address): /soc/i2c@78b7000: duplicate unit-address (also used in node /soc/spi@78b7000)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1597.26-1610.5: Warning (unique_unit_address): /soc/i2c@78b8000: duplicate unit-address (also used in node /soc/spi@78b8000)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1629.26-1642.5: Warning (unique_unit_address): /soc/i2c@78b9000: duplicate unit-address (also used in node /soc/spi@78b9000)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:1661.26-1674.5: Warning (unique_unit_address): /soc/i2c@78ba000: duplicate unit-address (also used in node /soc/spi@78ba000)
   arch/arm64/boot/dts/qcom/msm8916.dtsi:986.11-996.7: Warning (graph_child_address): /soc/mdss@1a00000/mdp@1a01000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
--
   arch/arm64/boot/dts/qcom/msm8996.dtsi:447.18-456.5: Warning (unit_address_vs_reg): /reserved-memory/rmtfs@86700000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:596.11-3151.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1547.11-1708.5: Warning (unit_address_vs_reg): /soc/agnoc@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2957.24-2960.7: Warning (unit_address_vs_reg): /soc/slim@91c0000/ngd@1/tas-ifd: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/msm8996.dtsi:3026.13-3029.8: Warning (unit_address_vs_reg): /soc/remoteproc@9300000/smd-edge/apr/q6core: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/msm8996.dtsi:3031.19-3043.8: Warning (unit_address_vs_reg): /soc/remoteproc@9300000/smd-edge/apr/q6afe: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/msm8996.dtsi:3045.19-3055.8: Warning (unit_address_vs_reg): /soc/remoteproc@9300000/smd-edge/apr/q6asm: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/msm8996.dtsi:3057.19-3064.8: Warning (unit_address_vs_reg): /soc/remoteproc@9300000/smd-edge/apr/q6adm: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/qcom/apq8096-db820c.dts:94.12-98.5: Warning (unit_address_vs_reg): /gpio_keys/button@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:22.22-27.5: Warning (simple_bus_reg): /clocks/xo-board: missing or empty reg/ranges property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:29.24-34.5: Warning (simple_bus_reg): /clocks/sleep-clk: missing or empty reg/ranges property
   arch/arm64/boot/dts/qcom/apq8096-db820c.dts:65.20-73.5: Warning (simple_bus_reg): /clocks/divclk4: missing or empty reg/ranges property
   arch/arm64/boot/dts/qcom/apq8096-db820c.dts:75.22-82.5: Warning (simple_bus_reg): /clocks/divclk1: missing or empty reg/ranges property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:1547.11-1708.5: Warning (simple_bus_reg): /soc/agnoc@0: missing or empty reg/ranges property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:827.21-874.6: Warning (avoid_unnecessary_addr_size): /soc/mdss@900000/dsi@994000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:137.9-146.4: Warning (avoid_unnecessary_addr_size): /soc/qcom,spmi@400f000/pmic@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:3009.13-3067.6: Warning (avoid_unnecessary_addr_size): /soc/remoteproc@9300000/smd-edge: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/apq8096-db820c.dts:85.12-99.4: Warning (avoid_unnecessary_addr_size): /gpio_keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8996.dtsi:2864.27-2879.5: Warning (unique_unit_address): /soc/i2c@75ba000: duplicate unit-address (also used in node /soc/spi@75ba000)
   arch/arm64/boot/dts/qcom/msm8996.dtsi:923.11-933.7: Warning (graph_child_address): /soc/mdss@900000/hdmi-tx@9a0000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +359 arch/arm64/boot/dts/qcom/apq8016-sbc.dts

   347	
   348	&sound {
   349		status = "okay";
   350	
   351		pinctrl-0 = <&cdc_pdm_lines_act &ext_sec_tlmm_lines_act &ext_mclk_tlmm_lines_act>;
   352		pinctrl-1 = <&cdc_pdm_lines_sus &ext_sec_tlmm_lines_sus &ext_mclk_tlmm_lines_sus>;
   353		pinctrl-names = "default", "sleep";
   354		qcom,model = "DB410c";
   355		qcom,audio-routing =
   356			"AMIC2", "MIC BIAS Internal2",
   357			"AMIC3", "MIC BIAS External1";
   358	
 > 359		external-dai-link@0 {
   360			link-name = "ADV7533";
   361			cpu {
   362				sound-dai = <&lpass MI2S_QUATERNARY>;
   363			};
   364			codec {
   365				sound-dai = <&adv_bridge 0>;
   366			};
   367		};
   368	
 > 369		internal-codec-playback-dai-link@0 {
   370			link-name = "WCD";
   371			cpu {
   372				sound-dai = <&lpass MI2S_PRIMARY>;
   373			};
   374			codec {
   375				sound-dai = <&lpass_codec 0>, <&wcd_codec 0>;
   376			};
   377		};
   378	
 > 379		internal-codec-capture-dai-link@0 {
   380			link-name = "WCD-Capture";
   381			cpu {
   382				sound-dai = <&lpass MI2S_TERTIARY>;
   383			};
   384			codec {
   385				sound-dai = <&lpass_codec 1>, <&wcd_codec 1>;
   386			};
   387		};
   388	};
   389	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
