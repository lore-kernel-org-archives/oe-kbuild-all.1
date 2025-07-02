Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D93D28691
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Jul 2025 02:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751421823; cv=none; b=Ofx7tSqjvlFIxVHG0IsUl6732vbo6MJhDdT4atZxGkVmYrlmruDbsmdUSu7dS6cjh/geQ+q2otyeOW0QcKmkD9mHv1lgpw+vUSX5QqTzUeDIMwgJtMeyezkpDeQ4VkvqRqFuQHcHfeTtmZAG/ywyo35dpEeGQy4dZmDWHcSmhzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751421823; c=relaxed/simple;
	bh=4x6R90A9stI04Tz9OQ+c6DUex54PYN8tM96ZEdn6Qgs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=hRvZmIbtAciH21WGiwN6Qs8rdRhv/dgrANZ2CCkTMwMvjZw5u11BGTM6JMjCa6ryPQcbK9KQRF9ti1onGjAaw9+vRMV4678Z3K9r9HZmJmfWrgUf0LQeuPjOmyywY0Xn2EZ8oF2sq7iEe7rdQt+zWkO8IRIyen6qIrUBXFOjsNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=iUz4aLUm; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iUz4aLUm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1751421820; x=1782957820;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4x6R90A9stI04Tz9OQ+c6DUex54PYN8tM96ZEdn6Qgs=;
  b=iUz4aLUmm1s4c/5pUIb9VzESQ7tgJBcRJ7blf9YE1kwP0to+ibt8ZrQA
   UuxWjnjiJZDsUzwAyICbuwKQ8OjxSJf17Pgx/iSAxviO73/hBXvnZevsl
   PvdTAe1Buju7TW3wi/lnkevwesxGP6D7Y0mxf5CxM0LbouNch1KFR4RxC
   H3XCYIfLUIqoKRpZLSpQ3FsvjRmW8Q+z/0p2/YdL1TTh+iHyOiJRO5oyj
   47OvtRfQz3SpzZ2hbVMz2vM/sDIv+KniAFZ6LGRE0q6nguSSjKgX6MGuY
   FFc8T+4DNtwCv1h9vAQ67fCvC4HXwtpAFy4b5Cd6bKiOIty+lps46xUbh
   w==;
X-CSE-ConnectionGUID: mff8WQyaQnujaOBc7hWRjg==
X-CSE-MsgGUID: LavHGPRvSM+shEbKA0ZpZA==
X-IronPort-AV: E=McAfee;i="6800,10657,11481"; a="79145378"
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="79145378"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2025 19:03:40 -0700
X-CSE-ConnectionGUID: D4EsE12aSH6TYtSHVz5NkA==
X-CSE-MsgGUID: 4XdIi3YxQtqVajWqj40eBA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,280,1744095600"; 
   d="scan'208";a="158492911"
Received: from lkp-server01.sh.intel.com (HELO 0b2900756c14) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 01 Jul 2025 19:03:38 -0700
Received: from kbuild by 0b2900756c14 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uWmoy-00001t-19;
	Wed, 02 Jul 2025 02:03:36 +0000
Date: Wed, 2 Jul 2025 10:02:57 +0800
From: kernel test robot <lkp@intel.com>
To: Amir Goldstein <amir73il@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [amir73il:fan_pre_dir_access 9/10] include/linux/fsnotify.h:293:1:
 warning: control reaches end of non-void function
Message-ID: <202507020936.YmW9Hnj5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/amir73il/linux fan_pre_dir_access
head:   6a42bd7aac47832a5399a63b14cbf15892602b42
commit: 9778e3603f15187bd80baff011a30190aa4d6d2a [9/10] fsnotify: optimize out multiple pre-dir-content events during path walk
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20250702/202507020936.YmW9Hnj5-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250702/202507020936.YmW9Hnj5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507020936.YmW9Hnj5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/namei.c:27:
   include/linux/fsnotify.h: In function 'fsnotify_lookup_perm':
   include/linux/fsnotify.h:292:16: error: 'FSNOTIFY_NO_WATCHERS' undeclared (first use in this function)
     292 |         return FSNOTIFY_NO_WATCHERS;
         |                ^~~~~~~~~~~~~~~~~~~~
   include/linux/fsnotify.h:292:16: note: each undeclared identifier is reported only once for each function it appears in
   In file included from include/linux/build_bug.h:5,
                    from include/linux/init.h:5,
                    from fs/namei.c:18:
   fs/namei.c: In function 'lookup_slow_notify':
   fs/namei.c:1856:35: error: 'FSNOTIFY_NO_WATCHERS' undeclared (first use in this function)
    1856 |                 if (likely(ret == FSNOTIFY_NO_WATCHERS))
         |                                   ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:76:45: note: in definition of macro 'likely'
      76 | # define likely(x)      __builtin_expect(!!(x), 1)
         |                                             ^
   include/linux/fsnotify.h: In function 'fsnotify_lookup_perm':
>> include/linux/fsnotify.h:293:1: warning: control reaches end of non-void function [-Wreturn-type]
     293 | }
         | ^


vim +293 include/linux/fsnotify.h

7243d0f2d6b400 Amir Goldstein 2025-06-03  287  
7243d0f2d6b400 Amir Goldstein 2025-06-03  288  static inline int fsnotify_lookup_perm(struct path *path,
7243d0f2d6b400 Amir Goldstein 2025-06-03  289  				       struct inode *dir,
7243d0f2d6b400 Amir Goldstein 2025-06-03  290  				       const struct qstr *name)
7243d0f2d6b400 Amir Goldstein 2025-06-03  291  {
9778e3603f1518 Amir Goldstein 2025-07-01  292  	return FSNOTIFY_NO_WATCHERS;
7243d0f2d6b400 Amir Goldstein 2025-06-03 @293  }
7ea26f9460c6c7 Amir Goldstein 2024-01-09  294  #endif
7ea26f9460c6c7 Amir Goldstein 2024-01-09  295  

:::::: The code at line 293 was first introduced by commit
:::::: 7243d0f2d6b400d1c8f32f8ee97010478df5cde8 fanotify: generate FAN_PRE_DIR_ACCESS event on lookup

:::::: TO: Amir Goldstein <amir73il@gmail.com>
:::::: CC: Amir Goldstein <amir73il@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
