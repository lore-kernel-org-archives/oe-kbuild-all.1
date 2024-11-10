Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 95EF028FC
	for <oe-kbuild-all@lists.linux.dev>; Sun, 10 Nov 2024 02:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731204070; cv=none; b=jxngv4zHA3s4fj34SAaDcFGqBxX58KPxAXZF1s827/Z1z6dplcMnKoZyLBE52pkCz14+0kQe/wqgVRPZsdge9tTEzIyFufbnPO5BehXe+yjFukLXXZ/Z8nUcj20ZKYTaz7GnGmYGXCmiZiaq4XZwhV74KEhmrhHcpw8JKTTlPhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731204070; c=relaxed/simple;
	bh=GjrWwgekmDSWUp+Nq8en9T81UzZzwug5izFVZMxhd40=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=D/x0Ul0dk1I8Gq3zWoDOiKvcVGchGbIBjsb19FzCt2PqqZ4DSxhOGwgVgUCoJHnTSC4oQCgADZzS3SI0tU6bNpS4XN2iXULunRNBQlpzfBpn4qYfgSHdxYCzYKQPge2UFPp79fumYLaQwOzfz4kLdtglWYTB6HNJVsOthPId+Cs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hEaVIw34; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hEaVIw34"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731204068; x=1762740068;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=GjrWwgekmDSWUp+Nq8en9T81UzZzwug5izFVZMxhd40=;
  b=hEaVIw34kWTD9h5tdSRC8L2F1WEnCkoATVKD3OnOuBwKkbPKc466F8pC
   agwkeZ5/DpdcpMJVEjtCZYwz5E2mHEa/nCwRtcLQwrzC/5dIbRLrlyEIX
   wA7twxCcXmOQiqJg9dvo2SiJTFQOI6tlyTOuGuA+SGVoc9uNIMQlQG4lP
   HmyGnRXoMV0Omz6vOxvk1N1grsw5UEjlCkeNvde0PvtxYrBMfiHNyWEp1
   1XGwh7PKd9kFZJOu6iYziyhlWk65qQ1DxX0RUkuBkD1eoxDZMdcZJi0Kb
   QX46AcADR3E+dP9X7A2MpymvVTvmdr0nAL9rwTb2WsnpWm/pXGrrLtBD1
   Q==;
X-CSE-ConnectionGUID: 4wzBNb29ROGE+JDIIuSw4A==
X-CSE-MsgGUID: uX0WqAjASgivIOqCsJZgiQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11251"; a="48564860"
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="48564860"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2024 18:01:08 -0800
X-CSE-ConnectionGUID: H6znP6EfQeuBdcp9B8Nhjg==
X-CSE-MsgGUID: gDpOVrDlS46UzHa7aLr9oA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,142,1728975600"; 
   d="scan'208";a="86415357"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 09 Nov 2024 18:01:06 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9xGC-000spE-2f;
	Sun, 10 Nov 2024 02:01:04 +0000
Date: Sun, 10 Nov 2024 10:00:08 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm64-va-simplify 1/13] mm/zsmalloc.c:224:28: error: variably
 modified 'size_class' at file scope
Message-ID: <202411100926.ER9OG0H4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-va-simplify
head:   b03c9fa1f2d03aeece38f4b8ea8c05edb0e156b2
commit: 955d113b8b4401950ea83647579b79bff73843e0 [1/13] arm64/mm: Reduce PA space to 48 bits when LPA2 is not enabled
config: arm64-randconfig-003-20241110 (https://download.01.org/0day-ci/archive/20241110/202411100926.ER9OG0H4-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241110/202411100926.ER9OG0H4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411100926.ER9OG0H4-lkp@intel.com/

All errors (new ones prefixed by >>):

>> mm/zsmalloc.c:224:28: error: variably modified 'size_class' at file scope
     224 |         struct size_class *size_class[ZS_SIZE_CLASSES];
         |                            ^~~~~~~~~~


vim +/size_class +224 mm/zsmalloc.c

0959c63f11c3bb drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  220  
0959c63f11c3bb drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  221  struct zs_pool {
6f3526d6db7cbe mm/zsmalloc.c                            Sergey SENOZHATSKY 2015-11-06  222  	const char *name;
0f050d997e275c mm/zsmalloc.c                            Ganesh Mahendran   2015-02-12  223  
cf8e0fedf0784e mm/zsmalloc.c                            Jerome Marchand    2017-07-10 @224  	struct size_class *size_class[ZS_SIZE_CLASSES];
2e40e163a25af3 mm/zsmalloc.c                            Minchan Kim        2015-04-15  225  	struct kmem_cache *handle_cachep;
3783689a1aa82e mm/zsmalloc.c                            Minchan Kim        2016-07-26  226  	struct kmem_cache *zspage_cachep;
0959c63f11c3bb drivers/staging/zsmalloc/zsmalloc-main.c Seth Jennings      2012-08-08  227  
13de8933c96b45 mm/zsmalloc.c                            Minchan Kim        2014-10-09  228  	atomic_long_t pages_allocated;
0f050d997e275c mm/zsmalloc.c                            Ganesh Mahendran   2015-02-12  229  
7d3f3938236b4b mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  230  	struct zs_pool_stats stats;
ab9d306d9c3bf6 mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  231  
ab9d306d9c3bf6 mm/zsmalloc.c                            Sergey Senozhatsky 2015-09-08  232  	/* Compact classes */
c19b548b493455 mm/zsmalloc.c                            Qi Zheng           2023-09-11  233  	struct shrinker *shrinker;
93144ca35041b0 mm/zsmalloc.c                            Aliaksei Karaliou  2018-01-31  234  

:::::: The code at line 224 was first introduced by commit
:::::: cf8e0fedf0784ef4bc1889380b09eda295e3d109 mm/zsmalloc: simplify zs_max_alloc_size handling

:::::: TO: Jerome Marchand <jmarchan@redhat.com>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
