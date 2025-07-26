Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 369551BCA0E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 26 Jul 2025 01:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753493640; cv=none; b=ayUznHn7FSqEPnPn1wshQbrpTHTvDivGQjzcCLoEXZxXgGJtQS02AqlXmz+26oOXv9Iyp9T31yjgHV4W4oWCyZ6CVeOgefk133zAEDI9gYdbLv4V3+LiOaRoThD+e5vGPkm5gQmVb4fHgP3ymHTq2H+GzUz9YD42zS8nB7LDZRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753493640; c=relaxed/simple;
	bh=Thj/9jcqD/uePigPKqqdDixVt5Pe22s47POE0yQv8b4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=WqRcd5BNxQCe2I9kKeJ0Ri8ezeOUKvfaZqtVcxgSjLfE6o7uObONqgfppTEYGCBmLYZnfc/yODkSm596t6JEkjrv5FY69wXo7U79fmvtmjshYowPpWi9sphy4L0wtWGGSIT7h/9R2IFL1c73A/nxpwjyIHvzRnF490lHs8RzNks=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UuUBi5P+; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UuUBi5P+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753493639; x=1785029639;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Thj/9jcqD/uePigPKqqdDixVt5Pe22s47POE0yQv8b4=;
  b=UuUBi5P+obt92kk3q7yeIa1yK/ZBHgewyo6vX4JNZ71bbcBhyy54bzto
   wF2mj6NZvbVZvh98hJpaPOLIV82SWbqCHpgxtz/GPYF0/F1hNS39vwKRg
   1Q/6btAeTnKPLFSPY1yTSmm2QZcCDyB9LhRv/VIk3YLD7T3xi4bqm7din
   CnYV0uEfUbZRi2H+iSIGD3PJg+t+XOemeX7UHlW1UId7d31q7CvbXZlUp
   4duD2llnhEXnmjolMN7qtEKyrJyN9dDYER4d3Qd+AChgD2a+5Aip37Iww
   uOkDEJ9CCNTDSplhqF8uLZUwkGVIuj2cTPcMvBbLIYHMQtm9vFEVXTtHZ
   w==;
X-CSE-ConnectionGUID: OQREBzcEQT+0JiFkLyEe/A==
X-CSE-MsgGUID: pWYNO3xtQPmks6qIBzJECw==
X-IronPort-AV: E=McAfee;i="6800,10657,11503"; a="55687694"
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="55687694"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2025 18:33:58 -0700
X-CSE-ConnectionGUID: mhc2TZtfRqaD0PRTetPlAA==
X-CSE-MsgGUID: iTN93s/CS+6l7rQEQGiKjQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,339,1744095600"; 
   d="scan'208";a="160427255"
Received: from igk-lkp-server01.igk.intel.com (HELO b3b7d4258b7c) ([10.91.175.65])
  by orviesa006.jf.intel.com with ESMTP; 25 Jul 2025 18:33:57 -0700
Received: from kbuild by b3b7d4258b7c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ufTnN-0000D9-31;
	Sat, 26 Jul 2025 01:33:53 +0000
Date: Sat, 26 Jul 2025 03:33:38 +0200
From: kernel test robot <lkp@intel.com>
To: David Sterba <dsterba@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: fs/btrfs/ioctl.c:5146:21: warning: 'root_flags' may be used
 uninitialized in this function
Message-ID: <202507260324.SWZCjXH8-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   5f33ebd2018ced2600b3fad2f8e2052498eb4072
commit: 6c83d153ed86eb17c46eafe4e78af4ce2071a052 btrfs: add new ioctl to wait for cleaned subvolumes
date:   9 months ago
config: sparc-randconfig-2006-20250726 (https://download.01.org/0day-ci/archive/20250726/202507260324.SWZCjXH8-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250726/202507260324.SWZCjXH8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507260324.SWZCjXH8-lkp@intel.com/

Note: it may well be a FALSE warning. FWIW you are at least aware of it now.
http://gcc.gnu.org/wiki/Better_Uninitialized_Warnings

All warnings (new ones prefixed by >>):

   fs/btrfs/ioctl.c: In function 'btrfs_ioctl_subvol_sync':
>> fs/btrfs/ioctl.c:5146:21: warning: 'root_flags' may be used uninitialized in this function [-Wmaybe-uninitialized]
      ASSERT(root_flags & BTRFS_ROOT_SUBVOL_DEAD);
                        ^


vim +/root_flags +5146 fs/btrfs/ioctl.c

  5029	
  5030	static int btrfs_ioctl_subvol_sync(struct btrfs_fs_info *fs_info, void __user *argp)
  5031	{
  5032		struct btrfs_root *root;
  5033		struct btrfs_ioctl_subvol_wait args = { 0 };
  5034		signed long sched_ret;
  5035		int refs;
  5036		u64 root_flags;
  5037		bool wait_for_deletion = false;
  5038		bool found = false;
  5039	
  5040		if (copy_from_user(&args, argp, sizeof(args)))
  5041			return -EFAULT;
  5042	
  5043		switch (args.mode) {
  5044		case BTRFS_SUBVOL_SYNC_WAIT_FOR_QUEUED:
  5045			/*
  5046			 * Wait for the first one deleted that waits until all previous
  5047			 * are cleaned.
  5048			 */
  5049			spin_lock(&fs_info->trans_lock);
  5050			if (!list_empty(&fs_info->dead_roots)) {
  5051				root = list_last_entry(&fs_info->dead_roots,
  5052						       struct btrfs_root, root_list);
  5053				args.subvolid = btrfs_root_id(root);
  5054				found = true;
  5055			}
  5056			spin_unlock(&fs_info->trans_lock);
  5057			if (!found)
  5058				return -ENOENT;
  5059	
  5060			fallthrough;
  5061		case BTRFS_SUBVOL_SYNC_WAIT_FOR_ONE:
  5062			if ((0 < args.subvolid && args.subvolid < BTRFS_FIRST_FREE_OBJECTID) ||
  5063			    BTRFS_LAST_FREE_OBJECTID < args.subvolid)
  5064				return -EINVAL;
  5065			break;
  5066		case BTRFS_SUBVOL_SYNC_COUNT:
  5067			spin_lock(&fs_info->trans_lock);
  5068			args.count = list_count_nodes(&fs_info->dead_roots);
  5069			spin_unlock(&fs_info->trans_lock);
  5070			if (copy_to_user(argp, &args, sizeof(args)))
  5071				return -EFAULT;
  5072			return 0;
  5073		case BTRFS_SUBVOL_SYNC_PEEK_FIRST:
  5074			spin_lock(&fs_info->trans_lock);
  5075			/* Last in the list was deleted first. */
  5076			if (!list_empty(&fs_info->dead_roots)) {
  5077				root = list_last_entry(&fs_info->dead_roots,
  5078						       struct btrfs_root, root_list);
  5079				args.subvolid = btrfs_root_id(root);
  5080			} else {
  5081				args.subvolid = 0;
  5082			}
  5083			spin_unlock(&fs_info->trans_lock);
  5084			if (copy_to_user(argp, &args, sizeof(args)))
  5085				return -EFAULT;
  5086			return 0;
  5087		case BTRFS_SUBVOL_SYNC_PEEK_LAST:
  5088			spin_lock(&fs_info->trans_lock);
  5089			/* First in the list was deleted last. */
  5090			if (!list_empty(&fs_info->dead_roots)) {
  5091				root = list_first_entry(&fs_info->dead_roots,
  5092							struct btrfs_root, root_list);
  5093				args.subvolid = btrfs_root_id(root);
  5094			} else {
  5095				args.subvolid = 0;
  5096			}
  5097			spin_unlock(&fs_info->trans_lock);
  5098			if (copy_to_user(argp, &args, sizeof(args)))
  5099				return -EFAULT;
  5100			return 0;
  5101		default:
  5102			return -EINVAL;
  5103		}
  5104	
  5105		/* 32bit limitation: fs_roots_radix key is not wide enough. */
  5106		if (sizeof(unsigned long) != sizeof(u64) && args.subvolid > U32_MAX)
  5107			return -EOVERFLOW;
  5108	
  5109		while (1) {
  5110			/* Wait for the specific one. */
  5111			if (down_read_interruptible(&fs_info->subvol_sem) == -EINTR)
  5112				return -EINTR;
  5113			refs = -1;
  5114			spin_lock(&fs_info->fs_roots_radix_lock);
  5115			root = radix_tree_lookup(&fs_info->fs_roots_radix,
  5116						 (unsigned long)args.subvolid);
  5117			if (root) {
  5118				spin_lock(&root->root_item_lock);
  5119				refs = btrfs_root_refs(&root->root_item);
  5120				root_flags = btrfs_root_flags(&root->root_item);
  5121				spin_unlock(&root->root_item_lock);
  5122			}
  5123			spin_unlock(&fs_info->fs_roots_radix_lock);
  5124			up_read(&fs_info->subvol_sem);
  5125	
  5126			/* Subvolume does not exist. */
  5127			if (!root)
  5128				return -ENOENT;
  5129	
  5130			/* Subvolume not deleted at all. */
  5131			if (refs > 0)
  5132				return -EEXIST;
  5133			/* We've waited and now the subvolume is gone. */
  5134			if (wait_for_deletion && refs == -1) {
  5135				/* Return the one we waited for as the last one. */
  5136				if (copy_to_user(argp, &args, sizeof(args)))
  5137					return -EFAULT;
  5138				return 0;
  5139			}
  5140	
  5141			/* Subvolume not found on the first try (deleted or never existed). */
  5142			if (refs == -1)
  5143				return -ENOENT;
  5144	
  5145			wait_for_deletion = true;
> 5146			ASSERT(root_flags & BTRFS_ROOT_SUBVOL_DEAD);
  5147			sched_ret = schedule_timeout_interruptible(HZ);
  5148			/* Early wake up or error. */
  5149			if (sched_ret != 0)
  5150				return -EINTR;
  5151		}
  5152	
  5153		return 0;
  5154	}
  5155	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
