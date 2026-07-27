Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50D7F3C456F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 27 Jul 2026 06:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785133431; cv=none; b=rEkOiXPW/07Z97E9Ct8ufDyWE2N6iwZDk7BSG/wRIfrahaX3jIqbCWSUFcGBK3RouEStQlkIX2ORONeC6DjaZnzb8DJtY6ikEnfIGB6+fCxyQUmO8eGP+z7nvXwp4DPuYMVG8drurgdR6VpXw5uJBMHnjJuzwf1Eoi32O1gWKJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785133431; c=relaxed/simple;
	bh=rGc1yIU8OuyNJdYN8VTSRlidpeqzu72W8BfJ06+erMs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=JjhUdBxjG8Uzna4Jd+fvHDmnhVFoWMTXY5BcI3gnVpVdDZc1JgJJC+gZxqIugRfiuX41/m0uARn5df10tyddtqvBKQlAXN54Ay1GyTfMk4Ii7D03SB8bv6HgBQutpCXdSlpukhUUZX/wSLb/E2pj+eGiCwVtC7cumi0FAThN9b8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=izI649+/; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="izI649+/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785133427; x=1816669427;
  h=date:from:to:cc:subject:message-id;
  bh=rGc1yIU8OuyNJdYN8VTSRlidpeqzu72W8BfJ06+erMs=;
  b=izI649+/FesfnxXlvQsw8hlPAlP6JgheymqM6UcVWp5dsv6WWheW1pvn
   tkj/vo6HsBR4nWwxZHaTYNUiRkst+ejv0T9Qleww2fjsoZQ0yihUe03pE
   6GWmdHilOKNvghX0/xfoQCPD4Uottu0tJIzY8AoWnrJ33mYdWb8qQ7LFT
   NxcNYpfev6LjnbM8jNu1Z1bP89USx4MRD3kBBQ0nStnIuuOBVtIRSP5c1
   YYC3v/fk0ocbL1tBpI/WOhmr674tV3o36Cn/VLXtc93eDGfm7h4bkYuCO
   w6RLaveSPL8WE0pVR93flTLmpaPuI32+nsMf9kRRr4dNeeHCZiomkp9lR
   g==;
X-CSE-ConnectionGUID: goEnJJnNRoeV+l3P5jRVuA==
X-CSE-MsgGUID: l+qeGRv1QCC06l3lHixX7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11857"; a="97209782"
X-IronPort-AV: E=Sophos;i="6.25,187,1779174000"; 
   d="scan'208";a="97209782"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2026 23:23:44 -0700
X-CSE-ConnectionGUID: Wx/IMu+4QP++nv8liUhvXQ==
X-CSE-MsgGUID: g3wHoQXJS7qxYAV6zXj8eA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,187,1779174000"; 
   d="scan'208";a="282657272"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 26 Jul 2026 23:23:42 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1woEkV-00000000d10-20DY;
	Mon, 27 Jul 2026 06:23:39 +0000
Date: Mon, 27 Jul 2026 14:23:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jan Kara <jack@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev,
 Christian Brauner <christianvanbrauner@gmail.com>,
 Christian Brauner <brauner@kernel.org>
Subject: [brauner-github:vfs.all 224/271] fs/bfs/inode.c:180:48:
 error: 'struct inode' has no member named 'ino'
Message-ID: <202607271427.VTf9zUoq-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/brauner/linux.git vfs.all
head:   000710393edad9c9974ee19ce0e95459137b3c3b
commit: 763d78b5dbba67952960a5f40ad15518c79fae86 [224/271] bfs: Fix data integrity writeout issues
config: nios2-allmodconfig (https://download.01.org/0day-ci/archive/20260727/202607271427.VTf9zUoq-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260727/202607271427.VTf9zUoq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607271427.VTf9zUoq-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/bfs/inode.c: In function 'bfs_sync_inode_metadata':
>> fs/bfs/inode.c:180:48: error: 'struct inode' has no member named 'ino'
     180 |         di = find_inode(inode->i_sb, (u16)inode->ino, &bh);
         |                                                ^~


vim +180 fs/bfs/inode.c

   172	
   173	static int bfs_sync_inode_metadata(struct inode *inode,
   174					   struct writeback_control *wbc)
   175	{
   176		int err = 0;
   177		struct bfs_inode *di;
   178		struct buffer_head *bh;
   179	
 > 180		di = find_inode(inode->i_sb, (u16)inode->ino, &bh);
   181		if (IS_ERR(di))
   182			return PTR_ERR(di);
   183	
   184		sync_dirty_buffer(bh);
   185		if (buffer_write_io_error(bh)) {
   186			err = -EIO;
   187			goto out;
   188		}
   189		err = mmb_sync(&BFS_I(inode)->i_metadata_bhs);
   190	out:
   191		brelse(bh);
   192		return err;
   193	}
   194	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
