Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 686C3347B4
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Sep 2024 11:39:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727350756; cv=none; b=qWSAdAr7YCb/mQsrTjIvQj6cBjhniJkXZf6H0euXcEETtbJGDDET8q9KokDa2cnEBuQvCSXkYJkE205LAWNhR2PPuk0zWGKvwZiJkuM1x/BNNsWTEUYBOIpwlmBnNV1MK23tcQMAdakJ6lJJ7IT9rvcpO2OY3b892RsNIhQBljo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727350756; c=relaxed/simple;
	bh=cDwf0sosdWgnNGxpCFsNiapuoGPvqeBjbKGPfpjYstA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PfOcwmnx26SG7SQNR/WnzTl88zlaIBSDqPOk93dkkgBSKsGxp50ZeVDI0OFhG4Z4YrKBhpL8DI7Ov5EJU/V6vfNc6+fZLJJEGtqO4gJC8if7zUGnveuOghDwcu5lNOXoa//8U+Nm+RwlVpcoK1N7a4i8BBTmkadh33DqmW6SzmQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jWw/AZ6Z; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jWw/AZ6Z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1727350753; x=1758886753;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cDwf0sosdWgnNGxpCFsNiapuoGPvqeBjbKGPfpjYstA=;
  b=jWw/AZ6Z3APESIttOSlug3h3cllrcb0ItQpklyVjWNHC0TtAV1QWwSh+
   MeBKSBvjETVcg+42doOfmqjaG5R8xX6GW2MJLVMJwB+1He0OdgSdxxp2d
   t3l1+eOPWFG2eWSdhEtZva9733c+520PsdMIplrxzNldcEUEGwlmUA5Az
   9TUj2ue/yszsThW+8gkh+NIG6TYveKNXeFpZ3W9Z5L0X5ifTJLUrNP1TM
   PRSJbei5ch7Qz6L4Xy84FK14Ok+hOEpjZTu5Dj7wdEqH9BCWk70W2eXOR
   lwZoYMw3HoWt9/AKu838/xcbVEAGJKpK1nz1PcUiDl7anuokHvyFLjH5B
   g==;
X-CSE-ConnectionGUID: lUeimVuhSke6TFAbIOmmzA==
X-CSE-MsgGUID: PxnUOlGNTCK4t3X3gka/LQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11206"; a="43908712"
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="43908712"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Sep 2024 04:39:13 -0700
X-CSE-ConnectionGUID: DSupI+IXSPabMBb5arzqpg==
X-CSE-MsgGUID: /gqk3Uy7Sai4I89ojJjznw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,155,1725346800"; 
   d="scan'208";a="76615969"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 26 Sep 2024 04:39:11 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1stmpx-000Ke8-0S;
	Thu, 26 Sep 2024 11:39:09 +0000
Date: Thu, 26 Sep 2024 19:38:13 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: drivers/ata/pata_buddha.c:75:27: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202409261948.Zj19OPgQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   11a299a7933e03c83818b431e6a1c53ad387423d
commit: c7db3832ff19a9a1116c1b3d435c9db165a2f2f8 m68k: io: Mark mmio read addresses as const
date:   12 months ago
config: m68k-randconfig-r121-20240926 (https://download.01.org/0day-ci/archive/20240926/202409261948.Zj19OPgQ-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20240926/202409261948.Zj19OPgQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409261948.Zj19OPgQ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/ata/pata_buddha.c:75:27: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/ata/pata_buddha.c:75:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short const volatile [noderef] [usertype] __iomem *port @@     got unsigned short [usertype] * @@
   drivers/ata/pata_buddha.c:75:27: sparse:     expected unsigned short const volatile [noderef] [usertype] __iomem *port
   drivers/ata/pata_buddha.c:75:27: sparse:     got unsigned short [usertype] *
   drivers/ata/pata_buddha.c:77:28: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/ata/pata_buddha.c:77:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short volatile [noderef] [usertype] __iomem *port @@     got unsigned short [usertype] * @@
   drivers/ata/pata_buddha.c:77:28: sparse:     expected unsigned short volatile [noderef] [usertype] __iomem *port
   drivers/ata/pata_buddha.c:77:28: sparse:     got unsigned short [usertype] *
   drivers/ata/pata_buddha.c:87:35: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/ata/pata_buddha.c:87:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short const volatile [noderef] [usertype] __iomem *port @@     got unsigned short [usertype] * @@
   drivers/ata/pata_buddha.c:87:35: sparse:     expected unsigned short const volatile [noderef] [usertype] __iomem *port
   drivers/ata/pata_buddha.c:87:35: sparse:     got unsigned short [usertype] *
   drivers/ata/pata_buddha.c:91:36: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/ata/pata_buddha.c:91:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short volatile [noderef] [usertype] __iomem *port @@     got unsigned short [usertype] * @@
   drivers/ata/pata_buddha.c:91:36: sparse:     expected unsigned short volatile [noderef] [usertype] __iomem *port
   drivers/ata/pata_buddha.c:91:36: sparse:     got unsigned short [usertype] *
   drivers/ata/pata_buddha.c:236:37: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/ata/pata_buddha.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
--
   drivers/ata/pata_gayle.c:53:27: sparse: sparse: cast removes address space '__iomem' of expression
>> drivers/ata/pata_gayle.c:53:27: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short const volatile [noderef] [usertype] __iomem *port @@     got unsigned short [usertype] * @@
   drivers/ata/pata_gayle.c:53:27: sparse:     expected unsigned short const volatile [noderef] [usertype] __iomem *port
   drivers/ata/pata_gayle.c:53:27: sparse:     got unsigned short [usertype] *
   drivers/ata/pata_gayle.c:55:28: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/ata/pata_gayle.c:55:28: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short volatile [noderef] [usertype] __iomem *port @@     got unsigned short [usertype] * @@
   drivers/ata/pata_gayle.c:55:28: sparse:     expected unsigned short volatile [noderef] [usertype] __iomem *port
   drivers/ata/pata_gayle.c:55:28: sparse:     got unsigned short [usertype] *
   drivers/ata/pata_gayle.c:65:35: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/ata/pata_gayle.c:65:35: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short const volatile [noderef] [usertype] __iomem *port @@     got unsigned short [usertype] * @@
   drivers/ata/pata_gayle.c:65:35: sparse:     expected unsigned short const volatile [noderef] [usertype] __iomem *port
   drivers/ata/pata_gayle.c:65:35: sparse:     got unsigned short [usertype] *
   drivers/ata/pata_gayle.c:69:36: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/ata/pata_gayle.c:69:36: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected unsigned short volatile [noderef] [usertype] __iomem *port @@     got unsigned short [usertype] * @@
   drivers/ata/pata_gayle.c:69:36: sparse:     expected unsigned short volatile [noderef] [usertype] __iomem *port
   drivers/ata/pata_gayle.c:69:36: sparse:     got unsigned short [usertype] *
   drivers/ata/pata_gayle.c:181:29: sparse: sparse: cast removes address space '__iomem' of expression
   drivers/ata/pata_gayle.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false

vim +75 drivers/ata/pata_buddha.c

740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  62  
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  63  /* FIXME: is this needed? */
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  64  static unsigned int pata_buddha_data_xfer(struct ata_queued_cmd *qc,
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  65  					 unsigned char *buf,
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  66  					 unsigned int buflen, int rw)
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  67  {
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  68  	struct ata_device *dev = qc->dev;
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  69  	struct ata_port *ap = dev->link->ap;
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  70  	void __iomem *data_addr = ap->ioaddr.data_addr;
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  71  	unsigned int words = buflen >> 1;
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  72  
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  73  	/* Transfer multiple of 2 bytes */
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  74  	if (rw == READ)
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07 @75  		raw_insw((u16 *)data_addr, (u16 *)buf, words);
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  76  	else
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  77  		raw_outsw((u16 *)data_addr, (u16 *)buf, words);
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  78  
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  79  	/* Transfer trailing byte, if any. */
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  80  	if (unlikely(buflen & 0x01)) {
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  81  		unsigned char pad[2] = { };
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  82  
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  83  		/* Point buf to the tail of buffer */
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  84  		buf += buflen - 1;
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  85  
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  86  		if (rw == READ) {
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  87  			raw_insw((u16 *)data_addr, (u16 *)pad, 1);
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  88  			*buf = pad[0];
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  89  		} else {
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  90  			pad[0] = *buf;
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  91  			raw_outsw((u16 *)data_addr, (u16 *)pad, 1);
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  92  		}
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  93  		words++;
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  94  	}
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  95  
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  96  	return words << 1;
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  97  }
740c68a0cd42aa Bartlomiej Zolnierkiewicz 2019-02-07  98  

:::::: The code at line 75 was first introduced by commit
:::::: 740c68a0cd42aab21ad9aaae092ff8a2215966b1 ata: add Buddha PATA controller driver

:::::: TO: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
