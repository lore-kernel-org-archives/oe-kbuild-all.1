Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC6E68298
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 19:49:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="l2VhbQc7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702496956; x=1734032956;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VMIyWFPBoziBwOR2qRbfpmySuBtcRnnAfsw+Uk9nZvQ=;
  b=l2VhbQc7blhZUyVkbv55ft+QEGcD644N+N832ln9tVupPU36zWyoXsYP
   KYEMVRf2552ZubKfXIN79KwpF106VH+X4N+fFBWrIw/X/yYxPHiU1vlfT
   4Rckd1V22W56TttT+hMFClkgL2KTN/WLbrufwOwfXDXYu6m+fUmKxizK3
   HEDl3C0RKYfH0kSQ+zNkr4B3IrU93srQGmcMitaEP7GdeMgVRduOn0I4w
   NKMTuSb9csfOuBMNl7d9M1rz8/0I5mN1Ri9WMQGul6gjdQeRMHbB7sPb1
   MNf3pf+Ledw/ypwgOhi5C6LGbFshErnLmVlA11H74qH0nZhfoC14NKpse
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="397801798"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="397801798"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Dec 2023 11:49:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10923"; a="774064432"
X-IronPort-AV: E=Sophos;i="6.04,273,1695711600"; 
   d="scan'208";a="774064432"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga002.jf.intel.com with ESMTP; 13 Dec 2023 11:49:12 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDVED-000L4v-29;
	Wed, 13 Dec 2023 19:49:09 +0000
Date: Thu, 14 Dec 2023 03:48:21 +0800
From: kernel test robot <lkp@intel.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Arnd Bergmann <arnd@arndb.de>
Subject: drivers/uio/uio_aec.c:50:49: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202312140356.Kzhqi4p0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   88035e5694a86a7167d490bb95e9df97a9bb162b
commit: 8f28ca6bd8211214faf717677bbffe375c2a6072 iomap: constify ioreadX() iomem argument (as in generic implementation)
date:   3 years, 4 months ago
config: i386-randconfig-061-20231101 (https://download.01.org/0day-ci/archive/20231214/202312140356.Kzhqi4p0-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231214/202312140356.Kzhqi4p0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312140356.Kzhqi4p0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/uio/uio_aec.c:44:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __iomem *int_flag @@     got void * @@
   drivers/uio/uio_aec.c:44:49: sparse:     expected void [noderef] __iomem *int_flag
   drivers/uio/uio_aec.c:44:49: sparse:     got void *
>> drivers/uio/uio_aec.c:50:49: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/uio/uio_aec.c:50:49: sparse:     expected void const [noderef] __iomem *
   drivers/uio/uio_aec.c:50:49: sparse:     got void *
   drivers/uio/uio_aec.c:59:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/uio/uio_aec.c:59:9: sparse:     expected void const [noderef] __iomem *
   drivers/uio/uio_aec.c:59:9: sparse:     got void *
   drivers/uio/uio_aec.c:59:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/uio/uio_aec.c:59:9: sparse:     expected void const [noderef] __iomem *
   drivers/uio/uio_aec.c:59:9: sparse:     got void *
   drivers/uio/uio_aec.c:59:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/uio/uio_aec.c:59:9: sparse:     expected void const [noderef] __iomem *
   drivers/uio/uio_aec.c:59:9: sparse:     got void *
   drivers/uio/uio_aec.c:59:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/uio/uio_aec.c:59:9: sparse:     expected void const [noderef] __iomem *
   drivers/uio/uio_aec.c:59:9: sparse:     got void *
   drivers/uio/uio_aec.c:59:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/uio/uio_aec.c:59:9: sparse:     expected void const [noderef] __iomem *
   drivers/uio/uio_aec.c:59:9: sparse:     got void *
   drivers/uio/uio_aec.c:59:9: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/uio/uio_aec.c:59:9: sparse:     expected void const [noderef] __iomem *
   drivers/uio/uio_aec.c:59:9: sparse:     got void *
   drivers/uio/uio_aec.c:88:20: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void *priv @@     got void [noderef] __iomem * @@
   drivers/uio/uio_aec.c:88:20: sparse:     expected void *priv
   drivers/uio/uio_aec.c:88:20: sparse:     got void [noderef] __iomem *
   drivers/uio/uio_aec.c:104:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/uio/uio_aec.c:104:42: sparse:     expected void [noderef] __iomem *
   drivers/uio/uio_aec.c:104:42: sparse:     got void *
   drivers/uio/uio_aec.c:105:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/uio/uio_aec.c:105:43: sparse:     expected void [noderef] __iomem *
   drivers/uio/uio_aec.c:105:43: sparse:     got void *
   drivers/uio/uio_aec.c:106:34: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/uio/uio_aec.c:106:34: sparse:     expected void const [noderef] __iomem *
   drivers/uio/uio_aec.c:106:34: sparse:     got void *
   drivers/uio/uio_aec.c:115:31: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void *priv @@
   drivers/uio/uio_aec.c:115:31: sparse:     expected void [noderef] __iomem *
   drivers/uio/uio_aec.c:115:31: sparse:     got void *priv
   drivers/uio/uio_aec.c:130:42: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/uio/uio_aec.c:130:42: sparse:     expected void [noderef] __iomem *
   drivers/uio/uio_aec.c:130:42: sparse:     got void *
   drivers/uio/uio_aec.c:131:43: sparse: sparse: incorrect type in argument 2 (different address spaces) @@     expected void [noderef] __iomem * @@     got void * @@
   drivers/uio/uio_aec.c:131:43: sparse:     expected void [noderef] __iomem *
   drivers/uio/uio_aec.c:131:43: sparse:     got void *
   drivers/uio/uio_aec.c:133:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void const [noderef] __iomem * @@     got void * @@
   drivers/uio/uio_aec.c:133:28: sparse:     expected void const [noderef] __iomem *
   drivers/uio/uio_aec.c:133:28: sparse:     got void *
   drivers/uio/uio_aec.c:138:21: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got void *priv @@
   drivers/uio/uio_aec.c:138:21: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/uio/uio_aec.c:138:21: sparse:     got void *priv

vim +50 drivers/uio/uio_aec.c

1bafeb378e915f Brandon Philips 2009-01-27  41  
1bafeb378e915f Brandon Philips 2009-01-27  42  static irqreturn_t aectc_irq(int irq, struct uio_info *dev_info)
1bafeb378e915f Brandon Philips 2009-01-27  43  {
1bafeb378e915f Brandon Philips 2009-01-27  44  	void __iomem *int_flag = dev_info->priv + INTA_DRVR_ADDR;
1bafeb378e915f Brandon Philips 2009-01-27  45  	unsigned char status = ioread8(int_flag);
1bafeb378e915f Brandon Philips 2009-01-27  46  
1bafeb378e915f Brandon Philips 2009-01-27  47  
1bafeb378e915f Brandon Philips 2009-01-27  48  	if ((status & INTA_ENABLED_FLAG) && (status & INTA_FLAG)) {
1bafeb378e915f Brandon Philips 2009-01-27  49  		/* application writes 0x00 to 0x2F to get next interrupt */
1bafeb378e915f Brandon Philips 2009-01-27 @50  		status = ioread8(dev_info->priv + MAILBOX);
1bafeb378e915f Brandon Philips 2009-01-27  51  		return IRQ_HANDLED;
1bafeb378e915f Brandon Philips 2009-01-27  52  	}
1bafeb378e915f Brandon Philips 2009-01-27  53  
1bafeb378e915f Brandon Philips 2009-01-27  54  	return IRQ_NONE;
1bafeb378e915f Brandon Philips 2009-01-27  55  }
1bafeb378e915f Brandon Philips 2009-01-27  56  

:::::: The code at line 50 was first introduced by commit
:::::: 1bafeb378e915f39b1bf44ee0871823d6f402ea5 uio: add the uio_aec driver

:::::: TO: Brandon Philips <brandon@ifup.org>
:::::: CC: Greg Kroah-Hartman <gregkh@suse.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
