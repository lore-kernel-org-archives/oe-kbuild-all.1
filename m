Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3314376047
	for <oe-kbuild-all@lists.linux.dev>; Fri,  9 Feb 2024 16:15:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707495336; cv=none; b=KNWy1MKJOTbv/PclyiPn4OBuyAornYQr5vQyZfaEhdQ5l/acVbdH8A+CYaCWMLkQs4w3tmFM6cp1UDV9dhWAOFMXdb0QTwm4MlfbbDoqdJUw8WHFPMocjDV6huBKkRgvBG4SrZhiuYuucQQcEXFTqwjE1MNSu9OsGOmawXQ303I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707495336; c=relaxed/simple;
	bh=7iLPhPds+BjkiKeguEdeSCVjfcEnwmg6sMpuleVgP2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=fY8tGNe5KMUA91DjqruQVr8yM+lID2bRq6C7+bgo3TBRNQQcA3CHYJ5rTUGjm1Q1KIiJEO9pwhRv9W+vIwsbH3yQRgi+WLxkpjDdpH9x2SKub6UNo3MbPFTmu/JBk5r4HR5UWGn5haitC87FBubbfrI7dIr3J9DmUni8Zak7ibA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kJyOQslt; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kJyOQslt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707495334; x=1739031334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=7iLPhPds+BjkiKeguEdeSCVjfcEnwmg6sMpuleVgP2g=;
  b=kJyOQsltzkkX0P47mcuS0IdxGTJlMQGdRLdrltqUuqJuo7fD9yhrMj/8
   //LvlcE2HU/tCuF9sQXKHJq+t3fKzZm88fZ+5IQqEDbUDtl0+w1tnEauB
   8oQNoR51Ov5KWFihfmVEg57c0qk2U/msXYjv3v3kjWTrcoFzfiD71eaIp
   8V1+2V8VZfkyUiNvjlHlQeSs/CTANRHoGF9yVv7LY1VePh/F6DQjq8dx4
   qsuc6VfQgV4ViHkyglXkPVLf7kTHD7hQudkr0014rtMe/wL5fIGP70Ks9
   wUZaPNPJtuSci4NSSiLsacZUNzmWjCD9TYzscVcV6Dp/zgRCi4KKRWOCi
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10979"; a="5249504"
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="5249504"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Feb 2024 08:15:33 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,257,1701158400"; 
   d="scan'208";a="2011977"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 09 Feb 2024 08:15:31 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYTXF-0004t1-13;
	Fri, 09 Feb 2024 16:15:29 +0000
Date: Sat, 10 Feb 2024 00:15:24 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15692/21625]
 include/linux/uaccess.h:112:17: warning: 'ciov' may be used uninitialized
Message-ID: <202402100007.deukWjpN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   7efcac7603953bb58d80041f410b079378b5174c
commit: 6c08191286995b0594d2ecf12fe7fca3cea1a5ca [15692/21625] io_uring: add support for pre-mapped user IO buffers
config: arm64-randconfig-r123-20240125 (https://download.01.org/0day-ci/archive/20240210/202402100007.deukWjpN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240210/202402100007.deukWjpN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402100007.deukWjpN-lkp@intel.com/

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
