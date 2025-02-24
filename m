Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CE6F207DFB
	for <oe-kbuild-all@lists.linux.dev>; Mon, 24 Feb 2025 07:53:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740383597; cv=none; b=KbrKmIA5d0TFhRT4O0t27gnSZBujh1M3vjNdqQWuZ8F1K/Awb0k1kPf1kGwzzNNUR+HJKf83zpDp5luw9UJigDzttV+iCEF85u24JwCLWIw8l26NI3QNLdJn3XWW4aCTkq2V55SkvM1z7MRYchVYN8Z6xcUHr3hZsdwIPaf1rpw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740383597; c=relaxed/simple;
	bh=Jmk4C2lYizyDErc9RLDs3EyuIerG8RookggUrVh3tjI=;
	h=Date:From:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ONiy0ztutqx1EW2uCvCAoNZX8IuvyVV9DDrpRHmUmBTp5+8dRN+CqFSmsAxBW25glSA3GV7OYnqkKBGJUAp3UEPsIsMsDk6+kOMllrMnrX0uxkOeKoyDf/tIYbpQQ4o05sJZHWNU5swLg3oa6mKhCJSghqsMN9SSaSm8STORvsQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GOlUNtji; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GOlUNtji"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740383596; x=1771919596;
  h=date:from:cc:subject:message-id:mime-version;
  bh=Jmk4C2lYizyDErc9RLDs3EyuIerG8RookggUrVh3tjI=;
  b=GOlUNtjiE9P+3RDNK8EKZj5+IsvWSy9nnP57A84HMaAjYJ8v2bsOWMAG
   vphehKED379WXLflwWB4tegQ47Xw37EXIMYeyy2bMzB/QH7it+qrsdsaN
   97c6VHZE5asGOXaKBirGGn4pSqk8lTbHTfjQ0HERpN5pbYRWD8o9OeNwb
   llt6tC7//n6LWlD/QWH1YZ+GJCNny7bajnIolRlgCCI2LqCY74ZSWC0vD
   55wTF96RRwI9hchM17JsRP55oyWV5IwYhtTnru8lZ5QTCQUlkDdqwuKgU
   y4jzpWk5bVdFV6AINCs4bax6Zb9L+A0CobPAnGXNGNFbSFHdj/THd//l7
   w==;
X-CSE-ConnectionGUID: MjezuZtXRvKlltFEthWkyQ==
X-CSE-MsgGUID: BpHt8ITSRMe79wY3b1ZpoA==
X-IronPort-AV: E=McAfee;i="6700,10204,11354"; a="58544437"
X-IronPort-AV: E=Sophos;i="6.13,309,1732608000"; 
   d="scan'208";a="58544437"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Feb 2025 23:53:13 -0800
X-CSE-ConnectionGUID: UK27D/atS6ai/9/YTfjv/Q==
X-CSE-MsgGUID: eFBKAN7iR4GrsvlFgT6jww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121252779"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 23 Feb 2025 23:53:12 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tmTH4-00080z-1n
	for oe-kbuild-all@lists.linux.dev;
	Mon, 24 Feb 2025 07:53:10 +0000
Date: Mon, 24 Feb 2025 15:52:44 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:pr/69 1/1] lib/xxhash.c:236:1: warning: the frame size of
 1624 bytes is larger than 1024 bytes
Message-ID: <202502241546.Xy99Tcrt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Nick,

FYI, the error/warning still remains.

tree:   https://github.com/intel/linux-intel-lts.git pr/69
head:   f36ea6678b4077d9bbb4644e73977fb91d187ab7
commit: 5c1aab1dd5445ed8bdcdbb575abc1b0d7ee5b2e7 [1/1] btrfs: Add zstd support
config: parisc-randconfig-002-20250224 (https://download.01.org/0day-ci/archive/20250224/202502241546.Xy99Tcrt-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250224/202502241546.Xy99Tcrt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502241546.Xy99Tcrt-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/xxhash.c: In function 'xxh64':
>> lib/xxhash.c:236:1: warning: the frame size of 1624 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    }
    ^
   lib/xxhash.c: In function 'xxh64_update':
   lib/xxhash.c:441:1: warning: the frame size of 1248 bytes is larger than 1024 bytes [-Wframe-larger-than=]
    }
    ^


vim +236 lib/xxhash.c

5d2405227a9eae Nick Terrell 2017-08-04  171  
5d2405227a9eae Nick Terrell 2017-08-04  172  uint64_t xxh64(const void *input, const size_t len, const uint64_t seed)
5d2405227a9eae Nick Terrell 2017-08-04  173  {
5d2405227a9eae Nick Terrell 2017-08-04  174  	const uint8_t *p = (const uint8_t *)input;
5d2405227a9eae Nick Terrell 2017-08-04  175  	const uint8_t *const b_end = p + len;
5d2405227a9eae Nick Terrell 2017-08-04  176  	uint64_t h64;
5d2405227a9eae Nick Terrell 2017-08-04  177  
5d2405227a9eae Nick Terrell 2017-08-04  178  	if (len >= 32) {
5d2405227a9eae Nick Terrell 2017-08-04  179  		const uint8_t *const limit = b_end - 32;
5d2405227a9eae Nick Terrell 2017-08-04  180  		uint64_t v1 = seed + PRIME64_1 + PRIME64_2;
5d2405227a9eae Nick Terrell 2017-08-04  181  		uint64_t v2 = seed + PRIME64_2;
5d2405227a9eae Nick Terrell 2017-08-04  182  		uint64_t v3 = seed + 0;
5d2405227a9eae Nick Terrell 2017-08-04  183  		uint64_t v4 = seed - PRIME64_1;
5d2405227a9eae Nick Terrell 2017-08-04  184  
5d2405227a9eae Nick Terrell 2017-08-04  185  		do {
5d2405227a9eae Nick Terrell 2017-08-04  186  			v1 = xxh64_round(v1, get_unaligned_le64(p));
5d2405227a9eae Nick Terrell 2017-08-04  187  			p += 8;
5d2405227a9eae Nick Terrell 2017-08-04  188  			v2 = xxh64_round(v2, get_unaligned_le64(p));
5d2405227a9eae Nick Terrell 2017-08-04  189  			p += 8;
5d2405227a9eae Nick Terrell 2017-08-04  190  			v3 = xxh64_round(v3, get_unaligned_le64(p));
5d2405227a9eae Nick Terrell 2017-08-04  191  			p += 8;
5d2405227a9eae Nick Terrell 2017-08-04  192  			v4 = xxh64_round(v4, get_unaligned_le64(p));
5d2405227a9eae Nick Terrell 2017-08-04  193  			p += 8;
5d2405227a9eae Nick Terrell 2017-08-04  194  		} while (p <= limit);
5d2405227a9eae Nick Terrell 2017-08-04  195  
5d2405227a9eae Nick Terrell 2017-08-04  196  		h64 = xxh_rotl64(v1, 1) + xxh_rotl64(v2, 7) +
5d2405227a9eae Nick Terrell 2017-08-04  197  			xxh_rotl64(v3, 12) + xxh_rotl64(v4, 18);
5d2405227a9eae Nick Terrell 2017-08-04  198  		h64 = xxh64_merge_round(h64, v1);
5d2405227a9eae Nick Terrell 2017-08-04  199  		h64 = xxh64_merge_round(h64, v2);
5d2405227a9eae Nick Terrell 2017-08-04  200  		h64 = xxh64_merge_round(h64, v3);
5d2405227a9eae Nick Terrell 2017-08-04  201  		h64 = xxh64_merge_round(h64, v4);
5d2405227a9eae Nick Terrell 2017-08-04  202  
5d2405227a9eae Nick Terrell 2017-08-04  203  	} else {
5d2405227a9eae Nick Terrell 2017-08-04  204  		h64  = seed + PRIME64_5;
5d2405227a9eae Nick Terrell 2017-08-04  205  	}
5d2405227a9eae Nick Terrell 2017-08-04  206  
5d2405227a9eae Nick Terrell 2017-08-04  207  	h64 += (uint64_t)len;
5d2405227a9eae Nick Terrell 2017-08-04  208  
5d2405227a9eae Nick Terrell 2017-08-04  209  	while (p + 8 <= b_end) {
5d2405227a9eae Nick Terrell 2017-08-04  210  		const uint64_t k1 = xxh64_round(0, get_unaligned_le64(p));
5d2405227a9eae Nick Terrell 2017-08-04  211  
5d2405227a9eae Nick Terrell 2017-08-04  212  		h64 ^= k1;
5d2405227a9eae Nick Terrell 2017-08-04  213  		h64 = xxh_rotl64(h64, 27) * PRIME64_1 + PRIME64_4;
5d2405227a9eae Nick Terrell 2017-08-04  214  		p += 8;
5d2405227a9eae Nick Terrell 2017-08-04  215  	}
5d2405227a9eae Nick Terrell 2017-08-04  216  
5d2405227a9eae Nick Terrell 2017-08-04  217  	if (p + 4 <= b_end) {
5d2405227a9eae Nick Terrell 2017-08-04  218  		h64 ^= (uint64_t)(get_unaligned_le32(p)) * PRIME64_1;
5d2405227a9eae Nick Terrell 2017-08-04  219  		h64 = xxh_rotl64(h64, 23) * PRIME64_2 + PRIME64_3;
5d2405227a9eae Nick Terrell 2017-08-04  220  		p += 4;
5d2405227a9eae Nick Terrell 2017-08-04  221  	}
5d2405227a9eae Nick Terrell 2017-08-04  222  
5d2405227a9eae Nick Terrell 2017-08-04  223  	while (p < b_end) {
5d2405227a9eae Nick Terrell 2017-08-04  224  		h64 ^= (*p) * PRIME64_5;
5d2405227a9eae Nick Terrell 2017-08-04  225  		h64 = xxh_rotl64(h64, 11) * PRIME64_1;
5d2405227a9eae Nick Terrell 2017-08-04  226  		p++;
5d2405227a9eae Nick Terrell 2017-08-04  227  	}
5d2405227a9eae Nick Terrell 2017-08-04  228  
5d2405227a9eae Nick Terrell 2017-08-04  229  	h64 ^= h64 >> 33;
5d2405227a9eae Nick Terrell 2017-08-04  230  	h64 *= PRIME64_2;
5d2405227a9eae Nick Terrell 2017-08-04  231  	h64 ^= h64 >> 29;
5d2405227a9eae Nick Terrell 2017-08-04  232  	h64 *= PRIME64_3;
5d2405227a9eae Nick Terrell 2017-08-04  233  	h64 ^= h64 >> 32;
5d2405227a9eae Nick Terrell 2017-08-04  234  
5d2405227a9eae Nick Terrell 2017-08-04  235  	return h64;
5d2405227a9eae Nick Terrell 2017-08-04 @236  }
5d2405227a9eae Nick Terrell 2017-08-04  237  EXPORT_SYMBOL(xxh64);
5d2405227a9eae Nick Terrell 2017-08-04  238  

:::::: The code at line 236 was first introduced by commit
:::::: 5d2405227a9eaea48e8cc95756a06d407b11f141 lib: Add xxhash module

:::::: TO: Nick Terrell <terrelln@fb.com>
:::::: CC: Chris Mason <clm@fb.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
