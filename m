Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5677BEB8
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 06:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676096160; x=1707632160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D1+kJzJ2RZ+0ZJkTG/xh60y/uX/FxDH3Q30gvVsHFBU=;
  b=FW1YgyEMPi26q9ias5/A5bnuXwzS6q4/tgMdqFRxbRK7r8gb7LMQiuCV
   XuF0iuGY8n9H8xbkmwTNt5w7NeIcT8E/kxF6qkyEjDI/CbOyBfHZWgJhv
   peanOE5aI5oTnW/QAa1LFwelps8Rkl309KF46j2LiOAbBrFJoufsGqmfm
   JP9q0adxz52QPjx0GD1fVms14piaO+bn0tw4xjMDtzbLK51tZjAHAojio
   dLFU93hEtChZvmdqA6p0iVI+c48bl5Ww4EvCQIS5S6SWHCYVNtVkisnW/
   kOl/9Zan1+uXhWKERp2fyPs9NaeumwNzYSlY6zGGm02YMFakl0CLvg9uc
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="392991638"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="392991638"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 22:15:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="913764457"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="913764457"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 10 Feb 2023 22:15:58 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQjAz-0006Ht-2h;
	Sat, 11 Feb 2023 06:15:57 +0000
Date: Sat, 11 Feb 2023 14:15:27 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 2/2] unwind_kunit.c:undefined reference to
 `kunit_do_failed_assertion'
Message-ID: <202302111439.dSHjtQxv-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   c40c372bae5073513f06c33fae36c546bec57ffe
commit: c40c372bae5073513f06c33fae36c546bec57ffe [2/2] WIP: unwind test
config: arm-randconfig-s041-20230210 (https://download.01.org/0day-ci/archive/20230211/202302111439.dSHjtQxv-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=c40c372bae5073513f06c33fae36c546bec57ffe
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark stacktrace/tests
        git checkout c40c372bae5073513f06c33fae36c546bec57ffe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross C=1 CF='-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=build_dir ARCH=arm SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302111439.dSHjtQxv-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: arm-linux-gnueabi-ld: DWARF error: could not find abbrev number 39
   lib/unwind_kunit.o: in function `std_assert_callers_present':
>> unwind_kunit.c:(.text+0xac): undefined reference to `kunit_do_failed_assertion'
>> arm-linux-gnueabi-ld: unwind_kunit.c:(.text+0xe0): undefined reference to `kunit_do_failed_assertion'
   arm-linux-gnueabi-ld: unwind_kunit.c:(.text+0x114): undefined reference to `kunit_do_failed_assertion'
   arm-linux-gnueabi-ld: unwind_kunit.c:(.text+0x13e): undefined reference to `kunit_do_failed_assertion'
   arm-linux-gnueabi-ld: unwind_kunit.c:(.text+0x168): undefined reference to `kunit_do_failed_assertion'
>> arm-linux-gnueabi-ld: unwind_kunit.c:(.text+0x178): undefined reference to `kunit_binary_assert_format'
   arm-linux-gnueabi-ld: lib/unwind_kunit.o: in function `test_unwind_from_caller':
>> unwind_kunit.c:(.text+0x1a2): undefined reference to `kunit_kmalloc_array'
   arm-linux-gnueabi-ld: unwind_kunit.c:(.text+0x1c0): undefined reference to `kunit_do_failed_assertion'
>> arm-linux-gnueabi-ld: unwind_kunit.c:(.text+0x1e8): undefined reference to `kunit_binary_ptr_assert_format'
   arm-linux-gnueabi-ld: lib/unwind_kunit.o: in function `test_unwind_from_caller_reliable':
   unwind_kunit.c:(.text+0x1fe): undefined reference to `kunit_kmalloc_array'
   arm-linux-gnueabi-ld: unwind_kunit.c:(.text+0x21c): undefined reference to `kunit_do_failed_assertion'
>> arm-linux-gnueabi-ld: unwind_kunit.c:(.text+0x242): undefined reference to `kunit_log_append'
   arm-linux-gnueabi-ld: unwind_kunit.c:(.text+0x264): undefined reference to `kunit_binary_ptr_assert_format'
   arm-linux-gnueabi-ld: lib/unwind_kunit.o: in function `test_unwind_from_caller':
>> unwind_kunit.c:(.text+0x1de): undefined reference to `kunit_kfree'
   arm-linux-gnueabi-ld: lib/unwind_kunit.o: in function `test_unwind_from_caller_reliable':
   unwind_kunit.c:(.text+0x250): undefined reference to `kunit_kfree'

sparse warnings: (new ones prefixed by >>)
>> lib/unwind_kunit.c:22:6: sparse: sparse: symbol 'std_stacktrace_save' was not declared. Should it be static?
>> lib/unwind_kunit.c:29:6: sparse: sparse: symbol 'std_stacktrace_save_reliable' was not declared. Should it be static?
>> lib/unwind_kunit.c:36:6: sparse: sparse: symbol 'std_stacktrace_save_regs' was not declared. Should it be static?

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
