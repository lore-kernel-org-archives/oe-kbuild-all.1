Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5502C1494A8
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Dec 2024 18:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735066139; cv=none; b=EZV58svS0wzMGOIWoHXxSU9ZwbgIAv44QGLI2u6giE9WxPIAXhs5DQ808R0CuTntnQXRbJgYgfr8xkczC+YIpdUdzp5834+gYn9IFLukeGlhd7iCPTQUyvQH+be6Ek0i9Lq0XIGOKy2HYZLy6Mo3p3Yt3674HjeK1McYmj95I/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735066139; c=relaxed/simple;
	bh=9qhX3ljYw+jEShGuQbrvmSlPTh8sGo0TTUXoQCR65ss=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bYar+xo85/zt3Q1BvGYotE9WSRcPsO4tV1rlrAiz2akkd1vzWGZLOiQ9gPNimTvSDuZGqBZrIAIWoHw8dCHtwYHl+qRUuaYntLj7SF9BkXjIU/lyR5jexiSe0HwOfQqVQJe7ozmTMaAqKvG678mVtNYJqq/epFPArhCcg/WpuHw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aTa5peiK; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aTa5peiK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1735066137; x=1766602137;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=9qhX3ljYw+jEShGuQbrvmSlPTh8sGo0TTUXoQCR65ss=;
  b=aTa5peiKNQwThK1fiq+FivI5OoRvLjqnz8xkq3TCdgzEaJE3pFgw+Pk7
   hQOV8sCcUoyTsqbBpNQp8uVeBBvWQpl24/BfevijAWU+5z+vHVUVx4CFa
   9JmW8D/Kf75Wb7nMB20FsE1tpDPD0UHGq9zvHcvVox1JrkguiBqIBq2Su
   WoqIfBmGrn+eL47OVEwbPiLAztxqIhQ5g16yhUv+M5HI54TUTPouUdcTL
   V2KmhnlCDbdgOtAcAKxFFNGP7pNOqjejxj96Q1OQnQfdIVhjnI0h5l5BG
   P4cr7f0IN6IqDPnAiIwLgE95HNYaHmKG0R9zRNPYxxTvxYiJ48oGCFLck
   A==;
X-CSE-ConnectionGUID: 7A3/cSF2RgKJHvGHW8fNyQ==
X-CSE-MsgGUID: Na3GGvW5S96eVXU1aNkLLg==
X-IronPort-AV: E=McAfee;i="6700,10204,11296"; a="35754849"
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="35754849"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 Dec 2024 10:48:56 -0800
X-CSE-ConnectionGUID: EjBJN9cXQ0SyBLor5hPq+g==
X-CSE-MsgGUID: kZRjMu7jSw2aZmF7SIfDRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,261,1728975600"; 
   d="scan'208";a="99767806"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 24 Dec 2024 10:48:53 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tQ9xa-0001NH-2f;
	Tue, 24 Dec 2024 18:48:50 +0000
Date: Wed, 25 Dec 2024 02:48:32 +0800
From: kernel test robot <lkp@intel.com>
To: Kairui Song <ryncsn@gmail.com>, linux-mm@kvack.org
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Chris Li <chrisl@kernel.org>, Barry Song <v-songbaohua@oppo.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Hugh Dickins <hughd@google.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	"Huang, Ying" <ying.huang@linux.alibaba.com>,
	Nhat Pham <nphamcs@gmail.com>, Johannes Weiner <hannes@cmpxchg.org>,
	Kalesh Singh <kaleshsingh@google.com>, linux-kernel@vger.kernel.org,
	Kairui Song <kasong@tencent.com>
Subject: Re: [PATCH v2 05/13] mm, swap: clean up device availability check
Message-ID: <202412250203.RvEcTtUz-lkp@intel.com>
References: <20241224143811.33462-6-ryncsn@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241224143811.33462-6-ryncsn@gmail.com>

Hi Kairui,

kernel test robot noticed the following build errors:

[auto build test ERROR on akpm-mm/mm-everything]

url:    https://github.com/intel-lab-lkp/linux/commits/Kairui-Song/mm-swap-minor-clean-up-for-swap-entry-allocation/20241224-224136
base:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-everything
patch link:    https://lore.kernel.org/r/20241224143811.33462-6-ryncsn%40gmail.com
patch subject: [PATCH v2 05/13] mm, swap: clean up device availability check
config: arm64-randconfig-001-20241224 (https://download.01.org/0day-ci/archive/20241225/202412250203.RvEcTtUz-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241225/202412250203.RvEcTtUz-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412250203.RvEcTtUz-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/f2fs/data.c: In function 'check_swap_activate':
>> fs/f2fs/data.c:4046:12: error: 'struct swap_info_struct' has no member named 'highest_bit'
    4046 |         sis->highest_bit = cur_lblock - 1;
         |            ^~


vim +4046 fs/f2fs/data.c

859fca6b706e00 Chao Yu              2021-05-26  3940  
0b8fc00601c0d8 Chao Yu              2021-05-26  3941  static int check_swap_activate(struct swap_info_struct *sis,
af4b6b8edf6aad Chao Yu              2020-10-12  3942  				struct file *swap_file, sector_t *span)
af4b6b8edf6aad Chao Yu              2020-10-12  3943  {
af4b6b8edf6aad Chao Yu              2020-10-12  3944  	struct address_space *mapping = swap_file->f_mapping;
af4b6b8edf6aad Chao Yu              2020-10-12  3945  	struct inode *inode = mapping->host;
36e4d95891ed37 huangjianan@oppo.com 2021-03-01  3946  	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
aa4074e8fec4d2 Wu Bo                2024-04-28  3947  	block_t cur_lblock;
aa4074e8fec4d2 Wu Bo                2024-04-28  3948  	block_t last_lblock;
aa4074e8fec4d2 Wu Bo                2024-04-28  3949  	block_t pblock;
aa4074e8fec4d2 Wu Bo                2024-04-28  3950  	block_t lowest_pblock = -1;
aa4074e8fec4d2 Wu Bo                2024-04-28  3951  	block_t highest_pblock = 0;
af4b6b8edf6aad Chao Yu              2020-10-12  3952  	int nr_extents = 0;
aa4074e8fec4d2 Wu Bo                2024-04-28  3953  	unsigned int nr_pblocks;
859fca6b706e00 Chao Yu              2021-05-26  3954  	unsigned int blks_per_sec = BLKS_PER_SEC(sbi);
ca298241bc2293 Jaegeuk Kim          2021-05-11  3955  	unsigned int not_aligned = 0;
36e4d95891ed37 huangjianan@oppo.com 2021-03-01  3956  	int ret = 0;
af4b6b8edf6aad Chao Yu              2020-10-12  3957  
af4b6b8edf6aad Chao Yu              2020-10-12  3958  	/*
af4b6b8edf6aad Chao Yu              2020-10-12  3959  	 * Map all the blocks into the extent list.  This code doesn't try
af4b6b8edf6aad Chao Yu              2020-10-12  3960  	 * to be very smart.
af4b6b8edf6aad Chao Yu              2020-10-12  3961  	 */
af4b6b8edf6aad Chao Yu              2020-10-12  3962  	cur_lblock = 0;
7461f370941802 Chao Yu              2024-11-08  3963  	last_lblock = F2FS_BYTES_TO_BLK(i_size_read(inode));
af4b6b8edf6aad Chao Yu              2020-10-12  3964  
1da66103837077 huangjianan@oppo.com 2021-02-27  3965  	while (cur_lblock < last_lblock && cur_lblock < sis->max) {
b876f4c94c3d16 Jaegeuk Kim          2020-11-24  3966  		struct f2fs_map_blocks map;
859fca6b706e00 Chao Yu              2021-05-26  3967  retry:
af4b6b8edf6aad Chao Yu              2020-10-12  3968  		cond_resched();
af4b6b8edf6aad Chao Yu              2020-10-12  3969  
b876f4c94c3d16 Jaegeuk Kim          2020-11-24  3970  		memset(&map, 0, sizeof(map));
b876f4c94c3d16 Jaegeuk Kim          2020-11-24  3971  		map.m_lblk = cur_lblock;
36e4d95891ed37 huangjianan@oppo.com 2021-03-01  3972  		map.m_len = last_lblock - cur_lblock;
36e4d95891ed37 huangjianan@oppo.com 2021-03-01  3973  		map.m_next_pgofs = NULL;
36e4d95891ed37 huangjianan@oppo.com 2021-03-01  3974  		map.m_next_extent = NULL;
b876f4c94c3d16 Jaegeuk Kim          2020-11-24  3975  		map.m_seg_type = NO_CHECK_TYPE;
36e4d95891ed37 huangjianan@oppo.com 2021-03-01  3976  		map.m_may_create = false;
af4b6b8edf6aad Chao Yu              2020-10-12  3977  
cd8fc5226bef3a Christoph Hellwig    2022-11-28  3978  		ret = f2fs_map_blocks(inode, &map, F2FS_GET_BLOCK_FIEMAP);
af4b6b8edf6aad Chao Yu              2020-10-12  3979  		if (ret)
36e4d95891ed37 huangjianan@oppo.com 2021-03-01  3980  			goto out;
af4b6b8edf6aad Chao Yu              2020-10-12  3981  
af4b6b8edf6aad Chao Yu              2020-10-12  3982  		/* hole */
36e4d95891ed37 huangjianan@oppo.com 2021-03-01  3983  		if (!(map.m_flags & F2FS_MAP_FLAGS)) {
833dcd35453713 Joe Perches          2021-05-26  3984  			f2fs_err(sbi, "Swapfile has holes");
f395183f9544ba Jaegeuk Kim          2021-05-12  3985  			ret = -EINVAL;
36e4d95891ed37 huangjianan@oppo.com 2021-03-01  3986  			goto out;
36e4d95891ed37 huangjianan@oppo.com 2021-03-01  3987  		}
af4b6b8edf6aad Chao Yu              2020-10-12  3988  
b876f4c94c3d16 Jaegeuk Kim          2020-11-24  3989  		pblock = map.m_pblk;
b876f4c94c3d16 Jaegeuk Kim          2020-11-24  3990  		nr_pblocks = map.m_len;
af4b6b8edf6aad Chao Yu              2020-10-12  3991  
aa4074e8fec4d2 Wu Bo                2024-04-28  3992  		if ((pblock - SM_I(sbi)->main_blkaddr) % blks_per_sec ||
aa4074e8fec4d2 Wu Bo                2024-04-28  3993  				nr_pblocks % blks_per_sec ||
9703d69d9d153b Daeho Jeong          2024-02-13  3994  				!f2fs_valid_pinned_area(sbi, pblock)) {
9703d69d9d153b Daeho Jeong          2024-02-13  3995  			bool last_extent = false;
9703d69d9d153b Daeho Jeong          2024-02-13  3996  
ca298241bc2293 Jaegeuk Kim          2021-05-11  3997  			not_aligned++;
859fca6b706e00 Chao Yu              2021-05-26  3998  
859fca6b706e00 Chao Yu              2021-05-26  3999  			nr_pblocks = roundup(nr_pblocks, blks_per_sec);
859fca6b706e00 Chao Yu              2021-05-26  4000  			if (cur_lblock + nr_pblocks > sis->max)
859fca6b706e00 Chao Yu              2021-05-26  4001  				nr_pblocks -= blks_per_sec;
859fca6b706e00 Chao Yu              2021-05-26  4002  
859fca6b706e00 Chao Yu              2021-05-26  4003  			/* this extent is last one */
9703d69d9d153b Daeho Jeong          2024-02-13  4004  			if (!nr_pblocks) {
9703d69d9d153b Daeho Jeong          2024-02-13  4005  				nr_pblocks = last_lblock - cur_lblock;
9703d69d9d153b Daeho Jeong          2024-02-13  4006  				last_extent = true;
ca298241bc2293 Jaegeuk Kim          2021-05-11  4007  			}
36e4d95891ed37 huangjianan@oppo.com 2021-03-01  4008  
859fca6b706e00 Chao Yu              2021-05-26  4009  			ret = f2fs_migrate_blocks(inode, cur_lblock,
859fca6b706e00 Chao Yu              2021-05-26  4010  							nr_pblocks);
9703d69d9d153b Daeho Jeong          2024-02-13  4011  			if (ret) {
9703d69d9d153b Daeho Jeong          2024-02-13  4012  				if (ret == -ENOENT)
9703d69d9d153b Daeho Jeong          2024-02-13  4013  					ret = -EINVAL;
859fca6b706e00 Chao Yu              2021-05-26  4014  				goto out;
9703d69d9d153b Daeho Jeong          2024-02-13  4015  			}
9703d69d9d153b Daeho Jeong          2024-02-13  4016  
9703d69d9d153b Daeho Jeong          2024-02-13  4017  			if (!last_extent)
859fca6b706e00 Chao Yu              2021-05-26  4018  				goto retry;
859fca6b706e00 Chao Yu              2021-05-26  4019  		}
9703d69d9d153b Daeho Jeong          2024-02-13  4020  
af4b6b8edf6aad Chao Yu              2020-10-12  4021  		if (cur_lblock + nr_pblocks >= sis->max)
af4b6b8edf6aad Chao Yu              2020-10-12  4022  			nr_pblocks = sis->max - cur_lblock;
af4b6b8edf6aad Chao Yu              2020-10-12  4023  
af4b6b8edf6aad Chao Yu              2020-10-12  4024  		if (cur_lblock) {	/* exclude the header page */
af4b6b8edf6aad Chao Yu              2020-10-12  4025  			if (pblock < lowest_pblock)
af4b6b8edf6aad Chao Yu              2020-10-12  4026  				lowest_pblock = pblock;
af4b6b8edf6aad Chao Yu              2020-10-12  4027  			if (pblock + nr_pblocks - 1 > highest_pblock)
af4b6b8edf6aad Chao Yu              2020-10-12  4028  				highest_pblock = pblock + nr_pblocks - 1;
af4b6b8edf6aad Chao Yu              2020-10-12  4029  		}
af4b6b8edf6aad Chao Yu              2020-10-12  4030  
af4b6b8edf6aad Chao Yu              2020-10-12  4031  		/*
af4b6b8edf6aad Chao Yu              2020-10-12  4032  		 * We found a PAGE_SIZE-length, PAGE_SIZE-aligned run of blocks
af4b6b8edf6aad Chao Yu              2020-10-12  4033  		 */
af4b6b8edf6aad Chao Yu              2020-10-12  4034  		ret = add_swap_extent(sis, cur_lblock, nr_pblocks, pblock);
af4b6b8edf6aad Chao Yu              2020-10-12  4035  		if (ret < 0)
af4b6b8edf6aad Chao Yu              2020-10-12  4036  			goto out;
af4b6b8edf6aad Chao Yu              2020-10-12  4037  		nr_extents += ret;
af4b6b8edf6aad Chao Yu              2020-10-12  4038  		cur_lblock += nr_pblocks;
af4b6b8edf6aad Chao Yu              2020-10-12  4039  	}
af4b6b8edf6aad Chao Yu              2020-10-12  4040  	ret = nr_extents;
af4b6b8edf6aad Chao Yu              2020-10-12  4041  	*span = 1 + highest_pblock - lowest_pblock;
af4b6b8edf6aad Chao Yu              2020-10-12  4042  	if (cur_lblock == 0)
af4b6b8edf6aad Chao Yu              2020-10-12  4043  		cur_lblock = 1;	/* force Empty message */
af4b6b8edf6aad Chao Yu              2020-10-12  4044  	sis->max = cur_lblock;
af4b6b8edf6aad Chao Yu              2020-10-12  4045  	sis->pages = cur_lblock - 1;
af4b6b8edf6aad Chao Yu              2020-10-12 @4046  	sis->highest_bit = cur_lblock - 1;
af4b6b8edf6aad Chao Yu              2020-10-12  4047  out:
859fca6b706e00 Chao Yu              2021-05-26  4048  	if (not_aligned)
d7e9a9037de27b Daniel Rosenberg     2023-10-02  4049  		f2fs_warn(sbi, "Swapfile (%u) is not align to section: 1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate(%lu * N)",
859fca6b706e00 Chao Yu              2021-05-26  4050  			  not_aligned, blks_per_sec * F2FS_BLKSIZE);
af4b6b8edf6aad Chao Yu              2020-10-12  4051  	return ret;
af4b6b8edf6aad Chao Yu              2020-10-12  4052  }
af4b6b8edf6aad Chao Yu              2020-10-12  4053  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
