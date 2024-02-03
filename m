Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7280882A
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 03:08:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706929721; cv=none; b=otBYjTmXc2nVVNreIZ7DiqZJPZgFujCJ8wLnHEbVCUHYvsJKNiU/KLTM2iAcZ/5rRcLKs4GLY62hF+a3qaGvOjjcegAs3CoZRnAJobSa1TsNdNDkNQZhGth8ePa51bVa5Bb24/VIM64NBfKTAZLpLMoi9Ju3ogW+V+impIA9KS4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706929721; c=relaxed/simple;
	bh=tHiSKgaOvL3uSigNkIR0bgtN0gimP0NB5jsS0H8j1/A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d5g0AB4YFCeYA0AViMwa5iQY6zscVIGqLsaY6HKktoxIuC623BG4nHsvnXseKaZoSyfwKpI20FiJAiCdgK0zQ0d5bni0lOPC8ULDMv902Xkz2zQTb2wNHePnX+HobTQaJWPK+Q+vTu6MKCc9XaKBrUp46EAZGztjIUPAlk6EARw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N0l9F2ef; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N0l9F2ef"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706929718; x=1738465718;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tHiSKgaOvL3uSigNkIR0bgtN0gimP0NB5jsS0H8j1/A=;
  b=N0l9F2efLBzRObrTNvp8ajuVtUdQJQaVQpgUjvSQZzs/qpFSt6W4vM+J
   TfEUPsvvnYRFMUerrcXOuA680oNqWFt+WVR184neUv1ArZho21r7CYgZs
   LpdoOG4WpBv5Z6OgdZ4wQR12YDKWZZy7PQQjAbaW/z+Wzk8nh5x3VsIiF
   kqha73wHKFh05KSwTRMkv39NEFEvNqz4XSPbri+Uaaqzl2Gblm0fooLYi
   3J3U5BsELT3lAAFDZ1Wd/bqkUyAFfK8JhdtDTCsYueiBOzjLzmUskrXeu
   vxywtBpCIGTjyX3xbKAM3SN4g9wrCbVNfXN+dOD0JnsrdGmmcKNJjMTdw
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="200858"
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="200858"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 19:08:38 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,238,1701158400"; 
   d="scan'208";a="4849860"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 02 Feb 2024 19:08:37 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rW6OP-0004aS-1R;
	Sat, 03 Feb 2024 03:08:33 +0000
Date: Sat, 3 Feb 2024 11:07:43 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slub-percpu-caches-v4r0 2/6] mm/slub.c:4840:15: sparse:
 sparse: incorrect type in initializer (different address spaces)
Message-ID: <202402031122.iBOiCkEw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-caches-v4r0
head:   4ed1364ec4fe2aa8d5e6d6b464dfc7939ac08ff1
commit: d80fc960ad716b0d2c8475e1f9007a74afdf5cd8 [2/6] mm/slub: add opt-in percpu array cache of objects
config: x86_64-randconfig-121-20240202 (https://download.01.org/0day-ci/archive/20240203/202402031122.iBOiCkEw-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240203/202402031122.iBOiCkEw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402031122.iBOiCkEw-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> mm/slub.c:4840:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4840:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:4840:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
>> mm/slub.c:4840:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:4840:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:4840:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:4878:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4878:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:4878:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:4878:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:4878:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:4878:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h):
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   mm/slub.c:3841:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3841:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3841:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3841:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3841:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3841:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3841:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3841:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3841:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3841:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3841:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3841:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3841:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3841:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3841:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3841:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3841:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3841:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3841:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3841:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3841:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3841:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3841:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3841:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:242:46: sparse: sparse: self-comparison always evaluates to false
   mm/slub.c:4187:47: sparse: sparse: context imbalance in '__slab_free' - unexpected unlock
   mm/slub.c:4291:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4291:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:4291:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:4291:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:4291:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:4291:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:4291:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4291:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:4291:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:4291:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:4291:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:4291:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:4320:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4320:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:4320:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:4320:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:4320:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:4320:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3873:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3873:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3873:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3873:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3873:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3873:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__

vim +4840 mm/slub.c

  4824	
  4825	static bool refill_pca(struct kmem_cache *s, unsigned int count, gfp_t gfp)
  4826	{
  4827		unsigned int batch, allocated;
  4828		struct slub_percpu_array *pca;
  4829		unsigned long flags;
  4830		void *objects[32];
  4831	
  4832	bulk_alloc:
  4833		batch = min(count, 32U);
  4834	
  4835		allocated = __kmem_cache_alloc_bulk(s, gfp, batch, &objects[0]);
  4836		if (!allocated)
  4837			return false;
  4838	
  4839		local_lock_irqsave(&s->cpu_array->lock, flags);
> 4840		pca = this_cpu_read(s->cpu_array);
  4841	
  4842		batch = min(allocated, pca->count - pca->used);
  4843	
  4844		for (unsigned int i = 0; i < batch; i++) {
  4845			pca->objects[pca->used++] = objects[i];
  4846		}
  4847	
  4848		local_unlock_irqrestore(&s->cpu_array->lock, flags);
  4849	
  4850		stat_add(s, PCA_REFILL, batch);
  4851	
  4852		/*
  4853		 * We could have migrated to a different cpu or somebody else freed to the
  4854		 * pca while we were bulk allocating, and now we have too many objects
  4855		 */
  4856		if (batch < allocated) {
  4857			__kmem_cache_free_bulk(s, allocated - batch, &objects[batch]);
  4858		} else {
  4859			count -= batch;
  4860			if (count > 0)
  4861				goto bulk_alloc;
  4862		}
  4863	
  4864		return true;
  4865	}
  4866	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
