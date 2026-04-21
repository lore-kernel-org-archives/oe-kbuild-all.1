Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D28D3355055
	for <oe-kbuild-all@lists.linux.dev>; Tue, 21 Apr 2026 18:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776795515; cv=none; b=Mh+HColC5OV2s81tojImfUbRM7WAMeB/wJx2rn37GL0GJdSHdeNyXVEvzGi1AeL3pSnstKMZmvrYUz+P3p3YE/mYhJDVs9OpokFSdH1+q69Vrz3Lrt/k3NJxuG79ZiCJAYlzm+veVaeKk6gIHEdaKhgZ02Govlc3lua9IIlT550=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776795515; c=relaxed/simple;
	bh=lWzIZ7CQ3suoQ85NYdGMUZYSaFlLVGnI3DnrGcJcN24=;
	h=Date:From:To:Cc:Subject:Message-ID; b=V3RgWdob6u67BBnB4VAjFWgcF6DVGEw02HN+pOLtJNvLzc3FbWs9Qcj8a0p9hM8FIypihsHa4LYd9K8rtryNsEox4QHXOzWeHaJhg0HMmgyGU5cKYRTd5S+VloHm+x8bsHNrW1Z6ACuD79hPm7Of+2tvPeDRnsDJPPCvgFOPVUQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KrVuyMJ1; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KrVuyMJ1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776795513; x=1808331513;
  h=date:from:to:cc:subject:message-id;
  bh=lWzIZ7CQ3suoQ85NYdGMUZYSaFlLVGnI3DnrGcJcN24=;
  b=KrVuyMJ1u7gzGpV2yNEfGA6XqRtPhEEPWcNHc8Is47FFKVPlH6xQL2AD
   MgIpXbxRSRc3J/znXqCno6TbCVoVgdkGNJ0LCZhkMZbaQyB55+2LQUHBM
   7Sf96c+CtnTNqAShbE9BrAoXIPwcu3MXUhLzKWN5iHnWU4PXx21bzdZt3
   ivmbxExWZsjKw3SWpnh6T4iTjqSajwidDIiqF2ifrCblSmfzc9p/+5K9s
   xe6ZOrRpdSwZy8aO+xkf3UbpKSvXr0FGZhvRMZoejG/ldKbnOKF2INwac
   sLe7NVKCdE9AkbSfiQUXrJ9J70GUOsLLD/xMHiL0+9nwyY5rUQDp19SD/
   w==;
X-CSE-ConnectionGUID: XVw49bJASgCsEJMNVMZvAg==
X-CSE-MsgGUID: +gaaO7e6SKm0LYGZ54VJ8g==
X-IronPort-AV: E=McAfee;i="6800,10657,11763"; a="77809591"
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="77809591"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Apr 2026 11:18:31 -0700
X-CSE-ConnectionGUID: Q/iFzzczSXyJF7KuPt27RQ==
X-CSE-MsgGUID: qLUC/4UXSkOGTGLtPp0SSg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,192,1770624000"; 
   d="scan'208";a="270192888"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 21 Apr 2026 11:18:31 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wFFg3-000000003qf-3kZ3;
	Tue, 21 Apr 2026 18:18:27 +0000
Date: Wed, 22 Apr 2026 02:17:45 +0800
From: kernel test robot <lkp@intel.com>
To: Mark Rutland <mark.rutland@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [mark:stacktrace/tests 2/4] stacktrace_kunit.c:undefined
 reference to `__kunit_do_failed_assertion'
Message-ID: <202604220218.IPkblOIe-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mark/linux.git stacktrace/tests
head:   224cbf0cef8a49306bab3f8723e83a207d43ad11
commit: 3d53466128c5609a49b1f0e4ae97f3c8e378133d [2/4] WIP: lib: add basic stacktrace tests
config: csky-allmodconfig (https://download.01.org/0day-ci/archive/20260422/202604220218.IPkblOIe-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260422/202604220218.IPkblOIe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604220218.IPkblOIe-lkp@intel.com/

All errors (new ones prefixed by >>):

   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `std_expect_trace':
>> stacktrace_kunit.c:(.text+0x306): undefined reference to `__kunit_do_failed_assertion'
>> csky-linux-ld: stacktrace_kunit.c:(.text+0x32c): undefined reference to `__kunit_do_failed_assertion'
>> csky-linux-ld: stacktrace_kunit.c:(.text+0x38c): undefined reference to `kunit_fail_assert_format'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x394): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `std_expect_callers_present_reliable':
>> stacktrace_kunit.c:(.text+0x3f2): undefined reference to `kunit_log_append'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `caller_tail_unwind':
   stacktrace_kunit.c:(.text+0x4e0): undefined reference to `kunit_log_append'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `std_test_exit':
>> stacktrace_kunit.c:(.text+0x518): undefined reference to `kunit_kfree'
>> csky-linux-ld: stacktrace_kunit.c:(.text+0x58c): undefined reference to `kunit_log_append'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x5de): undefined reference to `kunit_log_append'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `std_test_init':
>> stacktrace_kunit.c:(.text+0x654): undefined reference to `kunit_kmalloc_array'
>> csky-linux-ld: stacktrace_kunit.c:(.text+0x670): undefined reference to `kunit_kfree'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x688): undefined reference to `kunit_log_append'
>> csky-linux-ld: stacktrace_kunit.c:(.text+0x694): undefined reference to `kunit_kmalloc_array'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_reliable_notail':
   stacktrace_kunit.c:(.text+0x70a): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_reliable_tail':
   stacktrace_kunit.c:(.text+0x78a): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_reliable':
   stacktrace_kunit.c:(.text+0x80a): undefined reference to `__kunit_do_failed_assertion'
>> csky-linux-ld: stacktrace_kunit.c:(.text+0x848): undefined reference to `kunit_binary_ptr_assert_format'
   csky-linux-ld: stacktrace_kunit.c:(.text+0x84c): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_notail':
   stacktrace_kunit.c:(.text+0x8ca): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_unwind_tail':
   stacktrace_kunit.c:(.text+0x94a): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_unwind':
   stacktrace_kunit.c:(.text+0x9ca): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0xa0c): undefined reference to `kunit_binary_ptr_assert_format'
   csky-linux-ld: stacktrace_kunit.c:(.text+0xa10): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind_notail':
   stacktrace_kunit.c:(.text+0xa8a): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0xacc): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0xb0c): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind_tail':
   stacktrace_kunit.c:(.text+0xb8a): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: lib/tests/stacktrace_kunit.o:stacktrace_kunit.c:(.text+0xbcc): more undefined references to `__kunit_do_failed_assertion' follow
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind_tail':
>> stacktrace_kunit.c:(.text+0xc48): undefined reference to `kunit_binary_ptr_assert_format'
   csky-linux-ld: stacktrace_kunit.c:(.text+0xc4c): undefined reference to `__kunit_do_failed_assertion'
>> csky-linux-ld: stacktrace_kunit.c:(.text+0xc54): undefined reference to `kunit_binary_assert_format'
   csky-linux-ld: lib/tests/stacktrace_kunit.o: in function `test_nounwind':
   stacktrace_kunit.c:(.text+0xcca): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0xd0c): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0xd4c): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0xd88): undefined reference to `kunit_binary_ptr_assert_format'
   csky-linux-ld: stacktrace_kunit.c:(.text+0xd8c): undefined reference to `__kunit_do_failed_assertion'
   csky-linux-ld: stacktrace_kunit.c:(.text+0xd94): undefined reference to `kunit_binary_assert_format'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
