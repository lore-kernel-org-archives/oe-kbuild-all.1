Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6341138FB4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 12:56:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CfucZq6L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701348978; x=1732884978;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=LWQYYfmjwqFNb5WRwg7F4v/wSE+Uuad5ZCZbzFgrdig=;
  b=CfucZq6L1okc2XR6XQsuiXBBOQt5UV0eJqwWJQfh9SxVGOJ5QlU05rXM
   wurh9rXNLA2k6PeG528nc7QRdG8rLfnEDnpYe/jm4uT7Tubi614IPoQ46
   nQrmI3JDKHbvrHJShjSMnb7+SaspCNNezwhfkRd3PyRgcxWTX1/Dbp/+N
   M67eLswFmiTGDTd4wPUmc6VjMW7Dzs2U9xS2xdrEMZrrtj2ltoPcJT1Oq
   d5KVAPDIHsqn16Pqd3185ik+e6QbjmO9h/xd0WHek6ZHHeVmrIib5Hdet
   OrEh4QDO5JX5rdGqJussWWjWhP9IelQ7ktGwOlx+goWXNrz2BM5eNRWoR
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="219224"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="219224"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 04:56:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10909"; a="892799798"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="892799798"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 30 Nov 2023 04:56:11 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8gaP-0001xI-0A;
	Thu, 30 Nov 2023 12:56:09 +0000
Date: Thu, 30 Nov 2023 20:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: Baoquan He <bhe@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christoph Hellwig <hch@lst.de>,
	"Mike Rapoport (IBM)" <rppt@kernel.org>
Subject: drivers/video/fbdev/imsttfb.c:1561:20: sparse: sparse: incorrect
 type in argument 1 (different address spaces)
Message-ID: <202311302054.loV1YuMw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3b47bc037bd44f142ac09848e8d3ecccc726be99
commit: 426b313f356a314af335899c51250dc0f49cd4a7 parisc: mm: convert to GENERIC_IOREMAP
date:   3 months ago
config: parisc-randconfig-m041-20230821 (https://download.01.org/0day-ci/archive/20231130/202311302054.loV1YuMw-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231130/202311302054.loV1YuMw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311302054.loV1YuMw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/video/fbdev/imsttfb.c:1524:30: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/imsttfb.c:1524:27: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected char [noderef] __iomem *screen_base @@     got unsigned char [usertype] * @@
   drivers/video/fbdev/imsttfb.c:1524:27: sparse:     expected char [noderef] __iomem *screen_base
   drivers/video/fbdev/imsttfb.c:1524:27: sparse:     got unsigned char [usertype] *
   drivers/video/fbdev/imsttfb.c:1533:27: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/video/fbdev/imsttfb.c:1561:20: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] *cmap_regs @@
   drivers/video/fbdev/imsttfb.c:1561:20: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/imsttfb.c:1561:20: sparse:     got unsigned char [usertype] *cmap_regs
   drivers/video/fbdev/imsttfb.c:1361:15: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/video/fbdev/imsttfb.c:1362:16: sparse: sparse: cast removes address space '__iomem' of expression
--
>> drivers/video/fbdev/aty/atyfb_base.c:3734:37: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void volatile [noderef] __iomem *addr @@     got unsigned char [usertype] *addr @@
   drivers/video/fbdev/aty/atyfb_base.c:3734:37: sparse:     expected void volatile [noderef] __iomem *addr
   drivers/video/fbdev/aty/atyfb_base.c:3734:37: sparse:     got unsigned char [usertype] *addr
   drivers/video/fbdev/aty/atyfb_base.c:1787:15: sparse: sparse: self-comparison always evaluates to false

vim +1561 drivers/video/fbdev/imsttfb.c

^1da177e4c3f41 drivers/video/imsttfb.c Linus Torvalds     2005-04-16  1553  
48c68c4f1b5424 drivers/video/imsttfb.c Greg Kroah-Hartman 2012-12-21  1554  static void imsttfb_remove(struct pci_dev *pdev)
^1da177e4c3f41 drivers/video/imsttfb.c Linus Torvalds     2005-04-16  1555  {
^1da177e4c3f41 drivers/video/imsttfb.c Linus Torvalds     2005-04-16  1556  	struct fb_info *info = pci_get_drvdata(pdev);
94f9e09ce531d4 drivers/video/imsttfb.c Antonino A. Daplas 2006-01-09  1557  	struct imstt_par *par = info->par;
^1da177e4c3f41 drivers/video/imsttfb.c Linus Torvalds     2005-04-16  1558  	int size = pci_resource_len(pdev, 0);
^1da177e4c3f41 drivers/video/imsttfb.c Linus Torvalds     2005-04-16  1559  
^1da177e4c3f41 drivers/video/imsttfb.c Linus Torvalds     2005-04-16  1560  	unregister_framebuffer(info);
^1da177e4c3f41 drivers/video/imsttfb.c Linus Torvalds     2005-04-16 @1561  	iounmap(par->cmap_regs);
^1da177e4c3f41 drivers/video/imsttfb.c Linus Torvalds     2005-04-16  1562  	iounmap(par->dc_regs);
^1da177e4c3f41 drivers/video/imsttfb.c Linus Torvalds     2005-04-16  1563  	iounmap(info->screen_base);
^1da177e4c3f41 drivers/video/imsttfb.c Linus Torvalds     2005-04-16  1564  	release_mem_region(info->fix.smem_start, size);
94f9e09ce531d4 drivers/video/imsttfb.c Antonino A. Daplas 2006-01-09  1565  	framebuffer_release(info);
^1da177e4c3f41 drivers/video/imsttfb.c Linus Torvalds     2005-04-16  1566  }
^1da177e4c3f41 drivers/video/imsttfb.c Linus Torvalds     2005-04-16  1567  

:::::: The code at line 1561 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
