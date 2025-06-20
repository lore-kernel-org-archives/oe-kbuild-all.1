Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF3A5289E3F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Jun 2025 20:21:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750450874; cv=none; b=Z2jra6Ovi0q0LzI6wp56Lasx23B4/3IZORoBiHY7oiRXilklHKguDFKvhbfRDNVamYtWQqVgXdBHgRrHIgtxfkfJwK2+2ode8xotolm6w3VZIzwqBqU0ZQo/c+rz7qAXjHfrjVhq+NxB9Nyfg1pbhjgtjEe47yeSItDPpt8lYG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750450874; c=relaxed/simple;
	bh=UHXusQSTMWfIM0A1Thhc1fqRqgklk8OP57BTTAJxJXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=a75K8maGtuTXciTQUyiELVIQVPyG43/VUsPBit0jHNYbCAGQFEol6aaaZrcb9Ge8GTl+hR5OqkZMTJhx3tp4rKkFdS47go7EZmaFU5+HsQ+iXCjn6e3G3pcw4Vi8JP8yUi8VY60+BTdOsGbGn5bNwzA4MCBMioHytUrbxq5v/JQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dgVuVXjQ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dgVuVXjQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750450873; x=1781986873;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=UHXusQSTMWfIM0A1Thhc1fqRqgklk8OP57BTTAJxJXA=;
  b=dgVuVXjQ+gU9nL9PhSlVcFdTMVhpxK9AHPYucSvCw2YfOlbP6CTQIPV/
   IHU/1MOrUsU7uZKCGL9jVIUmhng2WGki1HlwlJsKKONjTysIVRX2kQv1T
   knYdH8wA9O8opcczfrv+q3qnGUC3nOlYa5xL/ED3Elnl3a39rcZtRAOvI
   pOwaQdi2g6UpYGCR2UUkmkxmDtJVPE9fouQc7baMfAuxdFEchnHEWNivG
   KK4Qb0TBi6J40OOULPDjjXueQshN5sH5aDqBJLSIHEjEYnlfGR9EHLsXb
   NtXucAumKXQcoRqZc1ISsv+inPlOTTl6cM+MfzUoQYob78m58SDkRgKRa
   A==;
X-CSE-ConnectionGUID: itnfcjfERJWnUjFfAtWzqw==
X-CSE-MsgGUID: iqfTHd5SS9+mpW28X4L5pg==
X-IronPort-AV: E=McAfee;i="6800,10657,11469"; a="52868825"
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="52868825"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jun 2025 13:21:10 -0700
X-CSE-ConnectionGUID: JH240Q2eToOO+sa+FpVcNQ==
X-CSE-MsgGUID: nIGOPJ0yRKyXof4eXKGm4w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,252,1744095600"; 
   d="scan'208";a="151302078"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 20 Jun 2025 13:21:09 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uSiEV-000M8I-1a;
	Fri, 20 Jun 2025 20:21:07 +0000
Date: Sat, 21 Jun 2025 04:20:39 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH RFC 4/6] btrfs: implement shutdown ioctl
Message-ID: <202506210335.zlMEobs1-lkp@intel.com>
References: <33a2119f23fd6ced841c619d5467e2e2e4d96cdc.1750397889.git.wqu@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <33a2119f23fd6ced841c619d5467e2e2e4d96cdc.1750397889.git.wqu@suse.com>

Hi Qu,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on kdave/for-next]
[also build test ERROR on brauner-vfs/vfs.all linus/master v6.16-rc2 next-20250620]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Qu-Wenruo/btrfs-introduce-a-new-fs-state-EMERGENCY_SHUTDOWN/20250620-134942
base:   https://git.kernel.org/pub/scm/linux/kernel/git/kdave/linux.git for-next
patch link:    https://lore.kernel.org/r/33a2119f23fd6ced841c619d5467e2e2e4d96cdc.1750397889.git.wqu%40suse.com
patch subject: [PATCH RFC 4/6] btrfs: implement shutdown ioctl
config: arc-randconfig-001-20250621 (https://download.01.org/0day-ci/archive/20250621/202506210335.zlMEobs1-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250621/202506210335.zlMEobs1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506210335.zlMEobs1-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/btrfs/ioctl.c: In function 'btrfs_ioctl':
>> fs/btrfs/ioctl.c:5382:3: error: a label can only be part of a statement and a declaration is not a statement
      u32 flags;
      ^~~


vim +5382 fs/btrfs/ioctl.c

  5225	
  5226	long btrfs_ioctl(struct file *file, unsigned int
  5227			cmd, unsigned long arg)
  5228	{
  5229		struct inode *inode = file_inode(file);
  5230		struct btrfs_fs_info *fs_info = inode_to_fs_info(inode);
  5231		struct btrfs_root *root = BTRFS_I(inode)->root;
  5232		void __user *argp = (void __user *)arg;
  5233	
  5234		switch (cmd) {
  5235		case FS_IOC_GETVERSION:
  5236			return btrfs_ioctl_getversion(inode, argp);
  5237		case FS_IOC_GETFSLABEL:
  5238			return btrfs_ioctl_get_fslabel(fs_info, argp);
  5239		case FS_IOC_SETFSLABEL:
  5240			return btrfs_ioctl_set_fslabel(file, argp);
  5241		case FITRIM:
  5242			return btrfs_ioctl_fitrim(fs_info, argp);
  5243		case BTRFS_IOC_SNAP_CREATE:
  5244			return btrfs_ioctl_snap_create(file, argp, 0);
  5245		case BTRFS_IOC_SNAP_CREATE_V2:
  5246			return btrfs_ioctl_snap_create_v2(file, argp, 0);
  5247		case BTRFS_IOC_SUBVOL_CREATE:
  5248			return btrfs_ioctl_snap_create(file, argp, 1);
  5249		case BTRFS_IOC_SUBVOL_CREATE_V2:
  5250			return btrfs_ioctl_snap_create_v2(file, argp, 1);
  5251		case BTRFS_IOC_SNAP_DESTROY:
  5252			return btrfs_ioctl_snap_destroy(file, argp, false);
  5253		case BTRFS_IOC_SNAP_DESTROY_V2:
  5254			return btrfs_ioctl_snap_destroy(file, argp, true);
  5255		case BTRFS_IOC_SUBVOL_GETFLAGS:
  5256			return btrfs_ioctl_subvol_getflags(BTRFS_I(inode), argp);
  5257		case BTRFS_IOC_SUBVOL_SETFLAGS:
  5258			return btrfs_ioctl_subvol_setflags(file, argp);
  5259		case BTRFS_IOC_DEFAULT_SUBVOL:
  5260			return btrfs_ioctl_default_subvol(file, argp);
  5261		case BTRFS_IOC_DEFRAG:
  5262			return btrfs_ioctl_defrag(file, NULL);
  5263		case BTRFS_IOC_DEFRAG_RANGE:
  5264			return btrfs_ioctl_defrag(file, argp);
  5265		case BTRFS_IOC_RESIZE:
  5266			return btrfs_ioctl_resize(file, argp);
  5267		case BTRFS_IOC_ADD_DEV:
  5268			return btrfs_ioctl_add_dev(fs_info, argp);
  5269		case BTRFS_IOC_RM_DEV:
  5270			return btrfs_ioctl_rm_dev(file, argp);
  5271		case BTRFS_IOC_RM_DEV_V2:
  5272			return btrfs_ioctl_rm_dev_v2(file, argp);
  5273		case BTRFS_IOC_FS_INFO:
  5274			return btrfs_ioctl_fs_info(fs_info, argp);
  5275		case BTRFS_IOC_DEV_INFO:
  5276			return btrfs_ioctl_dev_info(fs_info, argp);
  5277		case BTRFS_IOC_TREE_SEARCH:
  5278			return btrfs_ioctl_tree_search(root, argp);
  5279		case BTRFS_IOC_TREE_SEARCH_V2:
  5280			return btrfs_ioctl_tree_search_v2(root, argp);
  5281		case BTRFS_IOC_INO_LOOKUP:
  5282			return btrfs_ioctl_ino_lookup(root, argp);
  5283		case BTRFS_IOC_INO_PATHS:
  5284			return btrfs_ioctl_ino_to_path(root, argp);
  5285		case BTRFS_IOC_LOGICAL_INO:
  5286			return btrfs_ioctl_logical_to_ino(fs_info, argp, 1);
  5287		case BTRFS_IOC_LOGICAL_INO_V2:
  5288			return btrfs_ioctl_logical_to_ino(fs_info, argp, 2);
  5289		case BTRFS_IOC_SPACE_INFO:
  5290			return btrfs_ioctl_space_info(fs_info, argp);
  5291		case BTRFS_IOC_SYNC: {
  5292			int ret;
  5293	
  5294			ret = btrfs_start_delalloc_roots(fs_info, LONG_MAX, false);
  5295			if (ret)
  5296				return ret;
  5297			ret = btrfs_sync_fs(inode->i_sb, 1);
  5298			/*
  5299			 * There may be work for the cleaner kthread to do (subvolume
  5300			 * deletion, delayed iputs, defrag inodes, etc), so wake it up.
  5301			 */
  5302			wake_up_process(fs_info->cleaner_kthread);
  5303			return ret;
  5304		}
  5305		case BTRFS_IOC_START_SYNC:
  5306			return btrfs_ioctl_start_sync(root, argp);
  5307		case BTRFS_IOC_WAIT_SYNC:
  5308			return btrfs_ioctl_wait_sync(fs_info, argp);
  5309		case BTRFS_IOC_SCRUB:
  5310			return btrfs_ioctl_scrub(file, argp);
  5311		case BTRFS_IOC_SCRUB_CANCEL:
  5312			return btrfs_ioctl_scrub_cancel(fs_info);
  5313		case BTRFS_IOC_SCRUB_PROGRESS:
  5314			return btrfs_ioctl_scrub_progress(fs_info, argp);
  5315		case BTRFS_IOC_BALANCE_V2:
  5316			return btrfs_ioctl_balance(file, argp);
  5317		case BTRFS_IOC_BALANCE_CTL:
  5318			return btrfs_ioctl_balance_ctl(fs_info, arg);
  5319		case BTRFS_IOC_BALANCE_PROGRESS:
  5320			return btrfs_ioctl_balance_progress(fs_info, argp);
  5321		case BTRFS_IOC_SET_RECEIVED_SUBVOL:
  5322			return btrfs_ioctl_set_received_subvol(file, argp);
  5323	#ifdef CONFIG_64BIT
  5324		case BTRFS_IOC_SET_RECEIVED_SUBVOL_32:
  5325			return btrfs_ioctl_set_received_subvol_32(file, argp);
  5326	#endif
  5327		case BTRFS_IOC_SEND:
  5328			return _btrfs_ioctl_send(root, argp, false);
  5329	#if defined(CONFIG_64BIT) && defined(CONFIG_COMPAT)
  5330		case BTRFS_IOC_SEND_32:
  5331			return _btrfs_ioctl_send(root, argp, true);
  5332	#endif
  5333		case BTRFS_IOC_GET_DEV_STATS:
  5334			return btrfs_ioctl_get_dev_stats(fs_info, argp);
  5335		case BTRFS_IOC_QUOTA_CTL:
  5336			return btrfs_ioctl_quota_ctl(file, argp);
  5337		case BTRFS_IOC_QGROUP_ASSIGN:
  5338			return btrfs_ioctl_qgroup_assign(file, argp);
  5339		case BTRFS_IOC_QGROUP_CREATE:
  5340			return btrfs_ioctl_qgroup_create(file, argp);
  5341		case BTRFS_IOC_QGROUP_LIMIT:
  5342			return btrfs_ioctl_qgroup_limit(file, argp);
  5343		case BTRFS_IOC_QUOTA_RESCAN:
  5344			return btrfs_ioctl_quota_rescan(file, argp);
  5345		case BTRFS_IOC_QUOTA_RESCAN_STATUS:
  5346			return btrfs_ioctl_quota_rescan_status(fs_info, argp);
  5347		case BTRFS_IOC_QUOTA_RESCAN_WAIT:
  5348			return btrfs_ioctl_quota_rescan_wait(fs_info);
  5349		case BTRFS_IOC_DEV_REPLACE:
  5350			return btrfs_ioctl_dev_replace(fs_info, argp);
  5351		case BTRFS_IOC_GET_SUPPORTED_FEATURES:
  5352			return btrfs_ioctl_get_supported_features(argp);
  5353		case BTRFS_IOC_GET_FEATURES:
  5354			return btrfs_ioctl_get_features(fs_info, argp);
  5355		case BTRFS_IOC_SET_FEATURES:
  5356			return btrfs_ioctl_set_features(file, argp);
  5357		case BTRFS_IOC_GET_SUBVOL_INFO:
  5358			return btrfs_ioctl_get_subvol_info(inode, argp);
  5359		case BTRFS_IOC_GET_SUBVOL_ROOTREF:
  5360			return btrfs_ioctl_get_subvol_rootref(root, argp);
  5361		case BTRFS_IOC_INO_LOOKUP_USER:
  5362			return btrfs_ioctl_ino_lookup_user(file, argp);
  5363		case FS_IOC_ENABLE_VERITY:
  5364			return fsverity_ioctl_enable(file, (const void __user *)argp);
  5365		case FS_IOC_MEASURE_VERITY:
  5366			return fsverity_ioctl_measure(file, argp);
  5367		case FS_IOC_READ_VERITY_METADATA:
  5368			return fsverity_ioctl_read_metadata(file, argp);
  5369		case BTRFS_IOC_ENCODED_READ:
  5370			return btrfs_ioctl_encoded_read(file, argp, false);
  5371		case BTRFS_IOC_ENCODED_WRITE:
  5372			return btrfs_ioctl_encoded_write(file, argp, false);
  5373	#if defined(CONFIG_64BIT) && defined(CONFIG_COMPAT)
  5374		case BTRFS_IOC_ENCODED_READ_32:
  5375			return btrfs_ioctl_encoded_read(file, argp, true);
  5376		case BTRFS_IOC_ENCODED_WRITE_32:
  5377			return btrfs_ioctl_encoded_write(file, argp, true);
  5378	#endif
  5379		case BTRFS_IOC_SUBVOL_SYNC_WAIT:
  5380			return btrfs_ioctl_subvol_sync(fs_info, argp);
  5381		case BTRFS_IOC_SHUTDOWN:
> 5382			u32 flags;
  5383	
  5384			if (!capable(CAP_SYS_ADMIN))
  5385				return -EPERM;
  5386			if (get_user(flags, (__u32 __user *)arg))
  5387				return -EFAULT;
  5388			return btrfs_emergency_shutdown(fs_info, flags);
  5389		}
  5390	
  5391		return -ENOTTY;
  5392	}
  5393	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
