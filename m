Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BFFB27FD45
	for <oe-kbuild-all@lists.linux.dev>; Sat, 17 Jan 2026 09:35:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768642553; cv=none; b=brhZxkM+JRWPtRM/Ky+HBTJ0BQgB1wgR3/ddXtNseVb7N+u2gDy69KEp0MzWp3xXZtArroYKn9Z70d26r79YK1FRsi3vzuRHHw+G5EpSOOooNI3WwVZQgNKkn+w2EkEMrt+ZoneBtML/3J+0fub1Ec/l03lVp6/+E3sn72LNDro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768642553; c=relaxed/simple;
	bh=LD9IGE8iWK1MzOuadb1D1+1uHFn0+bZZ6B9gCx6UwI0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=W2wHxRRMgJ8cztYu5iGRBxK3k8aONNNqNT+h5nxdaGVM7WM5z57//+ZRL8qn2jWd5w0oalEN+EWHsJ4HuFpFwRLoDsifB5P5ulu4D47IuMGv/pJz0xvJ3z1bwoe4hGvafQTV5bxm13/1H7R2FOsWhTv+sVWtjACsFJyjIUHVLQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Sfyjlxyt; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sfyjlxyt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768642552; x=1800178552;
  h=date:from:to:cc:subject:message-id;
  bh=LD9IGE8iWK1MzOuadb1D1+1uHFn0+bZZ6B9gCx6UwI0=;
  b=Sfyjlxyt0cGOLw9VQa6F5KO4uOgOQ5YpV8+kL/OotC9ZrZqWJOg3k0Gn
   NtzBInH7S/NRD3+X/z9tog3KDagsWuehxS/wp8C2BUo6I3nGP2Gufhb+P
   ykc059jO0JhH6+ekjA8uzK9978ewcnFIEpzOkjfNeNGdNZV7p1x2j//Lv
   O/FbancCP1PLOzcMW4pUEKKe3Uq1CXdGIe2CFlCsV6Dj1BVBsQ9I3Q1f2
   NOvR/ec3zUS+HZvJiChbCwhRuHec1ILn+rlwgX+FU+cER4JzcMKsZ7R2G
   EVq09ZPJBhzE9HEqJVaBXkc1wMu1l0LmT2z79/m1vw4uffT6SNBrN+7To
   Q==;
X-CSE-ConnectionGUID: m4fkw9iCRGqvWuqjXgI1QA==
X-CSE-MsgGUID: nvawK8LMTmmF2IlkrkhiLQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11673"; a="73571535"
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="73571535"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jan 2026 01:35:51 -0800
X-CSE-ConnectionGUID: Kiv1ezFQSCeyqFXwkwaYlA==
X-CSE-MsgGUID: AT4dHfBORm6fo6x73zw5ZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,233,1763452800"; 
   d="scan'208";a="205474335"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 17 Jan 2026 01:35:50 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vh2ig-00000000Lix-3gbZ;
	Sat, 17 Jan 2026 09:35:46 +0000
Date: Sat, 17 Jan 2026 17:35:31 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: lib/zstd/compress/zstd_fast.c:749:28: sparse: sparse: Using
 plain integer as NULL pointer
Message-ID: <202601171708.pvJI4irK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   d3eeb99bbc99cc5eb94a4a75ed4415a0272254ef
commit: 65d1f5507ed2c78c64fce40e44e5574a9419eb09 zstd: Import upstream v1.5.7
date:   10 months ago
config: i386-randconfig-061-20260117 (https://download.01.org/0day-ci/archive/20260117/202601171708.pvJI4irK-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260117/202601171708.pvJI4irK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601171708.pvJI4irK-lkp@intel.com/

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
