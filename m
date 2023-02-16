Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B326C7B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Feb 2023 19:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676574641; x=1708110641;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RGKYUNkDTk1wea9jrx0N4PH6btEXaXpUU2zwiwt010E=;
  b=azd7Rt0Fx1QgDTMxaaFUdZ1xKSHBK4TroVHd4f/Tu+IikDxY8JxWGRIx
   4t2eUID2Qs2HNxhfhOSgzzfpK+snRTfr+zOjo7K4eir1dpfXBKt8US/dn
   nSHsK820PUaDiy773L9QlsKI9jIRU2Y3f5HF5KT3oJDqJK56HLAdcuujJ
   gq4/KvPhFzMtq8GTGSDvG3QejJr5Zt/BjelWO6HVoM/IVVz7+3xr5DtGv
   3OvfA0qJHl4YUbg2x+i86Tc1El+ED3YRdeMdMOdbfTkCSbT8TYCogE0g/
   c/bApPxDbh3DDKoZW+yluoX+ATsJK9qPidpJHM94bmLTx372250bBvllM
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="331812014"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="331812014"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Feb 2023 11:10:36 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10623"; a="734022100"
X-IronPort-AV: E=Sophos;i="5.97,302,1669104000"; 
   d="scan'208";a="734022100"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 16 Feb 2023 11:10:35 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pSjeM-000ASC-2m;
	Thu, 16 Feb 2023 19:10:34 +0000
Date: Fri, 17 Feb 2023 03:09:38 +0800
From: kernel test robot <lkp@intel.com>
To: Matt Evans <mev@rivosinc.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Arnd Bergmann <arnd@arndb.de>
Subject: [linux-next:master 9401/13217]
 include/asm-generic/cmpxchg-local.h:29:33: sparse: sparse: cast truncates
 bits from constant value (aaa31337 becomes 37)
Message-ID: <202302170355.Ljqlzucu-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   509583475828c4fd86897113f78315c1431edcc3
commit: 6246541522845a443b7ae4a8f0e16facc5a91198 [9401/13217] locking/atomic: cmpxchg: Make __generic_cmpxchg_local compare against zero-extended 'old' value
config: nios2-randconfig-s032-20230212 (https://download.01.org/0day-ci/archive/20230217/202302170355.Ljqlzucu-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=6246541522845a443b7ae4a8f0e16facc5a91198
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 6246541522845a443b7ae4a8f0e16facc5a91198
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=nios2 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302170355.Ljqlzucu-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   lib/atomic64_test.c: note: in included file (through arch/nios2/include/generated/asm/cmpxchg.h, include/asm-generic/atomic.h, arch/nios2/include/generated/asm/atomic.h, ...):
   include/asm-generic/cmpxchg.h:35:39: sparse: sparse: cast truncates bits from constant value (deadbeef becomes ef)
   include/asm-generic/cmpxchg.h:46:40: sparse: sparse: cast truncates bits from constant value (deadbeef becomes beef)
   include/asm-generic/cmpxchg.h:35:39: sparse: sparse: cast truncates bits from constant value (deadbeef becomes ef)
   include/asm-generic/cmpxchg.h:46:40: sparse: sparse: cast truncates bits from constant value (deadbeef becomes beef)
   include/asm-generic/cmpxchg.h:35:39: sparse: sparse: cast truncates bits from constant value (deadbeef becomes ef)
   include/asm-generic/cmpxchg.h:46:40: sparse: sparse: cast truncates bits from constant value (deadbeef becomes beef)
   include/asm-generic/cmpxchg.h:35:39: sparse: sparse: cast truncates bits from constant value (deadbeef becomes ef)
   include/asm-generic/cmpxchg.h:46:40: sparse: sparse: cast truncates bits from constant value (deadbeef becomes beef)
   lib/atomic64_test.c: note: in included file (through include/asm-generic/cmpxchg.h, arch/nios2/include/generated/asm/cmpxchg.h, include/asm-generic/atomic.h, ...):
>> include/asm-generic/cmpxchg-local.h:29:33: sparse: sparse: cast truncates bits from constant value (aaa31337 becomes 37)
   include/asm-generic/cmpxchg-local.h:30:42: sparse: sparse: cast truncates bits from constant value (deadbeef becomes ef)
   include/asm-generic/cmpxchg-local.h:33:34: sparse: sparse: cast truncates bits from constant value (aaa31337 becomes 1337)
   include/asm-generic/cmpxchg-local.h:34:44: sparse: sparse: cast truncates bits from constant value (deadbeef becomes beef)
>> include/asm-generic/cmpxchg-local.h:29:33: sparse: sparse: cast truncates bits from constant value (aaa31337 becomes 37)
   include/asm-generic/cmpxchg-local.h:30:42: sparse: sparse: cast truncates bits from constant value (deadbeef becomes ef)
   include/asm-generic/cmpxchg-local.h:33:34: sparse: sparse: cast truncates bits from constant value (aaa31337 becomes 1337)
   include/asm-generic/cmpxchg-local.h:34:44: sparse: sparse: cast truncates bits from constant value (deadbeef becomes beef)
>> include/asm-generic/cmpxchg-local.h:29:33: sparse: sparse: cast truncates bits from constant value (aaa31337 becomes 37)
   include/asm-generic/cmpxchg-local.h:30:42: sparse: sparse: cast truncates bits from constant value (deadbeef becomes ef)
   include/asm-generic/cmpxchg-local.h:33:34: sparse: sparse: cast truncates bits from constant value (aaa31337 becomes 1337)
   include/asm-generic/cmpxchg-local.h:34:44: sparse: sparse: cast truncates bits from constant value (deadbeef becomes beef)
>> include/asm-generic/cmpxchg-local.h:29:33: sparse: sparse: cast truncates bits from constant value (aaa31337 becomes 37)
   include/asm-generic/cmpxchg-local.h:30:42: sparse: sparse: cast truncates bits from constant value (deadbeef becomes ef)
   include/asm-generic/cmpxchg-local.h:33:34: sparse: sparse: cast truncates bits from constant value (aaa31337 becomes 1337)
   include/asm-generic/cmpxchg-local.h:34:44: sparse: sparse: cast truncates bits from constant value (deadbeef becomes beef)
>> include/asm-generic/cmpxchg-local.h:29:33: sparse: sparse: cast truncates bits from constant value (11112222 becomes 22)
   include/asm-generic/cmpxchg-local.h:30:42: sparse: sparse: cast truncates bits from constant value (deadbeef becomes ef)
   include/asm-generic/cmpxchg-local.h:33:34: sparse: sparse: cast truncates bits from constant value (11112222 becomes 2222)
   include/asm-generic/cmpxchg-local.h:34:44: sparse: sparse: cast truncates bits from constant value (deadbeef becomes beef)
>> include/asm-generic/cmpxchg-local.h:29:33: sparse: sparse: cast truncates bits from constant value (11112222 becomes 22)
   include/asm-generic/cmpxchg-local.h:30:42: sparse: sparse: cast truncates bits from constant value (deadbeef becomes ef)
   include/asm-generic/cmpxchg-local.h:33:34: sparse: sparse: cast truncates bits from constant value (11112222 becomes 2222)
   include/asm-generic/cmpxchg-local.h:34:44: sparse: sparse: cast truncates bits from constant value (deadbeef becomes beef)
>> include/asm-generic/cmpxchg-local.h:29:33: sparse: sparse: cast truncates bits from constant value (11112222 becomes 22)
   include/asm-generic/cmpxchg-local.h:30:42: sparse: sparse: cast truncates bits from constant value (deadbeef becomes ef)
   include/asm-generic/cmpxchg-local.h:33:34: sparse: sparse: cast truncates bits from constant value (11112222 becomes 2222)
   include/asm-generic/cmpxchg-local.h:34:44: sparse: sparse: cast truncates bits from constant value (deadbeef becomes beef)
>> include/asm-generic/cmpxchg-local.h:29:33: sparse: sparse: cast truncates bits from constant value (11112222 becomes 22)
   include/asm-generic/cmpxchg-local.h:30:42: sparse: sparse: cast truncates bits from constant value (deadbeef becomes ef)
   include/asm-generic/cmpxchg-local.h:33:34: sparse: sparse: cast truncates bits from constant value (11112222 becomes 2222)
   include/asm-generic/cmpxchg-local.h:34:44: sparse: sparse: cast truncates bits from constant value (deadbeef becomes beef)

vim +29 include/asm-generic/cmpxchg-local.h

     7	
     8	extern unsigned long wrong_size_cmpxchg(volatile void *ptr)
     9		__noreturn;
    10	
    11	/*
    12	 * Generic version of __cmpxchg_local (disables interrupts). Takes an unsigned
    13	 * long parameter, supporting various types of architectures.
    14	 */
    15	static inline unsigned long __generic_cmpxchg_local(volatile void *ptr,
    16			unsigned long old, unsigned long new, int size)
    17	{
    18		unsigned long flags, prev;
    19	
    20		/*
    21		 * Sanity checking, compile-time.
    22		 */
    23		if (size == 8 && sizeof(unsigned long) != 8)
    24			wrong_size_cmpxchg(ptr);
    25	
    26		raw_local_irq_save(flags);
    27		switch (size) {
    28		case 1: prev = *(u8 *)ptr;
  > 29			if (prev == (u8)old)
    30				*(u8 *)ptr = (u8)new;
    31			break;
    32		case 2: prev = *(u16 *)ptr;
    33			if (prev == (u16)old)
    34				*(u16 *)ptr = (u16)new;
    35			break;
    36		case 4: prev = *(u32 *)ptr;
    37			if (prev == (u32)old)
    38				*(u32 *)ptr = (u32)new;
    39			break;
    40		case 8: prev = *(u64 *)ptr;
    41			if (prev == old)
    42				*(u64 *)ptr = (u64)new;
    43			break;
    44		default:
    45			wrong_size_cmpxchg(ptr);
    46		}
    47		raw_local_irq_restore(flags);
    48		return prev;
    49	}
    50	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
