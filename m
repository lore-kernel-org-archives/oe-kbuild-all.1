Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1FB31C3030
	for <oe-kbuild-all@lists.linux.dev>; Wed, 23 Oct 2024 16:26:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729700811; cv=none; b=aCe3DAkUx1xZSWGAXDKMbHq0ctoRGT3bS3p77z8QS7Nqw+VlN7r1f9X6T8fbJHdzZ9vnyIf1VQlCQTQHHhl1zsaNiO1tNxjslCmaBup8UtMDKkPaXft1Yx0M9YW1xve26y0exVxs0VR8dRp9bUdMOb5ircjtWD8QieGAKCdMMsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729700811; c=relaxed/simple;
	bh=gmk/LDQRX2LuEfQH1V9GcwW0SHnCk/QDhKzgtIaBCko=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Le1MoQBbvjQNRY7yR5VD6jzq70LI2LEyUNPsciMpl5fU+vtWOI6jAbi9O7BR8lRONidKXPRyDLBaCnRbO44ykEICRHuPpMf+83Y/ob5sTlX77CLSviRqISsdnw4kitHr3/jy32T7VIZOvmczIMLBGnf68spz2Y1Ci2q4w5VOtlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=N2azcrBP; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="N2azcrBP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729700809; x=1761236809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=gmk/LDQRX2LuEfQH1V9GcwW0SHnCk/QDhKzgtIaBCko=;
  b=N2azcrBPte17L4SMsTFCe8IfZpLJhYvIESZncbFrz0p0pQY8o5QFIWXX
   3K0yuWlpg2WbrhF1TReOPAZhuJkCDUIzKHrZ9VchZvI3AGQc6TnqkCfOD
   qEkfuMEpEKmIVwPKFcExLa8SXKu12EJGyYp7WRZP/JX4dHnG2zeERw7u+
   +oZiy0Lygbyd7ZuXen9PVY9A+Y+6pz00rN5guq5kw4zrUOmKP6SKiMN4B
   X46zohQee6y+jyM7cujGsEBKepzSsdhERlyKQ0yf1yQQtXWiapVDqgD95
   qXYyn3c6MjyyvMO3W3Eogxqa2ApCSd29lxSRD7WwJU4x+uEcMdKnEF434
   g==;
X-CSE-ConnectionGUID: 3wSNl6V5Qqm5ezXEX27XGQ==
X-CSE-MsgGUID: xSQweubIRaK7GpOVKDpMVA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="29081150"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; 
   d="scan'208";a="29081150"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 09:26:48 -0700
X-CSE-ConnectionGUID: UQfr1TYAQE6JO24Uji7eQA==
X-CSE-MsgGUID: HeEmsaffQuK0Ur9Q8PQiGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,226,1725346800"; 
   d="scan'208";a="84261176"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 23 Oct 2024 09:26:47 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3eC5-000V9W-0R;
	Wed, 23 Oct 2024 16:26:45 +0000
Date: Thu, 24 Oct 2024 00:26:37 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-xfs:xfs-zoned-rebase 34/58] fs/xfs/xfs_aops.c:208: undefined
 reference to `__umoddi3'
Message-ID: <202410240054.jNFsDYIW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/xfs xfs-zoned-rebase
head:   405a6c19506c51256fe1eafd41128b98ffe566b3
commit: 7d0ae5c0dcfc39db9e13893a83d1947d042b3d4a [34/58] xfs: support zoned RT devices
config: i386-randconfig-001-20241023 (https://download.01.org/0day-ci/archive/20241024/202410240054.jNFsDYIW-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240054.jNFsDYIW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240054.jNFsDYIW-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: fs/xfs/xfs_aops.o: in function `xfs_end_bio':
>> fs/xfs/xfs_aops.c:208: undefined reference to `__umoddi3'
   ld: fs/xfs/xfs_file.o: in function `xfs_dio_zoned_submit_io':
>> fs/xfs/xfs_file.c:609: undefined reference to `__umoddi3'


vim +208 fs/xfs/xfs_aops.c

   191	
   192	void
   193	xfs_end_bio(
   194		struct bio		*bio)
   195	{
   196		struct iomap_ioend	*ioend = iomap_ioend_from_bio(bio);
   197		struct xfs_inode	*ip = XFS_I(ioend->io_inode);
   198		struct xfs_mount	*mp = ip->i_mount;
   199		unsigned long		flags;
   200	
   201		if (bio_op(bio) == REQ_OP_ZONE_APPEND) {
   202			/*
   203			 * Record the actually written block number and make sure we
   204			 * don't merge the first ioened for a zone into the last one
   205			 * for the previous zone.
   206			 */
   207			ioend->io_sector = bio->bi_iter.bi_sector;
 > 208			if (!(xfs_daddr_to_rtb(mp, ioend->io_sector) %
   209			      mp->m_groups[XG_TYPE_RTG].blocks))
   210				ioend->io_flags |= IOMAP_F_BOUNDARY;
   211		}
   212	
   213		spin_lock_irqsave(&ip->i_ioend_lock, flags);
   214		if (list_empty(&ip->i_ioend_list))
   215			WARN_ON_ONCE(!queue_work(mp->m_unwritten_workqueue,
   216						 &ip->i_ioend_work));
   217		list_add_tail(&ioend->io_list, &ip->i_ioend_list);
   218		spin_unlock_irqrestore(&ip->i_ioend_lock, flags);
   219	}
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
