Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30465D2E6
	for <oe-kbuild-all@lists.linux.dev>; Sat, 18 May 2024 08:32:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716021173; cv=none; b=b/17EVkk/bE09guxfvB4jZU2wdu8igHHK2jYNtGnXt+HDZ/Jqt++CFxgTdmKp2eDXLKyQK4FNag824L2m19/+vEGl1vuln83rJmVJtN2LapIPofRDg++uOQCaOKPjsQXLWF8GS5epfOkfqnlOXjLO41TvkC2sqks/ZmAb8o8hfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716021173; c=relaxed/simple;
	bh=zo7DRq/4QjuZBpcCTCaeaRIRgCVsIcmNeWFDQ2zbL3s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=bNrp/lhgBkb1baR7D5ZZLZwLfWowJn+73ADRD/bXv9WYZcOjEKRAxu+bSE0cUP8f3Zt1zmj5FoGY7WlvNnZtKC3WC8MLzB5SSNRJ6XS5q6SbVbpF0wDoUdzduPkRhFYDci8uDIQ2/qd2B27+k7USAs8P0WlAa9Wy61jeOZ29CI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f29Znz9X; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f29Znz9X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716021171; x=1747557171;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=zo7DRq/4QjuZBpcCTCaeaRIRgCVsIcmNeWFDQ2zbL3s=;
  b=f29Znz9XQKf5YUrClHiC7bY0GArXksQNB8Q+vpsSwIw+c9DSwsW+Ljwv
   xBRiuO73JYit44WFD7UoFajjVgJPjxYK3+jGnrgwZZPSxAPuIuzLRFTCv
   xFXp/5vvLUpwG+VIqMTvMleSqi5zGhjK/Ng66ggwFhyqqshVA5+1jCtiT
   Pz1+euaUuJ3dMdQxCNsc/RQxVYXe9owthnxsNupt7lNaIVzq8Qrf358Om
   WkYp7xmZQM80DZCkmIjcC/envlb/4UOGjb8Jd1ulvM/h+023FtH98ZkgD
   VR8xBvhkc0cyl5DIu9CqXOL9eT36u9PKAcTQN21kQleLfxnwn4K8YGxtZ
   Q==;
X-CSE-ConnectionGUID: VRidISHPROeYfGahiiZgFA==
X-CSE-MsgGUID: tDvLeEIFRCCmxZOznmEz+Q==
X-IronPort-AV: E=McAfee;i="6600,9927,11075"; a="22785532"
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="22785532"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 May 2024 01:32:50 -0700
X-CSE-ConnectionGUID: r4qn/rjmQuKPIySmyd1egg==
X-CSE-MsgGUID: wXw6CEOIRyieVMkwe3Tmlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,170,1712646000"; 
   d="scan'208";a="55253741"
Received: from unknown (HELO 108735ec233b) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 18 May 2024 01:32:49 -0700
Received: from kbuild by 108735ec233b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s8FUk-0001tY-2o;
	Sat, 18 May 2024 08:32:46 +0000
Date: Sat, 18 May 2024 16:31:58 +0800
From: kernel test robot <lkp@intel.com>
To: Hector Martin <marcan@marcan.st>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Janne Grunau <j@jannau.net>
Subject: [arm-platforms:kvm-arm64/mmu-pgt 309/874]
 drivers/tty/serial/samsung_tty.c:2083:9: warning: this 'if' clause does not
 guard...
Message-ID: <202405181632.YNCFFwoE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.git kvm-arm64/mmu-pgt
head:   1ed29f79e7c6441ef29c25a43d7c82d91e884dcc
commit: 05c68699aca4de1b69a49a8a6b2b80ff2956cf12 [309/874] tty: serial: samsung_tty: Support runtime PM
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240518/202405181632.YNCFFwoE-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240518/202405181632.YNCFFwoE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405181632.YNCFFwoE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/samsung_tty.c: In function 's3c24xx_serial_remove':
>> drivers/tty/serial/samsung_tty.c:2083:9: warning: this 'if' clause does not guard... [-Wmisleading-indentation]
    2083 |         if (port)
         |         ^~
   drivers/tty/serial/samsung_tty.c:2085:17: note: ...this statement, but the latter is misleadingly indented as if it were guarded by the 'if'
    2085 |                 uart_remove_one_port(&s3c24xx_uart_drv, port);
         |                 ^~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/samsung_tty.c: In function 's3c24xx_serial_init_port':
   drivers/tty/serial/samsung_tty.c:1808:49: warning: '%d' directive writing between 1 and 3 bytes into a region of size 2 [-Wformat-overflow=]
    1808 |                 sprintf(clk_name, "clk_uart_baud%d", clk_num);
         |                                                 ^~
   In function 's3c24xx_serial_enable_baudclk',
       inlined from 's3c24xx_serial_init_port' at drivers/tty/serial/samsung_tty.c:1914:8:
   drivers/tty/serial/samsung_tty.c:1808:35: note: directive argument in the range [0, 254]
    1808 |                 sprintf(clk_name, "clk_uart_baud%d", clk_num);
         |                                   ^~~~~~~~~~~~~~~~~
   drivers/tty/serial/samsung_tty.c:1808:17: note: 'sprintf' output between 15 and 17 bytes into a destination of size 15
    1808 |                 sprintf(clk_name, "clk_uart_baud%d", clk_num);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/tty/serial/samsung_tty.c: In function 's3c24xx_serial_console_setup':
   drivers/tty/serial/samsung_tty.c:2357:49: warning: '%d' directive writing between 1 and 3 bytes into a region of size 2 [-Wformat-overflow=]
    2357 |                 sprintf(clk_name, "clk_uart_baud%d", clk_sel);
         |                                                 ^~
   In function 's3c24xx_serial_get_options',
       inlined from 's3c24xx_serial_console_setup' at drivers/tty/serial/samsung_tty.c:2402:3:
   drivers/tty/serial/samsung_tty.c:2357:35: note: directive argument in the range [0, 255]
    2357 |                 sprintf(clk_name, "clk_uart_baud%d", clk_sel);
         |                                   ^~~~~~~~~~~~~~~~~
   drivers/tty/serial/samsung_tty.c:2357:17: note: 'sprintf' output between 15 and 17 bytes into a destination of size 15
    2357 |                 sprintf(clk_name, "clk_uart_baud%d", clk_sel);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/if +2083 drivers/tty/serial/samsung_tty.c

b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2077  
77772addc1f110 drivers/tty/serial/samsung_tty.c Uwe Kleine-König 2023-11-10  2078  static void s3c24xx_serial_remove(struct platform_device *dev)
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2079  {
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2080  	struct uart_port *port = s3c24xx_dev_to_port(&dev->dev);
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2081  	struct s3c24xx_uart_port *ourport = to_ourport(port);
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2082  
b1617c7888476e drivers/tty/serial/samsung_tty.c Tudor Ambarus    2024-01-19 @2083  	if (port)
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2084  		pm_runtime_get_sync(&dev->dev);
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2085  		uart_remove_one_port(&s3c24xx_uart_drv, port);
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2086  
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2087  		clk_disable_unprepare(ourport->clk);
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2088  		if (!IS_ERR(ourport->baudclk))
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2089  			clk_disable_unprepare(ourport->baudclk);
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2090  
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2091  		pm_runtime_disable(&dev->dev);
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2092  		pm_runtime_set_suspended(&dev->dev);
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2093  		pm_runtime_put_noidle(&dev->dev);
05c68699aca4de drivers/tty/serial/samsung_tty.c Hector Martin    2021-09-20  2094  
6f134c3c770355 drivers/tty/serial/samsung.c     Tushar Behera    2014-01-20  2095  	uart_unregister_driver(&s3c24xx_uart_drv);
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2096  }
b497549a035c2a drivers/serial/samsung.c         Ben Dooks        2008-07-03  2097  

:::::: The code at line 2083 was first introduced by commit
:::::: b1617c7888476e69e5b03b89eedef2bd2c60901e tty: serial: samsung: remove braces on single statement block

:::::: TO: Tudor Ambarus <tudor.ambarus@linaro.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
