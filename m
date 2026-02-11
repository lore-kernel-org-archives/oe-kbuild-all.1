Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297B42F5461
	for <oe-kbuild-all@lists.linux.dev>; Wed, 11 Feb 2026 05:50:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770789027; cv=none; b=HS+28TIla5aKjnJpdaEMQlO7NUA5V9ZoFLu5LSgXc2yFTxvjKjiv3gjFEAXd4UFbAWwJiYatHw5Ct9l73LulWA7Kv0iM19inZ7zocNcx7x5KVtoIA+FBZpNGQNmvIq4HKLsLSx1fY8QDNwsXQB56pUqA+4K039cNAc3MhskvtJ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770789027; c=relaxed/simple;
	bh=r41+Hp166jUU0Plr87Usz208yiFjhftwuFhZL4tkmA4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=IYRZWV6LaQC9SCTAYAgbdwE2gwWxYpDIgrmCb2Q3mgaR2MstrYTh5k2yp6HlcAZlQPODgKUjUjAKSwdK4jK/A8eeKis7aOzFNXXVmhRhpk4x6LcQsxNWCgR5aq6548uRGf5R/S3QGwveygiALfS+nx5tdVEwq/9CkkqsjW1TDs8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=YHXd2OaB; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YHXd2OaB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770789025; x=1802325025;
  h=date:from:to:cc:subject:message-id;
  bh=r41+Hp166jUU0Plr87Usz208yiFjhftwuFhZL4tkmA4=;
  b=YHXd2OaBBpX7FPPUOPNS1AbBtbA6FTalsorWBJUl4X+F7jLydEy0DiVr
   5TuEZxK+XaANq+q0ow/DotEDTVIIwz6VM49CyA1KHpKjbrN9jZRRdwB6+
   bH3d3DToMqSruNYMpVryf5mPc551m7psUSnAsQpZ9hhREy9LVJ0HW/snx
   yg5v8TWXXexBVzxRP3WrR6nYEOD4PcBd//epw5UNezyr1tr7iRR20P9gl
   3MdeOie5yVoQHe4K0qTuEG828zKjJc4sF8mQe90nFaHa9z+MpdS59jx5X
   3Spix90g7AIHEDtrxZUZHjD7tcApsR8kFLL1m4pMtTi3SX9cQsUaXUrax
   w==;
X-CSE-ConnectionGUID: cR3J7EXwQtaF2I9ax/kJLA==
X-CSE-MsgGUID: X+qmbWanRTmai/wn810DRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11697"; a="97386005"
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="97386005"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Feb 2026 21:50:24 -0800
X-CSE-ConnectionGUID: UJgBd2x/TmGOCBIijKxjzA==
X-CSE-MsgGUID: +b/W1bPZRW6UghXuG/DxMA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,283,1763452800"; 
   d="scan'208";a="249778981"
Received: from igk-lkp-server01.igk.intel.com (HELO e5404a91d123) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 10 Feb 2026 21:50:23 -0800
Received: from kbuild by e5404a91d123 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vq37F-0000000011V-0DkZ;
	Wed, 11 Feb 2026 05:50:21 +0000
Date: Wed, 11 Feb 2026 06:50:03 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/2] htmldocs:
 ./include/linux/fs.h:998: warning: Excess struct member 'order' description
 in 'file_ra_state'
Message-ID: <202602110609.b761icz4-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   091c158be9d8e879df6ea76a6d91885c12ce322b
commit: 23aadcd1d9764a7dba1c6e3f6d63f89c2ebd435a [0/2] BACKPORT: mm/readahead: store folio order in struct file_ra_state
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260211/202602110609.b761icz4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602110609.b761icz4-lkp@intel.com/

All warnings (new ones prefixed by >>):

   ./include/linux/usb.h:1289: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(4' not described in 'usb_driver'
   ./include/linux/usb.h:1686: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(1' not described in 'urb'
   ./include/linux/usb.h:1686: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(2' not described in 'urb'
   ./include/linux/usb.h:1686: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(3' not described in 'urb'
   ./include/linux/usb.h:1686: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(4' not described in 'urb'
>> ./include/linux/fs.h:998: warning: Excess struct member 'order' description in 'file_ra_state'
   ./include/linux/fs.h:1086: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(1' not described in 'file'
   ./include/linux/fs.h:1086: warning: Function parameter or struct member 'ANDROID_KABI_RESERVE(2' not described in 'file'
   ./fs/eventpoll.c:2068: warning: Function parameter or struct member 'ep' not described in 'ep_get_upwards_depth_proc'
   ./fs/eventpoll.c:2068: warning: Function parameter or struct member 'depth' not described in 'ep_get_upwards_depth_proc'
   ./include/drm/drm_drv.h:372: warning: Incorrect use of kernel-doc format:          * @fbdev_probe


vim +998 ./include/linux/fs.h

^1da177e4c3f41 Linus Torvalds          2005-04-16  975  
c790fbf20a53e8 Matthew Wilcox (Oracle  2021-04-07  976) /**
c790fbf20a53e8 Matthew Wilcox (Oracle  2021-04-07  977)  * struct file_ra_state - Track a file's readahead state.
c790fbf20a53e8 Matthew Wilcox (Oracle  2021-04-07  978)  * @start: Where the most recent readahead started.
c790fbf20a53e8 Matthew Wilcox (Oracle  2021-04-07  979)  * @size: Number of pages read in the most recent readahead.
84dacdbd5352bf NeilBrown               2022-03-22  980   * @async_size: Numer of pages that were/are not needed immediately
84dacdbd5352bf NeilBrown               2022-03-22  981   *      and so were/are genuinely "ahead".  Start next readahead when
84dacdbd5352bf NeilBrown               2022-03-22  982   *      the first of these pages is accessed.
84dacdbd5352bf NeilBrown               2022-03-22  983   * @ra_pages: Maximum size of a readahead request, copied from the bdi.
23aadcd1d9764a Ryan Roberts            2025-06-09  984   * @order: Preferred folio order used for most recent readahead.
c790fbf20a53e8 Matthew Wilcox (Oracle  2021-04-07  985)  * @mmap_miss: How many mmap accesses missed in the page cache.
c790fbf20a53e8 Matthew Wilcox (Oracle  2021-04-07  986)  * @prev_pos: The last byte in the most recent read request.
84dacdbd5352bf NeilBrown               2022-03-22  987   *
84dacdbd5352bf NeilBrown               2022-03-22  988   * When this structure is passed to ->readahead(), the "most recent"
84dacdbd5352bf NeilBrown               2022-03-22  989   * readahead means the current readahead.
^1da177e4c3f41 Linus Torvalds          2005-04-16  990   */
^1da177e4c3f41 Linus Torvalds          2005-04-16  991  struct file_ra_state {
c790fbf20a53e8 Matthew Wilcox (Oracle  2021-04-07  992) 	pgoff_t start;
c790fbf20a53e8 Matthew Wilcox (Oracle  2021-04-07  993) 	unsigned int size;
c790fbf20a53e8 Matthew Wilcox (Oracle  2021-04-07  994) 	unsigned int async_size;
c790fbf20a53e8 Matthew Wilcox (Oracle  2021-04-07  995) 	unsigned int ra_pages;
c790fbf20a53e8 Matthew Wilcox (Oracle  2021-04-07  996) 	unsigned int mmap_miss;
c790fbf20a53e8 Matthew Wilcox (Oracle  2021-04-07  997) 	loff_t prev_pos;
^1da177e4c3f41 Linus Torvalds          2005-04-16 @998  };
^1da177e4c3f41 Linus Torvalds          2005-04-16  999  

:::::: The code at line 998 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
