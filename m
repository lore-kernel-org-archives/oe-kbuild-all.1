Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59E06255E47
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 20:26:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745958406; cv=none; b=oD8OHBWX9C+MQeUmv3YJSr9E6LCaVC2Zso4uS+4ROdnpEtm/oWmrxFeC265nGuCmPSbCGQIPAopnMoPo9rdbd/XTHPiRdZXryDv92fSMkB3vhv1lu0v+54DHBsQrOmD0PSpwHrqadied+tO1sVWej1bqHjmRjFAYFuFDX21rRXs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745958406; c=relaxed/simple;
	bh=ikAYejsMdZ+g2FOgy0OBtMgHnefR4CRxqBPnBfGkncI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sniUC3rsO7mYT6pawhOQ72pVpE/IdJNVr5QeWeAhqgKzcG48bci7unW52CqT8iFJPM9CrXT6rYbilzPLoph47G5VYDyBRi0+w4EyMFxYPE5wr5ZTVXixdFdJhFgtsDlCfKEoZ/UmXqLrt8ZfGcoH2SA+Yp1YgWuqtZcIGwAch64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=filwEHCJ; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="filwEHCJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1745958404; x=1777494404;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ikAYejsMdZ+g2FOgy0OBtMgHnefR4CRxqBPnBfGkncI=;
  b=filwEHCJwC5Th6RBiTjVztQLIE/HWZOPMZfjdA+55OAGJgHBGRmxHG0M
   t5fEVrg9VBWtWYYIvlvx9bwpz4npONcltIdc0i8r5X5I1beoWvgj1Kw9h
   8hBe871yv2TA65Auu/qwKhe+QCteresNzzWiTLqscq87vu9IONpUJGL6w
   zo2ok8Ifpn8x8tLc78Hdw9CeqcBgpZJ0eUDsmat0OdlQvSUV6mFwo8rG3
   fBoemV4nJTZxJ1bPoTmjPUsa6f3SsJZo0NVJ32jxxthVCb6NSczH+UTHA
   +Ut+1A42J3urySavT4EjF547v9nNcA3WYs/uqCzDGh5l5GijwgbFJAt0w
   Q==;
X-CSE-ConnectionGUID: 0QziYkzGQxCPvoPD3sOqYw==
X-CSE-MsgGUID: kzIDZrztRmWmojikwln6Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11418"; a="51264940"
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="51264940"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Apr 2025 13:26:41 -0700
X-CSE-ConnectionGUID: vyxxRBNKSRuTMeCCw/R8hg==
X-CSE-MsgGUID: JfNn2aqLTieCc1V15fLzrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,250,1739865600"; 
   d="scan'208";a="133641181"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 29 Apr 2025 13:26:40 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1u9rXJ-0002ut-1U;
	Tue, 29 Apr 2025 20:26:37 +0000
Date: Wed, 30 Apr 2025 04:26:11 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1597/1597]
 include/linux/thread_info.h:59:17: warning: 'b' may be used uninitialized
Message-ID: <202504300437.9dd9ulNF-lkp@intel.com>
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
head:   a48a35466505c8a52da57596944bd0b4485e825f
commit: b9f356e64a7eda411ba8b63df9d4c5e204f16025 [1597/1597] block-io-hierarchy: core hierarchy iodump implementation
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20250430/202504300437.9dd9ulNF-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250430/202504300437.9dd9ulNF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202504300437.9dd9ulNF-lkp@intel.com/

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
