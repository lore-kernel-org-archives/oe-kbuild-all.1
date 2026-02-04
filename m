Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4AFE272E6A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Feb 2026 10:06:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770199579; cv=none; b=ooMGqpYYs3nZqDQcbaIXwS+SprH7w+Jh617OPgsuZMl0YKpVcWCR4cBXfH9YRypIzRmAxoyCTUzs4Fd8nxRspNV9h01zmOAz5tSq7cslzkTlnwjrGwvqmiEDf+UDdw6CYgF3Yt1LJb93iESs9UDTR2eDH0NtnwZK8eS3RTyVuSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770199579; c=relaxed/simple;
	bh=2EDTZrfHuRej4wOgRYjVsCkOS7HIHmRDyJymP4OlmCM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=B3lhs/p+f1YiHBkt3AGaBV2nJfp7mr62BFi/yj7IhaCo8VThvS0N3TH7q6ZhGDgKDD5ZRIkWU+7RKBNRnXotmIsG9Vo1e8psZypwNiW2YSS0otAiTyKTvDb7n4ZqyBkA9JEs0ECURCEnGKdKzZQsWCV0q1YTH9HO9mc9qEJU0kA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RsZSn+5y; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RsZSn+5y"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770199579; x=1801735579;
  h=date:from:to:cc:subject:message-id;
  bh=2EDTZrfHuRej4wOgRYjVsCkOS7HIHmRDyJymP4OlmCM=;
  b=RsZSn+5yz/Om1M8o13tsdGbyGaf1GGhpPvnt1HdewUPHHdfe7Bqfjo+X
   en+4QnBpCK/+5YP9DVz7aLslwWpEGJ/2i5Hn5QiQgAJR8Gu2Ub32yTVVo
   Q+i72A655ijMbLww2nX1ZicPHH4LZEg+sjp3crE+wfNsq/1qVUjEyCGPK
   dIs6ivFQoJ8BPyA6abgIamJzOksXlAn+hYD6vc8Gdt5vNMpXsCJ+WOOS3
   ZhLrHbQKbTSPFDYOLjPRqX74mmOgbs75j1zqqQLc6XVfZmIlNDpNSq0mr
   g6BGb0eZpmuPD2Y+VWXteZ2+khxwQJNUE42aI0SIaD5qU5EOgnXojPSPN
   w==;
X-CSE-ConnectionGUID: fMZhoQE8S0adCHzQhVkrmQ==
X-CSE-MsgGUID: hXCoaYkaTTC21iKKK8bvcA==
X-IronPort-AV: E=McAfee;i="6800,10657,11691"; a="71280973"
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="71280973"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Feb 2026 02:06:19 -0800
X-CSE-ConnectionGUID: 6lVpEMlETViWPFgtDkPMLQ==
X-CSE-MsgGUID: 4CVukEYgQzanFSMXOMLMVA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,272,1763452800"; 
   d="scan'208";a="214601410"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Feb 2026 02:06:15 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vnZm1-00000000hfU-0VQo;
	Wed, 04 Feb 2026 10:06:13 +0000
Date: Wed, 04 Feb 2026 18:05:28 +0800
From: kernel test robot <lkp@intel.com>
To: "Liam R. Howlett" <Liam.Howlett@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Memory Management List <linux-mm@kvack.org>
Subject: [akpm-mm:mm-new 102/124] lib/maple_tree.c:3364:38: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202602041809.nfXcWI84-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-new
head:   3b688128ee79df55807d8b3e60e9d0ed62db009d
commit: 8b56f4dfdf0a4aa460fde0212eb270c943288bfa [102/124] maple_tree-add-cp_is_new_root-helper-fix
config: csky-randconfig-r122-20260204 (https://download.01.org/0day-ci/archive/20260204/202602041809.nfXcWI84-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260204/202602041809.nfXcWI84-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602041809.nfXcWI84-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/maple_tree.c:3364:38: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __rcu **slot @@     got void [noderef] __rcu * @@
   lib/maple_tree.c:3364:38: sparse:     expected void [noderef] __rcu **slot
   lib/maple_tree.c:3364:38: sparse:     got void [noderef] __rcu *

vim +3364 lib/maple_tree.c

  3339	
  3340	static inline bool cp_is_new_root(struct maple_copy *cp, struct ma_state *mas)
  3341	{
  3342		if (cp->min || cp->max != ULONG_MAX)
  3343			return false;
  3344	
  3345		if (cp->d_count != 1) {
  3346			enum maple_type mt = maple_arange_64;
  3347	
  3348			if (!mt_is_alloc(mas->tree))
  3349				mt = maple_range_64;
  3350	
  3351			cp->data = cp->d_count;
  3352			cp->s_count = 0;
  3353			dst_setup(cp, mas, mt);
  3354			init_cp_src(cp);
  3355			node_copy(mas, cp->src[0].node, 0, cp->data, cp->max, maple_copy,
  3356				  cp->dst[0].node, 0, mt);
  3357			node_finalise(cp->dst[0].node, mt, cp->end + 1);
  3358			/*
  3359			 * Warning, see cp_leaf_init() comment and rcu_assign_pointer()
  3360			 * documentation.  Since this is a new root, there are no
  3361			 * read-side operations that can view it until it is insert into
  3362			 * the tree after an rcu_assign_pointer() call.
  3363			 */
> 3364			ma_init_slot(cp->slot[0], cp->dst[0].node, mt);
  3365			cp->height++;
  3366		}
  3367		WARN_ON_ONCE(cp->dst[0].node != mte_to_node(
  3368					mt_slot_locked(mas->tree, cp->slot, 0)));
  3369		cp->dst[0].node->parent = ma_parent_ptr(mas_tree_parent(mas));
  3370		mas->min = 0;
  3371		mas->max = ULONG_MAX;
  3372		mas->depth = 0;
  3373		mas->node = mas_root_locked(mas);
  3374		return true;
  3375	}
  3376	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
