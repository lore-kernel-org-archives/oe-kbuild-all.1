Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E142186F
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Mar 2023 06:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677825416; x=1709361416;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yBbEulseJrexPnRdW5vWgUoM0mlJ+PXGrASH8nKuNaQ=;
  b=ahu+bBQqiJo89KQju1pDhmqnMu1v5yvSpPpScv4gHIpXh2x83TJJToV1
   IgPcOPxR4lfDDClQJ+B9+F+ktCeGKU5EF59C0vlA5mdZvngmJk7/lRLmL
   tlShlccBaS4qf7YidxqbK4ezThyAt7NeeAm9SRlbRVGcqr6T44Rpxw6VL
   3krW03vkzIPhSwsYBBpE428KVBTmFxsAErSD9Y8K0Hpx1uX7XePyBgNGd
   M5FmpNV5K2vu2JB9I2Mhe5D6l6NCt9yWVCsMa80zgE3Vh7Lm0E0BtpA4g
   2FaLrmQP8K/QCa7s4HzydvlRuhxamflP+oks13BMHLvH2Gxm4y5zvg+jY
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="399778629"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="399778629"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2023 22:36:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10637"; a="707723105"
X-IronPort-AV: E=Sophos;i="5.98,229,1673942400"; 
   d="scan'208";a="707723105"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 02 Mar 2023 22:36:52 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXz2B-0001GA-1V;
	Fri, 03 Mar 2023 06:36:51 +0000
Date: Fri, 3 Mar 2023 14:36:10 +0800
From: kernel test robot <lkp@intel.com>
To: Matthew Wilcox <mawilcox@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: arch/mips/include/asm/vga.h:46:21: sparse: sparse: incorrect type in
 argument 2 (different base types)
Message-ID: <202303031413.o8quncp8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2eb29d59ddf02e39774abfb60b2030b0b7e27c1f
commit: ac036f9570a2d318b7d8dbbdbf0e269d7cc68cef vga: optimise console scrolling
date:   5 years ago
config: mips-randconfig-s033-20230302 (https://download.01.org/0day-ci/archive/20230303/202303031413.o8quncp8-lkp@intel.com/config)
compiler: mipsel-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=ac036f9570a2d318b7d8dbbdbf0e269d7cc68cef
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ac036f9570a2d318b7d8dbbdbf0e269d7cc68cef
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=mips SHELL=/bin/bash drivers/tty/vt/ kernel/trace/ mm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303031413.o8quncp8-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/tty/vt/vt.c: note: in included file (through include/linux/vt_buffer.h, include/linux/selection.h):
>> arch/mips/include/asm/vga.h:46:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   arch/mips/include/asm/vga.h:46:21: sparse:     expected unsigned short [usertype]
   arch/mips/include/asm/vga.h:46:21: sparse:     got restricted __le16 [usertype]
   arch/mips/include/asm/vga.h:41:16: sparse: sparse: cast to restricted __le16
   arch/mips/include/asm/vga.h:41:16: sparse: sparse: cast to restricted __le16
   arch/mips/include/asm/vga.h:41:16: sparse: sparse: cast to restricted __le16
   arch/mips/include/asm/vga.h:41:16: sparse: sparse: cast to restricted __le16
   arch/mips/include/asm/vga.h:36:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   arch/mips/include/asm/vga.h:36:15: sparse:     expected unsigned short volatile [usertype]
   arch/mips/include/asm/vga.h:36:15: sparse:     got restricted __le16 [usertype]
   arch/mips/include/asm/vga.h:41:16: sparse: sparse: cast to restricted __le16
   arch/mips/include/asm/vga.h:36:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   arch/mips/include/asm/vga.h:36:15: sparse:     expected unsigned short volatile [usertype]
   arch/mips/include/asm/vga.h:36:15: sparse:     got restricted __le16 [usertype]
   arch/mips/include/asm/vga.h:41:16: sparse: sparse: cast to restricted __le16
   arch/mips/include/asm/vga.h:36:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   arch/mips/include/asm/vga.h:36:15: sparse:     expected unsigned short volatile [usertype]
   arch/mips/include/asm/vga.h:36:15: sparse:     got restricted __le16 [usertype]
   arch/mips/include/asm/vga.h:36:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   arch/mips/include/asm/vga.h:36:15: sparse:     expected unsigned short volatile [usertype]
   arch/mips/include/asm/vga.h:36:15: sparse:     got restricted __le16 [usertype]
   arch/mips/include/asm/vga.h:41:16: sparse: sparse: cast to restricted __le16
   arch/mips/include/asm/vga.h:36:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   arch/mips/include/asm/vga.h:36:15: sparse:     expected unsigned short volatile [usertype]
   arch/mips/include/asm/vga.h:36:15: sparse:     got restricted __le16 [usertype]
>> arch/mips/include/asm/vga.h:46:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   arch/mips/include/asm/vga.h:46:21: sparse:     expected unsigned short [usertype]
   arch/mips/include/asm/vga.h:46:21: sparse:     got restricted __le16 [usertype]
>> arch/mips/include/asm/vga.h:46:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   arch/mips/include/asm/vga.h:46:21: sparse:     expected unsigned short [usertype]
   arch/mips/include/asm/vga.h:46:21: sparse:     got restricted __le16 [usertype]
   arch/mips/include/asm/vga.h:41:16: sparse: sparse: cast to restricted __le16
   arch/mips/include/asm/vga.h:36:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   arch/mips/include/asm/vga.h:36:15: sparse:     expected unsigned short volatile [usertype]
   arch/mips/include/asm/vga.h:36:15: sparse:     got restricted __le16 [usertype]
   arch/mips/include/asm/vga.h:36:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   arch/mips/include/asm/vga.h:36:15: sparse:     expected unsigned short volatile [usertype]
   arch/mips/include/asm/vga.h:36:15: sparse:     got restricted __le16 [usertype]
   arch/mips/include/asm/vga.h:41:16: sparse: sparse: cast to restricted __le16
   arch/mips/include/asm/vga.h:36:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   arch/mips/include/asm/vga.h:36:15: sparse:     expected unsigned short volatile [usertype]
   arch/mips/include/asm/vga.h:36:15: sparse:     got restricted __le16 [usertype]
>> arch/mips/include/asm/vga.h:46:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   arch/mips/include/asm/vga.h:46:21: sparse:     expected unsigned short [usertype]
   arch/mips/include/asm/vga.h:46:21: sparse:     got restricted __le16 [usertype]
>> arch/mips/include/asm/vga.h:46:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   arch/mips/include/asm/vga.h:46:21: sparse:     expected unsigned short [usertype]
   arch/mips/include/asm/vga.h:46:21: sparse:     got restricted __le16 [usertype]
>> arch/mips/include/asm/vga.h:46:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   arch/mips/include/asm/vga.h:46:21: sparse:     expected unsigned short [usertype]
   arch/mips/include/asm/vga.h:46:21: sparse:     got restricted __le16 [usertype]
>> arch/mips/include/asm/vga.h:46:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   arch/mips/include/asm/vga.h:46:21: sparse:     expected unsigned short [usertype]
   arch/mips/include/asm/vga.h:46:21: sparse:     got restricted __le16 [usertype]
>> arch/mips/include/asm/vga.h:46:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   arch/mips/include/asm/vga.h:46:21: sparse:     expected unsigned short [usertype]
   arch/mips/include/asm/vga.h:46:21: sparse:     got restricted __le16 [usertype]
>> arch/mips/include/asm/vga.h:46:21: sparse: sparse: incorrect type in argument 2 (different base types) @@     expected unsigned short [usertype] @@     got restricted __le16 [usertype] @@
   arch/mips/include/asm/vga.h:46:21: sparse:     expected unsigned short [usertype]
   arch/mips/include/asm/vga.h:46:21: sparse:     got restricted __le16 [usertype]
   arch/mips/include/asm/vga.h:36:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   arch/mips/include/asm/vga.h:36:15: sparse:     expected unsigned short volatile [usertype]
   arch/mips/include/asm/vga.h:36:15: sparse:     got restricted __le16 [usertype]
   arch/mips/include/asm/vga.h:41:16: sparse: sparse: cast to restricted __le16
   arch/mips/include/asm/vga.h:41:16: sparse: sparse: cast to restricted __le16
   arch/mips/include/asm/vga.h:36:15: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned short volatile [usertype] @@     got restricted __le16 [usertype] @@
   arch/mips/include/asm/vga.h:36:15: sparse:     expected unsigned short volatile [usertype]
   arch/mips/include/asm/vga.h:36:15: sparse:     got restricted __le16 [usertype]
   drivers/tty/vt/vt.c: In function 'do_con_trol':
   drivers/tty/vt/vt.c:1780:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
    1780 |                 if (!is_kbd(vc, lnm))
         |                    ^
   drivers/tty/vt/vt.c:1782:9: note: here
    1782 |         case 13:
         |         ^~~~
   drivers/tty/vt/vt.c:1905:20: warning: this statement may fall through [-Wimplicit-fallthrough=]
    1905 |                 if (vc->vc_ques)
         |                    ^
   drivers/tty/vt/vt.c:1907:9: note: here
    1907 |         case ESgetpars:
         |         ^~~~

vim +46 arch/mips/include/asm/vga.h

    43	
    44	static inline void scr_memsetw(u16 *s, u16 v, unsigned int count)
    45	{
  > 46		memset16(s, cpu_to_le16(v), count / 2);
    47	}
    48	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
