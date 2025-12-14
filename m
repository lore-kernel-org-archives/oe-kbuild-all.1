Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68E65194C96
	for <oe-kbuild-all@lists.linux.dev>; Sun, 14 Dec 2025 16:13:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765728805; cv=none; b=e2warX+vRMZVcm+n/F1yYbC4xWTvaadgkasRNFsbt9Mtj3aKoENz8wYZHalaGvI7T2ov2/CmQageCSt5Up+4uxAB5stozmKyVKDtBGedVYa6i4VUVllMHTPXBcaH2BycfVi+Ak218/tpJpjNGbJ6ai7xG3W2z2p1Bcciyg59gus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765728805; c=relaxed/simple;
	bh=0gRsEbTxVjzPXxweu91TJsIhDn07hCsR40Yt4Z4Z1yI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=C5lz1plSdLvDA0gUEIZ+3Nc7mQXGK/0J08XScwuWKpTLZ2ukCWYKsFCTviHT6DxNXG+vBXIvljZmBnNjbXCibYIfczb7CkAqd7HU8aiaIJICBlHuAbzFDTZ1FYzC2dFWjSgisGKhkhOXvTtQvqmwtiOg9OC1EhbShX9ubE4fXD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BzILbXqt; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BzILbXqt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765728803; x=1797264803;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0gRsEbTxVjzPXxweu91TJsIhDn07hCsR40Yt4Z4Z1yI=;
  b=BzILbXqtsv3op7Eq5Q86GODiLlRSdwoMs/lf/8Ql26Js+hl9doPQC1U2
   OdA8SmzDde3MQO5GGj9q0UmSD7k8fJsjadMJvgdxRWOpG8qe27PFWas1k
   YjHRSxiFU9nH9ruuTadvmP6FN7VTG6CtAzXH5hdRnvmf4kqPsC9Ca0EEr
   /q6NT5/eIz2FJU83ILTO+y+OCXFiWT0g0ZfIRae2g0HAZzgKXnUPTu2NQ
   b3YAVA3EazdxClBkTYPEAS0etmbly1haw6VZfRggdRanFL8PIN5DVL3st
   Dm+UYiZC36r69JZkDowOCLS3AZimjm7EOMab3sAfHHnwg/fxK9wDZuVBZ
   A==;
X-CSE-ConnectionGUID: /S7p3Q7sSe+wYLmeWbpijg==
X-CSE-MsgGUID: DlPFvN8dQWyJxIf7lM7Kjg==
X-IronPort-AV: E=McAfee;i="6800,10657,11635"; a="67588485"
X-IronPort-AV: E=Sophos;i="6.20,256,1758610800"; 
   d="scan'208";a="67588485"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 08:13:21 -0800
X-CSE-ConnectionGUID: mpczaMLsTqiOjXuXLEzX3Q==
X-CSE-MsgGUID: H4Rl/8rnR1a7URETeN164A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,148,1763452800"; 
   d="scan'208";a="201714256"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 14 Dec 2025 08:13:20 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vUoij-000000009A3-33pk;
	Sun, 14 Dec 2025 16:13:17 +0000
Date: Mon, 15 Dec 2025 00:12:31 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: lib/zstd/compress/zstd_fast.c:749:28: sparse: sparse: Using plain
 integer as NULL pointer
Message-ID: <202512150029.nhy0I8N4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f0b4cce4481fb22653697cced8d0d04027cb1e8
commit: 65d1f5507ed2c78c64fce40e44e5574a9419eb09 zstd: Import upstream v1.5.7
date:   9 months ago
config: i386-randconfig-063-20251214 (https://download.01.org/0day-ci/archive/20251215/202512150029.nhy0I8N4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251215/202512150029.nhy0I8N4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512150029.nhy0I8N4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/zstd/compress/zstd_fast.c:749:28: sparse: sparse: Using plain integer as NULL pointer

vim +749 lib/zstd/compress/zstd_fast.c

   704	
   705	
   706	static
   707	ZSTD_ALLOW_POINTER_OVERFLOW_ATTR
   708	size_t ZSTD_compressBlock_fast_extDict_generic(
   709	        ZSTD_MatchState_t* ms, SeqStore_t* seqStore, U32 rep[ZSTD_REP_NUM],
   710	        void const* src, size_t srcSize, U32 const mls, U32 const hasStep)
   711	{
   712	    const ZSTD_compressionParameters* const cParams = &ms->cParams;
   713	    U32* const hashTable = ms->hashTable;
   714	    U32 const hlog = cParams->hashLog;
   715	    /* support stepSize of 0 */
   716	    size_t const stepSize = cParams->targetLength + !(cParams->targetLength) + 1;
   717	    const BYTE* const base = ms->window.base;
   718	    const BYTE* const dictBase = ms->window.dictBase;
   719	    const BYTE* const istart = (const BYTE*)src;
   720	    const BYTE* anchor = istart;
   721	    const U32   endIndex = (U32)((size_t)(istart - base) + srcSize);
   722	    const U32   lowLimit = ZSTD_getLowestMatchIndex(ms, endIndex, cParams->windowLog);
   723	    const U32   dictStartIndex = lowLimit;
   724	    const BYTE* const dictStart = dictBase + dictStartIndex;
   725	    const U32   dictLimit = ms->window.dictLimit;
   726	    const U32   prefixStartIndex = dictLimit < lowLimit ? lowLimit : dictLimit;
   727	    const BYTE* const prefixStart = base + prefixStartIndex;
   728	    const BYTE* const dictEnd = dictBase + prefixStartIndex;
   729	    const BYTE* const iend = istart + srcSize;
   730	    const BYTE* const ilimit = iend - 8;
   731	    U32 offset_1=rep[0], offset_2=rep[1];
   732	    U32 offsetSaved1 = 0, offsetSaved2 = 0;
   733	
   734	    const BYTE* ip0 = istart;
   735	    const BYTE* ip1;
   736	    const BYTE* ip2;
   737	    const BYTE* ip3;
   738	    U32 current0;
   739	
   740	
   741	    size_t hash0; /* hash for ip0 */
   742	    size_t hash1; /* hash for ip1 */
   743	    U32 idx; /* match idx for ip0 */
   744	    const BYTE* idxBase; /* base pointer for idx */
   745	
   746	    U32 offcode;
   747	    const BYTE* match0;
   748	    size_t mLength;
 > 749	    const BYTE* matchEnd = 0; /* initialize to avoid warning, assert != 0 later */
   750	
   751	    size_t step;
   752	    const BYTE* nextStep;
   753	    const size_t kStepIncr = (1 << (kSearchStrength - 1));
   754	
   755	    (void)hasStep; /* not currently specialized on whether it's accelerated */
   756	
   757	    DEBUGLOG(5, "ZSTD_compressBlock_fast_extDict_generic (offset_1=%u)", offset_1);
   758	
   759	    /* switch to "regular" variant if extDict is invalidated due to maxDistance */
   760	    if (prefixStartIndex == dictStartIndex)
   761	        return ZSTD_compressBlock_fast(ms, seqStore, rep, src, srcSize);
   762	
   763	    {   U32 const curr = (U32)(ip0 - base);
   764	        U32 const maxRep = curr - dictStartIndex;
   765	        if (offset_2 >= maxRep) offsetSaved2 = offset_2, offset_2 = 0;
   766	        if (offset_1 >= maxRep) offsetSaved1 = offset_1, offset_1 = 0;
   767	    }
   768	
   769	    /* start each op */
   770	_start: /* Requires: ip0 */
   771	
   772	    step = stepSize;
   773	    nextStep = ip0 + kStepIncr;
   774	
   775	    /* calculate positions, ip0 - anchor == 0, so we skip step calc */
   776	    ip1 = ip0 + 1;
   777	    ip2 = ip0 + step;
   778	    ip3 = ip2 + 1;
   779	
   780	    if (ip3 >= ilimit) {
   781	        goto _cleanup;
   782	    }
   783	
   784	    hash0 = ZSTD_hashPtr(ip0, hlog, mls);
   785	    hash1 = ZSTD_hashPtr(ip1, hlog, mls);
   786	
   787	    idx = hashTable[hash0];
   788	    idxBase = idx < prefixStartIndex ? dictBase : base;
   789	
   790	    do {
   791	        {   /* load repcode match for ip[2] */
   792	            U32 const current2 = (U32)(ip2 - base);
   793	            U32 const repIndex = current2 - offset_1;
   794	            const BYTE* const repBase = repIndex < prefixStartIndex ? dictBase : base;
   795	            U32 rval;
   796	            if ( ((U32)(prefixStartIndex - repIndex) >= 4) /* intentional underflow */
   797	                 & (offset_1 > 0) ) {
   798	                rval = MEM_read32(repBase + repIndex);
   799	            } else {
   800	                rval = MEM_read32(ip2) ^ 1; /* guaranteed to not match. */
   801	            }
   802	
   803	            /* write back hash table entry */
   804	            current0 = (U32)(ip0 - base);
   805	            hashTable[hash0] = current0;
   806	
   807	            /* check repcode at ip[2] */
   808	            if (MEM_read32(ip2) == rval) {
   809	                ip0 = ip2;
   810	                match0 = repBase + repIndex;
   811	                matchEnd = repIndex < prefixStartIndex ? dictEnd : iend;
   812	                assert((match0 != prefixStart) & (match0 != dictStart));
   813	                mLength = ip0[-1] == match0[-1];
   814	                ip0 -= mLength;
   815	                match0 -= mLength;
   816	                offcode = REPCODE1_TO_OFFBASE;
   817	                mLength += 4;
   818	                goto _match;
   819	        }   }
   820	
   821	        {   /* load match for ip[0] */
   822	            U32 const mval = idx >= dictStartIndex ?
   823	                    MEM_read32(idxBase + idx) :
   824	                    MEM_read32(ip0) ^ 1; /* guaranteed not to match */
   825	
   826	            /* check match at ip[0] */
   827	            if (MEM_read32(ip0) == mval) {
   828	                /* found a match! */
   829	                goto _offset;
   830	        }   }
   831	
   832	        /* lookup ip[1] */
   833	        idx = hashTable[hash1];
   834	        idxBase = idx < prefixStartIndex ? dictBase : base;
   835	
   836	        /* hash ip[2] */
   837	        hash0 = hash1;
   838	        hash1 = ZSTD_hashPtr(ip2, hlog, mls);
   839	
   840	        /* advance to next positions */
   841	        ip0 = ip1;
   842	        ip1 = ip2;
   843	        ip2 = ip3;
   844	
   845	        /* write back hash table entry */
   846	        current0 = (U32)(ip0 - base);
   847	        hashTable[hash0] = current0;
   848	
   849	        {   /* load match for ip[0] */
   850	            U32 const mval = idx >= dictStartIndex ?
   851	                    MEM_read32(idxBase + idx) :
   852	                    MEM_read32(ip0) ^ 1; /* guaranteed not to match */
   853	
   854	            /* check match at ip[0] */
   855	            if (MEM_read32(ip0) == mval) {
   856	                /* found a match! */
   857	                goto _offset;
   858	        }   }
   859	
   860	        /* lookup ip[1] */
   861	        idx = hashTable[hash1];
   862	        idxBase = idx < prefixStartIndex ? dictBase : base;
   863	
   864	        /* hash ip[2] */
   865	        hash0 = hash1;
   866	        hash1 = ZSTD_hashPtr(ip2, hlog, mls);
   867	
   868	        /* advance to next positions */
   869	        ip0 = ip1;
   870	        ip1 = ip2;
   871	        ip2 = ip0 + step;
   872	        ip3 = ip1 + step;
   873	
   874	        /* calculate step */
   875	        if (ip2 >= nextStep) {
   876	            step++;
   877	            PREFETCH_L1(ip1 + 64);
   878	            PREFETCH_L1(ip1 + 128);
   879	            nextStep += kStepIncr;
   880	        }
   881	    } while (ip3 < ilimit);
   882	
   883	_cleanup:
   884	    /* Note that there are probably still a couple positions we could search.
   885	     * However, it seems to be a meaningful performance hit to try to search
   886	     * them. So let's not. */
   887	
   888	    /* If offset_1 started invalid (offsetSaved1 != 0) and became valid (offset_1 != 0),
   889	     * rotate saved offsets. See comment in ZSTD_compressBlock_fast_noDict for more context. */
   890	    offsetSaved2 = ((offsetSaved1 != 0) && (offset_1 != 0)) ? offsetSaved1 : offsetSaved2;
   891	
   892	    /* save reps for next block */
   893	    rep[0] = offset_1 ? offset_1 : offsetSaved1;
   894	    rep[1] = offset_2 ? offset_2 : offsetSaved2;
   895	
   896	    /* Return the last literals size */
   897	    return (size_t)(iend - anchor);
   898	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
