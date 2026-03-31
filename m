Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E134363C6C
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 04:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774933035; cv=none; b=YkJP/ssmWiu6hmZww3i1B+UZXiJnvxmGPmL4+s/UNntZHlIBO6Ax+Me3BG1LQ4cr8pekBjHaGWV5GtZL/bFgx2s1JJ6DZC5iMikS4bRZ+s2fpIKRS52Uot0I5oZXKR1P6BS9K5tvxHiHPHsHS2rAE4WSzogG5WCnVEH9PUqPiDQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774933035; c=relaxed/simple;
	bh=c2IXxLtVqy0w7rxBHPgI813hBBprJq9Jpnqiuxjs8BM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=tpY2wFf1vA04LwgZs98QTJDPcWzfxqpFqzMfGOW36ZcwHRvoCvLCMlndkE/CphFwcHC4PMhhEwCh00Kte/oucf9mZq89FQaOUI8zEckbhKJvX2U7wVWl5W9fVi0/UrQIufGNWlP/li9yM/R3eTEpl/0MgAtkr1uw5VPUm/eZKE8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CdsEAtuO; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CdsEAtuO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774933034; x=1806469034;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=c2IXxLtVqy0w7rxBHPgI813hBBprJq9Jpnqiuxjs8BM=;
  b=CdsEAtuO+DTn3zhjQQ+23C9CAFifRCC+iZB/4GT1R2NW7vZTKKxQiMHh
   D7LIGJn970bdmwa8FSDcQhUROi/uiAtkc4uHUg0nojyprRp08gF0vu4zF
   FPcs2BqLiDnIHTv/7A1Qa+jTKJotEaLlO8leSrTZD7YUKuAp6evu9RuJt
   dwDuBqAVeygMO7gAuEI57AG11qQVD2CdxkB5PhKDzqU/076LFxGn7ruIG
   8C9AZaDNlyqh8ZxqDoxn/sc1CsD41S196V+VA6pPENcBRTw7uog/oJx2N
   tMGirrNEXA48NGHRx0Y4CwVzYCXMgtd8jmY/ZGLc60T+dobG3wjnfOUhB
   Q==;
X-CSE-ConnectionGUID: eUlygmtxSfiyIiCgIKf4/g==
X-CSE-MsgGUID: KzT/LD85Rdqu+KgNFd+2Ug==
X-IronPort-AV: E=McAfee;i="6800,10657,11744"; a="75820000"
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="75820000"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Mar 2026 21:57:12 -0700
X-CSE-ConnectionGUID: taco0K7TSkKhBGs4LyS4qQ==
X-CSE-MsgGUID: gC82dAgPTBqX3MlPwQVn7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,151,1770624000"; 
   d="scan'208";a="226217666"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 30 Mar 2026 21:57:11 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7RA3-000000002FZ-47Mg;
	Tue, 31 Mar 2026 04:57:07 +0000
Date: Tue, 31 Mar 2026 12:56:10 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: 
 =?us-ascii?Q?arch/x86/boot/compressed/../../../../lib/zstd/decompress/?=
 =?us-ascii?Q?zstd=5Fdecompress=5Fblock.c:1987?=
 ZSTD_decompressSequencesLong() warn: inconsistent indenting
Message-ID: <202603311222.GyaHIWkP-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d0c3bcd5b8976159d835a897254048e078f447e6
commit: 65d1f5507ed2c78c64fce40e44e5574a9419eb09 zstd: Import upstream v1.5.7
date:   1 year, 1 month ago
config: i386-randconfig-141-20260331 (https://download.01.org/0day-ci/archive/20260331/202603311222.GyaHIWkP-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603311222.GyaHIWkP-lkp@intel.com/

New smatch warnings:
arch/x86/boot/compressed/../../../../lib/zstd/decompress/zstd_decompress_block.c:1987 ZSTD_decompressSequencesLong() warn: inconsistent indenting

Old smatch warnings:
arch/x86/boot/compressed/../../../../lib/zstd/decompress/huf_decompress.c:650 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead of &
arch/x86/boot/compressed/../../../../lib/zstd/decompress/huf_decompress.c:650 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead of &
arch/x86/boot/compressed/../../../../lib/zstd/decompress/huf_decompress.c:1431 HUF_decompress4X2_usingDTable_internal_body() warn: maybe use && instead of &
arch/x86/boot/compressed/../../../../lib/zstd/decompress/huf_decompress.c:1431 HUF_decompress4X2_usingDTable_internal_body() warn: maybe use && instead of &
arch/x86/boot/compressed/../../../../lib/zstd/decompress/zstd_decompress_block.c:941 ZSTD_execSequenceEnd() warn: inconsistent indenting
arch/x86/boot/compressed/../../../../lib/zstd/decompress/zstd_decompress_block.c:990 ZSTD_execSequenceEndSplitLitBuffer() warn: inconsistent indenting
arch/x86/boot/compressed/../../../../lib/zstd/decompress/zstd_decompress_block.c:1063 ZSTD_execSequence() warn: inconsistent indenting
arch/x86/boot/compressed/misc.c:397 early_sev_detect() warn: bitwise AND condition is false here

vim +1987 arch/x86/boot/compressed/../../../../lib/zstd/decompress/zstd_decompress_block.c

  1967	
  1968	
  1969	#ifndef ZSTD_FORCE_DECOMPRESS_SEQUENCES_SHORT
  1970	/* ZSTD_decompressSequencesLong() :
  1971	 * decompression function triggered when a minimum share of offsets is considered "long",
  1972	 * aka out of cache.
  1973	 * note : "long" definition seems overloaded here, sometimes meaning "wider than bitstream register", and sometimes meaning "farther than memory cache distance".
  1974	 * This function will try to mitigate main memory latency through the use of prefetching */
  1975	static size_t
  1976	ZSTD_decompressSequencesLong(ZSTD_DCtx* dctx,
  1977	                             void* dst, size_t maxDstSize,
  1978	                             const void* seqStart, size_t seqSize, int nbSeq,
  1979	                             const ZSTD_longOffset_e isLongOffset)
  1980	{
  1981	    DEBUGLOG(5, "ZSTD_decompressSequencesLong");
  1982	#if DYNAMIC_BMI2
  1983	    if (ZSTD_DCtx_get_bmi2(dctx)) {
  1984	        return ZSTD_decompressSequencesLong_bmi2(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset);
  1985	    }
  1986	#endif
> 1987	  return ZSTD_decompressSequencesLong_default(dctx, dst, maxDstSize, seqStart, seqSize, nbSeq, isLongOffset);
  1988	}
  1989	#endif /* ZSTD_FORCE_DECOMPRESS_SEQUENCES_SHORT */
  1990	
  1991	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
