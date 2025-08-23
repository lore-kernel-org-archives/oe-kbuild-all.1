Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84D112AE66
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 22:51:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755989515; cv=none; b=VGU936Mvzeh1KHq7Ke2m8xJW902+gbW9s3GOKCFuX1OFP7nx1xPnDXQvszaQYJClfPUkVkqeRsaB6eqcg9j+1+70l9+prHz7bWL/Bv3HqXK3EGYmdIDEGnCbYaToqKHjf0WTK6MjDLWlTs0Q5oTjGPWuB3M3Z4sD51ZPsUbJclw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755989515; c=relaxed/simple;
	bh=kjWIJJqYFc1Ql95RGtJKQ7SfHt3oR+NfBXfjBmVlhe0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QWdEsNredgdxJ304GtNacgKNkYGExcUQ5lcQ0JZHsjEkEEkrFq3J/rce7ZnpERjXdD0XKJLJRbFXFu8FoXHNvKkeW8DJ+vKUdgs80qW68zahyfsA7Gmk8HbPdxsphdeOpWHDsKqI+Z7UaVemKk9DLFlEhIip6STjRhWvHFb7Pc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lQ1OuN+h; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lQ1OuN+h"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755989514; x=1787525514;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kjWIJJqYFc1Ql95RGtJKQ7SfHt3oR+NfBXfjBmVlhe0=;
  b=lQ1OuN+hCB/tBJHhZm06Tmn0Pj4g1vZ5Z+SFjts74O3LLBjGg/9Je7AI
   J91ZC+QlxzEsF12yqcNwLsSQgk92n8IJAfdVevDLMHnQ7/7BpN3VcWsKm
   BJ3g5TbO3n6BWsJ1/22UOT/l35pCtF9+hhh6Uvp7A5rduQNfSBcw0ob2Q
   G1EycBIajvcnS4L53nRXKPXpuvEoCE+wAs3Iq+5U4dABTywOzZpHxq2Wc
   S4uP0kvSfoFr2PTRH+zimgCKh1Xo5dqxyc6HM3WX1LyR9J2x60CUrwA61
   hG0v08ysaJ4E430zJoypXg5U87t8WDachkH7q4zebXKLBBNUi/HsRuTDW
   g==;
X-CSE-ConnectionGUID: QNmFLnHOSUqYPoY1cN3Oww==
X-CSE-MsgGUID: zUUb7HmJQ5KiVsF49/LipQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="75844620"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="75844620"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2025 15:51:53 -0700
X-CSE-ConnectionGUID: /aVP9ODpSAS22tuvx84Sjw==
X-CSE-MsgGUID: Z4a4gWpTShqPDckaOAmdng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173393718"
Received: from igk-lkp-server01.igk.intel.com (HELO ca260db0ef79) ([10.91.175.65])
  by orviesa004.jf.intel.com with ESMTP; 23 Aug 2025 15:51:52 -0700
Received: from kbuild by ca260db0ef79 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upx5R-0002AJ-1s;
	Sat, 23 Aug 2025 22:51:49 +0000
Date: Sun, 24 Aug 2025 00:51:49 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 2/2]
 arch/arm64/boot/dts/qcom/pmi8994.dtsi:30.39-34.5: Warning
 (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pmic@3/regulators:
 unnecessary #address-cells/#size-cells without "ranges" or child "reg"
 property
Message-ID: <202508240032.nAWo2eMA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   00510ce05bf395fdead13baf52262847776bab0c
commit: 5a8bbab2b14b067014bd34bc17cc0b89f00f8e21 [2/2] arm64: dts: qcom: msm8994: correct SPMI unit address
config: arm64-randconfig-2051-20250823 (https://download.01.org/0day-ci/archive/20250824/202508240032.nAWo2eMA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.6.2.dev4+g8f79ddd
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250824/202508240032.nAWo2eMA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508240032.nAWo2eMA-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/qcom/msm8994.dtsi:336.11-1012.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi:37.12-44.5: Warning (unit_address_vs_reg): /gpio_keys/button@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi:46.12-53.5: Warning (unit_address_vs_reg): /gpio_keys/button@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi:55.12-62.5: Warning (unit_address_vs_reg): /gpio_keys/button@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi:64.12-71.5: Warning (unit_address_vs_reg): /gpio_keys/button@3: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/msm8994.dtsi:610.28-626.5: Warning (avoid_unnecessary_addr_size): /soc/i2c@f9928000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:137.9-146.4: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/pmi8994.dtsi:30.39-34.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pmic@3/regulators: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi:30.12-72.4: Warning (avoid_unnecessary_addr_size): /gpio_keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8994.dtsi:518.28-534.5: Warning (unique_unit_address): /soc/i2c@f9923000: duplicate unit-address (also used in node /soc/spi@f9923000)
--
   arch/arm64/boot/dts/qcom/msm8994.dtsi:336.11-1012.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/msm8994.dtsi:18.22-23.5: Warning (simple_bus_reg): /clocks/xo-board: missing or empty reg/ranges property
   arch/arm64/boot/dts/qcom/msm8994.dtsi:25.24-30.5: Warning (simple_bus_reg): /clocks/sleep-clk: missing or empty reg/ranges property
   arch/arm64/boot/dts/qcom/msm8994-msft-lumia-octagon.dtsi:51.20-60.5: Warning (simple_bus_reg): /clocks/divclk4: missing or empty reg/ranges property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:137.9-146.4: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/pmi8994.dtsi:30.39-34.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pmic@3/regulators: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8994.dtsi:518.28-534.5: Warning (unique_unit_address): /soc/i2c@f9923000: duplicate unit-address (also used in node /soc/spi@f9923000)
--
   arch/arm64/boot/dts/qcom/msm8994.dtsi:336.11-1012.4: Warning (unit_address_vs_reg): /soc: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi:37.12-44.5: Warning (unit_address_vs_reg): /gpio_keys/button@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi:46.12-53.5: Warning (unit_address_vs_reg): /gpio_keys/button@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi:55.12-62.5: Warning (unit_address_vs_reg): /gpio_keys/button@2: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi:64.12-71.5: Warning (unit_address_vs_reg): /gpio_keys/button@3: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/qcom/pm8994.dtsi:137.9-146.4: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pmic@1: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
>> arch/arm64/boot/dts/qcom/pmi8994.dtsi:30.39-34.5: Warning (avoid_unnecessary_addr_size): /soc/spmi@fc4cf000/pmic@3/regulators: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8994-sony-xperia-kitakami.dtsi:30.12-72.4: Warning (avoid_unnecessary_addr_size): /gpio_keys: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/qcom/msm8994.dtsi:518.28-534.5: Warning (unique_unit_address): /soc/i2c@f9923000: duplicate unit-address (also used in node /soc/spi@f9923000)

vim +30 arch/arm64/boot/dts/qcom/pmi8994.dtsi

38757eb3ca3436 Stephen Boyd   2015-11-17   6  
38757eb3ca3436 Stephen Boyd   2015-11-17   7  	pmic@2 {
38757eb3ca3436 Stephen Boyd   2015-11-17   8  		compatible = "qcom,pmi8994", "qcom,spmi-pmic";
38757eb3ca3436 Stephen Boyd   2015-11-17   9  		reg = <0x2 SPMI_USID>;
38757eb3ca3436 Stephen Boyd   2015-11-17  10  		#address-cells = <1>;
38757eb3ca3436 Stephen Boyd   2015-11-17  11  		#size-cells = <0>;
133767d94a1d1c Vivek Gautam   2017-07-28  12  
133767d94a1d1c Vivek Gautam   2017-07-28  13  		pmi8994_gpios: gpios@c000 {
133767d94a1d1c Vivek Gautam   2017-07-28  14  			compatible = "qcom,pmi8994-gpio", "qcom,spmi-gpio";
133767d94a1d1c Vivek Gautam   2017-07-28  15  			reg = <0xc000>;
133767d94a1d1c Vivek Gautam   2017-07-28  16  			gpio-controller;
21750eb93ea9eb Brian Masney   2019-03-05  17  			gpio-ranges = <&pmi8994_gpios 0 0 10>;
133767d94a1d1c Vivek Gautam   2017-07-28  18  			#gpio-cells = <2>;
8cff9c8a78810c Brian Masney   2019-01-19  19  			interrupt-controller;
8cff9c8a78810c Brian Masney   2019-01-19  20  			#interrupt-cells = <2>;
133767d94a1d1c Vivek Gautam   2017-07-28  21  		};
38757eb3ca3436 Stephen Boyd   2015-11-17  22  	};
38757eb3ca3436 Stephen Boyd   2015-11-17  23  
38757eb3ca3436 Stephen Boyd   2015-11-17  24  	pmic@3 {
38757eb3ca3436 Stephen Boyd   2015-11-17  25  		compatible = "qcom,pmi8994", "qcom,spmi-pmic";
38757eb3ca3436 Stephen Boyd   2015-11-17  26  		reg = <0x3 SPMI_USID>;
38757eb3ca3436 Stephen Boyd   2015-11-17  27  		#address-cells = <1>;
38757eb3ca3436 Stephen Boyd   2015-11-17  28  		#size-cells = <0>;
2317b87a2a6fb9 Rajendra Nayak 2020-04-17  29  
2317b87a2a6fb9 Rajendra Nayak 2020-04-17 @30  		pmi8994_spmi_regulators: regulators {

:::::: The code at line 30 was first introduced by commit
:::::: 2317b87a2a6fb9e1fff3144b72330ba551856721 arm64: dts: qcom: db820c: Add vdd_gfx and tie it into mmcc

:::::: TO: Rajendra Nayak <rnayak@codeaurora.org>
:::::: CC: Bjorn Andersson <bjorn.andersson@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
