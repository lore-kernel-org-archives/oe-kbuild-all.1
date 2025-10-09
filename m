Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31CD02557A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Oct 2025 16:26:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760027220; cv=none; b=Fxik70kr8epMkmrXZU15JESzHoFQEwfZmwd69PZ4fzx6qT04vKXsz49+zybmL+1bY8CDAAYeGyL/28Py8rz562ZVZSYvoIZtX1wfCNAC1KMvM6Fvo+PgbBqQieWEnOzZCT4HbTsnhr+z/B7ZwzKdhTYIkBmuXMlgVeHy742iHBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760027220; c=relaxed/simple;
	bh=g2oqdqlqWY3Tnse2jZAnfBu+Izc2fMxe4PClnLWwO1g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P/Ggl8B7539ne8baZ/FXRri6cQq57Kg27aFLgogaANhJcw6/N2oFGnoer0pNMFQ5L1JFiMdlB+6U/Zf2ZZvt3znmvcDsaEgxA/eJTvTWsofHZzTzXVZKYTLrqfMwAjzDC0lA6GSm4OQb/3VEsT9ZCVoIIXSrkUKd4/C67p/n+qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ief6DKHG; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ief6DKHG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760027218; x=1791563218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g2oqdqlqWY3Tnse2jZAnfBu+Izc2fMxe4PClnLWwO1g=;
  b=ief6DKHGE/lcEUE/LCAg6+fYSRmT6jfE+67KOX/HQxFnBJYXBCOCZuNn
   5aazbSB1QFlcxPQA10MqMFoCC3iZITjX55Cx2djEAMfy+79929rNwq743
   /i/k2Cvxky2tv67caQUKxR+xRXfwJYl79P2n50jnaOY1VgiL7iwAJP+C0
   bqQNTymETTk3s6D2FAbuGMwOluB7waY+zM4EGHkIjvtTFh9EWu0TP3vk0
   IQ8slE68kFA37kJ08EO2Gx7C4VzXHFxwnKN73V0KVi1epnoVkFTIlxhpt
   mjHZxM2sYWfElcV65xaRDBxWAzxOav75tbya+ls52KwlYqQz3w/qzHPjS
   Q==;
X-CSE-ConnectionGUID: +U8yPc0tRgeLyPQHF9f3Bg==
X-CSE-MsgGUID: l6suSwVLQfykJWm0Mf52aQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11577"; a="66098386"
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="66098386"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2025 09:26:57 -0700
X-CSE-ConnectionGUID: 2Xm3o9rmQPSaftDUvucRfQ==
X-CSE-MsgGUID: nXap25eDQ+OPdQTMIj71mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,216,1754982000"; 
   d="scan'208";a="185008418"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 09 Oct 2025 09:26:56 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v6tTh-0000zx-2z;
	Thu, 09 Oct 2025 16:26:53 +0000
Date: Fri, 10 Oct 2025 00:26:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.6 166/166]
 arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to
 match any schema with compatible: ['google,anakin-sku1',
 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8',
 'google,anakin-sku256', 'google,anakin-sku257', 'google,...
Message-ID: <202510100034.SzctP2hH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.6
head:   b37aa2a44e84f0b711eb5d734fcaea671290ad7f
commit: 71a95bf6a74088803e70511466fde6cf60d8eefd [166/166] CHROMIUM: arm64: dts: mt8189-skywalker-anakin: Change skuid for none touch skuid
config: arm64-randconfig-051-20251009 (https://download.01.org/0day-ci/archive/20251010/202510100034.SzctP2hH-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
dtschema version: 2025.9.dev1+g4b28bc79f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510100034.SzctP2hH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510100034.SzctP2hH-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   	'google,elm-rev4' was expected
   	'google,hana' was expected
   	'google,chinchou' was expected
   	'google,chinchou-sku17' was expected
   	'google,elm-rev3' was expected
   	'google,chinchou-sku20' was expected
   	'google,elm' was expected
   	'google,chinchou-sku22' was expected
   	'google,chinchou-sku23' was expected
   	from schema $id: http://devicetree.org/schemas/arm/mediatek.yaml#
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
>> arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /: failed to match any schema with compatible: ['google,anakin-sku1', 'google,anakin-sku2', 'google,anakin-sku5', 'google,anakin-sku8', 'google,anakin-sku256', 'google,anakin-sku257', 'google,anakin-sku258', 'google,anakin-sku259', 'google,anakin-sku260', 'google,anakin-sku261', 'google,anakin-sku262', 'google,anakin-sku263', 'google,anakin-sku264', 'google,anakin-sku265', 'google,anakin-sku266', 'google,anakin-sku267', 'google,anakin-sku2147483647', 'google,anakin', 'mediatek,mt8189']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: scmi (arm,scmi): 'protocol@80' does not match any of the regexes: '^pinctrl-[0-9]+$'
   	from schema $id: http://devicetree.org/schemas/firmware/arm,scmi.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: /wl-info@c2bf090: failed to match any schema with compatible: ['mediatek,wl-info']
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: soc (simple-bus): opp-table-gpu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: soc (simple-bus): thermal-zones: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: soc (simple-bus): emiisu: 'ranges' is a required property
   	from schema $id: http://devicetree.org/schemas/simple-bus.yaml#
   arch/arm64/boot/dts/mediatek/mt8189-skywalker-anakin-sku1.dtb: soc (simple-bus): sound: 'ranges' is a required property

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
