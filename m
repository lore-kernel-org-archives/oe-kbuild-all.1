Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C810C2CCDC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Nov 2023 10:45:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fGjUxy4I"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700563526; x=1732099526;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=eFBpddGv1YUBB4p+Zo2wKvDVv7VPa2MQqoF+y4msopM=;
  b=fGjUxy4IG6EGFNZf0ORfw7E3G6jy6a3FoZdlTaEcGTOMCSDqWrPly/HY
   K3I9Shy9iHg4sXxL0JUVxvl87RQEWRFFYZZaI/FYANvKPTE1ryH2m/Kk/
   7oZSy2P61u4M+tXJd96zkbyMdWlmOma5rliwo9ynLdeWPqHH42CJDMBXI
   0cYZSiD9JtKoMSpmpns7ouyPmVUjlzzZPjQN9iw2cPbOStuHYOEugK21f
   wa6GJMtNCwm70an2DzPZqck9c9MAXm85i7Hmp5W8f1+dencfsktry+2sm
   /t4aQLYNXnC7IeYFExdqHlZdarWmdC1SzpbqUiRtSM01FJJxzYEsoSSjm
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422910531"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="422910531"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Nov 2023 02:45:26 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="1013875302"
X-IronPort-AV: E=Sophos;i="6.04,215,1695711600"; 
   d="scan'208";a="1013875302"
Received: from lkp-server02.sh.intel.com (HELO b8de5498638e) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 21 Nov 2023 02:45:24 -0800
Received: from kbuild by b8de5498638e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5OFZ-0007hX-0X;
	Tue, 21 Nov 2023 10:45:08 +0000
Date: Tue, 21 Nov 2023 18:44:26 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@meta.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [linux-next:master 2144/2217] lib/zstd/compress/zstd_fast.c:726:28:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202311211842.VCv1S0IX-lkp@intel.com>
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
config: x86_64-randconfig-r122-20231121 (https://download.01.org/0day-ci/archive/20231121/202311211842.VCv1S0IX-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231121/202311211842.VCv1S0IX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311211842.VCv1S0IX-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/zstd/compress/zstd_fast.c:726:28: sparse: sparse: Using plain integer as NULL pointer

vim +726 lib/zstd/compress/zstd_fast.c

   683	
   684	
   685	static size_t ZSTD_compressBlock_fast_extDict_generic(
   686	        ZSTD_matchState_t* ms, seqStore_t* seqStore, U32 rep[ZSTD_REP_NUM],
   687	        void const* src, size_t srcSize, U32 const mls, U32 const hasStep)
   688	{
   689	    const ZSTD_compressionParameters* const cParams = &ms->cParams;
   690	    U32* const hashTable = ms->hashTable;
   691	    U32 const hlog = cParams->hashLog;
   692	    /* support stepSize of 0 */
   693	    size_t const stepSize = cParams->targetLength + !(cParams->targetLength) + 1;
   694	    const BYTE* const base = ms->window.base;
   695	    const BYTE* const dictBase = ms->window.dictBase;
   696	    const BYTE* const istart = (const BYTE*)src;
   697	    const BYTE* anchor = istart;
   698	    const U32   endIndex = (U32)((size_t)(istart - base) + srcSize);
   699	    const U32   lowLimit = ZSTD_getLowestMatchIndex(ms, endIndex, cParams->windowLog);
   700	    const U32   dictStartIndex = lowLimit;
   701	    const BYTE* const dictStart = dictBase + dictStartIndex;
   702	    const U32   dictLimit = ms->window.dictLimit;
   703	    const U32   prefixStartIndex = dictLimit < lowLimit ? lowLimit : dictLimit;
   704	    const BYTE* const prefixStart = base + prefixStartIndex;
   705	    const BYTE* const dictEnd = dictBase + prefixStartIndex;
   706	    const BYTE* const iend = istart + srcSize;
   707	    const BYTE* const ilimit = iend - 8;
   708	    U32 offset_1=rep[0], offset_2=rep[1];
   709	    U32 offsetSaved1 = 0, offsetSaved2 = 0;
   710	
   711	    const BYTE* ip0 = istart;
   712	    const BYTE* ip1;
   713	    const BYTE* ip2;
   714	    const BYTE* ip3;
   715	    U32 current0;
   716	
   717	
   718	    size_t hash0; /* hash for ip0 */
   719	    size_t hash1; /* hash for ip1 */
   720	    U32 idx; /* match idx for ip0 */
   721	    const BYTE* idxBase; /* base pointer for idx */
   722	
   723	    U32 offcode;
   724	    const BYTE* match0;
   725	    size_t mLength;
 > 726	    const BYTE* matchEnd = 0; /* initialize to avoid warning, assert != 0 later */
   727	
   728	    size_t step;
   729	    const BYTE* nextStep;
   730	    const size_t kStepIncr = (1 << (kSearchStrength - 1));
   731	
   732	    (void)hasStep; /* not currently specialized on whether it's accelerated */
   733	
   734	    DEBUGLOG(5, "ZSTD_compressBlock_fast_extDict_generic (offset_1=%u)", offset_1);
   735	
   736	    /* switch to "regular" variant if extDict is invalidated due to maxDistance */
   737	    if (prefixStartIndex == dictStartIndex)
   738	        return ZSTD_compressBlock_fast(ms, seqStore, rep, src, srcSize);
   739	
   740	    {   U32 const curr = (U32)(ip0 - base);
   741	        U32 const maxRep = curr - dictStartIndex;
   742	        if (offset_2 >= maxRep) offsetSaved2 = offset_2, offset_2 = 0;
   743	        if (offset_1 >= maxRep) offsetSaved1 = offset_1, offset_1 = 0;
   744	    }
   745	
   746	    /* start each op */
   747	_start: /* Requires: ip0 */
   748	
   749	    step = stepSize;
   750	    nextStep = ip0 + kStepIncr;
   751	
   752	    /* calculate positions, ip0 - anchor == 0, so we skip step calc */
   753	    ip1 = ip0 + 1;
   754	    ip2 = ip0 + step;
   755	    ip3 = ip2 + 1;
   756	
   757	    if (ip3 >= ilimit) {
   758	        goto _cleanup;
   759	    }
   760	
   761	    hash0 = ZSTD_hashPtr(ip0, hlog, mls);
   762	    hash1 = ZSTD_hashPtr(ip1, hlog, mls);
   763	
   764	    idx = hashTable[hash0];
   765	    idxBase = idx < prefixStartIndex ? dictBase : base;
   766	
   767	    do {
   768	        {   /* load repcode match for ip[2] */
   769	            U32 const current2 = (U32)(ip2 - base);
   770	            U32 const repIndex = current2 - offset_1;
   771	            const BYTE* const repBase = repIndex < prefixStartIndex ? dictBase : base;
   772	            U32 rval;
   773	            if ( ((U32)(prefixStartIndex - repIndex) >= 4) /* intentional underflow */
   774	                 & (offset_1 > 0) ) {
   775	                rval = MEM_read32(repBase + repIndex);
   776	            } else {
   777	                rval = MEM_read32(ip2) ^ 1; /* guaranteed to not match. */
   778	            }
   779	
   780	            /* write back hash table entry */
   781	            current0 = (U32)(ip0 - base);
   782	            hashTable[hash0] = current0;
   783	
   784	            /* check repcode at ip[2] */
   785	            if (MEM_read32(ip2) == rval) {
   786	                ip0 = ip2;
   787	                match0 = repBase + repIndex;
   788	                matchEnd = repIndex < prefixStartIndex ? dictEnd : iend;
   789	                assert((match0 != prefixStart) & (match0 != dictStart));
   790	                mLength = ip0[-1] == match0[-1];
   791	                ip0 -= mLength;
   792	                match0 -= mLength;
   793	                offcode = REPCODE1_TO_OFFBASE;
   794	                mLength += 4;
   795	                goto _match;
   796	        }   }
   797	
   798	        {   /* load match for ip[0] */
   799	            U32 const mval = idx >= dictStartIndex ?
   800	                    MEM_read32(idxBase + idx) :
   801	                    MEM_read32(ip0) ^ 1; /* guaranteed not to match */
   802	
   803	            /* check match at ip[0] */
   804	            if (MEM_read32(ip0) == mval) {
   805	                /* found a match! */
   806	                goto _offset;
   807	        }   }
   808	
   809	        /* lookup ip[1] */
   810	        idx = hashTable[hash1];
   811	        idxBase = idx < prefixStartIndex ? dictBase : base;
   812	
   813	        /* hash ip[2] */
   814	        hash0 = hash1;
   815	        hash1 = ZSTD_hashPtr(ip2, hlog, mls);
   816	
   817	        /* advance to next positions */
   818	        ip0 = ip1;
   819	        ip1 = ip2;
   820	        ip2 = ip3;
   821	
   822	        /* write back hash table entry */
   823	        current0 = (U32)(ip0 - base);
   824	        hashTable[hash0] = current0;
   825	
   826	        {   /* load match for ip[0] */
   827	            U32 const mval = idx >= dictStartIndex ?
   828	                    MEM_read32(idxBase + idx) :
   829	                    MEM_read32(ip0) ^ 1; /* guaranteed not to match */
   830	
   831	            /* check match at ip[0] */
   832	            if (MEM_read32(ip0) == mval) {
   833	                /* found a match! */
   834	                goto _offset;
   835	        }   }
   836	
   837	        /* lookup ip[1] */
   838	        idx = hashTable[hash1];
   839	        idxBase = idx < prefixStartIndex ? dictBase : base;
   840	
   841	        /* hash ip[2] */
   842	        hash0 = hash1;
   843	        hash1 = ZSTD_hashPtr(ip2, hlog, mls);
   844	
   845	        /* advance to next positions */
   846	        ip0 = ip1;
   847	        ip1 = ip2;
   848	        ip2 = ip0 + step;
   849	        ip3 = ip1 + step;
   850	
   851	        /* calculate step */
   852	        if (ip2 >= nextStep) {
   853	            step++;
   854	            PREFETCH_L1(ip1 + 64);
   855	            PREFETCH_L1(ip1 + 128);
   856	            nextStep += kStepIncr;
   857	        }
   858	    } while (ip3 < ilimit);
   859	
   860	_cleanup:
   861	    /* Note that there are probably still a couple positions we could search.
   862	     * However, it seems to be a meaningful performance hit to try to search
   863	     * them. So let's not. */
   864	
   865	    /* If offset_1 started invalid (offsetSaved1 != 0) and became valid (offset_1 != 0),
   866	     * rotate saved offsets. See comment in ZSTD_compressBlock_fast_noDict for more context. */
   867	    offsetSaved2 = ((offsetSaved1 != 0) && (offset_1 != 0)) ? offsetSaved1 : offsetSaved2;
   868	
   869	    /* save reps for next block */
   870	    rep[0] = offset_1 ? offset_1 : offsetSaved1;
   871	    rep[1] = offset_2 ? offset_2 : offsetSaved2;
   872	
   873	    /* Return the last literals size */
   874	    return (size_t)(iend - anchor);
   875	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
