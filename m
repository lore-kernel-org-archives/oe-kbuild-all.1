Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 563D9288D7
	for <oe-kbuild-all@lists.linux.dev>; Thu,  8 Feb 2024 20:10:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707423002; cv=none; b=Kf/zATrKyevNmBY1WENzXSB14pjBVRfeeTxtstQtNTKZhXzMr/SnZIz1JDP/wbtPeRskpeaGxSFf8q87HQ9ezLTB7/vEplB93+8COmqAR3PJZTpJWkIVfwTPIT5zUwuotq9ybh5N0CQsZq9mgQWjhCjbWqC4ATxC2cM1S4qHuaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707423002; c=relaxed/simple;
	bh=py5Nk9pY59V5hJiAs6tgXIqNXF3AL/k2Xps+pk82rc8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B+9VlpmcBeQryl9GyT2qPB2YZ4zcFKN5LjwIo6U10fXTuaXR6O6IYjTh7oulxoC/4zegq7istQ7fRvmJaBN0FoAvDRAV/Cv95bjtPcp9sFC3SsSzkYLZobgG43Pi6BhHXsz3C/Xiit1KB1tb8HS4ObXz6YGrlE2sAe2Ryb1YX0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FbkWr7hf; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FbkWr7hf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1707423001; x=1738959001;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=py5Nk9pY59V5hJiAs6tgXIqNXF3AL/k2Xps+pk82rc8=;
  b=FbkWr7hfZu1d/NuPfVoMlMCAzZUm8fgWBSXBFau3RQ6PdXgJ08aP9KKY
   ltE3+mxMdb/5AX/1CxiQSwkH5uNqdkoKLo8ZOqgUMoRo45Jc88Dj0w50U
   kjxxXpo1ElQYyjf8lL0VhXzKPDCRBChEFpy5WBljldyfhAq3p3z0xeISB
   iLUN4e/Lj4izQX9M/lesazkoiPHoX6Xno4i73p1/9O44GvtEC8DUGwpA2
   zD5vvGtKfMyfIlHbLi1YZI4pnQfoR9IBlcGt2rKY+uYrtB3PiadG+LTnV
   kYK5+VkckCZv5fMuIod1cQV8W/oCYQwCPN1xIol6NFvnh2EnvqzXX6afo
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10978"; a="5101732"
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="5101732"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Feb 2024 12:09:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,254,1701158400"; 
   d="scan'208";a="6383576"
Received: from lkp-server01.sh.intel.com (HELO 01f0647817ea) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 08 Feb 2024 12:09:55 -0800
Received: from kbuild by 01f0647817ea with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rYAiX-00045u-3B;
	Thu, 08 Feb 2024 20:09:53 +0000
Date: Fri, 9 Feb 2024 04:09:40 +0800
From: kernel test robot <lkp@intel.com>
To: Kent Overstreet <kent.overstreet@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Dave Chinner <dchinner@redhat.com>
Subject: [brauner-vfs:vfs.uuid 1/7] fs/f2fs/super.c:4499:24: error: passing
 argument 1 of 'super_set_uuid' from incompatible pointer type
Message-ID: <202402090354.8NTymfrK-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git vfs.uuid
head:   f2c1430ccf161782bd8cfb549829a793a3791678
commit: 4d451351605f0f73e5e49284b7bd726e9fb3f515 [1/7] fs: super_set_uuid()
config: m68k-allmodconfig (https://download.01.org/0day-ci/archive/20240209/202402090354.8NTymfrK-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240209/202402090354.8NTymfrK-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402090354.8NTymfrK-lkp@intel.com/

Note: the brauner-vfs/vfs.uuid HEAD f2c1430ccf161782bd8cfb549829a793a3791678 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   fs/f2fs/super.c: In function 'f2fs_fill_super':
>> fs/f2fs/super.c:4499:24: error: passing argument 1 of 'super_set_uuid' from incompatible pointer type [-Werror=incompatible-pointer-types]
    4499 |         super_set_uuid(&sb, (void *) raw_super->uuid, sizeof(raw_super->uuid));
         |                        ^~~
         |                        |
         |                        struct super_block **
   In file included from fs/f2fs/super.c:10:
   include/linux/fs.h:2536:55: note: expected 'struct super_block *' but argument is of type 'struct super_block **'
    2536 | static inline void super_set_uuid(struct super_block *sb, const u8 *uuid, unsigned len)
         |                                   ~~~~~~~~~~~~~~~~~~~~^~
   cc1: some warnings being treated as errors


vim +/super_set_uuid +4499 fs/f2fs/super.c

  4485	
  4486		sb->s_op = &f2fs_sops;
  4487	#ifdef CONFIG_FS_ENCRYPTION
  4488		sb->s_cop = &f2fs_cryptops;
  4489	#endif
  4490	#ifdef CONFIG_FS_VERITY
  4491		sb->s_vop = &f2fs_verityops;
  4492	#endif
  4493		sb->s_xattr = f2fs_xattr_handlers;
  4494		sb->s_export_op = &f2fs_export_ops;
  4495		sb->s_magic = F2FS_SUPER_MAGIC;
  4496		sb->s_time_gran = 1;
  4497		sb->s_flags = (sb->s_flags & ~SB_POSIXACL) |
  4498			(test_opt(sbi, POSIX_ACL) ? SB_POSIXACL : 0);
> 4499		super_set_uuid(&sb, (void *) raw_super->uuid, sizeof(raw_super->uuid));
  4500		sb->s_iflags |= SB_I_CGROUPWB;
  4501	
  4502		/* init f2fs-specific super block info */
  4503		sbi->valid_super_block = valid_super_block;
  4504	
  4505		/* disallow all the data/node/meta page writes */
  4506		set_sbi_flag(sbi, SBI_POR_DOING);
  4507	
  4508		err = f2fs_init_write_merge_io(sbi);
  4509		if (err)
  4510			goto free_bio_info;
  4511	
  4512		init_sb_info(sbi);
  4513	
  4514		err = f2fs_init_iostat(sbi);
  4515		if (err)
  4516			goto free_bio_info;
  4517	
  4518		err = init_percpu_info(sbi);
  4519		if (err)
  4520			goto free_iostat;
  4521	
  4522		if (F2FS_IO_ALIGNED(sbi)) {
  4523			sbi->write_io_dummy =
  4524				mempool_create_page_pool(2 * (F2FS_IO_SIZE(sbi) - 1), 0);
  4525			if (!sbi->write_io_dummy) {
  4526				err = -ENOMEM;
  4527				goto free_percpu;
  4528			}
  4529		}
  4530	
  4531		/* init per sbi slab cache */
  4532		err = f2fs_init_xattr_caches(sbi);
  4533		if (err)
  4534			goto free_io_dummy;
  4535		err = f2fs_init_page_array_cache(sbi);
  4536		if (err)
  4537			goto free_xattr_cache;
  4538	
  4539		/* get an inode for meta space */
  4540		sbi->meta_inode = f2fs_iget(sb, F2FS_META_INO(sbi));
  4541		if (IS_ERR(sbi->meta_inode)) {
  4542			f2fs_err(sbi, "Failed to read F2FS meta data inode");
  4543			err = PTR_ERR(sbi->meta_inode);
  4544			goto free_page_array_cache;
  4545		}
  4546	
  4547		err = f2fs_get_valid_checkpoint(sbi);
  4548		if (err) {
  4549			f2fs_err(sbi, "Failed to get valid F2FS checkpoint");
  4550			goto free_meta_inode;
  4551		}
  4552	
  4553		if (__is_set_ckpt_flags(F2FS_CKPT(sbi), CP_QUOTA_NEED_FSCK_FLAG))
  4554			set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
  4555		if (__is_set_ckpt_flags(F2FS_CKPT(sbi), CP_DISABLED_QUICK_FLAG)) {
  4556			set_sbi_flag(sbi, SBI_CP_DISABLED_QUICK);
  4557			sbi->interval_time[DISABLE_TIME] = DEF_DISABLE_QUICK_INTERVAL;
  4558		}
  4559	
  4560		if (__is_set_ckpt_flags(F2FS_CKPT(sbi), CP_FSCK_FLAG))
  4561			set_sbi_flag(sbi, SBI_NEED_FSCK);
  4562	
  4563		/* Initialize device list */
  4564		err = f2fs_scan_devices(sbi);
  4565		if (err) {
  4566			f2fs_err(sbi, "Failed to find devices");
  4567			goto free_devices;
  4568		}
  4569	
  4570		err = f2fs_init_post_read_wq(sbi);
  4571		if (err) {
  4572			f2fs_err(sbi, "Failed to initialize post read workqueue");
  4573			goto free_devices;
  4574		}
  4575	
  4576		sbi->total_valid_node_count =
  4577					le32_to_cpu(sbi->ckpt->valid_node_count);
  4578		percpu_counter_set(&sbi->total_valid_inode_count,
  4579					le32_to_cpu(sbi->ckpt->valid_inode_count));
  4580		sbi->user_block_count = le64_to_cpu(sbi->ckpt->user_block_count);
  4581		sbi->total_valid_block_count =
  4582					le64_to_cpu(sbi->ckpt->valid_block_count);
  4583		sbi->last_valid_block_count = sbi->total_valid_block_count;
  4584		sbi->reserved_blocks = 0;
  4585		sbi->current_reserved_blocks = 0;
  4586		limit_reserve_root(sbi);
  4587		adjust_unusable_cap_perc(sbi);
  4588	
  4589		f2fs_init_extent_cache_info(sbi);
  4590	
  4591		f2fs_init_ino_entry_info(sbi);
  4592	
  4593		f2fs_init_fsync_node_info(sbi);
  4594	
  4595		/* setup checkpoint request control and start checkpoint issue thread */
  4596		f2fs_init_ckpt_req_control(sbi);
  4597		if (!f2fs_readonly(sb) && !test_opt(sbi, DISABLE_CHECKPOINT) &&
  4598				test_opt(sbi, MERGE_CHECKPOINT)) {
  4599			err = f2fs_start_ckpt_thread(sbi);
  4600			if (err) {
  4601				f2fs_err(sbi,
  4602				    "Failed to start F2FS issue_checkpoint_thread (%d)",
  4603				    err);
  4604				goto stop_ckpt_thread;
  4605			}
  4606		}
  4607	
  4608		/* setup f2fs internal modules */
  4609		err = f2fs_build_segment_manager(sbi);
  4610		if (err) {
  4611			f2fs_err(sbi, "Failed to initialize F2FS segment manager (%d)",
  4612				 err);
  4613			goto free_sm;
  4614		}
  4615		err = f2fs_build_node_manager(sbi);
  4616		if (err) {
  4617			f2fs_err(sbi, "Failed to initialize F2FS node manager (%d)",
  4618				 err);
  4619			goto free_nm;
  4620		}
  4621	
  4622		err = adjust_reserved_segment(sbi);
  4623		if (err)
  4624			goto free_nm;
  4625	
  4626		/* For write statistics */
  4627		sbi->sectors_written_start = f2fs_get_sectors_written(sbi);
  4628	
  4629		/* Read accumulated write IO statistics if exists */
  4630		seg_i = CURSEG_I(sbi, CURSEG_HOT_NODE);
  4631		if (__exist_node_summaries(sbi))
  4632			sbi->kbytes_written =
  4633				le64_to_cpu(seg_i->journal->info.kbytes_written);
  4634	
  4635		f2fs_build_gc_manager(sbi);
  4636	
  4637		err = f2fs_build_stats(sbi);
  4638		if (err)
  4639			goto free_nm;
  4640	
  4641		/* get an inode for node space */
  4642		sbi->node_inode = f2fs_iget(sb, F2FS_NODE_INO(sbi));
  4643		if (IS_ERR(sbi->node_inode)) {
  4644			f2fs_err(sbi, "Failed to read node inode");
  4645			err = PTR_ERR(sbi->node_inode);
  4646			goto free_stats;
  4647		}
  4648	
  4649		/* read root inode and dentry */
  4650		root = f2fs_iget(sb, F2FS_ROOT_INO(sbi));
  4651		if (IS_ERR(root)) {
  4652			f2fs_err(sbi, "Failed to read root inode");
  4653			err = PTR_ERR(root);
  4654			goto free_node_inode;
  4655		}
  4656		if (!S_ISDIR(root->i_mode) || !root->i_blocks ||
  4657				!root->i_size || !root->i_nlink) {
  4658			iput(root);
  4659			err = -EINVAL;
  4660			goto free_node_inode;
  4661		}
  4662	
  4663		sb->s_root = d_make_root(root); /* allocate root dentry */
  4664		if (!sb->s_root) {
  4665			err = -ENOMEM;
  4666			goto free_node_inode;
  4667		}
  4668	
  4669		err = f2fs_init_compress_inode(sbi);
  4670		if (err)
  4671			goto free_root_inode;
  4672	
  4673		err = f2fs_register_sysfs(sbi);
  4674		if (err)
  4675			goto free_compress_inode;
  4676	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
