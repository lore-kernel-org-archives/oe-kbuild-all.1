Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FAB919307D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Oct 2024 04:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729483242; cv=none; b=mZEYd/BSRV2UDl8rop7IfhLN9OPjp1PUF0kTEkYzkvr+3/FMHbTHiXZaGU0YcI58UwRiF7aR99tqYgGNw+UVDMuHJiNDPLmYo2uNl/aUgCQbjkYZw7TAC5GMnCMJQiD2kQvz/pBMmaqq+9vzPm4LZH2aZ7cscpxxxY9Bvl4FTLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729483242; c=relaxed/simple;
	bh=KPwaQfgL5UdQTL0Ck0/QRdf944jj7b2G8Gs0rKT8LNI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pCyuEZ5D2Mzi+Lt038pbc1bP4xVkaYtvnVgyv0wx8IHxn3nezKRD60D/9Z4Ote5HMVo8+Gs+L/LbOT600rAmAVSSpNgF3u3kjG1UGtoZ02GSJIIn86fvVv+YlyxwyCM22a449UQpssAD5cKgUNp6qRTQsvG0DIbds9YZKY7PUXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IGsWK/Uf; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IGsWK/Uf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729483240; x=1761019240;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KPwaQfgL5UdQTL0Ck0/QRdf944jj7b2G8Gs0rKT8LNI=;
  b=IGsWK/UfyS0zRDnt5gcnWl7YCvnz91Smn6P7iKx7A56oEjmvC/58UwT4
   aTj7gH8AApfafDTzn18hLeAZ0M/2VuBp3geqhuoZlaPEev+HTL5naC5ic
   qpbXt6/Rc/V5Ix+tirNFxGZ/d5+PV115vCpdZKhQ+xkzGjrN4x8NHGmId
   +FIq93eyklWbqJHltFtYLKmjbLmf4sQwv230VMRmU/lfFWIo6SuXFbkLj
   U7QHZV04SADeucIN8lzUpvC+9HcXlI198LzGSRna7zJXCmhEeRbzG+e0u
   Ct2NOb7BmveAC1V8vBNAfNfo0+Pp8QcJCV3teu9f5lThaw2U2aODfvA7U
   g==;
X-CSE-ConnectionGUID: Wa21P0WYRIGFPtoNWqb1NQ==
X-CSE-MsgGUID: J9Ivo27sTey1k5M3F2oMqw==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="28829389"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="28829389"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2024 21:00:38 -0700
X-CSE-ConnectionGUID: PzDkbZPtRjymmlY6O+0eKw==
X-CSE-MsgGUID: zTyqm3CzRXuiSKauEsgw6A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,219,1725346800"; 
   d="scan'208";a="79052803"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 20 Oct 2024 21:00:36 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t2jas-000R8C-1W;
	Mon, 21 Oct 2024 04:00:34 +0000
Date: Mon, 21 Oct 2024 11:59:37 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: drivers/ata/pata_gayle.c:53:27: sparse: sparse: incorrect type in
 argument 1 (different address spaces)
Message-ID: <202410211139.nbQGaA39-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   42f7652d3eb527d03665b09edac47f85fb600924
commit: c7db3832ff19a9a1116c1b3d435c9db165a2f2f8 m68k: io: Mark mmio read addresses as const
date:   1 year, 1 month ago
config: m68k-randconfig-r132-20241021 (https://download.01.org/0day-ci/archive/20241021/202410211139.nbQGaA39-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 14.1.0
reproduce: (https://download.01.org/0day-ci/archive/20241021/202410211139.nbQGaA39-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410211139.nbQGaA39-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
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

vim +53 drivers/ata/pata_gayle.c

9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  40  
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  41  /* FIXME: is this needed? */
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  42  static unsigned int pata_gayle_data_xfer(struct ata_queued_cmd *qc,
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  43  					 unsigned char *buf,
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  44  					 unsigned int buflen, int rw)
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  45  {
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  46  	struct ata_device *dev = qc->dev;
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  47  	struct ata_port *ap = dev->link->ap;
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  48  	void __iomem *data_addr = ap->ioaddr.data_addr;
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  49  	unsigned int words = buflen >> 1;
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  50  
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  51  	/* Transfer multiple of 2 bytes */
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  52  	if (rw == READ)
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16 @53  		raw_insw((u16 *)data_addr, (u16 *)buf, words);
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  54  	else
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  55  		raw_outsw((u16 *)data_addr, (u16 *)buf, words);
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  56  
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  57  	/* Transfer trailing byte, if any. */
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  58  	if (unlikely(buflen & 0x01)) {
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  59  		unsigned char pad[2] = { };
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  60  
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  61  		/* Point buf to the tail of buffer */
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  62  		buf += buflen - 1;
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  63  
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  64  		if (rw == READ) {
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  65  			raw_insw((u16 *)data_addr, (u16 *)pad, 1);
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  66  			*buf = pad[0];
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  67  		} else {
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  68  			pad[0] = *buf;
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  69  			raw_outsw((u16 *)data_addr, (u16 *)pad, 1);
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  70  		}
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  71  		words++;
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  72  	}
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  73  
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  74  	return words << 1;
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  75  }
9ab27d1d35fda0 Bartlomiej Zolnierkiewicz 2018-03-16  76  

:::::: The code at line 53 was first introduced by commit
:::::: 9ab27d1d35fda0c5fce624083e92546a8545e7e5 ata: add Amiga Gayle PATA controller driver

:::::: TO: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>
:::::: CC: Tejun Heo <tj@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
