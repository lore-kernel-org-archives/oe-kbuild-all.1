Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5556D23D7
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Sep 2024 23:19:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726960754; cv=none; b=QUR8pkLOtNotV7viWjJ5qdIQE/R+DDX/R6kwk6nXd6H5MTMZcsdM/xxAt8VCisysfUPmNlb+Rftpu+enblIbo7vRk7iZT//RykfEeM9aMkTr9TyiZTnvjQQ5GPDgL2yb0Gavsj8W4ITYy/z7Kj7lsr0CyqHTqie81aTl30EPAGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726960754; c=relaxed/simple;
	bh=74gRR4alNzvoNSDofe3faqFjZTsgsVsU3FuT9+io4Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VTZT0Fp8SBcrRQzA+QrswIxm6zdtj2Rjr+8XtSs+0batrqhR3K81BTMEt9XKBeQFuFmwO92LL0RGmjoI4Bu5/SxWExSUVhrGmleCCI76tg+oJp9rXursZrVlesr4cDjX8WuWS5Xj3tIjv7bBJlDjUDgLrA4z7+Wz1pKzCMtlGbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=C7xKUQqg; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="C7xKUQqg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726960752; x=1758496752;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=74gRR4alNzvoNSDofe3faqFjZTsgsVsU3FuT9+io4Kw=;
  b=C7xKUQqgs6ekqksAEfMMEo987TGLSoZ5QZ4knuQ7+5PiT6Gv2VO0E8ox
   kv/Qpcp1VquaiY4vtqJypVTW8oNKXxXEN/hdri1d1Z1kjGVnRVBT10xZK
   arEHOVRd/72nUQ+LJDBIcmkrG9LXQo4nk4Axo1JBhte8BM0IFNfvhfCGC
   zz4QCDiCeZYsYQo9Wxs9NdRoIZ8P4puDFg1c199tpm6e7Oy8p2psPVzcX
   63voLxc5UK25Sz0gMOg+sXzMirsq5+CIeFi1m4qTAIfXSk7OWfN/wsBZi
   Xyv9lEqg4oi+lket6rfYgCosBaF4ggsK/OcJNNHJuFF+yANCpwTd7/ipR
   g==;
X-CSE-ConnectionGUID: 3tzh+16TT96Q0F8UchCUDw==
X-CSE-MsgGUID: Gbowv9WRR+ijgXAJJeDOpw==
X-IronPort-AV: E=McAfee;i="6700,10204,11202"; a="48462832"
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="48462832"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Sep 2024 16:19:11 -0700
X-CSE-ConnectionGUID: k3iMeVXXRUqUrnIp1/mpUg==
X-CSE-MsgGUID: sUuArkVOT1i2RR1IJlBuWg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,248,1719903600"; 
   d="scan'208";a="94010481"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 21 Sep 2024 16:19:09 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ss9Na-000Fs6-3C;
	Sat, 21 Sep 2024 23:19:06 +0000
Date: Sun, 22 Sep 2024 07:18:44 +0800
From: kernel test robot <lkp@intel.com>
To: kaiyang2@cs.cmu.edu
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 2/4] calculate memory.low for the local node and
 track its usage
Message-ID: <202409220804.TAoLKEBm-lkp@intel.com>
References: <20240920221202.1734227-3-kaiyang2@cs.cmu.edu>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240920221202.1734227-3-kaiyang2@cs.cmu.edu>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]
[also build test WARNING on linus/master next-20240920]
[cannot apply to tip/sched/core v6.11]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/kaiyang2-cs-cmu-edu/Add-get_cgroup_local_usage-for-estimating-the-top-tier-memory-usage/20240921-061404
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240920221202.1734227-3-kaiyang2%40cs.cmu.edu
patch subject: [RFC PATCH 2/4] calculate memory.low for the local node and track its usage
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20240922/202409220804.TAoLKEBm-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240922/202409220804.TAoLKEBm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409220804.TAoLKEBm-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/page_counter.c:268: warning: Function parameter or struct member 'nr_pages_local' not described in 'page_counter_set_low'
>> mm/page_counter.c:443: warning: Function parameter or struct member 'is_local' not described in 'page_counter_calculate_protection'


vim +268 mm/page_counter.c

bf8d5d52ffe89a Roman Gushchin    2018-06-07  258  
230671533d6463 Roman Gushchin    2018-06-07  259  /**
230671533d6463 Roman Gushchin    2018-06-07  260   * page_counter_set_low - set the amount of protected memory
230671533d6463 Roman Gushchin    2018-06-07  261   * @counter: counter
230671533d6463 Roman Gushchin    2018-06-07  262   * @nr_pages: value to set
230671533d6463 Roman Gushchin    2018-06-07  263   *
230671533d6463 Roman Gushchin    2018-06-07  264   * The caller must serialize invocations on the same counter.
230671533d6463 Roman Gushchin    2018-06-07  265   */
6f4c005a5f8b8f Kaiyang Zhao      2024-09-20  266  void page_counter_set_low(struct page_counter *counter, unsigned long nr_pages,
6f4c005a5f8b8f Kaiyang Zhao      2024-09-20  267  				unsigned long nr_pages_local)
230671533d6463 Roman Gushchin    2018-06-07 @268  {
230671533d6463 Roman Gushchin    2018-06-07  269  	struct page_counter *c;
230671533d6463 Roman Gushchin    2018-06-07  270  
f86b810c2610b0 Chris Down        2020-04-01  271  	WRITE_ONCE(counter->low, nr_pages);
6f4c005a5f8b8f Kaiyang Zhao      2024-09-20  272  	WRITE_ONCE(counter->locallow, nr_pages_local);
230671533d6463 Roman Gushchin    2018-06-07  273  
230671533d6463 Roman Gushchin    2018-06-07  274  	for (c = counter; c; c = c->parent)
6f4c005a5f8b8f Kaiyang Zhao      2024-09-20  275  		propagate_protected_usage(c, atomic_long_read(&c->usage),
6f4c005a5f8b8f Kaiyang Zhao      2024-09-20  276  				get_cgroup_local_usage(counter->memcg, false));
230671533d6463 Roman Gushchin    2018-06-07  277  }
230671533d6463 Roman Gushchin    2018-06-07  278  
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  279  /**
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  280   * page_counter_memparse - memparse() for page counter limits
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  281   * @buf: string to parse
650c5e565492f9 Johannes Weiner   2015-02-11  282   * @max: string meaning maximum possible value
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  283   * @nr_pages: returns the result in number of pages
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  284   *
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  285   * Returns -EINVAL, or 0 and @nr_pages on success.  @nr_pages will be
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  286   * limited to %PAGE_COUNTER_MAX.
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  287   */
650c5e565492f9 Johannes Weiner   2015-02-11  288  int page_counter_memparse(const char *buf, const char *max,
650c5e565492f9 Johannes Weiner   2015-02-11  289  			  unsigned long *nr_pages)
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  290  {
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  291  	char *end;
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  292  	u64 bytes;
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  293  
650c5e565492f9 Johannes Weiner   2015-02-11  294  	if (!strcmp(buf, max)) {
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  295  		*nr_pages = PAGE_COUNTER_MAX;
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  296  		return 0;
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  297  	}
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  298  
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  299  	bytes = memparse(buf, &end);
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  300  	if (*end != '\0')
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  301  		return -EINVAL;
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  302  
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  303  	*nr_pages = min(bytes / PAGE_SIZE, (u64)PAGE_COUNTER_MAX);
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  304  
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  305  	return 0;
3e32cb2e0a12b6 Johannes Weiner   2014-12-10  306  }
a8585ac6862198 Maarten Lankhorst 2024-07-03  307  
a8585ac6862198 Maarten Lankhorst 2024-07-03  308  
941ce635234162 Roman Gushchin    2024-07-26  309  #ifdef CONFIG_MEMCG
a8585ac6862198 Maarten Lankhorst 2024-07-03  310  /*
a8585ac6862198 Maarten Lankhorst 2024-07-03  311   * This function calculates an individual page counter's effective
a8585ac6862198 Maarten Lankhorst 2024-07-03  312   * protection which is derived from its own memory.min/low, its
a8585ac6862198 Maarten Lankhorst 2024-07-03  313   * parent's and siblings' settings, as well as the actual memory
a8585ac6862198 Maarten Lankhorst 2024-07-03  314   * distribution in the tree.
a8585ac6862198 Maarten Lankhorst 2024-07-03  315   *
a8585ac6862198 Maarten Lankhorst 2024-07-03  316   * The following rules apply to the effective protection values:
a8585ac6862198 Maarten Lankhorst 2024-07-03  317   *
a8585ac6862198 Maarten Lankhorst 2024-07-03  318   * 1. At the first level of reclaim, effective protection is equal to
a8585ac6862198 Maarten Lankhorst 2024-07-03  319   *    the declared protection in memory.min and memory.low.
a8585ac6862198 Maarten Lankhorst 2024-07-03  320   *
a8585ac6862198 Maarten Lankhorst 2024-07-03  321   * 2. To enable safe delegation of the protection configuration, at
a8585ac6862198 Maarten Lankhorst 2024-07-03  322   *    subsequent levels the effective protection is capped to the
a8585ac6862198 Maarten Lankhorst 2024-07-03  323   *    parent's effective protection.
a8585ac6862198 Maarten Lankhorst 2024-07-03  324   *
a8585ac6862198 Maarten Lankhorst 2024-07-03  325   * 3. To make complex and dynamic subtrees easier to configure, the
a8585ac6862198 Maarten Lankhorst 2024-07-03  326   *    user is allowed to overcommit the declared protection at a given
a8585ac6862198 Maarten Lankhorst 2024-07-03  327   *    level. If that is the case, the parent's effective protection is
a8585ac6862198 Maarten Lankhorst 2024-07-03  328   *    distributed to the children in proportion to how much protection
a8585ac6862198 Maarten Lankhorst 2024-07-03  329   *    they have declared and how much of it they are utilizing.
a8585ac6862198 Maarten Lankhorst 2024-07-03  330   *
a8585ac6862198 Maarten Lankhorst 2024-07-03  331   *    This makes distribution proportional, but also work-conserving:
a8585ac6862198 Maarten Lankhorst 2024-07-03  332   *    if one counter claims much more protection than it uses memory,
a8585ac6862198 Maarten Lankhorst 2024-07-03  333   *    the unused remainder is available to its siblings.
a8585ac6862198 Maarten Lankhorst 2024-07-03  334   *
a8585ac6862198 Maarten Lankhorst 2024-07-03  335   * 4. Conversely, when the declared protection is undercommitted at a
a8585ac6862198 Maarten Lankhorst 2024-07-03  336   *    given level, the distribution of the larger parental protection
a8585ac6862198 Maarten Lankhorst 2024-07-03  337   *    budget is NOT proportional. A counter's protection from a sibling
a8585ac6862198 Maarten Lankhorst 2024-07-03  338   *    is capped to its own memory.min/low setting.
a8585ac6862198 Maarten Lankhorst 2024-07-03  339   *
a8585ac6862198 Maarten Lankhorst 2024-07-03  340   * 5. However, to allow protecting recursive subtrees from each other
a8585ac6862198 Maarten Lankhorst 2024-07-03  341   *    without having to declare each individual counter's fixed share
a8585ac6862198 Maarten Lankhorst 2024-07-03  342   *    of the ancestor's claim to protection, any unutilized -
a8585ac6862198 Maarten Lankhorst 2024-07-03  343   *    "floating" - protection from up the tree is distributed in
a8585ac6862198 Maarten Lankhorst 2024-07-03  344   *    proportion to each counter's *usage*. This makes the protection
a8585ac6862198 Maarten Lankhorst 2024-07-03  345   *    neutral wrt sibling cgroups and lets them compete freely over
a8585ac6862198 Maarten Lankhorst 2024-07-03  346   *    the shared parental protection budget, but it protects the
a8585ac6862198 Maarten Lankhorst 2024-07-03  347   *    subtree as a whole from neighboring subtrees.
a8585ac6862198 Maarten Lankhorst 2024-07-03  348   *
a8585ac6862198 Maarten Lankhorst 2024-07-03  349   * Note that 4. and 5. are not in conflict: 4. is about protecting
a8585ac6862198 Maarten Lankhorst 2024-07-03  350   * against immediate siblings whereas 5. is about protecting against
a8585ac6862198 Maarten Lankhorst 2024-07-03  351   * neighboring subtrees.
a8585ac6862198 Maarten Lankhorst 2024-07-03  352   */
a8585ac6862198 Maarten Lankhorst 2024-07-03  353  static unsigned long effective_protection(unsigned long usage,
a8585ac6862198 Maarten Lankhorst 2024-07-03  354  					  unsigned long parent_usage,
a8585ac6862198 Maarten Lankhorst 2024-07-03  355  					  unsigned long setting,
a8585ac6862198 Maarten Lankhorst 2024-07-03  356  					  unsigned long parent_effective,
a8585ac6862198 Maarten Lankhorst 2024-07-03  357  					  unsigned long siblings_protected,
a8585ac6862198 Maarten Lankhorst 2024-07-03  358  					  bool recursive_protection)
a8585ac6862198 Maarten Lankhorst 2024-07-03  359  {
a8585ac6862198 Maarten Lankhorst 2024-07-03  360  	unsigned long protected;
a8585ac6862198 Maarten Lankhorst 2024-07-03  361  	unsigned long ep;
a8585ac6862198 Maarten Lankhorst 2024-07-03  362  
a8585ac6862198 Maarten Lankhorst 2024-07-03  363  	protected = min(usage, setting);
a8585ac6862198 Maarten Lankhorst 2024-07-03  364  	/*
a8585ac6862198 Maarten Lankhorst 2024-07-03  365  	 * If all cgroups at this level combined claim and use more
a8585ac6862198 Maarten Lankhorst 2024-07-03  366  	 * protection than what the parent affords them, distribute
a8585ac6862198 Maarten Lankhorst 2024-07-03  367  	 * shares in proportion to utilization.
a8585ac6862198 Maarten Lankhorst 2024-07-03  368  	 *
a8585ac6862198 Maarten Lankhorst 2024-07-03  369  	 * We are using actual utilization rather than the statically
a8585ac6862198 Maarten Lankhorst 2024-07-03  370  	 * claimed protection in order to be work-conserving: claimed
a8585ac6862198 Maarten Lankhorst 2024-07-03  371  	 * but unused protection is available to siblings that would
a8585ac6862198 Maarten Lankhorst 2024-07-03  372  	 * otherwise get a smaller chunk than what they claimed.
a8585ac6862198 Maarten Lankhorst 2024-07-03  373  	 */
a8585ac6862198 Maarten Lankhorst 2024-07-03  374  	if (siblings_protected > parent_effective)
a8585ac6862198 Maarten Lankhorst 2024-07-03  375  		return protected * parent_effective / siblings_protected;
a8585ac6862198 Maarten Lankhorst 2024-07-03  376  
a8585ac6862198 Maarten Lankhorst 2024-07-03  377  	/*
a8585ac6862198 Maarten Lankhorst 2024-07-03  378  	 * Ok, utilized protection of all children is within what the
a8585ac6862198 Maarten Lankhorst 2024-07-03  379  	 * parent affords them, so we know whatever this child claims
a8585ac6862198 Maarten Lankhorst 2024-07-03  380  	 * and utilizes is effectively protected.
a8585ac6862198 Maarten Lankhorst 2024-07-03  381  	 *
a8585ac6862198 Maarten Lankhorst 2024-07-03  382  	 * If there is unprotected usage beyond this value, reclaim
a8585ac6862198 Maarten Lankhorst 2024-07-03  383  	 * will apply pressure in proportion to that amount.
a8585ac6862198 Maarten Lankhorst 2024-07-03  384  	 *
a8585ac6862198 Maarten Lankhorst 2024-07-03  385  	 * If there is unutilized protection, the cgroup will be fully
a8585ac6862198 Maarten Lankhorst 2024-07-03  386  	 * shielded from reclaim, but we do return a smaller value for
a8585ac6862198 Maarten Lankhorst 2024-07-03  387  	 * protection than what the group could enjoy in theory. This
a8585ac6862198 Maarten Lankhorst 2024-07-03  388  	 * is okay. With the overcommit distribution above, effective
a8585ac6862198 Maarten Lankhorst 2024-07-03  389  	 * protection is always dependent on how memory is actually
a8585ac6862198 Maarten Lankhorst 2024-07-03  390  	 * consumed among the siblings anyway.
a8585ac6862198 Maarten Lankhorst 2024-07-03  391  	 */
a8585ac6862198 Maarten Lankhorst 2024-07-03  392  	ep = protected;
a8585ac6862198 Maarten Lankhorst 2024-07-03  393  
a8585ac6862198 Maarten Lankhorst 2024-07-03  394  	/*
a8585ac6862198 Maarten Lankhorst 2024-07-03  395  	 * If the children aren't claiming (all of) the protection
a8585ac6862198 Maarten Lankhorst 2024-07-03  396  	 * afforded to them by the parent, distribute the remainder in
a8585ac6862198 Maarten Lankhorst 2024-07-03  397  	 * proportion to the (unprotected) memory of each cgroup. That
a8585ac6862198 Maarten Lankhorst 2024-07-03  398  	 * way, cgroups that aren't explicitly prioritized wrt each
a8585ac6862198 Maarten Lankhorst 2024-07-03  399  	 * other compete freely over the allowance, but they are
a8585ac6862198 Maarten Lankhorst 2024-07-03  400  	 * collectively protected from neighboring trees.
a8585ac6862198 Maarten Lankhorst 2024-07-03  401  	 *
a8585ac6862198 Maarten Lankhorst 2024-07-03  402  	 * We're using unprotected memory for the weight so that if
a8585ac6862198 Maarten Lankhorst 2024-07-03  403  	 * some cgroups DO claim explicit protection, we don't protect
a8585ac6862198 Maarten Lankhorst 2024-07-03  404  	 * the same bytes twice.
a8585ac6862198 Maarten Lankhorst 2024-07-03  405  	 *
a8585ac6862198 Maarten Lankhorst 2024-07-03  406  	 * Check both usage and parent_usage against the respective
a8585ac6862198 Maarten Lankhorst 2024-07-03  407  	 * protected values. One should imply the other, but they
a8585ac6862198 Maarten Lankhorst 2024-07-03  408  	 * aren't read atomically - make sure the division is sane.
a8585ac6862198 Maarten Lankhorst 2024-07-03  409  	 */
a8585ac6862198 Maarten Lankhorst 2024-07-03  410  	if (!recursive_protection)
a8585ac6862198 Maarten Lankhorst 2024-07-03  411  		return ep;
a8585ac6862198 Maarten Lankhorst 2024-07-03  412  
a8585ac6862198 Maarten Lankhorst 2024-07-03  413  	if (parent_effective > siblings_protected &&
a8585ac6862198 Maarten Lankhorst 2024-07-03  414  	    parent_usage > siblings_protected &&
a8585ac6862198 Maarten Lankhorst 2024-07-03  415  	    usage > protected) {
a8585ac6862198 Maarten Lankhorst 2024-07-03  416  		unsigned long unclaimed;
a8585ac6862198 Maarten Lankhorst 2024-07-03  417  
a8585ac6862198 Maarten Lankhorst 2024-07-03  418  		unclaimed = parent_effective - siblings_protected;
a8585ac6862198 Maarten Lankhorst 2024-07-03  419  		unclaimed *= usage - protected;
a8585ac6862198 Maarten Lankhorst 2024-07-03  420  		unclaimed /= parent_usage - siblings_protected;
a8585ac6862198 Maarten Lankhorst 2024-07-03  421  
a8585ac6862198 Maarten Lankhorst 2024-07-03  422  		ep += unclaimed;
a8585ac6862198 Maarten Lankhorst 2024-07-03  423  	}
a8585ac6862198 Maarten Lankhorst 2024-07-03  424  
a8585ac6862198 Maarten Lankhorst 2024-07-03  425  	return ep;
a8585ac6862198 Maarten Lankhorst 2024-07-03  426  }
a8585ac6862198 Maarten Lankhorst 2024-07-03  427  
a8585ac6862198 Maarten Lankhorst 2024-07-03  428  
a8585ac6862198 Maarten Lankhorst 2024-07-03  429  /**
a8585ac6862198 Maarten Lankhorst 2024-07-03  430   * page_counter_calculate_protection - check if memory consumption is in the normal range
a8585ac6862198 Maarten Lankhorst 2024-07-03  431   * @root: the top ancestor of the sub-tree being checked
a8585ac6862198 Maarten Lankhorst 2024-07-03  432   * @counter: the page_counter the counter to update
a8585ac6862198 Maarten Lankhorst 2024-07-03  433   * @recursive_protection: Whether to use memory_recursiveprot behavior.
a8585ac6862198 Maarten Lankhorst 2024-07-03  434   *
a8585ac6862198 Maarten Lankhorst 2024-07-03  435   * Calculates elow/emin thresholds for given page_counter.
a8585ac6862198 Maarten Lankhorst 2024-07-03  436   *
a8585ac6862198 Maarten Lankhorst 2024-07-03  437   * WARNING: This function is not stateless! It can only be used as part
a8585ac6862198 Maarten Lankhorst 2024-07-03  438   *          of a top-down tree iteration, not for isolated queries.
a8585ac6862198 Maarten Lankhorst 2024-07-03  439   */
a8585ac6862198 Maarten Lankhorst 2024-07-03  440  void page_counter_calculate_protection(struct page_counter *root,
a8585ac6862198 Maarten Lankhorst 2024-07-03  441  				       struct page_counter *counter,
6f4c005a5f8b8f Kaiyang Zhao      2024-09-20  442  				       bool recursive_protection, int is_local)
a8585ac6862198 Maarten Lankhorst 2024-07-03 @443  {

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
