Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9043E33F7
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Feb 2025 21:21:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739827293; cv=none; b=towjWo2hJyknq1lONqVx/86xDYyG3xKGiWaa/YBtPBYr8dn5S/RzMZPC33QnMFGBRx15TNvKmgfQAPHsADuyOERVQdqHNNpJGIq8zlL61TOSx06JWFI+zqmdpOXWXyjYrCP5ie2NhJ9NNtPlSigFXetx2OLoxP1Xm3boMcJgIN0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739827293; c=relaxed/simple;
	bh=kV3rSelLl80Wk6EtGwOrU0xrpEZPXa/UVWoPrNnsWiM=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HD88rbFoj7jwZ5xPUZMjJKbtLu/hPBzkQ4LcHahaPDLz9kz8M/S9p1w8iNgepAeUq8FXWUojz9JAogaTfwrXO8k0tqnPJWMh5eBnqnpBQ1CaYdwz/8z0DK7C1SIhaiP/T3jzUvWzl9ZwC/XPU7MjIysb+8fGGP3op9jK7Z9sKDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=crJ66nv9; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="crJ66nv9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739827291; x=1771363291;
  h=date:from:cc:subject:message-id:mime-version;
  bh=kV3rSelLl80Wk6EtGwOrU0xrpEZPXa/UVWoPrNnsWiM=;
  b=crJ66nv95HonDE2TB+JYxB8oxNbU7O0PkywowWrs25i6NdZ8KSLU2MBL
   84VxaPlwPJ6UWMn5ZJm2jRWL/B2NSzettk8BPl4OYcsLVaEOMsw5k1Pxr
   zgAmupH9zJw34RxWjIsk778vRGHQeBBXJQRAYKJxv29zS7kDPusjZD5fE
   TCGJXwRR+kYObpjnQIKKOIAbfaArY9se5zjPBVvMk9s9ZRdYeOGZr70xl
   ByFi1vIXdH1+538Xn9JCO4OlkBjwlsfciaIf8PsW5yAOl2RCAvQVEjfOn
   J/wCRf63L9LH/tcORvQSNUstoFGvN+9RDGfVnsEICoiW8yRdUQFycocYp
   g==;
X-CSE-ConnectionGUID: dHGTXgJ5TiObRYceu8ploQ==
X-CSE-MsgGUID: MiyXjRF8Qkm5A887O9hiOg==
X-IronPort-AV: E=McAfee;i="6700,10204,11348"; a="40222419"
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="40222419"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Feb 2025 13:21:30 -0800
X-CSE-ConnectionGUID: rqOQM5yeR965Yh3kJ7AVWw==
X-CSE-MsgGUID: dtXrPMx+SrKx8fPap4HTTg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,293,1732608000"; 
   d="scan'208";a="114146626"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 17 Feb 2025 13:21:30 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tk8YR-001Dbx-03
	for oe-kbuild-all@lists.linux.dev;
	Mon, 17 Feb 2025 21:21:27 +0000
Date: Tue, 18 Feb 2025 05:20:52 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/57 1/1] arch/x86/include/asm/bitops.h:204:17: warning:
 array subscript 'long int[0]' is partly outside array bounds of 'unsigned
 int[1]'
Message-ID: <202502180524.EyIM04m8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git pr/57
head:   6fe7458ff80d33a5dba8b386c88d33ffd2ccb47d
commit: 90f6e68031397fb6212bef5619193cd15707fa0f [1/1] ASoC: codecs: ad193x: Fix frame polarity for DSP_A format
config: x86_64-buildonly-randconfig-005-20250217 (https://download.01.org/0day-ci/archive/20250218/202502180524.EyIM04m8-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250218/202502180524.EyIM04m8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502180524.EyIM04m8-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bitops.h:19,
                    from include/linux/kernel.h:11,
                    from include/linux/list.h:9,
                    from include/linux/module.h:9,
                    from sound/soc/codecs/ad193x.c:9:
   In function 'change_bit',
       inlined from 'ad193x_set_dai_fmt' at sound/soc/codecs/ad193x.c:233:3:
>> arch/x86/include/asm/bitops.h:204:17: warning: array subscript 'long int[0]' is partly outside array bounds of 'unsigned int[1]' [-Warray-bounds]
     204 |                 asm volatile(LOCK_PREFIX __ASM_SIZE(btc) " %1,%0"
         |                 ^~~
   sound/soc/codecs/ad193x.c: In function 'ad193x_set_dai_fmt':
   sound/soc/codecs/ad193x.c:192:22: note: object 'dac_fmt' of size 4
     192 |         unsigned int dac_fmt = 0;
         |                      ^~~~~~~
   In function 'change_bit',
       inlined from 'ad193x_set_dai_fmt' at sound/soc/codecs/ad193x.c:233:3:
>> arch/x86/include/asm/bitops.h:204:17: warning: array subscript 'long int[0]' is partly outside array bounds of 'unsigned int[1]' [-Warray-bounds]
     204 |                 asm volatile(LOCK_PREFIX __ASM_SIZE(btc) " %1,%0"
         |                 ^~~
   sound/soc/codecs/ad193x.c: In function 'ad193x_set_dai_fmt':
   sound/soc/codecs/ad193x.c:192:22: note: object 'dac_fmt' of size 4
     192 |         unsigned int dac_fmt = 0;
         |                      ^~~~~~~


vim +204 arch/x86/include/asm/bitops.h

1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30  187  
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30  188  /**
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30  189   * change_bit - Toggle a bit in memory
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30  190   * @nr: Bit to change
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30  191   * @addr: Address to start counting from
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30  192   *
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30  193   * change_bit() is atomic and may not be reordered.
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30  194   * Note that @nr may be almost arbitrarily large; this function is not
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30  195   * restricted to acting on a single-word quantity.
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30  196   */
8dd5032d9c5401 arch/x86/include/asm/bitops.h Denys Vlasenko      2016-02-07  197  static __always_inline void change_bit(long nr, volatile unsigned long *addr)
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30  198  {
838e8bb71dc0c8 arch/x86/include/asm/bitops.h Uros Bizjak         2008-10-24  199  	if (IS_IMMEDIATE(nr)) {
838e8bb71dc0c8 arch/x86/include/asm/bitops.h Uros Bizjak         2008-10-24  200  		asm volatile(LOCK_PREFIX "xorb %1,%0"
838e8bb71dc0c8 arch/x86/include/asm/bitops.h Uros Bizjak         2008-10-24  201  			: CONST_MASK_ADDR(nr, addr)
838e8bb71dc0c8 arch/x86/include/asm/bitops.h Uros Bizjak         2008-10-24  202  			: "iq" ((u8)CONST_MASK(nr)));
838e8bb71dc0c8 arch/x86/include/asm/bitops.h Uros Bizjak         2008-10-24  203  	} else {
22636f8c951124 arch/x86/include/asm/bitops.h Jan Beulich         2018-02-26 @204  		asm volatile(LOCK_PREFIX __ASM_SIZE(btc) " %1,%0"
838e8bb71dc0c8 arch/x86/include/asm/bitops.h Uros Bizjak         2008-10-24  205  			: BITOP_ADDR(addr)
838e8bb71dc0c8 arch/x86/include/asm/bitops.h Uros Bizjak         2008-10-24  206  			: "Ir" (nr));
838e8bb71dc0c8 arch/x86/include/asm/bitops.h Uros Bizjak         2008-10-24  207  	}
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30  208  }
1c54d77078056c include/asm-x86/bitops.h      Jeremy Fitzhardinge 2008-01-30  209  

:::::: The code at line 204 was first introduced by commit
:::::: 22636f8c9511245cb3c8412039f1dd95afb3aa59 x86/asm: Add instruction suffixes to bitops

:::::: TO: Jan Beulich <JBeulich@suse.com>
:::::: CC: Thomas Gleixner <tglx@linutronix.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
