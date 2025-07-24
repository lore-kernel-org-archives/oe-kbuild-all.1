Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7F422AE75
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Jul 2025 07:58:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753343939; cv=none; b=ELVL842+ExthRRRvJPiHyQgYdOpU1/9DodDnMa0pPk+9SAlESWVH7sgSAVXxuIwGHD7dmexbNFqbZw4Z+4ZSXqp4P2rCmwGdARLckaYPzu5sJt39vOHS1hWcdIYaGylqpLifJ15xjBmeSdCS8liM+wcJB1UL39Nuv/vTv523HWA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753343939; c=relaxed/simple;
	bh=z6d5OongNRhYhJRrkKuTLSz52933DkgE5FMgCF2tgKU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JkChqrs5Wp6Q2FWfyE0KMSuYIJzgL35j8do9LjobhHKZJhaRgICll8FVQrEfdl6vKk2cMXqDsIs06w7ld1NSMVai1aTqsEHdW7bUJXMVA1rvrzYV60nFrULqSUoUB44dCkFdXUFcJFqLCvUV2aj4xVvW0izaJRgCOIKYFKtMrC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Rk5QX62U; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Rk5QX62U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753343938; x=1784879938;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=z6d5OongNRhYhJRrkKuTLSz52933DkgE5FMgCF2tgKU=;
  b=Rk5QX62UfiHpZKv0dQtBGayglmI0yqgaxFT5eogVLqYEoRhmvmolAOSD
   yQ7Ot0lEQ2Qq2bC+EBULmbPcbjNni0BsJj7109Tb1lnq9Bnn70WO5BuGT
   33rczwKEAQ61CKENb5Xl4AoHd5zd85PIbqfkAwuueW9UTYTP3hdmNG7In
   +p9OBUAi1N4cCU0Zs6KhFGHWR0w/Bfk3+yGMc80RbMB71j47PMq1FHMe6
   v+Tibpqhyo7v2QqJdS/cIGDixQG9PA0DKAsly4XrYhypQGIkc3BzC1Efm
   BoBt4gQWiA/3DKPmLEY1jBMG87YBFy4oahfKs0GOBKFdsAUA27BmwZBS/
   Q==;
X-CSE-ConnectionGUID: tF/XJXJrTrePeS9wKbh4yg==
X-CSE-MsgGUID: LWzqCkEhRKyKa88UkYGtFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="73103346"
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="73103346"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Jul 2025 00:58:58 -0700
X-CSE-ConnectionGUID: YwFmrV8hR2+MwQ11nJu9qA==
X-CSE-MsgGUID: 4V77JqgvQY6SR8f2mVckvw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,336,1744095600"; 
   d="scan'208";a="164133662"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 24 Jul 2025 00:58:56 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueqqs-000KCB-0o;
	Thu, 24 Jul 2025 07:58:54 +0000
Date: Thu, 24 Jul 2025 15:58:48 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:slub-percpu-sheaves-v5-benchmarking 2/18]
 lib/tests/slub_kunit.c:352:undefined reference to `__aeabi_uldivmod'
Message-ID: <202507241528.1ofHjOZN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git slub-percpu-sheaves-v5-benchmarking
head:   48110dabe236d9bcd71448dc4ef1cf7091b0ac1a
commit: 3def9df24be06fd609395f178d0cecec2c02154e [2/18] slub_kunit: sheaves microbenchmark
config: arm-randconfig-004-20250724 (https://download.01.org/0day-ci/archive/20250724/202507241528.1ofHjOZN-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250724/202507241528.1ofHjOZN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507241528.1ofHjOZN-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: lib/tests/slub_kunit.o: in function `do_bench':
>> lib/tests/slub_kunit.c:352:(.text.unlikely+0x1c6): undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: (__aeabi_uldivmod): Unknown destination type (ARM/Thumb) in lib/tests/slub_kunit.o
>> lib/tests/slub_kunit.c:352:(.text.unlikely+0x1c6): dangerous relocation: unsupported relocation


vim +352 lib/tests/slub_kunit.c

   309	
   310	static unsigned long long
   311	do_bench(struct kmem_cache *s, int iters, int total, int batch, bool shuffle)
   312	{
   313		void **ptrs;
   314		cycles_t start, end;
   315		cycles_t sum = 0;
   316		unsigned int *rndidx;
   317	
   318		ptrs = kmalloc_array(batch, sizeof(void *), GFP_KERNEL);
   319		if (shuffle)
   320			rndidx = kmalloc_array(batch, sizeof(unsigned int), GFP_KERNEL);
   321	
   322		for (int iter = 0; iter < iters + 1; iter++) {
   323			if (shuffle)
   324				shuffled_array(rndidx, batch);
   325	
   326			start = get_cycles();
   327	
   328			if (!shuffle) {
   329				for (int i = 0; i < total / batch; i++) {
   330					for (int j = 0; j < batch; j++)
   331						ptrs[j] = kmem_cache_alloc(s, GFP_KERNEL);
   332					for (int j = 0; j < batch; j++)
   333						kmem_cache_free(s, ptrs[j]);
   334				}
   335			} else {
   336				for (int i = 0; i < total / batch; i++) {
   337					for (int j = 0; j < batch; j++)
   338						ptrs[j] = kmem_cache_alloc(s, GFP_KERNEL);
   339					for (int j = 0; j < batch; j++)
   340						kmem_cache_free(s, ptrs[rndidx[j]]);
   341				}
   342			}
   343	
   344			end = get_cycles();
   345	
   346			pr_info("iteration: %02d time %llu\n", iter,
   347					(unsigned long long) end - start);
   348			if (iter != 0)
   349				sum += end - start;
   350		}
   351	
 > 352		pr_info("average (excl. iter 0): %llu\n",
   353				(unsigned long long) sum / iters);
   354	
   355		if (shuffle)
   356			kfree(rndidx);
   357		kfree(ptrs);
   358	
   359		kmem_cache_print_stats(s);
   360	
   361		return sum / iters;
   362	}
   363	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
