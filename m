Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1393E322E
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Nov 2023 06:32:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EmpR9Bbr"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699079523; x=1730615523;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0OBpPqw2VKBfE7X7sxYrD53ktSWX7nE3PfiA8iQbpaA=;
  b=EmpR9Bbrg6gma5l1WkBB1h3opnkH14Yb72mFvba14Ppye8a2nZvYIEGl
   MTSsTCSWtzkJD+YC7UHoovSTRAbqFt5su/8rxXZd17yYTiMR1NF/VNFU5
   Oci8voOySPmZEE/DIQ441o2Px/FimQe6AN/VmvEKpqe0tTA5ZioBDARDo
   GOCy87p4A3NreNXWejnuFwN1fgmJ3iQvdxCdFisANxvLMAyAs3a4C+/9u
   C9knQ/2bu/xSYToQmoYBhSXioNWq+TvG2IOSa6U3vLGmWK3uWOHLqS2EX
   6d6747l1TQ3p1vRBorfXUuzEqHasUYStmW6Dg4EOraCjZ3cL4nP+pAgJT
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1952401"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="1952401"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 23:32:02 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="1009030095"
X-IronPort-AV: E=Sophos;i="6.03,276,1694761200"; 
   d="scan'208";a="1009030095"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Nov 2023 23:32:00 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qzACM-0003Yd-2o;
	Sat, 04 Nov 2023 06:31:58 +0000
Date: Sat, 4 Nov 2023 14:31:20 +0800
From: kernel test robot <lkp@intel.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Luis Chamberlain <mcgrof@kernel.org>
Subject: lib/test_kmod.c:134: warning: Function parameter or member
 'thread_mutex' not described in 'kmod_test_device'
Message-ID: <202311041434.t4sfa6ou-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   2c40c1c6adab90ee4660caf03722b3a3ec67767b
commit: c093a74dac1c008daee92d6d613e9e3fe20b6585 test_kmod: stop kernel-doc warnings
date:   9 months ago
config: nios2-allyesconfig (https://download.01.org/0day-ci/archive/20231104/202311041434.t4sfa6ou-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231104/202311041434.t4sfa6ou-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311041434.t4sfa6ou-lkp@intel.com/

All warnings (new ones prefixed by >>):

   lib/test_kmod.c:67: warning: Enum value '__TEST_KMOD_INVALID' not described in enum 'kmod_test_case'
   lib/test_kmod.c:67: warning: Enum value '__TEST_KMOD_MAX' not described in enum 'kmod_test_case'
   lib/test_kmod.c:100: warning: Function parameter or member 'task_sync' not described in 'kmod_test_device_info'
>> lib/test_kmod.c:134: warning: Function parameter or member 'thread_mutex' not described in 'kmod_test_device'


vim +134 lib/test_kmod.c

d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   51  
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   52  /**
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   53   * enum kmod_test_case - linker table test case
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   54   * @TEST_KMOD_DRIVER: stress tests request_module()
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   55   * @TEST_KMOD_FS_TYPE: stress tests get_fs_type()
c093a74dac1c008 Randy Dunlap      2023-01-02   56   *
c093a74dac1c008 Randy Dunlap      2023-01-02   57   * If you add a  test case, please be sure to review if you need to set
c093a74dac1c008 Randy Dunlap      2023-01-02   58   * @need_mod_put for your tests case.
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   59   */
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   60  enum kmod_test_case {
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   61  	__TEST_KMOD_INVALID = 0,
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   62  
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   63  	TEST_KMOD_DRIVER,
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   64  	TEST_KMOD_FS_TYPE,
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   65  
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   66  	__TEST_KMOD_MAX,
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  @67  };
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   68  
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   69  struct test_config {
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   70  	char *test_driver;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   71  	char *test_fs;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   72  	unsigned int num_threads;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   73  	enum kmod_test_case test_case;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   74  	int test_result;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   75  };
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   76  
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   77  struct kmod_test_device;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   78  
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   79  /**
c093a74dac1c008 Randy Dunlap      2023-01-02   80   * struct kmod_test_device_info - thread info
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   81   *
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   82   * @ret_sync: return value if request_module() is used, sync request for
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   83   * 	@TEST_KMOD_DRIVER
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   84   * @fs_sync: return value of get_fs_type() for @TEST_KMOD_FS_TYPE
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   85   * @thread_idx: thread ID
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   86   * @test_dev: test device test is being performed under
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   87   * @need_mod_put: Some tests (get_fs_type() is one) requires putting the module
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   88   *	(module_put(fs_sync->owner)) when done, otherwise you will not be able
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   89   *	to unload the respective modules and re-test. We use this to keep
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   90   *	accounting of when we need this and to help out in case we need to
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   91   *	error out and deal with module_put() on error.
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   92   */
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   93  struct kmod_test_device_info {
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   94  	int ret_sync;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   95  	struct file_system_type *fs_sync;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   96  	struct task_struct *task_sync;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   97  	unsigned int thread_idx;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   98  	struct kmod_test_device *test_dev;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14   99  	bool need_mod_put;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  100  };
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  101  
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  102  /**
c093a74dac1c008 Randy Dunlap      2023-01-02  103   * struct kmod_test_device - test device to help test kmod
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  104   *
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  105   * @dev_idx: unique ID for test device
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  106   * @config: configuration for the test
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  107   * @misc_dev: we use a misc device under the hood
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  108   * @dev: pointer to misc_dev's own struct device
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  109   * @config_mutex: protects configuration of test
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  110   * @trigger_mutex: the test trigger can only be fired once at a time
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  111   * @thread_lock: protects @done count, and the @info per each thread
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  112   * @done: number of threads which have completed or failed
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  113   * @test_is_oom: when we run out of memory, use this to halt moving forward
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  114   * @kthreads_done: completion used to signal when all work is done
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  115   * @list: needed to be part of the reg_test_devs
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  116   * @info: array of info for each thread
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  117   */
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  118  struct kmod_test_device {
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  119  	int dev_idx;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  120  	struct test_config config;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  121  	struct miscdevice misc_dev;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  122  	struct device *dev;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  123  	struct mutex config_mutex;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  124  	struct mutex trigger_mutex;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  125  	struct mutex thread_mutex;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  126  
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  127  	unsigned int done;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  128  
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  129  	bool test_is_oom;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  130  	struct completion kthreads_done;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  131  	struct list_head list;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  132  
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  133  	struct kmod_test_device_info *info;
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14 @134  };
d9c6a72d6fa29d3 Luis R. Rodriguez 2017-07-14  135  

:::::: The code at line 134 was first introduced by commit
:::::: d9c6a72d6fa29d3a7999dda726577e5d1fccafa5 kmod: add test driver to stress test the module loader

:::::: TO: Luis R. Rodriguez <mcgrof@kernel.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
