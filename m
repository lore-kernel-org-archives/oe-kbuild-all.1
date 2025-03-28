Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B3A2522094
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Mar 2025 02:03:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743127428; cv=none; b=R/9R/eh4B5NpICVMak10N00wPIN3ekwbcwMMM3xieZfRZJevP6sGAmiXI4BU2Si5VToheRTpxFrPlZkYtluvdFj5xjzF0cKRsJ31JeAZQukWHLwp4WTfqSpoVKWj37qdRHf0GycrNzTTuMnY4BzTofGejDQf7ZDWn3TcVvVbhQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743127428; c=relaxed/simple;
	bh=01WJuUX1tIHgkaMkGlMn387UDgHl3nzMv4W6KG2ks9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tAn+0Cc753MP+T9LGUR7CaZstl4i+Gc319X58zvwFvbhRqBUc0OijUGQqDKV6hYzRhdLJrV2o20iO4NBzweyScWR0vxrMmSECVogVclULOsTl0wwMwug0e7PQ/QbAmJCo3vnJzu+44/t/GGBdH1gd9jI8Vb6r6NZoHdvzpKNYRg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=B4+A/Gh3; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="B4+A/Gh3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743127426; x=1774663426;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=01WJuUX1tIHgkaMkGlMn387UDgHl3nzMv4W6KG2ks9Q=;
  b=B4+A/Gh3de0mAnjyXZ06FjDHLn0NT6APJ5Qw2HvsbIVsLgOUmyv8QRGe
   e46CZgKGNGF55ZzgNoEbmWryzX+70LJxbldxVjN30RA1BPW+TI/az6eBI
   b+89P152gxEOc+UMdT07AN/4uF/CulCYD7msP8Px/1JZQVL21c4U2KsAs
   rd/g+q/Sl9BlrkqUaWB887+UMlHaPY8/qHmbkk5xnK+gGv1UiE4kLA4Ki
   aBPcBIRIesK27UHFfEcuZPaq35GxiGKumaSuTLpSjfHPT/friOc71jvPz
   vYZkJIVHv4GseGiE0WaY89XJL9LhWR3Fq/OzfeusTBwRvlXElMTdTZ4KA
   g==;
X-CSE-ConnectionGUID: DW+xy1IiRsmMhtb0RL07hQ==
X-CSE-MsgGUID: oqxMB6+iQU+MBxr/uSNrRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11385"; a="66956671"
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="66956671"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2025 19:03:46 -0700
X-CSE-ConnectionGUID: O3oL04dMTGqZfV7T8w1Ayw==
X-CSE-MsgGUID: ABjKGcUxRwa4w/aiIeUm0g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,282,1736841600"; 
   d="scan'208";a="130419114"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 27 Mar 2025 19:03:43 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1txz4I-00074s-1y;
	Fri, 28 Mar 2025 02:03:37 +0000
Date: Fri, 28 Mar 2025 10:02:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-nonmm-unstable 25/40] lib/sort.c:222: warning: Function
 parameter or struct member 'may_schedule' not described in '__sort_r'
Message-ID: <202503280953.FpTcyG1h-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   ae518c1c1d4f910c2a4f255ec5d52f5a5b138f77
commit: f79965d13aa1a65047fbc47565794cc9fc763f5f [25/40] lib/sort.c: add _nonatomic() variants with cond_resched()
config: i386-buildonly-randconfig-001-20250328 (https://download.01.org/0day-ci/archive/20250328/202503280953.FpTcyG1h-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250328/202503280953.FpTcyG1h-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503280953.FpTcyG1h-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> lib/sort.c:222: warning: Function parameter or struct member 'may_schedule' not described in '__sort_r'
>> lib/sort.c:222: warning: expecting prototype for sort_r(). Prototype was for __sort_r() instead


vim +222 lib/sort.c

f79965d13aa1a6 Kent Overstreet  2025-03-26  190  
72fd4a35a82433 Robert P. J. Day 2007-02-10  191  /**
4333fb96ca1086 Rasmus Villemoes 2019-08-16  192   * sort_r - sort an array of elements
^1da177e4c3f41 Linus Torvalds   2005-04-16  193   * @base: pointer to data to sort
^1da177e4c3f41 Linus Torvalds   2005-04-16  194   * @num: number of elements
^1da177e4c3f41 Linus Torvalds   2005-04-16  195   * @size: size of each element
b53907c0100a35 Wu Fengguang     2009-01-07  196   * @cmp_func: pointer to comparison function
b53907c0100a35 Wu Fengguang     2009-01-07  197   * @swap_func: pointer to swap function or NULL
4333fb96ca1086 Rasmus Villemoes 2019-08-16  198   * @priv: third argument passed to comparison function
^1da177e4c3f41 Linus Torvalds   2005-04-16  199   *
37d0ec34d111ac George Spelvin   2019-05-14  200   * This function does a heapsort on the given array.  You may provide
37d0ec34d111ac George Spelvin   2019-05-14  201   * a swap_func function if you need to do something more than a memory
37d0ec34d111ac George Spelvin   2019-05-14  202   * copy (e.g. fix up pointers or auxiliary data), but the built-in swap
8fb583c4258d08 George Spelvin   2019-05-14  203   * avoids a slow retpoline and so is significantly faster.
^1da177e4c3f41 Linus Torvalds   2005-04-16  204   *
4e0a15f8b4bd47 Kuan-Wei Chiu    2025-01-07  205   * The comparison function must adhere to specific mathematical
4e0a15f8b4bd47 Kuan-Wei Chiu    2025-01-07  206   * properties to ensure correct and stable sorting:
4e0a15f8b4bd47 Kuan-Wei Chiu    2025-01-07  207   * - Antisymmetry: cmp_func(a, b) must return the opposite sign of
4e0a15f8b4bd47 Kuan-Wei Chiu    2025-01-07  208   * cmp_func(b, a).
4e0a15f8b4bd47 Kuan-Wei Chiu    2025-01-07  209   * - Transitivity: if cmp_func(a, b) <= 0 and cmp_func(b, c) <= 0, then
4e0a15f8b4bd47 Kuan-Wei Chiu    2025-01-07  210   * cmp_func(a, c) <= 0.
4e0a15f8b4bd47 Kuan-Wei Chiu    2025-01-07  211   *
^1da177e4c3f41 Linus Torvalds   2005-04-16  212   * Sorting time is O(n log n) both on average and worst-case. While
22a241ccb2c199 George Spelvin   2019-05-14  213   * quicksort is slightly faster on average, it suffers from exploitable
^1da177e4c3f41 Linus Torvalds   2005-04-16  214   * O(n*n) worst-case behavior and extra memory requirements that make
^1da177e4c3f41 Linus Torvalds   2005-04-16  215   * it less suitable for kernel use.
^1da177e4c3f41 Linus Torvalds   2005-04-16  216   */
f79965d13aa1a6 Kent Overstreet  2025-03-26  217  static void __sort_r(void *base, size_t num, size_t size,
52ae533b8a18e7 Andy Shevchenko  2019-10-07  218  		     cmp_r_func_t cmp_func,
a0019cd7d41a19 Jiri Olsa        2022-03-16  219  		     swap_r_func_t swap_func,
f79965d13aa1a6 Kent Overstreet  2025-03-26  220  		     const void *priv,
f79965d13aa1a6 Kent Overstreet  2025-03-26  221  		     bool may_schedule)
^1da177e4c3f41 Linus Torvalds   2005-04-16 @222  {
^1da177e4c3f41 Linus Torvalds   2005-04-16  223  	/* pre-scale counters for performance */
22a241ccb2c199 George Spelvin   2019-05-14  224  	size_t n = num * size, a = (num/2) * size;
22a241ccb2c199 George Spelvin   2019-05-14  225  	const unsigned int lsbit = size & -size;  /* Used to find parent */
0e02ca29a5634d Kuan-Wei Chiu    2024-01-13  226  	size_t shift = 0;
22a241ccb2c199 George Spelvin   2019-05-14  227  
22a241ccb2c199 George Spelvin   2019-05-14  228  	if (!a)		/* num < 2 || size == 0 */
22a241ccb2c199 George Spelvin   2019-05-14  229  		return;
^1da177e4c3f41 Linus Torvalds   2005-04-16  230  
a0019cd7d41a19 Jiri Olsa        2022-03-16  231  	/* called from 'sort' without swap function, let's pick the default */
a0019cd7d41a19 Jiri Olsa        2022-03-16  232  	if (swap_func == SWAP_WRAPPER && !((struct wrapper *)priv)->swap)
a0019cd7d41a19 Jiri Olsa        2022-03-16  233  		swap_func = NULL;
a0019cd7d41a19 Jiri Olsa        2022-03-16  234  
ca96ab859ab4b5 Daniel Wagner    2015-06-25  235  	if (!swap_func) {
37d0ec34d111ac George Spelvin   2019-05-14  236  		if (is_aligned(base, size, 8))
8fb583c4258d08 George Spelvin   2019-05-14  237  			swap_func = SWAP_WORDS_64;
37d0ec34d111ac George Spelvin   2019-05-14  238  		else if (is_aligned(base, size, 4))
8fb583c4258d08 George Spelvin   2019-05-14  239  			swap_func = SWAP_WORDS_32;
ca96ab859ab4b5 Daniel Wagner    2015-06-25  240  		else
8fb583c4258d08 George Spelvin   2019-05-14  241  			swap_func = SWAP_BYTES;
ca96ab859ab4b5 Daniel Wagner    2015-06-25  242  	}
^1da177e4c3f41 Linus Torvalds   2005-04-16  243  
22a241ccb2c199 George Spelvin   2019-05-14  244  	/*
22a241ccb2c199 George Spelvin   2019-05-14  245  	 * Loop invariants:
22a241ccb2c199 George Spelvin   2019-05-14  246  	 * 1. elements [a,n) satisfy the heap property (compare greater than
22a241ccb2c199 George Spelvin   2019-05-14  247  	 *    all of their children),
22a241ccb2c199 George Spelvin   2019-05-14  248  	 * 2. elements [n,num*size) are sorted, and
22a241ccb2c199 George Spelvin   2019-05-14  249  	 * 3. a <= b <= c <= d <= n (whenever they are valid).
22a241ccb2c199 George Spelvin   2019-05-14  250  	 */
22a241ccb2c199 George Spelvin   2019-05-14  251  	for (;;) {
22a241ccb2c199 George Spelvin   2019-05-14  252  		size_t b, c, d;
22a241ccb2c199 George Spelvin   2019-05-14  253  
0e02ca29a5634d Kuan-Wei Chiu    2024-01-13  254  		if (a)			/* Building heap: sift down a */
0e02ca29a5634d Kuan-Wei Chiu    2024-01-13  255  			a -= size << shift;
0e02ca29a5634d Kuan-Wei Chiu    2024-01-13  256  		else if (n > 3 * size) { /* Sorting: Extract two largest elements */
0e02ca29a5634d Kuan-Wei Chiu    2024-01-13  257  			n -= size;
a0019cd7d41a19 Jiri Olsa        2022-03-16  258  			do_swap(base, base + n, size, swap_func, priv);
0e02ca29a5634d Kuan-Wei Chiu    2024-01-13  259  			shift = do_cmp(base + size, base + 2 * size, cmp_func, priv) <= 0;
0e02ca29a5634d Kuan-Wei Chiu    2024-01-13  260  			a = size << shift;
0e02ca29a5634d Kuan-Wei Chiu    2024-01-13  261  			n -= size;
0e02ca29a5634d Kuan-Wei Chiu    2024-01-13  262  			do_swap(base + a, base + n, size, swap_func, priv);
0e02ca29a5634d Kuan-Wei Chiu    2024-01-13  263  		} else {		/* Sort complete */
^1da177e4c3f41 Linus Torvalds   2005-04-16  264  			break;
0e02ca29a5634d Kuan-Wei Chiu    2024-01-13  265  		}
^1da177e4c3f41 Linus Torvalds   2005-04-16  266  
22a241ccb2c199 George Spelvin   2019-05-14  267  		/*
22a241ccb2c199 George Spelvin   2019-05-14  268  		 * Sift element at "a" down into heap.  This is the
22a241ccb2c199 George Spelvin   2019-05-14  269  		 * "bottom-up" variant, which significantly reduces
22a241ccb2c199 George Spelvin   2019-05-14  270  		 * calls to cmp_func(): we find the sift-down path all
22a241ccb2c199 George Spelvin   2019-05-14  271  		 * the way to the leaves (one compare per level), then
22a241ccb2c199 George Spelvin   2019-05-14  272  		 * backtrack to find where to insert the target element.
22a241ccb2c199 George Spelvin   2019-05-14  273  		 *
22a241ccb2c199 George Spelvin   2019-05-14  274  		 * Because elements tend to sift down close to the leaves,
22a241ccb2c199 George Spelvin   2019-05-14  275  		 * this uses fewer compares than doing two per level
22a241ccb2c199 George Spelvin   2019-05-14  276  		 * on the way down.  (A bit more than half as many on
22a241ccb2c199 George Spelvin   2019-05-14  277  		 * average, 3/4 worst-case.)
22a241ccb2c199 George Spelvin   2019-05-14  278  		 */
22a241ccb2c199 George Spelvin   2019-05-14  279  		for (b = a; c = 2*b + size, (d = c + size) < n;)
db946a42226052 Kuan-Wei Chiu    2024-01-13  280  			b = do_cmp(base + c, base + d, cmp_func, priv) > 0 ? c : d;
22a241ccb2c199 George Spelvin   2019-05-14  281  		if (d == n)	/* Special case last leaf with no sibling */
22a241ccb2c199 George Spelvin   2019-05-14  282  			b = c;
22a241ccb2c199 George Spelvin   2019-05-14  283  
22a241ccb2c199 George Spelvin   2019-05-14  284  		/* Now backtrack from "b" to the correct location for "a" */
4333fb96ca1086 Rasmus Villemoes 2019-08-16  285  		while (b != a && do_cmp(base + a, base + b, cmp_func, priv) >= 0)
22a241ccb2c199 George Spelvin   2019-05-14  286  			b = parent(b, lsbit, size);
22a241ccb2c199 George Spelvin   2019-05-14  287  		c = b;			/* Where "a" belongs */
22a241ccb2c199 George Spelvin   2019-05-14  288  		while (b != a) {	/* Shift it into place */
22a241ccb2c199 George Spelvin   2019-05-14  289  			b = parent(b, lsbit, size);
a0019cd7d41a19 Jiri Olsa        2022-03-16  290  			do_swap(base + b, base + c, size, swap_func, priv);
^1da177e4c3f41 Linus Torvalds   2005-04-16  291  		}
f79965d13aa1a6 Kent Overstreet  2025-03-26  292  
f79965d13aa1a6 Kent Overstreet  2025-03-26  293  		if (may_schedule)
f79965d13aa1a6 Kent Overstreet  2025-03-26  294  			cond_resched();
^1da177e4c3f41 Linus Torvalds   2005-04-16  295  	}
41ed7804350839 Kuan-Wei Chiu    2024-05-28  296  
41ed7804350839 Kuan-Wei Chiu    2024-05-28  297  	n -= size;
41ed7804350839 Kuan-Wei Chiu    2024-05-28  298  	do_swap(base, base + n, size, swap_func, priv);
41ed7804350839 Kuan-Wei Chiu    2024-05-28  299  	if (n == size * 2 && do_cmp(base, base + size, cmp_func, priv) > 0)
41ed7804350839 Kuan-Wei Chiu    2024-05-28  300  		do_swap(base, base + size, size, swap_func, priv);
^1da177e4c3f41 Linus Torvalds   2005-04-16  301  }
f79965d13aa1a6 Kent Overstreet  2025-03-26  302  

:::::: The code at line 222 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
