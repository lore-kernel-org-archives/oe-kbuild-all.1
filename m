Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E2822EAEA
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 14:43:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706971417; cv=none; b=BExF4qJkXvchGFr1CVTiOcDqK2FnVvhleZmphnPHydLQJV/A0ZdSwuTnb8wKcch3fa5/4/7C0zMFmWd+PGa9yVzfAyhvqih5wyKuYx8JPbOXRwuZPB2kcB+7fSNU5qGBnNUasWQQ+7kNtvTXcFazi8QtD+o9omxKDeVgEJ4bSwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706971417; c=relaxed/simple;
	bh=jBbJKlgYGy1s4cxCnWE7prPpVBOowQ630daJocJpiTw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=nw6yDjaqCJItfHXZyk8hhWzc26+5R2Z5TOGjZV7kdnYha9a8m6jxtun0K+oQEz0Xou8y82c6yg4UWbKLbWrBJgdPT3nOBcbcu1XCS/ThtW/jEteyTYmzqfWAvrBrKzLTOr/tmlsaCgBgho8/eHXlYvgSmKedk3oXe8OdQhvdZws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i5WP/jiX; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i5WP/jiX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706971415; x=1738507415;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jBbJKlgYGy1s4cxCnWE7prPpVBOowQ630daJocJpiTw=;
  b=i5WP/jiX98hkmZJZcBlXY3ViwPtCA5LPPRJcn1NsfoKR4JiFBSaPevr5
   NjKLCHaikrdx2jIqW5cb1/5mScXTCkV2Z7PYk7nW3fWwWTC2Ru4lAryJP
   xuKLf4d1FidTvSjruGbbTEuRoYQcuzjr878kyS1JDu1zt4WCyfi+98f9K
   pz+OtymjMiwDiXrjCs503xUbRG9BtOLn6+ncPIOpCPHndZYv9DSY66nBS
   nVgVqRt36y6EiyIuCQN8ejNUCjS3wVJZ1Ys1U9us89pZU02+1njXNBVVg
   pk1w8AUgSWlzB6TaCY+vh3Clh3vlAYiNdkQw8vms/zofgDACtPe7cvbd3
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10973"; a="484169"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="484169"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 06:43:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="651645"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 03 Feb 2024 06:43:33 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWHEw-0005BZ-2M;
	Sat, 03 Feb 2024 14:43:30 +0000
Date: Sat, 3 Feb 2024 22:42:37 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slub-percpu-caches-v4r1-BROKEN 2/6] mm/slub.c:3079:49:
 sparse: sparse: incorrect type in initializer (different address spaces)
Message-ID: <202402032250.NeNwoRGq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-caches-v4r1-BROKEN
head:   769a361e3d36bf4b006b69c6adbdcd24fe2e470a
commit: 8f3b3550b6d09f88b11b9d89eb1d6a215c48bf98 [2/6] mm/slub: add opt-in percpu array cache of objects
config: x86_64-randconfig-122-20240203 (https://download.01.org/0day-ci/archive/20240203/202402032250.NeNwoRGq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402032250.NeNwoRGq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402032250.NeNwoRGq-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/slub.c:4913:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4913:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:4913:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:4913:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:4913:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:4913:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:4935:23: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4935:23: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:4935:23: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:4935:21: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:4935:21: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:4935:21: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3079:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3079:49: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3079:49: sparse:     got struct slub_percpu_array [noderef] __percpu **
>> mm/slub.c:3079:49: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3079:49: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3079:49: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:4878:24: sparse: sparse: Using plain integer as NULL pointer
   mm/slub.c:4884:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4884:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:4884:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:4884:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:4884:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:4884:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3870:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3870:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3870:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3870:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3870:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3870:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3870:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3870:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3870:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3870:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3870:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3870:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3870:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3870:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3870:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3870:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3870:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3870:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3870:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3870:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3870:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3870:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3870:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3870:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3870:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3870:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3870:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3870:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3870:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3870:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3870:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3870:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3870:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3870:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3870:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3870:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3870:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3870:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3870:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3870:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3870:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3870:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3870:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3870:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3870:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3870:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3870:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3870:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:4218:47: sparse: sparse: context imbalance in '__slab_free' - unexpected unlock
   mm/slub.c:4323:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4323:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:4323:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:4323:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:4323:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:4323:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:4323:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4323:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:4323:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:4323:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:4323:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:4323:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:4357:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4357:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:4357:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:4357:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:4357:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:4357:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3904:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3904:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3904:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3904:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3904:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3904:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__

vim +3079 mm/slub.c

  3062	
  3063	/*
  3064	 * Flush cpu slab.
  3065	 *
  3066	 * Called from CPU work handler with migration disabled.
  3067	 */
  3068	static void flush_cpu_slab(struct work_struct *w)
  3069	{
  3070		struct kmem_cache *s;
  3071		struct kmem_cache_cpu *c;
  3072		struct slub_flush_work *sfw;
  3073	
  3074		sfw = container_of(w, struct slub_flush_work, work);
  3075	
  3076		s = sfw->s;
  3077	
  3078		if (s->cpu_array) {
> 3079			struct slub_percpu_array *pca = this_cpu_read(s->cpu_array);
  3080	
  3081			if (pca->used)
  3082				flush_pca(s, pca->count);
  3083		}
  3084	
  3085		c = this_cpu_ptr(s->cpu_slab);
  3086	
  3087		if (c->slab)
  3088			flush_slab(s, c);
  3089	
  3090		put_partials(s);
  3091	}
  3092	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
