Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 254023E487
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jun 2024 21:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718661133; cv=none; b=Na2j5A9obSZr2tveRauqXCngOO4js57PxMV0lV5OZIgOpB0mup1/zna1Vc1Ec4NEPpkK3RdoiyuDUb713EaqatsSg5spIyzFk8lxvu7w+CngfRCzD4sTWiPx4pZzg+s22jxZ6SWxkNGB/bckrAT4+m4oBCDnIk0AZNVTWfJlAIk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718661133; c=relaxed/simple;
	bh=2ZNKmFAtPpC69voziYQwtvE5sCKOzU72oRdkS2ZwCY4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nyyt0zXnH+u+j05nutMOv6gvGMOLP924UyI9IC9RuorAE2z/dTXiG845vYwrgXwkg2HZlsLV2pS5rMtdhbTyI+Pe5+JPq17MIVCOpzDw5cqeoe+ZDDAaDNDXQvt/d5HnPC10UbavTD+zZFt+yHT2jmVgFBgsfu3NES7zRuAZyrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CRv8xhWX; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CRv8xhWX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718661132; x=1750197132;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2ZNKmFAtPpC69voziYQwtvE5sCKOzU72oRdkS2ZwCY4=;
  b=CRv8xhWXpO3cZyCnLDJ/cnZqT8wkNdHGsEYGpVlti4QieXnrMSGr2DXt
   MckqAmzFzN3FVSaoXOIgmUifgbtDF0tlJ27gzKVkTE2NEEzrKiyOcC/q3
   upJN7IZ78HMG3dgGRR6LB2taZDhhWt1dKxqTZPAJRsWgJrqWIjQpWI7+d
   Y4o4EBxT9VYGnVsS1J6Uor3hPYcJX8SzsYioA/TRyuOpivaM+XbNyLjH1
   G55V2rEJp3/NP9aiMmGvIhNmdZqAEfIyf8XhSztDzuJU60aK7a0BxpEMx
   dBNvD3xSyXGcJu5S7h0NR+eLyv4I5uATdN92j5ywzYdT1LPDaoiyjBI4J
   A==;
X-CSE-ConnectionGUID: EcW9JKRBQaSrJG2fXLzxsg==
X-CSE-MsgGUID: G/QDLx+2TiyODvtZ6TQVYg==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="33047214"
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="33047214"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 14:52:09 -0700
X-CSE-ConnectionGUID: EpVw3IIyQgG4pWgBl+GjcA==
X-CSE-MsgGUID: RULaImLLRhO6IMO7tJMzyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,245,1712646000"; 
   d="scan'208";a="41439881"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jun 2024 14:52:08 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJKGj-0004uh-2D;
	Mon, 17 Jun 2024 21:52:05 +0000
Date: Tue, 18 Jun 2024 05:52:01 +0800
From: kernel test robot <lkp@intel.com>
To: Asahi Lina <lina@asahilina.net>
Cc: oe-kbuild-all@lists.linux.dev, Janne Grunau <j@jannau.net>
Subject: [asahilinux:bits/000-devicetree 50/184]
 arch/arm64/boot/dts/apple/t600x-common.dtsi:441.28-443.5: Warning
 (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or
 ranges property, but no unit name
Message-ID: <202406180525.lGBcRDMt-lkp@intel.com>
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
commit: c6899f3876c3fc017186b026f62b73fa8bceb22d [50/184] arm64: dts: Add t600x GPU nodes
config: arm64-randconfig-001-20240607 (https://download.01.org/0day-ci/archive/20240618/202406180525.lGBcRDMt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406180525.lGBcRDMt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406180525.lGBcRDMt-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/apple/t600x-common.dtsi:441.28-443.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t600x-common.dtsi:445.34-447.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t600x-common.dtsi:449.22-451.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:292.14-308.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:310.14-319.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:230.29-235.4: Warning (simple_bus_reg): /soc@200000000/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:137.42-140.7: Warning (unique_unit_address_if_enabled): /soc@200000000/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc@200000000/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
>> arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
>> arch/arm64/boot/dts/apple/t600x-common.dtsi:441.28-443.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t600x-common.dtsi:445.34-447.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t600x-common.dtsi:449.22-451.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:402.14-425.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j314-j316.dtsi:427.14-436.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:230.29-235.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:137.42-140.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
>> arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
--
>> arch/arm64/boot/dts/apple/t600x-common.dtsi:441.28-443.5: Warning (unit_address_vs_reg): /reserved-memory/uat-handoff: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t600x-common.dtsi:445.34-447.5: Warning (unit_address_vs_reg): /reserved-memory/uat-pagetables: node has a reg or ranges property, but no unit name
>> arch/arm64/boot/dts/apple/t600x-common.dtsi:449.22-451.5: Warning (unit_address_vs_reg): /reserved-memory/uat-ttbs: node has a reg or ranges property, but no unit name
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:292.14-308.5: Warning (unit_address_vs_reg): /sound/dai-link@0: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-j375.dtsi:310.14-319.5: Warning (unit_address_vs_reg): /sound/dai-link@1: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:230.29-235.4: Warning (simple_bus_reg): /soc/display-subsystem: missing or empty reg/ranges property
   arch/arm64/boot/dts/apple/t600x-die0.dtsi:137.42-140.7: Warning (unique_unit_address_if_enabled): /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/boot-error-count@2: duplicate unit-address (also used in node /soc/spmi@2920a1300/pmu@f/legacy_nvmem@6000/panic-count@2)
>> arch/arm64/boot/dts/apple/t600x-common.dtsi:14.10-16.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'

vim +441 arch/arm64/boot/dts/apple/t600x-common.dtsi

 > 441			uat_handoff: uat-handoff {
   442				reg = <0 0 0 0>;
   443			};
   444	
 > 445			uat_pagetables: uat-pagetables {
   446				reg = <0 0 0 0>;
   447			};
   448	
 > 449			uat_ttbs: uat-ttbs {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
