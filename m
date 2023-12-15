Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74FC11118
	for <oe-kbuild-all@lists.linux.dev>; Fri, 15 Dec 2023 03:08:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cXwjd2jo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702609710; x=1734145710;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U9TLe+M11oeqHrVNZaIKZY5r/qpZAPvE+iElMRu31FI=;
  b=cXwjd2jonNIXeGCADSVdun9n6Wgnmwon7Jr5KAuE6GPhsPGlukmtAPJh
   0Z0i//5kWLs+9apj4AVJlm82ENN/T992CkqwqLoyttnFM1gTFbji3ZNUn
   Nggvw3CS2qTPG4OD7rge6RnMi62pEj03GNpKPwOS2QEcYIHmBBIHkm+R3
   PKf409zNWksgi1y+ShPDIYvdrPsuWwwV6yUqD23GvhsXI4+laCjYrnafT
   G9w/xtmJTzFwCkMDSb4loCDu6hMk97kCPX5Wsp45CwpyXjBg18qfqtcEe
   TnkOm2ERPMY9U3GMYhIgVGfQFkbP2o+5/PdDqqOfyO06ws9YTqwFWQyn3
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="461686441"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="461686441"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2023 19:08:28 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10924"; a="897989747"
X-IronPort-AV: E=Sophos;i="6.04,277,1695711600"; 
   d="scan'208";a="897989747"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 14 Dec 2023 19:08:27 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDyYq-000N1c-30;
	Fri, 15 Dec 2023 03:08:24 +0000
Date: Fri, 15 Dec 2023 11:08:02 +0800
From: kernel test robot <lkp@intel.com>
To: Ondrej Zary <linux@zary.sk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: drivers/ata/pata_parport/comm.c:135:59: sparse: sparse: cast to
 restricted __le16
Message-ID: <202312151114.XNGZXP20-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Ondrej,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   976600c6da56c488776c9ee2a5733ae9736e2a75
commit: 72f2b0b2185099dce354c805009f591dda3ab73d drivers/block: Move PARIDE protocol modules to drivers/ata/pata_parport
date:   11 months ago
config: m68k-randconfig-r113-20231215 (https://download.01.org/0day-ci/archive/20231215/202312151114.XNGZXP20-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231215/202312151114.XNGZXP20-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312151114.XNGZXP20-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ata/pata_parport/comm.c:135:59: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/comm.c:135:59: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/comm.c:135:59: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/comm.c:135:59: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/comm.c: note: in included file (through arch/m68k/include/asm/io.h):
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/ata/pata_parport/epat.c:146:62: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/epat.c:146:62: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/epat.c:146:62: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/epat.c:146:62: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/epat.c: note: in included file (through arch/m68k/include/asm/io.h):
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer

vim +135 drivers/ata/pata_parport/comm.c

^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  111  
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  112          switch (pi->mode) {
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  113          
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  114          case 0: w0(0x48); P1;
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  115                  for(i=0;i<count;i++) {
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  116                          w0(0); w2(6); l = r1();
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  117                          w0(0x80); h = r1(); w2(4);
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  118                          buf[i] = j44(l,h);
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  119                  }
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  120                  break;
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  121  
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  122          case 1: w0(0x68); P1; w0(0);
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  123                  for(i=0;i<count;i++) {
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  124                          w2(0x26); buf[i] = r0(); w2(0x24);
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  125                  }
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  126  		w2(4);
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  127  		break;
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  128  		
10e705f83c3e79 drivers/block/paride/comm.c Takashi Iwai   2006-03-24  129  	case 2: w3(0x68); (void)r1(); w2(0x24);
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  130  		for (i=0;i<count;i++) buf[i] = r4();
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  131  		w2(4);
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  132  		break;
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  133  
10e705f83c3e79 drivers/block/paride/comm.c Takashi Iwai   2006-03-24  134          case 3: w3(0x68); (void)r1(); w2(0x24);
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16 @135                  for (i=0;i<count/2;i++) ((u16 *)buf)[i] = r4w();
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  136                  w2(4);
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  137                  break;
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  138  
10e705f83c3e79 drivers/block/paride/comm.c Takashi Iwai   2006-03-24  139          case 4: w3(0x68); (void)r1(); w2(0x24);
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  140                  for (i=0;i<count/4;i++) ((u32 *)buf)[i] = r4l();
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  141                  w2(4);
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  142                  break;
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  143  		
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  144  	}
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  145  }
^1da177e4c3f41 drivers/block/paride/comm.c Linus Torvalds 2005-04-16  146  

:::::: The code at line 135 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
