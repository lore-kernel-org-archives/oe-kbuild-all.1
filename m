Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D730C16438
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Dec 2023 22:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Ks7aUCkS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701641180; x=1733177180;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yQfDWJWHn1Fx7wFk/bbK5kb6fL66cUGrV+bJloSJsEc=;
  b=Ks7aUCkSN2Iy3vRYDlLH2WM5OLa2zdUm4Gp3xnu7IopXZpmNKP4mJ9/T
   abmErAJXRxfQoJxZYS4Ji0ZElSwVNBye7TrrUQC1RiNDFcblDCFN3pziP
   2G6W0MeuSpBotozCiaurqozcD8zAIs74Fcua14U1INlY4W7yN2UMmsgMI
   4g9qRyesWNZechzG7K34owHtVynY2vY3UCBfcz3W7fIofFRHE6SosUot1
   3thbuM37HAWVQVdCwNC2i1eseXiz0eXkTKVCOlSHeSZrnLl3Vd6nEq0jX
   JPiiuZJITr/o1NJedfY0feuYTg3KFjH4wQupyVJmhRUSl8jZvYy+IKgzy
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="563352"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="563352"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Dec 2023 14:06:19 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10913"; a="799396609"
X-IronPort-AV: E=Sophos;i="6.04,248,1695711600"; 
   d="scan'208";a="799396609"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 03 Dec 2023 14:06:17 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r9ubO-0007A0-2P;
	Sun, 03 Dec 2023 22:06:14 +0000
Date: Mon, 4 Dec 2023 06:05:53 +0800
From: kernel test robot <lkp@intel.com>
To: Ondrej Zary <linux@zary.sk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: drivers/ata/pata_parport/frpw.c:210 frpw_test_pnp() warn:
 inconsistent indenting
Message-ID: <202312040519.osHxpP8A-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   33cc938e65a98f1d29d0a18403dbbee050dcad9a
commit: 72f2b0b2185099dce354c805009f591dda3ab73d drivers/block: Move PARIDE protocol modules to drivers/ata/pata_parport
date:   10 months ago
config: arm-randconfig-r071-20231130 (https://download.01.org/0day-ci/archive/20231204/202312040519.osHxpP8A-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231204/202312040519.osHxpP8A-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312040519.osHxpP8A-lkp@intel.com/

smatch warnings:
drivers/ata/pata_parport/frpw.c:210 frpw_test_pnp() warn: inconsistent indenting

vim +210 drivers/ata/pata_parport/frpw.c

^1da177e4c3f41 drivers/block/paride/frpw.c Linus Torvalds 2005-04-16  201  
^1da177e4c3f41 drivers/block/paride/frpw.c Linus Torvalds 2005-04-16  202  	olddelay = pi->delay;
^1da177e4c3f41 drivers/block/paride/frpw.c Linus Torvalds 2005-04-16  203  	pi->delay = 10;
^1da177e4c3f41 drivers/block/paride/frpw.c Linus Torvalds 2005-04-16  204  
^1da177e4c3f41 drivers/block/paride/frpw.c Linus Torvalds 2005-04-16  205  	pi->saved_r0 = r0();
^1da177e4c3f41 drivers/block/paride/frpw.c Linus Torvalds 2005-04-16  206          pi->saved_r2 = r2();
^1da177e4c3f41 drivers/block/paride/frpw.c Linus Torvalds 2005-04-16  207  	
^1da177e4c3f41 drivers/block/paride/frpw.c Linus Torvalds 2005-04-16  208  	w2(4); w0(4); w2(6); w2(7);
^1da177e4c3f41 drivers/block/paride/frpw.c Linus Torvalds 2005-04-16  209  	a = r1() & 0xff; w2(4); b = r1() & 0xff;
^1da177e4c3f41 drivers/block/paride/frpw.c Linus Torvalds 2005-04-16 @210  	w2(0xc); w2(0xe); w2(4);
^1da177e4c3f41 drivers/block/paride/frpw.c Linus Torvalds 2005-04-16  211  
^1da177e4c3f41 drivers/block/paride/frpw.c Linus Torvalds 2005-04-16  212  	pi->delay = olddelay;
^1da177e4c3f41 drivers/block/paride/frpw.c Linus Torvalds 2005-04-16  213          w0(pi->saved_r0);
^1da177e4c3f41 drivers/block/paride/frpw.c Linus Torvalds 2005-04-16  214          w2(pi->saved_r2);
^1da177e4c3f41 drivers/block/paride/frpw.c Linus Torvalds 2005-04-16  215  
^1da177e4c3f41 drivers/block/paride/frpw.c Linus Torvalds 2005-04-16  216  	return ((~a&0x40) && (b&0x40));
^1da177e4c3f41 drivers/block/paride/frpw.c Linus Torvalds 2005-04-16  217  } 
^1da177e4c3f41 drivers/block/paride/frpw.c Linus Torvalds 2005-04-16  218  

:::::: The code at line 210 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
