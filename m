Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51E8911734
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 12:06:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C3Gkh6zs"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697630803; x=1729166803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yeDGfz4lcCOb/Nikv2PcJaaz9H8UufKrbiQBHDekZlc=;
  b=C3Gkh6zsWntqum9UJqq5KELnME5w1ZraRslDmFc0HeoWxIxDvmmV+yI6
   IliBXcy3WEn19/zf+6orSppxd3+5k1O5sqbJ94Ldi3bTcKydC4/RmYq0E
   PwB5nhzbmMPSM3ugqVvFUm0AdL6DaOyb+fZg8fmLSGwCu1O9ycJWOzGXF
   0O64NldCTOZGu+f+AS+cNRN/B0+olZd6od66rYV1tjWiOYlNyjfoG299m
   +NTSI1wfHMBvYPlSJFTXrGqkRdN9MC3X0RXSMhWWEG+6mIPOiEiO2/NmX
   w44WynTY9tsltOc1nRaQC67w9By8qZwrWTX0rX9Gld6rAzehiagyT+Ehn
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="366256682"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="366256682"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 05:06:42 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="750070633"
X-IronPort-AV: E=Sophos;i="6.03,235,1694761200"; 
   d="scan'208";a="750070633"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 18 Oct 2023 05:06:40 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt5Jt-0000K5-2R;
	Wed, 18 Oct 2023 12:06:37 +0000
Date: Wed, 18 Oct 2023 20:06:07 +0800
From: kernel test robot <lkp@intel.com>
To: Rob Herring <robh@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>
Subject: arch/m68k/include/asm/raw_io.h:91:13: warning: array subscript 0 is
 outside array bounds of 'volatile u16[0]' {aka 'volatile short unsigned
 int[]'}
Message-ID: <202310181943.y4q7XNsm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Rob,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   06dc10eae55b5ceabfef287a7e5f16ceea204aa0
commit: f1a43aadb5a690e141a3b6700e2a40c1d4dbe088 watchdog: Enable COMPILE_TEST for more drivers
date:   9 weeks ago
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20231018/202310181943.y4q7XNsm-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310181943.y4q7XNsm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181943.y4q7XNsm-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/io_mm.h:25,
                    from arch/m68k/include/asm/io.h:8,
                    from include/linux/io.h:13,
                    from drivers/watchdog/machzwd.c:39:
   In function 'zf_set_timer',
       inlined from 'zf_timer_on' at drivers/watchdog/machzwd.c:218:2:
>> arch/m68k/include/asm/raw_io.h:91:13: warning: array subscript 0 is outside array bounds of 'volatile u16[0]' {aka 'volatile short unsigned int[]'} [-Warray-bounds=]
      91 |         __w = ((*(__force volatile u16 *) ((_addr & 0xFFFF0000UL) + ((__v >> 8)<<1)))); \
         |         ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:228:20: note: in expansion of macro 'rom_out_le16'
     228 |                  : rom_out_le16(isa_itw(port), (val)))
         |                    ^~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:356:42: note: in expansion of macro 'isa_rom_outw'
     356 | #define outw(val, port) ((port) < 1024 ? isa_rom_outw((val), (port)) : out_le16((port), (val)))
         |                                          ^~~~~~~~~~~~
   drivers/watchdog/machzwd.c:74:53: note: in expansion of macro 'outw'
      74 | #define zf_writew(port, data)  { outb(port, INDEX); outw(data, DATA_W); }
         |                                                     ^~~~
   drivers/watchdog/machzwd.c:173:17: note: in expansion of macro 'zf_writew'
     173 |                 zf_writew(COUNTER_1, new);
         |                 ^~~~~~~~~
   In function 'zf_timer_on':
   cc1: note: source object is likely at address zero
   In function 'zf_set_timer',
       inlined from 'zf_timer_on' at drivers/watchdog/machzwd.c:218:2:
   arch/m68k/include/asm/raw_io.h:87:13: warning: array subscript 0 is outside array bounds of 'volatile u16[0]' {aka 'volatile short unsigned int[]'} [-Warray-bounds=]
      87 |         __w = ((*(__force volatile u16 *) ((_addr & 0xFFFF0000UL) + ((__v & 0xFF)<<1)))); \
         |         ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:227:20: note: in expansion of macro 'rom_out_be16'
     227 |         (ISA_SEX ? rom_out_be16(isa_itw(port), (val))   \
         |                    ^~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:356:42: note: in expansion of macro 'isa_rom_outw'
     356 | #define outw(val, port) ((port) < 1024 ? isa_rom_outw((val), (port)) : out_le16((port), (val)))
         |                                          ^~~~~~~~~~~~
   drivers/watchdog/machzwd.c:74:53: note: in expansion of macro 'outw'
      74 | #define zf_writew(port, data)  { outb(port, INDEX); outw(data, DATA_W); }
         |                                                     ^~~~
   drivers/watchdog/machzwd.c:173:17: note: in expansion of macro 'zf_writew'
     173 |                 zf_writew(COUNTER_1, new);
         |                 ^~~~~~~~~
   In function 'zf_timer_on':
   cc1: note: source object is likely at address zero


vim +91 arch/m68k/include/asm/raw_io.h

^1da177e4c3f41 include/asm-m68k/raw_io.h      Linus Torvalds     2005-04-16  49  
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  50  /*
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  51   * Atari ROM port (cartridge port) ISA adapter, used for the EtherNEC NE2000
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  52   * network card driver.
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  53   * The ISA adapter connects address lines A9-A13 to ISA address lines A0-A4,
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  54   * and hardwires the rest of the ISA addresses for a base address of 0x300.
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  55   *
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  56   * Data lines D8-D15 are connected to ISA data lines D0-D7 for reading.
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  57   * For writes, address lines A1-A8 are latched to ISA data lines D0-D7
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  58   * (meaning the bit pattern on A1-A8 can be read back as byte).
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  59   *
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  60   * Read and write operations are distinguished by the base address used:
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  61   * reads are from the ROM A side range, writes are through the B side range
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  62   * addresses (A side base + 0x10000).
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  63   *
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  64   * Reads and writes are byte only.
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  65   *
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  66   * 16 bit reads and writes are necessary for the NetUSBee adapter's USB
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  67   * chipset - 16 bit words are read straight off the ROM port while 16 bit
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  68   * reads are split into two byte writes. The low byte is latched to the
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  69   * NetUSBee buffer by a read from the _read_ window (with the data pattern
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  70   * asserted as A1-A8 address pattern). The high byte is then written to the
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  71   * write range as usual, completing the write cycle.
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  72   */
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  73  
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  74  #if defined(CONFIG_ATARI_ROM_ISA)
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  75  #define rom_in_8(addr) \
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  76  	({ u16 __v = (*(__force volatile u16 *) (addr)); __v >>= 8; __v; })
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  77  #define rom_in_be16(addr) \
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  78  	({ u16 __v = (*(__force volatile u16 *) (addr)); __v; })
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  79  #define rom_in_le16(addr) \
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  80  	({ u16 __v = le16_to_cpu(*(__force volatile u16 *) (addr)); __v; })
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  81  
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  82  #define rom_out_8(addr, b)	\
30b5e6ef4a32ea arch/m68k/include/asm/raw_io.h Geert Uytterhoeven 2022-05-20  83  	(void)({u8 __maybe_unused __w, __v = (b);  u32 _addr = ((u32) (addr)); \
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  84  	__w = ((*(__force volatile u8 *)  ((_addr | 0x10000) + (__v<<1)))); })
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  85  #define rom_out_be16(addr, w)	\
30b5e6ef4a32ea arch/m68k/include/asm/raw_io.h Geert Uytterhoeven 2022-05-20  86  	(void)({u16 __maybe_unused __w, __v = (w); u32 _addr = ((u32) (addr)); \
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  87  	__w = ((*(__force volatile u16 *) ((_addr & 0xFFFF0000UL) + ((__v & 0xFF)<<1)))); \
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  88  	__w = ((*(__force volatile u16 *) ((_addr | 0x10000) + ((__v >> 8)<<1)))); })
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  89  #define rom_out_le16(addr, w)	\
30b5e6ef4a32ea arch/m68k/include/asm/raw_io.h Geert Uytterhoeven 2022-05-20  90  	(void)({u16 __maybe_unused __w, __v = (w); u32 _addr = ((u32) (addr)); \
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06 @91  	__w = ((*(__force volatile u16 *) ((_addr & 0xFFFF0000UL) + ((__v >> 8)<<1)))); \
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  92  	__w = ((*(__force volatile u16 *) ((_addr | 0x10000) + ((__v & 0xFF)<<1)))); })
84b16b7b0d5c81 arch/m68k/include/asm/raw_io.h Michael Schmitz    2013-04-06  93  

:::::: The code at line 91 was first introduced by commit
:::::: 84b16b7b0d5c818fadc731a69965dc76dce0c91e m68k/atari: ROM port ISA adapter support

:::::: TO: Michael Schmitz <schmitz@opal.biophys.uni-duesseldorf.de>
:::::: CC: Geert Uytterhoeven <geert@linux-m68k.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
