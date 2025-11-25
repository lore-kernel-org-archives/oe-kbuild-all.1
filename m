Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E34B1624D5
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Nov 2025 00:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764029094; cv=none; b=KuQ3HWk2rNKOcJ6xy8J19+jx7MFDejau6tEb9PWrDxsqlPmFuvGk7z6Y3K+0OOGo7eQjAsvsW9HaTTVaw4WgzW/6zYro4InfVHe3ErrwzloE70RhTaFpQrVFJHqYG7Xh96M1kHLIzWBEGPpoSlwrOxM+qmFvn2fDeKUsPYwX2jw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764029094; c=relaxed/simple;
	bh=rnHCyEkTw9pNfJ3Ebw3xHTGuD1pmrPH9C+8uMzxazkg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=m20QVSYHT6aTfSlxzDrziQvmjIbZ+vSUcrtbW+FU5pKXrjxf4hS3brnb9pcc4gy/usrPy6j30mGN6wYNeyoavTtR9gSRyF/YYONjk81aSQa05vRODu28yZDVTR98I5ug505lyD3wW0V7/pauPbLJH6sY6CzuUuUqfdk2jSeMsJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QEmn54tR; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QEmn54tR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764029093; x=1795565093;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rnHCyEkTw9pNfJ3Ebw3xHTGuD1pmrPH9C+8uMzxazkg=;
  b=QEmn54tRA7zgduRnKLoPohQgv6hH9z1AwGdX4YYWPkz6+xtpTtyYe156
   R+QN5dGk9EgORmLkRqdedF+C8C2z78IEcX1JeFSS9HDgEPnqN1ZiUnCFZ
   f+niGWyF1bQbjboRrkjp1cyyUA3M1Em/Zb8LZxcguyCUg7sLS2yHM56rh
   0xdj4XfaEE4C8Um5tUOMiJ/8Z0Y9wVwahVWWU6bT83g+mix53SGX1H7Vw
   dejKVNV6MRwWgokqgVq2vrGK0VMm7b/i1l6kg6zNodSyFqOV32DrsBLaV
   3DbeVtpEjPi9THFvgw2MHf4OCyEQdx4n5hb7/9AyTBK6tmU+g4Y8LJaS2
   Q==;
X-CSE-ConnectionGUID: MINAlKwRSGG9I7Xe0/TZTg==
X-CSE-MsgGUID: /xWnSxRyTAWUXukDq4JMFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11623"; a="53610256"
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="53610256"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Nov 2025 16:04:52 -0800
X-CSE-ConnectionGUID: ASyT23LZTwmqOfFw/i62mA==
X-CSE-MsgGUID: cH3UHDevTu+rX4bPPuWuGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,224,1758610800"; 
   d="scan'208";a="192932027"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 24 Nov 2025 16:04:51 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vNgY0-000000001E5-3MVV;
	Tue, 25 Nov 2025 00:04:44 +0000
Date: Tue, 25 Nov 2025 08:04:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android11-kiwi-5.4 456/456]
 include/linux/kernel.h:843:29: warning: comparison of distinct pointer types
 lacks a cast
Message-ID: <202511250758.DaN1sdMJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android11-kiwi-5.4
head:   f0f1719f2a6186edc2c4c8781e747872ef6e9794
commit: cbffccccc8cacca37a7b5cef2b9fc7769c99763a [456/456] dm-integrity: limit MAX_TAG_SIZE to 255
config: arm-randconfig-004-20251125 (https://download.01.org/0day-ci/archive/20251125/202511250758.DaN1sdMJ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251125/202511250758.DaN1sdMJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511250758.DaN1sdMJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/list.h:9:0,
                    from include/linux/wait.h:7,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:6,
                    from include/linux/highmem.h:5,
                    from include/linux/bio.h:8,
                    from drivers/md/dm-bio-record.h:10,
                    from drivers/md/dm-integrity.c:9:
   drivers/md/dm-integrity.c: In function 'integrity_metadata':
>> include/linux/kernel.h:843:29: warning: comparison of distinct pointer types lacks a cast
      (!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
                                ^
   include/linux/kernel.h:857:4: note: in expansion of macro '__typecheck'
      (__typecheck(x, y) && __no_side_effects(x, y))
       ^~~~~~~~~~~
   include/linux/kernel.h:867:24: note: in expansion of macro '__safe_cmp'
     __builtin_choose_expr(__safe_cmp(x, y), \
                           ^~~~~~~~~~
   include/linux/kernel.h:883:19: note: in expansion of macro '__careful_cmp'
    #define max(x, y) __careful_cmp(x, y, >)
                      ^~~~~~~~~~~~~
   drivers/md/dm-integrity.c:1566:26: note: in expansion of macro 'max'
      char checksums_onstack[max((size_t)HASH_MAX_DIGESTSIZE, MAX_TAG_SIZE)];
                             ^~~
   drivers/md/dm-integrity.c: In function 'dm_integrity_ctr':
   drivers/md/dm-integrity.c:3758:22: warning: comparison is always false due to limited range of data type [-Wtype-limits]
       if ((uint64_t)val >= (uint64_t)UINT_MAX * 1000 / HZ) {
                         ^~


vim +843 include/linux/kernel.h

526211bc58c4b3 Ingo Molnar    2009-03-05  829  
^1da177e4c3f41 Linus Torvalds 2005-04-16  830  /*
3c8ba0d61d04ce Kees Cook      2018-03-30  831   * min()/max()/clamp() macros must accomplish three things:
3c8ba0d61d04ce Kees Cook      2018-03-30  832   *
3c8ba0d61d04ce Kees Cook      2018-03-30  833   * - avoid multiple evaluations of the arguments (so side-effects like
3c8ba0d61d04ce Kees Cook      2018-03-30  834   *   "x++" happen only once) when non-constant.
3c8ba0d61d04ce Kees Cook      2018-03-30  835   * - perform strict type-checking (to generate warnings instead of
3c8ba0d61d04ce Kees Cook      2018-03-30  836   *   nasty runtime surprises). See the "unnecessary" pointer comparison
3c8ba0d61d04ce Kees Cook      2018-03-30  837   *   in __typecheck().
3c8ba0d61d04ce Kees Cook      2018-03-30  838   * - retain result as a constant expressions when called with only
3c8ba0d61d04ce Kees Cook      2018-03-30  839   *   constant expressions (to avoid tripping VLA warnings in stack
3c8ba0d61d04ce Kees Cook      2018-03-30  840   *   allocation usage).
3c8ba0d61d04ce Kees Cook      2018-03-30  841   */
3c8ba0d61d04ce Kees Cook      2018-03-30  842  #define __typecheck(x, y) \
3c8ba0d61d04ce Kees Cook      2018-03-30 @843  		(!!(sizeof((typeof(x) *)1 == (typeof(y) *)1)))
3c8ba0d61d04ce Kees Cook      2018-03-30  844  

:::::: The code at line 843 was first introduced by commit
:::::: 3c8ba0d61d04ced9f8d9ff93977995a9e4e96e91 kernel.h: Retain constant expression output for max()/min()

:::::: TO: Kees Cook <keescook@chromium.org>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
