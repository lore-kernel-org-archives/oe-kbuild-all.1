Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63F8412C498
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Jun 2024 06:45:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718952354; cv=none; b=Yvp22hjBSb21uCs69QtBFqjWjfapXlN275MBQWt9VVekU75eYYLEgR4hpGf8KZvJBHNldMKw9eDjLxgvivtfmUPRHwVzVXjl65eZ06xPAdZblHhNRLMAPRNH2kmbsWJOlrxQA9mcPpGacu373DUuDjsESmNic2mTbhUVhY5PL2s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718952354; c=relaxed/simple;
	bh=6VaR9qGwVZkxnzUAAYhAY+AY6Qnv3N8ZFxrLMYNAAZY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lzE+woQISWkzN2CMheZmYCQ6iXdyvWxDiLptKjMjltGjQWH2DBore8+UDkukkLI9SN2fH2oGW9LWBS728W4MuuKvzmouM1GBXNba/96rzfMBRs9Uv42nd5Kp7xddf27FIf1HeRHIhxqIoR51beVIMx4UCIExy+tHZMlndWRzhyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kaOPazvL; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kaOPazvL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718952353; x=1750488353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=6VaR9qGwVZkxnzUAAYhAY+AY6Qnv3N8ZFxrLMYNAAZY=;
  b=kaOPazvLLfsJp+ZTp0tXHRNVr81avdCsoC9ykmulbB9zF2EZ4ySN13mS
   L/toS0vOG8nSCg8b86fbem6NXkX+yYNwNEoRDH5NvhF4mMmL6sHDjPmhr
   XB+qdsoOKcjYEY3A4SFhUkOg2f/eUq4AV99XwQCqfOehOIFATdW8LCwwx
   sViKItSB1j6i+VwH/KcgZ5ve3w2Zop1+/wDA5exHkVqJ79lY1O4JbYmMj
   dEzxtKbQ7m3sC1CA88kVntyfxoVh8qPNVFqKR0WYqDF2dhHXRlEpP2e5t
   2ROH3gZPXqfA7v85G5RrmSuuflBbThYOOU6LT0kk28cRgwtosMM7nuzaw
   w==;
X-CSE-ConnectionGUID: RtG2ZikjR0Cd10tR7rw/2Q==
X-CSE-MsgGUID: ZN7UfuJSRZGIEG5eW85RkA==
X-IronPort-AV: E=McAfee;i="6700,10204,11109"; a="16112979"
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="16112979"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2024 23:45:52 -0700
X-CSE-ConnectionGUID: iwKFpjfUQ9mhyzLw44D3ig==
X-CSE-MsgGUID: Jw6sXk2xQ669pR1qIURAaw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,253,1712646000"; 
   d="scan'208";a="47020391"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 20 Jun 2024 23:45:50 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sKY1s-0008Ie-0M;
	Fri, 21 Jun 2024 06:45:48 +0000
Date: Fri, 21 Jun 2024 14:45:06 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/000-devicetree 105/184]
 arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning
 (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges
 property, but no unit name
Message-ID: <202406211404.sKKxVnVg-lkp@intel.com>
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
commit: 52edad018f60b03d03b158825bbe928343a1b7a2 [105/184] arm64: dts: ISP platform configs
config: arm64-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240621/202406211404.sKKxVnVg-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240621/202406211404.sKKxVnVg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406211404.sKKxVnVg-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:439.28-442.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:444.34-447.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-common.dtsi:449.22-452.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:403.14-426.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:428.14-437.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:243.29-248.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:147.42-150.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/arm64/boot/dts/apple/t8103.dtsi:414.28-417.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:419.34-422.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:424.22-427.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j313.dts:123.14-140.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j313.dts:142.14-151.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:604.30-609.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:1013.43-1016.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/arm64/boot/dts/apple/t602x-common.dtsi:573.28-576.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t602x-common.dtsi:578.34-581.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t602x-common.dtsi:583.22-586.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:403.14-426.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:428.14-437.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:377.29-382.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@39b104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t602x-die0.dtsi:91.42-94.7: Warning (unique_unit_address_if_enabled): /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@29e114000/pmu@f/legacy_nvmem@6000/panic-count@2)
   arch/arm64/boot/dts/apple/t602x-common.dtsi:12.10-14.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/arm64/boot/dts/apple/t8103.dtsi:414.28-417.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:419.34-422.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:424.22-427.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j293.dts:179.14-198.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103-j293.dts:200.14-209.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:604.30-609.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:1013.43-1016.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/arm64/boot/dts/apple/t8112.dtsi:455.28-458.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:460.34-463.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:465.22-468.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j413.dts:156.14-175.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j413.dts:177.14-186.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:698.30-704.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:1009.28-1085.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:1049.43-1052.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/arm64/boot/dts/apple/t8112.dtsi:455.28-458.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:460.34-463.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:465.22-468.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j415.dts:168.14-191.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j415.dts:193.14-202.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:698.30-704.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:1009.28-1085.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:1049.43-1052.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/arm64/boot/dts/apple/t8112.dtsi:455.28-458.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:460.34-463.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112.dtsi:465.22-468.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8112-j493.dts:160.14-179.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112-j493.dts:181.14-190.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:698.30-704.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t8112.dtsi:1009.28-1085.5: Warning (simple_bus_reg): /soc/spmi@23d0d9300: simple-bus unit address format error, expected "23d714000"
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8112.dtsi:1049.43-1052.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@e/legacy_nvmem@f700/panic-count@2)
   arch/arm64/boot/dts/apple/t8112.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/arm64/boot/dts/apple/t8103.dtsi:414.28-417.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:419.34-422.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:424.22-427.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j457.dts:91.14-100.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:604.30-609.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:1013.43-1016.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
   arch/arm64/boot/dts/apple/t8103.dtsi:414.28-417.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:419.34-422.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103.dtsi:424.22-427.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/isp-common.dtsi:18.22-23.5: Warning (unit_address_vs_reg): /reserved-memory/isp-heap: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t8103-j456.dts:118.14-127.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t8103.dtsi:604.30-609.5: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/spi1-nvram.dtsi:12.10-31.4: Warning (avoid_unnecessary_addr_size): /soc/spi@235104000/flash@0: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/apple/t8103.dtsi:1013.43-1016.8: Warning (unique_unit_address_if_enabled): /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@23d0d9300/pmu@f/legacy_nvmem@9f00/panic-count@2)
   arch/arm64/boot/dts/apple/t8103.dtsi:23.10-25.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'

vim +18 arch/arm64/boot/dts/apple/isp-common.dtsi

  > 18			isp_heap: isp-heap {
    19				compatible = "apple,asc-mem";
    20				/* Filled in by bootloder */
    21				reg = <0 0 0 0>;
    22				no-map;
    23			};
    24		};
    25	};
    26	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
