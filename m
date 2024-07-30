Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC1718E02A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 16:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722356093; cv=none; b=Y6idGRpXcle5LRQ2hwfeQIfXxeq1+xJIfJI9EdBSxBIxJhnhjXW6H6h65+ZPY88QYnULRY/JHBRVhHzOb975rrq9NlGXcWXt5/45//LSXCkrYXSdm6qVZq+xWWkZptjJ1vBZ4VBuh3COWonuJCLwHwGgkHaKB+tdGyFqjd0ovrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722356093; c=relaxed/simple;
	bh=4a72O6L8OIbFVL7EkNhO1KnbsJIsY412iU3Jf3yYpus=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=XmeIUbBk9efzmtZ4nryPWw/xafYRS2iIHZSspCZwKWP/r8/m8BzA9WcVnFEbsNEAjFA4+V48Cw449o0h4Mqfx1Ck7Rwf0Xf/2555FYD7mAepoazjNgrFhmndBwECywQK25yvJCD8LWUGmot1zKMWq6Nv5g5ZDXXgTbHLOHMhq7A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LoTMxf1y; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LoTMxf1y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722356091; x=1753892091;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4a72O6L8OIbFVL7EkNhO1KnbsJIsY412iU3Jf3yYpus=;
  b=LoTMxf1y7Z1Wqx27vL5lScMmc0leGi//7seIB2l/aQvtqzTqSCQgh67T
   QnN3wbj28HAc5R2bCJsg+oSUupc5ATZ2PcAUt0oGnWfHccaGWPa4F9cLx
   PgOYPLpGYlbNjL34W5R9c3V5Zc1KvFSUgBP19idvhodCJ3TV0claq75Gs
   YLu5ZVtNOW5w7Lrd5rSpooNeBDz4Ra+mx4yQO+nmjpEycuv1bwrEHU9FJ
   jg6tFvCPhdjClYthAJKtE3F713D4unIZXUV+xa3N3Z2JoLyVYYsT8VGeg
   aF39CU5oQaet3O4QbInAv7JaJ98HdbAs55/JDO9a+kqx0CDPV0SQi8oxd
   g==;
X-CSE-ConnectionGUID: MI4U56GjSwuX9+m7vks2QA==
X-CSE-MsgGUID: RbJiFW5cRm2o1FSw/J3F2w==
X-IronPort-AV: E=McAfee;i="6700,10204,11149"; a="19992113"
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="19992113"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jul 2024 09:14:49 -0700
X-CSE-ConnectionGUID: +udG53ALQiSeGwVZ1nWgtA==
X-CSE-MsgGUID: HkB7q7cvReWOAbQxDzP1Tg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,248,1716274800"; 
   d="scan'208";a="54369804"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 30 Jul 2024 09:14:47 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYpUr-000t5U-1H;
	Tue, 30 Jul 2024 16:14:45 +0000
Date: Wed, 31 Jul 2024 00:14:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v7_611_rc1_full 40/40]
 drivers/tty/serial/8250/8250_platform.c:111:40: warning: excess elements in
 struct initializer
Message-ID: <202407310023.h0JgJG1C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v7_611_rc1_full
head:   4423be73ba644a89e48da1cebbdf901f04b801f3
commit: 4423be73ba644a89e48da1cebbdf901f04b801f3 [40/40] serial: 8250_platform: Enable generic 16550A platform devices
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20240731/202407310023.h0JgJG1C-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240731/202407310023.h0JgJG1C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407310023.h0JgJG1C-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_platform.c: In function 'serial8250_platform_probe':
>> drivers/tty/serial/8250/8250_platform.c:111:40: warning: excess elements in struct initializer
     111 |         struct uart_8250_port uart = { 0 };
         |                                        ^
   drivers/tty/serial/8250/8250_platform.c:111:40: note: (near initialization for 'uart.port.lock.<anonymous>.rlock.raw_lock')
   drivers/tty/serial/8250/8250_platform.c: At top level:
   drivers/tty/serial/8250/8250_platform.c:271:36: warning: 'acpi_platform_serial_table' defined but not used [-Wunused-const-variable=]
     271 | static const struct acpi_device_id acpi_platform_serial_table[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~~~~~~~~


vim +111 drivers/tty/serial/8250/8250_platform.c

   104	
   105	/*
   106	 * Generic 16550A platform devices
   107	 */
   108	static int serial8250_platform_probe(struct platform_device *pdev)
   109	{
   110		struct device *dev = &pdev->dev;
 > 111		struct uart_8250_port uart = { 0 };
   112		struct resource *regs;
   113		unsigned char iotype;
   114		int ret, line;
   115	
   116		regs = platform_get_resource(pdev, IORESOURCE_IO, 0);
   117		if (regs) {
   118			uart.port.iobase = regs->start;
   119			iotype = UPIO_PORT;
   120		} else {
   121			regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   122			if (!regs) {
   123				dev_err(dev, "no registers defined\n");
   124				return -EINVAL;
   125			}
   126	
   127			uart.port.mapbase = regs->start;
   128			uart.port.mapsize = resource_size(regs);
   129			uart.port.flags = UPF_IOREMAP;
   130			iotype = UPIO_MEM;
   131		}
   132	
   133		/* Default clock frequency*/
   134		uart.port.uartclk = 1843200;
   135		uart.port.type = PORT_16550A;
   136		uart.port.dev = &pdev->dev;
   137		uart.port.flags |= UPF_SKIP_TEST | UPF_BOOT_AUTOCONF;
   138		ret = uart_read_and_validate_port_properties(&uart.port);
   139		/* no interrupt -> fall back to polling */
   140		if (ret == -ENXIO)
   141			ret = 0;
   142		if (ret)
   143			return ret;
   144	
   145		if (uart.port.mapbase) {
   146			uart.port.membase = devm_ioremap(dev, uart.port.mapbase, uart.port.mapsize);
   147			if (!uart.port.membase)
   148				return -ENOMEM;
   149		}
   150	
   151		/*
   152		 * The previous call may not set iotype correctly when reg-io-width
   153		 * property is absent and it doesn't support IO port resource.
   154		 */
   155		uart.port.iotype = iotype;
   156	
   157		line = serial8250_register_8250_port(&uart);
   158		if (line < 0)
   159			return -ENODEV;
   160	
   161		return 0;
   162	}
   163	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
