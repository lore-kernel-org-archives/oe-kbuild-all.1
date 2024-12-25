Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4BEC4F20C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Dec 2024 20:00:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735156860; cv=none; b=C+0neaIqUMtbalWvySRAxJSc9EUx43zXBfgZgPtuPoZMoZOBcCGJ0aAR3acS++txTGlJLWGD/XJxZe5VYJfO+i1/ysCBdN2uLuqAlLGLCv9c9oVlWNSkgGAHgGwX7Gz+GgilQoUkMY3b4GeMdxlod7aqoPgW09a2hF5RpYvFAOM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735156860; c=relaxed/simple;
	bh=erAchA3Huzyl3TWsy5ejCCRR9DO0VfzzRoRW3bwTlRs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ex/t67BZbgq9IJhMto+Ng1WwcmLhlUmYdkVfusec2wTwSTNdiqvXFP47vO4SBEwhEZOBoMPiDLlv7KeJ+HGwwKDmHOrrkpgYbNxxHxwogNJ19L8z3LKW7NjR7/gw0qId/TKli4aclre5hA7Fc84ADHza/hG6kaa2Lrm+D7SU9QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=G7BGYqiP; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G7BGYqiP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735156858; x=1766692858;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=erAchA3Huzyl3TWsy5ejCCRR9DO0VfzzRoRW3bwTlRs=;
  b=G7BGYqiPrYH9t2sVpTPeTC9DksqIf5MWDXReYjIprBKySnLB8L81LDhX
   KhSqKbKwRzNalbShG6vOc7Co62LGR+0e085tFFKUFsWYtf83oBRMEYdGL
   GiDpZXsdJ7ClYn4lOOULppYXdCbDrGyTwrGYQpPZzsG1PcOH7ASpBII6S
   IkHzdmdvUKlFk6PQZMJKqHvYL1SLikyuoDr2iM2v4JI/AtF9B4HtbNigM
   06eqIrCtUPwEVTgfqfvUq12g10aL49UxOoGtJDi2BsXwSAsm9JBzmVtIO
   H5WyIYC2QIYpqmFyQblzFV+eRqWTSVIkb56PCLmHrpij6Muc1M6/IOvwq
   A==;
X-CSE-ConnectionGUID: g8v6TD8NQgaObdvuAcSfwQ==
X-CSE-MsgGUID: 9QVwfw+KQF+7oPHseAW+Wg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35471270"
X-IronPort-AV: E=Sophos;i="6.12,264,1728975600"; 
   d="scan'208";a="35471270"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Dec 2024 12:00:57 -0800
X-CSE-ConnectionGUID: w4uWkmHFQ9GqKnGf6Muy8w==
X-CSE-MsgGUID: I0z/qo/dTumb36+KsXHpKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="100247350"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 25 Dec 2024 12:00:56 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQXYr-00027S-2F;
	Wed, 25 Dec 2024 20:00:53 +0000
Date: Thu, 26 Dec 2024 04:00:13 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1353/1353]
 include/linux/uaccess.h:112:17: warning: 'ciov' may be used uninitialized
Message-ID: <202412260313.PaIUDFJt-lkp@intel.com>
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
head:   07d14ba27c5232baa4db34abda2725802e5cab3c
commit: 6c08191286995b0594d2ecf12fe7fca3cea1a5ca [1353/1353] io_uring: add support for pre-mapped user IO buffers
config: arm64-randconfig-001-20241225 (https://download.01.org/0day-ci/archive/20241226/202412260313.PaIUDFJt-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241226/202412260313.PaIUDFJt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412260313.PaIUDFJt-lkp@intel.com/

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
