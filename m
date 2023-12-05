Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D826E6D1A3
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Dec 2023 19:12:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ntXvevHk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701803552; x=1733339552;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=SCVEwROWpI16Xe4LvrWk022YvjHgKA9aX9TmSNc/f2M=;
  b=ntXvevHk/zbOD8CytW0h8b08ZOR5WCsVTIf05TBI1VG5ZzzMg5+nh0+l
   CLUVnGhZKZtxFWJ8HJ+bDa5UNEerBE3QZwJ3BmnpUibHiggdTia00D2cm
   C7O5f3Q1rRohVLRRGG66nmM+xn0izak/ngpqI5Za0m/QNtqaRrk/sfdpx
   wcj9AUb0qu/K0UoKxjpgoLWdztn6qOkvXbfHocsszoo977RFxwosh8sFC
   0KicaeBkoxiSwtTuMhj5ypK9Q3lDwc3f9m5C7rTFLpzFoLO6fiyXKSuTd
   uTU6TZbnDTzw5g4QHtQifvnlaOLx2yVctZ7vyRUfoZKiMUXUqbQ7u1E/x
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="12662562"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="12662562"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Dec 2023 11:12:32 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10915"; a="889043560"
X-IronPort-AV: E=Sophos;i="6.04,253,1695711600"; 
   d="scan'208";a="889043560"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 05 Dec 2023 11:12:29 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rAaqH-0009b8-1C;
	Tue, 05 Dec 2023 19:12:25 +0000
Date: Wed, 6 Dec 2023 03:11:32 +0800
From: kernel test robot <lkp@intel.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH 4/4] f2fs: let's finish or reset zones all the time
Message-ID: <202312060250.BuWvx8yf-lkp@intel.com>
References: <20231204180428.925779-4-jaegeuk@kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231204180428.925779-4-jaegeuk@kernel.org>

Hi Jaegeuk,

kernel test robot noticed the following build warnings:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on jaegeuk-f2fs/dev linus/master v6.7-rc4 next-20231205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jaegeuk-Kim/f2fs-fix-write-pointers-on-zoned-device-after-roll-forward/20231205-020543
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20231204180428.925779-4-jaegeuk%40kernel.org
patch subject: [PATCH 4/4] f2fs: let's finish or reset zones all the time
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231206/202312060250.BuWvx8yf-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231206/202312060250.BuWvx8yf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312060250.BuWvx8yf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/f2fs/segment.c: In function 'check_zone_write_pointer':
>> fs/f2fs/segment.c:4874:29: warning: variable 'wp_block' set but not used [-Wunused-but-set-variable]
    4874 |         block_t zone_block, wp_block, valid_block_cnt;
         |                             ^~~~~~~~


vim +/wp_block +4874 fs/f2fs/segment.c

  4868	
  4869	static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
  4870					    struct f2fs_dev_info *fdev,
  4871					    struct blk_zone *zone)
  4872	{
  4873		unsigned int zone_segno;
> 4874		block_t zone_block, wp_block, valid_block_cnt;
  4875		unsigned int log_sectors_per_block = sbi->log_blocksize - SECTOR_SHIFT;
  4876		int ret;
  4877	
  4878		if (zone->type != BLK_ZONE_TYPE_SEQWRITE_REQ)
  4879			return 0;
  4880	
  4881		wp_block = fdev->start_blk + (zone->wp >> log_sectors_per_block);
  4882		zone_block = fdev->start_blk + (zone->start >> log_sectors_per_block);
  4883		zone_segno = GET_SEGNO(sbi, zone_block);
  4884	
  4885		/*
  4886		 * Skip check of zones cursegs point to, since
  4887		 * fix_curseg_write_pointer() checks them.
  4888		 */
  4889		if (zone_segno >= MAIN_SEGS(sbi) ||
  4890		    IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, zone_segno)))
  4891			return 0;
  4892	
  4893		/*
  4894		 * Get # of valid block of the zone.
  4895		 */
  4896		valid_block_cnt = get_valid_blocks(sbi, zone_segno, true);
  4897	
  4898		if ((!valid_block_cnt && zone->cond == BLK_ZONE_COND_EMPTY) ||
  4899		    (valid_block_cnt && zone->cond == BLK_ZONE_COND_FULL))
  4900			return 0;
  4901	
  4902		if (!valid_block_cnt) {
  4903			f2fs_notice(sbi, "Zone without valid block has non-zero write "
  4904				    "pointer. Reset the write pointer: cond[0x%x]",
  4905				    zone->cond);
  4906			ret = __f2fs_issue_discard_zone(sbi, fdev->bdev, zone_block,
  4907						zone->len >> log_sectors_per_block);
  4908			if (ret)
  4909				f2fs_err(sbi, "Discard zone failed: %s (errno=%d)",
  4910					 fdev->path, ret);
  4911			return ret;
  4912		}
  4913	
  4914		/*
  4915		 * If there are valid blocks and the write pointer doesn't match
  4916		 * with them, we need to report the inconsistency and fill
  4917		 * the zone till the end to close the zone. This inconsistency
  4918		 * does not cause write error because the zone will not be
  4919		 * selected for write operation until it get discarded.
  4920		 */
  4921		f2fs_notice(sbi, "Valid blocks are not aligned with write "
  4922			    "pointer: valid block[0x%x,0x%x] cond[0x%x]",
  4923			    zone_segno, valid_block_cnt, zone->cond);
  4924	
  4925		ret = blkdev_zone_mgmt(fdev->bdev, REQ_OP_ZONE_FINISH,
  4926					zone->start, zone->len, GFP_NOFS);
  4927		if (ret == -EOPNOTSUPP) {
  4928			ret = blkdev_issue_zeroout(fdev->bdev, zone->wp,
  4929						zone->len - (zone->wp - zone->start),
  4930						GFP_NOFS, 0);
  4931			if (ret)
  4932				f2fs_err(sbi, "Fill up zone failed: %s (errno=%d)",
  4933						fdev->path, ret);
  4934		} else if (ret) {
  4935			f2fs_err(sbi, "Finishing zone failed: %s (errno=%d)",
  4936					fdev->path, ret);
  4937		}
  4938	
  4939		return ret;
  4940	}
  4941	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
