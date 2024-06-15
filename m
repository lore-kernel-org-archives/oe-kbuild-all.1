Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D3846AA7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 02:17:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718417858; cv=none; b=g/LYYtj5Vhzuf4N7MmSwkckfDE1MVDCMbTcMn6p7hFImM0sWzjPgcLHRCk03GWAdzeASzR8fE50pcIpVh/CVCMEa5wB1yVueabmzw8l6SL+IzxRrjRNPpQlne9F2D1dnaOXzkmYEAZLmprj/go6B9cJFuP02C38TwZOVfHS2PYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718417858; c=relaxed/simple;
	bh=68UJ41QFjSYnRtX8PvtF0cXokjOFsOul/L/4uHDRF8I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JMjSzvNjeYkeVZ/cQkA65FYSpT9IHKC4pve6CmQPJKpk7yFv0tBgnQusmByLuZVe5jXfKXGQZlCrBiXrA/CMP5Dc2iVOYty0374rhh5XzfDOiIxsJMM/vmEQmUFo8g1luPxc+3q/qMbDwBn/fXcNVRe2PYl03Ld2YT0+gYAdSvU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B0n5jV3L; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B0n5jV3L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718417856; x=1749953856;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=68UJ41QFjSYnRtX8PvtF0cXokjOFsOul/L/4uHDRF8I=;
  b=B0n5jV3LyLVCcBAf2gSB6LJma35pwFHFveKTtx7wLgSiaz33QMk/4fMr
   ThH47gX/q2aiQuBThA3xczmeGBNb2StnaK0HeedU06e10d7l+qEMrcOn/
   ZKAeZKcrqSZVeIKDDO7xiaxu5vCnatCyOL+me2gpgezVjWS7y32eTwKHU
   R4zAoe3ITDNix8Z7Hf4s92xmFhi2r7mSaW5WdCFuDrUIhe+G4Bcnyv+sd
   ul8kPOWjtLhk0721zmI6pXqyJLv+Hx7npCCSaNXsG9aof3Wtcka1c7hhQ
   RGuZMi+87WB38o3LOlUTKPvqp/SyLtPQNTf8MJjF1dYQia8b8Iz2VTQAH
   g==;
X-CSE-ConnectionGUID: OeLmOfqaQ3mnHrha5kBD/g==
X-CSE-MsgGUID: gb73vE6RSmWWEUxK2zPXOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15200629"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="15200629"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 19:17:35 -0700
X-CSE-ConnectionGUID: 501hKHAuSe+elgbYYDR2Xg==
X-CSE-MsgGUID: AsrTbExGQb63XBHkzSJ1Aw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="40825170"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 14 Jun 2024 19:17:34 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sIIyx-00021N-2L;
	Sat, 15 Jun 2024 02:17:31 +0000
Date: Sat, 15 Jun 2024 10:16:43 +0800
From: kernel test robot <lkp@intel.com>
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: oe-kbuild-all@lists.linux.dev, Duy Nguyen <duy.nguyen.rh@renesas.com>
Subject: [morimoto:gen5-linux6.9-VDK3.4-2024-06-12 17/44]
 arch/arm64/boot/dts/renesas/r8a78000-vpf.dts:41.9-47.5: Warning
 (simple_bus_reg): /soc/timer: missing or empty reg/ranges property
Message-ID: <202406151034.7afUQG4v-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux gen5-linux6.9-VDK3.4-2024-06-12
head:   e95a06f85e7321d82c8f40747725f237e9a5d7a6
commit: 80b90a7fd8f13398b675952a5ce468b8fe4db5af [17/44] soc: renesas: Add R-Car Gen5 X5H support
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240615/202406151034.7afUQG4v-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240615/202406151034.7afUQG4v-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151034.7afUQG4v-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/arm64/boot/dts/renesas/r8a78000-vpf.dts:41.9-47.5: Warning (simple_bus_reg): /soc/timer: missing or empty reg/ranges property

vim +41 arch/arm64/boot/dts/renesas/r8a78000-vpf.dts

b46217b5a60642 Kuninori Morimoto 2024-01-24   9  
b46217b5a60642 Kuninori Morimoto 2024-01-24  10  / {
b46217b5a60642 Kuninori Morimoto 2024-01-24  11  	model = "Renesas R-Car Gen5 X5H VPF";
b46217b5a60642 Kuninori Morimoto 2024-01-24  12  	compatible = "renesas,r8a78000-vpf", "renesas,r8a78000", "arm,rtsm_ve,aemv8a", "arm,vexpress";
b46217b5a60642 Kuninori Morimoto 2024-01-24  13  
b46217b5a60642 Kuninori Morimoto 2024-01-24  14  	memory@40000000 {
b46217b5a60642 Kuninori Morimoto 2024-01-24  15  		device_type = "memory";
b46217b5a60642 Kuninori Morimoto 2024-01-24  16  		reg = <0x0 0x40000000 0x0 0x70000000>;
b46217b5a60642 Kuninori Morimoto 2024-01-24  17  	};
b46217b5a60642 Kuninori Morimoto 2024-01-24  18  
b46217b5a60642 Kuninori Morimoto 2024-01-24  19  	aliases {
b46217b5a60642 Kuninori Morimoto 2024-01-24  20  		serial0 = &uart;
b46217b5a60642 Kuninori Morimoto 2024-01-24  21  	};
b46217b5a60642 Kuninori Morimoto 2024-01-24  22  
b46217b5a60642 Kuninori Morimoto 2024-01-24  23  	chosen {
b46217b5a60642 Kuninori Morimoto 2024-01-24  24  		bootargs = "ignore_loglevel initcall_debug=0 nokaslr";
b46217b5a60642 Kuninori Morimoto 2024-01-24  25  		stdout-path = "serial0:38400n8";
b46217b5a60642 Kuninori Morimoto 2024-01-24  26  	};
b46217b5a60642 Kuninori Morimoto 2024-01-24  27  
b46217b5a60642 Kuninori Morimoto 2024-01-24  28  	sysreg: sysreg@e8000000 {
b46217b5a60642 Kuninori Morimoto 2024-01-24  29  		compatible = "arm,vexpress-sysreg";
b46217b5a60642 Kuninori Morimoto 2024-01-24  30  		reg = <0x0 0xe8000000 0x0 0x1000>;
b46217b5a60642 Kuninori Morimoto 2024-01-24  31  	};
b46217b5a60642 Kuninori Morimoto 2024-01-24  32  
b46217b5a60642 Kuninori Morimoto 2024-01-24  33  	sysclk: clk100000000 {
b46217b5a60642 Kuninori Morimoto 2024-01-24  34  		compatible = "fixed-clock";
b46217b5a60642 Kuninori Morimoto 2024-01-24  35  		#clock-cells = <0>;
b46217b5a60642 Kuninori Morimoto 2024-01-24  36  		clock-frequency = <100000000>;
b46217b5a60642 Kuninori Morimoto 2024-01-24  37  		clock-output-names = "sysclk";
b46217b5a60642 Kuninori Morimoto 2024-01-24  38  	};
b46217b5a60642 Kuninori Morimoto 2024-01-24  39  
b46217b5a60642 Kuninori Morimoto 2024-01-24  40  	soc {
b46217b5a60642 Kuninori Morimoto 2024-01-24 @41  		timer {
b46217b5a60642 Kuninori Morimoto 2024-01-24  42  			compatible = "arm,armv8-timer";
b46217b5a60642 Kuninori Morimoto 2024-01-24  43  			interrupts = <GIC_PPI 0xd IRQ_TYPE_LEVEL_LOW
b46217b5a60642 Kuninori Morimoto 2024-01-24  44  				      GIC_PPI 0xe IRQ_TYPE_LEVEL_LOW
b46217b5a60642 Kuninori Morimoto 2024-01-24  45  				      GIC_PPI 0xb IRQ_TYPE_LEVEL_LOW
b46217b5a60642 Kuninori Morimoto 2024-01-24  46  				      GIC_PPI 0xa IRQ_TYPE_LEVEL_LOW>;
b46217b5a60642 Kuninori Morimoto 2024-01-24  47  		};
b46217b5a60642 Kuninori Morimoto 2024-01-24  48  
b46217b5a60642 Kuninori Morimoto 2024-01-24  49  		uart: uart@e5c00000 {
b46217b5a60642 Kuninori Morimoto 2024-01-24  50  			compatible = "arm,pl011", "arm,primecell";
b46217b5a60642 Kuninori Morimoto 2024-01-24  51  			reg = <0x0 0xe5c00000 0x0 0x1000>;
b46217b5a60642 Kuninori Morimoto 2024-01-24  52  			interrupts = <GIC_SPI 959 IRQ_TYPE_LEVEL_HIGH>;
b46217b5a60642 Kuninori Morimoto 2024-01-24  53  			clock-names = "uartclk", "apb_pclk";
b46217b5a60642 Kuninori Morimoto 2024-01-24  54  			clocks = <&sysclk>, <&sysclk>;
b46217b5a60642 Kuninori Morimoto 2024-01-24  55  		};
b46217b5a60642 Kuninori Morimoto 2024-01-24  56  	};
b46217b5a60642 Kuninori Morimoto 2024-01-24  57  

:::::: The code at line 41 was first introduced by commit
:::::: b46217b5a60642a0e70c5246ae93e7fe904c2536 arm64: dts: renesas: Add Renesas R8A78000 VPF support

:::::: TO: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
:::::: CC: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
