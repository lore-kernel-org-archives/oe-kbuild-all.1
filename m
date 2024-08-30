Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAA3718E778
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Aug 2024 10:39:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725014349; cv=none; b=MTy3XC0C0yLFD7zMCEwf1YLwCirkVoYgpL0WRy0UQfxL5NgidanpJxgfhu8SqOgUuQtWRdm928kuZOESSnHbpjB0dbJ25QnoxTrxdNTBOkwVGMkPmgK6vXbBWml5YM4Sp5uhD7IEKkQi7TEeaOf6rNqKQEKDQ29q5hOQb2Zxp4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725014349; c=relaxed/simple;
	bh=i5h46gO/AuWhvJN2wIqzGCJyWNxFhK7HFC3Izuz8byE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nmkysUwP2mWkw1Y7IEGCon2BFpaK/P6A6I6yZTctlsGVE4FBeukoJoyDaKvI/ZrI48i2mCmHaGSHRZMShw2tX5J1Bhf+mwN0kziGeiAKuLUoARCX1TnG3nTwQVSBWJLNw2qRmPJJ1QHf0fKpf1HGszp+GqaMdcFBOk+7KPRkxY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=h+yidcs2; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="h+yidcs2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725014348; x=1756550348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=i5h46gO/AuWhvJN2wIqzGCJyWNxFhK7HFC3Izuz8byE=;
  b=h+yidcs2tFngdFvVcBolTK9FXMcLvGVFJ1kKpAf8TeAdRr7QAXhHMkvv
   pMgddraHcy0Z32LR75ZiWx+6GhXtgKcCpNoh9CsdDouU1HSvedceRuctS
   19Bcp3UlxovaSqm1eB8bGKbErtFevq7PAefag+/qyAVrlr8YU8j267fT7
   m8HHJ5plsJMtgwOt3oA9NvLkgHzSv2kyiIqwbzqjfPhevVw2E18RyoDKz
   0smSvjaEtvQGWs1W/2BOalh9ztxpdv6DShY5gP5//X9A/X3Mw8tamvvv4
   d3wXd7/jLpoaUINBhkgQNgOhQ+ujEOkB3mOZUAAOAfhDrh05ZgNRTuPJV
   g==;
X-CSE-ConnectionGUID: Xti9HjgzRBGIz6nY49hNEg==
X-CSE-MsgGUID: SZ0gA1xdQ0euPwM+2BI8mQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="23217404"
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="23217404"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Aug 2024 03:39:07 -0700
X-CSE-ConnectionGUID: 25zUY8TZRxy0lZ2Dva/pMQ==
X-CSE-MsgGUID: MMio3q3/SP2KgerRkO3Iiw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,188,1719903600"; 
   d="scan'208";a="64039820"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 30 Aug 2024 03:39:06 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sjz1z-0001Ny-2r;
	Fri, 30 Aug 2024 10:39:03 +0000
Date: Fri, 30 Aug 2024 18:38:36 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 8096/8126]
 arch/riscv/boot/dts/sophgo/cv1800b.dtsi:18.28-23.5: Warning
 (simple_bus_reg): /soc/pinctrl@3008000: simple-bus unit address format
 error, expected "3001000"
Message-ID: <202408301813.5vgyvX8O-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   985bf40edf4343dcb04c33f58b40b4a85c1776d4
commit: d65a5c5f4d30631c4da55899e742ba32aee58a52 [8096/8126] Merge branch 'for-next' of git://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git
config: riscv-buildonly-randconfig-r002-20220224 (https://download.01.org/0day-ci/archive/20240830/202408301813.5vgyvX8O-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240830/202408301813.5vgyvX8O-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408301813.5vgyvX8O-lkp@intel.com/

dtcheck warnings: (new ones prefixed by >>)
>> arch/riscv/boot/dts/sophgo/cv1800b.dtsi:18.28-23.5: Warning (simple_bus_reg): /soc/pinctrl@3008000: simple-bus unit address format error, expected "3001000"
--
>> arch/riscv/boot/dts/sophgo/cv1812h.dtsi:19.28-24.5: Warning (simple_bus_reg): /soc/pinctrl@3008000: simple-bus unit address format error, expected "3001000"

vim +/3001000 +18 arch/riscv/boot/dts/sophgo/cv1800b.dtsi

c3dffa879ccad5 Jisheng Zhang 2023-10-06   8  
c3dffa879ccad5 Jisheng Zhang 2023-10-06   9  / {
c3dffa879ccad5 Jisheng Zhang 2023-10-06  10  	compatible = "sophgo,cv1800b";
1eba0b61be7250 Inochi Amaoto 2024-04-11  11  
1eba0b61be7250 Inochi Amaoto 2024-04-11  12  	memory@80000000 {
1eba0b61be7250 Inochi Amaoto 2024-04-11  13  		device_type = "memory";
1eba0b61be7250 Inochi Amaoto 2024-04-11  14  		reg = <0x80000000 0x4000000>;
1eba0b61be7250 Inochi Amaoto 2024-04-11  15  	};
ce7cb7d1a78d37 Inochi Amaoto 2024-08-02  16  
ce7cb7d1a78d37 Inochi Amaoto 2024-08-02  17  	soc {
ce7cb7d1a78d37 Inochi Amaoto 2024-08-02 @18  		pinctrl: pinctrl@3008000 {
ce7cb7d1a78d37 Inochi Amaoto 2024-08-02  19  			compatible = "sophgo,cv1800b-pinctrl";
ce7cb7d1a78d37 Inochi Amaoto 2024-08-02  20  			reg = <0x03001000 0x1000>,
ce7cb7d1a78d37 Inochi Amaoto 2024-08-02  21  			      <0x05027000 0x1000>;
ce7cb7d1a78d37 Inochi Amaoto 2024-08-02  22  			reg-names = "sys", "rtc";
ce7cb7d1a78d37 Inochi Amaoto 2024-08-02  23  		};
ce7cb7d1a78d37 Inochi Amaoto 2024-08-02  24  	};
c3dffa879ccad5 Jisheng Zhang 2023-10-06  25  };
c3dffa879ccad5 Jisheng Zhang 2023-10-06  26  

:::::: The code at line 18 was first introduced by commit
:::::: ce7cb7d1a78d37786356721490aa70beeb893278 riscv: dts: sophgo: cv1800b: add pinctrl support

:::::: TO: Inochi Amaoto <inochiama@outlook.com>
:::::: CC: Inochi Amaoto <inochiama@outlook.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
