Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6274918C922
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 19:18:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730143102; cv=none; b=lH3+cYzdka4EjEqMC+BsqOvoXCmOZCTZZsqFkiotVGLlec9yxM2v8DQUIs4aLsvvfnZnUYIUxYVW/7bAIqnxoBqeA/sH4B0ozxoxr9gNzT/bYPqt7jivQ9PgxkHAz292L6rNhO8F7J3BXkA0m16d3fHW7LQqnDuAZO7mwIgGbNc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730143102; c=relaxed/simple;
	bh=wGO2mi1M3KsvWg+ZNP0bFR9hzfk8K8W5bRbvY5DiW40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DP/L6Ir8xXFl894525HzCCjzZquuUkyf/wv/WWavRILxIPQimpPKdSXFwjjs1QQcyoAg0FMn7pz/A89aJO4VrPuiLAiLYsGIcvXcO8ZJZlQeEy/nogtMFf9DZ9AsK1nKNGv3+o9bf0r8Zn3ArRpx4VA+SIDwm2P62V9vSArVeZA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ObGLMPhQ; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ObGLMPhQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730143101; x=1761679101;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wGO2mi1M3KsvWg+ZNP0bFR9hzfk8K8W5bRbvY5DiW40=;
  b=ObGLMPhQMxt/EMAr1+RpXUTgEV0/nsbXW9S50aYYJx6YqRufCiC+Nv6m
   mMsFHeXKIv37+fumpTLZddq1H/V7bIBHuiLw/2oTTmjPtsgTPoxaiY2Qf
   llmm5ki8oT5sBYhJ6uejmAaG/4w4YpCTtlSnZlbD9JDo8lSrT/h+dJXFk
   aEi3AQ8gtsIsLFBETbR1XrMVHrr1F6xUj0yJrXV7TthWU+EYOlm4/CjsZ
   swei1z93o0ILjbjkHmzIiKMoIuJec9f/vrXZG364HoeRhOf6p8QLQ/O/5
   BEJNkZvl2OPU3U0VIeJGlGuQFkGmeHsVxMSAzndHbcqYO+s2ePXkqua/0
   g==;
X-CSE-ConnectionGUID: aghslvI/SI6CNA9oDApngA==
X-CSE-MsgGUID: xNoqL/9FRNaAsHoMOwoFvA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="40295608"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="40295608"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 12:18:20 -0700
X-CSE-ConnectionGUID: f8ROc20FQ6+EjkdDunkTZQ==
X-CSE-MsgGUID: GRSI4iWcSOaFZP1fWMctMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,239,1725346800"; 
   d="scan'208";a="85664042"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 28 Oct 2024 12:18:19 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5VFo-000cn6-26;
	Mon, 28 Oct 2024 19:18:16 +0000
Date: Tue, 29 Oct 2024 03:17:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 56/58]
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:420.14-426.4: Warning
 (unique_unit_address_if_enabled): /soc/i2c@11009000/trackpad@15: duplicate
 unit-address (also used in node /soc/i2c@11009000/touchpad@15)
Message-ID: <202410290314.MEKUe2HQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   0b93d0278112df33c529cb89b1e37c1005d268d5
commit: 4661184b2cadb7ec4436b55bd825edf1f0e9af1d [56/58] CHROMIUM: arm64: dts: mt8186: Remove duplicated properties for Kyogre
config: arm64-randconfig-001-20241028 (https://download.01.org/0day-ci/archive/20241029/202410290314.MEKUe2HQ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410290314.MEKUe2HQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410290314.MEKUe2HQ-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:381.16-387.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:389.16-392.4: Warning (unit_address_vs_reg): /soc/gpu@13040000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2244.30-2248.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2250.23-2254.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2256.35-2260.8: Warning (unit_address_vs_reg): /soc/thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8186.dtsi:2236.32-2353.5: Warning (simple_bus_reg): /soc/thermal-zones: missing or empty reg/ranges property
>> arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi:420.14-426.4: Warning (unique_unit_address_if_enabled): /soc/i2c@11009000/trackpad@15: duplicate unit-address (also used in node /soc/i2c@11009000/touchpad@15)
   arch/arm64/boot/dts/mediatek/mt8186-corsola-kyogre.dtsi:254.3-26: Warning (sound_dai_property): /sound/headset-codec:sound-dai: property size (4) too small for cell size 1

vim +420 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi

55a526935aeae0 Chen-Yu Tsai 2024-01-26  408  
55a526935aeae0 Chen-Yu Tsai 2024-01-26  409  &i2c2 {
55a526935aeae0 Chen-Yu Tsai 2024-01-26  410  	pinctrl-names = "default";
55a526935aeae0 Chen-Yu Tsai 2024-01-26  411  	/*
55a526935aeae0 Chen-Yu Tsai 2024-01-26  412  	 * Trackpad pin put here to work around second source components
55a526935aeae0 Chen-Yu Tsai 2024-01-26  413  	 * sharing the pinmux in steelix designs.
55a526935aeae0 Chen-Yu Tsai 2024-01-26  414  	 */
55a526935aeae0 Chen-Yu Tsai 2024-01-26  415  	pinctrl-0 = <&i2c2_pins>, <&trackpad_pin>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  416  	clock-frequency = <400000>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  417  	i2c-scl-internal-delay-ns = <10000>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  418  	status = "okay";
55a526935aeae0 Chen-Yu Tsai 2024-01-26  419  
55a526935aeae0 Chen-Yu Tsai 2024-01-26 @420  	trackpad@15 {
55a526935aeae0 Chen-Yu Tsai 2024-01-26  421  		compatible = "elan,ekth3000";
55a526935aeae0 Chen-Yu Tsai 2024-01-26  422  		reg = <0x15>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  423  		interrupts-extended = <&pio 11 IRQ_TYPE_LEVEL_LOW>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  424  		vcc-supply = <&pp3300_s3>;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  425  		wakeup-source;
55a526935aeae0 Chen-Yu Tsai 2024-01-26  426  	};
55a526935aeae0 Chen-Yu Tsai 2024-01-26  427  };
55a526935aeae0 Chen-Yu Tsai 2024-01-26  428  

:::::: The code at line 420 was first introduced by commit
:::::: 55a526935aeae0dc41c7025a28c776c438e4ae82 UPSTREAM: arm64: dts: mediatek: Add MT8186 Krabby platform based Tentacruel / Tentacool

:::::: TO: Chen-Yu Tsai <wenst@chromium.org>
:::::: CC: Chromeos LUCI <chromeos-scoped@luci-project-accounts.iam.gserviceaccount.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
