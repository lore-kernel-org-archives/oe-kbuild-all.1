Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 514FF2E0926
	for <oe-kbuild-all@lists.linux.dev>; Sat, 31 Jan 2026 12:09:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769861353; cv=none; b=DoI17qCKxNP2HvniKpAqNLzDtPXnufG3P0vNN3ak5e/cdj3TrYt/PTDV/kAelofcMwUCX38aJmV0I6j5Ya6DwCjxHzAskNkqMGjZdUod3u/8ZP+7LpxnekIHXDupgxqhtvNJB1kCazYLr5dvKjwib4TEYVt7pz8SiGIaE9r3wDI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769861353; c=relaxed/simple;
	bh=Gd1IJmf8ATuAtgwFsFDB2RQFMzNZPi5GihlspIoLOo4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=knd9HGk8Z2Dg7sKKMPNl09MELrusNri8S2SqA5VmqatmIWb7q6d5eT++Qz32Pu7QTQ+m6933JEa5hqY0Mp6CjWDmI8HgB3C9vlCNbWcK+aZTQOLalRn7IkGqgQJD5q5b3rb0UjHUfnXTDNU3Wy8HXCHviD2COt5szNQSzpFBhB4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UwzZIi9P; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UwzZIi9P"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769861351; x=1801397351;
  h=date:from:to:cc:subject:message-id;
  bh=Gd1IJmf8ATuAtgwFsFDB2RQFMzNZPi5GihlspIoLOo4=;
  b=UwzZIi9P21Q9ZK7u1fwR2B4ry0mpc4q5HMQt0N7nCaZUnMc4olDfrKnL
   32gH/8LCcY0cGLY/FJntfVqUld5ecAnRXQH9JQ9SJwddg4d2fCSseZ8r0
   ByEmiF4rJK2WXqHa0rHTRkpJaYdKwl6aQkmw5zLDbDxcKR51PZTEw6Hu7
   LU+QSAdxG3tnGfxDvKbLWA87x1H5YnUggu7LHR4XXDFPBqnJABaKaGRiP
   w3P50Bf678hNRmdcU1vchTDEycBGO3w7c99hOKXu118mi1udVDNYWwSQA
   vQiG0/zDFljX3uSa3jEw+Ni8l3tc5zIyTZbonmf7N8MrBNi3mCgmcoEFo
   g==;
X-CSE-ConnectionGUID: RuMHGfH2T3iZGHlXMdCT0g==
X-CSE-MsgGUID: oY/iyrrVQvmKLk+HNkFO3A==
X-IronPort-AV: E=McAfee;i="6800,10657,11687"; a="71132885"
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="71132885"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2026 04:09:10 -0800
X-CSE-ConnectionGUID: IDk9+VVzTHCHky1DgQ8jyw==
X-CSE-MsgGUID: SvLOzvAYQ66/xlo2uLeTAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,265,1763452800"; 
   d="scan'208";a="208189825"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 31 Jan 2026 04:09:07 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vm9mj-00000000dzs-27QN;
	Sat, 31 Jan 2026 12:09:05 +0000
Date: Sat, 31 Jan 2026 20:08:32 +0800
From: kernel test robot <lkp@intel.com>
To: Johannes Thumshirn <johannes.thumshirn@wdc.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
 Qu Wenruo <wqu@suse.com>, Boris Burkov <boris@bur.io>
Subject: [kdave-btrfs-devel:misc-6.19 185/185] fs/btrfs/bio.c:102:13:
 error: 'struct btrfs_bio' has no member named 'can_use_append'
Message-ID: <202601312043.Z7mrNK4c-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/kdave/btrfs-devel.git misc-6.19
head:   4b40b1c47f9373c11aa1331d647ed915482d6e2c
commit: 4b40b1c47f9373c11aa1331d647ed915482d6e2c [185/185] btrfs: fix copying the flags of btrfs_bio after split
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260131/202601312043.Z7mrNK4c-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260131/202601312043.Z7mrNK4c-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601312043.Z7mrNK4c-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/btrfs/bio.c: In function 'btrfs_split_bio':
>> fs/btrfs/bio.c:102:13: error: 'struct btrfs_bio' has no member named 'can_use_append'
     102 |         bbio->can_use_append = orig_bbio->can_use_append;
         |             ^~
   fs/btrfs/bio.c:102:41: error: 'struct btrfs_bio' has no member named 'can_use_append'
     102 |         bbio->can_use_append = orig_bbio->can_use_append;
         |                                         ^~
>> fs/btrfs/bio.c:104:13: error: 'struct btrfs_bio' has no member named 'is_remap'
     104 |         bbio->is_remap = orig_bbio->is_remap;
         |             ^~
   fs/btrfs/bio.c:104:35: error: 'struct btrfs_bio' has no member named 'is_remap'
     104 |         bbio->is_remap = orig_bbio->is_remap;
         |                                   ^~


vim +102 fs/btrfs/bio.c

    78	
    79	static struct btrfs_bio *btrfs_split_bio(struct btrfs_fs_info *fs_info,
    80						 struct btrfs_bio *orig_bbio,
    81						 u64 map_length)
    82	{
    83		struct btrfs_bio *bbio;
    84		struct bio *bio;
    85	
    86		bio = bio_split(&orig_bbio->bio, map_length >> SECTOR_SHIFT, GFP_NOFS,
    87				&btrfs_clone_bioset);
    88		if (IS_ERR(bio))
    89			return ERR_CAST(bio);
    90	
    91		bbio = btrfs_bio(bio);
    92		btrfs_bio_init(bbio, orig_bbio->inode, orig_bbio->file_offset, NULL, orig_bbio);
    93		orig_bbio->file_offset += map_length;
    94		if (bbio_has_ordered_extent(bbio)) {
    95			refcount_inc(&orig_bbio->ordered->refs);
    96			bbio->ordered = orig_bbio->ordered;
    97			bbio->orig_logical = orig_bbio->orig_logical;
    98			orig_bbio->orig_logical += map_length;
    99		}
   100	
   101		bbio->csum_search_commit_root = orig_bbio->csum_search_commit_root;
 > 102		bbio->can_use_append = orig_bbio->can_use_append;
   103		bbio->is_scrub = orig_bbio->is_scrub;
 > 104		bbio->is_remap = orig_bbio->is_remap;
   105		bbio->async_csum = orig_bbio->async_csum;
   106	
   107		atomic_inc(&orig_bbio->pending_ios);
   108		return bbio;
   109	}
   110	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
