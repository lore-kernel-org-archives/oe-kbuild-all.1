Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F3F025948B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Dec 2024 12:34:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735562088; cv=none; b=TZhi9psQND7y4l9J1O53Z0r5AOP2+w45rmclRNYzd9Svt7QR0CLP4u/SP6cAD9dAdRX1wJhsQtkc8nMjLm+1xGIMf9JhBfCGWGLgQEbALz1DIkZkqNuHBTomULU/6UActmwBAJ9gWjIiqLOgXy8ZIgjYFSAeVdfhNvsAk2beDco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735562088; c=relaxed/simple;
	bh=iZe7Xnjir4Pv0SXZtRODdL5VpkROolIHdov1YZKQBb8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JDHdP9O0yTcsEjl+RmzG56OI6QJnQ7REkl8q/xqZoBcRdA1eI+yKW19l2SjdJXMFmA5RsK95qPZYb/6oBMtimOSrq2sFoQpN9NclC/SlIlqu1SBctXM09A0anpvjNnj8PaKHMb3TxlOnMbSqFau4TLyyiSTKJebN82T8hQF4JP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nXT5qFmU; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nXT5qFmU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735562085; x=1767098085;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=iZe7Xnjir4Pv0SXZtRODdL5VpkROolIHdov1YZKQBb8=;
  b=nXT5qFmUcfyTWI9eeQSu5RCXKE/odxpE3plACvC70SN+RYeOP+R4Jhfv
   6qDaF0Elss/xT4ItmTS5cB8yEgP/9qOuYT6irZv7bMo+zxHtrsc/C08mZ
   3NcBz4p48iB8bREHZLXjMWy6x/TZ86s7ZNzoYFYiHfPi56SHoW1zQAMuB
   gSeEqSbeSQuv5oc+9tvV7nwShoAYJsdHn6Q0md+sEC963R1O56bPqneWq
   1R3GHwEF/+rnEfnPwAT/9g0q71oJxlZan7ZeE0osjQWT+ZcsPtQvOXH1F
   f9dQIW6N6JRJymgkTRi8OWpifTbbwKIIhrq5R6nrA8/hiiTbHwEIMhjN0
   A==;
X-CSE-ConnectionGUID: NSglSjFWR7mb/YOQrWyprA==
X-CSE-MsgGUID: fTZjuEscQqWWGV+PPEDNvg==
X-IronPort-AV: E=McAfee;i="6700,10204,11301"; a="47212913"
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="47212913"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Dec 2024 04:34:44 -0800
X-CSE-ConnectionGUID: RF59meveT8O87htxDcLNQg==
X-CSE-MsgGUID: 6HGqzqsMT+uzKhlF7hQYdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,276,1728975600"; 
   d="scan'208";a="100965055"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 30 Dec 2024 04:34:42 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tSEyl-0005mW-1v;
	Mon, 30 Dec 2024 12:34:39 +0000
Date: Mon, 30 Dec 2024 20:33:50 +0800
From: kernel test robot <lkp@intel.com>
To: Dave Penkler <dpenkler@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: drivers/staging/gpib/agilent_82350b/agilent_82350b.c:800:42: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202412302037.Fsragjjv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Dave,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   fc033cf25e612e840e545f8d5ad2edd6ba613ed5
commit: 165e8cc3cfec9ef51f3376b0d49b115294f34f3b staging: gpib: Add KBUILD files for GPIB drivers
date:   3 months ago
config: m68k-randconfig-r121-20241230 (https://download.01.org/0day-ci/archive/20241230/202412302037.Fsragjjv-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241230/202412302037.Fsragjjv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412302037.Fsragjjv-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:310:38: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:311:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:311:39: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:311:39: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:322:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:322:53: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:322:53: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:323:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:323:60: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:323:60: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:325:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:325:60: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:325:60: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:380:76: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:380:76: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:380:76: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:384:53: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:384:53: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:384:53: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:386:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:386:58: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:386:58: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:506:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:506:41: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:506:41: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:556:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *borg_base @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:556:35: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:556:35: sparse:     got void *borg_base
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:568:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:568:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:568:33: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:570:56: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:570:56: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:570:56: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:573:33: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:573:33: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:573:33: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:577:57: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *borg_base @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:577:57: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:577:57: sparse:     got void *borg_base
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:586:60: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:586:60: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:586:60: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:588:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void *borg_base @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:588:49: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:588:49: sparse:     got void *borg_base
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:611:57: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:611:57: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:611:57: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:616:67: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:616:67: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:616:67: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:686:34: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *plx_base @@     got void [noderef] __iomem * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:686:34: sparse:     expected void *plx_base
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:686:34: sparse:     got void [noderef] __iomem *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:689:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *gpib_base @@     got void [noderef] __iomem * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:689:35: sparse:     expected void *gpib_base
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:689:35: sparse:     got void [noderef] __iomem *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:695:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *sram_base @@     got void [noderef] __iomem * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:695:35: sparse:     expected void *sram_base
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:695:35: sparse:     got void [noderef] __iomem *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:700:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *borg_base @@     got void [noderef] __iomem * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:700:35: sparse:     expected void *borg_base
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:700:35: sparse:     got void [noderef] __iomem *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:712:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *gpib_base @@     got void [noderef] __iomem * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:712:35: sparse:     expected void *gpib_base
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:712:35: sparse:     got void [noderef] __iomem *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:716:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *sram_base @@     got void [noderef] __iomem * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:716:35: sparse:     expected void *sram_base
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:716:35: sparse:     got void [noderef] __iomem *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:719:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *misc_base @@     got void [noderef] __iomem * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:719:35: sparse:     expected void *misc_base
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:719:35: sparse:     got void [noderef] __iomem *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:740:37: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:740:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:740:37: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:742:58: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:742:58: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:742:58: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:748:41: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:748:41: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:748:41: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:753:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:753:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:753:42: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:755:73: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:755:73: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:755:73: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:758:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:758:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:758:42: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:760:45: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:760:45: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:760:45: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:762:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:762:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:762:42: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:792:52: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:792:52: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:792:52: sparse:     got void *
>> drivers/staging/gpib/agilent_82350b/agilent_82350b.c:800:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:800:42: sparse:     expected void [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:800:42: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:802:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:802:42: sparse:     expected void [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:802:42: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:804:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:804:42: sparse:     expected void [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:804:42: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:806:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:806:42: sparse:     expected void [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:806:42: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:808:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:808:42: sparse:     expected void [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:808:42: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c:817:18: sparse: sparse: symbol 'agilent_82350b_unaccel_interface' was not declared. Should it be static?
   drivers/staging/gpib/agilent_82350b/agilent_82350b.c: note: in included file:
   drivers/staging/gpib/agilent_82350b/agilent_82350b.h:207:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.h:207:40: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.h:207:40: sparse:     got void *
   drivers/staging/gpib/agilent_82350b/agilent_82350b.h:207:40: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/agilent_82350b/agilent_82350b.h:207:40: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/staging/gpib/agilent_82350b/agilent_82350b.h:207:40: sparse:     got void *
--
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1043:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1044:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1045:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1046:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1047:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1048:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1049:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1050:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1051:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1052:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1053:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1054:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1055:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1056:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1057:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1058:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1059:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1060:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1061:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1062:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1063:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1064:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1065:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1066:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1067:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1071:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1072:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1073:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1074:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1075:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1076:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1077:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1078:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1079:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1080:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1081:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1082:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1083:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1084:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1085:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1086:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1087:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1088:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1089:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1090:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1091:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1092:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1093:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1094:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1095:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1099:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1100:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1101:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1102:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1103:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1104:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1105:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1106:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1107:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1108:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1109:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1110:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1111:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1112:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1113:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1114:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1115:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1116:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1117:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1118:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1119:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1120:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1121:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1122:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1123:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1127:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1128:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1129:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1130:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1131:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1132:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1133:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1134:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1135:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1136:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1137:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1138:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1139:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1140:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1141:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1142:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1143:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1144:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1145:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1146:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1147:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1148:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1149:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1150:1: sparse: sparse: obsolete struct initializer, use C99 syntax
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1151:1: sparse: sparse: obsolete struct initializer, use C99 syntax
>> drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1516:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *fifo_base @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1516:39: sparse:     expected void [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1516:39: sparse:     got void *fifo_base
>> drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1518:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *iobase @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1518:41: sparse:     expected void [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1518:41: sparse:     got void *iobase
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1641:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *fifo_base @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1641:39: sparse:     expected void [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1641:39: sparse:     got void *fifo_base
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1643:41: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __iomem *addr @@     got void *iobase @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1643:41: sparse:     expected void [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1643:41: sparse:     got void *iobase
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1042:18: sparse: sparse: symbol 'fmh_gpib_unaccel_interface' was not declared. Should it be static?
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1070:18: sparse: sparse: symbol 'fmh_gpib_interface' was not declared. Should it be static?
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1098:18: sparse: sparse: symbol 'fmh_gpib_pci_interface' was not declared. Should it be static?
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1126:18: sparse: sparse: symbol 'fmh_gpib_pci_unaccel_interface' was not declared. Should it be static?
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1423:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *iobase @@     got void [noderef] __iomem * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1423:26: sparse:     expected void *iobase
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1423:26: sparse:     got void [noderef] __iomem *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1445:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *fifo_base @@     got void [noderef] __iomem * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1445:27: sparse:     expected void *fifo_base
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1445:27: sparse:     got void [noderef] __iomem *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1568:26: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *iobase @@     got void [noderef] __iomem * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1568:26: sparse:     expected void *iobase
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1568:26: sparse:     got void [noderef] __iomem *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1576:35: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *fifo_base @@     got void [noderef] __iomem * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1576:35: sparse:     expected void *fifo_base
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c:1576:35: sparse:     got void [noderef] __iomem *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.c: note: in included file:
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:130:39: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:130:39: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:130:39: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:136:39: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:136:39: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:136:39: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse:     expected void const volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:143:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     got void *
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void * @@
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/staging/gpib/fmh_gpib/fmh_gpib.h:150:42: sparse:     got void *

vim +800 drivers/staging/gpib/agilent_82350b/agilent_82350b.c

09a4655ee1ebdf Dave Penkler 2024-09-18  785  
09a4655ee1ebdf Dave Penkler 2024-09-18  786  {
09a4655ee1ebdf Dave Penkler 2024-09-18  787  	struct agilent_82350b_priv *a_priv = board->private_data;
09a4655ee1ebdf Dave Penkler 2024-09-18  788  	struct tms9914_priv *tms_priv;
09a4655ee1ebdf Dave Penkler 2024-09-18  789  
09a4655ee1ebdf Dave Penkler 2024-09-18  790  	if (a_priv) {
09a4655ee1ebdf Dave Penkler 2024-09-18  791  		if (a_priv->plx_base) // disable interrupts
09a4655ee1ebdf Dave Penkler 2024-09-18  792  			writel(0, a_priv->plx_base + PLX9050_INTCSR_REG);
09a4655ee1ebdf Dave Penkler 2024-09-18  793  
09a4655ee1ebdf Dave Penkler 2024-09-18  794  		tms_priv = &a_priv->tms9914_priv;
09a4655ee1ebdf Dave Penkler 2024-09-18  795  		if (a_priv->irq)
09a4655ee1ebdf Dave Penkler 2024-09-18  796  			free_irq(a_priv->irq, board);
09a4655ee1ebdf Dave Penkler 2024-09-18  797  		if (a_priv->gpib_base) {
09a4655ee1ebdf Dave Penkler 2024-09-18  798  			tms9914_board_reset(tms_priv);
09a4655ee1ebdf Dave Penkler 2024-09-18  799  			if (a_priv->misc_base)
09a4655ee1ebdf Dave Penkler 2024-09-18 @800  				iounmap((void *)a_priv->misc_base);
09a4655ee1ebdf Dave Penkler 2024-09-18  801  			if (a_priv->borg_base)
09a4655ee1ebdf Dave Penkler 2024-09-18  802  				iounmap((void *)a_priv->borg_base);
09a4655ee1ebdf Dave Penkler 2024-09-18  803  			if (a_priv->sram_base)
09a4655ee1ebdf Dave Penkler 2024-09-18  804  				iounmap((void *)a_priv->sram_base);
09a4655ee1ebdf Dave Penkler 2024-09-18  805  			if (a_priv->gpib_base)
09a4655ee1ebdf Dave Penkler 2024-09-18  806  				iounmap((void *)a_priv->gpib_base);
09a4655ee1ebdf Dave Penkler 2024-09-18  807  			if (a_priv->plx_base)
09a4655ee1ebdf Dave Penkler 2024-09-18  808  				iounmap((void *)a_priv->plx_base);
09a4655ee1ebdf Dave Penkler 2024-09-18  809  			pci_release_regions(a_priv->pci_device);
09a4655ee1ebdf Dave Penkler 2024-09-18  810  		}
09a4655ee1ebdf Dave Penkler 2024-09-18  811  		if (a_priv->pci_device)
09a4655ee1ebdf Dave Penkler 2024-09-18  812  			pci_dev_put(a_priv->pci_device);
09a4655ee1ebdf Dave Penkler 2024-09-18  813  	}
09a4655ee1ebdf Dave Penkler 2024-09-18  814  	agilent_82350b_free_private(board);
09a4655ee1ebdf Dave Penkler 2024-09-18  815  }
09a4655ee1ebdf Dave Penkler 2024-09-18  816  

:::::: The code at line 800 was first introduced by commit
:::::: 09a4655ee1ebdf64d1ffae063c1e13c4cc17bf04 staging: gpib: Add HP/Agilent/Keysight 8235xx PCI GPIB driver

:::::: TO: Dave Penkler <dpenkler@gmail.com>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
