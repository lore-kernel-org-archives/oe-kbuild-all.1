Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FBAF15CD74
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Feb 2026 04:56:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771736195; cv=none; b=b/04xxDH7tgS9UfyeElln7MoVxuG5zkRYVk8LW49Rtn7k44LgCM45y6msuZjH/SKETWlV/Jpa16AvCFTbH8vwdAEOHV6HElpJz18nTX8gqyg7HyDJbmfrYDHIBc80x8htklpuE3DxbDcxxQASMzr20b0KCBFT3l/Q+Q4MazcFzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771736195; c=relaxed/simple;
	bh=TeuNSXHDYxr0w3DUW7yodSHHNoTlVaP13TIkc1tkViY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tAGVZe3Gmr71H9/ZZTazWzMfu/fQHxfDoclKijLCdWMG3VZXDMlCqqtj8gi8+xzYcQ7VfXLXGXhhfBiFLjvWSt7ghYp3ebiqX5/MZwfpMUzrMY3zjNxrtnWwqdfBrooGlwPtUPrfnjdu9ZEVyi3boEussQy2SB6cYWlgToWrTig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nAebsjCu; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nAebsjCu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771736193; x=1803272193;
  h=date:from:to:cc:subject:message-id;
  bh=TeuNSXHDYxr0w3DUW7yodSHHNoTlVaP13TIkc1tkViY=;
  b=nAebsjCuadYSrpuvfYlHTfV+BMLxVc/td2NBVaR+OljczOzntaiyoj69
   LZ9LI4aQc8YIfuUrol4JUbMOd2hImCNorz1vOHHOv3EgGMoYeep6SNX35
   MHQph4rnHNqNrX4CPGjztQFnpQo96dwfebhsZz5g/tIRkTlWaMFGfUjkt
   JzHU7qGC7ysMcEbYEPMogP35Rk0aLTEfcpmR9dEPmzzJdks5N15/fjrRG
   oeczsypJWWEJulH0RWzNuAsjKDpz0QO3daIQ8wfpdr7bB8z7a9oNLCaQI
   veiTheUcUfXjTme8vWOmzP35uTff9YvwudlQZuTmX6taJC9TvF9yJJJo+
   Q==;
X-CSE-ConnectionGUID: uW+E1q79Rz+WenaNfVIEfQ==
X-CSE-MsgGUID: EQ5P009rQD2MnVrgy5QPAA==
X-IronPort-AV: E=McAfee;i="6800,10657,11708"; a="98229627"
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="98229627"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2026 20:56:32 -0800
X-CSE-ConnectionGUID: FKlXC2cMQUaUMen++dNDJw==
X-CSE-MsgGUID: DujBjEQST5ep8exGUSA1jA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,304,1763452800"; 
   d="scan'208";a="238183134"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Feb 2026 20:56:30 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vu1W8-000000015Ki-1bcz;
	Sun, 22 Feb 2026 04:56:28 +0000
Date: Sun, 22 Feb 2026 12:56:16 +0800
From: kernel test robot <lkp@intel.com>
To: Pallav Joshi <pallav.joshi@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, git@amd.com,
 Michal Simek <monstr@monstr.eu>
Subject: [xilinx-xlnx:xlnx_rebase_v6.6 147/1266]
 drivers/staging/uartlite-rs485/uartlite-rs485.c:116:37: error: use of
 undeclared identifier 'CONFIG_SERIAL_UARTLITE_NR_UARTS'
Message-ID: <202602221239.swkXAmVw-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/Xilinx/linux-xlnx xlnx_rebase_v6.6
head:   343f487d634122b137e2b1491d0c7fe1fb876c2e
commit: c3ba8422573e8196aaf4a47fc2d6147b35a581bd [147/1266] staging: uartlite-rs485: Initial commit to add drv
config: x86_64-randconfig-r122-20260222 (https://download.01.org/0day-ci/archive/20260222/202602221239.swkXAmVw-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260222/202602221239.swkXAmVw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602221239.swkXAmVw-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/staging/uartlite-rs485/uartlite-rs485.c:13:
   In file included from include/linux/serial_core.h:17:
   In file included from include/linux/tty.h:12:
   In file included from include/linux/tty_port.h:5:
   In file included from include/linux/kfifo.h:42:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2168:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/staging/uartlite-rs485/uartlite-rs485.c:116:37: error: use of undeclared identifier 'CONFIG_SERIAL_UARTLITE_NR_UARTS'
     116 | static struct uart_port ulite_ports[ULITE_NR_UARTS];
         |                                     ^
   drivers/staging/uartlite-rs485/uartlite-rs485.c:32:25: note: expanded from macro 'ULITE_NR_UARTS'
      32 | #define ULITE_NR_UARTS          CONFIG_SERIAL_UARTLITE_NR_UARTS
         |                                 ^
   drivers/staging/uartlite-rs485/uartlite-rs485.c:439:9: error: use of undeclared identifier 'CONFIG_SERIAL_UARTLITE_NR_UARTS'
     439 |         .nr             = ULITE_NR_UARTS,
         |                           ^
   drivers/staging/uartlite-rs485/uartlite-rs485.c:32:25: note: expanded from macro 'ULITE_NR_UARTS'
      32 | #define ULITE_NR_UARTS          CONFIG_SERIAL_UARTLITE_NR_UARTS
         |                                 ^
   drivers/staging/uartlite-rs485/uartlite-rs485.c:464:21: error: use of undeclared identifier 'CONFIG_SERIAL_UARTLITE_NR_UARTS'
     464 |                 for (id = 0; id < ULITE_NR_UARTS; id++)
         |                                   ^
   drivers/staging/uartlite-rs485/uartlite-rs485.c:32:25: note: expanded from macro 'ULITE_NR_UARTS'
      32 | #define ULITE_NR_UARTS          CONFIG_SERIAL_UARTLITE_NR_UARTS
         |                                 ^
   drivers/staging/uartlite-rs485/uartlite-rs485.c:468:22: error: use of undeclared identifier 'CONFIG_SERIAL_UARTLITE_NR_UARTS'
     468 |         if (id < 0 || id >= ULITE_NR_UARTS) {
         |                             ^
   drivers/staging/uartlite-rs485/uartlite-rs485.c:32:25: note: expanded from macro 'ULITE_NR_UARTS'
      32 | #define ULITE_NR_UARTS          CONFIG_SERIAL_UARTLITE_NR_UARTS
         |                                 ^
   1 warning and 4 errors generated.


vim +/CONFIG_SERIAL_UARTLITE_NR_UARTS +116 drivers/staging/uartlite-rs485/uartlite-rs485.c

   115	
 > 116	static struct uart_port ulite_ports[ULITE_NR_UARTS];
   117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
