Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A7512E6115
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Jul 2025 12:06:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753272368; cv=none; b=XikR6ybhok8/L1xs/hoPwp9/lpQ5LeLtjlIXdixvZ9COtFWniqwZPV+hU2ACY4n4wZAO4njdW8U6KQzUk3SQFcIyrqKSGA2DhxHuuYaqFGZvFNp+zl3m9uwuk7a4PhPRHiJIOGhvdRdKwNQTDsBMM0mPHlRjLdArZMoqq486KAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753272368; c=relaxed/simple;
	bh=/PowYM3IOHXhpytU6Eo+szs8B4IIx3sO3g3msS7Lw1Q=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tFEoq5Ds18XbtWEre/25z5pLyHvSm8qRAMHDh6y0+wC1Glj0kW2tqWFE2u6yomRphS9oya82hDknCnBBNmDjwpLH8PFxf8es5hjgP6JUIZpI2QzMy6xpVJGnHctuoJ2mlmbQ0VcTMnzaskv5Mu+eRZMUHvGHJIkUxQ9//ihcZco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=U38SbuA8; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="U38SbuA8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753272367; x=1784808367;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=/PowYM3IOHXhpytU6Eo+szs8B4IIx3sO3g3msS7Lw1Q=;
  b=U38SbuA8I1BzSrhEf7qwstir8NA86zkY41ZpQTktbC0+nDV0MUAWv3Gc
   tRfF2KYeS+tLadaijGv0jJ5wTOnCNbFcZA2VKViQd66wJ31uu/tnj1HbR
   3KPjT+EJkZiPyIizIlfcMD0nRxMjOXNN1A9Hya8slzYFH9B5M/nOdLf6c
   4N+0CYJZVEMSXzQhJzYk4r4ZO/yDJ4cYIIF6P/3U9I+sxDp1m39HmQGOg
   7SpziK+qQKLFwjeGlWSWDO7Vb6sn8LfBvvKgXU8EvxW25j6xeX+0WqJ80
   zEG3QOPqffyEDjSVI3d574Ct3NxlOIb59Myhrw0kDvmVzg/JJcsZQbZqt
   Q==;
X-CSE-ConnectionGUID: 5WcfS1BcSV2Ak23W+NK2SA==
X-CSE-MsgGUID: kgWJJWr0S6CCKFD92p4GrA==
X-IronPort-AV: E=McAfee;i="6800,10657,11501"; a="66983307"
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="66983307"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Jul 2025 05:06:06 -0700
X-CSE-ConnectionGUID: Mrieh1EGQrKu8Nmy8kJt/g==
X-CSE-MsgGUID: kdRgJN2XSRGawPvYMF+wHA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,333,1744095600"; 
   d="scan'208";a="163525652"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Jul 2025 05:06:04 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ueYEU-000JKh-2H;
	Wed, 23 Jul 2025 12:06:02 +0000
Date: Wed, 23 Jul 2025 20:05:21 +0800
From: kernel test robot <lkp@intel.com>
To: aubrey.li@linux.intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [anolis-intel-cloud:devel-5.10 9/9] fs/erofs/data.c:27:10: warning:
 variable 'index' set but not used
Message-ID: <202507232016.XsEEV6eQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Hi Gao,

First bad commit (maybe != root cause):

tree:   https://gitee.com/anolis/intel-cloud-kernel.git devel-5.10
head:   7fc3abd8b21f1ef01108269b858d36abd6b95372
commit: fddff2670c3a8d69b1d05e94eba0b72ba388daf5 [9/9] erofs: keep meta inode into erofs_buf
config: x86_64-rhel-9.4-rust (https://download.01.org/0day-ci/archive/20250723/202507232016.XsEEV6eQ-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 853c343b45b3e83cc5eeef5a52fc8cc9d8a09252)
rustc: rustc 1.58.0 (02072b482 2022-01-11)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250723/202507232016.XsEEV6eQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507232016.XsEEV6eQ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/erofs/data.c:27:10: warning: variable 'index' set but not used [-Wunused-but-set-variable]
      27 |         pgoff_t index;
         |                 ^
   fs/erofs/data.c:51:7: warning: no previous prototype for function '__erofs_bread' [-Wmissing-prototypes]
      51 | void *__erofs_bread(struct super_block *sb, struct erofs_buf *buf,
         |       ^
   fs/erofs/data.c:51:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      51 | void *__erofs_bread(struct super_block *sb, struct erofs_buf *buf,
         | ^
         | static 
   fs/erofs/data.c:262:26: warning: variable 'length' set but not used [-Wunused-but-set-variable]
     262 |                         erofs_off_t startoff, length;
         |                                               ^
   3 warnings generated.


vim +/index +27 fs/erofs/data.c

5af84129f73c55 Gao Xiang 2022-01-02  24  
5af84129f73c55 Gao Xiang 2022-01-02  25  void erofs_put_metabuf(struct erofs_buf *buf)
5af84129f73c55 Gao Xiang 2022-01-02  26  {
cc28d7800c8310 Liu Bo    2023-06-14 @27  	pgoff_t index;
cc28d7800c8310 Liu Bo    2023-06-14  28  
5af84129f73c55 Gao Xiang 2022-01-02  29  	if (!buf->page)
5af84129f73c55 Gao Xiang 2022-01-02  30  		return;
5af84129f73c55 Gao Xiang 2022-01-02  31  	erofs_unmap_metabuf(buf);
cc28d7800c8310 Liu Bo    2023-06-14  32  
cc28d7800c8310 Liu Bo    2023-06-14  33  	index = buf->page->index;
5af84129f73c55 Gao Xiang 2022-01-02  34  	put_page(buf->page);
5af84129f73c55 Gao Xiang 2022-01-02  35  	buf->page = NULL;
cc28d7800c8310 Liu Bo    2023-06-14  36  

:::::: The code at line 27 was first introduced by commit
:::::: cc28d7800c831030e86e5902c6305f08ef04f911 anolis: dax: add dax_read_one_pfn helper

:::::: TO: Liu Bo <bo.liu@linux.alibaba.com>
:::::: CC: 小龙 <sam.zyc@alibaba-inc.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
