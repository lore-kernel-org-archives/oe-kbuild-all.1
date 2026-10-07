Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1EFA4B1297
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 Oct 2026 13:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791379737; cv=none; b=A+u99OSF7Rg9mmj+POVg1dZQ8AzekCPTBDfyIO+SEwXq/mqot3POl033sOOQ6mY43chCh1QJCRElXOqW6YmIwkgVs6QFDmO7TG1kzH1JbRNLhvlVX4Cujf2oBjzquLoazqxcSnYd2KdFdnZ+AfQQG4QkQzjZazOFbTUh1f8h8gw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791379737; c=relaxed/simple;
	bh=P7avWAysdvdw+M0LuQlhwBNQlK71pP9P3yOZAH7Iw50=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qRpThwRj9ZeZQwMu1r+D7i2OtnCMUPpKdmU9JwqqG+tx+q1+iw8OBDn5t8SemXH0BQJrAKcQ0kgxPlAsxsImdV5icwNvNi04AFI3wgE+6XGo3fS5PqYG5BlWLBVGduC1tiUVg9R8b1ekBhqfoFKQq+wBoOTYXecu4+9JcoeG670=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Uxe2LhoS; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Uxe2LhoS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791379715; x=1822915715;
  h=date:from:to:cc:subject:message-id;
  bh=P7avWAysdvdw+M0LuQlhwBNQlK71pP9P3yOZAH7Iw50=;
  b=Uxe2LhoSUdPsD9h6IXNz1ks2s74fuCOIaD/NZG3YTTFV4GfBpNhEFwIN
   cMQNMK8/SkiuYc98cqoLnxz6mGfLdeHRMw63gbqnPu1QpBHQe5tp8btTg
   69dvKiwNDyB85R0eP1+l2hNduLrooM+CwQ12lq8eb5FmxK7dPvIB6sjF4
   HThVOyoV5qIsyw+FvqgWpC4hV/Q5HbSNiU0tMN41FNMqKkAkhyPUuk7ZG
   wwaA6BpGjjJpJlO+mNvT/70H72R4IQTeFtI2oVYLbYp6MXmW6e8r2z2hN
   XzBJU0sYu0yQH52LREPZOTaDmIb5AMxGsLzGPSqymC6KX0Pn4hGRpign2
   Q==;
X-CSE-ConnectionGUID: gpo42FGQSA+HMYegQ7c1gQ==
X-CSE-MsgGUID: +cc5YRspR2O8Ite2DxzP1g==
X-IronPort-AV: E=McAfee;i="6800,10657,11928"; a="22916"
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="22916"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Oct 2026 06:28:34 -0700
X-CSE-ConnectionGUID: pJVk5hLsQo+7Od+INDBbKA==
X-CSE-MsgGUID: /3SgblyRQRmwBS7QUNhVpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,144,1787036400"; 
   d="scan'208";a="281200458"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 07 Oct 2026 06:28:33 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xERh8-0000000031q-0Jrl;
	Wed, 07 Oct 2026 13:28:30 +0000
Date: Wed, 07 Oct 2026 21:28:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 12/45]
 drivers/tty/serial/8250/8250_airoha.c:150:13: warning: assignment to 'int'
 from 'struct uart_8250_port *' makes integer from pointer without a cast
Message-ID: <202610072155.NzOS13B3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   576b8c5d619ed8abcc9bd2106e527d2c3aba9b2d
commit: 52a3eb3685b86cd5b44146d29ab2ec06e6f813c3 [12/45] serial8250 port operations work on struct uart_8250_port
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20261007/202610072155.NzOS13B3-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261007/202610072155.NzOS13B3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610072155.NzOS13B3-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_airoha.c: In function 'airoha_8250_probe':
>> drivers/tty/serial/8250/8250_airoha.c:150:13: warning: assignment to 'int' from 'struct uart_8250_port *' makes integer from pointer without a cast [-Wint-conversion]
     150 |         ret = serial8250_register_8250_port(&uart);
         |             ^
   drivers/tty/serial/8250/8250_airoha.c: In function 'airoha_8250_remove':
>> drivers/tty/serial/8250/8250_airoha.c:164:40: warning: passing argument 1 of 'serial8250_unregister_port' makes pointer from integer without a cast [-Wint-conversion]
     164 |         serial8250_unregister_port(priv->line);
         |                                    ~~~~^~~~~~
         |                                        |
         |                                        int
   In file included from drivers/tty/serial/8250/8250_airoha.c:18:
   include/linux/serial_8250.h:190:33: note: expected 'struct uart_8250_port *' but argument is of type 'int'
     190 | void serial8250_unregister_port(struct uart_8250_port *);
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~


vim +150 drivers/tty/serial/8250/8250_airoha.c

92a8133c44de33 Christian Marangi 2026-08-11  117  
92a8133c44de33 Christian Marangi 2026-08-11  118  static int airoha_8250_probe(struct platform_device *pdev)
92a8133c44de33 Christian Marangi 2026-08-11  119  {
92a8133c44de33 Christian Marangi 2026-08-11  120  	struct uart_8250_port uart = { };
92a8133c44de33 Christian Marangi 2026-08-11  121  	struct device *dev = &pdev->dev;
92a8133c44de33 Christian Marangi 2026-08-11  122  	struct airoha_8250_priv *priv;
92a8133c44de33 Christian Marangi 2026-08-11  123  	struct resource *res;
92a8133c44de33 Christian Marangi 2026-08-11  124  	int ret;
92a8133c44de33 Christian Marangi 2026-08-11  125  
92a8133c44de33 Christian Marangi 2026-08-11  126  	res = platform_get_resource(pdev, IORESOURCE_MEM, 0);
92a8133c44de33 Christian Marangi 2026-08-11  127  	if (!res)
92a8133c44de33 Christian Marangi 2026-08-11  128  		return dev_err_probe(dev, -EINVAL, "invalid address\n");
92a8133c44de33 Christian Marangi 2026-08-11  129  
92a8133c44de33 Christian Marangi 2026-08-11  130  	priv = devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
92a8133c44de33 Christian Marangi 2026-08-11  131  	if (!priv)
92a8133c44de33 Christian Marangi 2026-08-11  132  		return -ENOMEM;
92a8133c44de33 Christian Marangi 2026-08-11  133  
92a8133c44de33 Christian Marangi 2026-08-11  134  	uart.port.dev = dev;
92a8133c44de33 Christian Marangi 2026-08-11  135  	if (device_is_compatible(dev, "airoha,an7581-hsuart"))
92a8133c44de33 Christian Marangi 2026-08-11  136  		uart.port.type = UART_PORT_AIROHA_HS;
92a8133c44de33 Christian Marangi 2026-08-11  137  	else
92a8133c44de33 Christian Marangi 2026-08-11  138  		uart.port.type = UART_PORT_AIROHA;
92a8133c44de33 Christian Marangi 2026-08-11  139  	uart.port.flags = UPF_BOOT_AUTOCONF | UPF_FIXED_PORT |
92a8133c44de33 Christian Marangi 2026-08-11  140  			  UPF_FIXED_TYPE | UPF_IOREMAP;
92a8133c44de33 Christian Marangi 2026-08-11  141  	uart.port.set_divisor = airoha_set_divisor;
92a8133c44de33 Christian Marangi 2026-08-11  142  	uart.port.get_divisor = airoha_get_divisor;
92a8133c44de33 Christian Marangi 2026-08-11  143  	uart.port.mapbase = res->start;
92a8133c44de33 Christian Marangi 2026-08-11  144  	uart.port.mapsize = resource_size(res);
92a8133c44de33 Christian Marangi 2026-08-11  145  
92a8133c44de33 Christian Marangi 2026-08-11  146  	ret = uart_read_and_validate_port_properties(&uart.port);
92a8133c44de33 Christian Marangi 2026-08-11  147  	if (ret)
92a8133c44de33 Christian Marangi 2026-08-11  148  		return ret;
92a8133c44de33 Christian Marangi 2026-08-11  149  
92a8133c44de33 Christian Marangi 2026-08-11 @150  	ret = serial8250_register_8250_port(&uart);
92a8133c44de33 Christian Marangi 2026-08-11  151  	if (ret < 0)
92a8133c44de33 Christian Marangi 2026-08-11  152  		return ret;
92a8133c44de33 Christian Marangi 2026-08-11  153  
92a8133c44de33 Christian Marangi 2026-08-11  154  	priv->line = ret;
92a8133c44de33 Christian Marangi 2026-08-11  155  	platform_set_drvdata(pdev, priv);
92a8133c44de33 Christian Marangi 2026-08-11  156  
92a8133c44de33 Christian Marangi 2026-08-11  157  	return 0;
92a8133c44de33 Christian Marangi 2026-08-11  158  }
92a8133c44de33 Christian Marangi 2026-08-11  159  
92a8133c44de33 Christian Marangi 2026-08-11  160  static void airoha_8250_remove(struct platform_device *ofdev)
92a8133c44de33 Christian Marangi 2026-08-11  161  {
92a8133c44de33 Christian Marangi 2026-08-11  162  	struct airoha_8250_priv *priv = platform_get_drvdata(ofdev);
92a8133c44de33 Christian Marangi 2026-08-11  163  
92a8133c44de33 Christian Marangi 2026-08-11 @164  	serial8250_unregister_port(priv->line);
92a8133c44de33 Christian Marangi 2026-08-11  165  }
92a8133c44de33 Christian Marangi 2026-08-11  166  

:::::: The code at line 150 was first introduced by commit
:::::: 92a8133c44de3340a35d638c0458886e633ba98c serial: 8250: Add Airoha SoC UART and HSUART support

:::::: TO: Christian Marangi <ansuelsmth@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
