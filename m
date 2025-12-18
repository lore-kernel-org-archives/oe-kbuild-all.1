Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 025A63376BC
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Dec 2025 13:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766065632; cv=none; b=srCn/otcPuVJn+mR8YjpCIkKlgRc8JjwO/izh5qXLj8y56wcMM5x/3C6V74QdyqMCB8JRR57Qq8S9Ag9asgZCQkBpSYDuzc5i/PhC7tggg1Gbqb24Q3sz5W9eG4WWjGl6KFu3oU3R1Pj8dgLWjtqudjpsKkLp+xRxSi1GWCHlks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766065632; c=relaxed/simple;
	bh=MIVgmnxLW7bDASW5DCA3jZGUpbGU0pcUrtA4BHDjfss=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uUxjt+uSbeOb2k6LG7q+nce3e+GOvuPwSQvERUm6r332T1MFtsJGvc6V6C0Goywh+F5y3wYbaIQvtr78UFJSxpHohVe4aHH1zO/IJyWEmnMfvRAPd1IeiaIJxsGpb9eOGlT8HuFToU8RdPi8tg2FLDFL51BHaqn85W8sUVL1Ekk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=OpAQGf7L; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OpAQGf7L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766065627; x=1797601627;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MIVgmnxLW7bDASW5DCA3jZGUpbGU0pcUrtA4BHDjfss=;
  b=OpAQGf7LDltoBoOVA68JGialHecam9CcLqsPCCgtxjyLfquQdmWPVbP+
   LWvLc2XN+q5Z2+i9GDoiJpeugto/ELzuxAgU1XHY5HE4sh/34jazJCG/c
   fUOLZShG9lmLgwccIt4Nk3t6xLtVFtoo7VWQRhfjygsgMyfXkuzrlgCx6
   WwRyyM36mNjGDMnQmrmVb4dml0tE0oEzBbAwsaMNOkX3Ha9TBgc5XeoMb
   m1pAO03pL4HmsGUqEWVmCbHrRS7nPgaxrj3ck5hoZ60OtHfmssUR9Fk7/
   g/eugE07mlkFSHU1bq1ditvbyOLK7Nv0FgG/NCihJAla1LzYIDgYWzBfx
   w==;
X-CSE-ConnectionGUID: nhgf9HuSTPaO8Nk5V5Tolw==
X-CSE-MsgGUID: UldfiLYPSdWzTYWaemCvvw==
X-IronPort-AV: E=McAfee;i="6800,10657,11646"; a="67896107"
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="67896107"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Dec 2025 05:47:06 -0800
X-CSE-ConnectionGUID: TdRSZSJmTEWMuZceu4CPFw==
X-CSE-MsgGUID: EiDCIpGEQEOl/8+yhcoeGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,158,1763452800"; 
   d="scan'208";a="202993983"
Received: from lkp-server01.sh.intel.com (HELO 0d09efa1b85f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 18 Dec 2025 05:47:05 -0800
Received: from kbuild by 0d09efa1b85f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vWELP-0000000029b-0xTa;
	Thu, 18 Dec 2025 13:47:03 +0000
Date: Thu, 18 Dec 2025 21:46:07 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: arch/s390/include/uapi/../../../../lib/zstd/decompress/zstd_decompress_block.c:1987
 ZSTD_decompressSequencesLong() warn: inconsistent indenting
Message-ID: <202512182148.VEOkRdHi-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ea1013c1539270e372fc99854bc6e4d94eaeff66
commit: 65d1f5507ed2c78c64fce40e44e5574a9419eb09 zstd: Import upstream v1.5.7
date:   9 months ago
config: s390-randconfig-r072-20251217 (https://download.01.org/0day-ci/archive/20251218/202512182148.VEOkRdHi-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.5.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512182148.VEOkRdHi-lkp@intel.com/

New smatch warnings:
arch/s390/include/uapi/../../../../lib/zstd/decompress/zstd_decompress_block.c:1987 ZSTD_decompressSequencesLong() warn: inconsistent indenting

Old smatch warnings:
arch/s390/include/uapi/../../../../lib/zstd/decompress/huf_decompress.c:650 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead of &
arch/s390/include/uapi/../../../../lib/zstd/decompress/huf_decompress.c:650 HUF_decompress4X1_usingDTable_internal_body() warn: maybe use && instead of &
arch/s390/include/uapi/../../../../lib/zstd/decompress/huf_decompress.c:1431 HUF_decompress4X2_usingDTable_internal_body() warn: maybe use && instead of &
arch/s390/include/uapi/../../../../lib/zstd/decompress/huf_decompress.c:1431 HUF_decompress4X2_usingDTable_internal_body() warn: maybe use && instead of &
arch/s390/include/uapi/../../../../lib/zstd/decompress/zstd_decompress_block.c:941 ZSTD_execSequenceEnd() warn: inconsistent indenting
arch/s390/include/uapi/../../../../lib/zstd/decompress/zstd_decompress_block.c:990 ZSTD_execSequenceEndSplitLitBuffer() warn: inconsistent indenting
arch/s390/include/uapi/../../../../lib/zstd/decompress/zstd_decompress_block.c:1063 ZSTD_execSequence() warn: inconsistent indenting

vim +1987 arch/s390/include/uapi/../../../../lib/zstd/decompress/zstd_decompress_block.c

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
