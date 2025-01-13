Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E9C91FBBC0
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jan 2025 14:55:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736780108; cv=none; b=C4ONZ0Du6bvCWb98vmRGP8RQyCBNP1T+r0nc+k9v/hvLPvRZyYwbWAJa+Y7NI/p7v8iyAVwtA7sf2I5lz+g4mIsZ/3GMOUhqd1oG8/zITw5BMnbvLpcNEbnFxd4Sg7IWTci5ys+VghH3BQgj3YZg1Ggs0BbiolaxdA3smIZX4ak=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736780108; c=relaxed/simple;
	bh=0CbJGyrL3CnyGN7RdGdf5LuTKhU8A9MW0jU2JGljAeo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bgAVR1WE+8dRX1wgO3637ANJ8OsRkPoyU0707DyTZma+G9jSjAg/BgJ9oUGglrh99FJJBJXElCrqvJWrEdr9XVbhjh2mZbqDOmpkrkTXz3kt4QBDul4RuLqACeDT33HnijwFpy49opF1/dXhwNdWgwdJeiqwF+DeUoF5lj/c8As=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=S5gh5FpF; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="S5gh5FpF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736780106; x=1768316106;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0CbJGyrL3CnyGN7RdGdf5LuTKhU8A9MW0jU2JGljAeo=;
  b=S5gh5FpFghf3KnQig7NpS7gk2qdIOPKHroTt1mLN1nsPi14MgMatWmdA
   cs/NFVYlP+WhfR/neDhdudMkoVbBueG07U1axss4y2I7XEYo2KRpqJStz
   kr1EY5bJQoPAXuclLzsqf4CXH1RtAI7PEn+lBN3Wzt0buxp+B2A22pQCX
   rIpeAMyEPOS3z1y9+i636pOHreRmayDLYnALRWSOdtfmD24mAM3w9rkYk
   Kr9rza4P7+iUjrU/50cfIFkK2Z13+Qsysw0J16gq3N8WtS1v8Cpm0/PrF
   3linXzLvqsOWRGAN6SIpvIkCS5lLavYY/4qQcpuowCLytcAuyYl9EamvE
   w==;
X-CSE-ConnectionGUID: iIsYgKgjSQ2NdXL2ukuGVA==
X-CSE-MsgGUID: 6ifSVNEaSyCDK6a36O3NxA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="36953276"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="36953276"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Jan 2025 06:55:06 -0800
X-CSE-ConnectionGUID: qDE5SfjaTC+Rb0Kpp8De7A==
X-CSE-MsgGUID: f6iaKO9yRICLLLgYiSyvkw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="104677308"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 13 Jan 2025 06:55:05 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tXLqJ-000NI7-0N;
	Mon, 13 Jan 2025 14:55:03 +0000
Date: Mon, 13 Jan 2025 22:54:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 2/2]
 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi:134.14-141.4:
 Warning (unique_unit_address): /soc/i2c@11009000/touchpad@2c: duplicate
 unit-address (also used in node /soc/i2c@11009000/trackpad@2c)
Message-ID: <202501132206.Duy7uSj8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   a81c04a7f26aef2b0d3b59fd105c4a4592b2458d
commit: a81c04a7f26aef2b0d3b59fd105c4a4592b2458d [2/2] CHROMIUM: arm64: dts: mt8186: Add mt8186-ponyta360 board
config: arm64-randconfig-001-20250113 (https://download.01.org/0day-ci/archive/20250113/202501132206.Duy7uSj8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250113/202501132206.Duy7uSj8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501132206.Duy7uSj8-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:81.37-86.4: Warning (unit_address_vs_reg): /fixedregulator@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:88.34-93.4: Warning (unit_address_vs_reg): /fixedregulator@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1013.35-1018.5: Warning (simple_bus_reg): /soc/mailbox@10686000: simple-bus unit address format error, expected "10686100"
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1020.35-1025.5: Warning (simple_bus_reg): /soc/mailbox@10687000: simple-bus unit address format error, expected "10687100"
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1914.23-1936.5: Warning (simple_bus_reg): /soc/venc@17000000: simple-bus unit address format error, expected "17020000"
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2060.30-2181.5: Warning (simple_bus_reg): /soc/opp-table-3: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2183.32-2300.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola-it6505.dtsi:43.28-118.4: Warning (avoid_unnecessary_addr_size): /soc/i2c@1100f000/it6505dptx@5c: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1208.23-1218.5: Warning (unique_unit_address): /soc/lvts@1100b000: duplicate unit-address (also used in node /soc/svs@1100b000)
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:1892.38-1896.5: Warning (unique_unit_address): /soc/clock-controller@17000000: duplicate unit-address (also used in node /soc/venc@17000000)
>> arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi:134.14-141.4: Warning (unique_unit_address): /soc/i2c@11009000/touchpad@2c: duplicate unit-address (also used in node /soc/i2c@11009000/trackpad@2c)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-it6505.dtsi:89.11-98.7: Warning (graph_child_address): /soc/i2c@1100f000/it6505dptx@5c/switches/switch@0/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
   arch/arm64/boot/dts/mediatek/mt8186-corsola-it6505.dtsi:106.11-115.7: Warning (graph_child_address): /soc/i2c@1100f000/it6505dptx@5c/switches/switch@1/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary

vim +134 arch/arm64/boot/dts/mediatek/mt8186-corsola-steelix.dtsi

36eb825cafd837 qinwentao    2022-05-11  119  
36eb825cafd837 qinwentao    2022-05-11  120  &i2c2 {
ec083291b7e2f7 qinwentao    2022-11-21  121  	i2c-scl-internal-delay-ns = <22000>;
36eb825cafd837 qinwentao    2022-05-11  122  	pinctrl-0 = <&i2c2_pins &trackpad_pins>;
b3084dd74051e6 Hsin-Yi Wang 2022-09-20  123  	pinctrl-names = "default";
36eb825cafd837 qinwentao    2022-05-11  124  
36eb825cafd837 qinwentao    2022-05-11  125  	touchpad@15 {
36eb825cafd837 qinwentao    2022-05-11  126  		compatible = "elan,ekth3000";
36eb825cafd837 qinwentao    2022-05-11  127  		reg = <0x15>;
36eb825cafd837 qinwentao    2022-05-11  128  		interrupt-parent = <&pio>;
36eb825cafd837 qinwentao    2022-05-11  129  		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
36eb825cafd837 qinwentao    2022-05-11  130  		vcc-supply = <&pp3300_s3>;
36eb825cafd837 qinwentao    2022-05-11  131  		wakeup-source;
36eb825cafd837 qinwentao    2022-05-11  132  	};
36eb825cafd837 qinwentao    2022-05-11  133  
36eb825cafd837 qinwentao    2022-05-11 @134  	touchpad@2c {
36eb825cafd837 qinwentao    2022-05-11  135  		compatible = "hid-over-i2c";
36eb825cafd837 qinwentao    2022-05-11  136  		reg = <0x2c>;
36eb825cafd837 qinwentao    2022-05-11  137  		hid-descr-addr = <0x20>;
36eb825cafd837 qinwentao    2022-05-11  138  		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
36eb825cafd837 qinwentao    2022-05-11  139  		vcc-supply = <&pp3300_s3>;
36eb825cafd837 qinwentao    2022-05-11  140  		wakeup-source;
36eb825cafd837 qinwentao    2022-05-11  141  	};
36eb825cafd837 qinwentao    2022-05-11  142  };
36eb825cafd837 qinwentao    2022-05-11  143  

:::::: The code at line 134 was first introduced by commit
:::::: 36eb825cafd837cbcbcab731798ed14a12c7d9f5 CHROMIUM: arm64: dts: mt8186: Add corsola-steelix and rusty board

:::::: TO: qinwentao <qinwentao@huaqin.corp-partner.google.com>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
