Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B53479EF
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 06:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717826962; cv=none; b=GjsXzsKqQvdC4QOQ9RiGkjE6uGDBikbJJmTSsux0nRHkzkmQgEV5YZF0BncFJ/o/dOw+QVNBAmDX0JGjxdB6TBhLjMVTd79cpohRJWxOd154KmD+36NqtR36NKxwpzABi/gNGCISw+LhDvpXKtDc97o+BMRZ+oFxRLoJDJ7TJ5w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717826962; c=relaxed/simple;
	bh=01UpdCWEUzEV4XaVRtrFN9drXbiEp3KWwrOGiNqxpNc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZC0udgwmhiD3OiV8/n5vuEZ4Kaz9fL8nGhuBW5kfSTaxXkptY2gsOqEYwmpm/tMJwn0eeTMadPhDZcONb5tt72TGZKfBdKffORIFOhukT78FP+0jmPi6sTQX1bL84F0dJ2gQoUeipcCFuMbn9UKd11mUrJ0fOEytl62NDzCMKIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=n/LQTjDo; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="n/LQTjDo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717826959; x=1749362959;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=01UpdCWEUzEV4XaVRtrFN9drXbiEp3KWwrOGiNqxpNc=;
  b=n/LQTjDodk+lkbt0fsECcDJEaUgAU3K0wwge3sEd8K/HM8eISzeBtRnx
   NVak6Wl1LxVqMzRkAwnPVAKnyu+P1X04jV/15VpjLfmnRLWYACPdKKFdz
   XepbM8CvJ/r8p16Uh6FXpOvaaFk0OaYiS25ss8oRfs3OmDNKUX08cIS09
   zLNg5VEUHGOaTZhcVkWDJgKHJW6iF363poQgxAB8MyiYzxGliURVxytZX
   DRMMZ3QnakbSZ8b2r4XOEY79NuLUo/iA+qAZSOP7JGX1QEj9Hf/yz/KSR
   AUQLTKG4fW1wu60T7PFFxH1R3Y4nsJsFqYAS3TUnCPjXF7c3n/nOfWMPZ
   g==;
X-CSE-ConnectionGUID: Ex8iGhITTtCvE6ffRAJvqA==
X-CSE-MsgGUID: Us8BFFhzTralgzmXwpYPcg==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="14440126"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="14440126"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 23:09:18 -0700
X-CSE-ConnectionGUID: AgDR+D08TxiAbljQBwTpww==
X-CSE-MsgGUID: wdgqwQBpT42Rp9em2jZuOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="69714111"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 07 Jun 2024 23:09:17 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFpGN-00019W-2E;
	Sat, 08 Jun 2024 06:09:15 +0000
Date: Sat, 8 Jun 2024 14:08:49 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find-and-bit-v6 3/42] include/linux/find_atomic.h:294:8:
 error: call to undeclared function 'find_first_zero_bit'; ISO C99 and later
 do not support implicit function declarations
Message-ID: <202406081412.gHfnXFnM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find-and-bit-v6
head:   01a427072a49f0674209d92684f2bc928b2509a1
commit: 6ebe8d6a8e3f6c1f51347b8aab4246c6d604152a [3/42] lib/find: add atomic find_bit() primitives
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240608/202406081412.gHfnXFnM-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081412.gHfnXFnM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081412.gHfnXFnM-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from lib/find_bit.c:16:
>> include/linux/find_atomic.h:294:8: error: call to undeclared function 'find_first_zero_bit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     294 |         bit = find_first_zero_bit(addr, nbits);
         |               ^
>> lib/find_bit.c:99:15: warning: no previous prototype for function '_find_first_bit' [-Wmissing-prototypes]
      99 | unsigned long _find_first_bit(const unsigned long *addr, unsigned long size)
         |               ^
   lib/find_bit.c:99:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      99 | unsigned long _find_first_bit(const unsigned long *addr, unsigned long size)
         | ^
         | static 
>> lib/find_bit.c:110:15: warning: no previous prototype for function '_find_first_and_bit' [-Wmissing-prototypes]
     110 | unsigned long _find_first_and_bit(const unsigned long *addr1,
         |               ^
   lib/find_bit.c:110:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     110 | unsigned long _find_first_and_bit(const unsigned long *addr1,
         | ^
         | static 
>> lib/find_bit.c:122:15: warning: no previous prototype for function '_find_first_and_and_bit' [-Wmissing-prototypes]
     122 | unsigned long _find_first_and_and_bit(const unsigned long *addr1,
         |               ^
   lib/find_bit.c:122:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     122 | unsigned long _find_first_and_and_bit(const unsigned long *addr1,
         | ^
         | static 
>> lib/find_bit.c:151:9: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     151 |                 bit = FIND_NEXT_BIT(~addr[idx], /* nop */, nbits, start);
         |                       ^
   lib/find_bit.c:57:15: note: expanded from macro 'FIND_NEXT_BIT'
      57 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
   lib/find_bit.c:180:9: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     180 |                 bit = FIND_NEXT_BIT(~addr[idx], /* nop */, nbits, start);
         |                       ^
   lib/find_bit.c:57:15: note: expanded from macro 'FIND_NEXT_BIT'
      57 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
   lib/find_bit.c:207:12: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     207 |                 start =  FIND_NEXT_BIT(addr[idx], /* nop */, nbits, start);
         |                          ^
   lib/find_bit.c:57:15: note: expanded from macro 'FIND_NEXT_BIT'
      57 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
>> lib/find_bit.c:220:15: warning: no previous prototype for function '_find_first_zero_bit' [-Wmissing-prototypes]
     220 | unsigned long _find_first_zero_bit(const unsigned long *addr, unsigned long size)
         |               ^
   lib/find_bit.c:220:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     220 | unsigned long _find_first_zero_bit(const unsigned long *addr, unsigned long size)
         | ^
         | static 
   lib/find_bit.c:230:9: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     230 |         return FIND_NEXT_BIT(addr[idx], /* nop */, nbits, start);
         |                ^
   lib/find_bit.c:57:15: note: expanded from macro 'FIND_NEXT_BIT'
      57 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
>> lib/find_bit.c:228:15: warning: no previous prototype for function '_find_next_bit' [-Wmissing-prototypes]
     228 | unsigned long _find_next_bit(const unsigned long *addr, unsigned long nbits, unsigned long start)
         |               ^
   lib/find_bit.c:228:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     228 | unsigned long _find_next_bit(const unsigned long *addr, unsigned long nbits, unsigned long start)
         | ^
         | static 
>> lib/find_bit.c:237:9: error: call to undeclared function 'BITMAP_LAST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     237 |         return FIND_NTH_BIT(addr[idx], size, n);
         |                ^
   lib/find_bit.c:88:19: note: expanded from macro 'FIND_NTH_BIT'
      88 |                 tmp = (FETCH) & BITMAP_LAST_WORD_MASK(sz);                      \
         |                                 ^
>> lib/find_bit.c:235:15: warning: no previous prototype for function '__find_nth_bit' [-Wmissing-prototypes]
     235 | unsigned long __find_nth_bit(const unsigned long *addr, unsigned long size, unsigned long n)
         |               ^
   lib/find_bit.c:235:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     235 | unsigned long __find_nth_bit(const unsigned long *addr, unsigned long size, unsigned long n)
         | ^
         | static 
   lib/find_bit.c:244:9: error: call to undeclared function 'BITMAP_LAST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     244 |         return FIND_NTH_BIT(addr1[idx] & addr2[idx], size, n);
         |                ^
   lib/find_bit.c:88:19: note: expanded from macro 'FIND_NTH_BIT'
      88 |                 tmp = (FETCH) & BITMAP_LAST_WORD_MASK(sz);                      \
         |                                 ^
>> lib/find_bit.c:241:15: warning: no previous prototype for function '__find_nth_and_bit' [-Wmissing-prototypes]
     241 | unsigned long __find_nth_and_bit(const unsigned long *addr1, const unsigned long *addr2,
         |               ^
   lib/find_bit.c:241:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     241 | unsigned long __find_nth_and_bit(const unsigned long *addr1, const unsigned long *addr2,
         | ^
         | static 
   lib/find_bit.c:251:9: error: call to undeclared function 'BITMAP_LAST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     251 |         return FIND_NTH_BIT(addr1[idx] & ~addr2[idx], size, n);
         |                ^
   lib/find_bit.c:88:19: note: expanded from macro 'FIND_NTH_BIT'
      88 |                 tmp = (FETCH) & BITMAP_LAST_WORD_MASK(sz);                      \
         |                                 ^
>> lib/find_bit.c:248:15: warning: no previous prototype for function '__find_nth_andnot_bit' [-Wmissing-prototypes]
     248 | unsigned long __find_nth_andnot_bit(const unsigned long *addr1, const unsigned long *addr2,
         |               ^
   lib/find_bit.c:248:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     248 | unsigned long __find_nth_andnot_bit(const unsigned long *addr1, const unsigned long *addr2,
         | ^
         | static 
   lib/find_bit.c:260:9: error: call to undeclared function 'BITMAP_LAST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     260 |         return FIND_NTH_BIT(addr1[idx] & addr2[idx] & ~addr3[idx], size, n);
         |                ^
   lib/find_bit.c:88:19: note: expanded from macro 'FIND_NTH_BIT'
      88 |                 tmp = (FETCH) & BITMAP_LAST_WORD_MASK(sz);                      \
         |                                 ^
>> lib/find_bit.c:255:15: warning: no previous prototype for function '__find_nth_and_andnot_bit' [-Wmissing-prototypes]
     255 | unsigned long __find_nth_and_andnot_bit(const unsigned long *addr1,
         |               ^
   lib/find_bit.c:255:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     255 | unsigned long __find_nth_and_andnot_bit(const unsigned long *addr1,
         | ^
         | static 
   lib/find_bit.c:268:9: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     268 |         return FIND_NEXT_BIT(addr1[idx] & addr2[idx], /* nop */, nbits, start);
         |                ^
   lib/find_bit.c:57:15: note: expanded from macro 'FIND_NEXT_BIT'
      57 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
>> lib/find_bit.c:265:15: warning: no previous prototype for function '_find_next_and_bit' [-Wmissing-prototypes]
     265 | unsigned long _find_next_and_bit(const unsigned long *addr1, const unsigned long *addr2,
         |               ^
   lib/find_bit.c:265:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     265 | unsigned long _find_next_and_bit(const unsigned long *addr1, const unsigned long *addr2,
         | ^
         | static 
   lib/find_bit.c:277:9: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     277 |         return FIND_NEXT_BIT(addr1[idx] & ~addr2[idx], /* nop */, nbits, start);
         |                ^
   lib/find_bit.c:57:15: note: expanded from macro 'FIND_NEXT_BIT'
      57 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
>> lib/find_bit.c:274:15: warning: no previous prototype for function '_find_next_andnot_bit' [-Wmissing-prototypes]
     274 | unsigned long _find_next_andnot_bit(const unsigned long *addr1, const unsigned long *addr2,
         |               ^
   lib/find_bit.c:274:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     274 | unsigned long _find_next_andnot_bit(const unsigned long *addr1, const unsigned long *addr2,
         | ^
         | static 
   lib/find_bit.c:286:9: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     286 |         return FIND_NEXT_BIT(addr1[idx] | addr2[idx], /* nop */, nbits, start);
         |                ^
   lib/find_bit.c:57:15: note: expanded from macro 'FIND_NEXT_BIT'
      57 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
>> lib/find_bit.c:283:15: warning: no previous prototype for function '_find_next_or_bit' [-Wmissing-prototypes]
     283 | unsigned long _find_next_or_bit(const unsigned long *addr1, const unsigned long *addr2,
         |               ^
   lib/find_bit.c:283:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     283 | unsigned long _find_next_or_bit(const unsigned long *addr1, const unsigned long *addr2,
         | ^
         | static 
   lib/find_bit.c:295:9: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     295 |         return FIND_NEXT_BIT(~addr[idx], /* nop */, nbits, start);
         |                ^
   lib/find_bit.c:57:15: note: expanded from macro 'FIND_NEXT_BIT'
      57 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
>> lib/find_bit.c:292:15: warning: no previous prototype for function '_find_next_zero_bit' [-Wmissing-prototypes]
     292 | unsigned long _find_next_zero_bit(const unsigned long *addr, unsigned long nbits,
         |               ^
   lib/find_bit.c:292:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     292 | unsigned long _find_next_zero_bit(const unsigned long *addr, unsigned long nbits,
         | ^
         | static 
   lib/find_bit.c:304:23: error: call to undeclared function 'BITMAP_LAST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     304 |                 unsigned long val = BITMAP_LAST_WORD_MASK(size);
         |                                     ^
>> lib/find_bit.c:301:15: warning: no previous prototype for function '_find_last_bit' [-Wmissing-prototypes]
     301 | unsigned long _find_last_bit(const unsigned long *addr, unsigned long size)
         |               ^
   lib/find_bit.c:301:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     301 | unsigned long _find_last_bit(const unsigned long *addr, unsigned long size)
         | ^
         | static 
>> lib/find_bit.c:323:11: error: call to undeclared function 'find_next_bit'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     323 |         offset = find_next_bit(addr, size, offset);
         |                  ^
   lib/find_bit.c:323:11: note: did you mean '_find_next_bit'?
   lib/find_bit.c:232:15: note: '_find_next_bit' declared here
     232 | EXPORT_SYMBOL(_find_next_bit);
         |               ^
   include/linux/export.h:68:44: note: expanded from macro 'EXPORT_SYMBOL'
      68 | #define EXPORT_SYMBOL(sym)              _EXPORT_SYMBOL(sym, "")
         |                                                        ^
   include/linux/export.h:65:54: note: expanded from macro '_EXPORT_SYMBOL'
      65 | #define _EXPORT_SYMBOL(sym, license)    __EXPORT_SYMBOL(sym, license, "")
         |                                                         ^
   include/linux/export.h:56:21: note: expanded from macro '__EXPORT_SYMBOL'
      56 |         extern typeof(sym) sym;                                 \
         |                            ^
>> lib/find_bit.c:328:11: error: call to undeclared function 'bitmap_get_value8'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     328 |         *clump = bitmap_get_value8(addr, offset);
         |                  ^
>> lib/find_bit.c:320:15: warning: no previous prototype for function 'find_next_clump8' [-Wmissing-prototypes]
     320 | unsigned long find_next_clump8(unsigned long *clump, const unsigned long *addr,
         |               ^
   lib/find_bit.c:320:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     320 | unsigned long find_next_clump8(unsigned long *clump, const unsigned long *addr,
         | ^
         | static 
   lib/find_bit.c:340:15: warning: no previous prototype for function '_find_first_zero_bit_le' [-Wmissing-prototypes]
     340 | unsigned long _find_first_zero_bit_le(const unsigned long *addr, unsigned long size)
         |               ^
   lib/find_bit.c:340:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     340 | unsigned long _find_first_zero_bit_le(const unsigned long *addr, unsigned long size)
         | ^
         | static 
   lib/find_bit.c:352:9: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     352 |         return FIND_NEXT_BIT(~addr[idx], swab, size, offset);
         |                ^
   lib/find_bit.c:57:15: note: expanded from macro 'FIND_NEXT_BIT'
      57 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
   lib/find_bit.c:349:15: warning: no previous prototype for function '_find_next_zero_bit_le' [-Wmissing-prototypes]
     349 | unsigned long _find_next_zero_bit_le(const unsigned long *addr,
         |               ^
   lib/find_bit.c:349:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     349 | unsigned long _find_next_zero_bit_le(const unsigned long *addr,
         | ^
         | static 
   lib/find_bit.c:361:9: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     361 |         return FIND_NEXT_BIT(addr[idx], swab, size, offset);
         |                ^
   lib/find_bit.c:57:15: note: expanded from macro 'FIND_NEXT_BIT'
      57 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
   lib/find_bit.c:358:15: warning: no previous prototype for function '_find_next_bit_le' [-Wmissing-prototypes]
     358 | unsigned long _find_next_bit_le(const unsigned long *addr,
         |               ^
   lib/find_bit.c:358:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     358 | unsigned long _find_next_bit_le(const unsigned long *addr,
         | ^
         | static 
   18 warnings and 18 errors generated.


vim +/find_first_zero_bit +294 include/linux/find_atomic.h

   278	
   279	/**
   280	 * __find_and_set_bit - Find a zero bit and set it non-atomically
   281	 * @addr: The address to base the search on
   282	 * @nbits: The bitmap size in bits
   283	 *
   284	 * A non-atomic version of find_and_set_bit() needed to help writing
   285	 * common-looking code where atomicity is provided externally.
   286	 *
   287	 * Returns: found and set bit, or >= @nbits if no bits found
   288	 */
   289	static inline
   290	unsigned long __find_and_set_bit(unsigned long *addr, unsigned long nbits)
   291	{
   292		unsigned long bit;
   293	
 > 294		bit = find_first_zero_bit(addr, nbits);
   295		if (bit < nbits)
   296			__set_bit(bit, addr);
   297	
   298		return bit;
   299	}
   300	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
