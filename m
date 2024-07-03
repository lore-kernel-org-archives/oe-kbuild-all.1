Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B81137911
	for <oe-kbuild-all@lists.linux.dev>; Wed,  3 Jul 2024 10:32:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720002753; cv=none; b=FWGjz77u9eRHRPseM/W6D8DKasME5xHGR8rpaU0LYK4l2UiEF/bBwfWtW0E/22b5eStYp0goBJ+4xw6SW1G8KrSIfVD/4sQ0YzLVeZ6SUEqdXRlAIIbsYMkWhwWfnMzGnx5DMSc5m+DtqEOFDm5lazNzkqSVKFbDvEUW4rvZ+n0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720002753; c=relaxed/simple;
	bh=a9l+3EYAb8ZHF1Nt6Svf8hoqYTNoBgtNL7cnf8a5844=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=PUJw9wr/btjvKXajubsc3l6o74i7vW89qBVxFCYhMVL3tnCV+5m5Zd86AWDjjUtiPIPRAmoa3dRNUUX/ReHMH3lFjlg/FMza9eKbcFrrBAdWFYd6JTc0hkTQY7EHph5VKMSytyLAbl/tcdfoLLwHHmSt0lvCyGVMr+iLlocD4v0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=c9mspdaf; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="c9mspdaf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720002752; x=1751538752;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a9l+3EYAb8ZHF1Nt6Svf8hoqYTNoBgtNL7cnf8a5844=;
  b=c9mspdaf1l9JUy8XsXiwY7difgDkbkkicQP/LYLtXb/VtfdpbpdQK4t6
   zujcuZecyQvPq+DscNHEKQTXhwTOe3a8HvtKV0Enhp+rjM5+0J8/iFHr6
   5lc9hBOeR/NG4Nyj3LgZg+RpVzejuQwDt1iYOAEDBdFmmuJBBo4JSJvaz
   9e9G57nUn44m8I1XNyhtLLp9ybi7R62QDlZ0b6pePYYMyNw3kzsqW4XW0
   Y+1k3qDSxJJrPRLO1ZoyczOa2N+AcIKo7Ru1Y/f2kDe7eQCqttt2WIOzR
   Rfygzm6UBJfuJChk4uX5yuwqWEkoJbofpOZXM+mGQS6GOhKP7LBO9CC7R
   A==;
X-CSE-ConnectionGUID: 0Ava1caiSTedtGB94KEKcQ==
X-CSE-MsgGUID: RcGfPHD2REafmUU1HK99XQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11121"; a="28355486"
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="28355486"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2024 03:32:31 -0700
X-CSE-ConnectionGUID: uJKT14EdTdWY3AJo91g+AA==
X-CSE-MsgGUID: Vj6sb/dnTD62AkD2VVqfOw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,181,1716274800"; 
   d="scan'208";a="50823584"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 03 Jul 2024 03:32:29 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sOxHn-000Pcs-0F;
	Wed, 03 Jul 2024 10:32:27 +0000
Date: Wed, 3 Jul 2024 18:31:59 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
	Josef Bacik <josef@toxicpanda.com>
Subject: [kdave-btrfs-devel:misc-next 147/168] fs/btrfs/super.c:666:48:
 sparse: sparse: cast truncates bits from constant value (100000000 becomes
 0)
Message-ID: <202407031800.5vOtyhLt-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   cce58514c6d3eb94c3c7f66ea49b1a9c396eadd5
commit: f548bc3d3d7dcf35d085b624c4a339ef6c08b807 [147/168] btrfs: introduce new "rescue=ignoresuperflags" mount option
config: i386-randconfig-063-20240703 (https://download.01.org/0day-ci/archive/20240703/202407031800.5vOtyhLt-lkp@intel.com/config)
compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project 617a15a9eac96088ae5e9134248d8236e34b91b1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240703/202407031800.5vOtyhLt-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407031800.5vOtyhLt-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   fs/btrfs/super.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/btrfs.h):
   include/trace/events/btrfs.h:2386:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] opf @@     got restricted blk_opf_t enum req_op @@
   include/trace/events/btrfs.h:2386:1: sparse:     expected unsigned char [usertype] opf
   include/trace/events/btrfs.h:2386:1: sparse:     got restricted blk_opf_t enum req_op
   fs/btrfs/super.c: note: in included file (through include/trace/perf.h, include/trace/define_trace.h, include/trace/events/btrfs.h):
   include/trace/events/btrfs.h:2386:1: sparse: sparse: incorrect type in assignment (different base types) @@     expected unsigned char [usertype] opf @@     got restricted blk_opf_t enum req_op @@
   include/trace/events/btrfs.h:2386:1: sparse:     expected unsigned char [usertype] opf
   include/trace/events/btrfs.h:2386:1: sparse:     got restricted blk_opf_t enum req_op
>> fs/btrfs/super.c:666:48: sparse: sparse: cast truncates bits from constant value (100000000 becomes 0)

vim +666 fs/btrfs/super.c

   655	
   656	bool btrfs_check_options(const struct btrfs_fs_info *info, unsigned long *mount_opt,
   657				 unsigned long flags)
   658	{
   659		bool ret = true;
   660	
   661		if (!(flags & SB_RDONLY) &&
   662		    (check_ro_option(info, *mount_opt, BTRFS_MOUNT_NOLOGREPLAY, "nologreplay") ||
   663		     check_ro_option(info, *mount_opt, BTRFS_MOUNT_IGNOREBADROOTS, "ignorebadroots") ||
   664		     check_ro_option(info, *mount_opt, BTRFS_MOUNT_IGNOREDATACSUMS, "ignoredatacsums") ||
   665		     check_ro_option(info, *mount_opt, BTRFS_MOUNT_IGNOREMETACSUMS, "ignoremetacsums") ||
 > 666		     check_ro_option(info, *mount_opt, BTRFS_MOUNT_IGNORESUPERFLAGS, "ignoresuperflags")))
   667			ret = false;
   668	
   669		if (btrfs_fs_compat_ro(info, FREE_SPACE_TREE) &&
   670		    !btrfs_raw_test_opt(*mount_opt, FREE_SPACE_TREE) &&
   671		    !btrfs_raw_test_opt(*mount_opt, CLEAR_CACHE)) {
   672			btrfs_err(info, "cannot disable free-space-tree");
   673			ret = false;
   674		}
   675		if (btrfs_fs_compat_ro(info, BLOCK_GROUP_TREE) &&
   676		     !btrfs_raw_test_opt(*mount_opt, FREE_SPACE_TREE)) {
   677			btrfs_err(info, "cannot disable free-space-tree with block-group-tree feature");
   678			ret = false;
   679		}
   680	
   681		if (btrfs_check_mountopts_zoned(info, mount_opt))
   682			ret = false;
   683	
   684		if (!test_bit(BTRFS_FS_STATE_REMOUNTING, &info->fs_state)) {
   685			if (btrfs_raw_test_opt(*mount_opt, SPACE_CACHE))
   686				btrfs_info(info, "disk space caching is enabled");
   687			if (btrfs_raw_test_opt(*mount_opt, FREE_SPACE_TREE))
   688				btrfs_info(info, "using free-space-tree");
   689		}
   690	
   691		return ret;
   692	}
   693	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
