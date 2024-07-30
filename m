Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E942563
	for <oe-kbuild-all@lists.linux.dev>; Tue, 30 Jul 2024 00:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.21
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722301158; cv=none; b=BSu0SoXkQgS6C6+xmHCu76ojb2HwzKH9MQf97pWrAXVgf6QyENQQcRgsFsZMuf3CVMLp7lT2FuQmZdvLMB5JX669vaJvbvO3PJQko7vMX8fPpwsbwcnW+qckJrGMynL5Flkmjzcwfolcq6FgbNrrv4IX7NQP6uOj1U9R6sn/hcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722301158; c=relaxed/simple;
	bh=odaJzfMyzkO6sW8XyS6hcGEHixse4aejyWPFf+SggAM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=FSQMTTVWo3DVNljp+HhtGNX9yPDEH7Ok9cxFCGTQ6alOug0HFJ3s++GZgUahEdVn5kbuzzwPtia12ssLImEm18VSUpo9qoXzxqlHvQ6mghepuJH4PFMJbpIR+w7uo7Ljt/dLh6poL5HeR8R39xJX6NqzkD6uqno6Vm1VqMHZnOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A9IwHI7G; arc=none smtp.client-ip=198.175.65.21
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A9IwHI7G"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1722301157; x=1753837157;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=odaJzfMyzkO6sW8XyS6hcGEHixse4aejyWPFf+SggAM=;
  b=A9IwHI7G9yFJP/imFSB0v+jZi1IhT0foCeNr7LbtKKFHZpyGUbu5lsr5
   5JwOaetRfNsszPsjvhP+0tr6ZsBgWFAJh8dua3Bsm6lB6vj/1ymrUw38F
   SkEDjzPGAUYCLrclXl2TQ575z9E8kTtnwd12LDQxHr5V60DYSoxQh3cCC
   MW37lF/j6P8rRLCUs4Q8K80NVVJMI9N/U6lcp6KnAYmilsd5C7/v5/H3n
   hcNt4Ps7EaUWinVXtQ1WDTNhLlNuC3gukeU0dpbjgKMmR9A3QpUnO4aD+
   xzyDsS7EThXnUpQ1Kp0Z3xUjRhy1po6N1npoK5Gdpp2Hwk/oCVheqz8zn
   Q==;
X-CSE-ConnectionGUID: t9VX2x2BRVG7EkGQYMBfNw==
X-CSE-MsgGUID: WcBBp1FQQ/e3eyXQeEP69Q==
X-IronPort-AV: E=McAfee;i="6700,10204,11148"; a="20041202"
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="20041202"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2024 17:59:14 -0700
X-CSE-ConnectionGUID: 4khnp6p/TU6BKWJeIHB8Rw==
X-CSE-MsgGUID: JlqB53Q5R92p0FtChq1epg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,247,1716274800"; 
   d="scan'208";a="53878941"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 29 Jul 2024 17:59:12 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sYbCo-000sHL-0A;
	Tue, 30 Jul 2024 00:59:10 +0000
Date: Tue, 30 Jul 2024 08:59:00 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-per-rtg-bitmap 15/15] fs/xfs/libxfs/xfs_bmap.c:5211:43:
 error: macro "xfs_rtfree_blocks" passed 4 arguments, but takes just 3
Message-ID: <202407301102.2vF5Ihz1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-per-rtg-bitmap
head:   f30a4a99bd08a8b9f43363a4ae0fdff0677c5d33
commit: f30a4a99bd08a8b9f43363a4ae0fdff0677c5d33 [15/15] xfs: use per-RTG bitmaps and summaries
config: arm-randconfig-002-20240730 (https://download.01.org/0day-ci/archive/20240730/202407301102.2vF5Ihz1-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 14.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240730/202407301102.2vF5Ihz1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407301102.2vF5Ihz1-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/xfs/libxfs/xfs_bmap.c: In function 'xfs_bmap_free_rtblocks':
>> fs/xfs/libxfs/xfs_bmap.c:5211:43: error: macro "xfs_rtfree_blocks" passed 4 arguments, but takes just 3
    5211 |                         del->br_blockcount);
         |                                           ^
   In file included from fs/xfs/libxfs/xfs_bmap.c:24:
   fs/xfs/libxfs/xfs_rtbitmap.h:370:10: note: macro "xfs_rtfree_blocks" defined here
     370 | # define xfs_rtfree_blocks(t,rb,rl)                     (-ENOSYS)
         |          ^~~~~~~~~~~~~~~~~
>> fs/xfs/libxfs/xfs_bmap.c:5210:17: error: 'xfs_rtfree_blocks' undeclared (first use in this function); did you mean 'xfs_btree_block'?
    5210 |         error = xfs_rtfree_blocks(tp, rtg, del->br_startblock,
         |                 ^~~~~~~~~~~~~~~~~
         |                 xfs_btree_block
   fs/xfs/libxfs/xfs_bmap.c:5210:17: note: each undeclared identifier is reported only once for each function it appears in


vim +/xfs_rtfree_blocks +5211 fs/xfs/libxfs/xfs_bmap.c

  5187	
  5188	static int
  5189	xfs_bmap_free_rtblocks(
  5190		struct xfs_trans	*tp,
  5191		struct xfs_bmbt_irec	*del)
  5192	{
  5193		struct xfs_rtgroup	*rtg;
  5194		int			error;
  5195	
  5196		rtg = xfs_rtgroup_grab(tp->t_mountp, 0);
  5197		if (!rtg)
  5198			return -EIO;
  5199	
  5200		/*
  5201		 * Ensure the bitmap and summary inodes are locked and joined to the
  5202		 * transaction before modifying them.
  5203		 */
  5204		if (!(tp->t_flags & XFS_TRANS_RTBITMAP_LOCKED)) {
  5205			tp->t_flags |= XFS_TRANS_RTBITMAP_LOCKED;
  5206			xfs_rtgroup_lock(rtg, XFS_RTGLOCK_BITMAP);
  5207			xfs_rtgroup_trans_join(tp, rtg, XFS_RTGLOCK_BITMAP);
  5208		}
  5209	
> 5210		error = xfs_rtfree_blocks(tp, rtg, del->br_startblock,
> 5211				del->br_blockcount);
  5212		xfs_rtgroup_rele(rtg);
  5213		return error;
  5214	}
  5215	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
