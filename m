Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A373C108C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Aug 2026 03:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787109851; cv=none; b=Ch7dd/AU0f9uD+rK53d9s1KwP3nGiRffeDJm84xV2iFMMJyJwAIrSk9fcSU3rXkuy9sHJOXUs4o3khCXHepO5YjboMZxJkj3qDPD+m6vL5Fa++B4LOw4hTFQ4aTfOimBHRXFY8ix+hs80TCuLB0JwO9GedS2Woh6Y0gN1KogTNk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787109851; c=relaxed/simple;
	bh=v2zqESgo32HL0LUsvk312xVxeHworXWVJAUbgvLfjNY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=MTv8PcDeumcZQwwra7QAArloqOV3mzgotBbbBqJGdAQPCKaOYnqSYr/deeLnyBz992MBSGosgYsTzIicQlU+afI8Y6ConY+vuxpdGhiwVodZRc5TcG6Ap6vI9p4tYTa+rHq7tKCVMjPCKnicHMttXg32L/zwpmUQGZObYE5NvOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NODJKItK; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NODJKItK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787109850; x=1818645850;
  h=date:from:to:cc:subject:message-id;
  bh=v2zqESgo32HL0LUsvk312xVxeHworXWVJAUbgvLfjNY=;
  b=NODJKItK3tlf457m+PHVBJh5TUyJgE6iK2wugjzyWzOlO9wiKk+dmRu/
   PFKgMkFM/TYV6sGCMzsIZXN8CI5+7djJNnV2Solzdp8OMg63YWToNzxz/
   Bjtc0w1wuJW5fg+Wvb4hYXkhXNhmcooRb7ZZxhLLYMW7J1R/zvtUUGRC/
   ea9ydu2YpO3F89gA4cLjda3i9Z4Ql+b7kur+Yw9kNUyvQFaiTkdLjflg4
   7FXDf80tzXo9Uj6GsliDxxbVj4zwihUwKj7amgdJ1r/wrlIMUcMYUWt19
   M7OxrPkgmZg6fTWLL6dlCGRfvNSKowmBgf0neO0w3ceFuBRe3vAzwIjXi
   A==;
X-CSE-ConnectionGUID: 7OV1MSMxROGXkWAFVjtRyg==
X-CSE-MsgGUID: 3GnF4UaNSWupZSK04g4z/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11879"; a="90130506"
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="90130506"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Aug 2026 20:24:07 -0700
X-CSE-ConnectionGUID: xF5qTniOSGyoecNSdun/nw==
X-CSE-MsgGUID: 9FM441P2Rp+lsIms+n8RBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,231,1779174000"; 
   d="scan'208";a="269254094"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 18 Aug 2026 20:24:06 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wwWuJ-00000000erE-1MxG;
	Wed, 19 Aug 2026 03:24:03 +0000
Date: Wed, 19 Aug 2026 11:23:08 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chao:feature/cache 8/13] fs/f2fs/data.c:61:30: warning:
 variable 'sbi' set but not used
Message-ID: <202608191142.iuOMBM1T-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git feature/cache
head:   cc6a23d8c232f588f3a5415d1b10a19e1e4ce860
commit: f93483387c4c8dd531a818f52e740c1049d00de1 [8/13] f2fs: cache: use node cache
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260819/202608191142.iuOMBM1T-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260819/202608191142.iuOMBM1T-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608191142.iuOMBM1T-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/data.c: In function 'f2fs_is_cp_guaranteed':
>> fs/f2fs/data.c:61:30: warning: variable 'sbi' set but not used [-Wunused-but-set-variable]
      61 |         struct f2fs_sb_info *sbi;
         |                              ^~~


vim +/sbi +61 fs/f2fs/data.c

f543805fcd60f3 Chao Yu                 2019-12-04  56  
d6966e7ed280ca Matthew Wilcox (Oracle  2025-07-08  57) bool f2fs_is_cp_guaranteed(const struct folio *folio)
36951b38d13ac7 Chao Yu                 2016-11-16  58  {
a824388d911927 Matthew Wilcox (Oracle  2025-07-08  59) 	struct address_space *mapping = folio->mapping;
36951b38d13ac7 Chao Yu                 2016-11-16  60  	struct inode *inode;
36951b38d13ac7 Chao Yu                 2016-11-16 @61  	struct f2fs_sb_info *sbi;
36951b38d13ac7 Chao Yu                 2016-11-16  62  
a824388d911927 Matthew Wilcox (Oracle  2025-07-08  63) 	if (fscrypt_is_bounce_folio(folio))
a824388d911927 Matthew Wilcox (Oracle  2025-07-08  64) 		return folio_test_f2fs_gcing(fscrypt_pagecache_folio(folio));
36951b38d13ac7 Chao Yu                 2016-11-16  65  
36951b38d13ac7 Chao Yu                 2016-11-16  66  	inode = mapping->host;
36951b38d13ac7 Chao Yu                 2016-11-16  67  	sbi = F2FS_I_SB(inode);
36951b38d13ac7 Chao Yu                 2016-11-16  68  
f93483387c4c8d Chao Yu                 2026-08-18  69  	if (S_ISDIR(inode->i_mode))
b763f3bedc2da2 Chao Yu                 2021-04-28  70  		return true;
b763f3bedc2da2 Chao Yu                 2021-04-28  71  
3db1de0e582c35 Daeho Jeong             2022-04-28  72  	if ((S_ISREG(inode->i_mode) && IS_NOQUOTA(inode)) ||
a824388d911927 Matthew Wilcox (Oracle  2025-07-08  73) 			folio_test_f2fs_gcing(folio))
36951b38d13ac7 Chao Yu                 2016-11-16  74  		return true;
36951b38d13ac7 Chao Yu                 2016-11-16  75  	return false;
36951b38d13ac7 Chao Yu                 2016-11-16  76  }
36951b38d13ac7 Chao Yu                 2016-11-16  77  

:::::: The code at line 61 was first introduced by commit
:::::: 36951b38d13ac7cce9fcf89e0e01c22ed0d05688 f2fs: don't wait writeback for datas during checkpoint

:::::: TO: Chao Yu <yuchao0@huawei.com>
:::::: CC: Jaegeuk Kim <jaegeuk@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
