Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5368E1A58E
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 14:30:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pzri3Lrx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699021806; x=1730557806;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HD6L/TTZPofsJIc3Uh7UxtvYOFAP0PMrQQRN15wX65s=;
  b=Pzri3Lrxg5ZX8fupoQ02sDMbUCqZ5/N4mJtjLHMm7yTm3Pos45s4rsUg
   Z4QeUX3L8eN8kAQwyaF7Bw2gEiRT1+JEYq+EXmVyczxd4aUFX35lzehOG
   WK0UrBhh6U5+V2Tr47lZEhwzyJmTFhA9J19wTqCobhL2uJz8mcyR7UeWh
   iAKlkjlyzrQdzek/6QaZMCV7vyHNpYHTlacQjJAfUErCGVmV1h26M/SSt
   db9DXsxNS7hWWHRqNKp5qkb1joIYvNgs+e8NQzVxy0hmXieOJVSQOWE49
   P+OsqbB7M9pLUoP0Kk+n5eroBZSEiwf5Yv+6qEOa05yLmP+6SLURziJvJ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="386122631"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="386122631"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 07:30:05 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="935121629"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="935121629"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 03 Nov 2023 07:30:02 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyvBQ-0002a0-2v;
	Fri, 03 Nov 2023 14:30:00 +0000
Date: Fri, 3 Nov 2023 22:29:39 +0800
From: kernel test robot <lkp@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: lib/test_kmod.c:100: warning: Function parameter or member
 'task_sync' not described in 'kmod_test_device_info'
Message-ID: <202311032240.w1q3ydGG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   8f6f76a6a29f36d2f3e4510d0bde5046672f6924
commit: c093a74dac1c008daee92d6d613e9e3fe20b6585 test_kmod: stop kernel-doc warnings
date:   9 months ago
config: s390-allmodconfig (https://download.01.org/0day-ci/archive/20231103/202311032240.w1q3ydGG-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311032240.w1q3ydGG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311032240.w1q3ydGG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/test_kmod.c:67: warning: Enum value '__TEST_KMOD_INVALID' not described in enum 'kmod_test_case'
   lib/test_kmod.c:67: warning: Enum value '__TEST_KMOD_MAX' not described in enum 'kmod_test_case'
>> lib/test_kmod.c:100: warning: Function parameter or member 'task_sync' not described in 'kmod_test_device_info'
   lib/test_kmod.c:134: warning: Function parameter or member 'thread_mutex' not described in 'kmod_test_device'


vim +100 lib/test_kmod.c

d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   78  
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   79  /**
c093a74dac1c00 Randy Dunlap      2023-01-02   80   * struct kmod_test_device_info - thread info
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   81   *
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   82   * @ret_sync: return value if request_module() is used, sync request for
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   83   * 	@TEST_KMOD_DRIVER
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   84   * @fs_sync: return value of get_fs_type() for @TEST_KMOD_FS_TYPE
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   85   * @thread_idx: thread ID
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   86   * @test_dev: test device test is being performed under
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   87   * @need_mod_put: Some tests (get_fs_type() is one) requires putting the module
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   88   *	(module_put(fs_sync->owner)) when done, otherwise you will not be able
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   89   *	to unload the respective modules and re-test. We use this to keep
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   90   *	accounting of when we need this and to help out in case we need to
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   91   *	error out and deal with module_put() on error.
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   92   */
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   93  struct kmod_test_device_info {
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   94  	int ret_sync;
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   95  	struct file_system_type *fs_sync;
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   96  	struct task_struct *task_sync;
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   97  	unsigned int thread_idx;
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   98  	struct kmod_test_device *test_dev;
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14   99  	bool need_mod_put;
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14 @100  };
d9c6a72d6fa29d Luis R. Rodriguez 2017-07-14  101  

:::::: The code at line 100 was first introduced by commit
:::::: d9c6a72d6fa29d3a7999dda726577e5d1fccafa5 kmod: add test driver to stress test the module loader

:::::: TO: Luis R. Rodriguez <mcgrof@kernel.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
