Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A584A1C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Jun 2024 02:10:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718763039; cv=none; b=tKMgQJLTTQoq4QxC6U7QqZZbRHHeTY/YuZM97MB471AV/JmajK9zhS7tJsuLHFaCsbutbjbz5WvrHcQwi8uMeduVvDwGX7GbDtEapu5O93ZPBQkU96XEfgn6jBVm8IlP6oU4Rx2CcW64YQMXfVQ9rcZiY4e//v97gtsq5jFJtH8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718763039; c=relaxed/simple;
	bh=rfiTnliZ1YjUfv9/Wud53ib3tMGmerY1IbAmg0sizhk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JxptqIOOjTSKkaWcQCZNgO0sntEJfibyz0EBeMBZI93UnV6DkclIzrNFMnw4tiyKQIU9WmMrjrdW5y5EsJ39MsTE/VP2lGUWM30AxRgHZn9tLjCH3CCSFlMTo9Mh1FGAmevkImnPOLmB3dFyC8XhSZTRcMSyaENxkyYgy7Aa2Cw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U4ucezKG; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U4ucezKG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718763037; x=1750299037;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rfiTnliZ1YjUfv9/Wud53ib3tMGmerY1IbAmg0sizhk=;
  b=U4ucezKGlLjwNhaaYqGeaZPtSznLl3kJ46D5z1pdEcGB47EnvwWC5fyz
   7xDpT/x47iOBsgX4h7nMHHmUBYTP3O61mgIltOAXd8Ucn3vwL3Iqc5Ukc
   UZjPWwuoLDKFi6hT5FHo0dzpzSmpvhFnxr5ox1ycy5d7cjx55FNCLti+l
   He5KXVg3SLnRf9x7UwehHF7nUjN8V1QxqAQoVKJ3O8X4WJ5I9ZjH8oK1O
   9xK+yqq7QzrZeX0Y5Wc8fYLRywVncGS/RpyHoZvlNqVawIx/3EROor7a2
   zHJI0bzw67PIoqCTR0Fy3JMzUSWBuMeGKLqxnHZIjpiKX0sn/FKkz4Q/X
   g==;
X-CSE-ConnectionGUID: yZDLiOGKRm2Mflwv764JLQ==
X-CSE-MsgGUID: tB8sJgeqTJiQnjhKyGKdmA==
X-IronPort-AV: E=McAfee;i="6700,10204,11107"; a="18594923"
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="18594923"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Jun 2024 19:10:37 -0700
X-CSE-ConnectionGUID: BPQAYRiiTIqzIkPhPeyMdw==
X-CSE-MsgGUID: YgDo3JZuTHOHKadHlrZ7Sg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,249,1712646000"; 
   d="scan'208";a="72962900"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Jun 2024 19:10:37 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJkmP-0006A6-32;
	Wed, 19 Jun 2024 02:10:33 +0000
Date: Wed, 19 Jun 2024 10:10:32 +0800
From: kernel test robot <lkp@intel.com>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/000-devicetree 57/184]
 arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning
 (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary
 #address-cells/#size-cells without "ranges" or child "reg" property
Message-ID: <202406190956.PesSpAoH-lkp@intel.com>
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
commit: 76fcc1fe4e659157e32f730e07854dd32122afc2 [57/184] arm64: dts: apple: t8112: Add the NVRAM bindings
config: arm64-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240619/202406190956.PesSpAoH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240619/202406190956.PesSpAoH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406190956.PesSpAoH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t8112.dtsi:434.28-437.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:439.34-442.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:444.22-447.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j413.dts:155.14-174.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j413.dts:176.14-185.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:596.30-602.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:907.28-983.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
>> arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:947.43-950.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/arm64/boot/dts/apple/t8112.dtsi:434.28-437.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:439.34-442.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:444.22-447.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j493.dts:143.14-162.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j493.dts:164.14-173.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:596.30-602.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:907.28-983.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
>> arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:947.43-950.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/arm64/boot/dts/apple/t8112.dtsi:434.28-437.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:439.34-442.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:444.22-447.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j473.dts:115.14-124.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j473.dts:126.14-135.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:596.30-602.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:907.28-983.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
>> arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:947.43-950.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'

vim +12 arch/arm64/boot/dts/apple/spi1-nvram.dtsi

e7fe0a9e6aea65 Janne Grunau 2023-09-30 @12  	flash@0 {

:::::: The code at line 12 was first introduced by commit
:::::: e7fe0a9e6aea65542229272f8108330dbb75b319 arch: arm64: apple: Add spi1-nvram.dtsi

:::::: TO: Janne Grunau <j@jannau.net>
:::::: CC: Janne Grunau <j@jannau.net>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
