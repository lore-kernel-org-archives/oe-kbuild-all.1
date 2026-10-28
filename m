Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.7
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793185128;
	b=Wp0Twab8dl7XYmKq5npq8YNNmjwu0fMa/I5gKrmgZCwTZd/JD1KaRSRmnz88YSr+g6ms
	 o+UsRyUYX+8eL2I/bqF8sjc2gVsqusQ5IWtOzDvapucPA+BaEvD4mBAZNjkx4TP5A0GCS
	 W0BbGxwYLml7FW7pw6F91m4RwZtcoJW6J9bbZbeAUPFvWDeXH5PasOJogm86nErSaEKeO
	 2ceeFuM8w8dUMJwE+OFWsCoiBvvTN9L7zr570MJm1ROn6HwrH5+UvYk+XEkdvUW+ojuI1
	 wWrUSpSAMrNX6n+t9vr9n84YMqJROAsKrPtCVPSdVqJZTyCSFO6ZAvBgfxZ0aS0cxiQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793185128;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kKep0XBx+FAtsm5AJu8thKG9gTELMOQlBDTZIMf6Kqs=;
	b=cbwjUSL9KWsyMrEPJqBp274VEt/GMX2EO4ZfillYcS2BPuHV6dbbRJdKsmUdZHMF8H/A
	 VVTKMZEF0J1efGyTkjSPbq4/O9sQUpDyyaqaAtpUeFeW6HgoEK+m8sdbxJX55o6yukU6e
	 KIdtJNhy5UTOKyQKL/FrNHYRj5VzGeWLmnrlJpejfMgJPNSbcvc1BEPpvzE8dpt08GDhu
	 dk/F3rWeag6lXXPXy4sGMW90Vl9znCPsaioTStVIXUWLVTKbSU/v3RCQWeW4MOxFIT2tV
	 ElX+dDIAcmrRuyWmm0lF453k3/dVGZyw4pnm0bCv/EMK/+9lbUI7KyzlVU9B3v32f2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VQZETMBW;
	arc=none smtp.remote-ip=192.198.163.7
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD75606A31A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 28 Oct 2026 10:58:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6DD75606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VQZETMBW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793185127; x=1824721127;
  h=date:from:to:cc:subject:message-id;
  bh=V7URG5B8ZwEd8Kqzr2OssaBAv3pXWzBSkSugjq+2DA0=;
  b=VQZETMBWZHlevxrGdhnurnMu2oXqJav5LggWN7DrJ44wJP0HpGiGvRUt
   PL3gjxjZKbpHwPIN1/XJa+Z3hLFLD4tVKWgEZaZ6WF3DQyl240V6LElaw
   uBFgsk2lSzYXVWRBcDtOAS3Ea6UbqIrYFeRSNXXH7IWMTtPdGyw686i6g
   xMygxhzlMmAbZLK8mjbZOD55gOsO0UEv1Tc9ljHItcrKNr+Lpt2aJPqfS
   +1GJN8mPvY3wi42EyVEFf0WecPWdQmZtvjRFlHy+YORbHFUz/7XdQXKWC
   7RCZbZfQCM7w5b5jkpRGzaPOyFVmukN0PXgNG5PnCNnFqgrYeaTWKg1aA
   Q==;
X-CSE-ConnectionGUID: EOk8gMMTTsitA6oUiWvzTg==
X-CSE-MsgGUID: 2+ImCKS9RiGOviBjFuHTnw==
X-IronPort-AV: E=McAfee;i="6800,10657,11948"; a="1787203"
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="1787203"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2026 03:58:47 -0700
X-CSE-ConnectionGUID: 3XfKJKmaScedUET0MdQAzA==
X-CSE-MsgGUID: SdoqUdpDScKtVniUu56J6g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,182,1787036400"; 
   d="scan'208";a="4775455"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 28 Oct 2026 03:58:46 -0700
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xM1Mh-000000004qN-1YbS;
	Wed, 28 Oct 2026 10:58:43 +0000
Date: Wed, 28 Oct 2026 11:58:12 +0100
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/large_folio 19/19]
 include/linux/poll.h:134:27: warning: division by zero is undefined
Message-ID: <202610281148.2HVXGdtr-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/large_folio
head:   5b72086892ee05798082621df69a27afeff2b233
commit: 6d9668b701d81625696253d7d736b79d7c704a13 [19/19] diff: fix patch 1
config: mips-randconfig-r2108-20261028 (https://download.01.org/0day-ci/archive/20261028/202610281148.2HVXGdtr-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261028/202610281148.2HVXGdtr-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610281148.2HVXGdtr-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/f2fs/super.c:34:
   fs/f2fs/f2fs.h:2303:3: error: call to undeclared function 'set_sbi_flag'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2303 |                 f2fs_bug_on(F2FS_F_SB(folio), 1);
         |                 ^
   fs/f2fs/f2fs.h:38:4: note: expanded from macro 'f2fs_bug_on'
      38 |                         set_sbi_flag(sbi, SBI_NEED_FSCK);               \
         |                         ^
   In file included from fs/f2fs/super.c:42:
   In file included from include/trace/events/f2fs.h:2713:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:7:
>> include/linux/poll.h:134:27: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                         ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:134:39: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                                     ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   2 warnings and 1 error generated.
--
   In file included from super.c:34:
   ./f2fs.h:2303:3: error: call to undeclared function 'set_sbi_flag'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
    2303 |                 f2fs_bug_on(F2FS_F_SB(folio), 1);
         |                 ^
   ./f2fs.h:38:4: note: expanded from macro 'f2fs_bug_on'
      38 |                         set_sbi_flag(sbi, SBI_NEED_FSCK);               \
         |                         ^
   In file included from super.c:42:
   In file included from include/trace/events/f2fs.h:2713:
   In file included from include/trace/define_trace.h:132:
   In file included from include/trace/trace_events.h:21:
   In file included from include/linux/trace_events.h:6:
   In file included from include/linux/ring_buffer.h:7:
>> include/linux/poll.h:134:27: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                         ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   include/linux/poll.h:134:39: warning: division by zero is undefined [-Wdivision-by-zero]
     134 |                 M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
         |                                                     ^~~~~~~~~
   include/linux/poll.h:132:32: note: expanded from macro 'M'
     132 | #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
         |                                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/poll.h:118:51: note: expanded from macro '__MAP'
     118 |         (from < to ? (v & from) * (to/from) : (v & from) / (from/to))
         |                                                          ^ ~~~~~~~~~
   2 warnings and 1 error generated.


vim +134 include/linux/poll.h

7a163b2195cda0 Al Viro 2018-02-01  129  
7a163b2195cda0 Al Viro 2018-02-01  130  static inline __poll_t demangle_poll(u16 val)
7a163b2195cda0 Al Viro 2018-02-01  131  {
7a163b2195cda0 Al Viro 2018-02-01  132  #define M(X) (__force __poll_t)__MAP(val, POLL##X, (__force __u16)EPOLL##X)
7a163b2195cda0 Al Viro 2018-02-01  133  	return M(IN) | M(OUT) | M(PRI) | M(ERR) | M(NVAL) |
7a163b2195cda0 Al Viro 2018-02-01 @134  		M(RDNORM) | M(RDBAND) | M(WRNORM) | M(WRBAND) |
7a163b2195cda0 Al Viro 2018-02-01  135  		M(HUP) | M(RDHUP) | M(MSG);
7a163b2195cda0 Al Viro 2018-02-01  136  #undef M
7a163b2195cda0 Al Viro 2018-02-01  137  }
7a163b2195cda0 Al Viro 2018-02-01  138  #undef __MAP
7a163b2195cda0 Al Viro 2018-02-01  139  
7a163b2195cda0 Al Viro 2018-02-01  140  

:::::: The code at line 134 was first introduced by commit
:::::: 7a163b2195cda0cddf47b5caf14a7229d4e2bea3 unify {de,}mangle_poll(), get rid of kernel-side POLL...

:::::: TO: Al Viro <viro@zeniv.linux.org.uk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
