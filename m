Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00C231173F
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Jun 2024 05:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717306663; cv=none; b=XT5zA1a2SCWK8FJOEOdaiAlDfk9QshXfMpMbcR1gikcDvW/OERqrs2/lZ4/3TNrTTTghs22HY+xvpMcAi8iZSHl1Qs+RKZaDeWqMHonbimt7f6nttR2YKl5/1KOPoaE5LY0E0Lr6A30Ov8CUca4eEbg8tq6h3JMujK4T3jEE7oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717306663; c=relaxed/simple;
	bh=bvFR/rxJ9E4NWh8KiyMCYNzG+iXlgGJX0LQXCJJjuxs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HCf69y4arRCntB45JgqIvL9/5m6t6ye8SZmmMd4b1rjkgXIWrpeEcFhdzIhLYDikHJEN/pmDFFdCrn3G/C3eVt5WIoAHO+5zkbKPPmv/RuJoh3dIkjFAIv12jq1fsZxmedX2QQi/Iv/3lIb5lcUGmAvZg/Jzq9POLXuvWGdksm0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mAYgoKjW; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mAYgoKjW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1717306661; x=1748842661;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=bvFR/rxJ9E4NWh8KiyMCYNzG+iXlgGJX0LQXCJJjuxs=;
  b=mAYgoKjWY+w2CDWnyvTESTtSBQg+kfXUmybu5v5P4nBqh81lupvq/qu+
   vhI+pKiwb13M8KZwkr5wMnKQZqK7nRprCdXi5OQ4u4qRwtONS2R29mMml
   PPEA8lvIDkQGGHWM96KN4JMM5TOr2wd+L91FqaP61tLBPLiea3cjeBifF
   CY715U+w3QRQ5niIsansa1KRNGtcBdtJzGIXPvslU7/D2W9JXCtlYqpgO
   OGknUaUpWzCs4Cgm47gfv+25X+qdyyc10Ij23zjcHPlSI5mWuCQdHWD98
   CDVFuHtbZqCf3rDxeJJRz9184PHjLK4aY7qQ8uzahDz+oTAunJYarfYji
   Q==;
X-CSE-ConnectionGUID: goGlu6voTLOuwE96xTvNJw==
X-CSE-MsgGUID: YyTrVPMMRQqB8cNUKJBsWA==
X-IronPort-AV: E=McAfee;i="6600,9927,11090"; a="13941526"
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="13941526"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jun 2024 22:37:40 -0700
X-CSE-ConnectionGUID: J2VvK/aDT+6l4y4edXQ8JA==
X-CSE-MsgGUID: D03HEwEuSfenVHWobhBNMQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,208,1712646000"; 
   d="scan'208";a="41096764"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa004.fm.intel.com with ESMTP; 01 Jun 2024 22:37:39 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sDduS-000Jld-2o;
	Sun, 02 Jun 2024 05:37:36 +0000
Date: Sun, 2 Jun 2024 13:37:34 +0800
From: kernel test robot <lkp@intel.com>
To: Daejun Park <daejun7.park@samsung.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH] f2fs: add support single node section mode
Message-ID: <202406021325.wpSF35nd-lkp@intel.com>
References: <20240531074640epcms2p46c3cf8b7cc4e707948ae200115e28e39@epcms2p4>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240531074640epcms2p46c3cf8b7cc4e707948ae200115e28e39@epcms2p4>

Hi Daejun,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on jaegeuk-f2fs/dev-test]
[also build test WARNING on jaegeuk-f2fs/dev linus/master v6.10-rc1 next-20240531]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Daejun-Park/f2fs-add-support-single-node-section-mode/20240531-154955
base:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git dev-test
patch link:    https://lore.kernel.org/r/20240531074640epcms2p46c3cf8b7cc4e707948ae200115e28e39%40epcms2p4
patch subject: [RFC PATCH] f2fs: add support single node section mode
config: x86_64-randconfig-121-20240602 (https://download.01.org/0day-ci/archive/20240602/202406021325.wpSF35nd-lkp@intel.com/config)
compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240602/202406021325.wpSF35nd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406021325.wpSF35nd-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/f2fs/super.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/f2fs.h):
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in initializer (different base types) @@     expected unsigned long mask @@     got restricted vm_fault_t @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long mask
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned long flags @@     got restricted vm_fault_t [usertype] ret @@
   include/trace/events/f2fs.h:1409:1: sparse:     expected unsigned long flags
   include/trace/events/f2fs.h:1409:1: sparse:     got restricted vm_fault_t [usertype] ret
   fs/f2fs/super.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/f2fs.h):
   include/trace/events/f2fs.h:1121:1: sparse: sparse: cast to restricted blk_opf_t
   include/trace/events/f2fs.h:1121:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1121:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1121:1: sparse: sparse: cast to restricted blk_opf_t
   include/trace/events/f2fs.h:1121:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1121:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1180:1: sparse: sparse: cast to restricted blk_opf_t
   include/trace/events/f2fs.h:1180:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1180:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1180:1: sparse: sparse: cast to restricted blk_opf_t
   include/trace/events/f2fs.h:1180:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1180:1: sparse: sparse: restricted blk_opf_t degrades to integer
   include/trace/events/f2fs.h:1409:1: sparse: sparse: cast to restricted vm_fault_t
   include/trace/events/f2fs.h:1409:1: sparse: sparse: restricted vm_fault_t degrades to integer
   include/trace/events/f2fs.h:1409:1: sparse: sparse: restricted vm_fault_t degrades to integer
>> fs/f2fs/super.c:3686:21: sparse: sparse: restricted __le32 degrades to integer
>> fs/f2fs/super.c:3686:21: sparse: sparse: cast to restricted __le32
   fs/f2fs/super.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/f2fs.h):
   include/trace/events/f2fs.h:1545:1: sparse: sparse: self-comparison always evaluates to false
   include/trace/events/f2fs.h:2313:1: sparse: sparse: self-comparison always evaluates to false
   fs/f2fs/super.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, include/trace/events/f2fs.h):
   include/trace/events/f2fs.h:1545:1: sparse: sparse: self-comparison always evaluates to false
   include/trace/events/f2fs.h:2313:1: sparse: sparse: self-comparison always evaluates to false
   fs/f2fs/super.c:1470:35: sparse: sparse: context imbalance in 'f2fs_drop_inode' - unexpected unlock

vim +3686 fs/f2fs/super.c

  3616	
  3617	int f2fs_sanity_check_ckpt(struct f2fs_sb_info *sbi)
  3618	{
  3619		unsigned int total, fsmeta;
  3620		struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
  3621		struct f2fs_checkpoint *ckpt = F2FS_CKPT(sbi);
  3622		unsigned int ovp_segments, reserved_segments;
  3623		unsigned int main_segs, blocks_per_seg;
  3624		unsigned int sit_segs, nat_segs;
  3625		unsigned int sit_bitmap_size, nat_bitmap_size;
  3626		unsigned int log_blocks_per_seg;
  3627		unsigned int segment_count_main;
  3628		unsigned int cp_pack_start_sum, cp_payload;
  3629		block_t user_block_count, valid_user_blocks;
  3630		block_t avail_node_count, valid_node_count;
  3631		unsigned int nat_blocks, nat_bits_bytes, nat_bits_blocks;
  3632		int i, j;
  3633	
  3634		total = le32_to_cpu(raw_super->segment_count);
  3635		fsmeta = le32_to_cpu(raw_super->segment_count_ckpt);
  3636		sit_segs = le32_to_cpu(raw_super->segment_count_sit);
  3637		fsmeta += sit_segs;
  3638		nat_segs = le32_to_cpu(raw_super->segment_count_nat);
  3639		fsmeta += nat_segs;
  3640		fsmeta += le32_to_cpu(ckpt->rsvd_segment_count);
  3641		fsmeta += le32_to_cpu(raw_super->segment_count_ssa);
  3642	
  3643		if (unlikely(fsmeta >= total))
  3644			return 1;
  3645	
  3646		ovp_segments = le32_to_cpu(ckpt->overprov_segment_count);
  3647		reserved_segments = le32_to_cpu(ckpt->rsvd_segment_count);
  3648	
  3649		if (!f2fs_sb_has_readonly(sbi) &&
  3650				unlikely(fsmeta < F2FS_MIN_META_SEGMENTS ||
  3651				ovp_segments == 0 || reserved_segments == 0)) {
  3652			f2fs_err(sbi, "Wrong layout: check mkfs.f2fs version");
  3653			return 1;
  3654		}
  3655		user_block_count = le64_to_cpu(ckpt->user_block_count);
  3656		segment_count_main = le32_to_cpu(raw_super->segment_count_main) +
  3657				(f2fs_sb_has_readonly(sbi) ? 1 : 0);
  3658		log_blocks_per_seg = le32_to_cpu(raw_super->log_blocks_per_seg);
  3659		if (!user_block_count || user_block_count >=
  3660				segment_count_main << log_blocks_per_seg) {
  3661			f2fs_err(sbi, "Wrong user_block_count: %u",
  3662				 user_block_count);
  3663			return 1;
  3664		}
  3665	
  3666		valid_user_blocks = le64_to_cpu(ckpt->valid_block_count);
  3667		if (valid_user_blocks > user_block_count) {
  3668			f2fs_err(sbi, "Wrong valid_user_blocks: %u, user_block_count: %u",
  3669				 valid_user_blocks, user_block_count);
  3670			return 1;
  3671		}
  3672	
  3673		valid_node_count = le32_to_cpu(ckpt->valid_node_count);
  3674		avail_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
  3675		if (valid_node_count > avail_node_count) {
  3676			f2fs_err(sbi, "Wrong valid_node_count: %u, avail_node_count: %u",
  3677				 valid_node_count, avail_node_count);
  3678			return 1;
  3679		}
  3680	
  3681		main_segs = le32_to_cpu(raw_super->segment_count_main);
  3682		blocks_per_seg = BLKS_PER_SEG(sbi);
  3683	
  3684		for (i = 0; i < NR_CURSEG_NODE_TYPE; i++) {
  3685			/* bypass single node section mode */
> 3686			if (le32_to_cpu(ckpt->cur_node_segno[i] == NULL_SEGNO))
  3687				goto check_data;
  3688			if (le32_to_cpu(ckpt->cur_node_segno[i]) >= main_segs ||
  3689				le16_to_cpu(ckpt->cur_node_blkoff[i]) >= blocks_per_seg)
  3690				return 1;
  3691	
  3692			if (f2fs_sb_has_readonly(sbi))
  3693				goto check_data;
  3694	
  3695			for (j = i + 1; j < NR_CURSEG_NODE_TYPE; j++) {
  3696				if (le32_to_cpu(ckpt->cur_node_segno[i]) ==
  3697					le32_to_cpu(ckpt->cur_node_segno[j])) {
  3698					f2fs_err(sbi, "Node segment (%u, %u) has the same segno: %u",
  3699						 i, j,
  3700						 le32_to_cpu(ckpt->cur_node_segno[i]));
  3701					return 1;
  3702				}
  3703			}
  3704		}
  3705	check_data:
  3706		for (i = 0; i < NR_CURSEG_DATA_TYPE; i++) {
  3707			if (le32_to_cpu(ckpt->cur_data_segno[i]) >= main_segs ||
  3708				le16_to_cpu(ckpt->cur_data_blkoff[i]) >= blocks_per_seg)
  3709				return 1;
  3710	
  3711			if (f2fs_sb_has_readonly(sbi))
  3712				goto skip_cross;
  3713	
  3714			for (j = i + 1; j < NR_CURSEG_DATA_TYPE; j++) {
  3715				if (le32_to_cpu(ckpt->cur_data_segno[i]) ==
  3716					le32_to_cpu(ckpt->cur_data_segno[j])) {
  3717					f2fs_err(sbi, "Data segment (%u, %u) has the same segno: %u",
  3718						 i, j,
  3719						 le32_to_cpu(ckpt->cur_data_segno[i]));
  3720					return 1;
  3721				}
  3722			}
  3723		}
  3724		for (i = 0; i < NR_CURSEG_NODE_TYPE; i++) {
  3725			for (j = 0; j < NR_CURSEG_DATA_TYPE; j++) {
  3726				if (le32_to_cpu(ckpt->cur_node_segno[i]) ==
  3727					le32_to_cpu(ckpt->cur_data_segno[j])) {
  3728					f2fs_err(sbi, "Node segment (%u) and Data segment (%u) has the same segno: %u",
  3729						 i, j,
  3730						 le32_to_cpu(ckpt->cur_node_segno[i]));
  3731					return 1;
  3732				}
  3733			}
  3734		}
  3735	skip_cross:
  3736		sit_bitmap_size = le32_to_cpu(ckpt->sit_ver_bitmap_bytesize);
  3737		nat_bitmap_size = le32_to_cpu(ckpt->nat_ver_bitmap_bytesize);
  3738	
  3739		if (sit_bitmap_size != ((sit_segs / 2) << log_blocks_per_seg) / 8 ||
  3740			nat_bitmap_size != ((nat_segs / 2) << log_blocks_per_seg) / 8) {
  3741			f2fs_err(sbi, "Wrong bitmap size: sit: %u, nat:%u",
  3742				 sit_bitmap_size, nat_bitmap_size);
  3743			return 1;
  3744		}
  3745	
  3746		cp_pack_start_sum = __start_sum_addr(sbi);
  3747		cp_payload = __cp_payload(sbi);
  3748		if (cp_pack_start_sum < cp_payload + 1 ||
  3749			cp_pack_start_sum > blocks_per_seg - 1 -
  3750				NR_CURSEG_PERSIST_TYPE) {
  3751			f2fs_err(sbi, "Wrong cp_pack_start_sum: %u",
  3752				 cp_pack_start_sum);
  3753			return 1;
  3754		}
  3755	
  3756		if (__is_set_ckpt_flags(ckpt, CP_LARGE_NAT_BITMAP_FLAG) &&
  3757			le32_to_cpu(ckpt->checksum_offset) != CP_MIN_CHKSUM_OFFSET) {
  3758			f2fs_warn(sbi, "using deprecated layout of large_nat_bitmap, "
  3759				  "please run fsck v1.13.0 or higher to repair, chksum_offset: %u, "
  3760				  "fixed with patch: \"f2fs-tools: relocate chksum_offset for large_nat_bitmap feature\"",
  3761				  le32_to_cpu(ckpt->checksum_offset));
  3762			return 1;
  3763		}
  3764	
  3765		nat_blocks = nat_segs << log_blocks_per_seg;
  3766		nat_bits_bytes = nat_blocks / BITS_PER_BYTE;
  3767		nat_bits_blocks = F2FS_BLK_ALIGN((nat_bits_bytes << 1) + 8);
  3768		if (__is_set_ckpt_flags(ckpt, CP_NAT_BITS_FLAG) &&
  3769			(cp_payload + F2FS_CP_PACKS +
  3770			NR_CURSEG_PERSIST_TYPE + nat_bits_blocks >= blocks_per_seg)) {
  3771			f2fs_warn(sbi, "Insane cp_payload: %u, nat_bits_blocks: %u)",
  3772				  cp_payload, nat_bits_blocks);
  3773			return 1;
  3774		}
  3775	
  3776		if (unlikely(f2fs_cp_error(sbi))) {
  3777			f2fs_err(sbi, "A bug case: need to run fsck");
  3778			return 1;
  3779		}
  3780		return 0;
  3781	}
  3782	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
