Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FEBEF505
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 20:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717879406; cv=none; b=DQ7ezUYwtDWQ/PyRfW0icdFI/XOCuuObDvWZq83a+5Mm2EgyQVAzK+utY2XkaBkevRwlwmHtL7C2t0KIn8VegTUbgtY9uCB+PUEqeh5istVPsqSkN3Ty7XdAQvBsHbCye6CFe8fbpeG9OvsjXdvDxAi3j0U/hJjTnYqgFNv10GI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717879406; c=relaxed/simple;
	bh=GphsXv/01+hJZDVWk+FowkPDczTtjVThXeT0yeLkNcY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pjmNZeW+GTn5pDwdysWppblJsQBbI7NPmY/22kIseuADVdQYz3wK5dV1Vgjp942PL8YHtIuK56Kh07uIY7ZU6Tc/A4mggFBO3zt9kBGGHvIRxjrs148lxUIvAZMr0xd074Aab46WSf74IL4vt+X03SHH2z7kzETa8SkKKKbbYUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IgSS8qCV; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IgSS8qCV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717879404; x=1749415404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GphsXv/01+hJZDVWk+FowkPDczTtjVThXeT0yeLkNcY=;
  b=IgSS8qCV08u8zUzG1Bi4WjSfNfmf2NyIidSx9kCT69EC/o0TS7r2KHF3
   2To69KCGIc+S9aQdO2uqIZ3Gt6JIJpXL28Y1kgqWHMW0e0ruJtAjR5+L7
   CYBN45BgtSNAqe8bqvTwZBlPsBZHH5wB0k0Bq+Rkm+Wte6hLaIxhZyjjz
   wvNTz/4s3cvF6VM+cD6YYDser+kCRG6cDg4jtgnNE2Hz1eMWOkmhu/WtD
   OAK3RmTLyQC+ppBXoK3ZpoIUJUvEg7r25S7eMj88mF6CMyKxm1n0z/UD2
   viZ9JqiumVMHa8/3OsiNyzm6MAMUDxfr0Nu28YFZh5YULpFKYaUhaH0vP
   A==;
X-CSE-ConnectionGUID: db1d+XxrQF286fXMcpvZpQ==
X-CSE-MsgGUID: /BwUuYfuTX6pdmkEDIRAMA==
X-IronPort-AV: E=McAfee;i="6600,9927,11097"; a="14463147"
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="14463147"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Jun 2024 13:43:23 -0700
X-CSE-ConnectionGUID: 8q85L+jLSQOpfNKyBCQb8Q==
X-CSE-MsgGUID: 0Rhlb6xUQxGHHJQhi3CHjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,224,1712646000"; 
   d="scan'208";a="61845982"
Received: from lkp-server01.sh.intel.com (HELO 8967fbab76b3) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 08 Jun 2024 13:43:22 -0700
Received: from kbuild by 8967fbab76b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sG2uG-0000Rw-0y;
	Sat, 08 Jun 2024 20:43:20 +0000
Date: Sun, 9 Jun 2024 04:43:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find-and-bit-v6 3/43] include/linux/find.h:6:2: error: only
 <linux/bitmap.h> can be included directly
Message-ID: <202406090410.jaOcrYEs-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/norov/linux find-and-bit-v6
head:   d9a04b83dde4d5c4da8cca244b425b908e1975ce
commit: 8b9df66c755f6227e2e17560a639e93716ada2cd [3/43] lib/find: add atomic find_bit() primitives
config: s390-allnoconfig (https://download.01.org/0day-ci/archive/20240609/202406090410.jaOcrYEs-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project d7d2d4f53fc79b4b58e8d8d08151b577c3699d4a)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240609/202406090410.jaOcrYEs-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406090410.jaOcrYEs-lkp@intel.com/

Note: the norov/find-and-bit-v6 HEAD d9a04b83dde4d5c4da8cca244b425b908e1975ce builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   In file included from lib/find_bit.c:16:
>> include/linux/find.h:6:2: error: only <linux/bitmap.h> can be included directly
       6 | #error only <linux/bitmap.h> can be included directly
         |  ^
   lib/find_bit.c:152:9: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     152 |                 bit = FIND_NEXT_BIT(~addr[idx], /* nop */, nbits, start);
         |                       ^
   lib/find_bit.c:58:15: note: expanded from macro 'FIND_NEXT_BIT'
      58 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
   lib/find_bit.c:181:9: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     181 |                 bit = FIND_NEXT_BIT(~addr[idx], /* nop */, nbits, start);
         |                       ^
   lib/find_bit.c:58:15: note: expanded from macro 'FIND_NEXT_BIT'
      58 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
   lib/find_bit.c:208:12: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     208 |                 start =  FIND_NEXT_BIT(addr[idx], /* nop */, nbits, start);
         |                          ^
   lib/find_bit.c:58:15: note: expanded from macro 'FIND_NEXT_BIT'
      58 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
   lib/find_bit.c:231:9: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     231 |         return FIND_NEXT_BIT(addr[idx], /* nop */, nbits, start);
         |                ^
   lib/find_bit.c:58:15: note: expanded from macro 'FIND_NEXT_BIT'
      58 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
   lib/find_bit.c:238:9: error: call to undeclared function 'BITMAP_LAST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     238 |         return FIND_NTH_BIT(addr[idx], size, n);
         |                ^
   lib/find_bit.c:89:19: note: expanded from macro 'FIND_NTH_BIT'
      89 |                 tmp = (FETCH) & BITMAP_LAST_WORD_MASK(sz);                      \
         |                                 ^
   lib/find_bit.c:245:9: error: call to undeclared function 'BITMAP_LAST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     245 |         return FIND_NTH_BIT(addr1[idx] & addr2[idx], size, n);
         |                ^
   lib/find_bit.c:89:19: note: expanded from macro 'FIND_NTH_BIT'
      89 |                 tmp = (FETCH) & BITMAP_LAST_WORD_MASK(sz);                      \
         |                                 ^
   lib/find_bit.c:252:9: error: call to undeclared function 'BITMAP_LAST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     252 |         return FIND_NTH_BIT(addr1[idx] & ~addr2[idx], size, n);
         |                ^
   lib/find_bit.c:89:19: note: expanded from macro 'FIND_NTH_BIT'
      89 |                 tmp = (FETCH) & BITMAP_LAST_WORD_MASK(sz);                      \
         |                                 ^
   lib/find_bit.c:261:9: error: call to undeclared function 'BITMAP_LAST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     261 |         return FIND_NTH_BIT(addr1[idx] & addr2[idx] & ~addr3[idx], size, n);
         |                ^
   lib/find_bit.c:89:19: note: expanded from macro 'FIND_NTH_BIT'
      89 |                 tmp = (FETCH) & BITMAP_LAST_WORD_MASK(sz);                      \
         |                                 ^
   lib/find_bit.c:269:9: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     269 |         return FIND_NEXT_BIT(addr1[idx] & addr2[idx], /* nop */, nbits, start);
         |                ^
   lib/find_bit.c:58:15: note: expanded from macro 'FIND_NEXT_BIT'
      58 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
   lib/find_bit.c:278:9: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     278 |         return FIND_NEXT_BIT(addr1[idx] & ~addr2[idx], /* nop */, nbits, start);
         |                ^
   lib/find_bit.c:58:15: note: expanded from macro 'FIND_NEXT_BIT'
      58 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
   lib/find_bit.c:287:9: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     287 |         return FIND_NEXT_BIT(addr1[idx] | addr2[idx], /* nop */, nbits, start);
         |                ^
   lib/find_bit.c:58:15: note: expanded from macro 'FIND_NEXT_BIT'
      58 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
   lib/find_bit.c:296:9: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     296 |         return FIND_NEXT_BIT(~addr[idx], /* nop */, nbits, start);
         |                ^
   lib/find_bit.c:58:15: note: expanded from macro 'FIND_NEXT_BIT'
      58 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
   lib/find_bit.c:305:23: error: call to undeclared function 'BITMAP_LAST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     305 |                 unsigned long val = BITMAP_LAST_WORD_MASK(size);
         |                                     ^
   lib/find_bit.c:329:11: error: call to undeclared function 'bitmap_get_value8'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     329 |         *clump = bitmap_get_value8(addr, offset);
         |                  ^
   lib/find_bit.c:353:9: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     353 |         return FIND_NEXT_BIT(~addr[idx], swab, size, offset);
         |                ^
   lib/find_bit.c:58:15: note: expanded from macro 'FIND_NEXT_BIT'
      58 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
   lib/find_bit.c:362:9: error: call to undeclared function 'BITMAP_FIRST_WORD_MASK'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     362 |         return FIND_NEXT_BIT(addr[idx], swab, size, offset);
         |                ^
   lib/find_bit.c:58:15: note: expanded from macro 'FIND_NEXT_BIT'
      58 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^
   17 errors generated.


vim +6 include/linux/find.h

47d8c15615c0a2 Yury Norov 2021-08-14  4  
47d8c15615c0a2 Yury Norov 2021-08-14  5  #ifndef __LINUX_BITMAP_H
47d8c15615c0a2 Yury Norov 2021-08-14 @6  #error only <linux/bitmap.h> can be included directly
47d8c15615c0a2 Yury Norov 2021-08-14  7  #endif
47d8c15615c0a2 Yury Norov 2021-08-14  8  

:::::: The code at line 6 was first introduced by commit
:::::: 47d8c15615c0a2046d2d90b04cb80b81ddf31fb1 include: move find.h from asm_generic to linux

:::::: TO: Yury Norov <yury.norov@gmail.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
