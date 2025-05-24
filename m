Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 206541DDA3E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 24 May 2025 06:47:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748069252; cv=none; b=sxng7sBwip78q9QJZ+8MZnNdk9306rp1YBk1+0xKK8XvPWe5qTv6zJzHVBIPu+Njaf42TaTUfKDCRi0dzDFdCSsXb9KUfaZqWH8CFxdy56c5c6wRowLwLeu3XooW/qMhu5DSqi5e/PM/wjlW4BmRcoxACXclV7uP+Irq/LLCoc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748069252; c=relaxed/simple;
	bh=CSmbbc/wcCxcroA3BnxJ+Zhlnnq2+mjudFz/ONZwtQI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EKJG3/lZQ1+H6Dv2C1/yUSByPAYzVWil/F3hsEcVDPsK1jPId4IaS0QIu/PymJNkq8O5NIXY7JLodpOzrq362c6ZUXinI5FNZRluvDoEmv8tTNSM+jCoTx3fJ8sNsjGPmor33a323C4clMWVV9csinz6xybSy0/rgVK+A3v5G3g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=VqS5hCvW; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="VqS5hCvW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748069250; x=1779605250;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CSmbbc/wcCxcroA3BnxJ+Zhlnnq2+mjudFz/ONZwtQI=;
  b=VqS5hCvWAK8axR+WpJlehPH+sAZ0CvitrKu8RYebRFmSkfcWwJwWTeVb
   TLP+uob8bjpNxfZfz1hyn9fWllhWSXI9nFKwuvU32qnRUetZSefUdE/Vq
   +VDMnLov5q9bBl08dP0vW4Zbijl+kzn15nsv4pwfZxeBQtkeBRQikAj5H
   mU3wVilZ4qb9aIb/SiDCprw5Ds986vQD4/iqq/Jgd5tu1EQERm0EAtxk9
   B6kYhN4bfjbI2H8U9ql82Z/lES60yzCapOLcWhsBRjxevXUFgP2Otsr/c
   BDQwEnhluE3hY+33reIBXbk9a54acKzCWOAWosX/zx0cJqyUfmUpspr69
   w==;
X-CSE-ConnectionGUID: FqKeS1fsS/yKdBU9d6gRNw==
X-CSE-MsgGUID: R9mfI1HfRUSYw08N7cPKUQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11441"; a="50232038"
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="50232038"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 May 2025 23:47:27 -0700
X-CSE-ConnectionGUID: YZLsgqOQS+eOLzDTqk7O5w==
X-CSE-MsgGUID: m1wEcEHyRAGDcmn0miptjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,310,1739865600"; 
   d="scan'208";a="146180842"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 23 May 2025 23:47:27 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uIifE-000Qzs-0k;
	Sat, 24 May 2025 06:47:24 +0000
Date: Sat, 24 May 2025 14:46:25 +0800
From: kernel test robot <lkp@intel.com>
To: Prasad Singamsetty <prasad.singamsetty@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, LUCI Bot <vijayendra.suman@oracle.com>,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Alan Maguire <alan.maguire@oracle.com>
Subject: [jlayton:uek-localio 2225/2262] block/blk-core.c:536:1: warning:
 'noipa' attribute directive ignored
Message-ID: <202505241449.VhrSIDvB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git uek-localio
head:   65b0dc6bb1f5c18e63d8ee9ea1cca997456a81a9
commit: 58a4b07014f944ef8b49da2fb31bb54c454f20be [2225/2262] block: prevent calls to should_fail_bio() optimized by gcc
config: arm-randconfig-001-20250524 (https://download.01.org/0day-ci/archive/20250524/202505241449.VhrSIDvB-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250524/202505241449.VhrSIDvB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505241449.VhrSIDvB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/bvec.h:10:0,
                    from include/linux/blk_types.h:10,
                    from include/linux/bio.h:10,
                    from block/blk-core.c:17:
   include/linux/highmem.h: In function 'clear_user_highpage_uncached':
   include/linux/highmem.h:265:2: error: implicit declaration of function 'clear_user_page_uncached'; did you mean 'clear_user_highpage_uncached'? [-Werror=implicit-function-declaration]
     clear_user_page_uncached(addr, vaddr, page);
     ^~~~~~~~~~~~~~~~~~~~~~~~
     clear_user_highpage_uncached
   block/blk-core.c: At top level:
>> block/blk-core.c:536:1: warning: 'noipa' attribute directive ignored [-Wattributes]
    {
    ^
   cc1: some warnings being treated as errors


vim +/noipa +536 block/blk-core.c

721c7fc701c71f Ilya Dryomov       2018-01-11  534  
58a4b07014f944 Prasad Singamsetty 2025-04-02  535  static noinline __attribute__((noipa)) int should_fail_bio(struct bio *bio)
30abb3a67f4b2a Howard McLauchlan  2018-02-06 @536  {
309dca309fc39a Christoph Hellwig  2021-01-24  537  	if (should_fail_request(bdev_whole(bio->bi_bdev), bio->bi_iter.bi_size))
30abb3a67f4b2a Howard McLauchlan  2018-02-06  538  		return -EIO;
30abb3a67f4b2a Howard McLauchlan  2018-02-06  539  	return 0;
30abb3a67f4b2a Howard McLauchlan  2018-02-06  540  }
30abb3a67f4b2a Howard McLauchlan  2018-02-06  541  ALLOW_ERROR_INJECTION(should_fail_bio, ERRNO);
30abb3a67f4b2a Howard McLauchlan  2018-02-06  542  

:::::: The code at line 536 was first introduced by commit
:::::: 30abb3a67f4b2aa160feeb3c0b771f730cbcca67 block: Add should_fail_bio() for bpf error injection

:::::: TO: Howard McLauchlan <hmclauchlan@fb.com>
:::::: CC: Jens Axboe <axboe@kernel.dk>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
