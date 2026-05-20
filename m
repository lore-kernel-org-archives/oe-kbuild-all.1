Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C7E3B2FF5
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 May 2026 23:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779318786; cv=none; b=t+a7jgIklhHCh7Rw+ptEfN9GQ5KhJmHrzlJsl9cjHk2BSJ7UQq19icYY+ParZ0zNq0lKP3gQdMYwbxKKhDCnPywoD62uTRWuyyWgYyg4ntyG8SKEykQ2hJ2IYtlDUhUv4Thy5KAwThlBFnibOtEJZB0EpnkmGGj/6Foa65CkxcA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779318786; c=relaxed/simple;
	bh=0iLR4Ojzq2p/JFXFeanKAeHDCNoV5t73tcisCgTYSgI=;
	h=Date:From:To:Cc:Subject:Message-ID; b=eTblmdkk/uLbeMtpNxPblcBU3XWzjunRkzuhqwNV5puzTRTjoLl8sLaivIyAWdtmmv+q3pMzVeKNDpRnhSIS4MKTQLMTDkynXVHIHRozu+tVAnsV0iJuQmtrXoW7YE/cB7A6fzzTzlSLB+UQF7ovFDqtT6DwsKD7Qn1IQMLRB+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EkGmhK/T; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EkGmhK/T"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779318785; x=1810854785;
  h=date:from:to:cc:subject:message-id;
  bh=0iLR4Ojzq2p/JFXFeanKAeHDCNoV5t73tcisCgTYSgI=;
  b=EkGmhK/TWlI94ej0nO3cZiPU9dD4GEvcoWgjii7EXdJQIrGXzqiOCiLW
   eY5HBf0fpFK+h6NzCG7t4Ek5eMLe6BjOzn16LkN7iW16zsJL6zR60NT9B
   BdIXjT9lMlv3zdH7dq7VGXirhcgDihq0+PUTghLAm3tCNJ7e2Hn6WkNwo
   cwcYbbGeuKW9ETp5jIDxLsXQU/pHXS9834lNRslkxuI3MQm9UY9zh15tE
   kMqidFdVs2dRyedQ7TuWCNqf/OuY71gYtPBYgPSYf1JiSYd0zpZVIA5IA
   hOoZcJpLkhcsOwJQbg7fQmxTIRdbnWX7QVGibGPbTxNWoSgJ4o0tZd//v
   w==;
X-CSE-ConnectionGUID: SY2VUByDTr+U8iyOoLB5XA==
X-CSE-MsgGUID: yEyZdIamRQCt1quw2ifavw==
X-IronPort-AV: E=McAfee;i="6800,10657,11792"; a="91704756"
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="91704756"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 May 2026 16:13:05 -0700
X-CSE-ConnectionGUID: zJAGFF7qTQioq6X7CFeHfQ==
X-CSE-MsgGUID: uxoIb6k1RJ6Tv8ruLQKWQg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,245,1770624000"; 
   d="scan'208";a="264144133"
Received: from lkp-server02.sh.intel.com (HELO 30e86e9c1927) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 20 May 2026 16:13:04 -0700
Received: from kbuild by 30e86e9c1927 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wPq54-000000003y7-1F7J;
	Wed, 20 May 2026 23:12:16 +0000
Date: Thu, 21 May 2026 07:06:59 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (Microsoft)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rppt:gfp-to-kmalloc/v0.2 15/247] crypto/skcipher.c:136:2-7:
 WARNING: NULL check before some freeing functions is not needed.
Message-ID: <202605210608.ytar7S7l-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git gfp-to-kmalloc/v0.2
head:   5693301a8315aa6051f1bd38a1b689b5f0d2f7aa
commit: a02a74d03c4c2d647f034a2ccaf77fbea787a728 [15/247] crypto: replace __get_free_page() with kmalloc()
config: arm-randconfig-r053-20260521 (https://download.01.org/0day-ci/archive/20260521/202605210608.ytar7S7l-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605210608.ytar7S7l-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> crypto/skcipher.c:136:2-7: WARNING: NULL check before some freeing functions is not needed.

vim +136 crypto/skcipher.c

    52	
    53	/**
    54	 * skcipher_walk_done() - finish one step of a skcipher_walk
    55	 * @walk: the skcipher_walk
    56	 * @res: number of bytes *not* processed (>= 0) from walk->nbytes,
    57	 *	 or a -errno value to terminate the walk due to an error
    58	 *
    59	 * This function cleans up after one step of walking through the source and
    60	 * destination scatterlists, and advances to the next step if applicable.
    61	 * walk->nbytes is set to the number of bytes available in the next step,
    62	 * walk->total is set to the new total number of bytes remaining, and
    63	 * walk->{src,dst}.virt.addr is set to the next pair of data pointers.  If there
    64	 * is no more data, or if an error occurred (i.e. -errno return), then
    65	 * walk->nbytes and walk->total are set to 0 and all resources owned by the
    66	 * skcipher_walk are freed.
    67	 *
    68	 * Return: 0 or a -errno value.  If @res was a -errno value then it will be
    69	 *	   returned, but other errors may occur too.
    70	 */
    71	int skcipher_walk_done(struct skcipher_walk *walk, int res)
    72	{
    73		unsigned int n = walk->nbytes; /* num bytes processed this step */
    74		unsigned int total = 0; /* new total remaining */
    75	
    76		if (!n)
    77			goto finish;
    78	
    79		if (likely(res >= 0)) {
    80			n -= res; /* subtract num bytes *not* processed */
    81			total = walk->total - n;
    82		}
    83	
    84		if (likely(!(walk->flags & (SKCIPHER_WALK_SLOW |
    85					    SKCIPHER_WALK_COPY |
    86					    SKCIPHER_WALK_DIFF)))) {
    87			scatterwalk_advance(&walk->in, n);
    88		} else if (walk->flags & SKCIPHER_WALK_DIFF) {
    89			scatterwalk_done_src(&walk->in, n);
    90		} else if (walk->flags & SKCIPHER_WALK_COPY) {
    91			scatterwalk_advance(&walk->in, n);
    92			scatterwalk_map(&walk->out);
    93			memcpy(walk->out.addr, walk->page, n);
    94		} else { /* SKCIPHER_WALK_SLOW */
    95			if (res > 0) {
    96				/*
    97				 * Didn't process all bytes.  Either the algorithm is
    98				 * broken, or this was the last step and it turned out
    99				 * the message wasn't evenly divisible into blocks but
   100				 * the algorithm requires it.
   101				 */
   102				res = -EINVAL;
   103				total = 0;
   104			} else
   105				memcpy_to_scatterwalk(&walk->out, walk->out.addr, n);
   106			goto dst_done;
   107		}
   108	
   109		scatterwalk_done_dst(&walk->out, n);
   110	dst_done:
   111	
   112		if (res > 0)
   113			res = 0;
   114	
   115		walk->total = total;
   116		walk->nbytes = 0;
   117	
   118		if (total) {
   119			if (walk->flags & SKCIPHER_WALK_SLEEP)
   120				cond_resched();
   121			walk->flags &= ~(SKCIPHER_WALK_SLOW | SKCIPHER_WALK_COPY |
   122					 SKCIPHER_WALK_DIFF);
   123			return skcipher_walk_next(walk);
   124		}
   125	
   126	finish:
   127		/* Short-circuit for the common/fast path. */
   128		if (!((unsigned long)walk->buffer | (unsigned long)walk->page))
   129			goto out;
   130	
   131		if (walk->iv != walk->oiv)
   132			memcpy(walk->oiv, walk->iv, walk->ivsize);
   133		if (walk->buffer != walk->page)
   134			kfree(walk->buffer);
   135		if (walk->page)
 > 136			kfree(walk->page);
   137	
   138	out:
   139		return res;
   140	}
   141	EXPORT_SYMBOL_GPL(skcipher_walk_done);
   142	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
