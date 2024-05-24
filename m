Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98B3712EBD5
	for <oe-kbuild-all@lists.linux.dev>; Fri, 24 May 2024 16:31:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716568279; cv=none; b=pnm8ciei16ratbiDww8nnwauico7VuMLpQL+ajAVNverpMumAitfbEnDqDGbiqzBF+L21tqXyFutOVE8jmaLZwVSeFwI79oQPLw96YBSuesA3+0tW/OY5LgJK7fLSVBha9CJYgNVE15o2rRjGFfgxnOXL83w3rfxg1qMyw71ed0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716568279; c=relaxed/simple;
	bh=RFjtk09xe0yHk1E4yvGWEYj9G5ODA2IAg2iUhelc5oY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ckosvr7b6GhEjgP4rBNkqdvmPyCrO6tRMzsHhSpz9fECnO1KZjD2536dWug49adllKORPrCpqXlMEH+XqXU68ckbM4g9lwHLHLgydGbJRpnfkAYQTD3wd3xFU9dN5/LDcdXswRti2oTO6nTCAZgUdaYdd5pMVh0WRpqu4nr7gcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=heoY+UR9; arc=none smtp.client-ip=192.198.163.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="heoY+UR9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1716568278; x=1748104278;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RFjtk09xe0yHk1E4yvGWEYj9G5ODA2IAg2iUhelc5oY=;
  b=heoY+UR9VRw+gOGi87UorM5YpbuOBJSXI0Dn7vmLXYFO3KnXlXRyLsP1
   KhPEF57NiYbTi+6HB5KP7WEop+s9LwSVUzb3N/QsKWMtsaGKFjH3a12jW
   S91ABU1IZ0ws3BiO0DpyeK1+ZjUO8UlT8gT/9JgWRovK//0qhiokAx2DQ
   bATuV+5tGfgisHnmDdiFTwHH0Ct3B/SF0FsG0XzoTHM8ilGms2fs4l7Q1
   afG3eDrDI4aDR1rFS6hNK47aAR1mgP+4QCFdVYWrLXZ1NaH+rydgnu0Dx
   zFFfDmPBTnY9PCfVDEiVwaZtt7Bg3LShjeKRFihl+6rL3SfYqeAWYpRNa
   A==;
X-CSE-ConnectionGUID: 5MeHo7VoRU6VM0TGfXws4Q==
X-CSE-MsgGUID: juJvQWpITuK974MZFYaC+g==
X-IronPort-AV: E=McAfee;i="6600,9927,11082"; a="16789032"
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="16789032"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 24 May 2024 09:31:17 -0700
X-CSE-ConnectionGUID: dktpo60MQby9JsCZJf5c+Q==
X-CSE-MsgGUID: jidQz21ISZqzgmd5GinJHw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,185,1712646000"; 
   d="scan'208";a="34175107"
Received: from unknown (HELO 0610945e7d16) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 24 May 2024 09:31:16 -0700
Received: from kbuild by 0610945e7d16 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sAXp4-0005ez-08;
	Fri, 24 May 2024 16:31:14 +0000
Date: Sat, 25 May 2024 00:30:37 +0800
From: kernel test robot <lkp@intel.com>
To: David Sterba <dsterba@suse.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kdave-btrfs-devel:dev/param-const 48/48] fs/btrfs/super.c:667:41:
 warning: passing argument 1 of 'btrfs_check_mountopts_zoned' discards
 'const' qualifier from pointer target type
Message-ID: <202405250010.UW7X5MH5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kdave/btrfs-devel.git dev/param-const
head:   96da40206d7e27b71b58cca6209a17a61acff478
commit: 96da40206d7e27b71b58cca6209a17a61acff478 [48/48] constify parameters where it's ok
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240525/202405250010.UW7X5MH5-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240525/202405250010.UW7X5MH5-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405250010.UW7X5MH5-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/btrfs/super.c: In function 'btrfs_check_options':
>> fs/btrfs/super.c:667:41: warning: passing argument 1 of 'btrfs_check_mountopts_zoned' discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
     667 |         if (btrfs_check_mountopts_zoned(info, mount_opt))
         |                                         ^~~~
   In file included from fs/btrfs/super.c:47:
   fs/btrfs/zoned.h:132:69: note: expected 'struct btrfs_fs_info *' but argument is of type 'const struct btrfs_fs_info *'
     132 | static inline int btrfs_check_mountopts_zoned(struct btrfs_fs_info *info,
         |                                               ~~~~~~~~~~~~~~~~~~~~~~^~~~


vim +667 fs/btrfs/super.c

d7407606564c59 Misono, Tomohiro 2017-12-14  643  
96da40206d7e27 David Sterba     2024-05-22  644  bool btrfs_check_options(const struct btrfs_fs_info *info, unsigned long *mount_opt,
eddb1a433f2631 Josef Bacik      2023-11-22  645  			 unsigned long flags)
2b41b19dd6d063 Josef Bacik      2023-11-22  646  {
2b41b19dd6d063 Josef Bacik      2023-11-22  647  	bool ret = true;
d7407606564c59 Misono, Tomohiro 2017-12-14  648  
2b41b19dd6d063 Josef Bacik      2023-11-22  649  	if (!(flags & SB_RDONLY) &&
eddb1a433f2631 Josef Bacik      2023-11-22  650  	    (check_ro_option(info, *mount_opt, BTRFS_MOUNT_NOLOGREPLAY, "nologreplay") ||
eddb1a433f2631 Josef Bacik      2023-11-22  651  	     check_ro_option(info, *mount_opt, BTRFS_MOUNT_IGNOREBADROOTS, "ignorebadroots") ||
eddb1a433f2631 Josef Bacik      2023-11-22  652  	     check_ro_option(info, *mount_opt, BTRFS_MOUNT_IGNOREDATACSUMS, "ignoredatacsums")))
2b41b19dd6d063 Josef Bacik      2023-11-22  653  		ret = false;
d7407606564c59 Misono, Tomohiro 2017-12-14  654  
2b41b19dd6d063 Josef Bacik      2023-11-22  655  	if (btrfs_fs_compat_ro(info, FREE_SPACE_TREE) &&
eddb1a433f2631 Josef Bacik      2023-11-22  656  	    !btrfs_raw_test_opt(*mount_opt, FREE_SPACE_TREE) &&
eddb1a433f2631 Josef Bacik      2023-11-22  657  	    !btrfs_raw_test_opt(*mount_opt, CLEAR_CACHE)) {
2b41b19dd6d063 Josef Bacik      2023-11-22  658  		btrfs_err(info, "cannot disable free-space-tree");
2b41b19dd6d063 Josef Bacik      2023-11-22  659  		ret = false;
d7407606564c59 Misono, Tomohiro 2017-12-14  660  	}
2b41b19dd6d063 Josef Bacik      2023-11-22  661  	if (btrfs_fs_compat_ro(info, BLOCK_GROUP_TREE) &&
eddb1a433f2631 Josef Bacik      2023-11-22  662  	     !btrfs_raw_test_opt(*mount_opt, FREE_SPACE_TREE)) {
2b41b19dd6d063 Josef Bacik      2023-11-22  663  		btrfs_err(info, "cannot disable free-space-tree with block-group-tree feature");
2b41b19dd6d063 Josef Bacik      2023-11-22  664  		ret = false;
d7407606564c59 Misono, Tomohiro 2017-12-14  665  	}
2b41b19dd6d063 Josef Bacik      2023-11-22  666  
eddb1a433f2631 Josef Bacik      2023-11-22 @667  	if (btrfs_check_mountopts_zoned(info, mount_opt))
2b41b19dd6d063 Josef Bacik      2023-11-22  668  		ret = false;
2b41b19dd6d063 Josef Bacik      2023-11-22  669  
2b41b19dd6d063 Josef Bacik      2023-11-22  670  	if (!test_bit(BTRFS_FS_STATE_REMOUNTING, &info->fs_state)) {
eddb1a433f2631 Josef Bacik      2023-11-22  671  		if (btrfs_raw_test_opt(*mount_opt, SPACE_CACHE))
2b41b19dd6d063 Josef Bacik      2023-11-22  672  			btrfs_info(info, "disk space caching is enabled");
eddb1a433f2631 Josef Bacik      2023-11-22  673  		if (btrfs_raw_test_opt(*mount_opt, FREE_SPACE_TREE))
2b41b19dd6d063 Josef Bacik      2023-11-22  674  			btrfs_info(info, "using free-space-tree");
36350e95a2b1fe Gu Jinxiang      2018-07-12  675  	}
d7407606564c59 Misono, Tomohiro 2017-12-14  676  
2b41b19dd6d063 Josef Bacik      2023-11-22  677  	return ret;
d7407606564c59 Misono, Tomohiro 2017-12-14  678  }
d7407606564c59 Misono, Tomohiro 2017-12-14  679  

:::::: The code at line 667 was first introduced by commit
:::::: eddb1a433f2631ef211b3253ba7e7aba20310ebc btrfs: add reconfigure callback for fs_context

:::::: TO: Josef Bacik <josef@toxicpanda.com>
:::::: CC: David Sterba <dsterba@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
