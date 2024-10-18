Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD8E316EB4C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 18 Oct 2024 19:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729278965; cv=none; b=JP+B38Zua2Pb05V7gX9oUSBwLL3c7lCJXdZVqEj+mCSaeHrsIh0mfxUH68TaCsXbaenmWK7C+Ppwvycqbga2O6lCoPtedVt5hCuZFgjc1hX4/0Uw1PrTS8v19YrQTrZy/rRm+Zouh2gshNhlAJA1QBeub4TX6LiZPKnphj3iYs4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729278965; c=relaxed/simple;
	bh=u4X+7rOe+SYYAhrmpZg/fR9KJgNzFdnX96r4okEsquQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Aqhd6fgrxTV7SyAeqy8ls5K/gO3LruXeqlva2AfAGcWihXhCIAUgpaL3IaYkmDtCEUh62KLdxRX0PW7JBevYOh2gAgbAmqjGe13+1LxRp/7itVOqSIDUdD72d3gQLywlDoOAL6FZiQ4PzlBZ2LBaANJQpDM8a4/myiR789hFxbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVAlaRNo; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVAlaRNo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729278961; x=1760814961;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=u4X+7rOe+SYYAhrmpZg/fR9KJgNzFdnX96r4okEsquQ=;
  b=EVAlaRNo0NupICQ2FKXukm4bfPv9PdGg9N5VA1Rbo0TqosWCsfmsg9YP
   WE1ZDIJktxFqnWmURGiokK/LrZUb33rNoIyV8lMhgcEjriCwGQCMrwKF/
   693UMik1FnU7RgEsERh2CgZOw6eUt0UCuAUQYINg4zWTHpX6dLLTDD1zi
   PDcJtYgKiuOqehcH/wxLzb24UdL6d28ZKIVc0DtB0wTrvYM76mMENpfWb
   Xc75ncz+Ny50ZwCiDGKDzotvGZsu18wiXkAei9+tqZxybzHq8T6CKQOyN
   zM9lc/fIV5Qv/gGC/RWeRyK23ca+foxcZKnDPv1I9pwiUCpKTsf7VBJEK
   Q==;
X-CSE-ConnectionGUID: ZjQRvkRVQ32YfLUfdHtCTQ==
X-CSE-MsgGUID: SWZVTKWXTpikGYnKjXFYcQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11229"; a="40219734"
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="40219734"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2024 12:16:00 -0700
X-CSE-ConnectionGUID: vuQAwSaBR+eINKOtrjhYZQ==
X-CSE-MsgGUID: Om5kw18PTNibm90+5rpAYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,214,1725346800"; 
   d="scan'208";a="109703335"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 18 Oct 2024 12:15:59 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t1sS4-000ODV-2K;
	Fri, 18 Oct 2024 19:15:56 +0000
Date: Sat, 19 Oct 2024 03:15:46 +0800
From: kernel test robot <lkp@intel.com>
To: Vaishnav Achath <vaishnav.a@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com
Subject: [ti:ti-rt-linux-6.1.y-cicd 11/44]
 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi:184.37-188.5: Warning
 (unit_address_vs_reg):
 /bus@100000/bus@28380000/fss@47000000/mux-controller@47000004: node has a
 unit name, but no reg or ranges property
Message-ID: <202410190301.0ZTgZWOp-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   e680678e5fef8c191b1588d8d7520171011ebe93
commit: 453e0e54ada305a3320d743e5511ee0fe844f23f [11/44] arm64: dts: ti: k3-j721e-mcu-wakeup: Add HyperBus node
config: arm64-randconfig-002-20241013 (https://download.01.org/0day-ci/archive/20241019/202410190301.0ZTgZWOp-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241019/202410190301.0ZTgZWOp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410190301.0ZTgZWOp-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi:184.37-188.5: Warning (unit_address_vs_reg): /bus@100000/bus@28380000/fss@47000000/mux-controller@47000004: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:71.39-76.8: Warning (unit_address_vs_reg): /bus@100000/scm-conf@100000/mux-controller@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:1909.34-1918.4: Warning (avoid_unnecessary_addr_size): /bus@100000/pinctrl@a40000: unnecessary #address-cells/#size-cells without "ranges" or child "reg" property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:725.25-751.4: Warning (unique_unit_address): /bus@100000/pcie@2900000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2900000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:773.25-799.4: Warning (unique_unit_address): /bus@100000/pcie@2910000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2910000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:821.25-847.4: Warning (unique_unit_address): /bus@100000/pcie@2920000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2920000)
--
>> arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi:184.37-188.5: Warning (unit_address_vs_reg): /bus@100000/bus@28380000/fss@47000000/mux-controller@47000004: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:71.39-76.8: Warning (unit_address_vs_reg): /bus@100000/scm-conf@100000/mux-controller@4000: node has a unit name, but no reg or ranges property
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:725.25-751.4: Warning (unique_unit_address): /bus@100000/pcie@2900000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2900000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:773.25-799.4: Warning (unique_unit_address): /bus@100000/pcie@2910000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2910000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:821.25-847.4: Warning (unique_unit_address): /bus@100000/pcie@2920000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2920000)
   arch/arm64/boot/dts/ti/k3-j721e-main.dtsi:869.25-895.4: Warning (unique_unit_address): /bus@100000/pcie@2930000: duplicate unit-address (also used in node /bus@100000/pcie-ep@2930000)

vim +184 arch/arm64/boot/dts/ti/k3-j721e-mcu-wakeup.dtsi

 > 184			hbmc_mux: mux-controller@47000004 {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
