Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1CDB202F6B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 17:32:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729272778; cv=none; b=KRSUoZ9CKqjsb/qiEXV9DCOzlkoL/tvf6oSaeUdxUnsb9qlZAKqzUPNdiL8ZKeds5BC6tB5c0LFxVrqGw99I1dIxd+tDfIZjh8dVmKeNu58D2AgS/LfbnvlhmqBH9G133pjfHSu5z4jkg7gbdob7r1pFBt0V6zlKgl9fIdXOddg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729272778; c=relaxed/simple;
	bh=9LNeApXDokrJWv7AMWHHEpu6ejorFGFZNWgMuEHVaNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dR9YR6IxfPZuZOvs+zfb6FDtW/acull5R/FYmhatCspNZHPW6N/6DlFJMjwqiFnDCKvqS697vhkLn5xCJTrrSZPMoSqts666TDV5UUImjvrR2ysD4QriJva+TUpr3qWD/Ik4C87qWcWq3DWN/0vGx4ZVWya7erDC1IxNUGq3Ihg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f7noJkMH; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f7noJkMH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729272775; x=1760808775;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9LNeApXDokrJWv7AMWHHEpu6ejorFGFZNWgMuEHVaNI=;
  b=f7noJkMHz4cRHY5aaWovDSJ+aAPnRcQdHEL2zq29RDJQI7NIZu+2hzux
   YdPczLWXhZ7+0najxDqEFhCUXxeV6iS5rLKSZuXiPZkeoq809SqO0Z32u
   BqDXStittRONbotv290AUJQ7LpHtnlVR9sxZfw2ucNwFXViSQBsAe6rAL
   7cnbNBdf5SyocdNrkMPVLb89NrPrmeCTfXWe2vq+uF2z7khr0deeOpw8q
   jFGVUNV+gq1m9DUCUKwogKZ/D41Vgf6KVV4yv3JOhlO3WnGJMHgVJck8D
   YaUSFWdOZoEPzcSseuZtco+PmGbQcrSQ0635eacDQ29NnabGLOm0FrluF
   w==;
X-CSE-ConnectionGUID: GQXAKYL2Qri7QzkG9F1nJQ==
X-CSE-MsgGUID: 8cJ722NVRw+urMGJ9duQRg==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="31676769"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="31676769"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 10:32:55 -0700
X-CSE-ConnectionGUID: dlPR0JVGSzqhKj4mhDvbNQ==
X-CSE-MsgGUID: Pla6pZLOR3WtXMEa0mlGMw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="78586916"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 18 Oct 2024 10:32:53 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1qqJ-000O89-1k;
	Fri, 18 Oct 2024 17:32:51 +0000
Date: Sat, 19 Oct 2024 01:32:05 +0800
From: kernel test robot <lkp@intel.com>
To: Tomer Maimon <tmaimon77@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>
Subject: [linux-next:master 5484/5686]
 arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb:
 reset-controller@f0801000: '#clock-cells' is a required property
Message-ID: <202410190152.iwHBLBBR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   f2493655d2d3d5c6958ed996b043c821c23ae8d3
commit: d62f45b5e95fa9e557af071915a3fbfa0d766c8f [5484/5686] dt-bindings: reset: npcm: add clock properties
config: arm64-randconfig-051-20241018 (https://download.01.org/0day-ci/archive/20241019/202410190152.iwHBLBBR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
dtschema version: 2024.10.dev6+g12c3cd5
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190152.iwHBLBBR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190152.iwHBLBBR-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi:63.7-177.5: Warning (simple_bus_reg): /ahb/apb: simple-bus unit address format error, expected "f0000000"
   arch/arm64/boot/dts/nuvoton/nuvoton-common-npcm8xx.dtsi:50.35-55.5: Warning (unique_unit_address_if_enabled): /ahb/reset-controller@f0801000: duplicate unit-address (also used in node /ahb/clock-controller@f0801000)
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /: memory@0: 'device_type' is a required property
   	from schema $id: http://devicetree.org/schemas/memory.yaml#
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: system-controller@f0800000: compatible: ['nuvoton,npcm845-gcr', 'syscon'] is too short
   	from schema $id: http://devicetree.org/schemas/soc/nuvoton/nuvoton,npcm-gcr.yaml#
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: interrupt-controller@dfff9000: 'ppi-partitions' does not match any of the regexes: '^v2m@[0-9a-f]+$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/interrupt-controller/arm,gic.yaml#
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: ahb: apb:ranges: [[0, 0, 4026531840, 3145728], [4293918720, 0, 4293918720, 90112]] is not of type 'boolean'
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: reset-controller@f0801000: '#clock-cells' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/nuvoton,npcm750-reset.yaml#
>> arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: reset-controller@f0801000: 'clocks' is a required property
   	from schema $id: http://devicetree.org/schemas/reset/nuvoton,npcm750-reset.yaml#
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: timer@8000: 'clock-names' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/timer/nuvoton,npcm7xx-timer.yaml#
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@801c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@801c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@901c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@901c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@a01c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']
   arch/arm64/boot/dts/nuvoton/nuvoton-npcm845-evb.dtb: /ahb/apb/watchdog@a01c: failed to match any schema with compatible: ['nuvoton,npcm845-wdt', 'nuvoton,npcm750-wdt']

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
