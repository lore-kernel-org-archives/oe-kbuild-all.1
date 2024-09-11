Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1D775D915
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Sep 2024 10:32:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726050770; cv=none; b=XK+VraHgHftxiAb8niRG1hqYHGBCOXIUKGK0PCZ7JYigA1o96eDu8r8Zh7ekcP6O+7llk4metI/ILqZB+lb5eC0lGWPE85RwZR1FvR1gh0kK0YpayLIJ4+Oh1GhEZDtwVrafTJLk/6J8DxtpbZZDdR0ueUzF9S/i9HRkDzOQj9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726050770; c=relaxed/simple;
	bh=/xdITSLdE9Wa4zpJU6W8LjGWxxiWYzosX6fjhPaeSbI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tDUAycSSULNeTiLovNUUdXH6toLrMLaDyjFn1+pynZJtfQQLT7Rv3LL9SW/L2z0v9y4NuNTS2FJRqj8T0at/WYQIBwWVYQ6f1GawWdmkwRW9CJb+ZBtwZM63hvi/6tAlTawDXfH3cnYExg5KSuA9Pq8BMi8SJmfLWDRQXvSyi5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LgStAX50; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LgStAX50"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726050769; x=1757586769;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/xdITSLdE9Wa4zpJU6W8LjGWxxiWYzosX6fjhPaeSbI=;
  b=LgStAX50rc3EkGQehtZztbUOp0qKL22vW8Qx7B7JZD3vVDPZouUxkXSK
   iNoe9CGel9u5WeC/PvqwOhR97ufo5BMErJI45ImVzRW1bjmSIWsLDREXZ
   cV2mAQ1iBAn++fP8UqvBORoavvPcMX/rLnDYygBy9Nu5IOxltttNAXLqf
   oJq4m0AanI2Zp14PmXoq7CF+2yatUpQqZ8+Sood29MQbLfcembEBEpzu3
   wgGdPv8p6tGVEuexsFeEVG64NAxHPBOdJLlD4l5tiUVXuN5emaO7KP+Ic
   KSav58sRczd8MEtt+LvZFXOxA+Tf5Hn0EsVaUtbEgjAqFyAfl32K9YA4E
   w==;
X-CSE-ConnectionGUID: tcFJXaUuQN2JkCqlLm+w6w==
X-CSE-MsgGUID: 3WgpUQfDSxijYk4Qr6QZFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11191"; a="28728760"
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="28728760"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Sep 2024 03:32:48 -0700
X-CSE-ConnectionGUID: SWJ6ZIXxS3iz1hT30xwu/A==
X-CSE-MsgGUID: tiesvAoCRbqPqyKeKhodPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,219,1719903600"; 
   d="scan'208";a="72314733"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 11 Sep 2024 03:32:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1soKeS-0003Oc-1w;
	Wed, 11 Sep 2024 10:32:44 +0000
Date: Wed, 11 Sep 2024 18:32:19 +0800
From: kernel test robot <lkp@intel.com>
To: Marc Zyngier <maz@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: [arm-platforms:kvm-arm64/asahi-base-6.11 23/29]
 drivers/tty/serial/samsung_tty.c:2085:9: warning: this 'if' clause does not
 guard...
Message-ID: <202409111813.9z0YpifN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/asahi-base-6.11
head:   0619e126e13837cf7e2cc8dfda13d762d37dc10a
commit: ce041b76229de01c9de3bd890e2710b59f23bf1c [23/29] Revert "fixup! tty: serial: samsung_tty: Support runtime PM"
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240911/202409111813.9z0YpifN-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240911/202409111813.9z0YpifN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409111813.9z0YpifN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/samsung_tty.c: In function 's3c24xx_serial_remove':
>> drivers/tty/serial/samsung_tty.c:2085:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
    2085 |         if (port)
         |         ^~
   drivers/tty/serial/samsung_tty.c:2087:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    2087 |                 uart_remove_one_port(&s3c24xx_uart_drv, port);
         |                 ^~~~~~~~~~~~~~~~~~~~


vim +/if +2085 drivers/tty/serial/samsung_tty.c

  2079	
  2080	static void s3c24xx_serial_remove(struct platform_device *dev)
  2081	{
  2082		struct uart_port *port = s3c24xx_dev_to_port(&dev->dev);
  2083		struct s3c24xx_uart_port *ourport = to_ourport(port);
  2084	
> 2085		if (port)
  2086			pm_runtime_get_sync(&dev->dev);
  2087			uart_remove_one_port(&s3c24xx_uart_drv, port);
  2088	
  2089			clk_disable_unprepare(ourport->clk);
  2090			if (!IS_ERR(ourport->baudclk))
  2091				clk_disable_unprepare(ourport->baudclk);
  2092	
  2093			pm_runtime_disable(&dev->dev);
  2094			pm_runtime_set_suspended(&dev->dev);
  2095			pm_runtime_put_noidle(&dev->dev);
  2096	
  2097		uart_unregister_driver(&s3c24xx_uart_drv);
  2098	}
  2099	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
