Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED07B30E0EE
	for <oe-kbuild-all@lists.linux.dev>; Mon,  5 Oct 2026 04:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791175202; cv=none; b=UofbG2XU4+7WUBBx+VMNBxmT59Ua/+N4g4w0UxWLUMegoVCa1SgAdCFNWFPp38iaAWjyI3FcMAkkK0wlIZ0hmh/ASY4qlx6VbqlC7hF73RIZT5Wo921JHpmTXFSajDdh62pqoMLmg1YiBX2aGV1BPoecGa+r6V1x2kQ0SKopCiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791175202; c=relaxed/simple;
	bh=ngDbJByXJ2FXDiq6tGdMmiveXshmpHKKHPkMZr8eYtA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Lx/ssBXFrvZzqFVkk8Ah/f+e2C94WrGn27Kcft0gUxJtcGG1ZD+TB6kbCWHSNUKaTTl+LGpYRYr+T/vN2yP5fNsQ4nEZNB4HnpiCE1xqJHKqYWLnHug5rhDuALlS2H9pmCA8EgL5abE0AnNwVCPjEfGUYUPOOctKDO42aK0/UuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WszI79XU; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WszI79XU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791175200; x=1822711200;
  h=date:from:to:cc:subject:message-id;
  bh=ngDbJByXJ2FXDiq6tGdMmiveXshmpHKKHPkMZr8eYtA=;
  b=WszI79XUC9OK1r19542pcP0OddH7bkqFuOf2FhEPQqE0G/FJJjQ0z3Rh
   JRWERWZwSWho0tKnpZZUMmrMy0Z4TOiaq8X7g7/i0DaPspr48NtCr+ham
   Tg42mnvscxG3ZZF8mNNpBm7kKYimFq3qX2617+QgwdUDFywHEDqp+Uxyc
   K7pSneRHiUP6PR7EavYSbn3pJvXCaQjksyD4bsSTmSYQsFogO7Oy5rtdE
   SPk27Za/VWlt/lU0RiLTQflyO6BurzGtfPPKVKtC2BTOamuBFGEg4Row+
   r7/x7JC8ZwGQwhfoYmo5CFDPT1WPFJ+cJltRu4DSMDYXFUGrVmzSbP7QF
   g==;
X-CSE-ConnectionGUID: jZrKBDTHS+WxF1JteVJn+g==
X-CSE-MsgGUID: xV4cHstmRPO2lC+YYzxNcg==
X-IronPort-AV: E=McAfee;i="6800,10657,11925"; a="90871089"
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="90871089"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Oct 2026 21:39:59 -0700
X-CSE-ConnectionGUID: Ozu4xD7fRpSbHfZoemeDvQ==
X-CSE-MsgGUID: SxUkms31QRaFUXKOyhKahA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,141,1787036400"; 
   d="scan'208";a="274514989"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Oct 2026 21:39:58 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xDaUW-00000000VLh-0KvL;
	Mon, 05 Oct 2026 04:39:56 +0000
Date: Mon, 05 Oct 2026 12:39:32 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android17-6.18-p3s 10/10]
 include/linux/p3s/mm.h:114:43: error: use of undeclared identifier 'PMD_SIZE'
Message-ID: <202610051258.HxrOq0VH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android17-6.18-p3s
head:   691ade648ef6da4e746c0857a492d9b9cc1a5780
commit: 04fec2a54c421adc87f0b57f4d1ade2397f8f4ec [10/10] ANDROID: P3S: mm: Add per-MM page shift field and query APIs
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20261005/202610051258.HxrOq0VH-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 5f609f950d2e80addf5566623013db68394334db)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261005/202610051258.HxrOq0VH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610051258.HxrOq0VH-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:7:
   In file included from include/linux/gfp.h:7:
   In file included from include/linux/mmzone.h:22:
   In file included from include/linux/mm_types.h:1872:
   In file included from include/linux/p3s.h:6:
>> include/linux/p3s/mm.h:114:43: error: use of undeclared identifier 'PMD_SIZE'
     114 |         return mm_is_p3s_4k(mm) ? PMD_SIZE_4KB : PMD_SIZE;
         |                                                  ^~~~~~~~
>> include/linux/p3s/mm.h:119:45: error: use of undeclared identifier 'PGDIR_SIZE'
     119 |         return mm_is_p3s_4k(mm) ? PGDIR_SIZE_4KB : PGDIR_SIZE;
         |                                                    ^~~~~~~~~~
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:38:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:11: warning: array index 3 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                         ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:38:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:98:25: warning: array index 2 is past the end of the array (that has type 'unsigned long[2]') [-Warray-bounds]
      98 |                 return (set->sig[3] | set->sig[2] |
         |                                       ^        ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:38:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:11: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:38:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:114:27: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     114 |                 return  (set1->sig[3] == set2->sig[3]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:38:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:5: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:38:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:115:21: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     115 |                         (set1->sig[2] == set2->sig[2]) &&
         |                                          ^         ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:38:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:8: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:38:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 2 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:138:24: note: expanded from macro '_SIG_SET_BINOP'
     138 |                 a3 = a->sig[3]; a2 = a->sig[2];                         \
         |                                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];
         |         ^
   In file included from arch/arm/kernel/asm-offsets.c:14:
   In file included from include/linux/mm.h:38:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:6:
   include/linux/signal.h:157:1: warning: array index 3 is past the end of the array (that has type 'const unsigned long[2]') [-Warray-bounds]
     157 | _SIG_SET_BINOP(sigorsets, _sig_or)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/signal.h:139:8: note: expanded from macro '_SIG_SET_BINOP'
     139 |                 b3 = b->sig[3]; b2 = b->sig[2];                         \
         |                      ^      ~
   arch/arm/include/asm/signal.h:17:2: note: array 'sig' declared here
      17 |         unsigned long sig[_NSIG_WORDS];


vim +/PMD_SIZE +114 include/linux/p3s/mm.h

   111	
   112	static inline unsigned long mm_pmd_size(const struct mm_struct *mm)
   113	{
 > 114		return mm_is_p3s_4k(mm) ? PMD_SIZE_4KB : PMD_SIZE;
   115	}
   116	
   117	static inline unsigned long mm_pgdir_size(const struct mm_struct *mm)
   118	{
 > 119		return mm_is_p3s_4k(mm) ? PGDIR_SIZE_4KB : PGDIR_SIZE;
   120	}
   121	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
