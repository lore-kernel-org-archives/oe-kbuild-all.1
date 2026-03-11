Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08AA02C08CF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Mar 2026 17:41:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773250906; cv=none; b=qDdw2VHT2P+GCcd6bQNE1NY0Pyu444LtappibcdfbpMcloVXMm2IdX/StwxpysTJQRhSIzEq+yg3Z0RORAAdUxB3IgniIX2JOmkczdRGb5g3gBX9jNZBM8J5mlb1YpAo2NRQFFN+FQea4Q0SE/CKWBU+ootVnijom3ETyu16qh8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773250906; c=relaxed/simple;
	bh=9ZaKh0iri1fmdXgdbaYifi4NzX9nTBi7j7obSFuGbPY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=HwGEutPc165I3iNI8w2uUZmnvOv3BBZusXjKSCuqofFOiJgPGK0viAwtBLVP/pqhnOYQWRuYwI0Je/NH3ycJXShh9db7Pj9E6Z2XWueEs+34AL12jv5NUQfmabQQHFb+zjx+N53ZWN69zQt5tKHEdDNfzJknhivRxv4OmLjkMf8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iYYYc9Ic; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iYYYc9Ic"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1773250903; x=1804786903;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9ZaKh0iri1fmdXgdbaYifi4NzX9nTBi7j7obSFuGbPY=;
  b=iYYYc9IcPPxsFC6nfy2tRi2NLi7w/FDLsMifI1gj9Pf9BIlwB3d/q+OI
   aJWP5I5dk7tjIdzqkDz6rR7WCItOqq/htrEc12kkqKrbndK1ZZtRynG5m
   uKRROB+Pp5M649mDnuOXYJuVDNWiZcIMLEnDtt8R+BW9TF0jcVzrNYn1o
   nZgNPVzJ0oyCbL6NXlthyr3FL8vqhvcvuXjBSsLfn6LoRLDRFoFGHX9hd
   9WtFnYZ0urok8iLkmLm0ozMhC6rngkej7T/Wdq6mI6ny9zJ283+AoDK3W
   WLrAp+fLJy6CtLwdKgVhDFDhxPJ5CGtgjTXuoSvTueKcXTtsJH9+rtw/d
   g==;
X-CSE-ConnectionGUID: eoDHrVCrS8Oe4tuzbkPcpA==
X-CSE-MsgGUID: D1dtRehRS+64DF+Zvp7iMQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11726"; a="74206842"
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="74206842"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Mar 2026 10:41:42 -0700
X-CSE-ConnectionGUID: mO3UrFmlReGcuP4DAtAQdQ==
X-CSE-MsgGUID: s1oJMKQNTQy64KE60W1cZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,113,1770624000"; 
   d="scan'208";a="223060515"
Received: from lkp-server01.sh.intel.com (HELO 418530b1a366) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 11 Mar 2026 10:41:41 -0700
Received: from kbuild by 418530b1a366 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w0NYw-000000001Vz-0shl;
	Wed, 11 Mar 2026 17:41:38 +0000
Date: Thu, 12 Mar 2026 01:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: 
 =?us-ascii?Q?arch/mips/boot/compressed/../../../../lib/zstd/decompress/?=
 =?us-ascii?Q?zstd=5Fdecompress=5Fblock.c:1987?=
 ZSTD_decompressSequencesLong() warn: inconsistent indenting
Message-ID: <202603120104.LrvEML06-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   b29fb8829bff243512bb8c8908fd39406f9fd4c3
commit: 65d1f5507ed2c78c64fce40e44e5574a9419eb09 zstd: Import upstream v1.5.7
date:   12 months ago
config: mips-randconfig-r073-20260311 (https://download.01.org/0day-ci/archive/20260312/202603120104.LrvEML06-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 14.3.0
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603120104.LrvEML06-lkp@intel.com/

New smatch warnings:
arch/mips/boot/compressed/../../../../lib/zstd/decompress/zstd_decompress_block.c:1987 ZSTD_decompressSequencesLong() warn: inconsistent indenting

Old smatch warnings:
arch/mips/boot/compressed/../../../../lib/zstd/decompress/huf_decompress.c:650 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead of &
arch/mips/boot/compressed/../../../../lib/zstd/decompress/huf_decompress.c:650 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead of &
arch/mips/boot/compressed/../../../../lib/zstd/decompress/huf_decompress.c:1431 HUF_decompress4X2_usingDTable_internal_body() warn: maybe use && instead of &
arch/mips/boot/compressed/../../../../lib/zstd/decompress/huf_decompress.c:1431 HUF_decompress4X2_usingDTable_internal_body() warn: maybe use && instead of &
arch/mips/boot/compressed/../../../../lib/zstd/decompress/zstd_decompress_block.c:941 ZSTD_execSequenceEnd() warn: inconsistent indenting
arch/mips/boot/compressed/../../../../lib/zstd/decompress/zstd_decompress_block.c:990 ZSTD_execSequenceEndSplitLitBuffer() warn: inconsistent indenting
arch/mips/boot/compressed/../../../../lib/zstd/decompress/zstd_decompress_block.c:1063 ZSTD_execSequence() warn: inconsistent indenting

vim +1987 arch/mips/boot/compressed/../../../../lib/zstd/decompress/zstd_decompress_block.c

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
