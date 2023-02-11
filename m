Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84B39EBF
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Feb 2023 07:07:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676099221; x=1707635221;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=QbrwXawfygw5QV4+McyRlUDRMbXCCfdyjR151u9rMik=;
  b=NklGNFEHAARuqk7OKQMcWnLQQmqDD1PfXR6iyqyCYB1JiUWIEfKVw9ry
   O7+/q6b7DLmx9TqfQ8jRf7zVd+IzJVa0N6xAOJQxJ4jyv2/YxJEZ4anZR
   sQcukAWhhKS+lcRXFaSQNmbPyFzTD93gXh+TMvL0JlV6e5PIUPwBf0Nqv
   NyvHWyvY7lR0L/dxRaFtj/Pr0U8xOL3plwdoTc1aoBn0LsctlXYKhEqIY
   qckdGpcfCxgqKW7Q41Uz05cXYWIwn36e2gx+pLZBARmLW3VHsSj6DyC+E
   Xog4CSSNCnvYTsvESaABLPb+AtWIttcZvn72ws9Q8HU8I1fndQRSr+oK7
   g==;
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="331896188"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="331896188"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2023 23:07:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10617"; a="997176224"
X-IronPort-AV: E=Sophos;i="5.97,289,1669104000"; 
   d="scan'208";a="997176224"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 10 Feb 2023 23:06:59 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pQjyN-0006JV-0Q;
	Sat, 11 Feb 2023 07:06:59 +0000
Date: Sat, 11 Feb 2023 15:06:39 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 2/2]
 unwind_kunit.c:(.text.__test_ftrace_unwind+0x5c): undefined reference to
 `kunit_kmalloc_array'
Message-ID: <202302111452.JedhD9F2-lkp@intel.com>
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
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230211/202302111452.JedhD9F2-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git/commit/?id=c40c372bae5073513f06c33fae36c546bec57ffe
        git remote add mark https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git
        git fetch --no-tags mark stacktrace/tests
        git checkout c40c372bae5073513f06c33fae36c546bec57ffe
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302111452.JedhD9F2-lkp@intel.com/

All errors (new ones prefixed by >>):

   powerpc-linux-ld: lib/unwind_kunit.o: in function `__test_ftrace_unwind':
>> unwind_kunit.c:(.text.__test_ftrace_unwind+0x5c): undefined reference to `kunit_kmalloc_array'
>> powerpc-linux-ld: unwind_kunit.c:(.text.__test_ftrace_unwind+0x72): undefined reference to `kunit_binary_ptr_assert_format'
   powerpc-linux-ld: unwind_kunit.c:(.text.__test_ftrace_unwind+0x82): undefined reference to `kunit_binary_ptr_assert_format'
>> powerpc-linux-ld: unwind_kunit.c:(.text.__test_ftrace_unwind+0xa0): undefined reference to `kunit_do_failed_assertion'
>> powerpc-linux-ld: unwind_kunit.c:(.text.__test_ftrace_unwind+0xee): undefined reference to `kunit_fail_assert_format'
   powerpc-linux-ld: unwind_kunit.c:(.text.__test_ftrace_unwind+0xfe): undefined reference to `kunit_fail_assert_format'
   powerpc-linux-ld: unwind_kunit.c:(.text.__test_ftrace_unwind+0x110): undefined reference to `kunit_do_failed_assertion'
   powerpc-linux-ld: unwind_kunit.c:(.text.__test_ftrace_unwind+0x14a): undefined reference to `kunit_fail_assert_format'
   powerpc-linux-ld: unwind_kunit.c:(.text.__test_ftrace_unwind+0x15a): undefined reference to `kunit_fail_assert_format'
   powerpc-linux-ld: unwind_kunit.c:(.text.__test_ftrace_unwind+0x16c): undefined reference to `kunit_do_failed_assertion'
>> powerpc-linux-ld: unwind_kunit.c:(.text.__test_ftrace_unwind+0x1e0): undefined reference to `kunit_kfree'
   powerpc-linux-ld: lib/unwind_kunit.o: in function `std_assert_callers_present':
>> unwind_kunit.c:(.text.std_assert_callers_present+0x72): undefined reference to `kunit_binary_assert_format'
>> powerpc-linux-ld: unwind_kunit.c:(.text.std_assert_callers_present+0x8e): undefined reference to `kunit_binary_assert_format'
>> powerpc-linux-ld: unwind_kunit.c:(.text.std_assert_callers_present+0xb4): undefined reference to `kunit_do_failed_assertion'
   powerpc-linux-ld: unwind_kunit.c:(.text.std_assert_callers_present+0xee): undefined reference to `kunit_binary_assert_format'
   powerpc-linux-ld: unwind_kunit.c:(.text.std_assert_callers_present+0x10a): undefined reference to `kunit_binary_assert_format'
   powerpc-linux-ld: unwind_kunit.c:(.text.std_assert_callers_present+0x130): undefined reference to `kunit_do_failed_assertion'
   powerpc-linux-ld: unwind_kunit.c:(.text.std_assert_callers_present+0x16a): undefined reference to `kunit_binary_assert_format'
   powerpc-linux-ld: unwind_kunit.c:(.text.std_assert_callers_present+0x186): undefined reference to `kunit_binary_assert_format'
   powerpc-linux-ld: unwind_kunit.c:(.text.std_assert_callers_present+0x1ac): undefined reference to `kunit_do_failed_assertion'
   powerpc-linux-ld: unwind_kunit.c:(.text.std_assert_callers_present+0x1d6): undefined reference to `kunit_binary_assert_format'
   powerpc-linux-ld: unwind_kunit.c:(.text.std_assert_callers_present+0x1f2): undefined reference to `kunit_binary_assert_format'
   powerpc-linux-ld: unwind_kunit.c:(.text.std_assert_callers_present+0x218): undefined reference to `kunit_do_failed_assertion'
   powerpc-linux-ld: unwind_kunit.c:(.text.std_assert_callers_present+0x23e): undefined reference to `kunit_binary_assert_format'
   powerpc-linux-ld: unwind_kunit.c:(.text.std_assert_callers_present+0x266): undefined reference to `kunit_binary_assert_format'
   powerpc-linux-ld: unwind_kunit.c:(.text.std_assert_callers_present+0x284): undefined reference to `kunit_do_failed_assertion'
   powerpc-linux-ld: lib/unwind_kunit.o: in function `test_unwind_from_caller':
>> unwind_kunit.c:(.text.test_unwind_from_caller+0x44): undefined reference to `kunit_kmalloc_array'
>> powerpc-linux-ld: unwind_kunit.c:(.text.test_unwind_from_caller+0x5a): undefined reference to `kunit_binary_ptr_assert_format'
   powerpc-linux-ld: unwind_kunit.c:(.text.test_unwind_from_caller+0x6a): undefined reference to `kunit_binary_ptr_assert_format'
>> powerpc-linux-ld: unwind_kunit.c:(.text.test_unwind_from_caller+0x88): undefined reference to `kunit_do_failed_assertion'
>> powerpc-linux-ld: unwind_kunit.c:(.text.test_unwind_from_caller+0xe0): undefined reference to `kunit_kfree'
   powerpc-linux-ld: lib/unwind_kunit.o: in function `std_assert_callers_present_reliable':
>> unwind_kunit.c:(.text.std_assert_callers_present_reliable+0x74): undefined reference to `kunit_log_append'
   powerpc-linux-ld: lib/unwind_kunit.o: in function `__test_kprobe_unwind.constprop.0':
>> unwind_kunit.c:(.text.__test_kprobe_unwind.constprop.0+0x58): undefined reference to `kunit_kmalloc_array'
>> powerpc-linux-ld: unwind_kunit.c:(.text.__test_kprobe_unwind.constprop.0+0x6e): undefined reference to `kunit_binary_ptr_assert_format'
   powerpc-linux-ld: unwind_kunit.c:(.text.__test_kprobe_unwind.constprop.0+0x7e): undefined reference to `kunit_binary_ptr_assert_format'
>> powerpc-linux-ld: unwind_kunit.c:(.text.__test_kprobe_unwind.constprop.0+0x9c): undefined reference to `kunit_do_failed_assertion'
>> powerpc-linux-ld: unwind_kunit.c:(.text.__test_kprobe_unwind.constprop.0+0xde): undefined reference to `kunit_binary_assert_format'
   powerpc-linux-ld: unwind_kunit.c:(.text.__test_kprobe_unwind.constprop.0+0xfa): undefined reference to `kunit_binary_assert_format'
   powerpc-linux-ld: unwind_kunit.c:(.text.__test_kprobe_unwind.constprop.0+0x120): undefined reference to `kunit_do_failed_assertion'
>> powerpc-linux-ld: unwind_kunit.c:(.text.__test_kprobe_unwind.constprop.0+0x18c): undefined reference to `kunit_kfree'
   powerpc-linux-ld: lib/unwind_kunit.o: in function `test_unwind_from_caller_reliable':
>> unwind_kunit.c:(.text.test_unwind_from_caller_reliable+0x48): undefined reference to `kunit_kmalloc_array'
>> powerpc-linux-ld: unwind_kunit.c:(.text.test_unwind_from_caller_reliable+0x5e): undefined reference to `kunit_binary_ptr_assert_format'
   powerpc-linux-ld: unwind_kunit.c:(.text.test_unwind_from_caller_reliable+0x6e): undefined reference to `kunit_binary_ptr_assert_format'
   powerpc-linux-ld: unwind_kunit.c:(.text.test_unwind_from_caller_reliable+0x8c): undefined reference to `kunit_do_failed_assertion'
   powerpc-linux-ld: unwind_kunit.c:(.text.test_unwind_from_caller_reliable+0xe8): undefined reference to `kunit_log_append'
   powerpc-linux-ld: unwind_kunit.c:(.text.test_unwind_from_caller_reliable+0x13c): undefined reference to `kunit_kfree'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
