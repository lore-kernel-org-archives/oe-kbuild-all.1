Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FC21E87B
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Dec 2024 18:56:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734375383; cv=none; b=gd7f1i29Xf7K8xndh2O7r+Bmwp4D38KsvbUQFKC7LDB9v9B8mn8cEyb0WDkqy7rxZSHDKLPeKCm/+oK2jnOyfuxCefoCvsC21AV6N5dqaeHh7l61gIaFjGtf65+D3Xen7vOsYX2B0DpsXULdj3QWtw3XYmWdVAaJSIylpAHYGts=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734375383; c=relaxed/simple;
	bh=aZ1C0IVcfkwBQKrlAHzi9yavBXHVAwwIR3OuF50lf7s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Z6v2F1zrSek2YcIQKcLxmHuE+mu4C/cR1Fs1VWonTMq/Y3dYIyzTflBqrVzpJsUitshvm07AIeJo8h6Hx5Q7SiEbw3tSjNo9jjhEbrp3PNrYIWQake9gIok3+cTxJbaP1zzelyXFasuxCiiSOYxWmQPBENAn9IAuUhwQHiffzsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XOnDeUeO; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XOnDeUeO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734375382; x=1765911382;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aZ1C0IVcfkwBQKrlAHzi9yavBXHVAwwIR3OuF50lf7s=;
  b=XOnDeUeOWRKASbWtk1WTigCDst4OOyj7A6pmSiQzgBEUGl6PKHxeeALY
   sJxVG1JvWjl8jSL4uc2HPi2cRX7sIcbyC9W+O0kSyK/xuYvSADAe5UBBh
   CJ/+Tftibornu+zT+A7ArosHEnb+Wk+KPTfDryfyD1C8zNatvBZf0YZLq
   R4OfhQQwwADEC0vBCt3/9NTIPDa7Rfmx73m+TkXGoQUxH10YIblUeiQ70
   G/mOQdG6Dbrp9LSNJIeUULLY1XUiYbWYF1PTiQMoLKlIBDw9mGkDZMP3R
   lSNWKG1lyR+ivJrxUmUcIR/Cm8zn5ypRRMoSQgPa3aGEOOgOz2YCvvw3r
   g==;
X-CSE-ConnectionGUID: qfa342AvTSSB2gSZ+wGn1g==
X-CSE-MsgGUID: jF+yXO5WT7+hrhqshjbYFQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11288"; a="38453498"
X-IronPort-AV: E=Sophos;i="6.12,239,1728975600"; 
   d="scan'208";a="38453498"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2024 10:56:21 -0800
X-CSE-ConnectionGUID: XiF61OGQSw2eyKD57h2xvw==
X-CSE-MsgGUID: I4qitKBuRRu0HBIxaT9GmA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="134623544"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 16 Dec 2024 10:56:20 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tNGGP-000EQ0-22;
	Mon, 16 Dec 2024 18:56:17 +0000
Date: Tue, 17 Dec 2024 02:55:52 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Chao Yu <yuchao0@huawei.com>,
	Chao Yu <chao@kernel.org>
Subject: [chao:wip 19/20] fs/f2fs/segment.c:2891:25: error: implicit
 declaration of function 'reset_curseg_fields'; did you mean 'reset_curseg'?
Message-ID: <202412170256.GSAInfkZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
head:   99c1b937f7efd14347261f99e40036e481c6cbc0
commit: adf3b6b31460b800b74602a535414e50d1e761c5 [19/20] f2fs: fix to avoid panic once fallocation fails for pinfile
config: arm-randconfig-002-20241217 (https://download.01.org/0day-ci/archive/20241217/202412170256.GSAInfkZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241217/202412170256.GSAInfkZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412170256.GSAInfkZ-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/f2fs/segment.c: In function 'new_curseg':
>> fs/f2fs/segment.c:2891:25: error: implicit declaration of function 'reset_curseg_fields'; did you mean 'reset_curseg'? [-Wimplicit-function-declaration]
    2891 |                         reset_curseg_fields(curseg);
         |                         ^~~~~~~~~~~~~~~~~~~
         |                         reset_curseg
   fs/f2fs/segment.c: At top level:
>> fs/f2fs/segment.c:3671:13: warning: conflicting types for 'reset_curseg_fields'; have 'void(struct curseg_info *)'
    3671 | static void reset_curseg_fields(struct curseg_info *curseg)
         |             ^~~~~~~~~~~~~~~~~~~
>> fs/f2fs/segment.c:3671:13: error: static declaration of 'reset_curseg_fields' follows non-static declaration
   fs/f2fs/segment.c:2891:25: note: previous implicit declaration of 'reset_curseg_fields' with type 'void(struct curseg_info *)'
    2891 |                         reset_curseg_fields(curseg);
         |                         ^~~~~~~~~~~~~~~~~~~


vim +2891 fs/f2fs/segment.c

  2872	
  2873	/*
  2874	 * Allocate a current working segment.
  2875	 * This function always allocates a free segment in LFS manner.
  2876	 */
  2877	static int new_curseg(struct f2fs_sb_info *sbi, int type, bool new_sec)
  2878	{
  2879		struct curseg_info *curseg = CURSEG_I(sbi, type);
  2880		unsigned int segno = curseg->segno;
  2881		bool pinning = type == CURSEG_COLD_DATA_PINNED;
  2882		int ret;
  2883	
  2884		if (curseg->inited)
  2885			write_sum_page(sbi, curseg->sum_blk, GET_SUM_BLOCK(sbi, segno));
  2886	
  2887		segno = __get_next_segno(sbi, type);
  2888		ret = get_new_segment(sbi, &segno, new_sec, pinning);
  2889		if (ret) {
  2890			if (ret == -ENOSPC)
> 2891				reset_curseg_fields(curseg);
  2892			return ret;
  2893		}
  2894	
  2895		curseg->next_segno = segno;
  2896		reset_curseg(sbi, type, 1);
  2897		curseg->alloc_type = LFS;
  2898		if (F2FS_OPTION(sbi).fs_mode == FS_MODE_FRAGMENT_BLK)
  2899			curseg->fragment_remained_chunk =
  2900					get_random_u32_inclusive(1, sbi->max_fragment_chunk);
  2901		return 0;
  2902	}
  2903	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
