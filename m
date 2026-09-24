Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D0CC41E6C5
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Sep 2026 07:51:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790236306; cv=none; b=MT8e1wQjDkphajZ9Fk4PRdIv+9xnoJLVfF5yCIaJzzM0IrWY2OYNHbugeUX572C/w0BZpGlDfByir/N/vwDRmGs3dKtpQsPpFOWCnhg0nmUz83LlDwpZrTsiJzqVhjUlM2ZSEwaAaxBGa/OvNLLyy/ACk4EwbMdH/kMyeuItJuc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790236306; c=relaxed/simple;
	bh=RHmy0Can0xez2ljF2NxOHqoZ31lResgifk22BTLGvY8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=efJ4nHRPsUVwoJhMshOyN+sF9wrwCUV0VSuZxbjobbC+qOq7Yc/H3fstO0AEpNviEwZhZ5TyX1akgl0grOZt0oSenziM7vg4C08G42s6G/ClEfXW/HkA9M/nW+0A3qrKppOC7TzEpMoCo2KgTe3Tq5CaLvkugXJyuIiGUplcAfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=khKFcsyk; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="khKFcsyk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790236304; x=1821772304;
  h=date:from:to:cc:subject:message-id;
  bh=RHmy0Can0xez2ljF2NxOHqoZ31lResgifk22BTLGvY8=;
  b=khKFcsykr+ryv6/Q8ZqMGJ7lD9b+B45PKd6uBqzPvtZpceL5ReOu8hcg
   9mJY2d6lvBMRYFW44hw1x0TQQZJrkQ31qHnBBVxh0s33EjuUZ8ptEk2U7
   +A64LRMhpN9pinyA+Cc3ilDAGkM8PnKhyQi9xu5q3XiS9S32yzQRp6zh5
   xpNuL0I8c1dIk9ynpY4GXr/1grc7JXhfzyybB32SKXVHe3f7ygWO/UZxZ
   wQRX/DG3epkfXtvShmbjgtSUB9AI+uYkViAWN2yemx8ZGywytV4DKIwO0
   MoJVgOmOcOK5KlNNlzJtrKmiY4LLF4R2A3cs7opYtTQNpg4ZXrbXg4WFR
   g==;
X-CSE-ConnectionGUID: LCu+SHAyTbK4T7I7oogoEg==
X-CSE-MsgGUID: 6+WxGJYzQpKntBSuqx7U0w==
X-IronPort-AV: E=McAfee;i="6800,10657,11914"; a="91016577"
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="91016577"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Sep 2026 00:51:43 -0700
X-CSE-ConnectionGUID: 9yUfAK+vTb2XfiWzWqeNFg==
X-CSE-MsgGUID: xvEq+xDQRcuF/hvz1MZ7SA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,120,1787036400"; 
   d="scan'208";a="277111298"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 24 Sep 2026 00:51:42 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x9eF1-00000000INy-2EfZ;
	Thu, 24 Sep 2026 07:51:39 +0000
Date: Thu, 24 Sep 2026 15:51:13 +0800
From: kernel test robot <lkp@intel.com>
To: Bradley Morgan <brads@mainlining.org>
Cc: oe-kbuild-all@lists.linux.dev, linux-snps-arc@lists.infradead.org,
 "Paul E. McKenney" <paulmck@kernel.org>
Subject: [paulmckrcu:cmpxchg2.2026.09.22a 25/28]
 arch/arc/include/asm/cmpxchg.h:46:58: error: pointer type mismatch in
 conditional expression
Message-ID: <202609241517.SSV1Goz3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/paulmckrcu/linux cmpxchg2.2026.09.22a
head:   54c282c15475ebfae4712fe3ab637c9d19c723d6
commit: b6d4f6af38f85e7948fd64f9bf09cbb858b4dade [25/28] ARC: Emulate two-byte cmpxchg
config: arc-allyesconfig (https://download.01.org/0day-ci/archive/20260924/202609241517.SSV1Goz3-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260924/202609241517.SSV1Goz3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609241517.SSV1Goz3-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/arc/include/asm/atomic.h:13,
                    from include/linux/atomic.h:7,
                    from include/asm-generic/bitops/lock.h:5,
                    from arch/arc/include/asm/bitops.h:190,
                    from include/linux/bitops.h:67,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/arc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/fs_dirent.h:5,
                    from include/linux/fs/super_types.h:5,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from include/linux/fscrypt.h:16,
                    from fs/crypto/fscrypt_private.h:15,
                    from fs/crypto/hooks.c:10:
   fs/crypto/hooks.c: In function 'fscrypt_get_symlink':
>> arch/arc/include/asm/cmpxchg.h:46:58: error: pointer type mismatch in conditional expression [-Wincompatible-pointer-types]
      46 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
         |                                                          ^
   include/linux/atomic.h:68:9: note: in expansion of macro 'arch_cmpxchg_relaxed'
      68 |         op##_relaxed(args);                                             \
         |         ^~
   include/linux/atomic/atomic-arch-fallback.h:80:9: note: in expansion of macro '__atomic_op_release'
      80 |         __atomic_op_release(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
         |             ^~~~~~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:46:51: note: first expression has type 'char *'
      46 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
         |                                                   ^~~~~~
   include/linux/atomic.h:68:9: note: in expansion of macro 'arch_cmpxchg_relaxed'
      68 |         op##_relaxed(args);                                             \
         |         ^~
   include/linux/atomic/atomic-arch-fallback.h:80:9: note: in expansion of macro '__atomic_op_release'
      80 |         __atomic_op_release(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
         |             ^~~~~~~~~~~~~~~
   arch/arc/include/asm/cmpxchg.h:46:60: note: second expression has type 'unsigned char *'
      46 |         unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));              \
         |                                                            ^~~~~
   include/linux/atomic.h:68:9: note: in expansion of macro 'arch_cmpxchg_relaxed'
      68 |         op##_relaxed(args);                                             \
         |         ^~
   include/linux/atomic/atomic-arch-fallback.h:80:9: note: in expansion of macro '__atomic_op_release'
      80 |         __atomic_op_release(arch_cmpxchg, __VA_ARGS__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/atomic/atomic-instrumented.h:4803:9: note: in expansion of macro 'raw_cmpxchg_release'
    4803 |         raw_cmpxchg_release(__ai_ptr, __VA_ARGS__); \
         |         ^~~~~~~~~~~~~~~~~~~
   fs/crypto/hooks.c:420:13: note: in expansion of macro 'cmpxchg_release'
     420 |             cmpxchg_release(&inode->i_link, NULL, pstr.name) != NULL)
         |             ^~~~~~~~~~~~~~~


vim +46 arch/arc/include/asm/cmpxchg.h

    41	
    42	#define arch_cmpxchg_relaxed(ptr, old, new)				\
    43	({									\
    44		__typeof__(ptr) _p_ = (ptr);					\
    45		unsigned long _old_ = (unsigned long)(0 ? *(_p_) : (old));		\
  > 46		unsigned long _new_ = (unsigned long)(0 ? *(_p_) : (new));		\
    47		__typeof__(*(ptr)) _prev_;					\
    48										\
    49		switch (sizeof(*(_p_))) {						\
    50		case 1:								\
    51			_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u8((volatile u8 *__force)_p_, _old_, _new_);	\
    52			break;							\
    53		case 2:								\
    54			_prev_ = (__typeof__(*(ptr)))cmpxchg_emu_u16((volatile u16 *__force)_p_, _old_, _new_);	\
    55			break;							\
    56		case 4:								\
    57			_prev_ = (__typeof__(*(ptr)))__cmpxchg(_p_, _old_, _new_);			\
    58			break;							\
    59		default:							\
    60			BUILD_BUG();						\
    61		}								\
    62		_prev_;								\
    63	})
    64	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
