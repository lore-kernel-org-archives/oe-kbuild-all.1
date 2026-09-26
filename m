Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C15135AC10
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Sep 2026 02:13:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790388782; cv=none; b=lg4csHFBF8Jkq5GrdMCYofWfEfa5z+62GTb7AzGa3RrggQTeG8/WR4wDqwbRO2t7wdcHmJQCDVAfvUejm4TuqBZejtn+EXnsxiW6BzuzXpLPX7jekINiqFHjq71rYNL1L+1fXbNeTRotg12gScYKLEl+tQzExCQ51fM3neVLiAo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790388782; c=relaxed/simple;
	bh=D8hznBV3X9vputz0GDesxMtEVSlFLBL/MYWFRs7IiFQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=RimhdTiBHxoREwIXeopmMDr//xqcF57CShpxt3/2S2VfUO6N87sAMTAMeL3/faN+0XVJekvrdT1tjiLxscfEwRySYmVvoVnPm2GVsJkTMFnXYbSsTnCH/WQfs0HZWU5f3nctm5qL5pDCLGnI8Cv1xg1N3Z+KbBd/zl0PgBDBJ8g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QWpTVNBo; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QWpTVNBo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790388780; x=1821924780;
  h=date:from:to:cc:subject:message-id;
  bh=D8hznBV3X9vputz0GDesxMtEVSlFLBL/MYWFRs7IiFQ=;
  b=QWpTVNBo2sA3SpKBY7cKjGyXUOups7W6K47W/uotFT1h9i9J4dCfhfLG
   nBJVzDmti7jN/4Bokx5A2/3Tr2vMBRJXx7HCTInBWfWWidkf61NNpJcte
   RTobjRqgIZW03r3pqyPtJleDOkXNQIZpC7xXXTYuoSVwofxwta13lawgA
   6OVDz+heZBhBeECEguS6WBhSt2XN4AFVFcNNCpTeRLgJZbIIm92vwWueR
   aPcSuP9gpCPlG0LS85398ROt0QXvqMcpMAIYaWnkddcehP/9QGIMfjpH7
   a8KRdH5ugQiztT8k2FaAowpoMzxDkDgH/4LFogbB6cAKX2cBVmPLpAB3R
   g==;
X-CSE-ConnectionGUID: v5DQsgJESnmxNjFR8TIgKQ==
X-CSE-MsgGUID: DuA3Zn+nQwi2595TGYqgxQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="90217466"
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="90217466"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 19:12:55 -0700
X-CSE-ConnectionGUID: 1bsXdshRREOVTEPOUUUn7A==
X-CSE-MsgGUID: fVLyPTw9R9OkJQ6SOK+A2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,123,1787036400"; 
   d="scan'208";a="312398477"
Received: from igk-lkp-server01.igk.intel.com (HELO 7278393c7b39) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 25 Sep 2026 19:12:53 -0700
Received: from kbuild by 7278393c7b39 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAHuD-000000000Ab-2cCl;
	Sat, 26 Sep 2026 02:12:49 +0000
Date: Sat, 26 Sep 2026 04:12:04 +0200
From: kernel test robot <lkp@intel.com>
To: John Ogness <john.ogness@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/tty/serial/8250/8250_dfl.c:137:1: warning: the frame
 size of 1040 bytes is larger than 1024 bytes
Message-ID: <202609260435.D0DdZXo2-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   6812ce4e4379ffc99c52401ec28f0d7ffbc36206
commit: d3539347022ad4eeb9dbd29c50bfca17b9d8a146 serial: 8250: Switch to nbcon console, take 2
date:   8 weeks ago
config: sparc-allyesconfig (https://download.01.org/0day-ci/archive/20260926/202609260435.D0DdZXo2-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260926/202609260435.D0DdZXo2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: d3539347022a ("serial: 8250: Switch to nbcon console, take 2")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609260435.D0DdZXo2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/serial/8250/8250_dfl.c: In function 'dfl_uart_probe':
>> drivers/tty/serial/8250/8250_dfl.c:137:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     137 | }
         | ^
--
   drivers/tty/serial/8250/8250_of.c: In function 'of_platform_serial_probe':
>> drivers/tty/serial/8250/8250_of.c:284:1: warning: the frame size of 1040 bytes is larger than 1024 bytes [-Wframe-larger-than=]
     284 | }
         | ^


vim +137 drivers/tty/serial/8250/8250_dfl.c

e34a79d0b320ea Matthew Gerlach 2023-01-15  107  
e34a79d0b320ea Matthew Gerlach 2023-01-15  108  static int dfl_uart_probe(struct dfl_device *dfl_dev)
e34a79d0b320ea Matthew Gerlach 2023-01-15  109  {
e34a79d0b320ea Matthew Gerlach 2023-01-15  110  	struct device *dev = &dfl_dev->dev;
e34a79d0b320ea Matthew Gerlach 2023-01-15  111  	struct uart_8250_port uart = { };
e34a79d0b320ea Matthew Gerlach 2023-01-15  112  	struct dfl_uart *dfluart;
e34a79d0b320ea Matthew Gerlach 2023-01-15  113  	int ret;
e34a79d0b320ea Matthew Gerlach 2023-01-15  114  
e34a79d0b320ea Matthew Gerlach 2023-01-15  115  	uart.port.flags = UPF_IOREMAP;
e34a79d0b320ea Matthew Gerlach 2023-01-15  116  	uart.port.mapbase = dfl_dev->mmio_res.start;
e34a79d0b320ea Matthew Gerlach 2023-01-15  117  	uart.port.mapsize = resource_size(&dfl_dev->mmio_res);
e34a79d0b320ea Matthew Gerlach 2023-01-15  118  
e34a79d0b320ea Matthew Gerlach 2023-01-15  119  	ret = dfl_uart_get_params(dfl_dev, &uart);
e34a79d0b320ea Matthew Gerlach 2023-01-15  120  	if (ret < 0)
e34a79d0b320ea Matthew Gerlach 2023-01-15  121  		return dev_err_probe(dev, ret, "failed uart feature walk\n");
e34a79d0b320ea Matthew Gerlach 2023-01-15  122  
e34a79d0b320ea Matthew Gerlach 2023-01-15  123  	if (dfl_dev->num_irqs == 1)
e34a79d0b320ea Matthew Gerlach 2023-01-15  124  		uart.port.irq = dfl_dev->irqs[0];
e34a79d0b320ea Matthew Gerlach 2023-01-15  125  
e34a79d0b320ea Matthew Gerlach 2023-01-15  126  	dfluart = devm_kzalloc(dev, sizeof(*dfluart), GFP_KERNEL);
e34a79d0b320ea Matthew Gerlach 2023-01-15  127  	if (!dfluart)
e34a79d0b320ea Matthew Gerlach 2023-01-15  128  		return -ENOMEM;
e34a79d0b320ea Matthew Gerlach 2023-01-15  129  
e34a79d0b320ea Matthew Gerlach 2023-01-15  130  	dfluart->line = serial8250_register_8250_port(&uart);
e34a79d0b320ea Matthew Gerlach 2023-01-15  131  	if (dfluart->line < 0)
e34a79d0b320ea Matthew Gerlach 2023-01-15  132  		return dev_err_probe(dev, dfluart->line, "unable to register 8250 port.\n");
e34a79d0b320ea Matthew Gerlach 2023-01-15  133  
e34a79d0b320ea Matthew Gerlach 2023-01-15  134  	dev_set_drvdata(dev, dfluart);
e34a79d0b320ea Matthew Gerlach 2023-01-15  135  
e34a79d0b320ea Matthew Gerlach 2023-01-15  136  	return 0;
e34a79d0b320ea Matthew Gerlach 2023-01-15 @137  }
e34a79d0b320ea Matthew Gerlach 2023-01-15  138  

:::::: The code at line 137 was first introduced by commit
:::::: e34a79d0b320ea8248e1ee3482eb5c388a27d303 tty: serial: 8250: add DFL bus driver for Altera 16550.

:::::: TO: Matthew Gerlach <matthew.gerlach@linux.intel.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
