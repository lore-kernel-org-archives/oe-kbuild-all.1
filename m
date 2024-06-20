Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AE86FC0C
	for <oe-kbuild-all@lists.linux.dev>; Thu, 20 Jun 2024 12:11:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718885463; cv=none; b=qzc5vFtwjmYOFnUArRkBDDRyDAc9Jk63Hp6aY0Djty4nWDWW1MRmK1/KpCo23kBAMXsiEPwMFXvx9vDhMz45Wv3EyFs6R7xF2hxcjdu5gS7GD6K2JUJrWbYDCcVeJnHXZbvSvXDVAQhleDW1y31w7Y/GVrXUEcxJQXvtIufhvHo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718885463; c=relaxed/simple;
	bh=vLx0PEQgO76OAZvPd7vME17a8IY3nCPvPp6pxr+wG9M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=G9GItEwn5g+DGNHQM+bxFyvvhh1xt20Ye+9zqM28JZq18it+J9RMNiXgDRZ0KYjiywAlRjQiLD7zOpDLzEubYeAowG4R3bgFeaGFEbX/KeSvn++vd2cNEXPiXU83eEr3lw0sBEhT9FDotU9pIwAzr/A4MWKPhcjulIBSL5ETz/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rb8lilmb; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rb8lilmb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718885461; x=1750421461;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vLx0PEQgO76OAZvPd7vME17a8IY3nCPvPp6pxr+wG9M=;
  b=Rb8lilmbl5yFqIGHlck4KUhDhJLkeb82IsIWFZFnhMpLk0aWHxcFMnIO
   CWQ0S8YYs4EASVsO4vkzNMYXtLQvyeZUlmXUXWyB22x7NzhmlUuBukMa3
   c5cGSIa45N8/JeTFfIvvEK2kmdcSS93PItDamj8rCssY+zN9KnK0GAUcr
   YHPLkBpyoxBRB7xMFXRtfar9jYCeU3zDFL+LdnZEP1BDuyRsPHpObr/pP
   uqWkGCEI9je/6iNwwv5lvxowyVs0kktprceX8HDTMOFSf8yg7Iq/JHU47
   OiFE24RX+tcDKD+sbxSdqLL9iD5mBRTRGi1WRt49phi3yKT97o29X2UQO
   w==;
X-CSE-ConnectionGUID: ohg7gR0oSoWaV1lvpxntIQ==
X-CSE-MsgGUID: 31UPJw6dT4OzwKkgsnQQMg==
X-IronPort-AV: E=McAfee;i="6700,10204,11108"; a="19632948"
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="19632948"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 05:11:00 -0700
X-CSE-ConnectionGUID: qziVTCdwTSugh9gtsTWKPQ==
X-CSE-MsgGUID: Gg/uw8eORPmixavddrpmXw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,252,1712646000"; 
   d="scan'208";a="46672742"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 20 Jun 2024 05:10:59 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKGcz-0007aU-0s;
	Thu, 20 Jun 2024 12:10:57 +0000
Date: Thu, 20 Jun 2024 20:10:20 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/000-devicetree 81/184]
 arch/arm64/boot/dts/apple/t602x-common.dtsi:573.28-576.5: Warning
 (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or
 ranges property, but no unit name
Message-ID: <202406201932.8AN4lzh7-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/AsahiLinux/linux bits/000-devicetree
head:   1f815c7efb1b452e1f6f3aaaa42b958383f44076
commit: 87d8ffbd5bb8f0a5e8fe2033790882065cb64f98 [81/184] arm64: dts: apple: Add initial t6022 support
config: arm64-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240620/202406201932.8AN4lzh7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240620/202406201932.8AN4lzh7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406201932.8AN4lzh7-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t602x-common.dtsi:573.28-576.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t602x-common.dtsi:578.34-581.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t602x-common.dtsi:583.22-586.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:294.14-310.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:312.14-321.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:323.29-328.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
>> arch/arm64/boot/dts/apple/t602x-common.dtsi:573.28-576.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t602x-common.dtsi:578.34-581.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t602x-common.dtsi:583.22-586.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:403.14-426.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:428.14-437.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:323.29-328.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'

vim +573 arch/arm64/boot/dts/apple/t602x-common.dtsi

 > 573			uat_handoff: uat-handoff {
   574				reg = <0 0 0 0>;
   575				no-map;
   576			};
   577	
 > 578			uat_pagetables: uat-pagetables {
   579				reg = <0 0 0 0>;
   580				no-map;
   581			};
   582	
 > 583			uat_ttbs: uat-ttbs {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
