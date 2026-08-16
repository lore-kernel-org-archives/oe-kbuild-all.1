Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9A411ADFE4
	for <oe-kbuild-all@lists.linux.dev>; Sun, 16 Aug 2026 13:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786886904; cv=none; b=ffhY2z0L0pQFA5ilqPHBXuLWgEt+W8G0WPvb9ECmumCnLwELEko/r/t8XiXY0E6whDVl0M79sWzLIJ1Z34FiQPemg4N9PtzgPJBsHKcZHwXHK+JP8tknX4Ffnc1wpn2fmvbxC6GQ7o8Sr0qpirMMvdqFF6rHurcz1lGdCKOcljs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786886904; c=relaxed/simple;
	bh=iZH5iO7FOGLil1EEd3PKB4Q0LSU7bMMiJcu3o089IHU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=FNQAMA87465kC5HBoVqTqQHuYRBgTCzgL4MSx/kycbfAWnBAK0D2HVspo92fNqRAAZ1rBi/N40BEmyQ85lIPdEM45ZdTnFJPOwy9O8KreiTwslQb9VNJda67vIBr3v0Z5RZulAF2ZBh4mrH5cNAkjmHpE49CKv7E5/8QIEkCDV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Tt4dMhxb; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Tt4dMhxb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786886903; x=1818422903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iZH5iO7FOGLil1EEd3PKB4Q0LSU7bMMiJcu3o089IHU=;
  b=Tt4dMhxb8u8j8jDmfIxbvg8zne+aZTSFojb0YkkB5xF3YhNjrnK1EXD3
   kisQShEKxPohUr1Rm8UA2lL32O4nlJ82JT1GejhzorAwxtPS680+16a3a
   aBSwc17cZoWttFXEny2A1QfX3I7PkFMsXSpGPPvXR/ZPk7OozYHP/k9xa
   z/y/m6ZWeo7zx9JxQBoBmM+mtaPughjWGx/oxGwtbjcSmpLpGVxr9MEjo
   jz02RF6z2D+tdrczURxtzp95nuov/kwB5JxxUV3nBXdlVEbZ2viZGbd94
   jODggry+Gw/eRqEHNKjw7BJULHcZqGRHOworDECGITF/VAI/Iz7b+Xakm
   A==;
X-CSE-ConnectionGUID: 6/8r8bYcQIKc8GROOiLExQ==
X-CSE-MsgGUID: JB5uD/IhS0aXp+zWfyd0MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11876"; a="91256561"
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="91256561"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Aug 2026 06:28:20 -0700
X-CSE-ConnectionGUID: YALWJeE3R6KzMFJG3KbKIg==
X-CSE-MsgGUID: Hlh5j8iARHqh5Sq0k/U7CQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,227,1779174000"; 
   d="scan'208";a="265281189"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa009.jf.intel.com with ESMTP; 16 Aug 2026 06:28:19 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wvauO-000000006aj-3S3o;
	Sun, 16 Aug 2026 13:28:16 +0000
Date: Sun, 16 Aug 2026 15:27:50 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 6245/15435]
 arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: ethernet-phy@0
 (ethernet-phy-ieee802.3-c22): marvell,reg-init:
 =?us-ascii?Q?b'\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x0?=
 =?us-ascii?Q?0D\x15\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x?=
 =?us-ascii?Q?00\x00w'?= is not of type...
Message-ID: <202608161501.MjetF8iV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   4477a78374a57c3809b172ad30cceabda48c47c6
commit: 09ea402c1c2c5f6bf6ef7b0f00045f91b5e8e926 [6245/15435] ARM: dts: ls1021a-moxa-uc-8410a: use compatible string ethernet-phy-ieee802.3-c22
config: arm-randconfig-2051-20260814 (https://download.01.org/0day-ci/archive/20260816/202608161501.MjetF8iV-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project daa9d09970fed49996f42a8f7000b584f295991d)
dtschema: 2026.7.dev15+g01b5073ab
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260816/202608161501.MjetF8iV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608161501.MjetF8iV-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:844.4-847.32: Warning (interrupt_map): /soc/pcie@3500000:interrupt-map: Missing property '#address-cells' in node /soc/interrupt-controller@1401000, using 0 as fallback
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:14.10-27.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:14.10-27.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/nxp/ls/ls1021a.dtsi:14.10-27.4: Warning (alias_paths): /aliases: aliases property name must include only lowercase and '-'
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: aliases: 'enet0_rgmii_phy', 'enet1_rgmii_phy', 'enet2_rgmii_phy' do not match any of the regexes: '^[a-z][a-z0-9\\-]*$', '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/aliases.yaml
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: /soc/spi@1550000/flash@0: failed to match any schema with compatible: ['spansion,s25fl064l', 'spansion,s25fl164k']
>> arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: ethernet-phy@0 (ethernet-phy-ieee802.3-c22): marvell,reg-init: b'\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00D\x15\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00w' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: ethernet-phy@1 (ethernet-phy-ieee802.3-c22): marvell,reg-init: b'\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00D\x15\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00w' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: ethernet-phy@2 (ethernet-phy-ieee802.3-c22): marvell,reg-init: b'\x00\x00\x00\x03\x00\x00\x00\x11\x00\x00\x00\x00\x00\x00D\x15\x00\x00\x00\x03\x00\x00\x00\x10\x00\x00\x00\x00\x00\x00\x00w' is not of type 'object', 'integer', 'array', 'boolean', 'null'
   	from schema $id: http://devicetree.org/schemas/dt-core.yaml
   arch/arm/boot/dts/nxp/ls/ls1021a-moxa-uc-8410a.dtb: gpio-keys (gpio-keys): pushbtn-key: Unevaluated properties are not allowed ('default-state' was unexpected)
   	from schema $id: http://devicetree.org/schemas/input/gpio-keys.yaml

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
