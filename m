Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75F054C3D6
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Feb 2024 07:18:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706944707; cv=none; b=aN5YIcqJjwfYPFk96Kws2DEWOLzCbvHmtt6jgmOm/JWXoHkqXBi8M0QsGrUpOKNYxnlhQol3fEp+cQiRCK9AIEp2Gbz+Nfy+Lp3Q8w7RF+uIWbANDMa6OV9nNUO0HWzsk8+jwgrtnbsf8wRXoS4GmH93C2DIZ9+d903vshQ3r+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706944707; c=relaxed/simple;
	bh=lYGSulgBKmiXnOASMnbumSZB09g+AZ04NESJO31PedA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=pniibotBEzxavdOc6HQpXApKtTGtIMIKEbTs0yj0sAFgKWGmkx8qm++f0ByTuKDWIhTh/H9kbLeoSIOCWYXAK+a3nKuTN72L/e6XAwcinilMLC+QhaHh8lj03LtchJG8pfT4Adr40ZoGpNY0IH9vFi/pn1g5zFV9zgLRtPeMh1E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mG66w+/r; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mG66w+/r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706944705; x=1738480705;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=lYGSulgBKmiXnOASMnbumSZB09g+AZ04NESJO31PedA=;
  b=mG66w+/rMMg8q4yiThn0NAcIgJ4/hOYlPLDuzVApuY7Ybd6jPG9uuRsj
   oRgB+wdUc7CPRb9d6oq2fgPvIYs7Mo7u4Dw6xk0bI6cee0LERf14Ecv6N
   oTAkTmzIGBR9L73e+HonkJnMfA1maxnwH3KnU2MVnpr9gbf7aQTz52zlP
   /dftvjb+BPnW6IAX/oS4Mv14veUheqsWjpm4IwbcdnMBzVG3eHVhfOUch
   D2LdzgwUoFTEFVbLGy5jphCfmsvGUoFAI6zCARzmmpytAiVNGz81Dam9/
   +ZJlMbXNsWKSSVww209q9SUCyEcGiaY5dX9K8wDX2OJwMvrlerhPpjsuo
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="22771143"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="22771143"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2024 23:18:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10971"; a="908791453"
X-IronPort-AV: E=Sophos;i="6.05,240,1701158400"; 
   d="scan'208";a="908791453"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 02 Feb 2024 23:18:22 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rWAI8-0004jm-08;
	Sat, 03 Feb 2024 07:18:20 +0000
Date: Sat, 3 Feb 2024 15:17:59 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slub-percpu-caches-v4r0 2/6] mm/slub.c:4840:15: sparse:
 sparse: incorrect type in argument 1 (different address spaces)
Message-ID: <202402031522.gfPVqSoT-lkp@intel.com>
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
config: loongarch-randconfig-r132-20240203 (https://download.01.org/0day-ci/archive/20240203/202402031522.gfPVqSoT-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240203/202402031522.gfPVqSoT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402031522.gfPVqSoT-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   mm/slub.c:4840:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4840:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:4840:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
>> mm/slub.c:4840:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4840:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:4840:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
>> mm/slub.c:4840:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4840:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:4840:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
>> mm/slub.c:4840:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4840:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:4840:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
>> mm/slub.c:4840:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4840:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:4840:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:4840:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:4840:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:4840:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:4878:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4878:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:4878:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:4878:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4878:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:4878:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:4878:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4878:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:4878:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:4878:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4878:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:4878:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:4878:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:4878:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:4878:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:4878:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:4878:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:4878:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c: note: in included file (through include/linux/smp.h, include/linux/lockdep.h, include/linux/spinlock.h, ...):
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   mm/slub.c:2903:55: sparse: sparse: context imbalance in '__put_partials' - unexpected unlock
   mm/slub.c:3841:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3841:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3841:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3841:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3841:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3841:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3841:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@
   mm/slub.c:3841:13: sparse:     expected struct slub_percpu_array *pca
   mm/slub.c:3841:13: sparse:     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__
   mm/slub.c:3841:15: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void const [noderef] __percpu *__vpp_verify @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void const [noderef] __percpu *__vpp_verify
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:15: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected void [noderef] __percpu *ptr @@     got struct slub_percpu_array [noderef] __percpu ** @@
   mm/slub.c:3841:15: sparse:     expected void [noderef] __percpu *ptr
   mm/slub.c:3841:15: sparse:     got struct slub_percpu_array [noderef] __percpu **
   mm/slub.c:3841:13: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected struct slub_percpu_array *pca @@     got struct slub_percpu_array [noderef] __percpu *[assigned] pscr_ret__ @@

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
