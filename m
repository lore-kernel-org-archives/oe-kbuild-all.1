Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E4817D5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  3 Jun 2023 01:27:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1685755635; x=1717291635;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aykvCqJWpkxyCW4T7dgmXwULgkx3PSKtPcJcqH4+dGI=;
  b=e5/fWyWvgkGr3nxitmCFS8UHRbk6FwffBd5IUIYMtm9B8IKeQ0ePExED
   KVy2ymp9hPVkvZWCUm1/WOn8LyRqwNlNgmLusiLNAsVero0oOq2ZNloh+
   EbzjL1mDsfYYuky7+9oFFRmVi+hhpR77/pW6BzhAnx4rs2WKk0DkWuyRy
   Hu0qJEy40hxsUmyN7abCQztKA0pSrWt87O0d0kAgieeWLOghFNZTQyhGS
   h7H/gjcccqqLxIpCPyXP8jSO6q8FxeDWoDZHzbO4ha4o7EFlkST3PIlwO
   WnXfMiMiBwgkuLvbCygtdV85zFEx4q88YTiBZROlVwDj14I9mitCrr1J6
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="419551018"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="419551018"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Jun 2023 18:27:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10729"; a="658446172"
X-IronPort-AV: E=Sophos;i="6.00,214,1681196400"; 
   d="scan'208";a="658446172"
Received: from lkp-server01.sh.intel.com (HELO 15ab08e44a81) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 02 Jun 2023 18:27:11 -0700
Received: from kbuild by 15ab08e44a81 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1q5G2w-00018s-1s;
	Sat, 03 Jun 2023 01:27:10 +0000
Date: Sat, 3 Jun 2023 09:26:55 +0800
From: kernel test robot <lkp@intel.com>
To: David Gow <davidgow@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Daniel Latypov <dlatypov@google.com>
Subject: [linux-next:master 6592/6849]
 drivers/gpu/drm/tests/drm_buddy_test.o: warning: objtool:
 drm_test_buddy_alloc_pathological+0x3c0: stack state mismatch: cfa1=4+184
 cfa2=4+192
Message-ID: <202306030908.PqveYunF-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bc708bbd8260ee4eb3428b0109f5f3be661fae46
commit: 260755184cbdb267a046e7ffd397c1d2ba09bb5e [6592/6849] kunit: Move kunit_abort() call out of kunit_do_failed_assertion()
config: x86_64-buildonly-randconfig-r002-20230531 (https://download.01.org/0day-ci/archive/20230603/202306030908.PqveYunF-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commit/?id=260755184cbdb267a046e7ffd397c1d2ba09bb5e
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 260755184cbdb267a046e7ffd397c1d2ba09bb5e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash drivers/gpu/ lib//

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306030908.PqveYunF-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/tests/drm_buddy_test.o: warning: objtool: drm_test_buddy_alloc_pathological+0x3c0: stack state mismatch: cfa1=4+184 cfa2=4+192
>> drivers/gpu/drm/tests/drm_buddy_test.o: warning: objtool: drm_test_buddy_alloc_pessimistic+0x438: stack state mismatch: cfa1=4+168 cfa2=4+176
>> drivers/gpu/drm/tests/drm_buddy_test.o: warning: objtool: drm_test_buddy_alloc_optimistic+0x136: stack state mismatch: cfa1=4+152 cfa2=4+160
>> drivers/gpu/drm/tests/drm_buddy_test.o: warning: objtool: drm_test_buddy_alloc_range+0x209: stack state mismatch: cfa1=4+184 cfa2=4+200
--
>> drivers/gpu/drm/tests/drm_mm_test.o: warning: objtool: drm_test_mm_debug+0x128: stack state mismatch: cfa1=4+624 cfa2=4+640
--
>> lib/stackinit_kunit.o: warning: objtool: test_packed_assigned_dynamic_all+0x14f: stack state mismatch: cfa1=4+80 cfa2=4+96
>> lib/stackinit_kunit.o: warning: objtool: test_trailing_hole_assigned_dynamic_all+0x158: stack state mismatch: cfa1=4+80 cfa2=4+96
>> lib/stackinit_kunit.o: warning: objtool: test_small_hole_assigned_dynamic_all+0x15a: stack state mismatch: cfa1=4+72 cfa2=4+88
>> lib/stackinit_kunit.o: warning: objtool: test_packed_dynamic_all+0x14f: stack state mismatch: cfa1=4+80 cfa2=4+96
>> lib/stackinit_kunit.o: warning: objtool: test_trailing_hole_dynamic_all+0x158: stack state mismatch: cfa1=4+80 cfa2=4+96
>> lib/stackinit_kunit.o: warning: objtool: test_small_hole_dynamic_all+0x15a: stack state mismatch: cfa1=4+72 cfa2=4+88
>> lib/stackinit_kunit.o: warning: objtool: test_packed_assigned_copy+0x14f: stack state mismatch: cfa1=4+80 cfa2=4+96
>> lib/stackinit_kunit.o: warning: objtool: test_trailing_hole_assigned_copy+0x158: stack state mismatch: cfa1=4+80 cfa2=4+96
>> lib/stackinit_kunit.o: warning: objtool: test_small_hole_assigned_copy+0x15a: stack state mismatch: cfa1=4+72 cfa2=4+88
>> lib/stackinit_kunit.o: warning: objtool: test_switch_2_none+0x10e: stack state mismatch: cfa1=4+40 cfa2=4+56
>> lib/stackinit_kunit.o: warning: objtool: test_switch_1_none+0x10e: stack state mismatch: cfa1=4+40 cfa2=4+56
>> lib/stackinit_kunit.o: warning: objtool: test_user+0x14e: stack state mismatch: cfa1=4+80 cfa2=4+96
>> lib/stackinit_kunit.o: warning: objtool: test_packed_none+0x12f: stack state mismatch: cfa1=4+48 cfa2=4+64
>> lib/stackinit_kunit.o: warning: objtool: test_trailing_hole_none+0x14e: stack state mismatch: cfa1=4+80 cfa2=4+96
>> lib/stackinit_kunit.o: warning: objtool: test_small_hole_none+0x150: stack state mismatch: cfa1=4+72 cfa2=4+88
>> lib/stackinit_kunit.o: warning: objtool: test_char_array_none+0x13e: stack state mismatch: cfa1=4+64 cfa2=4+80
>> lib/stackinit_kunit.o: warning: objtool: test_u64_none+0x12f: stack state mismatch: cfa1=4+48 cfa2=4+64
>> lib/stackinit_kunit.o: warning: objtool: test_u32_none+0x12f: stack state mismatch: cfa1=4+48 cfa2=4+64
>> lib/stackinit_kunit.o: warning: objtool: test_u16_none+0x12f: stack state mismatch: cfa1=4+48 cfa2=4+64
>> lib/stackinit_kunit.o: warning: objtool: test_u8_none+0x12f: stack state mismatch: cfa1=4+48 cfa2=4+64
   lib/stackinit_kunit.o: warning: objtool: test_packed_runtime_all+0x12f: stack state mismatch: cfa1=4+48 cfa2=4+64
   lib/stackinit_kunit.o: warning: objtool: test_trailing_hole_runtime_all+0x14e: stack state mismatch: cfa1=4+80 cfa2=4+96
   lib/stackinit_kunit.o: warning: objtool: test_small_hole_runtime_all+0x150: stack state mismatch: cfa1=4+72 cfa2=4+88
   lib/stackinit_kunit.o: warning: objtool: test_packed_runtime_partial+0x12f: stack state mismatch: cfa1=4+48 cfa2=4+64
   lib/stackinit_kunit.o: warning: objtool: test_trailing_hole_runtime_partial+0x14e: stack state mismatch: cfa1=4+80 cfa2=4+96
   lib/stackinit_kunit.o: warning: objtool: test_small_hole_runtime_partial+0x150: stack state mismatch: cfa1=4+72 cfa2=4+88
   lib/stackinit_kunit.o: warning: objtool: test_packed_zero+0x12f: stack state mismatch: cfa1=4+48 cfa2=4+64
   lib/stackinit_kunit.o: warning: objtool: test_packed_assigned_static_all+0x12f: stack state mismatch: cfa1=4+48 cfa2=4+64
   lib/stackinit_kunit.o: warning: objtool: test_packed_assigned_static_partial+0x12f: stack state mismatch: cfa1=4+48 cfa2=4+64
   lib/stackinit_kunit.o: warning: objtool: test_packed_static_all+0x12f: stack state mismatch: cfa1=4+48 cfa2=4+64
   lib/stackinit_kunit.o: warning: objtool: test_packed_static_partial+0x12f: stack state mismatch: cfa1=4+48 cfa2=4+64
   lib/stackinit_kunit.o: warning: objtool: test_trailing_hole_zero+0x14e: stack state mismatch: cfa1=4+80 cfa2=4+96
   lib/stackinit_kunit.o: warning: objtool: test_trailing_hole_assigned_static_all+0x14e: stack state mismatch: cfa1=4+80 cfa2=4+96
   lib/stackinit_kunit.o: warning: objtool: test_trailing_hole_assigned_static_partial+0x14e: stack state mismatch: cfa1=4+80 cfa2=4+96
   lib/stackinit_kunit.o: warning: objtool: test_trailing_hole_static_all+0x14e: stack state mismatch: cfa1=4+80 cfa2=4+96
   lib/stackinit_kunit.o: warning: objtool: test_trailing_hole_static_partial+0x14e: stack state mismatch: cfa1=4+80 cfa2=4+96
   lib/stackinit_kunit.o: warning: objtool: test_small_hole_zero+0x150: stack state mismatch: cfa1=4+72 cfa2=4+88
   lib/stackinit_kunit.o: warning: objtool: test_small_hole_assigned_static_all+0x150: stack state mismatch: cfa1=4+72 cfa2=4+88
   lib/stackinit_kunit.o: warning: objtool: test_small_hole_assigned_static_partial+0x150: stack state mismatch: cfa1=4+72 cfa2=4+88
   lib/stackinit_kunit.o: warning: objtool: test_small_hole_static_all+0x150: stack state mismatch: cfa1=4+72 cfa2=4+88
   lib/stackinit_kunit.o: warning: objtool: test_small_hole_static_partial+0x150: stack state mismatch: cfa1=4+72 cfa2=4+88
   lib/stackinit_kunit.o: warning: objtool: test_char_array_zero+0x13e: stack state mismatch: cfa1=4+64 cfa2=4+80
   lib/stackinit_kunit.o: warning: objtool: test_u64_zero+0x12f: stack state mismatch: cfa1=4+48 cfa2=4+64
   lib/stackinit_kunit.o: warning: objtool: test_u32_zero+0x12f: stack state mismatch: cfa1=4+48 cfa2=4+64
   lib/stackinit_kunit.o: warning: objtool: test_u16_zero+0x12f: stack state mismatch: cfa1=4+48 cfa2=4+64
   lib/stackinit_kunit.o: warning: objtool: test_u8_zero+0x12f: stack state mismatch: cfa1=4+48 cfa2=4+64
   lib/stackinit_kunit.o: warning: objtool: test_packed_assigned_dynamic_partial+0x133: stack state mismatch: cfa1=4+48 cfa2=4+64
   lib/stackinit_kunit.o: warning: objtool: test_trailing_hole_assigned_dynamic_partial+0x155: stack state mismatch: cfa1=4+80 cfa2=4+96
   lib/stackinit_kunit.o: warning: objtool: test_small_hole_assigned_dynamic_partial+0x156: stack state mismatch: cfa1=4+72 cfa2=4+88
   lib/stackinit_kunit.o: warning: objtool: test_packed_dynamic_partial+0x133: stack state mismatch: cfa1=4+48 cfa2=4+64
   lib/stackinit_kunit.o: warning: objtool: test_trailing_hole_dynamic_partial+0x155: stack state mismatch: cfa1=4+80 cfa2=4+96
   lib/stackinit_kunit.o: warning: objtool: test_small_hole_dynamic_partial+0x156: stack state mismatch: cfa1=4+72 cfa2=4+88
--
>> lib/memcpy_kunit.o: warning: objtool: inner_loop+0x28e: stack state mismatch: cfa1=4+96 cfa2=4+120
>> lib/memcpy_kunit.o: warning: objtool: copy_large_test+0x11e: stack state mismatch: cfa1=4+104 cfa2=4+120
--
>> lib/kunit/kunit-test.o: warning: objtool: kunit_log_newline_test+0x86: stack state mismatch: cfa1=4+48 cfa2=4+56


objdump-func vmlinux.o drm_test_buddy_alloc_pathological:

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
