Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54A2E3EA7B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 06:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726469040; cv=none; b=FgL9su/+2FUdlzQfAMo6LQpEGmpqzGqdQZ/ASDSw7aB2GWfk2iR0G25anbkPp9jWfYkkLynGr/+Rbx3sJNO0EzTf/r9mguaT3jYRDdSrHw5HlqnEBkz+XZIgT5bzZlzrg8YbXf8cZrLgeI348Tv+hRXZA4ebUkBHLoHB+2AoBrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726469040; c=relaxed/simple;
	bh=ORgJGG+Gi8sKbOo+KxdrYP/+kOrfupayt8zsYvDU6c0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=qK9lcLnIjyIRJL2rzY0TGkq8p5jweJKDHLUV5XgxV5eHtydm2V4s6SoS15ZhDrGXCgwBunPFrDTuJ36Ot94EdbLBDRgvMeAAdZH40Wy7E/sZ+0QJdEa0TNKKFrlXbC1qdFC/2F8Gx04/rVqI6BsaKWrCZEoLRSbs24MBUJD7YTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nut1BwZV; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nut1BwZV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726469038; x=1758005038;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ORgJGG+Gi8sKbOo+KxdrYP/+kOrfupayt8zsYvDU6c0=;
  b=nut1BwZVw/AgP/pADuZzFmTXsjtMO2+a7HeLXR/46nFSJ2xWHThMMMEz
   gV2We8vpfzNXlQyDhQ4GY683xgkCU4z12GREZ0FZQfLkeRIAhNMNmA3f3
   PsXGUMdT246sctwds5GMB8QXSk5rWXtb8ULJLLY7wxvNd5qyOnK2AePIJ
   016p7ZLDDYSWscqKieIbETJUqhNYyxHQsFWgGjd+gQc01rM9ohitYkMGW
   pKTxYf1OP9ww+ppP4hjfGXQkwtk0wS0qGwE/eipMTh0XefVQgjGNlU2B8
   5QHyyJ6ZTZtUtXr/dWbYOPitCJZxyjNgx0abg1t+wVz+soAUsGvFviv02
   Q==;
X-CSE-ConnectionGUID: 1mSR/KIgT4ehNm1xtyo/UQ==
X-CSE-MsgGUID: AwZ5cOskS1a8WALDKGizyg==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="35963758"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="35963758"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 23:43:56 -0700
X-CSE-ConnectionGUID: SiBgRdo6R6CeQBON5gLmfw==
X-CSE-MsgGUID: NRFmzAb8Sx6X7icjFXQJYQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="72876043"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 15 Sep 2024 23:43:55 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq5Sj-0009T0-0x;
	Mon, 16 Sep 2024 06:43:53 +0000
Date: Mon, 16 Sep 2024 14:43:35 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Cheng Jian <cj.chengjian@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 15686/23714]
 include/linux/uaccess.h:112:17: warning: 'p' may be used uninitialized
Message-ID: <202409161422.WtkE4KWn-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git openEuler-1.0-LTS
head:   37aeb7e817053fbf532b214aa02858b3c23af0b1
commit: a2491968ab51323208d2d1a4d4b28325886d41b8 [15686/23714] Add io_uring IO interface
config: arm64-randconfig-001-20240913 (https://download.01.org/0day-ci/archive/20240916/202409161422.WtkE4KWn-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409161422.WtkE4KWn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161422.WtkE4KWn-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   In file included from include/linux/poll.h:12,
                    from include/linux/ring_buffer.h:7,
                    from include/linux/trace_events.h:6,
                    from include/trace/syscall.h:7,
                    from include/linux/syscalls.h:86,
                    from fs/io_uring.c:31:
   In function '_copy_from_user',
       inlined from 'copy_from_user' at include/linux/uaccess.h:144:7,
       inlined from 'io_uring_setup' at fs/io_uring.c:1224:6:
>> include/linux/uaccess.h:112:17: warning: 'p' may be used uninitialized [-Wmaybe-uninitialized]
     112 |                 kasan_check_write(to, n);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/compiler.h:251,
                    from include/linux/export.h:45,
                    from include/linux/linkage.h:7,
                    from include/linux/kernel.h:7,
                    from fs/io_uring.c:28:
   include/linux/kasan-checks.h: In function 'io_uring_setup':
   include/linux/kasan-checks.h:7:6: note: by argument 1 of type 'const volatile void *' to 'kasan_check_write' declared here
       7 | void kasan_check_write(const volatile void *p, unsigned int size);
         |      ^~~~~~~~~~~~~~~~~
   fs/io_uring.c:1220:32: note: 'p' declared here
    1220 |         struct io_uring_params p;
         |                                ^


vim +/p +112 include/linux/uaccess.h

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
