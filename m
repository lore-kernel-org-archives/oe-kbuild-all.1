Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAC0A2E646
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 Aug 2024 09:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1723368259; cv=none; b=jOgblLDd8oSezFC0ye1RHHHreftraHxxYA+TsWQyfr/pf4mJ92QrVkbG7LKJIROqp6AgTo9CjbTI7lPaVyUQcqMZBcgjbl7IUTb4dlVURKvdwJcgl98MO4mzzZSyPapt3jMiuJJr3lkzqt4fnv2d2xGy1aWO1fIGtJACkW5b3aE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1723368259; c=relaxed/simple;
	bh=IftasLfMYFVzoKpSiNIB89U3qIUsStW56ga/+8RavmE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fAx2Z34kArXfPlSbvns/T41E9pmLoI2SKqUDppc9rOBDgVLAjn0y1HnEkFY9L9vvPENez70mFsCEUhv0w6FHOS7lZYJKWA+HfhBsn9H8eKuvY0C6ddxCtRXuV3s4afKpBqfiWlovkPbbMfEOPsdc+u14R28jAgNda3TniA0/ztQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sm54xQBb; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sm54xQBb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1723368258; x=1754904258;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IftasLfMYFVzoKpSiNIB89U3qIUsStW56ga/+8RavmE=;
  b=Sm54xQBbWN8jHuMrcBsqHqZJTYXFHUD8d/5T1wbllWg9ACySUEbOz8uw
   iGTJ5CO5D/gxZrd4WL3D7NQY6/Od/vs2g8wGv7ybGROMCwFZvzrpdhqbk
   sLzL6Q7VCyRoPAEkr9hZ82DibpYo1mbtGx8TgxQKbWMeKXrQ0rukKmMqb
   sLGBAJvcvIWZDv/x6LI7mmzxfwTItoRjmueqzV0G/G+CINVkbVzlaVa0+
   M90ysQhQGua4WEb1hmlEXLrS2zsC5Js6hsy4kBdf+nSABiyKMgloHQfAa
   H7dZjaraXAOkH8rH0zbyqt4F24rVr9HKbo56PWFyt8WF4DKsq218i+aNR
   g==;
X-CSE-ConnectionGUID: Kt4cRocBT+u22fz214tVSg==
X-CSE-MsgGUID: 9s+ik/BPQjSAWWNpMWXCag==
X-IronPort-AV: E=McAfee;i="6700,10204,11160"; a="39000822"
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="39000822"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Aug 2024 02:24:16 -0700
X-CSE-ConnectionGUID: dFrHOQ5cTH2szNePL67ezg==
X-CSE-MsgGUID: INhGgH6lSa66j0mQoWzWFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,281,1716274800"; 
   d="scan'208";a="57913936"
Received: from unknown (HELO b6bf6c95bbab) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 11 Aug 2024 02:24:14 -0700
Received: from kbuild by b6bf6c95bbab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sd4o8-000AiJ-0d;
	Sun, 11 Aug 2024 09:24:12 +0000
Date: Sun, 11 Aug 2024 17:23:45 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Masahiro Yamada <masahiroy@kernel.org>, Alex Shi <alexs@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>
Subject: drivers/mtd/maps/solutionengine.c:52:39: error: assignment to 'void
 *' from 'int' makes pointer from integer without a cast
Message-ID: <202408111733.m4vWMDh3-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5189dafa4cf950e675f02ee04b577dfbbad0d9b1
commit: e8c07082a810fbb9db303a2b66b66b8d7e588b53 Kbuild: move to -std=gnu11
date:   2 years, 5 months ago
config: sh-randconfig-001-20240811 (https://download.01.org/0day-ci/archive/20240811/202408111733.m4vWMDh3-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240811/202408111733.m4vWMDh3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408111733.m4vWMDh3-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/mtd/maps/solutionengine.c: In function 'init_soleng_maps':
>> drivers/mtd/maps/solutionengine.c:52:39: error: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      52 |                 soleng_flash_map.virt = P2SEGADDR(0x01000000);
         |                                       ^
   drivers/mtd/maps/solutionengine.c:54:39: error: assignment to 'void *' from 'int' makes pointer from integer without a cast [-Wint-conversion]
      54 |                 soleng_eprom_map.virt = P1SEGADDR(0);
         |                                       ^


vim +52 drivers/mtd/maps/solutionengine.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  35  
^1da177e4c3f41 Linus Torvalds 2005-04-16  36  static int __init init_soleng_maps(void)
^1da177e4c3f41 Linus Torvalds 2005-04-16  37  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  38  	/* First probe at offset 0 */
^1da177e4c3f41 Linus Torvalds 2005-04-16  39  	soleng_flash_map.phys = 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  40  	soleng_flash_map.virt = (void __iomem *)P2SEGADDR(0);
^1da177e4c3f41 Linus Torvalds 2005-04-16  41  	soleng_eprom_map.phys = 0x01000000;
^1da177e4c3f41 Linus Torvalds 2005-04-16  42  	soleng_eprom_map.virt = (void __iomem *)P1SEGADDR(0x01000000);
^1da177e4c3f41 Linus Torvalds 2005-04-16  43  	simple_map_init(&soleng_eprom_map);
^1da177e4c3f41 Linus Torvalds 2005-04-16  44  	simple_map_init(&soleng_flash_map);
^1da177e4c3f41 Linus Torvalds 2005-04-16  45  
^1da177e4c3f41 Linus Torvalds 2005-04-16  46  	printk(KERN_NOTICE "Probing for flash chips at 0x00000000:\n");
^1da177e4c3f41 Linus Torvalds 2005-04-16  47  	flash_mtd = do_map_probe("cfi_probe", &soleng_flash_map);
^1da177e4c3f41 Linus Torvalds 2005-04-16  48  	if (!flash_mtd) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  49  		/* Not there. Try swapping */
^1da177e4c3f41 Linus Torvalds 2005-04-16  50  		printk(KERN_NOTICE "Probing for flash chips at 0x01000000:\n");
^1da177e4c3f41 Linus Torvalds 2005-04-16  51  		soleng_flash_map.phys = 0x01000000;
^1da177e4c3f41 Linus Torvalds 2005-04-16 @52  		soleng_flash_map.virt = P2SEGADDR(0x01000000);
^1da177e4c3f41 Linus Torvalds 2005-04-16  53  		soleng_eprom_map.phys = 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  54  		soleng_eprom_map.virt = P1SEGADDR(0);
^1da177e4c3f41 Linus Torvalds 2005-04-16  55  		flash_mtd = do_map_probe("cfi_probe", &soleng_flash_map);
^1da177e4c3f41 Linus Torvalds 2005-04-16  56  		if (!flash_mtd) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  57  			/* Eep. */
^1da177e4c3f41 Linus Torvalds 2005-04-16  58  			printk(KERN_NOTICE "Flash chips not detected at either possible location.\n");
^1da177e4c3f41 Linus Torvalds 2005-04-16  59  			return -ENXIO;
^1da177e4c3f41 Linus Torvalds 2005-04-16  60  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  61  	}
1d25e3eeed1d98 Randy Dunlap   2018-07-24  62  	printk(KERN_NOTICE "Solution Engine: Flash at 0x%pap, EPROM at 0x%pap\n",
1d25e3eeed1d98 Randy Dunlap   2018-07-24  63  	       &soleng_flash_map.phys,
1d25e3eeed1d98 Randy Dunlap   2018-07-24  64  	       &soleng_eprom_map.phys);
^1da177e4c3f41 Linus Torvalds 2005-04-16  65  	flash_mtd->owner = THIS_MODULE;
^1da177e4c3f41 Linus Torvalds 2005-04-16  66  
^1da177e4c3f41 Linus Torvalds 2005-04-16  67  	eprom_mtd = do_map_probe("map_rom", &soleng_eprom_map);
^1da177e4c3f41 Linus Torvalds 2005-04-16  68  	if (eprom_mtd) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  69  		eprom_mtd->owner = THIS_MODULE;
ee0e87b174bb41 Jamie Iles     2011-05-23  70  		mtd_device_register(eprom_mtd, NULL, 0);
^1da177e4c3f41 Linus Torvalds 2005-04-16  71  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  72  
390e9eacf1dcec Paul Bolle     2014-05-23  73  	mtd_device_parse_register(flash_mtd, probes, NULL, NULL, 0);
^1da177e4c3f41 Linus Torvalds 2005-04-16  74  
^1da177e4c3f41 Linus Torvalds 2005-04-16  75  	return 0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  76  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  77  

:::::: The code at line 52 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
