Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80151C01
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 01:17:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721870268; cv=none; b=OZtmmfQuky2MKlG53+Xx9SPgrsAxT66XFkoz7Q867vE7ZkPPkmEP65UYwwSYg1F/Eri3lwUZS0cV6lWFGYFo8GImv3EcQ8W6E4IvTAeLW4cWab5XM4sVPJtQfzBDb8lJYaxznCvzWKwSXkRJkjszBcMEDaz9MpDMDSzWa7IlprY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721870268; c=relaxed/simple;
	bh=4Udlgvvsc12QQfb9QPMZHwR1cXZO1/NGITqc0sr+h1M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DTKlVHJ0IGk3aaT+I1GZHxIViYRoyvf2n8WHKMCGvMzI1GN8aGKYEPEqmoyL9sEUP1+AAfBsLZLyJ6oIyelH/l14kGe93iIu7mvtZrVeHpKYI8iczciVk4MnMcEUy2vZB4VJu3k1sFpMPQ3RsUEhy5zGHsaEP1RQ3/uvYqmH3C0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lc5/MSwI; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lc5/MSwI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1721870266; x=1753406266;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=4Udlgvvsc12QQfb9QPMZHwR1cXZO1/NGITqc0sr+h1M=;
  b=Lc5/MSwI+SM/qftDiSZQ6rDX97Pe3Msj4StGVfz2sMZ7T6o2XLEtA+UI
   PGj6iU4pf4HiuHd6hCtlm56M3nWyj1bx1v0TijJ9Pe/gXUizwtZ3NZyzg
   eUDAk1y4C1Q8z3g1GYZwrE76Y+uWZiYtd+KtWwBJgCA5uYmQcog8CzelQ
   tDZHI+gtOwR08v7wHpH0ep5T8NynhncJzEizgZ1uTIOlcKJo3V12wrYqh
   bi4Mjz0FfkqGcv+VGLDC8IxczfV4HzvjkjnENo/PQQ0R8DUrDl99xxh0i
   66im/fBXwVww0jNYffqdkAg7cYaentMWYAFg7OtKshbuE7Lcu2v8ZtQaV
   g==;
X-CSE-ConnectionGUID: EtRq2M8jSnywvUSzwTITPg==
X-CSE-MsgGUID: nIS88W2hRPm4DZSS8eIhEg==
X-IronPort-AV: E=McAfee;i="6700,10204,11143"; a="19435347"
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; 
   d="scan'208";a="19435347"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2024 18:17:46 -0700
X-CSE-ConnectionGUID: LMUSsU/CScm1vtSMPjaGVA==
X-CSE-MsgGUID: Osix0bA5Ruat+w9XVjCyuw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,234,1716274800"; 
   d="scan'208";a="57557512"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 24 Jul 2024 18:17:44 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sWn70-000ndM-0i;
	Thu, 25 Jul 2024 01:17:42 +0000
Date: Thu, 25 Jul 2024 09:17:22 +0800
From: kernel test robot <lkp@intel.com>
To: Barry Song <21cnbao@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 5/5] non-mm: discourage the usage of __GFP_NOFAIL and
 encourage GFP_NOFAIL
Message-ID: <202407250848.1RB1y5JP-lkp@intel.com>
References: <20240724085544.299090-6-21cnbao@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240724085544.299090-6-21cnbao@gmail.com>

Hi Barry,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Barry-Song/vpda-try-to-fix-the-potential-crash-due-to-misusing-__GFP_NOFAIL/20240724-170305
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20240724085544.299090-6-21cnbao%40gmail.com
patch subject: [PATCH RFC 5/5] non-mm: discourage the usage of __GFP_NOFAIL and encourage GFP_NOFAIL
config: openrisc-allnoconfig (https://download.01.org/0day-ci/archive/20240725/202407250848.1RB1y5JP-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240725/202407250848.1RB1y5JP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407250848.1RB1y5JP-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/rhashtable.c: In function 'bucket_table_alloc':
>> lib/rhashtable.c:192:48: warning: bitwise comparison always evaluates to true [-Wtautological-compare]
     192 |         if (tbl == NULL && (gfp & ~GFP_NOFAIL) != GFP_KERNEL) {
         |                                                ^~


vim +192 lib/rhashtable.c

   176	
   177	static struct bucket_table *bucket_table_alloc(struct rhashtable *ht,
   178						       size_t nbuckets,
   179						       gfp_t gfp)
   180	{
   181		struct bucket_table *tbl = NULL;
   182		size_t size;
   183		int i;
   184		static struct lock_class_key __key;
   185	
   186		tbl = alloc_hooks_tag(ht->alloc_tag,
   187				kvmalloc_node_noprof(struct_size(tbl, buckets, nbuckets),
   188						     gfp|__GFP_ZERO, NUMA_NO_NODE));
   189	
   190		size = nbuckets;
   191	
 > 192		if (tbl == NULL && (gfp & ~GFP_NOFAIL) != GFP_KERNEL) {
   193			tbl = nested_bucket_table_alloc(ht, nbuckets, gfp);
   194			nbuckets = 0;
   195		}
   196	
   197		if (tbl == NULL)
   198			return NULL;
   199	
   200		lockdep_init_map(&tbl->dep_map, "rhashtable_bucket", &__key, 0);
   201	
   202		tbl->size = size;
   203	
   204		rcu_head_init(&tbl->rcu);
   205		INIT_LIST_HEAD(&tbl->walkers);
   206	
   207		tbl->hash_rnd = get_random_u32();
   208	
   209		for (i = 0; i < nbuckets; i++)
   210			INIT_RHT_NULLS_HEAD(tbl->buckets[i]);
   211	
   212		return tbl;
   213	}
   214	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
