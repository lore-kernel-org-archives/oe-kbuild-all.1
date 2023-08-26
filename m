Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19CDD29B0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Aug 2023 23:17:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1693091857; x=1724627857;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SSff8gdWlBk4pJs5rRUrlT0G4pG9QEFFVaJMYZBe+hA=;
  b=fLoiA85+TG6vPn6KAV/l/auGqKVY1HZmmBrhIiu6ZSBLdLW7UrShC4DB
   ZgLHymDmmkoCpsWRI1eOR5JjTJh6KqigAwA6jcXrOeT15Fv9W/rqz9Nhm
   U2p0YmMBtFPvp+/Wmm8s6t0LJMwg3TnC/PS+Bqo9LTA9C0MRqszv4MZYD
   CQsK1T41DV3EY0sxLX+zmQ0vc1J9NuKR5+qCvHsBAj5B/E1xnXaJDspE7
   3x27BHh+FGR4ytS1GOqk5z4fxCDvI2gJIiwl7wRgZGBSJAKWtnz3JEwP0
   UVALk2zYM91d5M1vSj2RrMxNhCOlTxdW6KH+NXDPu3oShBxqzrmYpbYP7
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="441249798"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="441249798"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Aug 2023 16:17:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10814"; a="767274855"
X-IronPort-AV: E=Sophos;i="6.02,204,1688454000"; 
   d="scan'208";a="767274855"
Received: from lkp-server02.sh.intel.com (HELO daf8bb0a381d) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 26 Aug 2023 16:17:35 -0700
Received: from kbuild by daf8bb0a381d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qa2X8-0005A3-1j;
	Sat, 26 Aug 2023 23:17:34 +0000
Date: Sun, 27 Aug 2023 07:16:38 +0800
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.5-dango-r4_2 11434/11475]
 mtdsplit_fit.c:(.rodata.cst4+0x20): undefined reference to `fdt_path_offset'
Message-ID: <202308270744.3OecPbwg-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.5-dango-r4_2
head:   d6000c552c7d192fdd2d7e21a320c3b269bff5a5
commit: 5d223b90700e4682e6263d8bdedd6c490c2b2e5a [11434/11475] OWRT BUILD: mtd: mtdsplit support
config: parisc-randconfig-r021-20230827 (https://download.01.org/0day-ci/archive/20230827/202308270744.3OecPbwg-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230827/202308270744.3OecPbwg-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308270744.3OecPbwg-lkp@intel.com/

All errors (new ones prefixed by >>):

   hppa-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `.LC20':
>> mtdsplit_fit.c:(.rodata.cst4+0x20): undefined reference to `fdt_path_offset'
   hppa-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `.LC21':
>> mtdsplit_fit.c:(.rodata.cst4+0x24): undefined reference to `fdt_strerror'
   hppa-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `.LC23':
>> mtdsplit_fit.c:(.rodata.cst4+0x28): undefined reference to `fdt_next_node'
   hppa-linux-ld: drivers/mtd/mtdsplit/mtdsplit_fit.o: in function `.LC25':
>> mtdsplit_fit.c:(.rodata.cst4+0x2c): undefined reference to `fdt_getprop'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
