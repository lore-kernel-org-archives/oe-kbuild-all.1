Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62AD233985
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Sep 2024 11:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726833047; cv=none; b=r5RZ35B5Uq8LCSp4Esgl7wj9MiMo6UbmCefickktERsoNy6PpmTvKWx2D3h9H/sumhJvmzJYjVMaPUr75WzT1ri8blCf//BRvz7KP5xoL6IW1d4pWOWC423WwOccwmWaFtf71l69UM4Zd5bT/vSGgONdUdYkMY/9RahEyEa5gb0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726833047; c=relaxed/simple;
	bh=dqBQKYGLpflkvfzZr1+K7UIpfTquQ1rhzlpNSFBflT8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kxOsn4BNrXUgxdks3Y3AUHjE4JrWaUWz3rD/8nEDXv8guH94vnDry+nLn87ErWagVVfN/yfqdKMHP8nVS2rP3CY0gfmY571AsKD5pO9lKZ1Y11p0SrI/OxrMRfcg/jF5Cs8dD2itwhfDq0/UKJexQL990vNwOPkmGFuno1PkFZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VRks5njF; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VRks5njF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726833045; x=1758369045;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=dqBQKYGLpflkvfzZr1+K7UIpfTquQ1rhzlpNSFBflT8=;
  b=VRks5njFMauCnOvWszv+lmDzRAGGoZN5vBHI+KCnyujW5utnRrrpLRvM
   uyD76FzYM8k6ihl0IJY7dtRLiyAUBhPPhryuk6nCZVjebILrUuVsLKpvY
   QEKNwsbZkfjixl5aibzAgl9Rbz1NIgSWC4+aaPQZv5rbyQmqcV405U233
   qXuQa9Hi8lg2KeAXD/anCLaDCazQxq8yUCl62SXqSaHARh2wAmWGwBgr1
   IEOcG6gD+kAHHXe3ukFGgndk8X16wMflFdC1q2aYmbLa7sZzjIV9jwFkC
   sc96WIGl2ixwAfI5sALp0a/ZMak4GFJyP2BwUnzFMT39vTjy69TL6cuqo
   w==;
X-CSE-ConnectionGUID: A5NkPT7KQlO5MdjZm/rcfA==
X-CSE-MsgGUID: yA0jk1SFSA2YebKOGQIeMQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11200"; a="25355289"
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="25355289"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2024 04:50:45 -0700
X-CSE-ConnectionGUID: QqIvbkQAQg6/lrXA/N4bBQ==
X-CSE-MsgGUID: B4zoJgfBRuyVtY44rs8/eQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,244,1719903600"; 
   d="scan'208";a="69857079"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Sep 2024 04:50:44 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1src9p-000EKh-25;
	Fri, 20 Sep 2024 11:50:41 +0000
Date: Fri, 20 Sep 2024 19:50:31 +0800
From: kernel test robot <lkp@intel.com>
To: Bart Van Assche <bvanassche@acm.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [bvanassche:nr_irqs 12/12] drivers/tty/serial/amba-pl011.c:2205:41:
 error: 'nr_irqs' undeclared
Message-ID: <202409201914.bmT9pZN4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/bvanassche/linux nr_irqs
head:   319971397427327d8ea6e80d3bbe8a669655450d
commit: 319971397427327d8ea6e80d3bbe8a669655450d [12/12] genirq: Unexport 'nr_irqs'
config: arm-randconfig-002-20240920 (https://download.01.org/0day-ci/archive/20240920/202409201914.bmT9pZN4-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240920/202409201914.bmT9pZN4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409201914.bmT9pZN4-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/tty/serial/amba-pl011.c: In function 'pl011_verify_port':
>> drivers/tty/serial/amba-pl011.c:2205:41: error: 'nr_irqs' undeclared (first use in this function)
    2205 |         if (ser->irq < 0 || ser->irq >= nr_irqs)
         |                                         ^~~~~~~
   drivers/tty/serial/amba-pl011.c:2205:41: note: each undeclared identifier is reported only once for each function it appears in


vim +/nr_irqs +2205 drivers/tty/serial/amba-pl011.c

^1da177e4c3f41 drivers/serial/amba-pl011.c     Linus Torvalds  2005-04-16  2195  
^1da177e4c3f41 drivers/serial/amba-pl011.c     Linus Torvalds  2005-04-16  2196  /*
^1da177e4c3f41 drivers/serial/amba-pl011.c     Linus Torvalds  2005-04-16  2197   * verify the new serial_struct (for TIOCSSERIAL).
^1da177e4c3f41 drivers/serial/amba-pl011.c     Linus Torvalds  2005-04-16  2198   */
e643f87f714c43 drivers/tty/serial/amba-pl011.c Linus Walleij   2012-06-17  2199  static int pl011_verify_port(struct uart_port *port, struct serial_struct *ser)
^1da177e4c3f41 drivers/serial/amba-pl011.c     Linus Torvalds  2005-04-16  2200  {
^1da177e4c3f41 drivers/serial/amba-pl011.c     Linus Torvalds  2005-04-16  2201  	int ret = 0;
d93ebe0fcfbd29 drivers/tty/serial/amba-pl011.c Théo Lebrun     2023-12-07  2202  
^1da177e4c3f41 drivers/serial/amba-pl011.c     Linus Torvalds  2005-04-16  2203  	if (ser->type != PORT_UNKNOWN && ser->type != PORT_AMBA)
^1da177e4c3f41 drivers/serial/amba-pl011.c     Linus Torvalds  2005-04-16  2204  		ret = -EINVAL;
a62c4133735698 drivers/serial/amba-pl011.c     Yinghai Lu      2008-08-19 @2205  	if (ser->irq < 0 || ser->irq >= nr_irqs)
^1da177e4c3f41 drivers/serial/amba-pl011.c     Linus Torvalds  2005-04-16  2206  		ret = -EINVAL;
^1da177e4c3f41 drivers/serial/amba-pl011.c     Linus Torvalds  2005-04-16  2207  	if (ser->baud_base < 9600)
^1da177e4c3f41 drivers/serial/amba-pl011.c     Linus Torvalds  2005-04-16  2208  		ret = -EINVAL;
d1180405c7b5c7 drivers/tty/serial/amba-pl011.c Lino Sanfilippo 2021-11-29  2209  	if (port->mapbase != (unsigned long)ser->iomem_base)
d1180405c7b5c7 drivers/tty/serial/amba-pl011.c Lino Sanfilippo 2021-11-29  2210  		ret = -EINVAL;
^1da177e4c3f41 drivers/serial/amba-pl011.c     Linus Torvalds  2005-04-16  2211  	return ret;
^1da177e4c3f41 drivers/serial/amba-pl011.c     Linus Torvalds  2005-04-16  2212  }
^1da177e4c3f41 drivers/serial/amba-pl011.c     Linus Torvalds  2005-04-16  2213  

:::::: The code at line 2205 was first introduced by commit
:::::: a62c41337356989387d15020dc0f0288aaacfa44 drivers/serial: use nr_irqs

:::::: TO: Yinghai Lu <yhlu.kernel@gmail.com>
:::::: CC: Ingo Molnar <mingo@elte.hu>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
