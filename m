Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEEA235361
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Mar 2025 20:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742676278; cv=none; b=sIny1qiaAR+Zr6YCLCp1AzQGnw366B8eXFElDLPBIhe50bbWAiJDxqUDEuHi1saU0LzX2OCN5KD+Yu4Jp+Ff8X2FCoJmlq9t4amO0wMS5GMXwfySgKJwhIi8n8qWjPT+fD2N2N0L3Nu+jrTaFf1jrgSZ7lQLsbk+EzNG2X5/KMw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742676278; c=relaxed/simple;
	bh=J+tl047i5oVbcf4fOsI/CASci2pBbF5lPJgGdFJw+Fw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Hmv/tX3x8TTpOz3orRcaPjkiPqRdudjePwZTIyqCkNasQzWQcejiRx2qif0wQ4Qs5W4Gr5p51RtoZpXucvuhwWQsrUUThFGN1/QebvPOyMqyMrE8ouEqYNBIk4i7LTmS6v58fouy6tQEnxtkR9squfI54O/GMNr1gRgGZQyfDDY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lFGDjDZB; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lFGDjDZB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742676276; x=1774212276;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=J+tl047i5oVbcf4fOsI/CASci2pBbF5lPJgGdFJw+Fw=;
  b=lFGDjDZBPLnarY1arrP2oAEAK4cVqSwR3kv/KooZu4liqa+r2ozxurU8
   rEpeJG4RKNI+CBHRrd9wUIOwqMJHPf06hP+BRRtZmVOG1+ZfQakzcVQir
   hQoRtIqYVKpyiod07bi/lROt0UDDkb9Ajw924ejCZnrVij78Iz/2w+GCG
   22DEsAvNyEv/74LZhLNEbv2hQ4bu9gwS3G3zmvnEUzKD+cz/nWJZPSE5x
   QyrLmhzhmSHfl9A+8WarkyGwHAlby6La//jUaPd/qmG/I3+6330LnYGAV
   A4WZvP1HmWnsnL1VCem2gje/XgUEgr5IJ75W7RgIXhbqoldxbXbwYuw3G
   g==;
X-CSE-ConnectionGUID: r6aN8MI+QWmTX0OTIz74uQ==
X-CSE-MsgGUID: qT8cW/czQeigvBEHAdAzIg==
X-IronPort-AV: E=McAfee;i="6700,10204,11381"; a="47694083"
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="47694083"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2025 13:44:35 -0700
X-CSE-ConnectionGUID: 4F+2Hlx6Roy+3+yGcsvjkA==
X-CSE-MsgGUID: +j/RwID8QNW77cdWv0CjCg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,268,1736841600"; 
   d="scan'208";a="146903500"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Mar 2025 13:44:35 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tw5ho-0002OF-0Y;
	Sat, 22 Mar 2025 20:44:32 +0000
Date: Sun, 23 Mar 2025 04:43:38 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:bugfix/common 5/5] fs/f2fs/super.c:4320:29: error: implicit
 declaration of function 'f2fs_zone_is_seq'; did you mean 'bdev_zone_is_seq'?
Message-ID: <202503230435.eiSYqcDR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common
head:   40cbb3a09cebf75b7141934e954fff0738704918
commit: 40cbb3a09cebf75b7141934e954fff0738704918 [5/5] f2fs: zone: fix to avoid inconsistence in between SIT and SSA
config: riscv-randconfig-002-20250323 (https://download.01.org/0day-ci/archive/20250323/202503230435.eiSYqcDR-lkp@intel.com/config)
compiler: riscv64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250323/202503230435.eiSYqcDR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503230435.eiSYqcDR-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/super.c: In function 'get_first_zoned_segno':
>> fs/f2fs/super.c:4320:29: error: implicit declaration of function 'f2fs_zone_is_seq'; did you mean 'bdev_zone_is_seq'? [-Wimplicit-function-declaration]
    4320 |                         if (f2fs_zone_is_seq(sbi, devi, zone))
         |                             ^~~~~~~~~~~~~~~~
         |                             bdev_zone_is_seq


vim +4320 fs/f2fs/super.c

  4307	
  4308	static inline unsigned int get_first_zoned_segno(struct f2fs_sb_info *sbi)
  4309	{
  4310		unsigned int segno;
  4311		int devi, i;
  4312	
  4313		for (devi = 0; devi < sbi->s_ndevs; devi++) {
  4314			if (!bdev_is_zoned(FDEV(devi).bdev))
  4315				continue;
  4316	
  4317			segno = GET_SEGNO(sbi, FDEV(devi).start_blk);
  4318			for (i = 0; i < FDEV(devi).total_segments; i++) {
  4319				unsigned int zone = GET_ZONE_FROM_SEG(sbi, segno);
> 4320				if (f2fs_zone_is_seq(sbi, devi, zone))
  4321					return segno;
  4322			}
  4323		}
  4324		return NULL_SEGNO;
  4325	}
  4326	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
