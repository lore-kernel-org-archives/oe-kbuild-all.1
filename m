Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2D2FC2E9
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Jun 2024 05:38:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717825100; cv=none; b=ZclyfIwQwf9hCGZMHLwvMWwMCALyMyxOZ6zkdWeFBkZ2wqiHsLi6Mt43hac1+76+rXdeH2ArI8WbmZeJCmOPAeFpjfCHQgRLmSNFDA+4UC7a30GAItiB1nzDPxfW/Hn0UfwS5ScDUyS8DJqNgLDracZuSSKB1CTXiilMlysA1L8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717825100; c=relaxed/simple;
	bh=oQHR0aWS4SWcrraf2Axie8qP8p7ev0s16eS8SemoL5U=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BibkxBM1gomEt+Xk3YWf/chdO59wROJ869ianNhjbCIe6fWwZuZ7lTP81okEXWGvAZZGVzTk/VWv2tVn5hG/YZ83L5v9TXzIGFA5GcyxBeK08vTzeTYOjZNk0X7VukISUfYjo7GYDKkP77lrhdRN3izJF9B9fNx+AQntTwR7jHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=M2IdmfGg; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="M2IdmfGg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717825098; x=1749361098;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oQHR0aWS4SWcrraf2Axie8qP8p7ev0s16eS8SemoL5U=;
  b=M2IdmfGgG02jbrYLxmRjoiNIoSVbPGyBwoPBA9BxfGZaIqO3f+Jlr54t
   9TGo/rt65hAiNLLubYOfYfhLV6zMP0sz46nAXuwnuBUZm397FYWydcrr1
   8U1Sof1/Scn8GnX5BPU8t8UwRaddLHMPlUY/VxEocyVNSQdtKz6BB0usg
   6pHn2+K1ko0yxO2/zL5+Z+nGJqY/A6koxATQOyZpWO0XG09MSJEl/14Ih
   KyQ1Q90sRz7W1SwZbc5CwHJpBodsi99teVajxd2Mr8trIu5Wi4NIXqPFt
   rL4sRq9hab9l9jXg1u6h+9zfwUORnCX22x3oVERxeM4Bmc80TVWuJYCUg
   A==;
X-CSE-ConnectionGUID: CEw6BqnCQq+GTmxiLt4geQ==
X-CSE-MsgGUID: A/97Nai0S8CWbY4QDXSaXw==
X-IronPort-AV: E=McAfee;i="6600,9927,11096"; a="18413792"
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="18413792"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2024 22:38:17 -0700
X-CSE-ConnectionGUID: U86sZAJWTi204Cyjp8g/SQ==
X-CSE-MsgGUID: Km4SPu4cTOK+6+mgIlP40A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,222,1712646000"; 
   d="scan'208";a="42975776"
Received: from lkp-server01.sh.intel.com (HELO 472b94a103a1) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 07 Jun 2024 22:38:16 -0700
Received: from kbuild by 472b94a103a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sFomM-00017c-1Z;
	Sat, 08 Jun 2024 05:38:14 +0000
Date: Sat, 8 Jun 2024 13:37:17 +0800
From: kernel test robot <lkp@intel.com>
To: Yury Norov <yury.norov@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [norov:find-and-bit-v6 3/42] include/linux/find_atomic.h:294:15:
 error: implicit declaration of function 'find_first_zero_bit'
Message-ID: <202406081337.DBDNAdoL-lkp@intel.com>
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
config: parisc-allnoconfig (https://download.01.org/0day-ci/archive/20240608/202406081337.DBDNAdoL-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240608/202406081337.DBDNAdoL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406081337.DBDNAdoL-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   In file included from lib/find_bit.c:16:
   include/linux/find_atomic.h: In function '__find_and_set_bit':
>> include/linux/find_atomic.h:294:15: error: implicit declaration of function 'find_first_zero_bit' [-Werror=implicit-function-declaration]
     294 |         bit = find_first_zero_bit(addr, nbits);
         |               ^~~~~~~~~~~~~~~~~~~
   lib/find_bit.c: At top level:
>> lib/find_bit.c:99:15: warning: no previous prototype for '_find_first_bit' [-Wmissing-prototypes]
      99 | unsigned long _find_first_bit(const unsigned long *addr, unsigned long size)
         |               ^~~~~~~~~~~~~~~
>> lib/find_bit.c:110:15: warning: no previous prototype for '_find_first_and_bit' [-Wmissing-prototypes]
     110 | unsigned long _find_first_and_bit(const unsigned long *addr1,
         |               ^~~~~~~~~~~~~~~~~~~
>> lib/find_bit.c:122:15: warning: no previous prototype for '_find_first_and_and_bit' [-Wmissing-prototypes]
     122 | unsigned long _find_first_and_and_bit(const unsigned long *addr1,
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   lib/find_bit.c: In function '_find_and_set_next_bit':
>> lib/find_bit.c:57:22: error: implicit declaration of function 'BITMAP_FIRST_WORD_MASK' [-Werror=implicit-function-declaration]
      57 |         mask = MUNGE(BITMAP_FIRST_WORD_MASK(__start));                          \
         |                      ^~~~~~~~~~~~~~~~~~~~~~
   lib/find_bit.c:151:23: note: in expansion of macro 'FIND_NEXT_BIT'
     151 |                 bit = FIND_NEXT_BIT(~addr[idx], /* nop */, nbits, start);
         |                       ^~~~~~~~~~~~~
   lib/find_bit.c: At top level:
>> lib/find_bit.c:220:15: warning: no previous prototype for '_find_first_zero_bit' [-Wmissing-prototypes]
     220 | unsigned long _find_first_zero_bit(const unsigned long *addr, unsigned long size)
         |               ^~~~~~~~~~~~~~~~~~~~
>> lib/find_bit.c:228:15: warning: no previous prototype for '_find_next_bit' [-Wmissing-prototypes]
     228 | unsigned long _find_next_bit(const unsigned long *addr, unsigned long nbits, unsigned long start)
         |               ^~~~~~~~~~~~~~
>> lib/find_bit.c:235:15: warning: no previous prototype for '__find_nth_bit' [-Wmissing-prototypes]
     235 | unsigned long __find_nth_bit(const unsigned long *addr, unsigned long size, unsigned long n)
         |               ^~~~~~~~~~~~~~
   lib/find_bit.c: In function '__find_nth_bit':
>> lib/find_bit.c:88:33: error: implicit declaration of function 'BITMAP_LAST_WORD_MASK' [-Werror=implicit-function-declaration]
      88 |                 tmp = (FETCH) & BITMAP_LAST_WORD_MASK(sz);                      \
         |                                 ^~~~~~~~~~~~~~~~~~~~~
   lib/find_bit.c:237:16: note: in expansion of macro 'FIND_NTH_BIT'
     237 |         return FIND_NTH_BIT(addr[idx], size, n);
         |                ^~~~~~~~~~~~
   lib/find_bit.c: At top level:
>> lib/find_bit.c:241:15: warning: no previous prototype for '__find_nth_and_bit' [-Wmissing-prototypes]
     241 | unsigned long __find_nth_and_bit(const unsigned long *addr1, const unsigned long *addr2,
         |               ^~~~~~~~~~~~~~~~~~
>> lib/find_bit.c:248:15: warning: no previous prototype for '__find_nth_andnot_bit' [-Wmissing-prototypes]
     248 | unsigned long __find_nth_andnot_bit(const unsigned long *addr1, const unsigned long *addr2,
         |               ^~~~~~~~~~~~~~~~~~~~~
>> lib/find_bit.c:255:15: warning: no previous prototype for '__find_nth_and_andnot_bit' [-Wmissing-prototypes]
     255 | unsigned long __find_nth_and_andnot_bit(const unsigned long *addr1,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
>> lib/find_bit.c:265:15: warning: no previous prototype for '_find_next_and_bit' [-Wmissing-prototypes]
     265 | unsigned long _find_next_and_bit(const unsigned long *addr1, const unsigned long *addr2,
         |               ^~~~~~~~~~~~~~~~~~
>> lib/find_bit.c:274:15: warning: no previous prototype for '_find_next_andnot_bit' [-Wmissing-prototypes]
     274 | unsigned long _find_next_andnot_bit(const unsigned long *addr1, const unsigned long *addr2,
         |               ^~~~~~~~~~~~~~~~~~~~~
>> lib/find_bit.c:283:15: warning: no previous prototype for '_find_next_or_bit' [-Wmissing-prototypes]
     283 | unsigned long _find_next_or_bit(const unsigned long *addr1, const unsigned long *addr2,
         |               ^~~~~~~~~~~~~~~~~
>> lib/find_bit.c:292:15: warning: no previous prototype for '_find_next_zero_bit' [-Wmissing-prototypes]
     292 | unsigned long _find_next_zero_bit(const unsigned long *addr, unsigned long nbits,
         |               ^~~~~~~~~~~~~~~~~~~
>> lib/find_bit.c:301:15: warning: no previous prototype for '_find_last_bit' [-Wmissing-prototypes]
     301 | unsigned long _find_last_bit(const unsigned long *addr, unsigned long size)
         |               ^~~~~~~~~~~~~~
>> lib/find_bit.c:320:15: warning: no previous prototype for 'find_next_clump8' [-Wmissing-prototypes]
     320 | unsigned long find_next_clump8(unsigned long *clump, const unsigned long *addr,
         |               ^~~~~~~~~~~~~~~~
   lib/find_bit.c: In function 'find_next_clump8':
>> lib/find_bit.c:323:18: error: implicit declaration of function 'find_next_bit'; did you mean '_find_next_bit'? [-Werror=implicit-function-declaration]
     323 |         offset = find_next_bit(addr, size, offset);
         |                  ^~~~~~~~~~~~~
         |                  _find_next_bit
>> lib/find_bit.c:328:18: error: implicit declaration of function 'bitmap_get_value8' [-Werror=implicit-function-declaration]
     328 |         *clump = bitmap_get_value8(addr, offset);
         |                  ^~~~~~~~~~~~~~~~~
   lib/find_bit.c: At top level:
   lib/find_bit.c:340:15: warning: no previous prototype for '_find_first_zero_bit_le' [-Wmissing-prototypes]
     340 | unsigned long _find_first_zero_bit_le(const unsigned long *addr, unsigned long size)
         |               ^~~~~~~~~~~~~~~~~~~~~~~
   lib/find_bit.c:349:15: warning: no previous prototype for '_find_next_zero_bit_le' [-Wmissing-prototypes]
     349 | unsigned long _find_next_zero_bit_le(const unsigned long *addr,
         |               ^~~~~~~~~~~~~~~~~~~~~~
   lib/find_bit.c:358:15: warning: no previous prototype for '_find_next_bit_le' [-Wmissing-prototypes]
     358 | unsigned long _find_next_bit_le(const unsigned long *addr,
         |               ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


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
