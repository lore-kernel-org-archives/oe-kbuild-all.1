Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 102DB3AFAF0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 25 Sep 2026 17:42:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790358176; cv=none; b=MeobSxCvbkLTVARxg+MD3fgYuIhWugSz3Jbo2NLkG54OGrbyACaKgyV1IsYggSeQdA71ostaNJ/BVSx4BHfsZPWWYaQfhlMX/C7RItXt+9axmY4p1PtriaMIFdGjjyMUfb0eh02cT1tKZpENQyywdR58z4Btx72dHuLKVWGOvMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790358176; c=relaxed/simple;
	bh=/1GG9AWHZPRVIFzjaaGHBfhCPnSj/Iv+RmtawUBpjK0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uJIV7BThaNCU7/lN+Fqv0aVjMSMZ/wu9HrW7BrnAlN3Q0UWBzv34IYjV5Nuu9jgvYK8jtdjvzwWGcH4HqZ/LzDhWJ713wROu+UZz3cuoCaFrqiBv5ktjqXLxVMFa4wWnW59xuGkMms5NEsJFpNOhUq+cF6jCblaImO5HTlOTn18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zcno1I5k; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zcno1I5k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790358175; x=1821894175;
  h=date:from:to:cc:subject:message-id;
  bh=/1GG9AWHZPRVIFzjaaGHBfhCPnSj/Iv+RmtawUBpjK0=;
  b=Zcno1I5kkybsNo8aa0AEY5HSQBmSLAbokC0IAUk121h+deInE/axJFI/
   s4KC0EiBM411hhq33MA75s+7lEdvjb0OolQMkgr2IdbPGaAlfTtqbPVDC
   /GX8cyC8YU6qkD5I1piq0+mL/GVvjvIzDAEVtWdqsRGcEr9MPQGyOg/w6
   3OWRWP3/m/f17R15+Vj6ndRiWhDAN/2+/E7adgmfPJZa84tTF1Z/yeav9
   QhrKH2dXdPLqMlDm5rCLJYR3BMeuudjJH5TQHdDKfQeYj63sHGvnlNjjx
   EixH/s1/WPeL17/jQ8IqvuoWBa2xq8lvvISDP/3Fsd/sXmw0Y/2/zfwoK
   Q==;
X-CSE-ConnectionGUID: x8yFkM9lTWWcY1Z5FZGVZQ==
X-CSE-MsgGUID: 3TMmv9dtRrSTLXgcD1Wx9g==
X-IronPort-AV: E=McAfee;i="6800,10657,11916"; a="107528005"
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="107528005"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Sep 2026 10:42:54 -0700
X-CSE-ConnectionGUID: mgJ7EDDhRF2HWfKCzCqJeg==
X-CSE-MsgGUID: 3VK7unb7S2eOH/kJcORXeQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,122,1787036400"; 
   d="scan'208";a="277562134"
Received: from igk-lkp-server01.igk.intel.com (HELO a88263cc608e) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 25 Sep 2026 10:42:53 -0700
Received: from kbuild by a88263cc608e with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xA9wh-000000000qZ-1N0E;
	Fri, 25 Sep 2026 17:42:51 +0000
Date: Fri, 25 Sep 2026 19:42:45 +0200
From: kernel test robot <lkp@intel.com>
To: Rosen Penev <rosenp@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/tty/serial/cpm_uart.c:1533 cpm_uart_probe() warn:
 unsigned 'pinfo->port.irq' is never less than zero.
Message-ID: <202609251916.1XlVHLwd-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   165768bb70265b5c38cf0b73fafd75be235f8b14
commit: 831603b3e8aa3892de229fda846b2f859c518699 serial: cpm_uart: replace irq_of_parse_and_map with platform_get_irq
date:   3 months ago
config: powerpc-randconfig-r2202-20260925 (https://download.01.org/0day-ci/archive/20260925/202609251916.1XlVHLwd-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 16.1.0
smatch: v0.5.0-9187-g5189e3fb

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 831603b3e8aa ("serial: cpm_uart: replace irq_of_parse_and_map with platform_get_irq")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609251916.1XlVHLwd-lkp@intel.com/

smatch warnings:
drivers/tty/serial/cpm_uart.c:1533 cpm_uart_probe() warn: unsigned 'pinfo->port.irq' is never less than zero.

vim +1533 drivers/tty/serial/cpm_uart.c

  1515	
  1516	static int cpm_uart_probe(struct platform_device *ofdev)
  1517	{
  1518		int index = probe_index++;
  1519		struct uart_cpm_port *pinfo = &cpm_uart_ports[index];
  1520		int ret;
  1521	
  1522		pinfo->port.line = index;
  1523	
  1524		if (index >= UART_NR)
  1525			return -ENODEV;
  1526	
  1527		platform_set_drvdata(ofdev, pinfo);
  1528	
  1529		/* initialize the device pointer for the port */
  1530		pinfo->port.dev = &ofdev->dev;
  1531	
  1532		pinfo->port.irq = platform_get_irq(ofdev, 0);
> 1533		if (pinfo->port.irq < 0)
  1534			return pinfo->port.irq;
  1535	
  1536		ret = cpm_uart_init_port(ofdev->dev.of_node, pinfo);
  1537		if (!ret)
  1538			return uart_add_one_port(&cpm_reg, &pinfo->port);
  1539	
  1540		return ret;
  1541	}
  1542	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
