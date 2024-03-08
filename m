Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A52A328B6
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Mar 2024 19:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709925363; cv=none; b=FHHlsMX+KWpHdn8rwmHMFYsQ3itPdHldqDnob+kLp8I7Hrn59Cc53as6QVvSTdzfpyaEw/PNpqfIOKWILR2mByUC2SNX3WFrdn07HHJtMQnyu4jmGx25NqunoAMWF5H6U/otuT6n/0h3pvEXvrMKF7J222Hf/BQJUns3CED5zxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709925363; c=relaxed/simple;
	bh=0n+mw274zDEE9q/1SrRI3dnPF6gLVKqXY5oeejr5vcw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=shGOiq1bmGe4Txl89Mq9+oHmGqHJvVZssogkYFMphfsPHvcyVKv63WBwF+y9ixolxzMtB6FbGUDXBThz4LXnIlCNqmXPIDJZbMKq3ycSsYalZQL0WjHCiC6BBsfxibR90oBwt/ffe6qBe1v1RNihRSss0HHDlvRg2JsaBjxZasc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hQftsMkU; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hQftsMkU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709925361; x=1741461361;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=0n+mw274zDEE9q/1SrRI3dnPF6gLVKqXY5oeejr5vcw=;
  b=hQftsMkUgmK29A7Te6svTxn67kEhpBPPOVyDpiKwckJURZShAIAxPZU5
   P6BVvZDB1IJ5J5COeSDLOAH9+OIyk5zfpcjpf0rzcI7auIMzkUMbxon54
   czUhR1BbVaWd3zjxTCrvmF2fgw0mWvC2Lqt6d5bTxrgWnZAGsZnk2z0lO
   AQ0UV2P71lCmi+8ZABOtq7yd4NtxkAqKb454QDhmg/4RTicFrrLKQVWoT
   N5FALIwwAcC6+srOpa6XBeN0lyKGL3dI3UDebygt13yggtfx8uDziYXhA
   QjDUfnmLlgIqzFzrl1JVBwiKw7aPL9tBmQZhJTQyVRgrDsRW9nfoMs804
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4508698"
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="4508698"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 11:16:01 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,110,1708416000"; 
   d="scan'208";a="15138519"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 08 Mar 2024 11:15:59 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rifhF-0006dX-1d;
	Fri, 08 Mar 2024 19:15:57 +0000
Date: Sat, 9 Mar 2024 03:15:54 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fsverity-cleanups-6.9 28/37] fs/xfs/xfs_super.c:670:2:
 error: call to undeclared function 'xfs_verity_destroy_cache'; ISO C99 and
 later do not support implicit function declarations
Message-ID: <202403090346.fU4nprEB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fsverity-cleanups-6.9
head:   0dbdaafd38ae4f4af18c8650ff875d6a39f50bc4
commit: 6265f5ef0aeb4b08acac17ad6e0b1a1293bfd36d [28/37] xfs: cache merkle tree blocks for fsverity via a blobcache
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20240309/202403090346.fU4nprEB-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403090346.fU4nprEB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403090346.fU4nprEB-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/xfs/xfs_super.c:670:2: error: call to undeclared function 'xfs_verity_destroy_cache'; ISO C99 and later do not support implicit function declarations [-Wimplicit-function-declaration]
     670 |         xfs_verity_destroy_cache(ip);
         |         ^
   1 error generated.


vim +/xfs_verity_destroy_cache +670 fs/xfs/xfs_super.c

   653	
   654	/*
   655	 * Now that the generic code is guaranteed not to be accessing
   656	 * the linux inode, we can inactivate and reclaim the inode.
   657	 */
   658	STATIC void
   659	xfs_fs_destroy_inode(
   660		struct inode		*inode)
   661	{
   662		struct xfs_inode	*ip = XFS_I(inode);
   663	
   664		trace_xfs_destroy_inode(ip);
   665	
   666		ASSERT(!rwsem_is_locked(&inode->i_rwsem));
   667		XFS_STATS_INC(ip->i_mount, vn_rele);
   668		XFS_STATS_INC(ip->i_mount, vn_remove);
   669		fsverity_cleanup_inode(inode);
 > 670		xfs_verity_destroy_cache(ip);
   671		xfs_inode_mark_reclaimable(ip);
   672	}
   673	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
