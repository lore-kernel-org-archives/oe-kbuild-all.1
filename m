Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783982FE582
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 Dec 2025 14:03:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765029841; cv=none; b=hTMQaNgDsaZpbef8PY5AX+KK109yxgP4PPujDPbjMK2zBfQdY4vZGIBjOZvibRjTtEB50SifidTCPXRGt8Rwutl23vl3gq002fvorATpmGTB+DmfiVEPoEZBa6iyuz/U/jfHFA/2L4ftYiKUtvLXwdpVGf1+Fh96N3Rbs0W/4nU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765029841; c=relaxed/simple;
	bh=R9Ln+zUEUkfth8hp8Ge2ck3Lb0wr1w0+vuU8ijGtBqI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=kJq9OVljUYy6ZWlKxxXW7/vk7oh6ONFnDXvioFqeZLPQ3TcqAKKSi6gif22eq18X0/qdUmyi0+814mO0O4ZkQLy/0dP+4cmDUN2E53zSZymxMLZxD5QrwlMX/BI4Lhb4e8EV1AIzSVfAaZkuS+Xv/rWJeJOcmsYsf75FwN5NsmI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=PleTWS6P; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="PleTWS6P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765029839; x=1796565839;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=R9Ln+zUEUkfth8hp8Ge2ck3Lb0wr1w0+vuU8ijGtBqI=;
  b=PleTWS6PkIJG+IqwTSVOG9QxbejgooG5aS9jq20DSE/0mZ97AdFLW2+B
   NWT3LiOBt4bhvdkpe8uSgbIC/f9RebkDHbPa9LMFX9Km0rg4w4IfLJ6mN
   yfDkW+96mnFem74qmKbxbBaQDk+ukk3kFqJXZOAtLCwxT5ruDl5CR8oPA
   U+bJ4YIFFy6KGERNYKAvsmt7wAPB31YviLfKQyqnLmHfAXVzc7yi8IMV9
   Ewh0unnGKNb4C4bf7fS7Gejl0+nHEU7RfY0jSRgxlGZF2QqPQ3+5JZaJn
   g1YgpnVP4rvCpiJ2UJFdXQlwVw9QSz3Pnu9aJfqUf3EXN1vaJaDqDWK76
   Q==;
X-CSE-ConnectionGUID: RIosPlbtRluCQSaRPyEtPA==
X-CSE-MsgGUID: rI1qwDvkQCmTk6yRdJ0LoA==
X-IronPort-AV: E=McAfee;i="6800,10657,11634"; a="69639705"
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="69639705"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Dec 2025 06:03:59 -0800
X-CSE-ConnectionGUID: dlDu6VqBTJWNJTQEe4V0Zw==
X-CSE-MsgGUID: 8D0Xy3GcSeW9sZCeYlSNPQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,255,1758610800"; 
   d="scan'208";a="226189278"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 06 Dec 2025 06:03:57 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRst8-00000000IE7-392C;
	Sat, 06 Dec 2025 14:03:54 +0000
Date: Sat, 6 Dec 2025 22:02:55 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yu Kuai <yukuai3@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:openEuler-1.0-LTS 1939/1939]
 include/linux/thread_info.h:59:17: warning: 'b' may be used uninitialized
Message-ID: <202512062131.Gw3xo6cX-lkp@intel.com>
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
head:   5bd996476c86f9b6d2039f9ab662f38d64fa6c70
commit: b9f356e64a7eda411ba8b63df9d4c5e204f16025 [1939/1939] block-io-hierarchy: core hierarchy iodump implementation
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20251206/202512062131.Gw3xo6cX-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251206/202512062131.Gw3xo6cX-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512062131.Gw3xo6cX-lkp@intel.com/

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
