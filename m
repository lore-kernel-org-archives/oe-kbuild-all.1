Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 430FF1E7C23
	for <oe-kbuild-all@lists.linux.dev>; Mon, 15 Dec 2025 06:30:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765780221; cv=none; b=Ibv0HmUFkms54pLfHtkSSADyyd1h3HUBE4MbrctsG5WjIqbVwWFkHGM3+O7gMB1PLt1IkwgT9jhK6lEDyewTiAxsmOSF8MdReQHoOnNgHL+Iil7BjJ69eZpjI5psZUTXoN8u6hBOxnolMz34e+IXdvoNncVB61dbIQ0rzY4qE14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765780221; c=relaxed/simple;
	bh=/doJdNO20FvU3+20KYXX5fLO6qfhrOoXuNqrmHloq4I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=U6PyS1+nCtjeBp3TIfk+AUkZXxD5tXcomUMJtw6i7EDipmA/XWh7X/cjTJjG+YFG8knsDJDDFeEJ4W1l17Zpi9MdieAx//7wrk33wWmH4jMNT4w+mLgqVeNhwjUOW0ogh1OGIKkAac49OB/YIWAqRqODvnoklQZnTD53uZKc9dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aHyQWebF; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aHyQWebF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765780218; x=1797316218;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/doJdNO20FvU3+20KYXX5fLO6qfhrOoXuNqrmHloq4I=;
  b=aHyQWebFMdjorYbcWK95bUIwHMnVDXKqeLIbHZNCYRcxAu64TTXneuMy
   GqZLCEDvapmdHUTbMRRukmv0JXNJHJZhRjwQcLtMWv7LLhzyYN7g9Y2U7
   ONiyFgJt+EchwZ4pQval0J7eJxSA8ey1XzMOYr7CPY13QZfG1Ld+JWcrr
   badQzLXpGEhpOHLbc7nxUN3BkQtxPym1kJ8UTqtNcMDAcl/keUYX4rIll
   WGNeZ9HBsUoUeAXAYgjhqjZRmuE1ej5zqSxC952RTY2VM3YS1pDU4/bHZ
   5dT4ISyRDN5cOU+OnB5OigvxHNi00sS5VPcU7n2yDM4h2Aa5dVmY9R3kb
   Q==;
X-CSE-ConnectionGUID: SKAozHMbTCi71SNQOEb8TA==
X-CSE-MsgGUID: 5HugMERXSbq9ISaRmuCg+g==
X-IronPort-AV: E=McAfee;i="6800,10657,11642"; a="90329269"
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="90329269"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Dec 2025 22:30:17 -0800
X-CSE-ConnectionGUID: FilobD2xQKaiAbr9KNsBmQ==
X-CSE-MsgGUID: gWyA/vf8QzOiXsdNFsSBng==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,150,1763452800"; 
   d="scan'208";a="198157514"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 14 Dec 2025 22:30:16 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vV262-000000009sU-1ans;
	Mon, 15 Dec 2025 06:30:14 +0000
Date: Mon, 15 Dec 2025 14:29:50 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: lib/zstd/compress/zstd_fast.c:291
 ZSTD_compressBlock_fast_noDict_generic() warn: inconsistent indenting
Message-ID: <202512151418.Lrp7Rxz8-lkp@intel.com>
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
config: openrisc-randconfig-r072-20251214 (https://download.01.org/0day-ci/archive/20251215/202512151418.Lrp7Rxz8-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 15.1.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512151418.Lrp7Rxz8-lkp@intel.com/

New smatch warnings:
lib/zstd/compress/zstd_fast.c:291 ZSTD_compressBlock_fast_noDict_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_fast.c:291 ZSTD_compressBlock_fast_noDict_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_opt.c:668 ZSTD_insertBtAndGetAllMatches() warn: maybe use && instead of &
lib/zstd/compress/zstd_lazy.c:1991 ZSTD_compressBlock_lazy_extDict_generic() warn: maybe use && instead of &

Old smatch warnings:
lib/zstd/compress/zstd_fast.c:316 ZSTD_compressBlock_fast_noDict_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_fast.c:316 ZSTD_compressBlock_fast_noDict_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_fast.c:944 ZSTD_compressBlock_fast_extDict_generic() warn: maybe use && instead of &
lib/zstd/compress/zstd_fast.c:944 ZSTD_compressBlock_fast_extDict_generic() warn: maybe use && instead of &
lib/zstd/compress/zstd_opt.c:674 ZSTD_insertBtAndGetAllMatches() warn: maybe use && instead of &
lib/zstd/compress/zstd_opt.c:1382 ZSTD_compressBlock_opt_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_opt.c:1392 ZSTD_compressBlock_opt_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_lazy.c:1629 ZSTD_compressBlock_lazy_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:1990 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:2021 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:2031 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:2032 ZSTD_compressBlock_lazy_extDict_generic() warn: maybe use && instead of &
lib/zstd/compress/zstd_lazy.c:2063 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:2064 ZSTD_compressBlock_lazy_extDict_generic() warn: maybe use && instead of &
lib/zstd/compress/zstd_lazy.c:2117 ZSTD_compressBlock_lazy_extDict_generic() warn: if statement not indented
lib/zstd/compress/zstd_lazy.c:2118 ZSTD_compressBlock_lazy_extDict_generic() warn: maybe use && instead of &

vim +291 lib/zstd/compress/zstd_fast.c

   247	
   248	    step = stepSize;
   249	    nextStep = ip0 + kStepIncr;
   250	
   251	    /* calculate positions, ip0 - anchor == 0, so we skip step calc */
   252	    ip1 = ip0 + 1;
   253	    ip2 = ip0 + step;
   254	    ip3 = ip2 + 1;
   255	
   256	    if (ip3 >= ilimit) {
   257	        goto _cleanup;
   258	    }
   259	
   260	    hash0 = ZSTD_hashPtr(ip0, hlog, mls);
   261	    hash1 = ZSTD_hashPtr(ip1, hlog, mls);
   262	
   263	    matchIdx = hashTable[hash0];
   264	
   265	    do {
   266	        /* load repcode match for ip[2]*/
   267	        const U32 rval = MEM_read32(ip2 - rep_offset1);
   268	
   269	        /* write back hash table entry */
   270	        current0 = (U32)(ip0 - base);
   271	        hashTable[hash0] = current0;
   272	
   273	        /* check repcode at ip[2] */
   274	        if ((MEM_read32(ip2) == rval) & (rep_offset1 > 0)) {
   275	            ip0 = ip2;
   276	            match0 = ip0 - rep_offset1;
   277	            mLength = ip0[-1] == match0[-1];
   278	            ip0 -= mLength;
   279	            match0 -= mLength;
   280	            offcode = REPCODE1_TO_OFFBASE;
   281	            mLength += 4;
   282	
   283	            /* Write next hash table entry: it's already calculated.
   284	             * This write is known to be safe because ip1 is before the
   285	             * repcode (ip2). */
   286	            hashTable[hash1] = (U32)(ip1 - base);
   287	
   288	            goto _match;
   289	        }
   290	
 > 291	         if (matchFound(ip0, base + matchIdx, matchIdx, prefixStartIndex)) {
   292	            /* Write next hash table entry (it's already calculated).
   293	            * This write is known to be safe because the ip1 == ip0 + 1,
   294	            * so searching will resume after ip1 */
   295	            hashTable[hash1] = (U32)(ip1 - base);
   296	
   297	            goto _offset;
   298	        }
   299	
   300	        /* lookup ip[1] */
   301	        matchIdx = hashTable[hash1];
   302	
   303	        /* hash ip[2] */
   304	        hash0 = hash1;
   305	        hash1 = ZSTD_hashPtr(ip2, hlog, mls);
   306	
   307	        /* advance to next positions */
   308	        ip0 = ip1;
   309	        ip1 = ip2;
   310	        ip2 = ip3;
   311	
   312	        /* write back hash table entry */
   313	        current0 = (U32)(ip0 - base);
   314	        hashTable[hash0] = current0;
   315	
   316	         if (matchFound(ip0, base + matchIdx, matchIdx, prefixStartIndex)) {
   317	            /* Write next hash table entry, since it's already calculated */
   318	            if (step <= 4) {
   319	                /* Avoid writing an index if it's >= position where search will resume.
   320	                * The minimum possible match has length 4, so search can resume at ip0 + 4.
   321	                */
   322	                hashTable[hash1] = (U32)(ip1 - base);
   323	            }
   324	            goto _offset;
   325	        }
   326	
   327	        /* lookup ip[1] */
   328	        matchIdx = hashTable[hash1];
   329	
   330	        /* hash ip[2] */
   331	        hash0 = hash1;
   332	        hash1 = ZSTD_hashPtr(ip2, hlog, mls);
   333	
   334	        /* advance to next positions */
   335	        ip0 = ip1;
   336	        ip1 = ip2;
   337	        ip2 = ip0 + step;
   338	        ip3 = ip1 + step;
   339	
   340	        /* calculate step */
   341	        if (ip2 >= nextStep) {
   342	            step++;
   343	            PREFETCH_L1(ip1 + 64);
   344	            PREFETCH_L1(ip1 + 128);
   345	            nextStep += kStepIncr;
   346	        }
   347	    } while (ip3 < ilimit);
   348	
   349	_cleanup:
   350	    /* Note that there are probably still a couple positions one could search.
   351	     * However, it seems to be a meaningful performance hit to try to search
   352	     * them. So let's not. */
   353	
   354	    /* When the repcodes are outside of the prefix, we set them to zero before the loop.
   355	     * When the offsets are still zero, we need to restore them after the block to have a correct
   356	     * repcode history. If only one offset was invalid, it is easy. The tricky case is when both
   357	     * offsets were invalid. We need to figure out which offset to refill with.
   358	     *     - If both offsets are zero they are in the same order.
   359	     *     - If both offsets are non-zero, we won't restore the offsets from `offsetSaved[12]`.
   360	     *     - If only one is zero, we need to decide which offset to restore.
   361	     *         - If rep_offset1 is non-zero, then rep_offset2 must be offsetSaved1.
   362	     *         - It is impossible for rep_offset2 to be non-zero.
   363	     *
   364	     * So if rep_offset1 started invalid (offsetSaved1 != 0) and became valid (rep_offset1 != 0), then
   365	     * set rep[0] = rep_offset1 and rep[1] = offsetSaved1.
   366	     */
   367	    offsetSaved2 = ((offsetSaved1 != 0) && (rep_offset1 != 0)) ? offsetSaved1 : offsetSaved2;
   368	
   369	    /* save reps for next block */
   370	    rep[0] = rep_offset1 ? rep_offset1 : offsetSaved1;
   371	    rep[1] = rep_offset2 ? rep_offset2 : offsetSaved2;
   372	
   373	    /* Return the last literals size */
   374	    return (size_t)(iend - anchor);
   375	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
