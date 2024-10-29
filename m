Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC557DDBE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 19:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730228731; cv=none; b=f4DBE6dJw3LzBUd/YCoVjZOOkRn39+1tlDllY1syPvKqK5RNQBc9+aKjrPvbyHccPT88ygIZShHf28FOvLElsRtI2C59AnF59nnNbQoePP4FIkMbCtPx4jXgoOZ5u6tyo6091GREADQo0xMQXJdl+l45zltAWL6Auim9dx09RuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730228731; c=relaxed/simple;
	bh=VTGErv22WP+Ki6WfxhWXSPbH1isgbow77WAsU3LnxNQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tmKQbmI5siWvH1tYcfyQpxVyteNNAeNmPefj5WLjtZ4CKdYOQMqk/XDhrGdG9fO1L4xnyVgbhD4dyWpaL7d+6XBwmfGn4Da/S/wKLDAAuNHDnMzykRKwk6mNw0yv0cIG0sMW4x9k6fow48mLCrSIKQMhKZ33/9gx/MARfG5tsGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QS50L20o; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QS50L20o"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730228729; x=1761764729;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VTGErv22WP+Ki6WfxhWXSPbH1isgbow77WAsU3LnxNQ=;
  b=QS50L20o4HSnx9Pkr4CE3iyPZIN60SmMDQQNPFMhkbZauVB1yWkJJFpc
   fY85Muk4GMK86M2Vvkkd+Nqfu+YEEwVW2cEfhe7N1FqIliVvqhgOncWii
   2gLegNh8G0kasI97A5UnxWfSKOifk1DYznuAE9i2yHNsHP0sMeo9iyCNO
   uoWnKZKmzKV5cGjRy9aYGqjGbVo905fBwmtIv/vJgq2hSuh+pgcvps3PA
   R46EPglvMuNxsfnSENGNwZSgZQMkO3QrAxE2x9Ol2BM2eV3erkXDRk5uz
   UxramdGN1k5DVmxTcPY18hOwqPTL0fi1qtpLqSXQb6iBkc9WAp75+wwOg
   w==;
X-CSE-ConnectionGUID: S5ggI/3XRvm6LqIilXYoAg==
X-CSE-MsgGUID: k676F9H7SlOjI53zlvBOcw==
X-IronPort-AV: E=McAfee;i="6700,10204,11240"; a="41295850"
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="41295850"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2024 12:05:23 -0700
X-CSE-ConnectionGUID: LSARTVBHTEa1ih8ZXQOOaQ==
X-CSE-MsgGUID: tb89gh//RiyRKEMXftug1Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,241,1725346800"; 
   d="scan'208";a="105396747"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 29 Oct 2024 12:05:22 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5rWq-000e1k-0M;
	Tue, 29 Oct 2024 19:05:20 +0000
Date: Wed, 30 Oct 2024 03:04:26 +0800
From: kernel test robot <lkp@intel.com>
To: David Sterba <dsterba@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kdave-btrfs-devel:misc-next 129/131] fs/btrfs/ioctl.c:5135:27:
 warning: 'root_flags' may be used uninitialized in this function
Message-ID: <202410300221.AccAip00-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   47879c4eb900772de686a74b6cf239bcf666ec10
commit: 44e4ecc948dbefdbfae87c864e5a8cccdd8db632 [129/131] btrfs: add new ioctl to wait for cleaned subvolumes
config: x86_64-randconfig-103-20241029 (https://download.01.org/0day-ci/archive/20241030/202410300221.AccAip00-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241030/202410300221.AccAip00-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410300221.AccAip00-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   fs/btrfs/ioctl.c: In function 'btrfs_ioctl_subvol_sync':
>> fs/btrfs/ioctl.c:5135:27: warning: 'root_flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
    5135 |         ASSERT(root_flags & BTRFS_ROOT_SUBVOL_DEAD);
         |                           ^


vim +/root_flags +5135 fs/btrfs/ioctl.c

  5031	
  5032	static int btrfs_ioctl_subvol_sync(struct btrfs_fs_info *fs_info, void __user *argp)
  5033	{
  5034		struct btrfs_root *root;
  5035		struct btrfs_ioctl_subvol_wait args = { 0 };
  5036		signed long sched_ret;
  5037		int refs;
  5038		u64 root_flags;
  5039		bool wait_for_deletion = false;
  5040	
  5041		if (copy_from_user(&args, argp, sizeof(args)))
  5042			return -EFAULT;
  5043	
  5044		switch (args.mode) {
  5045		case BTRFS_SUBVOL_SYNC_WAIT_FOR_QUEUED:
  5046			/*
  5047			 * Wait for the first one deleted that waits until all previous
  5048			 * are cleaned.
  5049			 */
  5050			spin_lock(&fs_info->trans_lock);
  5051			root = list_last_entry(&fs_info->dead_roots, struct btrfs_root, root_list);
  5052			args.subvolid = btrfs_root_id(root);
  5053			spin_unlock(&fs_info->trans_lock);
  5054	
  5055			fallthrough;
  5056		case BTRFS_SUBVOL_SYNC_WAIT_FOR_ONE:
  5057			if ((0 < args.subvolid && args.subvolid < BTRFS_FIRST_FREE_OBJECTID) ||
  5058			    BTRFS_LAST_FREE_OBJECTID < args.subvolid)
  5059				return -EINVAL;
  5060			break;
  5061		case BTRFS_SUBVOL_SYNC_COUNT:
  5062			spin_lock(&fs_info->trans_lock);
  5063			args.count = list_count_nodes(&fs_info->dead_roots);
  5064			spin_unlock(&fs_info->trans_lock);
  5065			if (copy_to_user(argp, &args, sizeof(args)))
  5066				return -EFAULT;
  5067			return 0;
  5068		case BTRFS_SUBVOL_SYNC_PEEK_FIRST:
  5069			spin_lock(&fs_info->trans_lock);
  5070			/* Last in the list was deleted first. */
  5071			if (!list_empty(&fs_info->dead_roots)) {
  5072				root = list_last_entry(&fs_info->dead_roots,
  5073						       struct btrfs_root, root_list);
  5074				args.subvolid = btrfs_root_id(root);
  5075			} else {
  5076				args.subvolid = 0;
  5077			}
  5078			spin_unlock(&fs_info->trans_lock);
  5079			if (copy_to_user(argp, &args, sizeof(args)))
  5080				return -EFAULT;
  5081			return 0;
  5082		case BTRFS_SUBVOL_SYNC_PEEK_LAST:
  5083			spin_lock(&fs_info->trans_lock);
  5084			/* First in the list was deleted last */
  5085			if (!list_empty(&fs_info->dead_roots)) {
  5086				root = list_first_entry(&fs_info->dead_roots,
  5087							struct btrfs_root, root_list);
  5088				args.subvolid = btrfs_root_id(root);
  5089			} else {
  5090				args.subvolid = 0;
  5091			}
  5092			spin_unlock(&fs_info->trans_lock);
  5093			if (copy_to_user(argp, &args, sizeof(args)))
  5094				return -EFAULT;
  5095			return 0;
  5096		default:
  5097			return -EINVAL;
  5098		}
  5099	
  5100		/* 32bit limitation: fs_roots_radix key is not wide enough. */
  5101		if (sizeof(unsigned long) != sizeof(u64) && args.subvolid > U32_MAX)
  5102			return -EOVERFLOW;
  5103	
  5104	wait_again:
  5105		/* Wait for the specific one. */
  5106		if (down_read_interruptible(&fs_info->subvol_sem) == -EINTR)
  5107			return -EINTR;
  5108		refs = -1;
  5109		spin_lock(&fs_info->fs_roots_radix_lock);
  5110		root = radix_tree_lookup(&fs_info->fs_roots_radix, (unsigned long)args.subvolid);
  5111		if (root) {
  5112			spin_lock(&root->root_item_lock);
  5113			refs = btrfs_root_refs(&root->root_item);
  5114			root_flags = btrfs_root_flags(&root->root_item);
  5115			spin_unlock(&root->root_item_lock);
  5116		}
  5117		spin_unlock(&fs_info->fs_roots_radix_lock);
  5118		up_read(&fs_info->subvol_sem);
  5119	
  5120		/* Subvolume not deleted at all. */
  5121		if (refs > 0)
  5122			return -EEXIST;
  5123		/* We've waited and now the subvolume is gone. */
  5124		if (wait_for_deletion && refs == -1) {
  5125			/* Return the one we waited for as the last one. */
  5126			if (copy_to_user(argp, &args, sizeof(args)))
  5127				return -EFAULT;
  5128			return 0;
  5129		}
  5130		/* Subvolume not found on first try (deleted or never existed). */
  5131		if (refs == -1)
  5132			return -ENOENT;
  5133	
  5134		wait_for_deletion = true;
> 5135		ASSERT(root_flags & BTRFS_ROOT_SUBVOL_DEAD);
  5136		sched_ret = schedule_timeout_interruptible(HZ);
  5137		/* Early wake up or error. */
  5138		if (sched_ret != 0)
  5139			return -EINTR;
  5140	
  5141		goto wait_again;
  5142	}
  5143	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
