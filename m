Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 338BF2F5A31
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 14:16:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760105811; cv=none; b=VSrff/8QjCiP5lYKioyNcE0+GQ2NwuJUDDrIAKqvGG36oIHT6U3EODmlFlSSYrcGvT4M3bYTgdAz5CPL+u8kDdwEuLcG7ZbmeS4kdXOkUWR/A076p/jn8h+YxCbiO99gilFu84RqWgYhfzLkM5IGVtNMMiP1K4iW/jc9i/QKsDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760105811; c=relaxed/simple;
	bh=4j3b6sR3WF8p/5SZXbt6/uOacOPJd8Du+0txIYOW1sc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mwYFxw00TJjWMwT0D8ElcG8U2pasS1LbF0rqTGwdBZwu0XrbQw6Mh80uDUOpwXCRUpmRh0gZLT8r4Xib4rAjq56N5q1dslttygO6l7r3IEUlZLJZHEJmWUS79zpyym0h6cMALe35NQ+N0NYzSQrPOkqHfeQPil31+Xqgm6Mz3KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PCqv4C1y; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PCqv4C1y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760105809; x=1791641809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4j3b6sR3WF8p/5SZXbt6/uOacOPJd8Du+0txIYOW1sc=;
  b=PCqv4C1yh4H9lWQVozKCnfxzKS69zPNbZPASdIa4sOj9jdL3PcrnpoTZ
   NN4as0jEUUUIo/9sLB++AkHkvHjlBQY2qM3qIHxRuLUznPlrCkPuu40t5
   WlszUJ4sJ4hMIqqduQHZi2zWLyStntjad3uCC6rx7gXNBthZvLpljvt/Q
   v8HVkCGHPBK+aIwIYSuGvYXzpXHPZWB9ZdFcINe+0kYU1Qc/16el0SYqo
   aUdrgtpugaLaOaElH8SMZeOxtTlLfcM+AlCQV2kaU5h2UcmUewU2TEd+V
   4env4ERNPc+tsrIyBaJdUI8YTHrTMuUu0LAFP7ogog9CMTJY5S0kzYWWL
   g==;
X-CSE-ConnectionGUID: 81gief4pS2GV66JUMxjxGA==
X-CSE-MsgGUID: GAM2BgwjTCq5154P/0UsnQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11578"; a="72582396"
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="72582396"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Oct 2025 07:16:49 -0700
X-CSE-ConnectionGUID: +My+aDVsSje/+2zPZUigaQ==
X-CSE-MsgGUID: AYmvSDOPS8CAIdD1eUe8Ow==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,219,1754982000"; 
   d="scan'208";a="186122751"
Received: from lkp-server01.sh.intel.com (HELO 6a630e8620ab) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 10 Oct 2025 07:16:46 -0700
Received: from kbuild by 6a630e8620ab with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v7DvJ-0002qX-0P;
	Fri, 10 Oct 2025 14:16:45 +0000
Date: Fri, 10 Oct 2025 22:16:32 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Eric Biggers <ebiggers@kernel.org>
Subject: [ardb:arm64-fpsimd-on-stack-v3 9/21] lib/crypto/arm/sha512.h:23:9:
 error: expected expression before '}' token
Message-ID: <202510102252.7HOc5nr1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-fpsimd-on-stack-v3
head:   71be4afe99387c1cf11cd30255a1e8d079a4674b
commit: aaa39bbb261fa974ebb5de66fe32d038ae7a6cc1 [9/21] lib/crypto: Switch ARM and arm64 to 'ksimd' scoped guard API
config: arm-randconfig-002-20251010 (https://download.01.org/0day-ci/archive/20251010/202510102252.7HOc5nr1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251010/202510102252.7HOc5nr1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510102252.7HOc5nr1-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/irqflags.h:17,
                    from arch/arm/include/asm/bitops.h:28,
                    from include/linux/bitops.h:67,
                    from include/linux/kernel.h:23,
                    from lib/crypto/sha512.c:14:
   lib/crypto/arm/sha512.h: In function 'sha512_blocks':
>> include/linux/cleanup.h:420:9: error: expected expression before 'for'
     420 |         for (CLASS(_name, scope)(args);                                 \
         |         ^~~
   include/linux/cleanup.h:429:9: note: in expansion of macro '__scoped_guard'
     429 |         __scoped_guard(_name, __UNIQUE_ID(label), args)
         |         ^~~~~~~~~~~~~~
   arch/arm/include/asm/simd.h:20:25: note: in expansion of macro 'scoped_guard'
      20 | #define scoped_ksimd()  scoped_guard(ksimd)
         |                         ^~~~~~~~~~~~
   lib/crypto/arm/sha512.h:21:17: note: in expansion of macro 'scoped_ksimd'
      21 |                 scoped_ksimd()
         |                 ^~~~~~~~~~~~
   In file included from lib/crypto/sha512.c:136:
>> lib/crypto/arm/sha512.h:23:9: error: expected expression before '}' token
      23 |         } else {
         |         ^
   lib/crypto/arm/sha512.h: At top level:
>> lib/crypto/arm/sha512.h:23:11: error: expected identifier or '(' before 'else'
      23 |         } else {
         |           ^~~~
>> lib/crypto/arm/sha512.h:26:1: error: expected identifier or '(' before '}' token
      26 | }
         | ^
   In file included from include/linux/dynamic_debug.h:6,
                    from include/linux/printk.h:621,
                    from include/linux/kernel.h:31:
>> lib/crypto/arm/sha512.h:10:48: warning: 'have_neon' defined but not used [-Wunused-variable]
      10 | static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
         |                                                ^~~~~~~~~
   include/linux/jump_label.h:386:33: note: in definition of macro 'DEFINE_STATIC_KEY_FALSE'
     386 |         struct static_key_false name = STATIC_KEY_FALSE_INIT
         |                                 ^~~~


vim +23 lib/crypto/arm/sha512.h

24c91b62ac50a7 Eric Biggers   2025-06-30   9  
24c91b62ac50a7 Eric Biggers   2025-06-30 @10  static __ro_after_init DEFINE_STATIC_KEY_FALSE(have_neon);
24c91b62ac50a7 Eric Biggers   2025-06-30  11  
24c91b62ac50a7 Eric Biggers   2025-06-30  12  asmlinkage void sha512_block_data_order(struct sha512_block_state *state,
24c91b62ac50a7 Eric Biggers   2025-06-30  13  					const u8 *data, size_t nblocks);
24c91b62ac50a7 Eric Biggers   2025-06-30  14  asmlinkage void sha512_block_data_order_neon(struct sha512_block_state *state,
24c91b62ac50a7 Eric Biggers   2025-06-30  15  					     const u8 *data, size_t nblocks);
24c91b62ac50a7 Eric Biggers   2025-06-30  16  
24c91b62ac50a7 Eric Biggers   2025-06-30  17  static void sha512_blocks(struct sha512_block_state *state,
24c91b62ac50a7 Eric Biggers   2025-06-30  18  			  const u8 *data, size_t nblocks)
24c91b62ac50a7 Eric Biggers   2025-06-30  19  {
24c91b62ac50a7 Eric Biggers   2025-06-30  20  	if (IS_ENABLED(CONFIG_KERNEL_MODE_NEON) &&
aaa39bbb261fa9 Ard Biesheuvel 2025-10-01  21  		scoped_ksimd()
24c91b62ac50a7 Eric Biggers   2025-06-30  22  			sha512_block_data_order_neon(state, data, nblocks);
24c91b62ac50a7 Eric Biggers   2025-06-30 @23  	} else {
24c91b62ac50a7 Eric Biggers   2025-06-30  24  		sha512_block_data_order(state, data, nblocks);
24c91b62ac50a7 Eric Biggers   2025-06-30  25  	}
24c91b62ac50a7 Eric Biggers   2025-06-30 @26  }
24c91b62ac50a7 Eric Biggers   2025-06-30  27  

:::::: The code at line 23 was first introduced by commit
:::::: 24c91b62ac50a798ceabb3482efbca3e0e88a2db lib/crypto: arm/sha512: Migrate optimized SHA-512 code to library

:::::: TO: Eric Biggers <ebiggers@kernel.org>
:::::: CC: Eric Biggers <ebiggers@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
