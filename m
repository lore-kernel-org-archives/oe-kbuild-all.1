Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1258C20468E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Aug 2026 01:32:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787016760; cv=none; b=jQ9GrROo6JVhFJeM54xvECjlAnRycu4/S5kj32/ZY3fZcjWnygOEJkLBtKYMMV0zEi2SkpgNhmaPo0NYVHaw1Q5fghKio+YsYacq6sSE5uDHjtHNTktVhzwDvFO53Teqf97ex/M3Mn2HiKxXszRbMsMOHX90ylhs1snJgdnQzVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787016760; c=relaxed/simple;
	bh=+UgYDD+IBAxwuOEmysonUttHKuflztgUkh8pIkuo0bw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=tXVAfQQEkjjBExsIAzqTnYrJao1EJvfI/7owmqMueqtuqkGhk4ajdDLiQG3k1Ts0lmLVlMBXXwtDKnuRYIW4/Mwc8SycWbwzVUXXku+EMIA38apOFt1O+j/N3ZIuuv+qUs+ZKKwjLfp+JYVAKGOcsh0jJAARJZUUHVxyxL/ctEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bas6t7Cz; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bas6t7Cz"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787016757; x=1818552757;
  h=date:from:to:cc:subject:message-id;
  bh=+UgYDD+IBAxwuOEmysonUttHKuflztgUkh8pIkuo0bw=;
  b=bas6t7Czr+l23ZwNCPXuF9MXPmeHV6gdTw4MZnOsIXPAtSSHOs97Ckm0
   YZ/sF2boVFYeFDgm7OrkoEgDNZbB9zGXDgzM2RQA1EnnWRS62WbL3l9UO
   l+TrUXlZ+NBifpj3S6CE/zewUCUT2GYKdYXqBjDo4VNes5N7SEpjOXR1k
   Y3G9qcIMetUcbgsXDZQB1mCIHSsTt/QeCyRXLwNeyK/ICNl8dM8qAvNyA
   786TMHw+/boJvQ1uaY2LxF5qBMpJYVLmVjqOu0NVCgKGBRH+iMzLnBd75
   Gd2b5QRdboStvCo2erGkL8Em4dslfQIfTdPJkgdrRPee31OwP2cEZ6W5k
   Q==;
X-CSE-ConnectionGUID: 9lzTg6TRRiOJB3Omo5z1oQ==
X-CSE-MsgGUID: NlXUp4xrTMObauEhkGI/Ig==
X-IronPort-AV: E=McAfee;i="6800,10657,11878"; a="113040630"
X-IronPort-AV: E=Sophos;i="6.25,230,1779174000"; 
   d="scan'208";a="113040630"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2026 18:32:36 -0700
X-CSE-ConnectionGUID: zPaMgmFhRUqv0oX5KkhcLA==
X-CSE-MsgGUID: L/wAQ+f0TqC+7Q0jUcRptg==
X-ExtLoop1: 1
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 17 Aug 2026 18:32:35 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1ww8gq-00000000e0g-20SL;
	Tue, 18 Aug 2026 01:32:32 +0000
Date: Tue, 18 Aug 2026 09:32:29 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 26/34]
 drivers/tty/serial/8250/8250_mxpcie.c:571:36: error: assignment to 'int' from
 'struct uart_8250_port *' makes integer from pointer without a cast
Message-ID: <202608180912.m3Su2GqF-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   1f6871ada6dc52a7b8bfb39ed5e2241ad0b93519
commit: c8819390d455795be059378bb967fef27011f0e7 [26/34] serial8250 port operations work on struct uart_8250_port
config: alpha-allmodconfig (https://download.01.org/0day-ci/archive/20260818/202608180912.m3Su2GqF-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260818/202608180912.m3Su2GqF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608180912.m3Su2GqF-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_mxpcie.c: In function 'mxpcie8250_probe':
>> drivers/tty/serial/8250/8250_mxpcie.c:571:36: error: assignment to 'int' from 'struct uart_8250_port *' makes integer from pointer without a cast [-Wint-conversion]
     571 |                 priv->port[i].line = serial8250_register_8250_port(&up);
         |                                    ^
   drivers/tty/serial/8250/8250_mxpcie.c: In function 'mxpcie8250_remove':
>> drivers/tty/serial/8250/8250_mxpcie.c:591:57: error: passing argument 1 of 'serial8250_unregister_port' makes pointer from integer without a cast [-Wint-conversion]
     591 |                 serial8250_unregister_port(priv->port[i].line);
         |                                            ~~~~~~~~~~~~~^~~~~
         |                                                         |
         |                                                         int
   In file included from drivers/tty/serial/8250/8250_mxpcie.c:20:
   include/linux/serial_8250.h:190:33: note: expected 'struct uart_8250_port *' but argument is of type 'int'
     190 | void serial8250_unregister_port(struct uart_8250_port *);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~


vim +571 drivers/tty/serial/8250/8250_mxpcie.c

0481a041e9569df Crescent Hsieh 2026-07-31  512  
0481a041e9569df Crescent Hsieh 2026-07-31  513  static int mxpcie8250_probe(struct pci_dev *pdev, const struct pci_device_id *id)
0481a041e9569df Crescent Hsieh 2026-07-31  514  {
0481a041e9569df Crescent Hsieh 2026-07-31  515  	struct device *dev = &pdev->dev;
0481a041e9569df Crescent Hsieh 2026-07-31  516  	struct uart_8250_port up = {};
0481a041e9569df Crescent Hsieh 2026-07-31  517  	struct mxpcie8250 *priv;
0481a041e9569df Crescent Hsieh 2026-07-31  518  	unsigned short device = pdev->device;
0481a041e9569df Crescent Hsieh 2026-07-31  519  	unsigned int num_ports;
0481a041e9569df Crescent Hsieh 2026-07-31  520  	int ret;
0481a041e9569df Crescent Hsieh 2026-07-31  521  
0481a041e9569df Crescent Hsieh 2026-07-31  522  	ret = pcim_enable_device(pdev);
0481a041e9569df Crescent Hsieh 2026-07-31  523  	if (ret)
0481a041e9569df Crescent Hsieh 2026-07-31  524  		return ret;
0481a041e9569df Crescent Hsieh 2026-07-31  525  
0481a041e9569df Crescent Hsieh 2026-07-31  526  	num_ports = mxpcie8250_get_nports(device);
0481a041e9569df Crescent Hsieh 2026-07-31  527  
8e929ae7c96c8d2 Crescent Hsieh 2026-07-31  528  	priv = devm_kzalloc(dev, struct_size(priv, port, num_ports), GFP_KERNEL);
0481a041e9569df Crescent Hsieh 2026-07-31  529  	if (!priv)
0481a041e9569df Crescent Hsieh 2026-07-31  530  		return -ENOMEM;
0481a041e9569df Crescent Hsieh 2026-07-31  531  
0481a041e9569df Crescent Hsieh 2026-07-31  532  	priv->num_ports = num_ports;
0481a041e9569df Crescent Hsieh 2026-07-31  533  	priv->supp_rs = mxpcie8250_get_supp_rs(device);
0481a041e9569df Crescent Hsieh 2026-07-31  534  
0481a041e9569df Crescent Hsieh 2026-07-31  535  	priv->bar1_base = pcim_iomap(pdev, FL_BASE1, 0);
0481a041e9569df Crescent Hsieh 2026-07-31  536  	if (!priv->bar1_base)
0481a041e9569df Crescent Hsieh 2026-07-31  537  		return -ENOMEM;
0481a041e9569df Crescent Hsieh 2026-07-31  538  
0481a041e9569df Crescent Hsieh 2026-07-31  539  	priv->bar2_base = pcim_iomap(pdev, FL_BASE2, 0);
0481a041e9569df Crescent Hsieh 2026-07-31  540  	if (!priv->bar2_base)
0481a041e9569df Crescent Hsieh 2026-07-31  541  		return -ENOMEM;
0481a041e9569df Crescent Hsieh 2026-07-31  542  
0481a041e9569df Crescent Hsieh 2026-07-31  543  	mxpcie8250_init_board(pdev, priv);
0481a041e9569df Crescent Hsieh 2026-07-31  544  
0481a041e9569df Crescent Hsieh 2026-07-31  545  	up.port.dev = dev;
0481a041e9569df Crescent Hsieh 2026-07-31  546  	up.port.irq = pdev->irq;
0481a041e9569df Crescent Hsieh 2026-07-31  547  	up.port.uartclk = MOXA_PUART_BASE_BAUD * 16;
b5c53df53414635 Crescent Hsieh 2026-07-31  548  	up.port.flags = UPF_SKIP_TEST | UPF_BOOT_AUTOCONF | UPF_SHARE_IRQ | UPF_FIXED_TYPE;
b5c53df53414635 Crescent Hsieh 2026-07-31  549  	up.port.type = PORT_MUEX50;
0481a041e9569df Crescent Hsieh 2026-07-31  550  
0481a041e9569df Crescent Hsieh 2026-07-31  551  	up.port.iotype = UPIO_MEM;
0481a041e9569df Crescent Hsieh 2026-07-31  552  	up.port.iobase = 0;
0481a041e9569df Crescent Hsieh 2026-07-31  553  	up.port.regshift = 0;
0481a041e9569df Crescent Hsieh 2026-07-31  554  
55edf8511f4728a Crescent Hsieh 2026-07-31  555  	up.port.set_termios = mxpcie8250_set_termios;
4412f9d0df9dbab Crescent Hsieh 2026-07-31  556  	up.port.get_rxtrig = mxpcie8250_get_rxtrig;
4412f9d0df9dbab Crescent Hsieh 2026-07-31  557  	up.port.set_rxtrig = mxpcie8250_set_rxtrig;
0a53c72969e7204 Crescent Hsieh 2026-07-31  558  	up.port.startup = mxpcie8250_startup;
0a53c72969e7204 Crescent Hsieh 2026-07-31  559  	up.port.shutdown = mxpcie8250_shutdown;
d98cf22e68ec42b Crescent Hsieh 2026-07-31  560  	up.port.throttle = mxpcie8250_throttle;
d98cf22e68ec42b Crescent Hsieh 2026-07-31  561  	up.port.unthrottle = mxpcie8250_unthrottle;
e8224757c6e7cd2 Crescent Hsieh 2026-07-31  562  	up.port.handle_irq = mxpcie8250_handle_irq;
ade78d3d253c4b4 Crescent Hsieh 2026-07-31  563  	up.port.break_ctl = mxpcie8250_break_ctl;
0a53c72969e7204 Crescent Hsieh 2026-07-31  564  
0481a041e9569df Crescent Hsieh 2026-07-31  565  	for (unsigned int i = 0; i < num_ports; i++) {
0481a041e9569df Crescent Hsieh 2026-07-31  566  		mxpcie8250_setup_port(pdev, priv, &up, i);
0481a041e9569df Crescent Hsieh 2026-07-31  567  
0481a041e9569df Crescent Hsieh 2026-07-31  568  		dev_dbg(dev, "Setup PCI port: port %lx, irq %d, type %d\n",
0481a041e9569df Crescent Hsieh 2026-07-31  569  			up.port.iobase, up.port.irq, up.port.iotype);
0481a041e9569df Crescent Hsieh 2026-07-31  570  
8e929ae7c96c8d2 Crescent Hsieh 2026-07-31 @571  		priv->port[i].line = serial8250_register_8250_port(&up);
8e929ae7c96c8d2 Crescent Hsieh 2026-07-31  572  		if (priv->port[i].line < 0) {
0481a041e9569df Crescent Hsieh 2026-07-31  573  			dev_err(dev,
0481a041e9569df Crescent Hsieh 2026-07-31  574  				"Couldn't register serial port %lx, irq %d, type %d, error %d\n",
0481a041e9569df Crescent Hsieh 2026-07-31  575  				up.port.iobase, up.port.irq,
8e929ae7c96c8d2 Crescent Hsieh 2026-07-31  576  				up.port.iotype, priv->port[i].line);
0481a041e9569df Crescent Hsieh 2026-07-31  577  			break;
0481a041e9569df Crescent Hsieh 2026-07-31  578  		}
4412f9d0df9dbab Crescent Hsieh 2026-07-31  579  		priv->port[i].rx_trig_level = MOXA_PUART_RX_TRIG_DEFAULT;
0481a041e9569df Crescent Hsieh 2026-07-31  580  	}
0481a041e9569df Crescent Hsieh 2026-07-31  581  	pci_set_drvdata(pdev, priv);
0481a041e9569df Crescent Hsieh 2026-07-31  582  
0481a041e9569df Crescent Hsieh 2026-07-31  583  	return 0;
0481a041e9569df Crescent Hsieh 2026-07-31  584  }
0481a041e9569df Crescent Hsieh 2026-07-31  585  
0481a041e9569df Crescent Hsieh 2026-07-31  586  static void mxpcie8250_remove(struct pci_dev *pdev)
0481a041e9569df Crescent Hsieh 2026-07-31  587  {
0481a041e9569df Crescent Hsieh 2026-07-31  588  	struct mxpcie8250 *priv = pci_get_drvdata(pdev);
0481a041e9569df Crescent Hsieh 2026-07-31  589  
0481a041e9569df Crescent Hsieh 2026-07-31  590  	for (unsigned int i = 0; i < priv->num_ports; i++)
8e929ae7c96c8d2 Crescent Hsieh 2026-07-31 @591  		serial8250_unregister_port(priv->port[i].line);
0481a041e9569df Crescent Hsieh 2026-07-31  592  }
0481a041e9569df Crescent Hsieh 2026-07-31  593  

:::::: The code at line 571 was first introduced by commit
:::::: 8e929ae7c96c8d2a397bee2c98186bc38581fb78 serial: 8250_mxpcie: introduce per-port private data structure

:::::: TO: Crescent Hsieh <crescentcy.hsieh@moxa.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
