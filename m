Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05ACE393DFF
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 06:24:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774851880; cv=none; b=YJgGwgWYWz4ELRmhDQgTM3TZn5N3c5r+jWFSOUlOtgSTpqKo4TFC+WscG462FzFQ3a44q2hmSK82o8lemwYx8MKWbVRvRi8suWYzrICe0S1ZVgEnkvLh4qbk2abMk3GNXu/Uc18QKdtIukXnLa5BMm4Rjd5Dc0yyMDDEC6cW4P4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774851880; c=relaxed/simple;
	bh=GDAU2uSq+UTugw0QQKkOzo2Zl3uEZm68vvOeCrX2sq0=;
	h=Date:From:To:Cc:Subject:Message-ID; b=PkhLOU9tkCpt7Ti2sS2LArhhMZC25xeSLEUDuWAoTKez+OcYWI0Jfkr0stJnrTOeDK4UeAAK9fQdsbJgCDCSWxZU68zgcp/3FJAhgteQBawFvxBzIiePuHFu9ryYtYkqoe4q9FQnp5IOTpXQQfJyjo1csxmU+d2QsalNl985W9U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Y1GF2K4f; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Y1GF2K4f"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774851878; x=1806387878;
  h=date:from:to:cc:subject:message-id;
  bh=GDAU2uSq+UTugw0QQKkOzo2Zl3uEZm68vvOeCrX2sq0=;
  b=Y1GF2K4fzG4B/4NMvhJVmZU+UXY6d/3X4V23u4yVtSCS2cpoZpSu3v1z
   FNinyqW3rECNqSZxrXb9l0qmhEv4CgV6yNQ1E98qz0Qh8ZVeyl61RCNfe
   MlL81C61IHjQGVHo0vP3BdPpR7lpWtVL4juL4iOee7/37JV7x8ZpIEK3Z
   WWrgYitwlgzMX5hq0OHI6U4Ys/GElRrNlptaXL8MXfIy7GicPjWwJoDV/
   N8e137Wr4SG5hp4a/TjcSWIF14P/W4j5uxYEviQOqwVZ36jacyzezVJT0
   hJtBw+X5UwddVyVDmIYLeqtYNUqkFs7MBNXBcZrlE2qNaN3iEnzV5YiVn
   A==;
X-CSE-ConnectionGUID: n7orRdaaQCexQRSKe/lTMw==
X-CSE-MsgGUID: mT4+JbWkQR+v+5ShgXqJpQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11743"; a="75013037"
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="75013037"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2026 23:24:34 -0700
X-CSE-ConnectionGUID: KuAmEpsJTuihUfR85fcb7A==
X-CSE-MsgGUID: p8jYOsLFSb+643dh5yaKag==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,149,1770624000"; 
   d="scan'208";a="221563402"
Received: from lkp-server01.sh.intel.com (HELO 283bf2e1b94a) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 29 Mar 2026 23:24:31 -0700
Received: from kbuild by 283bf2e1b94a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w7632-000000000ld-3GAM;
	Mon, 30 Mar 2026 06:24:28 +0000
Date: Mon, 30 Mar 2026 14:23:40 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Terrell <terrelln@meta.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: lib/zstd/compress/zstd_fast.c:291
 ZSTD_compressBlock_fast_noDict_generic() warn: inconsistent indenting
Message-ID: <202603301401.4kEZlkvb-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   7aaa8047eafd0bd628065b15757d9b48c5f9c07d
commit: 65d1f5507ed2c78c64fce40e44e5574a9419eb09 zstd: Import upstream v1.5.7
date:   1 year, 1 month ago
config: hexagon-randconfig-r072-20260330 (https://download.01.org/0day-ci/archive/20260330/202603301401.4kEZlkvb-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 054e11d1a17e5ba88bb1a8ef32fad3346e80b186)
smatch: v0.5.0-9004-gb810ac53

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603301401.4kEZlkvb-lkp@intel.com/

New smatch warnings:
lib/zstd/compress/zstd_fast.c:291 ZSTD_compressBlock_fast_noDict_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_fast.c:291 ZSTD_compressBlock_fast_noDict_generic() warn: inconsistent indenting

Old smatch warnings:
lib/zstd/compress/zstd_fast.c:316 ZSTD_compressBlock_fast_noDict_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_fast.c:316 ZSTD_compressBlock_fast_noDict_generic() warn: inconsistent indenting
lib/zstd/compress/zstd_fast.c:944 ZSTD_compressBlock_fast_extDict_generic() warn: maybe use && instead of &
lib/zstd/compress/zstd_fast.c:944 ZSTD_compressBlock_fast_extDict_generic() warn: maybe use && instead of &

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
