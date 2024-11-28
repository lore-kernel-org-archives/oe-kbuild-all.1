Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55AB83232
	for <oe-kbuild-all@lists.linux.dev>; Thu, 28 Nov 2024 16:07:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732810072; cv=none; b=Vj0lfY2YSlH9/bqfgoTo39cL22Y9udkXo2Xo7RYfC3jI6hBiqX8Q389urZZwctfdgX6NOazeeb5W75rZtqQMq1M90Sd7eKrC3Rc0Zk6MTOBTptS2UQvgZAWyEPvnN7yzveDKjC1yPtsr+NDckYRbWWgtmR/hXjGn4GOpIm/iW+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732810072; c=relaxed/simple;
	bh=JFVr17N8JkRsKg1VS+b+4PJ4FoyWZVnezvdOzaRO8wI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rSeB9cWzqTvSqny6LH6p4UcJmk3nOkoUorS9mzsP4uH2dHyJIts1fxSJLdE/K8RyjUEgHkdnJJmdXO3/Fq8KzFimRCg/agzh0i/aPqOtwJl1nBletUIPq/Bl3KyrbYLPkQXFaMiLsTWvuk2INlrlv4vXozAoFaGDBqlT7hqxo5c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Bj3gKJND; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Bj3gKJND"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1732810070; x=1764346070;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=JFVr17N8JkRsKg1VS+b+4PJ4FoyWZVnezvdOzaRO8wI=;
  b=Bj3gKJNDD9ioPUl3z6vl5OsTSbCcagZA76R7umjAeEFsl5ROH5kEof95
   kpgXZeAv1BzSKFsqLt5418JgeZxPcaz4o6baC48NXDpH8wPVDriIRCzuS
   v5kMgKwv28dKWDcXvzjqgV4cnuTWkn3aptZypgDTrjroXJTfYA3Z/B+H2
   sMySi9MhDV2srzt7uLWnBFXeNH+5M1RtC1dFkGgKSkbKv7Msnc0C5CBrr
   FxKB6CeoZxg94Ye1ksBEkjTlCA9ZxRNfuN7kkEeNFvcYskbynjlGxcQF+
   KXXOKBLOPQaURYnke75YtQu/QdDe/qcaZrG4FENP4D+cZpdYFUJhq1dlC
   g==;
X-CSE-ConnectionGUID: TbMIqMEZQxeKrL+s4w3myg==
X-CSE-MsgGUID: JQCB9j/bTemG4NzFzWBCYw==
X-IronPort-AV: E=McAfee;i="6700,10204,11270"; a="36715296"
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="36715296"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Nov 2024 08:07:42 -0800
X-CSE-ConnectionGUID: cuQ/Uw+0TJ2mYlqR6FoT0Q==
X-CSE-MsgGUID: eoevLt8jQha396Kysw6m5Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,192,1728975600"; 
   d="scan'208";a="93112340"
Received: from lkp-server01.sh.intel.com (HELO 8122d2fc1967) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 28 Nov 2024 08:07:40 -0800
Received: from kbuild by 8122d2fc1967 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tGh3K-0009mK-0U;
	Thu, 28 Nov 2024 16:07:38 +0000
Date: Fri, 29 Nov 2024 00:07:25 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yang Yingliang <yangyingliang@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1315/1315]
 include/linux/uaccess.h:112:17: warning: 'kfw32' may be used uninitialized
Message-ID: <202411282322.GQOVQGdk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   b5504db0db8375a77340b5bb54c17cfb75d3c754
commit: f4ac72026ae0042a02d0bad7a61679a356ff97d8 [1315/1315] scsi: mptfusion: Fix double fetch bug in ioctl
config: arm64-randconfig-001-20241128 (https://download.01.org/0day-ci/archive/20241128/202411282322.GQOVQGdk-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241128/202411282322.GQOVQGdk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411282322.GQOVQGdk-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

                    from drivers/message/fusion/mptctl.c:58:
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'mptctl_readtest' at drivers/message/fusion/mptctl.c:1482:6:
   include/linux/uaccess.h:112:17: warning: 'karg' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/compiler.h:251,
                    from include/linux/export.h:45,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:7,
                    from drivers/message/fusion/mptctl.c:48:
   include/linux/kasan-checks.h: In function 'mptctl_readtest':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/message/fusion/mptctl.c:1480:34: note: 'karg' declared here
    1480 |         struct mpt_ioctl_test    karg;
         |                                  ^~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'mptctl_eventquery' at drivers/message/fusion/mptctl.c:1534:6:
   include/linux/uaccess.h:112:17: warning: 'karg' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'mptctl_eventquery':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/message/fusion/mptctl.c:1532:42: note: 'karg' declared here
    1532 |         struct mpt_ioctl_eventquery      karg;
         |                                          ^~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'mptctl_eventreport' at drivers/message/fusion/mptctl.c:1604:6:
   include/linux/uaccess.h:112:17: warning: 'karg' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'mptctl_eventreport':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/message/fusion/mptctl.c:1601:42: note: 'karg' declared here
    1601 |         struct mpt_ioctl_eventreport     karg;
         |                                          ^~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'mptctl_gettargetinfo' at drivers/message/fusion/mptctl.c:1375:6:
   include/linux/uaccess.h:112:17: warning: 'karg' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'mptctl_gettargetinfo':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/message/fusion/mptctl.c:1364:37: note: 'karg' declared here
    1364 |         struct mpt_ioctl_targetinfo karg;
         |                                     ^~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'mptctl_replace_fw' at drivers/message/fusion/mptctl.c:1650:6:
   include/linux/uaccess.h:112:17: warning: 'karg' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'mptctl_replace_fw':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/message/fusion/mptctl.c:1647:42: note: 'karg' declared here
    1647 |         struct mpt_ioctl_replace_fw      karg;
         |                                          ^~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'mptctl_hp_targetinfo' at drivers/message/fusion/mptctl.c:2570:6:
   include/linux/uaccess.h:112:17: warning: 'karg' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'mptctl_hp_targetinfo':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/message/fusion/mptctl.c:2563:33: note: 'karg' declared here
    2563 |         hp_target_info_t        karg;
         |                                 ^~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'mptctl_hp_hostinfo' at drivers/message/fusion/mptctl.c:2349:6:
   include/linux/uaccess.h:112:17: warning: 'karg' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'mptctl_hp_hostinfo':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/message/fusion/mptctl.c:2330:33: note: 'karg' declared here
    2330 |         hp_host_info_t          karg;
         |                                 ^~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'compat_mptfwxfer_ioctl.constprop.isra' at drivers/message/fusion/mptctl.c:2723:6:
>> include/linux/uaccess.h:112:17: warning: 'kfw32' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'compat_mptfwxfer_ioctl.constprop.isra':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/message/fusion/mptctl.c:2715:30: note: 'kfw32' declared here
    2715 |         struct mpt_fw_xfer32 kfw32;
         |                              ^~~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'compat_mpt_command.constprop.isra' at drivers/message/fusion/mptctl.c:2763:6:
   include/linux/uaccess.h:112:17: warning: 'karg32' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function 'compat_mpt_command.constprop.isra':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/message/fusion/mptctl.c:2755:36: note: 'karg32' declared here
    2755 |         struct mpt_ioctl_command32 karg32;
         |                                    ^~~~~~
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from '__mptctl_ioctl.isra' at drivers/message/fusion/mptctl.c:631:6:
   include/linux/uaccess.h:112:17: warning: 'khdr' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/kasan-checks.h: In function '__mptctl_ioctl.isra':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   drivers/message/fusion/mptctl.c:624:34: note: 'khdr' declared here
     624 |         mpt_ioctl_header         khdr;
         |                                  ^~~~


vim +/kfw32 +112 include/linux/uaccess.h

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
