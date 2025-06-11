Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D54F235058
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Jun 2025 07:39:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749627556; cv=none; b=PGOD1EIXh9tNMJ2XeZ8eitS1Cj+DWE3vG/h/Fo9+jYWFq44xPRSOK33vEnBwpezgGxyA223WenJeWreV7YtKTAarfl3LqksNONHanAaeoydBaO7Llqa7fA6p607t6d4CgGqdFjUCLo4KlNWkyie39hcXJyo+41ER+RzKH++Y0MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749627556; c=relaxed/simple;
	bh=V1OQ2chymJXxPZQAsJHT5N4Qh9kOnoWNeonjn8SC8ic=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OeW7VVdfsTegqyJMnkap52hYxQ0TdPt/AGrDmrEQ3L3F5dFBZ/nCoEujFPMnGu45eITGdsv5bKJ9M3a7hZCtNnyZwjjHb3nZWJAWm5nAdGq8EF0HS2PEUiENDN3GY+2QdXb70v03aPiAP3KI9PhHePp7zBgw9g5jccX2aur87Sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=b198BrR6; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="b198BrR6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749627555; x=1781163555;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=V1OQ2chymJXxPZQAsJHT5N4Qh9kOnoWNeonjn8SC8ic=;
  b=b198BrR6eOf+O9e54sw6DpStkAvg6R4CAHs83RagzbOWvGKlz/v5yDBu
   xmumVugmKdPSSwmIge6BAi73du1dXPnqXBXcIWbYO6kEomhe5lS6PgVNc
   wYZWvCsVsma/jZQcHjZZQxcWTisO72HZ2CYSFLbes4tssGkmpMREFb8if
   5Qvzk5R8hUkiJUdMeWj1KFf1P+hhlPMMR+IXaKWNPH6YdNCpeO9cigZCP
   Mn54ntNnReFNPKripUJKMCMmlMZv55Z3J5Xcg5DOfqalRjh/55GEe+7/S
   LOB2N0Ypr8s+16NPI806V7SAYgQtwOntvsKdq1ifERAOlNHJspY2iEHzt
   A==;
X-CSE-ConnectionGUID: qP0D1oDHRFKAmOEL5n1/9Q==
X-CSE-MsgGUID: H6X78jC6TXKm47HcpFNVQw==
X-IronPort-AV: E=McAfee;i="6800,10657,11460"; a="77165949"
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="77165949"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2025 00:39:14 -0700
X-CSE-ConnectionGUID: mAlBKfFeQC+BYfbajPRBIw==
X-CSE-MsgGUID: bRfK5qTGTfiP+Qqg6fvnpw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,227,1744095600"; 
   d="scan'208";a="184268137"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 11 Jun 2025 00:39:13 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uPG3C-000A8u-1x;
	Wed, 11 Jun 2025 07:39:10 +0000
Date: Wed, 11 Jun 2025 15:38:20 +0800
From: kernel test robot <lkp@intel.com>
To: Greg Ungerer <gerg@linux-m68k.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	uclinux-dev@uclinux.org
Subject: [gerg-m68knommu:dt 1/14] drivers/tty/serial/mcf.c:586 mcf_probe()
 warn: unsigned 'port->irq' is never less than zero.
Message-ID: <202506111514.txSKxqO9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/gerg/m68knommu.git dt
head:   a227d3c7914f7e7059bba92fc8a99e4be11b0abf
commit: b2003b0b32e6f27f160e4ace887dcab10e266999 [1/14] serial: mcf: convert to use proper platform resources
config: m68k-randconfig-r071-20250611 (https://download.01.org/0day-ci/archive/20250611/202506111514.txSKxqO9-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506111514.txSKxqO9-lkp@intel.com/

New smatch warnings:
drivers/tty/serial/mcf.c:586 mcf_probe() warn: unsigned 'port->irq' is never less than zero.

Old smatch warnings:
arch/m68k/include/asm/io_no.h:50 __cf_internalio() warn: always true condition '(addr <= 3758096384 + 536870912 - 1) => (0-u32max <= u32max)'

vim +586 drivers/tty/serial/mcf.c

   570	
   571	static int mcf_probe(struct platform_device *pdev)
   572	{
   573		struct uart_port *port;
   574		struct resource *res;
   575	
   576		if (pdev->id >= MCF_MAXPORTS)
   577			return -ENODEV;
   578		port = &mcf_ports[pdev->id].port;
   579	
   580		port->membase = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
   581		if (IS_ERR(port->membase))
   582			return PTR_ERR(port->membase);
   583		port->mapbase = res->start;
   584	
   585		port->irq = platform_get_irq(pdev, 0);
 > 586		if (port->irq < 0)
   587			return port->irq;
   588	
   589		port->line = pdev->id;
   590		port->type = PORT_MCF;
   591		port->dev = &pdev->dev;
   592		port->iotype = SERIAL_IO_MEM;
   593		port->uartclk = MCF_BUSCLK;
   594		port->ops = &mcf_uart_ops;
   595		port->flags = UPF_BOOT_AUTOCONF;
   596		port->rs485_config = mcf_config_rs485;
   597		port->rs485_supported = mcf_rs485_supported;
   598		port->has_sysrq = IS_ENABLED(CONFIG_SERIAL_MCF_CONSOLE);
   599	
   600		uart_add_one_port(&mcf_driver, port);
   601		return 0;
   602	}
   603	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
