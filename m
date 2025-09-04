Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34B9A1F1317
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Sep 2025 02:16:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756952203; cv=none; b=tJ1DgwbPqhgNjyUDlZMiISPIwfgVoWjqhe73XsyR+0ogiCGLhsiJ38PgiV7mp4iQT5FVuQFKpY7E1JRDC6feHTPrmT9pEyqrL3UZG5vlQiqDftaj5gOEb7fMDZUYiJXDX4bgUe3WCSgTbKlxWBB7NtrYQrdmYQ3veER0bEaziP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756952203; c=relaxed/simple;
	bh=kYdKK9NXfAPol0mEihtSZZPNEKTWYc3D7MsBuRF4/9A=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IO8Ho3hM9NvMhfe4C6Ufx8GF1UOh9Y7vYv7YfZOSN8XjtbVbsjhRBkfim8uMKEdy9zsNllPMyJtkKksW4pLLbmURNoIKmc89h/xYiNabq526AdE3ddB4vI0myQO9iGspgSkhBrzfZU/ccnhFw+viH1yFLpXwP0iYlO5s/mq+svo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=BhBEFL84; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="BhBEFL84"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1756952201; x=1788488201;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kYdKK9NXfAPol0mEihtSZZPNEKTWYc3D7MsBuRF4/9A=;
  b=BhBEFL84ZHHpAb7b8NXuq9F/oZ+J5QJ3ZOCSKxedig7XlPQCHNHtP9/J
   MCyRejejRbJrbY07uLpn4Hz8hvXDpp11oCr6DMJIUPZchX1eIjADFrcDr
   wLeIVhW3HDepPezSGBhkucxkDJqAWoWgy12anX9UyyCcdZ5qnq0DSPuEr
   UKTygkP1+Q3GZ7jUQLWbGSVPQRebgyhkWbgfbPrZL2SkLbfGZxesPRt4w
   pmttBcoY7OXEIa0/GpGiKdiTl2CepVe6yqkke2EDySdilATThFypfeF71
   BBj/QvkZTpsqSc3TrkPkxoV9uAmfsFLh1Pz6HMCp/hgIXx3bh0fOJe5Hf
   A==;
X-CSE-ConnectionGUID: 3bl1u4erRUOBjLvW3kHVeA==
X-CSE-MsgGUID: ZlGGLYDLQJ+hTP/g+vkhtg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="59234975"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="59234975"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Sep 2025 19:16:41 -0700
X-CSE-ConnectionGUID: jA/BMMStT1OgkXLvjD7g4w==
X-CSE-MsgGUID: 6XZvMNi+QayLwz2FNBexbg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,237,1751266800"; 
   d="scan'208";a="175892138"
Received: from lkp-server02.sh.intel.com (HELO 06ba48ef64e9) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 03 Sep 2025 19:16:39 -0700
Received: from kbuild by 06ba48ef64e9 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1utzWf-0004cF-1w;
	Thu, 04 Sep 2025 02:16:37 +0000
Date: Thu, 4 Sep 2025 10:15:38 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [koverstreet-bcachefs:bcachefs-testing 325/330]
 include/linux/cleanup.h:290:2: error: a label can only be part of a
 statement and a declaration is not a statement
Message-ID: <202509041054.JIZXXMU2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

[community] /zdci/src/lkp/sbin/sync-produce --item /zdci/kbuild/indicators/39/39e3fc7603211022b72480fecf34c9fe9dfc7429-first_error_kconfig --flag create-dir

tree:   https://github.com/koverstreet/bcachefs bcachefs-testing
head:   d1a65c46ee1f3f0585f0b990f4843367219e48b8
commit: 39e3fc7603211022b72480fecf34c9fe9dfc7429 [325/330] bcachefs: Fix __bch2_btree_path_verify_level() for interior nodes
config: arm64-randconfig-001-20250904 (https://download.01.org/0day-ci/archive/20250904/202509041054.JIZXXMU2-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250904/202509041054.JIZXXMU2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509041054.JIZXXMU2-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/cpumask.h:10,
                    from include/linux/smp.h:13,
                    from include/linux/lockdep.h:14,
                    from include/linux/radix-tree.h:14,
                    from include/linux/backing-dev-defs.h:6,
                    from fs/bcachefs/bcachefs.h:196,
                    from fs/bcachefs/btree_iter.c:3:
   fs/bcachefs/btree_iter.c: In function '__bch2_btree_path_verify_level':
>> include/linux/cleanup.h:290:2: error: a label can only be part of a statement and a declaration is not a statement
     class_##_name##_t var __cleanup(class_##_name##_destructor) = \
     ^~~~~~
   fs/bcachefs/btree_iter.c:196:2: note: in expansion of macro 'CLASS'
     CLASS(printbuf, buf)();
     ^~~~~


vim +290 include/linux/cleanup.h

54da6a0924311c Peter Zijlstra 2023-05-26  288  
54da6a0924311c Peter Zijlstra 2023-05-26  289  #define CLASS(_name, var)						\
54da6a0924311c Peter Zijlstra 2023-05-26 @290  	class_##_name##_t var __cleanup(class_##_name##_destructor) =	\
54da6a0924311c Peter Zijlstra 2023-05-26  291  		class_##_name##_constructor
54da6a0924311c Peter Zijlstra 2023-05-26  292  

:::::: The code at line 290 was first introduced by commit
:::::: 54da6a0924311c7cf5015533991e44fb8eb12773 locking: Introduce __cleanup() based infrastructure

:::::: TO: Peter Zijlstra <peterz@infradead.org>
:::::: CC: Peter Zijlstra <peterz@infradead.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
