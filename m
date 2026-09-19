Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3D2872630
	for <oe-kbuild-all@lists.linux.dev>; Sat, 19 Sep 2026 12:01:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789819265; cv=none; b=hLists+Fprw2rCOiAZLymBItxfLSIsUQzEEXoaxeZF0jbfBcvaRrldrPktHzbvz8TrvaTL9IkS7Noav6n8409EqOjgHljUbB/r6AGXvzKBxjj+jtHGm5xjDGyimvOThnapjEfhf/6sjiKQUMrCDMCG9vtDXg3U5RvijmH4BGILY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789819265; c=relaxed/simple;
	bh=7KsIVRmuOCOMvGrZK4kUc+z8S5byuFAJPpAbRoheoNM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=F1n9JgeRsYO9tq9apNUleSyLqe+u4iYaJgDzgj5ofI3Bd5TlBWQe1g4XfCPj+FY/Ih3t5WaDL2vsCoxrfDt2T8rKecc9Cql1YOER7XqxmRw/H5QToSRIU0/55FLtoka5/kc5XHfptsHM9pcsFSI15ueS/u/ThHx6L7jrsKF7rbQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Pguktk/z; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Pguktk/z"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1789819263; x=1821355263;
  h=date:from:to:cc:subject:message-id;
  bh=7KsIVRmuOCOMvGrZK4kUc+z8S5byuFAJPpAbRoheoNM=;
  b=Pguktk/zkQZlswOQklFSsWhhv+UiV9DS/CYrAw86HlyPe8n0k9mg42nr
   p2E/EcGRKpWojdy+bgxyLpl1mCTtuUAt4LXMY479qpIKmkcnQSOFjTg40
   cdjcSDI9sfWTtOXwhVFb7L+di2pmNzOh4xATR4QqgfHU1s+lk3T9eoxo0
   ADqJ39YpQVIT/FexRjfsKeqcI4uUgLh+AptuRdNC9FmH5szb8v/OQV8tz
   iNczA8QSzcjvRF5JwG7I+UmeZB3NKGE+t7MNoJfvxIeK5bS48iw9ap36G
   zQP4K9gcQe08pjgKOK7uYBaY290YWYteeYqYh0KgvdHnkDAxaT44a6tVv
   A==;
X-CSE-ConnectionGUID: HPWO7hDsRTqWfmhbyCAm2A==
X-CSE-MsgGUID: LmIm0SkhTs2cjY4RlMGj6w==
X-IronPort-AV: E=McAfee;i="6800,10657,11909"; a="100946052"
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="100946052"
Received: from fmviesa011.fm.intel.com ([10.60.135.151])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Sep 2026 05:01:02 -0700
X-CSE-ConnectionGUID: frhVUQQMSUG//myewIM8fQ==
X-CSE-MsgGUID: 88/+eST7S26NFZMq7iydXg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,111,1787036400"; 
   d="scan'208";a="3014299"
Received: from igk-lkp-server01.igk.intel.com (HELO fe5626a770c0) ([10.211.93.152])
  by fmviesa011.fm.intel.com with ESMTP; 19 Sep 2026 05:01:01 -0700
Received: from kbuild by fe5626a770c0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x7tkY-000000001Rc-2lfS;
	Sat, 19 Sep 2026 12:00:58 +0000
Date: Sat, 19 Sep 2026 13:59:59 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 0/3] htmldocs:
 ./include/linux/fs.h:998: warning: Excess struct member 'order' description
 in 'file_ra_state'
Message-ID: <202609191357.GzQ8KJDD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Ryan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   dde7e9bf027fc9d9ab63127d8b9235b2203f725b
commit: 23aadcd1d9764a7dba1c6e3f6d63f89c2ebd435a [0/3] BACKPORT: mm/readahead: store folio order in struct file_ra_state
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
docutils: docutils (Docutils 0.21.2, Python 3.13.5, on linux)
reproduce: (https://download.01.org/0day-ci/archive/20260919/202609191357.GzQ8KJDD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609191357.GzQ8KJDD-lkp@intel.com/

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

^1da177e4c3f415 Linus Torvalds          2005-04-16  975  
c790fbf20a53e82 Matthew Wilcox (Oracle  2021-04-07  976) /**
c790fbf20a53e82 Matthew Wilcox (Oracle  2021-04-07  977)  * struct file_ra_state - Track a file's readahead state.
c790fbf20a53e82 Matthew Wilcox (Oracle  2021-04-07  978)  * @start: Where the most recent readahead started.
c790fbf20a53e82 Matthew Wilcox (Oracle  2021-04-07  979)  * @size: Number of pages read in the most recent readahead.
84dacdbd5352bfe NeilBrown               2022-03-22  980   * @async_size: Numer of pages that were/are not needed immediately
84dacdbd5352bfe NeilBrown               2022-03-22  981   *      and so were/are genuinely "ahead".  Start next readahead when
84dacdbd5352bfe NeilBrown               2022-03-22  982   *      the first of these pages is accessed.
84dacdbd5352bfe NeilBrown               2022-03-22  983   * @ra_pages: Maximum size of a readahead request, copied from the bdi.
23aadcd1d9764a7 Ryan Roberts            2025-06-09  984   * @order: Preferred folio order used for most recent readahead.
c790fbf20a53e82 Matthew Wilcox (Oracle  2021-04-07  985)  * @mmap_miss: How many mmap accesses missed in the page cache.
c790fbf20a53e82 Matthew Wilcox (Oracle  2021-04-07  986)  * @prev_pos: The last byte in the most recent read request.
84dacdbd5352bfe NeilBrown               2022-03-22  987   *
84dacdbd5352bfe NeilBrown               2022-03-22  988   * When this structure is passed to ->readahead(), the "most recent"
84dacdbd5352bfe NeilBrown               2022-03-22  989   * readahead means the current readahead.
^1da177e4c3f415 Linus Torvalds          2005-04-16  990   */
^1da177e4c3f415 Linus Torvalds          2005-04-16  991  struct file_ra_state {
c790fbf20a53e82 Matthew Wilcox (Oracle  2021-04-07  992) 	pgoff_t start;
c790fbf20a53e82 Matthew Wilcox (Oracle  2021-04-07  993) 	unsigned int size;
c790fbf20a53e82 Matthew Wilcox (Oracle  2021-04-07  994) 	unsigned int async_size;
c790fbf20a53e82 Matthew Wilcox (Oracle  2021-04-07  995) 	unsigned int ra_pages;
c790fbf20a53e82 Matthew Wilcox (Oracle  2021-04-07  996) 	unsigned int mmap_miss;
c790fbf20a53e82 Matthew Wilcox (Oracle  2021-04-07  997) 	loff_t prev_pos;
^1da177e4c3f415 Linus Torvalds          2005-04-16 @998  };
^1da177e4c3f415 Linus Torvalds          2005-04-16  999  

:::::: The code at line 998 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
