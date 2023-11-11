Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB581FAD
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Nov 2023 01:16:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EBHyfC+3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699665417; x=1731201417;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9GWbL/2hs7qaivunTdOxz+ZIUY+1Sa7qbDxf29/gg84=;
  b=EBHyfC+36aVl5I4/LCSP3UHVUTi2Es6B9HZdyYe1fNkgmHAQ09CyNiu3
   YVZ1AfEoGXIYI8XiGjHSXiusTbqItxcEnDOuXlpDz3FkZqJvOvKrum5E6
   Bj1GZ8jRasa4OsROGED6XDFe6G24EvfDnL8PFTIZg0rCnLxjjccFMKt4r
   7WFB4kxJYp5KgviI8x/u9WjXCF/MYEoEqbg39c092Is/ndWAedeEDSBIe
   ZieZh5ZsEsafm/WHESEv6nubZlmg16l/VWxxr/tnX3TVC2Zux9vJ/bBuQ
   uvPqatWd+LJg3C9YpWOidyTH+NrPZCVUp7X54RbfU3JCTIHyKkPX+AsOp
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="476475100"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="476475100"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Nov 2023 17:16:56 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10890"; a="757331133"
X-IronPort-AV: E=Sophos;i="6.03,293,1694761200"; 
   d="scan'208";a="757331133"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 10 Nov 2023 17:16:55 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1ccH-000A74-1k;
	Sat, 11 Nov 2023 01:16:53 +0000
Date: Sat, 11 Nov 2023 09:16:02 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arnd-playground:more-default-warnings 46/47]
 arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for
 `bswap'
Message-ID: <202311110919.k33lLLU9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/arnd/playground.git more-default-warnings
head:   b86302da264f77971112b4be0b16eeb591026cbc
commit: f2c322da2c1e69b480bfab2b8f703bb115cc0fa5 [46/47] x86: asm/swab.h warning
config: um-defconfig (https://download.01.org/0day-ci/archive/20231111/202311110919.k33lLLU9-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231111/202311110919.k33lLLU9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311110919.k33lLLU9-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/include/uapi/asm/swab.h: Assembler messages:
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
--
   arch/x86/include/uapi/asm/swab.h: Assembler messages:
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
--
   lib/vsprintf.c: In function 'va_format':
   lib/vsprintf.c:1683:9: warning: function 'va_format' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1683 |         buf += vsnprintf(buf, end > buf ? end - buf : 0, va_fmt->fmt, va);
         |         ^~~
   arch/x86/include/uapi/asm/swab.h: Assembler messages:
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
--
   arch/x86/include/uapi/asm/swab.h: Assembler messages:
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
--
   arch/x86/include/uapi/asm/swab.h: Assembler messages:
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
--
   arch/x86/include/uapi/asm/swab.h: Assembler messages:
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
--
   arch/x86/include/uapi/asm/swab.h: Assembler messages:
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
--
   arch/x86/include/uapi/asm/swab.h: Assembler messages:
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
--
   arch/x86/include/uapi/asm/swab.h: Assembler messages:
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
--
   arch/x86/include/uapi/asm/swab.h: Assembler messages:
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
--
   arch/x86/include/uapi/asm/swab.h: Assembler messages:
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
>> arch/x86/include/uapi/asm/swab.h:10: Error: operand size mismatch for `bswap'
..


vim +10 arch/x86/include/uapi/asm/swab.h

     7	
     8	static inline __attribute_const__ __u32 __arch_swab32(__u32 val)
     9	{
  > 10		asm("bswapl %w0" : "=r" (val) : "0" (val));
    11		return val;
    12	}
    13	#define __arch_swab32 __arch_swab32
    14	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
