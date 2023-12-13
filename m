Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 25653A50
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Dec 2023 01:30:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K0tboib7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702431021; x=1733967021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9V5n5m0AkbHvc52poCIlgEw0xdvZ/ofLprhPyc3Namc=;
  b=K0tboib788/7Afj27H2Rt9vtsgkZ7RVQa1zikurAMpAnPWWQRGPPe1oa
   DIwMnnh6cfsp1maQZ4n48ltBuso4xj7MJJnrXFud4KhvOBAfl+zVcpZHS
   AWw0Ohn+pTY5LWzwEyp5saKWXuIgNaVaWOPWBIHsetJmNAHQIfJGwIj+h
   2b48I65UCpIcavxEn8P24bQsWXRvWV92Fju91g5uYEjG/fNBc5vLUQogr
   w21Lmhx0FRWogeBIJWp3l4Pis304FHmqjM/vwDC30fKDJ9bl5YXNu1tN5
   +hb7QNShG54YXyYlbq5dwLtbyPzDPqbhVWsEgnr2A20yBq5X1PXSKT/8k
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="461372776"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="461372776"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2023 17:30:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10922"; a="839660883"
X-IronPort-AV: E=Sophos;i="6.04,271,1695711600"; 
   d="scan'208";a="839660883"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga008.fm.intel.com with ESMTP; 12 Dec 2023 17:30:18 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rDE4l-000JxN-1Q;
	Wed, 13 Dec 2023 01:30:15 +0000
Date: Wed, 13 Dec 2023 09:30:14 +0800
From: kernel test robot <lkp@intel.com>
To: Ondrej Zary <linux@zary.sk>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Damien Le Moal <damien.lemoal@opensource.wdc.com>
Subject: drivers/ata/pata_parport/epia.c:183:59: sparse: sparse: cast to
 restricted __le16
Message-ID: <202312130944.gYLxl3HH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   cf52eed70e555e864120cfaf280e979e2a035c66
commit: 72f2b0b2185099dce354c805009f591dda3ab73d drivers/block: Move PARIDE protocol modules to drivers/ata/pata_parport
date:   11 months ago
config: m68k-randconfig-r133-20231213 (https://download.01.org/0day-ci/archive/20231213/202312130944.gYLxl3HH-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20231213/202312130944.gYLxl3HH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312130944.gYLxl3HH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/ata/pata_parport/epia.c:183:59: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/epia.c:183:59: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/epia.c:183:59: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/epia.c:183:59: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/epia.c: note: in included file (through arch/m68k/include/asm/io.h):
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   drivers/ata/pata_parport/epia.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:246:46: sparse: sparse: self-comparison always evaluates to false
   drivers/ata/pata_parport/epia.c: note: in included file (through arch/m68k/include/asm/io.h):
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/ata/pata_parport/dstr.c:145:59: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/dstr.c:145:59: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/dstr.c:145:59: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/dstr.c:145:59: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/dstr.c: note: in included file (through arch/m68k/include/asm/io.h):
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   drivers/ata/pata_parport/dstr.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:246:46: sparse: sparse: self-comparison always evaluates to false
   drivers/ata/pata_parport/dstr.c: note: in included file (through arch/m68k/include/asm/io.h):
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/ata/pata_parport/bpck.c:182:59: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/bpck.c:182:59: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/bpck.c:182:59: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/bpck.c:182:59: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/bpck.c: note: in included file (through arch/m68k/include/asm/io.h):
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   drivers/ata/pata_parport/bpck.c:323:72: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/bpck.c:323:72: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/bpck.c:323:72: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/bpck.c:323:72: sparse: sparse: cast to restricted __le16
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   drivers/ata/pata_parport/bpck.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:246:46: sparse: sparse: self-comparison always evaluates to false
   drivers/ata/pata_parport/bpck.c: note: in included file (through arch/m68k/include/asm/io.h):
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/ata/pata_parport/kbic.c:58:21: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/kbic.c:58:21: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/kbic.c:58:21: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/kbic.c:58:21: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:156:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:156:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:156:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:156:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:156:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:156:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:156:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:156:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:157:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:157:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:157:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:157:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:157:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:157:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:157:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:157:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:159:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:159:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:159:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:159:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:159:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:159:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:159:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:159:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:160:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:160:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:160:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:160:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:160:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:160:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:160:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:160:48: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:179:59: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:179:59: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:179:59: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c:179:59: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/kbic.c: note: in included file (through arch/m68k/include/asm/io.h):
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   drivers/ata/pata_parport/kbic.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:246:46: sparse: sparse: self-comparison always evaluates to false
   drivers/ata/pata_parport/kbic.c: note: in included file (through arch/m68k/include/asm/io.h):
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
--
>> drivers/ata/pata_parport/frpw.c:115:63: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/frpw.c:115:63: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/frpw.c:115:63: sparse: sparse: cast to restricted __le16
>> drivers/ata/pata_parport/frpw.c:115:63: sparse: sparse: cast to restricted __le16
   drivers/ata/pata_parport/frpw.c: note: in included file (through arch/m68k/include/asm/io.h):
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   drivers/ata/pata_parport/frpw.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/umh.h, include/linux/kmod.h, ...):
   include/linux/page-flags.h:246:46: sparse: sparse: self-comparison always evaluates to false
   drivers/ata/pata_parport/frpw.c: note: in included file (through arch/m68k/include/asm/io.h):
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer
   arch/m68k/include/asm/io_mm.h:166:21: sparse: sparse: Using plain integer as NULL pointer

vim +183 drivers/ata/pata_parport/epia.c

^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  139  
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  140          switch (pi->mode) {
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  141  
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  142          case 0: w0(0x81); w2(1); w2(3); w0(0xc1);
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  143                  ph = 1;
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  144                  for (k=0;k<count;k++) {
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  145                          w2(2+ph); a = r1();
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  146                          w2(4+ph); b = r1();
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  147                          buf[k] = j44(a,b);
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  148                          ph = 1 - ph;
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  149                  } 
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  150                  w0(0); w2(4);
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  151                  break;
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  152  
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  153          case 1: w0(0x91); w2(1); w0(0x10); w2(3); 
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  154                  w0(0x51); w2(5); w0(0xd1); 
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  155                  ph = 1;
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  156                  for (k=0;k<count;k++) {
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  157                          w2(4+ph);
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  158                          a = r1(); b = r2();
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  159                          buf[k] = j53(a,b);
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  160                          ph = 1 - ph;
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  161                  }
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  162                  w0(0); w2(4);
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  163                  break;
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  164  
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  165          case 2: w0(0x89); w2(1); w2(0x23); w2(0x21); 
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  166                  ph = 1;
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  167                  for (k=0;k<count;k++) {
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  168                          w2(0x24+ph);
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  169                          buf[k] = r0();
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  170                          ph = 1 - ph;
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  171                  }
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  172                  w2(6); w2(4);
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  173                  break;
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  174  
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  175          case 3: if (count > 512) WR(0x84,3);
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  176  		w3(0); w2(0x24);
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  177                  for (k=0;k<count;k++) buf[k] = r4();
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  178                  w2(4); WR(0x84,0);
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  179                  break;
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  180  
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  181          case 4: if (count > 512) WR(0x84,3);
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  182  		w3(0); w2(0x24);
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16 @183  		for (k=0;k<count/2;k++) ((u16 *)buf)[k] = r4w();
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  184                  w2(4); WR(0x84,0);
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  185                  break;
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  186  
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  187          case 5: if (count > 512) WR(0x84,3);
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  188  		w3(0); w2(0x24);
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  189                  for (k=0;k<count/4;k++) ((u32 *)buf)[k] = r4l();
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  190                  w2(4); WR(0x84,0);
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  191                  break;
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  192  
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  193          }
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  194  }
^1da177e4c3f41 drivers/block/paride/epia.c Linus Torvalds 2005-04-16  195  

:::::: The code at line 183 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
