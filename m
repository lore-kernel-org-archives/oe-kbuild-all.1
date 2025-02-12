Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D364E2066DB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Feb 2025 13:26:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739366819; cv=none; b=pjDGk0KY5uEoM5Dy4VRvmnmW9drt1iv5M47HMaCyUklZU6sj9svD0UWBeBKprPPr2wnBC4+YBcbYvHOeM7Z1Whnaf9JO+jWpzf5K/dsTOXV3WBDvmn/1NnktD00Gu7NM2ekJocXyjDokJlfF1L9DkoPCtW9Ob0palMW7rF5mjeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739366819; c=relaxed/simple;
	bh=k3x4+ek1hYQxp08Y+qOt/CfpPbsdE/SW3vxh28yy424=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N7Mx5PUc9QQ02WsVb+CGRvWuUdb8fMiwP43Edh7S79Jk+5aLzrfrBQKyd5/2EVewsiY/qSLnS1+WLR3o3OwcAf4XISqmR8zL0G5w/Q7Gs1m/8ldIoJMqmKaVL7WtqqBMqreeKWEa9ZzMPUSWcKkCpLFyfS3Lrwmgc+Uw8tnRgYY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KVp+A+Wc; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KVp+A+Wc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1739366817; x=1770902817;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k3x4+ek1hYQxp08Y+qOt/CfpPbsdE/SW3vxh28yy424=;
  b=KVp+A+WcZvtgj9yiGazd3q63sZrC2TkbbD2qb3yls8Edj/ZzRGApT+jT
   d9781w5+y0FPron3Yh9XYq9+UL0+lmyWjiiM6ExywQd4iBYXFv3x6yeQu
   SMK0FuOGP3oXoLjflegouFwd2SgLIqiKYmaxG3PZGVEUCKYPZhmVgD9PA
   iDlW7xifqZOfR4gaIwQ6UPzZYhYqjN4f2CmQxwbH2nU6b3sVDCuLIpnFP
   jx/NYgcd36ykObWCtPMMGjYh4+lFXjb+IFGaOhGKrUeOKmdzdR6jsvcNw
   LO60sfxAhapiUya9d/9L1PHbb0O9fWdsp1x4GN9vQoFyEjYo1EJmfRTYa
   g==;
X-CSE-ConnectionGUID: ETxcwHs5RzuARuem0isHwg==
X-CSE-MsgGUID: j32LrxIPRzuoHnnTzDXgzg==
X-IronPort-AV: E=McAfee;i="6700,10204,11342"; a="27617270"
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="27617270"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Feb 2025 05:26:56 -0800
X-CSE-ConnectionGUID: nmVTDgLEScO08UkyFWddww==
X-CSE-MsgGUID: V6uZFiivSyqFxkcTxC5WbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,280,1732608000"; 
   d="scan'208";a="113327525"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 12 Feb 2025 05:26:54 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tiClQ-0015eF-1C;
	Wed, 12 Feb 2025 13:26:52 +0000
Date: Wed, 12 Feb 2025 21:26:27 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, David Gow <davidgow@google.com>,
	Rae Moar <rmoar@google.com>
Subject: [linux-next:master 2466/3226] lib/tests/usercopy_kunit.c:221:30:
 sparse: sparse: cast removes address space '__user' of expression
Message-ID: <202502122136.Sjpqw7DS-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   c674aa7c289e51659e40dda0f954886ef7f80042
commit: db6fe4d61ece24193eb4d94a82d967501d53358c [2466/3226] lib: Move KUnit tests into tests/ subdirectory
config: s390-randconfig-r123-20250212 (https://download.01.org/0day-ci/archive/20250212/202502122136.Sjpqw7DS-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce: (https://download.01.org/0day-ci/archive/20250212/202502122136.Sjpqw7DS-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502122136.Sjpqw7DS-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/tests/usercopy_kunit.c:221:30: sparse: sparse: cast removes address space '__user' of expression
   lib/tests/usercopy_kunit.c: note: in included file (through include/linux/sched/task.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/uaccess.h:385:23: sparse: sparse: self-comparison always evaluates to false
   include/linux/uaccess.h:386:23: sparse: sparse: self-comparison always evaluates to false
   include/linux/uaccess.h:393:21: sparse: sparse: self-comparison always evaluates to false
   include/linux/uaccess.h:395:28: sparse: sparse: self-comparison always evaluates to false
--
>> lib/tests/overflow_kunit.c:31:36: sparse: sparse: undefined preprocessor identifier '__clang_major__'
   lib/tests/overflow_kunit.c:41:36: sparse: sparse: undefined preprocessor identifier '__clang_major__'
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:359:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:360:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:361:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:362:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:363:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:364:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:365:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:365:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:365:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:366:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:366:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:366:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:373:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true
   lib/tests/overflow_kunit.c:379:1: sparse: sparse: self-comparison always evaluates to true

vim +/__user +221 lib/tests/usercopy_kunit.c

cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  213  
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  214  /*
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  215   * Invalid usage: none of these copies should succeed.
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  216   */
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  217  static void usercopy_test_invalid(struct kunit *test)
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  218  {
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  219  	struct usercopy_test_priv *priv = test->priv;
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  220  	char __user *usermem = priv->umem;
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12 @221  	char *bad_usermem = (char *)usermem;
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  222  	char *kmem = priv->kmem;
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  223  	u64 *kmem_u64 = (u64 *)kmem;
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  224  
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  225  	if (IS_ENABLED(CONFIG_ALTERNATE_USER_ADDRESS_SPACE) ||
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  226  	    !IS_ENABLED(CONFIG_MMU)) {
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  227  		kunit_skip(test, "Testing for kernel/userspace address confusion is only sensible on architectures with a shared address space");
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  228  		return;
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  229  	}
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  230  
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  231  	/* Prepare kernel memory with check values. */
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  232  	memset(kmem, 0x5a, PAGE_SIZE);
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  233  	memset(kmem + PAGE_SIZE, 0, PAGE_SIZE);
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  234  
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  235  	/* Reject kernel-to-kernel copies through copy_from_user(). */
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  236  	KUNIT_EXPECT_NE_MSG(test, copy_from_user(kmem, (char __user *)(kmem + PAGE_SIZE),
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  237  						 PAGE_SIZE), 0,
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  238  		    "illegal all-kernel copy_from_user passed");
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  239  
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  240  	/* Destination half of buffer should have been zeroed. */
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  241  	KUNIT_EXPECT_MEMEQ_MSG(test, kmem + PAGE_SIZE, kmem, PAGE_SIZE,
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  242  		    "zeroing failure for illegal all-kernel copy_from_user");
cf6219ee889fb3 lib/usercopy_kunit.c Kees Cook 2024-06-12  243  

:::::: The code at line 221 was first introduced by commit
:::::: cf6219ee889fb304cf8192c707ad280d93baafc7 usercopy: Convert test_user_copy to KUnit test

:::::: TO: Kees Cook <kees@kernel.org>
:::::: CC: Shuah Khan <skhan@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
