Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11A22CCC5
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Aug 2025 00:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755909724; cv=none; b=dgzZgOLTclKmT457M5Phnsqu4GYeHcpjhLsmnHr6AdinAXxR5Py+YOvJwasSHpXSrsCF343hTkKvFHR9q+D6R5qgVSOjjxaMBngoBHYK7bqig/3JZZLqvBqncKvmw3mYbQhrtUnFqEz0HLk+ukrE5HbFAWCO1eyccV69GwFMJ8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755909724; c=relaxed/simple;
	bh=gZDlXxUX6Gij9EcPSKK8/zrKZGbHWQHUntVX9caHd0M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YGrcbVv0p2gzoFwQqm88Qk36l8LQuQsWRjsqCy4zyZbVIVQ/W391YgxNuirjKEUTZ1RB/fH+3Ry3fdTBiajmTdHaZOWP0/nLFL+klkRmfIw3d2t8Jgle8xl1Yj4krW3MiMPhz+2Ue5UbM/xoXx8xB+eJI2Pd2bLIjFjVOuIQz0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=k83dLZaG; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="k83dLZaG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755909723; x=1787445723;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gZDlXxUX6Gij9EcPSKK8/zrKZGbHWQHUntVX9caHd0M=;
  b=k83dLZaGdf6MPSVMs3062A/+PjVZjx4VCwU1X0/NNzdls3au1S1hWLlx
   eKcCxiScUE1QUIZQeWMTD7sxbcWijcylaSG5b075FEM84zkxqP1jIcwJI
   4yOPkEV0nqDXArbFpcmDt1OYaotbf6i/HXWA49hdWXqUwZOqyA8XqXvm1
   PUsvut0rT6cpaDlF1ToIR70YWYdWOQ3zOUe7Z2I4gd1oP2z++S3BwKpmF
   Fbm++MtXj22vmOBgPkac4bBdQgR5hGGy+HUEpFhtEx0D0m4v83moctpFZ
   81kefmfJlfpybIoBP/EQODfIq5Y8bGkav+DVlCefrghjejRBbtWKULLb2
   A==;
X-CSE-ConnectionGUID: iBk8AQOyTXqsT04pdbSD4A==
X-CSE-MsgGUID: jlUN/L8XRAmWuttYjuUI/g==
X-IronPort-AV: E=McAfee;i="6800,10657,11529"; a="58285398"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="58285398"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Aug 2025 17:42:03 -0700
X-CSE-ConnectionGUID: aRZ1YwYQRbWRfDpsO/oioA==
X-CSE-MsgGUID: KpKBtUpiSn268sKRAp14AQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="173023152"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 22 Aug 2025 17:42:01 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1upcKT-000LyH-39;
	Sat, 23 Aug 2025 00:41:59 +0000
Date: Sat, 23 Aug 2025 08:40:36 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 443/443]
 arch/arm64/boot/dts/mediatek/mt6359.dtsi:305.19-308.6: Warning
 (unit_address_vs_reg): /soc/pwrap@10024000/pmic/rtc/fginit: node has a reg
 or ranges property, but no unit name
Message-ID: <202508230835.u9mdXf7P-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   12cacc6855c36b7b2ce4a8f020b4a40a6433357b
commit: 32e731ebbc523a0dc0ff53fb7027c7da2af8054b [443/443] CHROMIUM: arm64: dts: mt6359: add rtc node config
config: arm64-randconfig-001-20250823 (https://download.01.org/0day-ci/archive/20250823/202508230835.u9mdXf7P-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250823/202508230835.u9mdXf7P-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508230835.u9mdXf7P-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/mediatek/mt6359.dtsi:305.19-308.6: Warning (unit_address_vs_reg): /soc/pwrap@10024000/pmic/rtc/fginit: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6359.dtsi:310.17-313.6: Warning (unit_address_vs_reg): /soc/pwrap@10024000/pmic/rtc/fgsoc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6359.dtsi:315.19-318.6: Warning (unit_address_vs_reg): /soc/pwrap@10024000/pmic/rtc/ext32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:1987.18-1993.7: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:1994.18-1997.6: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3590.29-3594.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/trip-point@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3596.22-3600.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/target@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3602.34-3606.7: Warning (unit_address_vs_reg): /thermal-zones/soc_max/trips/soc_max_crit@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:2995.17-3053.5: Warning (simple_bus_reg): /soc/jpgdec-master: missing or empty reg/ranges property
   arch/arm64/boot/dts/mediatek/mt8195.dtsi:3070.17-3107.5: Warning (simple_bus_reg): /soc/jpgenc-master: missing or empty reg/ranges property
--
>> arch/arm64/boot/dts/mediatek/mt6359.dtsi:305.19-308.6: Warning (unit_address_vs_reg): /soc/pwrap@10024000/pmic/rtc/fginit: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6359.dtsi:310.17-313.6: Warning (unit_address_vs_reg): /soc/pwrap@10024000/pmic/rtc/fgsoc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6359.dtsi:315.19-318.6: Warning (unit_address_vs_reg): /soc/pwrap@10024000/pmic/rtc/ext32k: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:399.16-405.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi:407.16-410.4: Warning (unit_address_vs_reg): /soc/gpu@13000000/power_model@1: node has a unit name, but no reg or ranges property
--
>> arch/arm64/boot/dts/mediatek/mt6359.dtsi:305.19-308.6: Warning (unit_address_vs_reg): /soc/pwrap@10024000/pmic/rtc/fginit: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6359.dtsi:310.17-313.6: Warning (unit_address_vs_reg): /soc/pwrap@10024000/pmic/rtc/fgsoc: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/mediatek/mt6359.dtsi:315.19-318.6: Warning (unit_address_vs_reg): /soc/pwrap@10024000/pmic/rtc/ext32k: node has a reg or ranges property, but no unit name

vim +305 arch/arm64/boot/dts/mediatek/mt6359.dtsi

 > 305				fginit: fginit {
   306					reg = <0 0x1>;
   307					bits = <0 8>;
   308				};
   309	
 > 310				fgsoc: fgsoc {
   311					reg = <1 0x1>;
   312					bits = <0 8>;
   313				};
   314	
 > 315				ext32k: ext32k {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
