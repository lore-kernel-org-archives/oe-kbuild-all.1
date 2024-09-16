Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46800154C08
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 10:40:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726483239; cv=none; b=d+sGyHN0N3tuTBcXjnxlDyGmsnqI9dVx7YNCnR3bjSRdEP1uhr6o9IrixRVP09fqYGSDf5JCAU2npvs4Z2wS1z5/bhU5g0d65gnAnd/SN5Fs47nB2ABROcTafTd72Ku1pPXcQgbcj0y3jL1EL+HWBuh00lIGhCNH9DnbMhkhE1I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726483239; c=relaxed/simple;
	bh=BAI56PZh7NfLqIYFlDmld2DonOv5ez/xGrDVXHYB9B4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PXyEhCdg6TsfLc8qv8W9PLrMqd6dv88A+zSevJ0lu1Q2E/PeWJkYHhtCb/HKorbyg/4znd8qj2TbKpJbezcI93E5Uoy3xcTUuuyqiqS8ytmHY8hTBTMpV5r0Ft+Ptlf5FbNWQXCZWMQIQXjbfg41YRI1+GoJ6zzLqU1L2E1tpso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eJ5VSDLK; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eJ5VSDLK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726483237; x=1758019237;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BAI56PZh7NfLqIYFlDmld2DonOv5ez/xGrDVXHYB9B4=;
  b=eJ5VSDLKNluXTiFCI6ZcaUumqDx8q+Hu+Wq1RcsyV9LNC/Dd5Id+LehZ
   EWbTjNZ7xoj+QRRgjONGrUAnqouz+VapgDOW+bDwJTSXzEEwJRhS9mYSy
   q4HZucg8s3ZfkvlAzdZdl2cgLJ5sqY+ktkVxzlSXy3y4OWr5Wnkwfjuwk
   HftCuj/acHGGw9EgHngYTrYOcoMN0jIAJfMh7edllAOTp8nqoOHGzM9QX
   pfntZNaI++nZSDOKml7Gvck0h/lLADG9PW/70jVHAkQR2K7cEJ78bPQ6s
   Avhj0Gm2aFdTRO963Ok54rOivz1OtO4DnCEK2EIB66FdLAYWTKioQ8HB6
   A==;
X-CSE-ConnectionGUID: 3X7337kSQtCLBmTTzPsHEA==
X-CSE-MsgGUID: GuLh5EBJQLiOIvlLkYUAnw==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="42818025"
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="42818025"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Sep 2024 03:40:36 -0700
X-CSE-ConnectionGUID: v8Lhwg9bT5mfOkzxWN3Sqw==
X-CSE-MsgGUID: UKIz8yXcRpKYMZU6dI1ejA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,233,1719903600"; 
   d="scan'208";a="69075507"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 16 Sep 2024 03:40:36 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq99l-0009ey-0k;
	Mon, 16 Sep 2024 10:40:33 +0000
Date: Mon, 16 Sep 2024 18:39:37 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15692/23714]
 include/linux/uaccess.h:112:17: warning: 'ciov' may be used uninitialized
Message-ID: <202409161843.Wdlfbwor-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jens,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: 6c08191286995b0594d2ecf12fe7fca3cea1a5ca [15692/23714] io_uring: add support for pre-mapped user IO buffers
config: arm64-randconfig-001-20240913 (https://download.01.org/0day-ci/archive/20240916/202409161843.Wdlfbwor-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409161843.Wdlfbwor-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161843.Wdlfbwor-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/linux/poll.h:12,
                    from include/linux/ring_buffer.h:7,
                    from include/linux/trace_events.h:6,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:86,
                    from fs/io_uring.c:32:
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'io_copy_iov.isra' at fs/io_uring.c:1457:7:
>> include/linux/uaccess.h:112:17: warning: 'ciov' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/compiler.h:251,
                    from include/linux/export.h:45,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:7,
                    from fs/io_uring.c:29:
   include/linux/kasan-checks.h: In function 'io_copy_iov.isra':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   fs/io_uring.c:1454:37: note: 'ciov' declared here
    1454 |                 struct compat_iovec ciov;
         |                                     ^~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'io_uring_setup' at fs/io_uring.c:1960:6:
   include/linux/uaccess.h:112:17: warning: 'p' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'io_uring_setup':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   fs/io_uring.c:1956:32: note: 'p' declared here
    1956 |         struct io_uring_params p;
         |                                ^
   In file included from include/linux/uaccess.h:11:
   In function 'set_fs',
       inlined from 'io_sq_wq_submit_work' at fs/io_uring.c:1114:3:
   arch/arm64/include/asm/uaccess.h:59:12: warning: 'old_fs' may be used uninitialized [-Wmaybe-uninitialized]
      59 |         if (IS_ENABLED(CONFIG_ARM64_UAO) && fs == KERNEL_DS)
         |            ^
   fs/io_uring.c: In function 'io_sq_wq_submit_work':
   fs/io_uring.c:1074:22: note: 'old_fs' was declared here
    1074 |         mm_segment_t old_fs;
         |                      ^~~~~~


vim +/ciov +112 include/linux/uaccess.h

d597580d373774 Al Viro        2017-03-20  104  
d597580d373774 Al Viro        2017-03-20  105  #ifdef INLINE_COPY_FROM_USER
d597580d373774 Al Viro        2017-03-20  106  static inline unsigned long
d597580d373774 Al Viro        2017-03-20  107  _copy_from_user(void *to, const void __user *from, unsigned long n)
d597580d373774 Al Viro        2017-03-20  108  {
d597580d373774 Al Viro        2017-03-20  109  	unsigned long res = n;
9c5f6908de03a4 Al Viro        2017-06-29  110  	might_fault();
4983cb67a383a7 Linus Torvalds 2019-02-14  111  	if (likely(access_ok(from, n))) {
9c5f6908de03a4 Al Viro        2017-06-29 @112  		kasan_check_write(to, n);
d597580d373774 Al Viro        2017-03-20  113  		res = raw_copy_from_user(to, from, n);
9c5f6908de03a4 Al Viro        2017-06-29  114  	}
d597580d373774 Al Viro        2017-03-20  115  	if (unlikely(res))
d597580d373774 Al Viro        2017-03-20  116  		memset(to + (n - res), 0, res);
d597580d373774 Al Viro        2017-03-20  117  	return res;
d597580d373774 Al Viro        2017-03-20  118  }
d597580d373774 Al Viro        2017-03-20  119  #else
d597580d373774 Al Viro        2017-03-20  120  extern unsigned long
d597580d373774 Al Viro        2017-03-20  121  _copy_from_user(void *, const void __user *, unsigned long);
d597580d373774 Al Viro        2017-03-20  122  #endif
d597580d373774 Al Viro        2017-03-20  123  

:::::: The code at line 112 was first introduced by commit
:::::: 9c5f6908de03a4f52ba7364b11fcd6116225480c copy_{from,to}_user(): move kasan checks and might_fault() out-of-line

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
