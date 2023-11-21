Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 209944778A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 10:47:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W96D65MR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700563635; x=1732099635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MAEu74jUZlO6I38mqBXIouZoOIhbLcJm5SGLvVuiuXs=;
  b=W96D65MROt1gVhx1qA6RuhHWJgjmiiDrn01OuUEqFvfCJlSdmtKgGMDZ
   nw3606lYBDz8Rg7NU/6p50cR/fu8mAC0EiShn8MmGb5YBTkFfu8LPmmqa
   yFIj7OsG8uVJrwwoX8OcjFS7M6DpwyHHSq2KmxGxzU7X1JQhDDsvuqaO1
   VbCQKClESsjxMKYOv/Q4lQWtleSKGAe4YpHjyFHDr79uYEWxUmyFpMEx5
   MHLlCghoH2vrUzeYzd76pIz4MPLZlhYrPIQgpob/kYZPt+qfY68gmztSq
   PxbEw/3Ck3AdrrSh8hlrM9nOoQx1bAjupzUFnIQljlawvLat/2w7ePnt6
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="456148185"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="456148185"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 02:47:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="890216951"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="890216951"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by orsmga004.jf.intel.com with ESMTP; 21 Nov 2023 02:47:14 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5OHb-0007hm-1M;
	Tue, 21 Nov 2023 10:47:09 +0000
Date: Tue, 21 Nov 2023 18:45:17 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@meta.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2144/2217]
 lib/zstd/decompress/../common/bits.h:59 ZSTD_countLeadingZeros32() warn:
 inconsistent indenting
Message-ID: <202311211857.NFL6O9OG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   07b677953b9dca02928be323e2db853511305fa9
commit: 98988fc8e9edc4da5825b3dd5544880c210a8738 [2144/2217] zstd: import upstream v1.5.5
config: x86_64-randconfig-161-20231121 (https://download.01.org/0day-ci/archive/20231121/202311211857.NFL6O9OG-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce: (https://download.01.org/0day-ci/archive/20231121/202311211857.NFL6O9OG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211857.NFL6O9OG-lkp@intel.com/

New smatch warnings:
lib/zstd/decompress/../common/bits.h:59 ZSTD_countLeadingZeros32() warn: inconsistent indenting
lib/zstd/decompress/../common/bits.h:59 ZSTD_countLeadingZeros32() warn: inconsistent indenting
lib/zstd/decompress/../common/bits.h:69 ZSTD_countTrailingZeros64() warn: inconsistent indenting
lib/zstd/common/bits.h:33 ZSTD_countTrailingZeros32() warn: inconsistent indenting
lib/zstd/common/bits.h:59 ZSTD_countLeadingZeros32() warn: inconsistent indenting
lib/zstd/decompress/../common/bits.h:59 ZSTD_countLeadingZeros32() warn: inconsistent indenting
lib/zstd/common/bits.h:59 ZSTD_countLeadingZeros32() warn: inconsistent indenting
lib/zstd/compress/../common/bits.h:59 ZSTD_countLeadingZeros32() warn: inconsistent indenting
lib/zstd/compress/../common/bits.h:69 ZSTD_countTrailingZeros64() warn: inconsistent indenting
lib/zstd/compress/../common/bits.h:33 ZSTD_countTrailingZeros32() warn: inconsistent indenting
lib/zstd/compress/../common/bits.h:87 ZSTD_countLeadingZeros64() warn: inconsistent indenting
lib/zstd/compress/../common/bits.h:59 ZSTD_countLeadingZeros32() warn: inconsistent indenting
lib/zstd/compress/../common/bits.h:59 ZSTD_countLeadingZeros32() warn: inconsistent indenting
lib/zstd/compress/../common/bits.h:69 ZSTD_countTrailingZeros64() warn: inconsistent indenting
lib/zstd/compress/../common/bits.h:33 ZSTD_countTrailingZeros32() warn: inconsistent indenting
lib/zstd/compress/../common/bits.h:87 ZSTD_countLeadingZeros64() warn: inconsistent indenting
lib/zstd/compress/../common/bits.h:59 ZSTD_countLeadingZeros32() warn: inconsistent indenting
lib/zstd/compress/../common/bits.h:69 ZSTD_countTrailingZeros64() warn: inconsistent indenting
lib/zstd/compress/../common/bits.h:33 ZSTD_countTrailingZeros32() warn: inconsistent indenting
lib/zstd/compress/../common/bits.h:87 ZSTD_countLeadingZeros64() warn: inconsistent indenting
lib/zstd/compress/../common/bits.h:69 ZSTD_countTrailingZeros64() warn: inconsistent indenting
lib/zstd/compress/../common/bits.h:33 ZSTD_countTrailingZeros32() warn: inconsistent indenting
lib/zstd/compress/../common/bits.h:87 ZSTD_countLeadingZeros64() warn: inconsistent indenting
lib/zstd/compress/../common/bits.h:59 ZSTD_countLeadingZeros32() warn: inconsistent indenting

Old smatch warnings:
lib/zstd/decompress/huf_decompress.c:617 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead of &
lib/zstd/decompress/huf_decompress.c:617 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead of &
lib/zstd/decompress/huf_decompress.c:1375 HUF_decompress4X2_usingDTable_internal_body() warn: maybe use && instead of &
lib/zstd/decompress/huf_decompress.c:1375 HUF_decompress4X2_usingDTable_internal_body() warn: maybe use && instead of &
lib/zstd/decompress/zstd_decompress_block.c:906 ZSTD_execSequenceEnd() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:954 ZSTD_execSequenceEndSplitLitBuffer() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:1607 ZSTD_decompressSequences_body() warn: inconsistent indenting
lib/zstd/decompress/zstd_decompress_block.c:1026 ZSTD_execSequence() warn: inconsistent indenting
lib/zstd/compress/zstd_compress.c:5210 ZSTD_initCDict_internal() warn: inconsistent indenting
lib/zstd/compress/zstd_opt.c:1307 ZSTD_compressBlock_opt_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_lazy.c:1606 ZSTD_compressBlock_lazy_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:1634 ZSTD_compressBlock_lazy_generic() warn: Function too hairy.  No more merges.
lib/zstd/compress/zstd_lazy.c:1956 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:1987 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:1997 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:2029 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:2083 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented

vim +59 lib/zstd/decompress/../common/bits.h

    54	
    55	MEM_STATIC unsigned ZSTD_countLeadingZeros32(U32 val)
    56	{
    57	    assert(val != 0);
    58	#   if (__GNUC__ >= 4)
  > 59	        return (unsigned)__builtin_clz(val);
    60	#   else
    61	        return ZSTD_countLeadingZeros32_fallback(val);
    62	#   endif
    63	}
    64	
    65	MEM_STATIC unsigned ZSTD_countTrailingZeros64(U64 val)
    66	{
    67	    assert(val != 0);
    68	#   if (__GNUC__ >= 4) && defined(__LP64__)
  > 69	        return (unsigned)__builtin_ctzll(val);
    70	#   else
    71	        {
    72	            U32 mostSignificantWord = (U32)(val >> 32);
    73	            U32 leastSignificantWord = (U32)val;
    74	            if (leastSignificantWord == 0) {
    75	                return 32 + ZSTD_countTrailingZeros32(mostSignificantWord);
    76	            } else {
    77	                return ZSTD_countTrailingZeros32(leastSignificantWord);
    78	            }
    79	        }
    80	#   endif
    81	}
    82	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
