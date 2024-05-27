Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19D021DDC9
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 May 2024 18:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716833416; cv=none; b=W+U2IgjIYpJtgmppuCMe9iPsCOxCfbhOxB3DCBNPKIB2nJZwCUQpUo7SysyTa1mV7hSc9H/T7u6Q76deQJnDu+YFqBMAvCjuhtJ5CHWJOCf9laFXxqoCYj0ca/VaJGzZ/YlWRknO8AxqlGvDL0GEoeUcmv54POdyVk22G3MaqRk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716833416; c=relaxed/simple;
	bh=txFnjIOk8NIMk3iXNU/OmAPnJUVbLNNWfUipGuM7lGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=p1nApOVpOYqan+COuAQnyjnvg/q9aHXPePQVMuoj2sMHiWY6ajM7jKVcVsD8O0BzU6VaI7a0XmBIJ+J5vgdDdswknaj9q2I3mMDb9yRnketK0hOLVhg7D53PplGvhOhM0O8aH5dtCUTM1ENitIcs0qvdaaS01+pB7wCsZAVunG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=f+tEkcQ7; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="f+tEkcQ7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716833414; x=1748369414;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=txFnjIOk8NIMk3iXNU/OmAPnJUVbLNNWfUipGuM7lGk=;
  b=f+tEkcQ7E8fghnFE54waB6t9W9wGm/jrFV8s8NvG+SCnvP9e1DRt96Dj
   5K1jRgGxmUVRhLQOS9NFrV1o3XYmjPgTxAaabO809NCYmwHusn/3dyblX
   Bqw30u6WeBuyXN8Mlgby5ozVY/lMzw01YrBnk93q601oEus4pMmLfgikb
   kjcZLaF207aIm6lWZIu4IubDudvGwDwoI3jaB3SIfnP3ko+aTNtjysBIT
   ofkgnTIsLc/4mbfL4qcbZ4rf36frg8K3TjSkEjXQJJEm+F2OeEsC3bLWf
   8DUjZblb2fPkA27Vx1CMBgGFG8ToJON0TNDgzm37XbbqmuANb4gTVHkii
   Q==;
X-CSE-ConnectionGUID: 7B3gf/SVSCeWG9zorXDudw==
X-CSE-MsgGUID: I3xBWcGuSxS0qkNkz7trGw==
X-IronPort-AV: E=McAfee;i="6600,9927,11085"; a="30687788"
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="30687788"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 May 2024 11:10:13 -0700
X-CSE-ConnectionGUID: OcKcnugsTp6BmsQWX+zvVQ==
X-CSE-MsgGUID: QxNJG0z+Qh6A4BnJGzryAg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,193,1712646000"; 
   d="scan'208";a="34805485"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 27 May 2024 11:10:12 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sBenE-000Az9-13;
	Mon, 27 May 2024 18:10:10 +0000
Date: Tue, 28 May 2024 02:08:06 +0800
From: kernel test robot <lkp@intel.com>
To: Sunil V L <sunilvl@ventanamicro.com>
Cc: oe-kbuild-all@lists.linux.dev, Anup Patel <anup@brainfault.org>
Subject: [avpatel:riscv_acpi_b2_v6_610_rc1_full /54]
 drivers/tty/serial/8250/8250_platform.c:202:37: error: implicit declaration
 of function 'devm_ioremap'
Message-ID: <202405280220.f0zHBllE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/avpatel/linux.git riscv_acpi_b2_v6_610_rc1_full
head:   13e1f10998ff5fe93a40fde35d93d4fb3a3d1c16
commit: b46a331e996d877983f97d4636e86d9c608bb69b [/54] serial: 8250_platform: Enable generic 16550A platform devices
config: i386-buildonly-randconfig-001-20240527 (https://download.01.org/0day-ci/archive/20240528/202405280220.f0zHBllE-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240528/202405280220.f0zHBllE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405280220.f0zHBllE-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_platform.c: In function 'serial8250_platform_probe':
>> drivers/tty/serial/8250/8250_platform.c:202:37: error: implicit declaration of function 'devm_ioremap' [-Werror=implicit-function-declaration]
     202 |                 uart.port.membase = devm_ioremap(dev, uart.port.mapbase, uart.port.mapsize);
         |                                     ^~~~~~~~~~~~
>> drivers/tty/serial/8250/8250_platform.c:202:35: warning: assignment to 'unsigned char *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
     202 |                 uart.port.membase = devm_ioremap(dev, uart.port.mapbase, uart.port.mapsize);
         |                                   ^
   cc1: some warnings being treated as errors


vim +/devm_ioremap +202 drivers/tty/serial/8250/8250_platform.c

   160	
   161	/*
   162	 * Generic 16550A platform devices
   163	 */
   164	static int serial8250_platform_probe(struct platform_device *pdev)
   165	{
   166		struct device *dev = &pdev->dev;
   167		struct uart_8250_port uart;
   168		struct resource *regs;
   169		unsigned char iotype;
   170		int ret, line;
   171	
   172		memset(&uart, 0, sizeof(uart));
   173		regs = platform_get_resource(pdev, IORESOURCE_IO, 0);
   174		if (regs) {
   175			uart.port.iobase = regs->start;
   176			iotype = UPIO_PORT;
   177		} else {
   178			regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
   179			if (!regs) {
   180				dev_err(dev, "no registers defined\n");
   181				return -EINVAL;
   182			}
   183	
   184			uart.port.mapbase = regs->start;
   185			uart.port.mapsize = resource_size(regs);
   186			uart.port.flags = UPF_IOREMAP;
   187			iotype = UPIO_MEM;
   188		}
   189	
   190		uart.port.uartclk = 1843200; // default
   191		uart.port.type = PORT_16550A;
   192		uart.port.dev = &pdev->dev;
   193		uart.port.flags |= UPF_SKIP_TEST | UPF_BOOT_AUTOCONF;
   194		ret = uart_read_and_validate_port_properties(&uart.port);
   195		/* no interrupt -> fall back to polling */
   196		if (ret == -ENXIO)
   197			ret = 0;
   198		if (ret)
   199			return ret;
   200	
   201		if (uart.port.mapbase) {
 > 202			uart.port.membase = devm_ioremap(dev, uart.port.mapbase, uart.port.mapsize);
   203			if (!uart.port.membase)
   204				return -ENOMEM;
   205		}
   206	
   207		/*
   208		 * The previous call may not set iotype correctly when reg-io-width
   209		 * property is absent and it doesn't support IO port resource.
   210		 */
   211		uart.port.iotype = iotype;
   212	
   213		line = serial8250_register_8250_port(&uart);
   214		if (line < 0)
   215			return -ENODEV;
   216	
   217		platform_set_drvdata(pdev, (void *)((long)line + 1));
   218		return 0;
   219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
