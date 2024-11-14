Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83A5118028
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Nov 2024 00:44:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731545046; cv=none; b=cwl5ZrQhZO+tZ5LO1CijHs94h3bmiidIuT55rZhcz9l0xyjxeZG0+legzfBelkkFLuawTXftKvflJpH+K6MiyFBNUeIUNfossfzDSsjsQI8jJ5aF2n/EAWsCh5oJ5Hc8lftcrso0WwG8O2lPZ0OPd7t6A5jHKys6u/XYWFi5s7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731545046; c=relaxed/simple;
	bh=wZKcNg8LFDIwaQTDhBlFfR4PYpdvasIG96SmqH/XBIY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ro8Tb/PIif3dWJExUkSd4GJCyj/CMefIjvEtQZ0rce0+HFHdgR/k+BgQVf6VnP88jZyqjAKfUZV2t2zgGorbsBZiSHBjlF7+YDS+3SADL9Luvxxc9r+la9Fbfe9CJ9VJJ18VIq+rtSyHdCgVAk57K+Uys/tRT8xYllpo6yaQgNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fyTNy7Ub; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fyTNy7Ub"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731545044; x=1763081044;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=wZKcNg8LFDIwaQTDhBlFfR4PYpdvasIG96SmqH/XBIY=;
  b=fyTNy7UbojRq3xWmI5Awv695GlXQ9kwimqnLiGVhJd/8fsBKxO6flITP
   CaKNvEKdCKAFqkG5Ycz2JAy2ORLzcDBsDp6OFhqxeUQODP9y8QMYzDLye
   drAeL7OlUzA+f/zz275HUnScUcHtyfgjcUe1DzZceD9evHvr9yPXPzqa1
   6KwtoNUKV7+9rNJg+DlW8Yao37apdqUdo+dnN2MP5ANKEOepfRCLrK7td
   LE60KZkcnxMPaWm0zaGPhOVNkwGyLBLPXRbk8VYDaw7UrC5Ad23BcRo7M
   xn9J3zAAkye7om16xnDwiVm3+yUWWVz+UwJbGU8Kob2uBz/uGb2a7Xo/Q
   g==;
X-CSE-ConnectionGUID: iYuqXQIcT1yhmgtHmqyHtg==
X-CSE-MsgGUID: Osf2gSgHRrSPpcEe85nffw==
X-IronPort-AV: E=McAfee;i="6700,10204,11255"; a="30852739"
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="30852739"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2024 16:44:03 -0800
X-CSE-ConnectionGUID: h0UROXquRcCYDFGtc4eslw==
X-CSE-MsgGUID: ddJbYWvpRAyXSGcDnROa8g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,152,1728975600"; 
   d="scan'208";a="88459118"
Received: from lkp-server01.sh.intel.com (HELO 80bd855f15b3) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2024 16:36:58 -0800
Received: from kbuild by 80bd855f15b3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tBNqy-0000yd-0b;
	Thu, 14 Nov 2024 00:36:56 +0000
Date: Thu, 14 Nov 2024 08:36:34 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@meta.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 60/11277]
 arch/s390/include/uapi/../../../../lib/zstd/common/bits.h:33
 ZSTD_countTrailingZeros32() warn: inconsistent indenting
Message-ID: <202411140822.GvSdkxiA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bd05b9a700c10473c2f52bf12c5c5938c30e80b0
commit: 98988fc8e9edc4da5825b3dd5544880c210a8738 [60/11277] zstd: import upstream v1.5.5
config: s390-randconfig-r073-20241112 (https://download.01.org/0day-ci/archive/20241114/202411140822.GvSdkxiA-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411140822.GvSdkxiA-lkp@intel.com/

New smatch warnings:
arch/s390/include/uapi/../../../../lib/zstd/common/bits.h:33 ZSTD_countTrailingZeros32() warn: inconsistent indenting
arch/s390/include/uapi/../../../../lib/zstd/common/bits.h:59 ZSTD_countLeadingZeros32() warn: inconsistent indenting
arch/s390/include/uapi/../../../../lib/zstd/common/bits.h:69 ZSTD_countTrailingZeros64() warn: inconsistent indenting

Old smatch warnings:
arch/s390/include/uapi/../../../../lib/zstd/decompress/huf_decompress.c:617 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead of &
arch/s390/include/uapi/../../../../lib/zstd/decompress/huf_decompress.c:617 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead of &
arch/s390/include/uapi/../../../../lib/zstd/decompress/huf_decompress.c:1375 HUF_decompress4X2_usingDTable_internal_body() warn: maybe use && instead of &
arch/s390/include/uapi/../../../../lib/zstd/decompress/huf_decompress.c:1375 HUF_decompress4X2_usingDTable_internal_body() warn: maybe use && instead of &
arch/s390/include/uapi/../../../../lib/zstd/decompress/zstd_decompress_internal.h:209 ZSTD_DCtx_get_bmi2() warn: inconsistent indenting
arch/s390/include/uapi/../../../../lib/zstd/decompress/zstd_decompress_block.c:906 ZSTD_execSequenceEnd() warn: inconsistent indenting
arch/s390/include/uapi/../../../../lib/zstd/decompress/zstd_decompress_block.c:954 ZSTD_execSequenceEndSplitLitBuffer() warn: inconsistent indenting
arch/s390/include/uapi/../../../../lib/zstd/decompress/zstd_decompress_block.c:1026 ZSTD_execSequence() warn: inconsistent indenting

vim +33 arch/s390/include/uapi/../../../../lib/zstd/common/bits.h

    28	
    29	MEM_STATIC unsigned ZSTD_countTrailingZeros32(U32 val)
    30	{
    31	    assert(val != 0);
    32	#   if (__GNUC__ >= 4)
  > 33	        return (unsigned)__builtin_ctz(val);
    34	#   else
    35	        return ZSTD_countTrailingZeros32_fallback(val);
    36	#   endif
    37	}
    38	
    39	MEM_STATIC unsigned ZSTD_countLeadingZeros32_fallback(U32 val) {
    40	    assert(val != 0);
    41	    {
    42	        static const U32 DeBruijnClz[32] = {0, 9, 1, 10, 13, 21, 2, 29,
    43	                                            11, 14, 16, 18, 22, 25, 3, 30,
    44	                                            8, 12, 20, 28, 15, 17, 24, 7,
    45	                                            19, 27, 23, 6, 26, 5, 4, 31};
    46	        val |= val >> 1;
    47	        val |= val >> 2;
    48	        val |= val >> 4;
    49	        val |= val >> 8;
    50	        val |= val >> 16;
    51	        return 31 - DeBruijnClz[(val * 0x07C4ACDDU) >> 27];
    52	    }
    53	}
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
