Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7C533BB9FE
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 11:22:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791372162; cv=none; b=NoGpO7QB/xt+XY22vd0U9JeHsr575OM7LTo5zkvJ06i46IUekyDIfnBjK1Ea3eB+NUfDDAnLL0197cS8yP06mFENEgeQQIvNNqVkhxuyZGIlkSmaKhl0qDvU3sEsRvmhCt4Y331on63E9v2JNjwYjy0zfXd4GUufqSYwwctJGQM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791372162; c=relaxed/simple;
	bh=XVHR/YTa7sOxW2VuLs0GEHtcVeyjesAj6O871ZZaIzs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fE1R0nr+buK+Q6QzaEKq09M7535scdcNsGn6bBalZGOK2LAOnk2a0PpR2H9TBL6FvamBRRfBl/v/Xyn7hMAAmOZV0IZoEVvBKkX1EP+3sY0+dpEnCIZXYb2EYj1MA4/cBSdGH4maPBgc5NJRA4+SukX6VlxBRqJVzpVYBclnth4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GjJHP9n8; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GjJHP9n8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791372139; x=1822908139;
  h=date:from:to:cc:subject:message-id;
  bh=XVHR/YTa7sOxW2VuLs0GEHtcVeyjesAj6O871ZZaIzs=;
  b=GjJHP9n8gtRe5f7Q/ZjnmH3N7y0wJjhnHyuijW065YvVNzRFlOUSN1Dk
   Co3Sw732Y4Am+7ALHB7kr0ht2HzUou1lffZtXILR0rmsfX7fZEIjx792f
   cXm+y+wUeE0v+o3bcj0dzAoWNM5q/htVVql5OH6fZ68lexlFB71Q/JVd6
   6jDsjDSLv8AR7mD26CrVgzlktEtLa2VaIPBwX5UuIhAaoqRiPug0A7Lkm
   +XfPlirv1/zrwRh9+ifpfRh3GGRlgAw+RpppItkud5Tqab7ulHA35RwzM
   cNU5hZabFIgfxZ3h+XnUynssJD4UPb9EPWtXqzy7mrHauB4q6E8BUXP9a
   Q==;
X-CSE-ConnectionGUID: 46Y3fc31SXSPB1hSscr8Lg==
X-CSE-MsgGUID: nyhq8RoORx6rL7/D3a/hcw==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="123605"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="123605"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 04:22:19 -0700
X-CSE-ConnectionGUID: svIBZUBqTI2wpw68aw0nRg==
X-CSE-MsgGUID: DKBHjAsxTdO8vv93zcMzlg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="142574"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 07 Oct 2026 04:22:17 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEPix-000000002t8-05ed;
	Wed, 07 Oct 2026 11:22:15 +0000
Date: Wed, 07 Oct 2026 19:21:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 12/45]
 drivers/tty/serial/8250/8250_airoha.c:150:13: error: assignment to 'int' from
 'struct uart_8250_port *' makes integer from pointer without a cast
Message-ID: <202610071952.te93jEje-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   576b8c5d619ed8abcc9bd2106e527d2c3aba9b2d
commit: 52a3eb3685b86cd5b44146d29ab2ec06e6f813c3 [12/45] serial8250 port operations work on struct uart_8250_port
config: arc-randconfig-1001-20261007 (https://download.01.org/0day-ci/archive/20261007/202610071952.te93jEje-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610071952.te93jEje-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610071952.te93jEje-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_airoha.c: In function 'airoha_8250_probe':
>> drivers/tty/serial/8250/8250_airoha.c:150:13: error: assignment to 'int' from 'struct uart_8250_port *' makes integer from pointer without a cast [-Wint-conversion]
     150 |         ret = serial8250_register_8250_port(&uart);
         |             ^
   drivers/tty/serial/8250/8250_airoha.c: In function 'airoha_8250_remove':
>> drivers/tty/serial/8250/8250_airoha.c:164:40: error: passing argument 1 of 'serial8250_unregister_port' makes pointer from integer without a cast [-Wint-conversion]
     164 |         serial8250_unregister_port(priv->line);
         |                                    ~~~~^~~~~~
         |                                        |
         |                                        int
   In file included from drivers/tty/serial/8250/8250_airoha.c:18:
   include/linux/serial_8250.h:190:33: note: expected 'struct uart_8250_port *' but argument is of type 'int'
     190 | void serial8250_unregister_port(struct uart_8250_port *);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~


vim +150 drivers/tty/serial/8250/8250_airoha.c

92a8133c44de334 Christian Marangi 2026-08-11  117  
92a8133c44de334 Christian Marangi 2026-08-11  118  static int airoha_8250_probe(struct platform_device *pdev)
92a8133c44de334 Christian Marangi 2026-08-11  119  {
92a8133c44de334 Christian Marangi 2026-08-11  120  	struct uart_8250_port uart = { };
92a8133c44de334 Christian Marangi 2026-08-11  121  	struct device *dev = &pdev->dev;
92a8133c44de334 Christian Marangi 2026-08-11  122  	struct airoha_8250_priv *priv;
92a8133c44de334 Christian Marangi 2026-08-11  123  	struct resource *res;
92a8133c44de334 Christian Marangi 2026-08-11  124  	int ret;
92a8133c44de334 Christian Marangi 2026-08-11  125  
92a8133c44de334 Christian Marangi 2026-08-11  126  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
92a8133c44de334 Christian Marangi 2026-08-11  127  	if (!res)
92a8133c44de334 Christian Marangi 2026-08-11  128  		return dev_err_probe(dev, -EINVAL, "invalid address\n");
92a8133c44de334 Christian Marangi 2026-08-11  129  
92a8133c44de334 Christian Marangi 2026-08-11  130  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
92a8133c44de334 Christian Marangi 2026-08-11  131  	if (!priv)
92a8133c44de334 Christian Marangi 2026-08-11  132  		return -ENOMEM;
92a8133c44de334 Christian Marangi 2026-08-11  133  
92a8133c44de334 Christian Marangi 2026-08-11  134  	uart.port.dev = dev;
92a8133c44de334 Christian Marangi 2026-08-11  135  	if (device_is_compatible(dev, "airoha,an7581-hsuart"))
92a8133c44de334 Christian Marangi 2026-08-11  136  		uart.port.type = UART_PORT_AIROHA_HS;
92a8133c44de334 Christian Marangi 2026-08-11  137  	else
92a8133c44de334 Christian Marangi 2026-08-11  138  		uart.port.type = UART_PORT_AIROHA;
92a8133c44de334 Christian Marangi 2026-08-11  139  	uart.port.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT |
92a8133c44de334 Christian Marangi 2026-08-11  140  			  UPF_FIXED_TYPE | UPF_IOREMAP;
92a8133c44de334 Christian Marangi 2026-08-11  141  	uart.port.set_divisor = airoha_set_divisor;
92a8133c44de334 Christian Marangi 2026-08-11  142  	uart.port.get_divisor = airoha_get_divisor;
92a8133c44de334 Christian Marangi 2026-08-11  143  	uart.port.mapbase = res->start;
92a8133c44de334 Christian Marangi 2026-08-11  144  	uart.port.mapsize = resource_size(res);
92a8133c44de334 Christian Marangi 2026-08-11  145  
92a8133c44de334 Christian Marangi 2026-08-11  146  	ret = uart_read_and_validate_port_properties(&uart.port);
92a8133c44de334 Christian Marangi 2026-08-11  147  	if (ret)
92a8133c44de334 Christian Marangi 2026-08-11  148  		return ret;
92a8133c44de334 Christian Marangi 2026-08-11  149  
92a8133c44de334 Christian Marangi 2026-08-11 @150  	ret = serial8250_register_8250_port(&uart);
92a8133c44de334 Christian Marangi 2026-08-11  151  	if (ret < 0)
92a8133c44de334 Christian Marangi 2026-08-11  152  		return ret;
92a8133c44de334 Christian Marangi 2026-08-11  153  
92a8133c44de334 Christian Marangi 2026-08-11  154  	priv->line = ret;
92a8133c44de334 Christian Marangi 2026-08-11  155  	platform_set_drvdata(pdev, priv);
92a8133c44de334 Christian Marangi 2026-08-11  156  
92a8133c44de334 Christian Marangi 2026-08-11  157  	return 0;
92a8133c44de334 Christian Marangi 2026-08-11  158  }
92a8133c44de334 Christian Marangi 2026-08-11  159  
92a8133c44de334 Christian Marangi 2026-08-11  160  static void airoha_8250_remove(struct platform_device *ofdev)
92a8133c44de334 Christian Marangi 2026-08-11  161  {
92a8133c44de334 Christian Marangi 2026-08-11  162  	struct airoha_8250_priv *priv = platform_get_drvdata(ofdev);
92a8133c44de334 Christian Marangi 2026-08-11  163  
92a8133c44de334 Christian Marangi 2026-08-11 @164  	serial8250_unregister_port(priv->line);
92a8133c44de334 Christian Marangi 2026-08-11  165  }
92a8133c44de334 Christian Marangi 2026-08-11  166  

:::::: The code at line 150 was first introduced by commit
:::::: 92a8133c44de3340a35d638c0458886e633ba98c serial: 8250: Add Airoha SoC UART and HSUART support

:::::: TO: Christian Marangi <ansuelsmth@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
