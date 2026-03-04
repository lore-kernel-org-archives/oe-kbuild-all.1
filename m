Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 325133CD8A3
	for <oe-kbuild-all@lists.linux.dev>; Wed,  4 Mar 2026 17:51:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772646681; cv=none; b=b8zQX4yv9u0r+sBwpHHaIzLAou+NFwhtQMxmat6TIvjyZ5PNln9Y5A6KI+8AjB0/xqXnHuoF1LV+ObiXHqYsfSXOnCwuW69xAS04vY68xpelOqIBVX9IZO318HwGOr8JqGMyEXSe5KwxO166Axr4PeSLacQrmty/4o8+d/AK9LE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772646681; c=relaxed/simple;
	bh=Vj2G4QK0h89IIfOCSe6X3xABhtFJZyuzt6h+IwoADKc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KLNSYRt7RWhaSAfpY6OuvNZq24OmypFK+gydAZOIXIrlU+W5jbPTwRsZ+N4LJUAgmsBk49fLehzkjoOLBWOqi1fzS7ML8+eFtF6K5FE2wu7bU49zsw7z1A1ewa30YEdZkL2EwrRxr/LmcLR+0Bm368C+VhDuWHVkp4wRmQCLC8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Aaakc+2g; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Aaakc+2g"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1772646678; x=1804182678;
  h=date:from:to:cc:subject:message-id;
  bh=Vj2G4QK0h89IIfOCSe6X3xABhtFJZyuzt6h+IwoADKc=;
  b=Aaakc+2gHfoZRlirIG8NcW9mlDD1RKxIpWW1WZi1B+G3RsYnzEQgtpjv
   eGci4dZRJCnfgt29wnyV4RNX46QtzmdbXA8SomWq3/3qzidsKHme3L+7z
   tdAaRyLweGJ1tCArb9cJXn2n5UDIKhpwspYS3LTNzDxoqBsT4zIfnK0Xh
   WF4681nDOV5G54q9K8QLpUBgynH+XycLKwuK9kjP37djEsmMKKXiliPjy
   qvTtXT5Mydtf/+1xwC01SvcL1OAvin4wpBRXwlbq9gVT72EJOgbkmykgS
   pV/OV6hEhoJvgke8cjKEyW6xxTPmmQKo26rEWa/DRFWXjBwrbqcM6F0dv
   w==;
X-CSE-ConnectionGUID: hMJyb8IJQvCiVaU1bk/SXA==
X-CSE-MsgGUID: ue2AQ13FTeO5LQeM05t9bg==
X-IronPort-AV: E=McAfee;i="6800,10657,11719"; a="73415010"
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="73415010"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2026 09:51:17 -0800
X-CSE-ConnectionGUID: zdrnCXA4QXu15wQ2qI+zWQ==
X-CSE-MsgGUID: 2Zpscho6SMKjJ2DUr9wiEg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,324,1763452800"; 
   d="scan'208";a="217573927"
Received: from lkp-server01.sh.intel.com (HELO f27a57aa7a36) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 04 Mar 2026 09:51:16 -0800
Received: from kbuild by f27a57aa7a36 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vxqNN-000000004Fp-0hQ8;
	Wed, 04 Mar 2026 17:51:13 +0000
Date: Thu, 05 Mar 2026 01:50:34 +0800
From: kernel test robot <lkp@intel.com>
To: Chao Yu <chao@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 "Shin'ichiro Kawasaki" <shinichiro.kawasaki@wdc.com>
Subject: [chao:bugfix/syzbot 2/2] fs/f2fs/super.c:4952:2: error: no
 member named 'dep_map' in 'struct f2fs_rwsem'
Message-ID: <202603050159.IHOm1dgq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
head:   3b19564b95e9ba9803ef30e90eace0977b9d140d
commit: 3b19564b95e9ba9803ef30e90eace0977b9d140d [2/2] f2fs: fix false alarm of lockdep on cp_global_sem lock
config: mips-randconfig-r071-20260304 (https://download.01.org/0day-ci/archive/20260305/202603050159.IHOm1dgq-lkp@intel.com/config)
compiler: clang version 23.0.0git (https://github.com/llvm/llvm-project 9a109fbb6e184ec9bcce10615949f598f4c974a9)
smatch: v0.5.0-9004-gb810ac53
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260305/202603050159.IHOm1dgq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603050159.IHOm1dgq-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/f2fs/super.c:4952:2: error: no member named 'dep_map' in 'struct f2fs_rwsem'
    4952 |         lockdep_set_class(&sbi->cp_global_sem, &sbi->cp_global_sem_key);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:158:33: note: expanded from macro 'lockdep_set_class'
     158 |         lockdep_init_map_type(&(lock)->dep_map, #key, key, 0,   \
         |                                ~~~~~~  ^
>> fs/f2fs/super.c:4952:2: error: no member named 'dep_map' in 'struct f2fs_rwsem'
    4952 |         lockdep_set_class(&sbi->cp_global_sem, &sbi->cp_global_sem_key);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:159:18: note: expanded from macro 'lockdep_set_class'
     159 |                               (lock)->dep_map.wait_type_inner,  \
         |                               ~~~~~~  ^
>> fs/f2fs/super.c:4952:2: error: no member named 'dep_map' in 'struct f2fs_rwsem'
    4952 |         lockdep_set_class(&sbi->cp_global_sem, &sbi->cp_global_sem_key);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:160:18: note: expanded from macro 'lockdep_set_class'
     160 |                               (lock)->dep_map.wait_type_outer,  \
         |                               ~~~~~~  ^
>> fs/f2fs/super.c:4952:2: error: no member named 'dep_map' in 'struct f2fs_rwsem'
    4952 |         lockdep_set_class(&sbi->cp_global_sem, &sbi->cp_global_sem_key);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/lockdep.h:161:18: note: expanded from macro 'lockdep_set_class'
     161 |                               (lock)->dep_map.lock_type)
         |                               ~~~~~~  ^
   4 errors generated.


vim +4952 fs/f2fs/super.c

  4933	
  4934	try_onemore:
  4935		err = -EINVAL;
  4936		raw_super = NULL;
  4937		valid_super_block = -1;
  4938		recovery = 0;
  4939	
  4940		/* allocate memory for f2fs-specific super block info */
  4941		sbi = kzalloc_obj(struct f2fs_sb_info);
  4942		if (!sbi)
  4943			return -ENOMEM;
  4944	
  4945		sbi->sb = sb;
  4946	
  4947		/* initialize locks within allocated memory */
  4948		init_f2fs_rwsem_trace(&sbi->gc_lock, sbi, LOCK_NAME_GC_LOCK);
  4949		mutex_init(&sbi->writepages);
  4950		init_f2fs_rwsem_trace(&sbi->cp_global_sem, sbi, LOCK_NAME_CP_GLOBAL);
  4951	#ifdef CONFIG_DEBUG_LOCK_ALLOC
> 4952		lockdep_set_class(&sbi->cp_global_sem, &sbi->cp_global_sem_key);
  4953	#endif
  4954		init_f2fs_rwsem_trace(&sbi->node_write, sbi, LOCK_NAME_NODE_WRITE);
  4955		init_f2fs_rwsem_trace(&sbi->node_change, sbi, LOCK_NAME_NODE_CHANGE);
  4956		spin_lock_init(&sbi->stat_lock);
  4957		init_f2fs_rwsem_trace(&sbi->cp_rwsem, sbi, LOCK_NAME_CP_RWSEM);
  4958		init_f2fs_rwsem(&sbi->quota_sem);
  4959		init_waitqueue_head(&sbi->cp_wait);
  4960		spin_lock_init(&sbi->error_lock);
  4961	
  4962		for (i = 0; i < NR_INODE_TYPE; i++) {
  4963			INIT_LIST_HEAD(&sbi->inode_list[i]);
  4964			spin_lock_init(&sbi->inode_lock[i]);
  4965		}
  4966		mutex_init(&sbi->flush_lock);
  4967	
  4968		/* set a block size */
  4969		if (unlikely(!sb_set_blocksize(sb, F2FS_BLKSIZE))) {
  4970			f2fs_err(sbi, "unable to set blocksize");
  4971			goto free_sbi;
  4972		}
  4973	
  4974		err = read_raw_super_block(sbi, &raw_super, &valid_super_block,
  4975									&recovery);
  4976		if (err)
  4977			goto free_sbi;
  4978	
  4979		sb->s_fs_info = sbi;
  4980		sbi->raw_super = raw_super;
  4981	
  4982		INIT_WORK(&sbi->s_error_work, f2fs_record_error_work);
  4983		memcpy(sbi->errors, raw_super->s_errors, MAX_F2FS_ERRORS);
  4984		memcpy(sbi->stop_reason, raw_super->s_stop_reason, MAX_STOP_REASON);
  4985	
  4986		/* precompute checksum seed for metadata */
  4987		if (f2fs_sb_has_inode_chksum(sbi))
  4988			sbi->s_chksum_seed = f2fs_chksum(~0, raw_super->uuid,
  4989							 sizeof(raw_super->uuid));
  4990	
  4991		default_options(sbi, false);
  4992	
  4993		err = f2fs_check_opt_consistency(fc, sb);
  4994		if (err)
  4995			goto free_sb_buf;
  4996	
  4997		f2fs_apply_options(fc, sb);
  4998	
  4999		err = f2fs_sanity_check_options(sbi, false);
  5000		if (err)
  5001			goto free_options;
  5002	
  5003		sb->s_maxbytes = max_file_blocks(NULL) <<
  5004					le32_to_cpu(raw_super->log_blocksize);
  5005		sb->s_max_links = F2FS_LINK_MAX;
  5006	
  5007		err = f2fs_setup_casefold(sbi);
  5008		if (err)
  5009			goto free_options;
  5010	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
