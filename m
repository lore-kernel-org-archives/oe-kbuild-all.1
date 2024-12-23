Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB8613FEE
	for <oe-kbuild-all@lists.linux.dev>; Mon, 23 Dec 2024 17:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734973690; cv=none; b=G+944pXoITymsHIP0rgj7iqapqUXWpSr5JaWq5mTCXwNnQGZIBZ8mCtO2dIPpuKeDQXfbrbSP0ZgPXPjockl03kE+VBriO9Iw6YH+UNs7KI432WC5ZQZDZ7NsEFZeHGhLAXvAoMmcztMwX6ndVJpFsmnmyLOfVcp8vlBrRPhWYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734973690; c=relaxed/simple;
	bh=xkJeZcNmt0A7ZbvirYr/9bTNDMiO6H4VflqiNuU1hjo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=anKUTq8qh2WmPTKwBS6ehZ6h1NJ7gxx6RnWcsul47RppU4PUOMXwgBXTfiPUX7N4aFXFBy1o0Z10qHL+JpYOSa0yYXJRGpUJPtxmlX7R0HoEqbn5OIkrCJi5IELVVUIACsi5VfUoy8pNGtFjNQWMY8QzCmE6u6aqenzMMU5/6Ww=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FDGQufwH; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FDGQufwH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734973689; x=1766509689;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xkJeZcNmt0A7ZbvirYr/9bTNDMiO6H4VflqiNuU1hjo=;
  b=FDGQufwHCQCUhpOX5nhShYl/N/wN4r234nilb60pZgu6fCg0rSLfHQlY
   j8klsjxjP0YTVM/savLy2b8Aa6XwIDywHuByj/6vREMyrs+UOBvxyT1v+
   3E0d13VYXpigcblRE+fgnQcATjj4XnKSeAsa5wXDm5U+L1GHflWk+rHKy
   Plbz7aXrlIT+nCmufg2ZQ74/Wne9akTO18QpPhJ+2HAwqSMQuZ1AAnKsN
   tUXZytNddSmLNOyG3nDRx+zo8G0iOCCzVewEQBt+18MWmkDp1SldUTVoo
   6/EjHWhE3MiZ4qhEpC30f8gnsjUhS6S4B/njRgHC2d6WKeZvLeaz9T3/b
   w==;
X-CSE-ConnectionGUID: slGRcq7HS3KokB1QjapT2w==
X-CSE-MsgGUID: fIF4PkhBSViyUcwdDbqemg==
X-IronPort-AV: E=McAfee;i="6700,10204,11295"; a="46862729"
X-IronPort-AV: E=Sophos;i="6.12,257,1728975600"; 
   d="scan'208";a="46862729"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Dec 2024 09:08:08 -0800
X-CSE-ConnectionGUID: Q6n6HccVSDCWBNRbjRqqsQ==
X-CSE-MsgGUID: nU0MMr0GR3O+qRoZLn8REg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="104243898"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 23 Dec 2024 09:08:07 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tPluW-0000Uc-31;
	Mon, 23 Dec 2024 17:08:04 +0000
Date: Tue, 24 Dec 2024 01:07:05 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:wip 21/21] fs/f2fs/segment.c:5541:13: error: implicit
 declaration of function 'unlike'; did you mean 'inline'?
Message-ID: <202412240002.wq201y66-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
head:   7d46ca6d49d369b6ebaf3d52c23fdf69c7d4cb77
commit: 7d46ca6d49d369b6ebaf3d52c23fdf69c7d4cb77 [21/21] f2fs: fix to avoid return invalid mtime from f2fs_get_section_mtime()
config: s390-randconfig-002-20241223 (https://download.01.org/0day-ci/archive/20241224/202412240002.wq201y66-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241224/202412240002.wq201y66-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412240002.wq201y66-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/segment.c: In function 'f2fs_get_section_mtime':
>> fs/f2fs/segment.c:5541:13: error: implicit declaration of function 'unlike'; did you mean 'inline'? [-Wimplicit-function-declaration]
    5541 |         if (unlike(mtime == INVALID_MTIME))
         |             ^~~~~~
         |             inline


vim +5541 fs/f2fs/segment.c

  5510	
  5511	unsigned long long f2fs_get_section_mtime(struct f2fs_sb_info *sbi,
  5512		unsigned int segno)
  5513	{
  5514		unsigned int usable_segs_per_sec = f2fs_usable_segs_in_sec(sbi);
  5515		unsigned int secno = 0, start = 0;
  5516		unsigned int total_valid_blocks = 0;
  5517		unsigned long long mtime = 0;
  5518		unsigned int i = 0;
  5519	
  5520		secno = GET_SEC_FROM_SEG(sbi, segno);
  5521		start = GET_SEG_FROM_SEC(sbi, secno);
  5522	
  5523		if (!__is_large_section(sbi)) {
  5524			mtime = get_seg_entry(sbi, start + i)->mtime;
  5525			goto out;
  5526		}
  5527	
  5528		for (i = 0; i < usable_segs_per_sec; i++) {
  5529			/* for large section, only check the mtime of valid segments */
  5530			struct seg_entry *se = get_seg_entry(sbi, start+i);
  5531	
  5532			mtime += se->mtime * se->valid_blocks;
  5533			total_valid_blocks += se->valid_blocks;
  5534		}
  5535	
  5536		if (total_valid_blocks == 0)
  5537			return INVALID_MTIME;
  5538	
  5539		mtime = div_u64(mtime, total_valid_blocks);
  5540	out:
> 5541		if (unlike(mtime == INVALID_MTIME))
  5542			mtime -= 1;
  5543		return mtime;
  5544	}
  5545	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
