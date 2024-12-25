Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49064C8FF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 25 Dec 2024 02:19:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735093184; cv=none; b=AGVWNsQ+weAgD45VI3x1mZFN6nRK+mLchYmw+ozvsTmsofJZS3nWoV/5EkNWXiY6vq5x2qiVNTNw1lU5uCrobkwz02pGppJgPOOJbW3Ti1vvDDjIAksr1Jw9bw/O5lsH+YouljneWxJ8z78tDw2briL0z4v1EJNqYDzUieAx5Q8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735093184; c=relaxed/simple;
	bh=oS7RrkWyH/4ewC4k4gQ84NueCoBdEvxGyEAQ9tQjwrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=akVz/wqTFRMRykdfwlB9XQj4NCIycurDq8QG3i9lQyTZHZb4x2h1HFYUdYv1edgoEK4EiA7KLuC99qQu23K6rwOQll9ip9RFUCyunKeiZa/pzoINeoZCLIPMv0Gf5ZCO3teYDU7kq+6v1s/jeTmgkmvszdVA2nEl9KUqLQqYUbg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a/3bCsGx; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a/3bCsGx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735093182; x=1766629182;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=oS7RrkWyH/4ewC4k4gQ84NueCoBdEvxGyEAQ9tQjwrI=;
  b=a/3bCsGxcED9EiZbYmelmlHSsKECror6zE5o8K9pA75/WeuVAzRZzG2K
   X/C2qU5Ur+Gyr7unRM0DB5ae3yDjgQ05jnYYF8TO1YB/hPsH24DoccFpZ
   +8fFnz4hMUcMJ/+Q3p5Rd0PIJinwrSBdTH8QJVqQvlBlFWwCn36vNWMDc
   gp2mbUOeF3isdc5F1ibnUzt6ox96JtRVR05EId2Sm2KLjrbsL4H3R+YlJ
   9pHcT4wYCp5M6hqz4AQx67wEmnNZ+yyDCpT/4sZ0wRPZoHgcQv6wSjNt/
   uV1NjkJHAF1CJ4uB/LjYSpOdos/rTaPO4/EkKd1w1n75BmyBoHOzx9g0L
   g==;
X-CSE-ConnectionGUID: DsR0a9ptTNS5pdzRZpXGZg==
X-CSE-MsgGUID: J0nYdv05T/a7XeMKG75CeA==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="60937278"
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="60937278"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 18:19:42 -0800
X-CSE-ConnectionGUID: 2judovVRRXOXqJhQDFgJfg==
X-CSE-MsgGUID: ch/6wENzT5+psoscDK+j3Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="99981554"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 24 Dec 2024 18:19:41 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQGzq-0001bZ-35;
	Wed, 25 Dec 2024 02:19:38 +0000
Date: Wed, 25 Dec 2024 10:19:09 +0800
From: kernel test robot <lkp@intel.com>
To: Josh Poimboeuf <jpoimboe@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jpoimboe:sframe 18/31] kernel/unwind/sframe.c:42:9: sparse: sparse:
 incorrect type in initializer (different address spaces)
Message-ID: <202412251054.iKAixIV2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jpoimboe/linux.git sframe
head:   b610703fefd5a3a992e07a383e2e6f6cbf9a41c8
commit: fe9afc66b159d3728867d410453360ad0a4adfd6 [18/31] unwind/sframe: Add support for reading .sframe section contents
config: x86_64-randconfig-123-20241225 (https://download.01.org/0day-ci/archive/20241225/202412251054.iKAixIV2-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241225/202412251054.iKAixIV2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412251054.iKAixIV2-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> kernel/unwind/sframe.c:42:9: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected void [noderef] __user *__src @@     got void * @@
   kernel/unwind/sframe.c:42:9: sparse:     expected void [noderef] __user *__src
   kernel/unwind/sframe.c:42:9: sparse:     got void *
   kernel/unwind/sframe.c:290:5: sparse: sparse: context imbalance in 'sframe_find' - wrong count at exit

vim +42 kernel/unwind/sframe.c

    34	
    35	static __always_inline int read_fde(struct sframe_section *sec,
    36					    unsigned int fde_num,
    37					    struct sframe_fde *fde)
    38	{
    39		unsigned long fde_addr, ip;
    40	
    41		fde_addr = sec->fdes_start + (fde_num * sizeof(struct sframe_fde));
  > 42		unsafe_copy_from_user(fde, (void *)fde_addr, sizeof(struct sframe_fde),
    43				      Efault);
    44	
    45		ip = sec->sframe_start + fde->start_addr;
    46		if (ip < sec->text_start || ip > sec->text_end) {
    47			dbg_sec("fde %u: address out of range\n", fde_num);
    48			return -EINVAL;
    49		}
    50	
    51		return 0;
    52	
    53	Efault:
    54		dbg_sec("fde %d usercopy failed\n", fde_num);
    55		return -EFAULT;
    56	}
    57	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
