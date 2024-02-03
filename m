Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2253E5D906
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 13:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706968155; cv=none; b=TI96ysUqQxEExsn6w6JDXxX/1PwXGtIQ2L3xkrfNIdciBG41C4aXa1bh2syHVvzwNsI7g8glmlAb7CwFKK6zB1yLRUS/WpF4N4iJdZs9p70JytRntFKEDF5Yvd6LGZR6obQegQ/owHqhCaiT+/XqadlFRiX08AJY9daXkDOoDNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706968155; c=relaxed/simple;
	bh=HycEXiVouMDf8ArJOLhqCUGaFQAy3r9SLjG+auH0X78=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F1R3/kqVG6l1nVgoptS8GBQ20q8082+L4VFkadAcK6zkmZ5r3qom+77NV3lPNKBLvXISqCsaWSgSIjpUGNHVYk23uh1uGlztUZ5wBtWfOwAbQ4nr2tnGGCf4Qy2nAJ9kR+BOWuNqPbwijtrgDJj8QoXd+qvOh6RP1u/J9AgxKVk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bD3wGLFL; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bD3wGLFL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706968153; x=1738504153;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HycEXiVouMDf8ArJOLhqCUGaFQAy3r9SLjG+auH0X78=;
  b=bD3wGLFL9piabb1Xy05Mdtz198ATjw/qnrnq4iP9SLIuPCAU2zkavis7
   y/xmQyC8C6enEn1+3ebwdHJHSA94tb57MKH3reGHsNajqhCSSBFZHD1Ec
   OLBDV91yAqIPs1uxp2181aIREFfPYC+fdAE19mk/wYPV+gKsA7qxzBna1
   z+4+knop6s936o7oEk8RYrvLQOzTchbWa/yaG3i+R6HM0jiI5DPPgEvXQ
   q0pqOD6igo9WjZCrCQUJEel2DArQnDWaOQ1nJluZdZwaArQtE4hOXE3US
   y+6uLNwjbzR1AVyNbabB3Ndw+YH8A9uY9PAjcSvTypRPAOAKkAiSM7+eq
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="487409"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="487409"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Feb 2024 05:49:12 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="4942676"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 03 Feb 2024 05:49:11 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWGOE-000582-1C;
	Sat, 03 Feb 2024 13:49:05 +0000
Date: Sat, 3 Feb 2024 21:48:32 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slub-percpu-caches-v4r1-BROKEN 2/6] mm/slub.c:4878:24:
 sparse: sparse: Using plain integer as NULL pointer
Message-ID: <202402032133.a1H6hilK-lkp@intel.com>
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
config: x86_64-randconfig-121-20240203 (https://download.01.org/0day-ci/archive/20240203/202402032133.a1H6hilK-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402032133.a1H6hilK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402032133.a1H6hilK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/slub.c:4878:24: sparse: sparse: Using plain integer as NULL pointer
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
   mm/slub.c:3904:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3904:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3904:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3904:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3904:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3904:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
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
   mm/slub.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true

vim +4878 mm/slub.c

  4863	
  4864	static void *refill_pca(struct kmem_cache *s, unsigned int count, gfp_t gfp,
  4865				bool want_obj)
  4866	{
  4867		unsigned int batch, allocated;
  4868		struct slub_percpu_array *pca;
  4869		void *objects[PCA_BATCH_MAX];
  4870		unsigned long flags;
  4871		void *obj = NULL;
  4872	
  4873		if (count > PCA_BATCH_MAX)
  4874			return ERR_PTR(-EINVAL);
  4875	
  4876		allocated = __kmem_cache_alloc_bulk(s, gfp, count, &objects[0]);
  4877		if (!allocated)
> 4878			return false;
  4879	
  4880		if (want_obj)
  4881			obj = objects[--allocated];
  4882	
  4883		local_lock_irqsave(&s->cpu_array->lock, flags);
  4884		pca = this_cpu_read(s->cpu_array);
  4885	
  4886		batch = min(allocated, pca->count - pca->used);
  4887	
  4888		for (unsigned int i = 0; i < batch; i++)
  4889			pca->objects[pca->used++] = objects[i];
  4890	
  4891		local_unlock_irqrestore(&s->cpu_array->lock, flags);
  4892	
  4893		stat_add(s, PCA_REFILL, batch);
  4894	
  4895		/*
  4896		 * We could have migrated to a different cpu or somebody else freed to the
  4897		 * pca while we were bulk allocating, and now we have too many objects
  4898		 */
  4899		if (batch < allocated)
  4900			__kmem_cache_free_bulk(s, allocated - batch, &objects[batch]);
  4901	
  4902		return obj;
  4903	}
  4904	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
