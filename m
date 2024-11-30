Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 533761369B4
	for <oe-kbuild-all@lists.linux.dev>; Sat, 30 Nov 2024 04:14:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732940042; cv=none; b=CPUUIFh/VJmDmqNMWeZGO4nZ+fOomVFkIwWL6LKETAlR2JpKgRZ0kI3Qh1sS8R3wYcRSvrlaLndaJdGVJLAgwXTFCw+OmkVelFIjG91wChBVBsjckTq7AL5ejRmGTn/0UWLxAadbYG0tcIOssrH8iwNAPoL1MePZ4G6JSuryxPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732940042; c=relaxed/simple;
	bh=5iDOvJyTxSFCN1jrThPj2mBIc1+msd8owR4C2nIUR5s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tIMo+ZCZD6UT2wdikgBwSQz2NgyzqIhj5W802w5rMH1T60HJSGqf2NNgoQMTpVv4IcRoW/N13SktxpheKO7V9GvhBQRR0JihgVD8RiD0igwTAWmgGBItKh907XhSJ0Il3EOz0b7F2RxIMfovcb6AgUsAaziv/zui/Nu3mT7jOMQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Ip5IujY/; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ip5IujY/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732940041; x=1764476041;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=5iDOvJyTxSFCN1jrThPj2mBIc1+msd8owR4C2nIUR5s=;
  b=Ip5IujY/AQ8siKeCIAI45U1eZDWiDzn2U9y6/MohsXf1gAS74tB/HSQJ
   9e10W6SQu8wbNWGOpQHbxwUqml8XaKVnfjZy9/NMhj7LNOa7ODZgmEYXD
   4ejlzZW2XOE/g+mht+tB1OhuOxkjtLK9JYMakF5rOuqQYkQhr52HJs/bl
   5YjmOhlPf7frKa5DHnROa0At3gqcxqKVboR1FmGMX58x1ikJwMJRy32KA
   YrVHL2hAbGNPq1M5mryUiVJyz4QOWzrIDe5H9goCvawtXc+G/u5in59Vo
   lNc3spLJ3mnICh4kW46MUbGduHbQvTw3GHraMjyUMRfNLO2MGEuQkHatE
   A==;
X-CSE-ConnectionGUID: TmePwEMyQ224MaEJ3s1uUA==
X-CSE-MsgGUID: fhTXU4J1QJmLnwy4t6bTuQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11271"; a="33027499"
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="33027499"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Nov 2024 20:13:58 -0800
X-CSE-ConnectionGUID: lfookdxFRIWiR9QzEDCUlw==
X-CSE-MsgGUID: XGP/rtb/QB2eblhoBIzr0w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,197,1728975600"; 
   d="scan'208";a="92942844"
Received: from lkp-server02.sh.intel.com (HELO 36a1563c48ff) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 29 Nov 2024 20:13:56 -0800
Received: from kbuild by 36a1563c48ff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tHEri-00004r-0u;
	Sat, 30 Nov 2024 04:13:54 +0000
Date: Sat, 30 Nov 2024 12:12:54 +0800
From: kernel test robot <lkp@intel.com>
To: Aurelien Jarno <aurelien@aurel32.net>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Palmer Dabbelt <palmer@rivosinc.com>
Subject: drivers/usb/core/devio.c:2045:13: sparse: sparse: cast removes
 address space '__user' of expression
Message-ID: <202411301208.hn3ay9DH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2ba9f676d0a2e408aef14d679984c26373bf37b7
commit: 6df2a016c0c8a3d0933ef33dd192ea6606b115e3 riscv: fix build with binutils 2.38
date:   2 years, 10 months ago
config: riscv-randconfig-r123-20241120 (https://download.01.org/0day-ci/archive/20241130/202411301208.hn3ay9DH-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20241130/202411301208.hn3ay9DH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411301208.hn3ay9DH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/usb/core/devio.c:2045:13: sparse: sparse: cast removes address space '__user' of expression
   drivers/usb/core/devio.c: note: in included file (through include/linux/gfp.h, include/linux/radix-tree.h, include/linux/fs.h):
   include/linux/mmzone.h:1526:40: sparse: sparse: self-comparison always evaluates to false

vim +/__user +2045 drivers/usb/core/devio.c

2ef47001b3ee3d Alan Stern     2017-11-08  2014  
^1da177e4c3f41 Linus Torvalds 2005-04-16  2015  static int processcompl(struct async *as, void __user * __user *arg)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2016  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2017  	struct urb *urb = as->urb;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2018  	struct usbdevfs_urb __user *userurb = as->userurb;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2019  	void __user *addr = as->userurb;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2020  	unsigned int i;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2021  
2ef47001b3ee3d Alan Stern     2017-11-08  2022  	compute_isochronous_actual_length(urb);
7152b592593b9d Alan Stern     2010-03-06  2023  	if (as->userbuffer && urb->actual_length) {
3d97ff63f89977 Hans de Goede  2012-07-04  2024  		if (copy_urb_data_to_user(as->userbuffer, urb))
d794a02111cd33 Oliver Neukum  2009-06-28  2025  			goto err_out;
7152b592593b9d Alan Stern     2010-03-06  2026  	}
e015268d2fcfca Alan Stern     2007-08-24  2027  	if (put_user(as->status, &userurb->status))
d794a02111cd33 Oliver Neukum  2009-06-28  2028  		goto err_out;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2029  	if (put_user(urb->actual_length, &userurb->actual_length))
d794a02111cd33 Oliver Neukum  2009-06-28  2030  		goto err_out;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2031  	if (put_user(urb->error_count, &userurb->error_count))
d794a02111cd33 Oliver Neukum  2009-06-28  2032  		goto err_out;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2033  
93cf9b909efb77 Alan Stern     2007-07-30  2034  	if (usb_endpoint_xfer_isoc(&urb->ep->desc)) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2035  		for (i = 0; i < urb->number_of_packets; i++) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2036  			if (put_user(urb->iso_frame_desc[i].actual_length,
^1da177e4c3f41 Linus Torvalds 2005-04-16  2037  				     &userurb->iso_frame_desc[i].actual_length))
d794a02111cd33 Oliver Neukum  2009-06-28  2038  				goto err_out;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2039  			if (put_user(urb->iso_frame_desc[i].status,
^1da177e4c3f41 Linus Torvalds 2005-04-16  2040  				     &userurb->iso_frame_desc[i].status))
d794a02111cd33 Oliver Neukum  2009-06-28  2041  				goto err_out;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2042  		}
668a9541a56af5 Christopher Li 2005-04-18  2043  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  2044  
^1da177e4c3f41 Linus Torvalds 2005-04-16 @2045  	if (put_user(addr, (void __user * __user *)arg))
^1da177e4c3f41 Linus Torvalds 2005-04-16  2046  		return -EFAULT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2047  	return 0;
d794a02111cd33 Oliver Neukum  2009-06-28  2048  
d794a02111cd33 Oliver Neukum  2009-06-28  2049  err_out:
d794a02111cd33 Oliver Neukum  2009-06-28  2050  	return -EFAULT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2051  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  2052  

:::::: The code at line 2045 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
