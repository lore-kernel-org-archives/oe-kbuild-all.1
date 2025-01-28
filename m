Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B981199230
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Jan 2025 19:54:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738094066; cv=none; b=Mbh5iNTGSKT9uUFXVW/aqzKZAUKypzlPyG8E/9/BL6UWauK4YnSfZhplJDQphUhUovjTR25wIO+il57Cp0t27FOn69tEyGJNydsoC6ByGw94rOzKjQqnGP2HoS/nsHCBef7s1tlhZRKzeW9ikhyKYxkfFJrUoaMwHhrtSJgr4RQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738094066; c=relaxed/simple;
	bh=PhT5FxN1U/CIsxB0+rnGIVC4RN/Jd7qgOoWsFDl9MZU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=jkcL7oOvrrV6qIUj4tPFBLjYwnaRVSahThIN8/XvbqLc35CN/gSdO+IfM/bJOnBclWVs41Kj/UzGVsMj5/PpWbjk8Eu8lpNbkQfaU45OyBa6u7slwXZHIHR6xmIjIQFl1qSRRm4VcJzJbk2HNFQPqZ6cNfuYwhj0aVVk5RMyXSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lfsynjag; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lfsynjag"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738094065; x=1769630065;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PhT5FxN1U/CIsxB0+rnGIVC4RN/Jd7qgOoWsFDl9MZU=;
  b=lfsynjagBqMEoNuOifTNiB0dpK6BHnlax5FAUr50/X10KKLsHUdXPvlS
   btWufMbJD5xU38jp1EsACMdd+9/E0lSwa+3Ts2XH5A8/Q5hVtTN/+AlrE
   +bHuCOUQug53ZgEu5ugtkX79XFW3TfOc4bkhJu9a6jgyXepemnwmk3s+r
   TIN1zj06w8BX+agrkDz6dAkGEaEN92aBGucJlk0PnGO+BhugIf0Efwy81
   TWKhietJ/NLRFEPvuPXTzIlZdVgI/3c8gTA12ccLnLPJteAg/30dJQiKl
   PcwAiF0poXUTUNP49KYq9LQcrY3HWBTz9IxtZHmwVlbwAYvHzSwjMWq+x
   w==;
X-CSE-ConnectionGUID: Es30qnURTqSEJg97stq64A==
X-CSE-MsgGUID: 5UBaVDD2Qky2fa8BpGKt3Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11329"; a="38626701"
X-IronPort-AV: E=Sophos;i="6.13,242,1732608000"; 
   d="scan'208";a="38626701"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Jan 2025 11:54:24 -0800
X-CSE-ConnectionGUID: 1DWGkOi2QC2PDderAkfVYg==
X-CSE-MsgGUID: I3IsTFMfR4KrJangntyWCQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="113807234"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 28 Jan 2025 11:54:23 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tcrfA-000i9h-2B;
	Tue, 28 Jan 2025 19:54:20 +0000
Date: Wed, 29 Jan 2025 03:53:34 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1407/1407]
 include/linux/thread_info.h:59:17: warning: 'b' may be used uninitialized
Message-ID: <202501290356.I10Fs5vR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Yu,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   da51139d17e9d53d61a9877d9042e43b85d71ee1
commit: b9f356e64a7eda411ba8b63df9d4c5e204f16025 [1407/1407] block-io-hierarchy: core hierarchy iodump implementation
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250129/202501290356.I10Fs5vR-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250129/202501290356.I10Fs5vR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501290356.I10Fs5vR-lkp@intel.com/

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

0f60a8efe4005a Kees Cook 2016-07-12  50  
f5509cc18daa7f Kees Cook 2016-06-07  51  #ifdef CONFIG_HARDENED_USERCOPY
f5509cc18daa7f Kees Cook 2016-06-07  52  extern void __check_object_size(const void *ptr, unsigned long n,
f5509cc18daa7f Kees Cook 2016-06-07  53  					bool to_user);
f5509cc18daa7f Kees Cook 2016-06-07  54  
a85d6b8242dc78 Kees Cook 2016-09-07  55  static __always_inline void check_object_size(const void *ptr, unsigned long n,
f5509cc18daa7f Kees Cook 2016-06-07  56  					      bool to_user)
f5509cc18daa7f Kees Cook 2016-06-07  57  {
81409e9e280588 Kees Cook 2016-08-31  58  	if (!__builtin_constant_p(n))
f5509cc18daa7f Kees Cook 2016-06-07 @59  		__check_object_size(ptr, n, to_user);
f5509cc18daa7f Kees Cook 2016-06-07  60  }
f5509cc18daa7f Kees Cook 2016-06-07  61  #else
f5509cc18daa7f Kees Cook 2016-06-07  62  static inline void check_object_size(const void *ptr, unsigned long n,
f5509cc18daa7f Kees Cook 2016-06-07  63  				     bool to_user)
f5509cc18daa7f Kees Cook 2016-06-07  64  { }
f5509cc18daa7f Kees Cook 2016-06-07  65  #endif /* CONFIG_HARDENED_USERCOPY */
f5509cc18daa7f Kees Cook 2016-06-07  66  

:::::: The code at line 59 was first introduced by commit
:::::: f5509cc18daa7f82bcc553be70df2117c8eedc16 mm: Hardened usercopy

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
