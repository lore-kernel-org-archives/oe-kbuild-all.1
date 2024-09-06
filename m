Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69D8B1482E8
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Sep 2024 11:05:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725620752; cv=none; b=ayeZ5/YUnJTUUSe/Zp3SXG7+yXHBASRAvhEcWOXC6KVXRp39EH2KOoMf0IBeVmL/fh/TdN+UxP+4q8DQ9IxyL15Q+QDvl/L9Dwyh9nFzMLgAS/cnK7ZxTde99OlZ1zUxgkNEgyuZK9Ft3VXcrjc6EqyE1xhuSzSeRPnZ3a7m7co=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725620752; c=relaxed/simple;
	bh=0FDG+dvD2K3JniS82mOD+icW32JiBj+H5XtYvdoQW4Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=QNibTVHewPPmo95z+r1VZ3F5H+tHxkyqyiPGaNjDBTbz7YQbsw6u4oAD1hruIo3byV5WBeGaDVs3Xb9xaUwGarZQVakFNxOrarNhFe9e9iUK1PY/QsSMQpGTBAJXEcCELt/hhi90JdkyTvoYGakbllcQzmfA9/B7Gw605xtHEJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lX4IbS9X; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lX4IbS9X"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1725620750; x=1757156750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0FDG+dvD2K3JniS82mOD+icW32JiBj+H5XtYvdoQW4Q=;
  b=lX4IbS9X/SmuZR0LtiVeZB9icoqwq/dbFIf5ZT9xGjVGt8pdoRvF7NIv
   g55EkqfwBMINgjzqhVZN+S8odPZNl2aFcFu4fZ0Q3DTLfAMMNimBhpqok
   7GZjBYJqfNOKvaZp2w1eLmzIAbGmIUnDo6I+F+ZPE9rYa5Tnrw1kF9SMf
   dozqFXbdYYtDjy6hBSguiVDE7RQN8wfJtzwTLSqCb6OYOYamXgzbmhHvg
   gPWHVMtKVImT0YQv/PSzA3Zqf1XSy6zgpyLw3pg1BmdQ9jhEH4aRVVT4j
   Hh6SqpMwiKLE+TMRUuAskVj1dcvKNIRekzwRYY1cmaUMHDLL5W3a5GH0s
   A==;
X-CSE-ConnectionGUID: +7fRryXUSFKQ/NxPSQlx6g==
X-CSE-MsgGUID: JBiiZosbQXe3KqIig3Lk5w==
X-IronPort-AV: E=McAfee;i="6700,10204,11186"; a="41857427"
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="41857427"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Sep 2024 04:05:50 -0700
X-CSE-ConnectionGUID: KauuFlAJTKCppJQ9aPuLZA==
X-CSE-MsgGUID: KBN1qIDrTNm530szDmGTvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,207,1719903600"; 
   d="scan'208";a="96707892"
Received: from lkp-server01.sh.intel.com (HELO 9c6b1c7d3b50) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 06 Sep 2024 04:05:48 -0700
Received: from kbuild by 9c6b1c7d3b50 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1smWmf-000B4b-2w;
	Fri, 06 Sep 2024 11:05:45 +0000
Date: Fri, 6 Sep 2024 19:05:18 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 23662/23701]
 include/linux/thread_info.h:59:17: warning: 'b' may be used uninitialized
Message-ID: <202409061840.VkS4KqE5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   13b424f97ef548612c760cfd0892f96de96707e0
commit: b9f356e64a7eda411ba8b63df9d4c5e204f16025 [23662/23701] block-io-hierarchy: core hierarchy iodump implementation
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20240906/202409061840.VkS4KqE5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240906/202409061840.VkS4KqE5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409061840.VkS4KqE5-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/asm-generic/preempt.h:5,
                    from ./arch/arm64/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:81,
                    from include/linux/spinlock.h:51,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from include/linux/seq_file.h:11,
                    from block/blk-io-hierarchy/iodump.c:14:
   In function 'check_object_size',
       inlined from 'check_copy_size' at include/linux/thread_info.h:90:2,
       inlined from 'copy_from_user' at include/linux/uaccess.h:143:6,
       inlined from 'threshold_store' at block/blk-io-hierarchy/iodump.c:240:6:
>> include/linux/thread_info.h:59:17: warning: 'b' may be used uninitialized [-Wmaybe-uninitialized]
      59 |                 __check_object_size(ptr, n, to_user);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/thread_info.h: In function 'threshold_store':
   include/linux/thread_info.h:52:13: note: by argument 1 of type 'const void *' to '__check_object_size' declared here
      52 | extern void __check_object_size(const void *ptr, unsigned long n,
         |             ^~~~~~~~~~~~~~~~~~~
   block/blk-io-hierarchy/iodump.c:234:14: note: 'b' declared here
     234 |         char b[MAX_BUF_LEN + 1];
         |              ^


vim +/b +59 include/linux/thread_info.h

0f60a8efe4005ab Kees Cook 2016-07-12  50  
f5509cc18daa7f8 Kees Cook 2016-06-07  51  #ifdef CONFIG_HARDENED_USERCOPY
f5509cc18daa7f8 Kees Cook 2016-06-07  52  extern void __check_object_size(const void *ptr, unsigned long n,
f5509cc18daa7f8 Kees Cook 2016-06-07  53  					bool to_user);
f5509cc18daa7f8 Kees Cook 2016-06-07  54  
a85d6b8242dc78e Kees Cook 2016-09-07  55  static __always_inline void check_object_size(const void *ptr, unsigned long n,
f5509cc18daa7f8 Kees Cook 2016-06-07  56  					      bool to_user)
f5509cc18daa7f8 Kees Cook 2016-06-07  57  {
81409e9e2805881 Kees Cook 2016-08-31  58  	if (!__builtin_constant_p(n))
f5509cc18daa7f8 Kees Cook 2016-06-07 @59  		__check_object_size(ptr, n, to_user);
f5509cc18daa7f8 Kees Cook 2016-06-07  60  }
f5509cc18daa7f8 Kees Cook 2016-06-07  61  #else
f5509cc18daa7f8 Kees Cook 2016-06-07  62  static inline void check_object_size(const void *ptr, unsigned long n,
f5509cc18daa7f8 Kees Cook 2016-06-07  63  				     bool to_user)
f5509cc18daa7f8 Kees Cook 2016-06-07  64  { }
f5509cc18daa7f8 Kees Cook 2016-06-07  65  #endif /* CONFIG_HARDENED_USERCOPY */
f5509cc18daa7f8 Kees Cook 2016-06-07  66  

:::::: The code at line 59 was first introduced by commit
:::::: f5509cc18daa7f82bcc553be70df2117c8eedc16 mm: Hardened usercopy

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
