Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A45E8F66
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 May 2025 02:49:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748141344; cv=none; b=QVD2MNB1VcS4JhaI952KTZI2BWNOqDaXQn3Qt57MycfR8v4dgzyLv2c6Hjm3GgwZE+U5sDkK03PtbOnk8ZvT9MwnzxIwn7ULky0Rj46V385Hhqp8/IDiKNuCpElcOh3I/t91SMyKaN/n1ZVC1XaJGYtW5ujSM+085doTQEE0hnI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748141344; c=relaxed/simple;
	bh=xmWxeC7XMKGs/TVgGC7GDyR+GpFe6cUcxdJQ8zYuCJ4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=YWJZ5HNk2E9c7Iyvr/ZuO2EDyx6czFbX7JR0jYcEFrB3wGb6utzY8l8Vsi6n5qxANbChuW9i+l7Ig4TcDESep2Ltg3z8ZGpQrzmEXGQOFZZRmvqaJUIAPBKsBdbYj6Y44FJY5mAhCL1xweIB9mxqmwmzHX89oLYpQnjcj0LinZk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hLRtwpRq; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hLRtwpRq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748141343; x=1779677343;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xmWxeC7XMKGs/TVgGC7GDyR+GpFe6cUcxdJQ8zYuCJ4=;
  b=hLRtwpRqHT7CvWs0S7uwKAQNsiNH/hWJUP6ZnV0BxocXsOl1YTxz5OYn
   gMVezhJAr7Nz/A/n8HJu8VdNnK1YVii/WAC/bKuTyuWbbc2QdEYMEtlzo
   nOTeMB6sUS/eXGoP14zYfNRM2DeyBkeVcVCEygROQTduOiAwpwSHvr0+7
   3KMNlNaTUw48GXhPaS7ddWRxXmckio8vcuerUPI/2dsOdU97uXaD8wsfQ
   7eJKqQVWXho3FTZr2Xsb5qUhhTermqCm9JWR4yvp+JdtEGOhhGnDWxOFM
   HEk+HqXjz6BQ0FCtfBEFwflEcEsmktZwAOsRZn7+/g+r8nqGTENnQoqxK
   A==;
X-CSE-ConnectionGUID: j2icXlGGSvCHtqa8vBHXeQ==
X-CSE-MsgGUID: XiG3FmzuRi+xACMxNg44wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11443"; a="50031061"
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="50031061"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2025 19:49:02 -0700
X-CSE-ConnectionGUID: seJOt26RST+IPxw+frniWA==
X-CSE-MsgGUID: oXYolE6PTk24F782NKkRRw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,312,1739865600"; 
   d="scan'208";a="146619718"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 24 May 2025 19:49:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJ1Q2-000RaK-0o;
	Sun, 25 May 2025 02:48:58 +0000
Date: Sun, 25 May 2025 10:48:04 +0800
From: kernel test robot <lkp@intel.com>
To: Caleb James DeLisle <cjd@cjdns.fr>
Cc: oe-kbuild-all@lists.linux.dev,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>
Subject: [linux-next:master 11600/13331] 8250_of.c:undefined reference to
 `serial8250_get_port'
Message-ID: <202505251043.vL64Rcd5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   176e917e010cb7dcc605f11d2bc33f304292482b
commit: 35fb26f94dfa1b291086b84b2421f957214824d1 [11600/13331] mips: Add EcoNet MIPS platform support
config: mips-randconfig-r053-20250525 (https://download.01.org/0day-ci/archive/20250525/202505251043.vL64Rcd5-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505251043.vL64Rcd5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505251043.vL64Rcd5-lkp@intel.com/

All errors (new ones prefixed by >>):

   mips-linux-ld: drivers/tty/serial/8250/8250_of.o: in function `of_platform_serial_clk_notifier_cb':
>> 8250_of.c:(.text+0x9c): undefined reference to `serial8250_get_port'
>> mips-linux-ld: 8250_of.c:(.text+0xc4): undefined reference to `serial8250_update_uartclk'
   mips-linux-ld: drivers/tty/serial/8250/8250_of.o: in function `npcm_startup':
>> 8250_of.c:(.text+0x168): undefined reference to `serial8250_do_startup'
   mips-linux-ld: drivers/tty/serial/8250/8250_of.o: in function `of_platform_serial_remove':
>> 8250_of.c:(.text+0x1dc): undefined reference to `serial8250_unregister_port'
   mips-linux-ld: drivers/tty/serial/8250/8250_of.o: in function `of_platform_serial_setup':
>> 8250_of.c:(.text+0x364): undefined reference to `uart_read_and_validate_port_properties'
>> mips-linux-ld: 8250_of.c:(.text+0x4bc): undefined reference to `serial8250_em485_config'
   mips-linux-ld: 8250_of.c:(.text+0x4c8): undefined reference to `serial8250_em485_config'
>> mips-linux-ld: 8250_of.c:(.text+0x4c0): undefined reference to `serial8250_em485_supported'
   mips-linux-ld: 8250_of.c:(.text+0x4d0): undefined reference to `serial8250_em485_supported'
>> mips-linux-ld: 8250_of.c:(.text+0x4e0): undefined reference to `serial8250_em485_start_tx'
   mips-linux-ld: 8250_of.c:(.text+0x4e4): undefined reference to `serial8250_em485_start_tx'
>> mips-linux-ld: 8250_of.c:(.text+0x4ec): undefined reference to `serial8250_em485_stop_tx'
   mips-linux-ld: 8250_of.c:(.text+0x4f0): undefined reference to `serial8250_em485_stop_tx'
   mips-linux-ld: drivers/tty/serial/8250/8250_of.o: in function `of_platform_serial_probe':
>> 8250_of.c:(.text+0x744): undefined reference to `serial8250_register_8250_port'
>> mips-linux-ld: 8250_of.c:(.text+0x7b8): undefined reference to `serial8250_unregister_port'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for LEDS_EXPRESSWIRE
   Depends on [n]: GPIOLIB [=n] || NEW_LEDS [=y] && GPIOLIB [=n]
   Selected by [m]:
   - BACKLIGHT_KTD2801 [=m] && HAS_IOMEM [=y] && BACKLIGHT_CLASS_DEVICE [=m]
   WARNING: unmet direct dependencies detected for EARLY_PRINTK_8250
   Depends on [n]: EARLY_PRINTK [=n] && USE_GENERIC_EARLY_PRINTK_8250 [=y]
   Selected by [y]:
   - ECONET [=y]
   WARNING: unmet direct dependencies detected for SERIAL_OF_PLATFORM
   Depends on [n]: TTY [=n] && HAS_IOMEM [=y] && SERIAL_8250 [=n] && OF [=y]
   Selected by [y]:
   - ECONET [=y]

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
