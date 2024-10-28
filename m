Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7190563C
	for <oe-kbuild-all@lists.linux.dev>; Mon, 28 Oct 2024 00:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730073908; cv=none; b=HQbibD7Gc9uPfC/0iIWN4UDkOd83PQJTnAp17ZtvcZSBgP9VL6itbKWar2RbccQXuaTgfv07FXLIFIfZS6HcAk5bB6+dp9gxw38Bdqw/uzFIdLekaOwBvii75Quprz2Ak5SeVTy+RgKHOk/z0f2+qTHWvEDNNeJKrykdQlZyP/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730073908; c=relaxed/simple;
	bh=UoQcIDP+RWRY5lO/U88BrINYFw5pIfmv8OEp8lSEX2k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=IcjMzjWih8/NjxNrGSwir/1pMifqNUOk8zf6HsNIn1nTJwLVIdY/gj+gnHanhJGVnXUB0mshbmEoDdeW6Rq+CWQIO96CD0mm1WGRP9ojDpLSH5xzKdqa9baI4K+3Sv4QFa4RfYn5BCrLtmLoC9w7Fo1VXETHFeo4N3W77bT6McY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=i4d8snNL; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="i4d8snNL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730073905; x=1761609905;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=UoQcIDP+RWRY5lO/U88BrINYFw5pIfmv8OEp8lSEX2k=;
  b=i4d8snNLoOZl87mzh/TLVtmKhCFdm/mSU0OTay/pOWFy8c/wJCg+33XC
   zZS0VzQGFShjqcuUzrX9ikb6Ryf0m3KWtv5ULc8XU8fnyj4Y9qmuDcza2
   VunKpRwZIACEp7FYElZl/sxqmjbGTHmh1dKK/lx6Nlh10aQwAYPiWzTea
   DxTsdoEaS7lWQIGj8peP6begoQFb8aa8lfMPyQnfcREFyKifKYIU2+Ldf
   TJW79jS0EnigrBFbmVMhT2GEEwYJBWQahO0M0dkjKVO4pCcGzHClbS+DR
   t7iMUmx5Z2fzYbZzGl5rHfB0D8s8W9+vQKSR05idKjxdRM5LwJOVVBdZS
   Q==;
X-CSE-ConnectionGUID: ZJyrw30JRlGJ18kVak8m+w==
X-CSE-MsgGUID: CUpmmv4PQoqivG+0nsZHIQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="47149605"
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="47149605"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 17:05:05 -0700
X-CSE-ConnectionGUID: kOzfjd80SpWD3Oc9/6A2wg==
X-CSE-MsgGUID: MeQxxH10SLC59YEYh/1q9A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="112272898"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 27 Oct 2024 17:05:00 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5DFh-000b6S-0y;
	Mon, 28 Oct 2024 00:04:57 +0000
Date: Mon, 28 Oct 2024 08:04:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15692/23866]
 include/linux/uaccess.h:112:17: warning: 'ciov' may be used uninitialized
Message-ID: <202410280718.cUYy6LpU-lkp@intel.com>
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
head:   22c50245e8025b0c6beee13d0df238987b98e6f8
commit: 6c08191286995b0594d2ecf12fe7fca3cea1a5ca [15692/23866] io_uring: add support for pre-mapped user IO buffers
config: arm64-randconfig-004-20241027 (https://download.01.org/0day-ci/archive/20241028/202410280718.cUYy6LpU-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410280718.cUYy6LpU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410280718.cUYy6LpU-lkp@intel.com/

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
                    from include/linux/kernel.h:10,
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

d597580d373774b Al Viro        2017-03-20  104  
d597580d373774b Al Viro        2017-03-20  105  #ifdef INLINE_COPY_FROM_USER
d597580d373774b Al Viro        2017-03-20  106  static inline unsigned long
d597580d373774b Al Viro        2017-03-20  107  _copy_from_user(void *to, const void __user *from, unsigned long n)
d597580d373774b Al Viro        2017-03-20  108  {
d597580d373774b Al Viro        2017-03-20  109  	unsigned long res = n;
9c5f6908de03a4f Al Viro        2017-06-29  110  	might_fault();
4983cb67a383a73 Linus Torvalds 2019-02-14  111  	if (likely(access_ok(from, n))) {
9c5f6908de03a4f Al Viro        2017-06-29 @112  		kasan_check_write(to, n);
d597580d373774b Al Viro        2017-03-20  113  		res = raw_copy_from_user(to, from, n);
9c5f6908de03a4f Al Viro        2017-06-29  114  	}
d597580d373774b Al Viro        2017-03-20  115  	if (unlikely(res))
d597580d373774b Al Viro        2017-03-20  116  		memset(to + (n - res), 0, res);
d597580d373774b Al Viro        2017-03-20  117  	return res;
d597580d373774b Al Viro        2017-03-20  118  }
d597580d373774b Al Viro        2017-03-20  119  #else
d597580d373774b Al Viro        2017-03-20  120  extern unsigned long
d597580d373774b Al Viro        2017-03-20  121  _copy_from_user(void *, const void __user *, unsigned long);
d597580d373774b Al Viro        2017-03-20  122  #endif
d597580d373774b Al Viro        2017-03-20  123  
d597580d373774b Al Viro        2017-03-20  124  #ifdef INLINE_COPY_TO_USER
d597580d373774b Al Viro        2017-03-20  125  static inline unsigned long
d597580d373774b Al Viro        2017-03-20  126  _copy_to_user(void __user *to, const void *from, unsigned long n)
d597580d373774b Al Viro        2017-03-20  127  {
9c5f6908de03a4f Al Viro        2017-06-29  128  	might_fault();
4983cb67a383a73 Linus Torvalds 2019-02-14  129  	if (access_ok(to, n)) {
9c5f6908de03a4f Al Viro        2017-06-29  130  		kasan_check_read(from, n);
d597580d373774b Al Viro        2017-03-20  131  		n = raw_copy_to_user(to, from, n);
9c5f6908de03a4f Al Viro        2017-06-29  132  	}
d597580d373774b Al Viro        2017-03-20  133  	return n;
d597580d373774b Al Viro        2017-03-20  134  }
d597580d373774b Al Viro        2017-03-20  135  #else
d597580d373774b Al Viro        2017-03-20  136  extern unsigned long
d597580d373774b Al Viro        2017-03-20  137  _copy_to_user(void __user *, const void *, unsigned long);
d597580d373774b Al Viro        2017-03-20  138  #endif
d597580d373774b Al Viro        2017-03-20  139  
d597580d373774b Al Viro        2017-03-20  140  static __always_inline unsigned long __must_check
d597580d373774b Al Viro        2017-03-20  141  copy_from_user(void *to, const void __user *from, unsigned long n)
d597580d373774b Al Viro        2017-03-20  142  {
b0377fedb652808 Al Viro        2017-06-29  143  	if (likely(check_copy_size(to, n, false)))
d597580d373774b Al Viro        2017-03-20 @144  		n = _copy_from_user(to, from, n);
d597580d373774b Al Viro        2017-03-20  145  	return n;
d597580d373774b Al Viro        2017-03-20  146  }
d597580d373774b Al Viro        2017-03-20  147  

:::::: The code at line 112 was first introduced by commit
:::::: 9c5f6908de03a4f52ba7364b11fcd6116225480c copy_{from,to}_user(): move kasan checks and might_fault() out-of-line

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Al Viro <viro@zeniv.linux.org.uk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
