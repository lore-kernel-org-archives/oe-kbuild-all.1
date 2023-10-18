Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E962F3987B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 23:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WEPMvPtQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697670636; x=1729206636;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jityMSSDLBeN1aXKSyaOqvTtSeSIvyau31251yf14xM=;
  b=WEPMvPtQnjgFEr4IWb6TcFs8WSNdKEnV2wCz7Gu/SLw85cDqOUmKduWx
   8qFNvuhCVsT6YI3RoiNQaM80m5saAUD+iEfaR8gubw4owCUTgkaG8S7HP
   heVeK5EKzJ0Y8Czi7khsl380NuVPkxjZ7gIDrOonLONhd6bzL5622Uper
   vvIyrjx5YW4KAxO8FRqv473dy1KKmCLCzRoA+aAnlQt7xU2z9jBhjAREz
   dEbwFSRb/TrtvF9g/L9K/faC0YzTWH/SfkjL+Xcl8FICLdZ0gF2hEwIpE
   Xpr2RKJGFYB3TJ/WAzlbiosR467aQdl1LZanzoiQZAWpb12GCFbqC6DDc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="365485282"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="365485282"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 16:10:33 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10867"; a="786125787"
X-IronPort-AV: E=Sophos;i="6.03,236,1694761200"; 
   d="scan'208";a="786125787"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 18 Oct 2023 16:10:32 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtFgM-0001DM-02;
	Wed, 18 Oct 2023 23:10:30 +0000
Date: Thu, 19 Oct 2023 07:09:31 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: [linux-next:master 9303/13299] arch/m68k/include/asm/raw_io.h:20:18:
 warning: array subscript 0 is outside array bounds of 'const volatile u8[0]'
 {aka 'const volatile unsigned char[]'}
Message-ID: <202310190741.mbPtQRpD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2dac75696c6da3c848daa118a729827541c89d33
commit: c7db3832ff19a9a1116c1b3d435c9db165a2f2f8 [9303/13299] m68k: io: Mark mmio read addresses as const
config: m68k-allyesconfig (https://download.01.org/0day-ci/archive/20231019/202310190741.mbPtQRpD-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231019/202310190741.mbPtQRpD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310190741.mbPtQRpD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/m68k/include/asm/io_mm.h:25,
                    from arch/m68k/include/asm/io.h:8,
                    from include/linux/io.h:13,
                    from drivers/hwmon/pc87427.c:31:
   drivers/hwmon/pc87427.c: In function 'pc87427_readall_pwm':
>> arch/m68k/include/asm/raw_io.h:20:18: warning: array subscript 0 is outside array bounds of 'const volatile u8[0]' {aka 'const volatile unsigned char[]'} [-Warray-bounds=]
      20 |     ({ u8 __v = (*(__force const volatile u8 *) (unsigned long)(addr)); __v; })
         |                 ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/m68k/include/asm/io_mm.h:345:62: note: in expansion of macro 'in_8'
     345 | #define inb(port)       ((port) < 1024 ? isa_rom_inb(port) : in_8(port))
         |                                                              ^~~~
   drivers/hwmon/pc87427.c:244:32: note: in expansion of macro 'inb'
     244 |         data->pwm_enable[nr] = inb(iobase + PC87427_REG_PWM_ENABLE);
         |                                ^~~
   cc1: note: source object is likely at address zero


vim +20 arch/m68k/include/asm/raw_io.h

    15	
    16	/* ++roman: The assignments to temp. vars avoid that gcc sometimes generates
    17	 * two accesses to memory, which may be undesirable for some devices.
    18	 */
    19	#define in_8(addr) \
  > 20	    ({ u8 __v = (*(__force const volatile u8 *) (unsigned long)(addr)); __v; })
    21	#define in_be16(addr) \
    22	    ({ u16 __v = (*(__force const volatile u16 *) (unsigned long)(addr)); __v; })
    23	#define in_be32(addr) \
    24	    ({ u32 __v = (*(__force const volatile u32 *) (unsigned long)(addr)); __v; })
    25	#define in_le16(addr) \
    26	    ({ u16 __v = le16_to_cpu(*(__force const volatile __le16 *) (unsigned long)(addr)); __v; })
    27	#define in_le32(addr) \
    28	    ({ u32 __v = le32_to_cpu(*(__force const volatile __le32 *) (unsigned long)(addr)); __v; })
    29	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
