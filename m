Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8125C39855
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Jun 2024 16:44:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718124288; cv=none; b=h0BJyF2zY9/CpShvQPDccSNjlaTCHpN1nijk5z4G/J5XsNrHOfO9wnUyumZw4qUkzngl0VfiLwHNeWw3rSiz2M3+PO0EytXsWDSup1171I53KeqwtKy+DM/U8UIEjSbQM8+V5CzI5fqbz2oAGkm1fTdydEyZODEmgeZpkKpx8cg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718124288; c=relaxed/simple;
	bh=tRKwfUDzjFhmT39xKk148R60vT0AyevJEwTcrKjmP2g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=mUGMzvffhXldG+Xad31qLPIa+kE2apCvfrSrU02vFDMLKw+O+NL+gwGtVb6jSv0WvNouQV6iPiJnWNeaMNfzjh7+fMc534qHlv4cCzOeN231ENP1dknKxrWwtlvRXZcqaJPfXn9PhyeVP2m5EoiG0/LyPlmO62YM44l0iWiS354=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X3UgrDj8; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X3UgrDj8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718124287; x=1749660287;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tRKwfUDzjFhmT39xKk148R60vT0AyevJEwTcrKjmP2g=;
  b=X3UgrDj8LnDKsHfGGq46LroP3mbPnsEVL579XmIQwCiix0Hnpx+395/I
   hi7ANp3H5idFWHtAcE+mMZm/vz861UM6DVwpBj7Lo8/mLx46zrVaJzptx
   CMtkOm18CziWz3V1GiT5BpUzeJjHGTLiDfFbtMIwmki6jpB9MyFGt2+w6
   HyZ2Cm7XflVPuTOpJtGeKaCYQ/WdszMGi0PgdqEpmciJ2iMsO8aKqBILz
   qliDV35k7FnVOY2yIpOCqKGloJPj02kKE758u/06ggal6AZ43E/qJRZ1e
   7vNkhpz76nsfzK2yV6Wfn+qakDychxceZ8j9cVaMfBOw/fa2TR4sxaDiW
   Q==;
X-CSE-ConnectionGUID: LUgqXY/fTZa+ZYFpqVPs/g==
X-CSE-MsgGUID: lNS8XkJCRfCdOIPB28kiuQ==
X-IronPort-AV: E=McAfee;i="6600,9927,11100"; a="40248894"
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="40248894"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2024 09:43:49 -0700
X-CSE-ConnectionGUID: zqBp2F/CTYSUcgIBA1BtpQ==
X-CSE-MsgGUID: PmrJNFD/QNiV4jBW4Ywg4g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,230,1712646000"; 
   d="scan'208";a="44389302"
Received: from lkp-server01.sh.intel.com (HELO 628d7d8b9fc6) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Jun 2024 09:43:47 -0700
Received: from kbuild by 628d7d8b9fc6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sH4b3-0000fe-1o;
	Tue, 11 Jun 2024 16:43:45 +0000
Date: Wed, 12 Jun 2024 00:43:15 +0800
From: kernel test robot <lkp@intel.com>
To: Kees Cook <kees@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Vitor Massaru Iha <vitor@massaru.org>
Subject: [kees:dev/v6.10-rc2/kunit/usercopy 3/3] lib/usercopy_kunit.c:221:30:
 sparse: sparse: cast removes address space '__user' of expression
Message-ID: <202406120000.b7XyvVgm-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git dev/v6.10-rc2/kunit/usercopy
head:   29124c6aaedca2903feb3a7d403824c8fe25aed7
commit: 29124c6aaedca2903feb3a7d403824c8fe25aed7 [3/3] usercopy: Convert test_user_copy to KUnit test
config: x86_64-randconfig-121-20240611 (https://download.01.org/0day-ci/archive/20240612/202406120000.b7XyvVgm-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240612/202406120000.b7XyvVgm-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406120000.b7XyvVgm-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> lib/usercopy_kunit.c:221:30: sparse: sparse: cast removes address space '__user' of expression
   lib/usercopy_kunit.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/mm.h, include/linux/mman.h):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   lib/usercopy_kunit.c: note: in included file (through include/linux/sched/task.h, include/linux/sched/signal.h, include/linux/rcuwait.h, ...):
   include/linux/uaccess.h:351:23: sparse: sparse: self-comparison always evaluates to false
   include/linux/uaccess.h:352:23: sparse: sparse: self-comparison always evaluates to false
   include/linux/uaccess.h:359:21: sparse: sparse: self-comparison always evaluates to false
   include/linux/uaccess.h:361:28: sparse: sparse: self-comparison always evaluates to false

vim +/__user +221 lib/usercopy_kunit.c

   213	
   214	/*
   215	 * Invalid usage: none of these copies should succeed.
   216	 */
   217	static void usercopy_test_invalid(struct kunit *test)
   218	{
   219		struct usercopy_test_priv *priv = test->priv;
   220		char __user *usermem = priv->umem;
 > 221		char *bad_usermem = (char *)usermem;
   222		char *kmem = priv->kmem;
   223		u64 *kmem_u64 = (u64 *)kmem;
   224	
   225		/* Prepare kernel memory with check values. */
   226		memset(kmem, 0x5a, PAGE_SIZE);
   227		memset(kmem + PAGE_SIZE, 0, PAGE_SIZE);
   228	
   229		/* Reject kernel-to-kernel copies through copy_from_user(). */
   230		KUNIT_EXPECT_NE_MSG(test, copy_from_user(kmem, (char __user *)(kmem + PAGE_SIZE),
   231							 PAGE_SIZE), 0,
   232			    "illegal all-kernel copy_from_user passed");
   233	
   234		/* Destination half of buffer should have been zeroed. */
   235		KUNIT_EXPECT_EQ_MSG(test, memcmp(kmem + PAGE_SIZE, kmem, PAGE_SIZE), 0,
   236			    "zeroing failure for illegal all-kernel copy_from_user");
   237	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
