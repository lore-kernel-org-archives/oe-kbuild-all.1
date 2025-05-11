Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F12D7464
	for <oe-kbuild-all@lists.linux.dev>; Sun, 11 May 2025 15:00:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746975653; cv=none; b=iSrhc/lQJNP89lv2+sALcaci5j7RNTGfbQ8jxw++cj5p1fRK3kUtXhI6pYnAq5dLsJGkHUsJz3PnmHdyUJeViRVtcITSJ0vTpqziLhTi18eddzaQjdVRVDfHHEzB84LRynY0DuSbVKe1z1hUBj4Op+qQpOXhAsKNGyg3qCGPKWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746975653; c=relaxed/simple;
	bh=MVgNh3jfPfUtLpKr3417tGgYuuA40C7D68FSiOt05Rw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ne43PWoTA82RyjsuF/AC+PnOnLrnlLj/GxzM4teoxo4D4vrt6oKRaysOfS1rTgMnCzceE77TuBT7KqYbnFTJKWOSki5capz1W4etj2+kZ5H7bAAq4G/DiwGKNM+MP6fhqrMzLw8+YPvOk4rVra/ucPmEaEHg4qRMMQnzaNF1iGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bJVndlkg; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bJVndlkg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1746975652; x=1778511652;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MVgNh3jfPfUtLpKr3417tGgYuuA40C7D68FSiOt05Rw=;
  b=bJVndlkgIXleQrS6gez2pUrEmawv/eLC13Lc7M1p2wzWPOCCvYeFCK87
   GTuI81ZVDr1N3zcx98AIUgqGZURoNMfR/cXIMuBpAIT9wzOl0aN8OZ5L3
   LLW/1C8jtIsBJSZwcTYNG8fa/DrGk2ffo08fuMc5Bq5z+uk0b+rbqkr6J
   d1qadE+Ex3zjsj6BRdzGZ4Y3K4AUbxrnqC+EOO/qbGb4F+wIhb5DuAZog
   FdWtN+yJLLIL3inT80qTmMm5Gt/wAWsHTPzocPFjUjy4/JHUStaVc2Key
   DlMuq08uH2d2la0dcwS3kllbINqmXiRQlOyUJ+Ttm7V/y1eezFOGomSpl
   w==;
X-CSE-ConnectionGUID: 98Cj9MMsS7aFkpwxi+wsGA==
X-CSE-MsgGUID: uumPXcpDRpmQYHZvtpQgCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11430"; a="48935902"
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="48935902"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 May 2025 08:00:51 -0700
X-CSE-ConnectionGUID: EzQVCPCCRJafI8F8DE9F5w==
X-CSE-MsgGUID: N//jrah7Rq2oElahE/PmjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,280,1739865600"; 
   d="scan'208";a="137528743"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 11 May 2025 08:00:49 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uE8AZ-000DoF-0r;
	Sun, 11 May 2025 15:00:47 +0000
Date: Sun, 11 May 2025 23:00:39 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-6.6 0/94] mm/shrinker.c:688:6: warning: no
 previous prototype for function 'register_shrinker_prepared'
Message-ID: <202505112247.tsCIUciI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-6.6
head:   5b7daba404993131fe0d699e5acdccaa5bc3a017
commit: 504ef1c9f57c863225587809ba9e1c29029c34c4 [0/94] mm: shrinker: remove old APIs
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250511/202505112247.tsCIUciI-lkp@intel.com/config)
compiler: clang version 18.1.8 (https://github.com/llvm/llvm-project 3b5b5c1ec4a3095ab096dd780e84d7ab81f3d7ff)
rustc: rustc 1.73.0 (cc66ad468 2023-10-03)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250511/202505112247.tsCIUciI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505112247.tsCIUciI-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/shrinker.c:688:6: warning: no previous prototype for function 'register_shrinker_prepared' [-Wmissing-prototypes]
     688 | void register_shrinker_prepared(struct shrinker *shrinker)
         |      ^
   mm/shrinker.c:688:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
     688 | void register_shrinker_prepared(struct shrinker *shrinker)
         | ^
         | static 
   1 warning generated.


vim +/register_shrinker_prepared +688 mm/shrinker.c

af7c9c99bd63fc Qi Zheng 2023-09-11  687  
af7c9c99bd63fc Qi Zheng 2023-09-11 @688  void register_shrinker_prepared(struct shrinker *shrinker)
af7c9c99bd63fc Qi Zheng 2023-09-11  689  {
af7c9c99bd63fc Qi Zheng 2023-09-11  690  	down_write(&shrinker_rwsem);
af7c9c99bd63fc Qi Zheng 2023-09-11  691  	list_add_tail(&shrinker->list, &shrinker_list);
af7c9c99bd63fc Qi Zheng 2023-09-11  692  	shrinker->flags |= SHRINKER_REGISTERED;
af7c9c99bd63fc Qi Zheng 2023-09-11  693  	shrinker_debugfs_add(shrinker);
af7c9c99bd63fc Qi Zheng 2023-09-11  694  	up_write(&shrinker_rwsem);
af7c9c99bd63fc Qi Zheng 2023-09-11  695  }
af7c9c99bd63fc Qi Zheng 2023-09-11  696  

:::::: The code at line 688 was first introduced by commit
:::::: af7c9c99bd63fc40bba758503e56287d483c09a9 mm: vmscan: move shrinker-related code into a separate file

:::::: TO: Qi Zheng <zhengqi.arch@bytedance.com>
:::::: CC: Qinyun Tan <qinyuntan@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
