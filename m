Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CA3197A7B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Jun 2024 02:48:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718678914; cv=none; b=iwwCEmK4rqy+03g7v9q7D+M+lwaNmW7nj5fvYhyngYMvxx9vHK0zLMFbSvge7wKSU4bq+tDfnNQbE1U5xoFqWX2PAK80vu6j/lAIDHpLxHTYAQKKhG+dPv6aujQJ4eKI0z0Z7omWcyJZywmvcwZVDwX9qqk3/aOS3QdqVG0FDaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718678914; c=relaxed/simple;
	bh=dQeNbI+pa6xma/cEcYaaahREAYC4+uki8k7zmHWnJmA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sjGsyUF8vcVgl1fjZt4yGdL3k8TkSQE5ZfCHPpcX3mn0nHWL4eW3guxqPtqCbaEa4mSk/acxEMGORznvM3J8ovtPGTAa9x8HeF6iAkGP7RpNexabFewVrFbl2GML9K4J/oi+qrMzO2lYrRGl1mrZr3imrOoZn8edoz1Ta3MiaJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jwiuaZHp; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jwiuaZHp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718678913; x=1750214913;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=dQeNbI+pa6xma/cEcYaaahREAYC4+uki8k7zmHWnJmA=;
  b=jwiuaZHp2RmrVT4QPBAn+OYXQLu1MNH8moo4o/+cWoYL37RoFQjtJByu
   iUfag/deQuQ78ZZIzFCFPWPom+lin2llIwLtN54d0pRWE+BcRc0K/aCEf
   Xb9fVB8Nmx3W0DMK1Rg3q2gncno6VAU0AOpaj8Nqa/MzbidwVF0sVjlX2
   svyGqeOXrrdg+8QiwykCXtEFIQ3n7NHjMcOh/O1dtMr2WMOad3wL5Y0hl
   GLr5HSdP9I+INJL8nt7ULBH4/N7DZ2jzcfvblZw2I5z8UejsB1gzznFBP
   lRWt9wFTAseLw98WeIwQSExjn5LLWRhqtxVQlKKUyzN3C3cd9ghGdpgtH
   A==;
X-CSE-ConnectionGUID: FhOhJ1S6QNe/bfTEZl4/gw==
X-CSE-MsgGUID: sbj7aQmqSiy4khLEWP/S4g==
X-IronPort-AV: E=McAfee;i="6700,10204,11106"; a="15249250"
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; 
   d="scan'208";a="15249250"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2024 19:48:31 -0700
X-CSE-ConnectionGUID: HfD8aCDGTdOjFUCz5PHhmQ==
X-CSE-MsgGUID: dJYPzoN0RrCWIUz2xptxGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,246,1712646000"; 
   d="scan'208";a="41487531"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 17 Jun 2024 19:48:30 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sJOtX-00059r-34;
	Tue, 18 Jun 2024 02:48:27 +0000
Date: Tue, 18 Jun 2024 10:47:45 +0800
From: kernel test robot <lkp@intel.com>
To: Siddharth Vadapalli <s-vadapalli@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Udit Kumar <u-kumar1@ti.com>, Chintan Vankar <c-vankar@ti.com>
Subject: [ti:ti-rt-linux-6.6.y 32/39]
 arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: pinctrl@a40000:
 'mcu-cpsw-cpts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$',
 'pinctrl-[0-9]+'
Message-ID: <202406181002.PHwG8J43-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.6.y
head:   eeca5715c9a5b742423bd83ed587fac26268771c
commit: f74099ea2c2d694cb6069145155e5e738cd957fc [32/39] arm64: dts: ti: k3-j721e-common-proc-board: Add MCU CPSW CPTS PPS support
config: arm64-randconfig-051-20240616 (https://download.01.org/0day-ci/archive/20240618/202406181002.PHwG8J43-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
dtschema version: 2024.6.dev1+g833054f
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240618/202406181002.PHwG8J43-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406181002.PHwG8J43-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:1880.21-1896.4: Warning (simple_bus_reg): /bus@100000/dsi@48000000: simple-bus unit address format error, expected "4800000"
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:2306.34-2315.4: Warning (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: syscon@40f00000: compatible: ['syscon', 'simple-mfd'] is too short
   	from schema $id: http://devicetree.org/schemas/mfd/syscon.yaml#
>> arch/arm64/boot/dts/ti/k3-j721e-common-proc-board.dtb: pinctrl@a40000: 'mcu-cpsw-cpts' does not match any of the regexes: '-pins(-[0-9]+)?$|-pin$', 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/pinctrl/pinctrl-single.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
