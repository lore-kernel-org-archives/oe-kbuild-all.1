Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4123A1F3D49
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Mar 2025 23:50:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741045801; cv=none; b=CqqJGYfwrhRP+woml71NG9/vJA9UuuXb36wRcczjd3AmHEN9LGdZ23YEgfemorEbWfSobEut7N0ZBfhK5KHow78rI3IBI/nZdtNPW+ezU6Eo3zrYDKSlaNp0josMWyAjCo3UCvQuwbhYoPFUO2i84nPZLSvWLf1yMoNAUeCsh14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741045801; c=relaxed/simple;
	bh=RIBL57Blh5gRCzhjiQ/v9UxL0pUwGuZsXjiHokvr04I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=VHTuG0pVSO3e00w2+cZtW/UEbh579DdPKizpxA3uuFbwM8aToqQGgg1TqtWacqD1xTAq26yDwm+S+ma4e55/fRyNuhTTi65Pi1wdyQx0CKWjD7g9b/avBQguUQkpInbHFOuavvA5ULMTkxjQYqSp5dnSVhiVtEWdQevKIxxA3js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dvWwtb6Y; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dvWwtb6Y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741045800; x=1772581800;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RIBL57Blh5gRCzhjiQ/v9UxL0pUwGuZsXjiHokvr04I=;
  b=dvWwtb6Y6S/7Wg644ETMB9fHn9Vjcxk8lCSPARQtsNVHKhSt0vJ/krj1
   2uGwnFEhMS9u5gqEVE+1xUzaa5/V9q/Tqy1KfR1Jz7LPbbFY9ehsOeG/q
   tVhV7ps6KA2F1tzxapmqn1Il4CeNMVSiBvGznSPKBeUlWNiaSJZFklEaf
   XZlBOqdR1QARf1wSOV8RwlRJ35HrE4/L6FY8oboFfChKl9GU0pDdi8UL2
   NZflgyUzJi8Dvee7buXkGcUqRdQp0zSjKym2Jdwy0khcSW6rEOJ0OntL+
   1B//ubIoilIGk8BmlZPOmMQ9lyOpFnwZuCfkA3/QKEQyoX5YBlJipCvc7
   w==;
X-CSE-ConnectionGUID: E3kXDuMyQtCqTg8QxA6eGQ==
X-CSE-MsgGUID: h9FXMSqXQiK7trqA/vJC6w==
X-IronPort-AV: E=McAfee;i="6700,10204,11362"; a="41652197"
X-IronPort-AV: E=Sophos;i="6.13,331,1732608000"; 
   d="scan'208";a="41652197"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Mar 2025 15:49:56 -0800
X-CSE-ConnectionGUID: mUdCGr6oTrql1hqNyAwlyw==
X-CSE-MsgGUID: JuTY1dQMRLqMdLT6YbGn9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="118042209"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 03 Mar 2025 15:49:56 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpFXl-000J3G-0Q;
	Mon, 03 Mar 2025 23:49:53 +0000
Date: Tue, 4 Mar 2025 07:49:10 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 88/89] drivers/tty/serial/8250/8250_fsl.c:136:22:
 error: 'struct uart_port' has no member named 'handle_irq'
Message-ID: <202503040705.TKbxP7gU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   2e34f839068291b65952cdcabb82b977d40d165c
commit: 7c9b7cd343b314fdb523ff791b9852f0b2b05b6a [88/89] ops2
config: x86_64-buildonly-randconfig-003-20250304 (https://download.01.org/0day-ci/archive/20250304/202503040705.TKbxP7gU-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250304/202503040705.TKbxP7gU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503040705.TKbxP7gU-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_fsl.c: In function 'fsl8250_acpi_probe':
>> drivers/tty/serial/8250/8250_fsl.c:136:22: error: 'struct uart_port' has no member named 'handle_irq'
     136 |         port8250.port.handle_irq        = fsl8250_handle_irq;
         |                      ^


vim +136 drivers/tty/serial/8250/8250_fsl.c

28f5cb3715006b Geert Uytterhoeven 2021-09-15  105  
11361610b00500 kuldip dwivedi     2020-09-03  106  static int fsl8250_acpi_probe(struct platform_device *pdev)
11361610b00500 kuldip dwivedi     2020-09-03  107  {
11361610b00500 kuldip dwivedi     2020-09-03  108  	struct fsl8250_data *data;
11361610b00500 kuldip dwivedi     2020-09-03  109  	struct uart_8250_port port8250;
11361610b00500 kuldip dwivedi     2020-09-03  110  	struct device *dev = &pdev->dev;
11361610b00500 kuldip dwivedi     2020-09-03  111  	struct resource *regs;
11361610b00500 kuldip dwivedi     2020-09-03  112  
11361610b00500 kuldip dwivedi     2020-09-03  113  	int ret, irq;
11361610b00500 kuldip dwivedi     2020-09-03  114  
11361610b00500 kuldip dwivedi     2020-09-03  115  	regs = platform_get_resource(pdev, IORESOURCE_MEM, 0);
11361610b00500 kuldip dwivedi     2020-09-03  116  	if (!regs) {
11361610b00500 kuldip dwivedi     2020-09-03  117  		dev_err(dev, "no registers defined\n");
11361610b00500 kuldip dwivedi     2020-09-03  118  		return -EINVAL;
11361610b00500 kuldip dwivedi     2020-09-03  119  	}
11361610b00500 kuldip dwivedi     2020-09-03  120  
11361610b00500 kuldip dwivedi     2020-09-03  121  	irq = platform_get_irq(pdev, 0);
b9edc6823d1875 Wang Qing          2021-03-13  122  	if (irq < 0)
11361610b00500 kuldip dwivedi     2020-09-03  123  		return irq;
11361610b00500 kuldip dwivedi     2020-09-03  124  
11361610b00500 kuldip dwivedi     2020-09-03  125  	memset(&port8250, 0, sizeof(port8250));
11361610b00500 kuldip dwivedi     2020-09-03  126  
11361610b00500 kuldip dwivedi     2020-09-03  127  	ret = device_property_read_u32(dev, "clock-frequency",
11361610b00500 kuldip dwivedi     2020-09-03  128  					&port8250.port.uartclk);
11361610b00500 kuldip dwivedi     2020-09-03  129  	if (ret)
11361610b00500 kuldip dwivedi     2020-09-03  130  		return ret;
11361610b00500 kuldip dwivedi     2020-09-03  131  
11361610b00500 kuldip dwivedi     2020-09-03  132  	spin_lock_init(&port8250.port.lock);
11361610b00500 kuldip dwivedi     2020-09-03  133  
11361610b00500 kuldip dwivedi     2020-09-03  134  	port8250.port.mapbase           = regs->start;
11361610b00500 kuldip dwivedi     2020-09-03  135  	port8250.port.irq               = irq;
11361610b00500 kuldip dwivedi     2020-09-03 @136  	port8250.port.handle_irq        = fsl8250_handle_irq;
11361610b00500 kuldip dwivedi     2020-09-03  137  	port8250.port.type              = PORT_16550A;
11361610b00500 kuldip dwivedi     2020-09-03  138  	port8250.port.flags             = UPF_SHARE_IRQ | UPF_BOOT_AUTOCONF
11361610b00500 kuldip dwivedi     2020-09-03  139  						| UPF_FIXED_PORT | UPF_IOREMAP
11361610b00500 kuldip dwivedi     2020-09-03  140  						| UPF_FIXED_TYPE;
11361610b00500 kuldip dwivedi     2020-09-03  141  	port8250.port.dev               = dev;
11361610b00500 kuldip dwivedi     2020-09-03  142  	port8250.port.mapsize           = resource_size(regs);
11361610b00500 kuldip dwivedi     2020-09-03  143  	port8250.port.iotype            = UPIO_MEM;
11361610b00500 kuldip dwivedi     2020-09-03  144  	port8250.port.irqflags          = IRQF_SHARED;
11361610b00500 kuldip dwivedi     2020-09-03  145  
11361610b00500 kuldip dwivedi     2020-09-03  146  	port8250.port.membase = devm_ioremap(dev,  port8250.port.mapbase,
11361610b00500 kuldip dwivedi     2020-09-03  147  							port8250.port.mapsize);
11361610b00500 kuldip dwivedi     2020-09-03  148  	if (!port8250.port.membase)
11361610b00500 kuldip dwivedi     2020-09-03  149  		return -ENOMEM;
11361610b00500 kuldip dwivedi     2020-09-03  150  
11361610b00500 kuldip dwivedi     2020-09-03  151  	data = devm_kzalloc(dev, sizeof(*data), GFP_KERNEL);
11361610b00500 kuldip dwivedi     2020-09-03  152  	if (!data)
11361610b00500 kuldip dwivedi     2020-09-03  153  		return -ENOMEM;
11361610b00500 kuldip dwivedi     2020-09-03  154  
11361610b00500 kuldip dwivedi     2020-09-03  155  	data->line = serial8250_register_8250_port(&port8250);
11361610b00500 kuldip dwivedi     2020-09-03  156  	if (data->line < 0)
11361610b00500 kuldip dwivedi     2020-09-03  157  		return data->line;
11361610b00500 kuldip dwivedi     2020-09-03  158  
11361610b00500 kuldip dwivedi     2020-09-03  159  	platform_set_drvdata(pdev, data);
11361610b00500 kuldip dwivedi     2020-09-03  160  	return 0;
11361610b00500 kuldip dwivedi     2020-09-03  161  }
11361610b00500 kuldip dwivedi     2020-09-03  162  

:::::: The code at line 136 was first introduced by commit
:::::: 11361610b00500c4afe269ff5a4fe06d58f0a3d0 serial: 8250_fsl: Add ACPI support

:::::: TO: kuldip dwivedi <kuldip.dwivedi@puresoftware.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
