Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3DBE1ACEAE
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Jan 2025 21:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736458646; cv=none; b=jEVi9al/RrCeK3jh5izl+u861Jd5uNza+SKchtpXuHk2Z3Zb38UifIbdlWVmpUXHvFUuPzLilv2kA+ONQ8TJteuWe8w0Xtyl4xLfcmaZ6CbtIvR6COBmQzfOkk0AFojd/rQwkXCgy4NMOvUvQpjF4HHCecd64yzwLQ9+YMPnz5I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736458646; c=relaxed/simple;
	bh=ZZ8948fs6kMk7hgsRyDKWO3p0cogZYkQ5uu9jMe6TKo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eIYQLwmZKmZ4GXifhAPe2FKXesfccYtLlnPDKxGw90dMPdJWqA1MHCwVwfhgk1yGEUWg0C7pfNjvoa/89MnhKvYADUrs6PETa/HfDZjXvPux0pxutjzES3M7MFj9Xaux7dna8XN8LBJ9z3lAcjrEE9729fbm36D0M6lu/D9dMw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GHYWtywF; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GHYWtywF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736458644; x=1767994644;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZZ8948fs6kMk7hgsRyDKWO3p0cogZYkQ5uu9jMe6TKo=;
  b=GHYWtywFxUKB+Gi9ggvkoqkVgO4lXn29x0JKQXSZyxCBgwJ9uBt9ekjl
   aI6jD7VwLtIKwe+f+k732Uo35gr+E54+gebUCyDGCp3GsiuLt8Vohl4jm
   SjycfupeRS7cczofnPIB7d2bWB80Joux+Iss/oolORJ0m62/a4xGfpsAt
   YuikHOA4vvrhxyipNJ4kPuciyr7vf5B4D2qH4EYcbpTRXgYM4kp406u9I
   lvUczE2so2aHbCYT8qD0G3tz05fW5Ytq4lu3a3MI2q6HhoRgPXULGhLMG
   +H1ym6ZUhWA6VE4V/hTjTSbg88r4FgG2vm88xVVLdPnAEOL4GimyfpCT1
   w==;
X-CSE-ConnectionGUID: qnV5D16EQyG4uAn3+NGZzg==
X-CSE-MsgGUID: GLKvNZjsTNO3EYhBahiNOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11310"; a="36028217"
X-IronPort-AV: E=Sophos;i="6.12,302,1728975600"; 
   d="scan'208";a="36028217"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Jan 2025 13:37:23 -0800
X-CSE-ConnectionGUID: DtpK8l8yTYWx+gVY7z3Vyg==
X-CSE-MsgGUID: BiPWgdHNR9+Ym9nNunD04w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="108582910"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 09 Jan 2025 13:37:22 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tW0DP-000IAL-2t;
	Thu, 09 Jan 2025 21:37:19 +0000
Date: Fri, 10 Jan 2025 05:36:34 +0800
From: kernel test robot <lkp@intel.com>
To: Michal Simek <monstr@monstr.eu>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 5774/7509]
 arch/arm/boot/dts/xilinx/zynq-parallella.dtb: ethernet@e000b000:
 ethernet-phy@0: Unevaluated properties are not allowed ('marvell,reg-init'
 was unexpected)
Message-ID: <202501100532.fwtSMb6p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6ecd20965bdc21b265a0671ccf36d9ad8043f5ab
commit: 1058ffd774df1cfe28a870dceb74411749ad481f [5774/7509] ARM: zynq: Remove deprecated device_type property
config: arm-randconfig-052-20250107 (https://download.01.org/0day-ci/archive/20250110/202501100532.fwtSMb6p-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
dtschema version: 2024.12.dev6+gc4da38d
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250110/202501100532.fwtSMb6p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501100532.fwtSMb6p-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: fpga-full: $nodename:0: 'fpga-full' does not match '^fpga-region(@.*|-([0-9]|[1-9][0-9]+))?$'
   	from schema $id: http://devicetree.org/schemas/fpga/fpga-region.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: pmu@f8891000: 'reg' does not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/pmu.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: replicator: 'clock-names', 'clocks' do not match any of the regexes: 'pinctrl-[0-9]+'
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-static-replicator.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/adc@f8007100: failed to match any schema with compatible: ['xlnx,zynq-xadc-1.00.a']
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/i2c@e0004000/isl9305@68: failed to match any schema with compatible: ['isil,isl9305']
>> arch/arm/boot/dts/xilinx/zynq-parallella.dtb: ethernet@e000b000: ethernet-phy@0: Unevaluated properties are not allowed ('marvell,reg-init' was unexpected)
   	from schema $id: http://devicetree.org/schemas/net/cdns,macb.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/slcr@f8000000: failed to match any schema with compatible: ['xlnx,zynq-slcr', 'syscon', 'simple-mfd']
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/slcr@f8000000/clkc@100: failed to match any schema with compatible: ['xlnx,ps7-clkc']
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: /axi/slcr@f8000000/rstc@200: failed to match any schema with compatible: ['xlnx,zynq-reset']
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: etb@f8801000: clocks: [[1, 27], [1, 46], [1, 47]] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: etb@f8801000: clock-names:1: 'atclk' was expected
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#
   arch/arm/boot/dts/xilinx/zynq-parallella.dtb: etb@f8801000: clock-names: ['apb_pclk', 'dbg_trc', 'dbg_apb'] is too long
   	from schema $id: http://devicetree.org/schemas/arm/arm,coresight-etb10.yaml#

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
