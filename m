Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B7CB2D1911
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Aug 2026 02:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787364631; cv=none; b=nYTlf/PB9fQu1CQO3ecCOJhBt/a1SWPZ9arUGOcg4mRRRgpqBp+VMxOjUPipPwxp7d2QUsmY34QMOwAvLDzrPLyZb/NBXEBEulrt4z2L6eslG1h+kh8TLUM2SLlq3s9u8GGntYV1VYUN/zhYjspHMElg4ErZSl0XPp1w3rBFBfQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787364631; c=relaxed/simple;
	bh=T3+owKs9SA6rMWGfU4oATBF+vBa0wLozlgz9W9ueaXc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=oEWRnLPv8jHP5B+vRDQLAFSCA9PzScdKuvKJsYNO2OMMv5cku2+al4iZ2UDADJYCtuq8S+CU2j9j/P9tR13ztYzNA8iJtHuYl8JkJMQIRuvBP3TtFYUcvcdWteQYBI91YWSytmIuZBnACsdh1xr/RhsO/MzA9j7WUeFNP03hGy8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDXt8sRf; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDXt8sRf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787364629; x=1818900629;
  h=date:from:to:cc:subject:message-id;
  bh=T3+owKs9SA6rMWGfU4oATBF+vBa0wLozlgz9W9ueaXc=;
  b=jDXt8sRfdIFB/H/kUZN3BTpSMp8N1RfZN2fFZIzsKQKlT/qKoF5E6KlG
   jTKaqarzPzjgNaHOCtHDUuyscqNEsAnSDY+EpGj09zDO3DGUvr/1tkSHp
   Wf2oHhIgPg7xnmZU6FSF6bmOyJ5fX/kvL56ZE/WhmY3g4FmyYEGkmghPH
   xzC0kwcdUSzkxH6ATCUriA/+DCISbI7noQWp+81aj2+yArB00ey7teml/
   zJ/ZcBnw+j2hJ47Zl8ZBskV3/YgVQFEAfQHQDJujh6uGYadmkIop371JJ
   HtukMvwGDpnFXQtkVKekMKwc1WCI9i5gDehVqj17qDVTbteAgsk9BdUpK
   w==;
X-CSE-ConnectionGUID: k99I6ZfzTm6JYsD6FtWYow==
X-CSE-MsgGUID: NU8gQ44cRJesh6bDi6+8dw==
X-IronPort-AV: E=McAfee;i="6800,10657,11882"; a="87678574"
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="87678574"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2026 19:10:27 -0700
X-CSE-ConnectionGUID: E/j2K4TyRLuWWgjJWaZCnA==
X-CSE-MsgGUID: 4y8wewnuRT2Ht3Cj2u9G+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,236,1779174000"; 
   d="scan'208";a="269974834"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 21 Aug 2026 19:10:26 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wxbBf-00000000qkx-3KnO;
	Sat, 22 Aug 2026 02:10:23 +0000
Date: Sat, 22 Aug 2026 10:09:46 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:arm64-combine-module-section-allocations 2/5]
 kernel/module/main.c:3095:25: sparse: sparse: incorrect type in argument 4
 (different base types)
Message-ID: <202608221052.5W7Xq4qK-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git arm64-combine-module-section-allocations
head:   180b5b2c872610c67c5ba4e0b380c915f2926acd
commit: c0268bf732e00e99693e1c768d07ca71a9b9d90d [2/5] module: Allow allocations to be combined
config: arm-randconfig-r123-20260822 (https://download.01.org/0day-ci/archive/20260822/202608221052.5W7Xq4qK-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260822/202608221052.5W7Xq4qK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608221052.5W7Xq4qK-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/module/main.c:3095:25: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got unsigned long @@
   kernel/module/main.c:3095:25: sparse:     expected restricted gfp_t [usertype] flags
   kernel/module/main.c:3095:25: sparse:     got unsigned long
>> kernel/module/main.c:3095:25: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got unsigned long @@
   kernel/module/main.c:3095:25: sparse:     expected restricted gfp_t [usertype] flags
   kernel/module/main.c:3095:25: sparse:     got unsigned long
>> kernel/module/main.c:3095:25: sparse: sparse: incorrect type in argument 4 (different base types) @@     expected restricted gfp_t [usertype] flags @@     got unsigned long @@
   kernel/module/main.c:3095:25: sparse:     expected restricted gfp_t [usertype] flags
   kernel/module/main.c:3095:25: sparse:     got unsigned long

vim +3095 kernel/module/main.c

  3082	
  3083	static void do_free_init(struct work_struct *w)
  3084	{
  3085		struct llist_node *pos, *n, *list;
  3086		struct mod_initfree *initfree;
  3087	
  3088		list = llist_del_all(&init_free_list);
  3089	
  3090		synchronize_rcu();
  3091	
  3092		llist_for_each_safe(pos, n, list) {
  3093			initfree = container_of(pos, struct mod_initfree, node);
  3094			if (initfree->init_text_size)
> 3095				WARN_ON(!vrealloc(initfree->init_text,
  3096						  initfree->init_text_size, PAGE_SIZE));
  3097			else
  3098				execmem_free(initfree->init_text);
  3099			execmem_free(initfree->init_data);
  3100			execmem_free(initfree->init_rodata);
  3101			kfree(initfree);
  3102		}
  3103	}
  3104	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
