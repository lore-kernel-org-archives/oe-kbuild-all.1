Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6BAD3EBF3A
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 Jan 2026 08:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769244178; cv=none; b=kcib4Qr1mz6+dvMgVtQtuKzfOqkLxcwmrUxCn/ch+A4iTJ0VwJPhI7tYk6u4/UCP5D58I6nrKjmhenTmjLen65hdLLBjiyx4CAnpkBMDd/GaPQ7khfGKKnhIep4Fy9Ht8l0J2Qc3FQKhLdDnWFjhTeddkG3nJ4LHz+8FJiE8OlE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769244178; c=relaxed/simple;
	bh=yTzAcUOFX718h0YQtiRuywSPEFD91trhY+MwL1uUqIE=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UD4oHju2Csl6TmrS5nvVVQdzyk8RDAwz5AqnM2+WQY9WFtq15lHCxOrYFet1MyoxRuaGT2o2oGLQGKOYIDDYyf9xt3aYsIV68MLZMAG6mD6iV5ezwTp8CB6DMuEbY3Kes/jrYx+QCcw4Ft3mi9Dlnaqef3B/WqIrBrSMxxtr3KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mVuaeLct; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mVuaeLct"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769244176; x=1800780176;
  h=date:from:to:cc:subject:message-id;
  bh=yTzAcUOFX718h0YQtiRuywSPEFD91trhY+MwL1uUqIE=;
  b=mVuaeLctd986hx0YSrDSHuaMjEGSocPt1YyI83Pw/TA9SY7mLjNjvKEc
   493fq5qAZWjPA1/+oDwzTOJbfEx3GldMq2/eR+Dj4KIChETuGZ5KyHV2G
   kzqP1TN3K5U9icxEwxOP4ojqHYtdfuNiBOh6VtxdO1NUtPhYpGVr6fjBi
   xy89JAJN3WJt5a+uXp8ri4fmMy2GYOoxl8U4VUQ6Krhgx7mLuN8fDPJp7
   uYmAJU9cV+/M9kbrpBrdySOQG4a2ECTU0FfzYIWq4m2Z9XKfoBTYSkwot
   o+bhmNQ/93bdJ6quHKUFOHIjkWAQg+qeplTEFXycbu2ROicXNULS34kh/
   g==;
X-CSE-ConnectionGUID: mdVmFF2HRpWHsYXJCK15Qw==
X-CSE-MsgGUID: Z4kDTiePSoWkOKt7FIsjpg==
X-IronPort-AV: E=McAfee;i="6800,10657,11680"; a="95949292"
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="95949292"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jan 2026 00:42:55 -0800
X-CSE-ConnectionGUID: 99CSozxtTOemUXusR2qy1A==
X-CSE-MsgGUID: DQ73gkt7Ql+DqvN5ChnJdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,250,1763452800"; 
   d="scan'208";a="206483823"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 24 Jan 2026 00:42:54 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vjZEJ-000000000vf-0oHn;
	Sat, 24 Jan 2026 08:42:51 +0000
Date: Sat, 24 Jan 2026 09:42:37 +0100
From: kernel test robot <lkp@intel.com>
To: Elad Nachman <enachman@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev,
 Gregory CLEMENT <gregory.clement@bootlin.com>
Subject: [linux-next:master 9298/9539]
 arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: /
 (marvell,armada7020-falcon-carrier): compatible: 'oneOf' conditional failed,
 one must be fixed:
Message-ID: <202601240905.EX7OdRmb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   ca3a02fda4da8e2c1cb6baee5d72352e9e2cfaea
commit: b3370479a5f7edf4baf0e307f1163f8fe9e09e17 [9298/9539] arm64: dts: a7k: add COM Express boards
config: arm64-randconfig-2052-20260123 (https://download.01.org/0day-ci/archive/20260124/202601240905.EX7OdRmb-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
dtschema version: 2025.13.dev4+g85cec3155
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260124/202601240905.EX7OdRmb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601240905.EX7OdRmb-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/marvell/armada-ap80x.dtsi:282.24-292.7: Warning (unit_address_vs_reg): /soc/bus@f0000000/system-controller@6f4000/gpio@1040: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:236.24-255.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@100: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/marvell/armada-cp11x.dtsi:257.24-276.6: Warning (unit_address_vs_reg): /cp0-bus/bus@f2000000/system-controller@440000/gpio@140: node has a unit name, but no reg or ranges property
>> arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: / (marvell,armada7020-falcon-carrier): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada7020-falcon-carrier', 'marvell,db-falcon-carrier', 'marvell,armada7020-cpu-module', 'marvell,armada7020', 'marvell,armada-ap806-dual', 'marvell,armada-ap806'] is too long
   	'marvell,armada7020' was expected
   	'marvell,armada7020-falcon-carrier' is not one of ['globalscale,mochabin', 'marvell,armada7040-db']
   	'marvell,armada8020' was expected
   	'marvell,armada7020-falcon-carrier' is not one of ['iei,puzzle-m801', 'marvell,armada8040-db', 'solidrun,clearfog-gt-8k']
   	'marvell,armada7020-falcon-carrier' is not one of ['marvell,armada8040-mcbin-doubleshot', 'marvell,armada8040-mcbin-singleshot']
   	'marvell,armada7020-falcon-carrier' is not one of ['marvell,armada-8080-db']
   	'marvell,cn9130' was expected
   	'marvell,cn9131' was expected
   	'marvell,cn9132' was expected
--
   	'solidrun,cn9130-sr-som' was expected
   	'solidrun,cn9132-sr-cex7' was expected
   	'marvell,armada-ap806' was expected
   	'marvell,armada-ap806-quad' was expected
   	'marvell,armada-ap810-octa' was expected
   	'marvell,armada-ap807' was expected
   	'marvell,cn9130-cpu-module' was expected
   	'marvell,cn9131-cpu-module' was expected
   	'marvell,armada-ap810' was expected
   	from schema $id: http://devicetree.org/schemas/arm/marvell/armada-7k-8k.yaml
>> arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: /: failed to match any schema with compatible: ['marvell,armada7020-falcon-carrier', 'marvell,db-falcon-carrier', 'marvell,armada7020-cpu-module', 'marvell,armada7020', 'marvell,armada-ap806-dual', 'marvell,armada-ap806']
>> arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: /: failed to match any schema with compatible: ['marvell,armada7020-falcon-carrier', 'marvell,db-falcon-carrier', 'marvell,armada7020-cpu-module', 'marvell,armada7020', 'marvell,armada-ap806-dual', 'marvell,armada-ap806']
>> arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: /: failed to match any schema with compatible: ['marvell,armada7020-falcon-carrier', 'marvell,db-falcon-carrier', 'marvell,armada7020-cpu-module', 'marvell,armada7020', 'marvell,armada-ap806-dual', 'marvell,armada-ap806']
>> arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: system-controller@6f4000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: system-controller@6f8000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
>> arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: system-controller@440000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: system-controller@400000 (syscon): compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml
   arch/arm64/boot/dts/marvell/db-falcon-carrier-a7k.dtb: crypto@800000 (marvell,armada-cp110-crypto): compatible: 'oneOf' conditional failed, one must be fixed:
   	['marvell,armada-cp110-crypto', 'inside-secure,safexcel-eip197b'] is too long
   	'inside-secure,safexcel-eip197b' was expected
   	'inside-secure,safexcel-eip197d' was expected
   	'inside-secure,safexcel-eip97ies' was expected
   	'inside-secure,safexcel-eip197' was expected
   	'inside-secure,safexcel-eip97' was expected

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
