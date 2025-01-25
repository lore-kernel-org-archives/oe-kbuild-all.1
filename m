Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC5217996
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 16:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737822143; cv=none; b=uk5cYtiKE2CZVwnzodpA9o6TDsc8tIJegGoCwccfOLLZzmSekSxwJghi5UURaq1wfZxD3hwUCbxLJ5vkLs2YklUBpMyjakfv8HLlRuYgRC8xWA/sKWSABc0r22Z6OHk7p2NvXk270CZRSZOuv/HxT/Tg7tzYD9cu9LugeG4/Btk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737822143; c=relaxed/simple;
	bh=1AVLHKXRsw2fdnfsQzma5gSixcvnrTrOTusu+GwWzss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wy7Y/DC1L6+HBH+nDDShRBfVAWi5G6nC6IQWe21c08q+0EPNb7QvVn3UQ74roDJeQUxOyqVf/Gofv496LnZzKF+3W2soG8Sxsp7xkiSt7NmGQEWvGWwHR5+i+gE/cxIf7zxwG5D8ovvviQ+pq3dd2dYkb57IphiVbG0tAlP3mtI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Se0PMxee; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Se0PMxee"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737822142; x=1769358142;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1AVLHKXRsw2fdnfsQzma5gSixcvnrTrOTusu+GwWzss=;
  b=Se0PMxeegiIWLub606Q3OpW95yfzXrbupV7JDRvUrKTGYSirb8sDzVKi
   Coyd/V/qEy9mbXGscM7wXjdJhz7gEPD2vsgwMkjJokmAAaXB65kNk2okX
   Mzc0q/ho75aIXwIRRg3FiTz9/tkF3ZGLengMAd9XDWyRyNWNSZVykiVWh
   v4rT3coNjZCJujRHnocKAieI6K54aWyPHzzYP1942cMZFWWFyjdE7RcEN
   CJdo+4m6+bPCp7FchMHZJXXB3wdqpPNJkYuENcWTmnSyr9fbAmD1BYQHy
   wAtFOomrHOTQW5zD3f7xrPYzGvcwSRGBtrf3jNArMEfir3g4qFFKNFuGo
   g==;
X-CSE-ConnectionGUID: D25RoxiySsOeRNkZiCby/g==
X-CSE-MsgGUID: HdpXxL8hRMa+Goe2n5Fsag==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="63694716"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="63694716"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 08:22:21 -0800
X-CSE-ConnectionGUID: perJEIoGRXGMQGQuTDo33w==
X-CSE-MsgGUID: pCZSosDbRIqFm8gNwEaLDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="113045628"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 25 Jan 2025 08:22:20 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbivJ-000e0y-2X;
	Sat, 25 Jan 2025 16:22:17 +0000
Date: Sun, 26 Jan 2025 00:21:40 +0800
From: kernel test robot <lkp@intel.com>
To: Jiri Slaby <jslaby@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/tty/serial/pic32_uart.c:904:34: warning:
 'pic32_serial_dt_ids' defined but not used
Message-ID: <202501260006.ecUsBidz-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jiri,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b46c89c08f4146e7987fc355941a93b12e2c03ef
commit: e3e7b13bffae85e2806c73e3ccacd4447bcb19ed serial: allow COMPILE_TEST for some drivers
date:   2 years, 9 months ago
config: mips-randconfig-s051-20221112 (https://download.01.org/0day-ci/archive/20250126/202501260006.ecUsBidz-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250126/202501260006.ecUsBidz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501260006.ecUsBidz-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/tty/serial/pic32_uart.c:904:34: warning: 'pic32_serial_dt_ids' defined but not used [-Wunused-const-variable=]
     904 | static const struct of_device_id pic32_serial_dt_ids[] = {
         |                                  ^~~~~~~~~~~~~~~~~~~


vim +/pic32_serial_dt_ids +904 drivers/tty/serial/pic32_uart.c

157b9394709ed5 Andrei Pistirica 2016-01-13  903  
157b9394709ed5 Andrei Pistirica 2016-01-13 @904  static const struct of_device_id pic32_serial_dt_ids[] = {
157b9394709ed5 Andrei Pistirica 2016-01-13  905  	{ .compatible = "microchip,pic32mzda-uart" },
157b9394709ed5 Andrei Pistirica 2016-01-13  906  	{ /* sentinel */ }
157b9394709ed5 Andrei Pistirica 2016-01-13  907  };
157b9394709ed5 Andrei Pistirica 2016-01-13  908  MODULE_DEVICE_TABLE(of, pic32_serial_dt_ids);
157b9394709ed5 Andrei Pistirica 2016-01-13  909  

:::::: The code at line 904 was first introduced by commit
:::::: 157b9394709ed5233288986a293405def22792ed serial: pic32_uart: Add PIC32 UART driver

:::::: TO: Andrei Pistirica <andrei.pistirica@microchip.com>
:::::: CC: Ralf Baechle <ralf@linux-mips.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
