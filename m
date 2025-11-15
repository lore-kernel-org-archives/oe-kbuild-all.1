Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC54D16A956
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Nov 2025 00:29:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763166597; cv=none; b=BYj8T8Rm9Y2TdQh5miAORJ6Jdo3TArldjJbiBG5gUGWUuGQU5/Y3OwQWZrtxLQGQKf0WeoMyN3b76EFCfOLsqkkddUeHzTO4fDNBLRLk9TxsA77Ia1BrTzZUx4u0yF1T2G0+gBNBnHce89fFLepZ/5W/DlbVSsVZJ/Cph/Dj2rk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763166597; c=relaxed/simple;
	bh=AsH7LOrmQEGoGd7k3gf6XWW5EvJ1Z7ueJBcvTh67uRQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GQkWRRwXXfQ08oF0GRTyiNrgqukhMs7Gg9bG7M3umDKhQAx3ivdNPrdxN/YXgFKOrIpIwCeLriElLF+iHtiTpPaRzY3UUZgdTHQp2LUXv3NcohWlwG3Xd/fmPkLYyG4hZ7a1N5PQwYcweDgliyrTrrq6IuHyVV8jxLakaagNQmE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NfpHomzb; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NfpHomzb"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1763166595; x=1794702595;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AsH7LOrmQEGoGd7k3gf6XWW5EvJ1Z7ueJBcvTh67uRQ=;
  b=NfpHomzbS0E9NLx4493KkrpmaitMZ2se8sX4zKHgvR384OOLPedkVOVs
   4kpcXRWQ1Kerso0Pi7sAq2FTOMWFK+4mRvdxmUPdiABMk6gIwG2DH2m/I
   8j0u8am2pulqKCqGhxUCyWLCXLf5nGRjuVFNNA/KbN4ByVBjEkik50e+2
   U257zlZavNtEyReFjZRAoNJyHVOhE0i9jWuvosgNfJ27bfTRBT72bDNfD
   9OSslLu276N5fZTp8GHYBaTWr6Fs/ptAf69+Lj67QMdZwGkNFhif/DcEm
   cWJnSoSB0+ZpcUZJkg2IlijIKU1++XjPvkHusKaWuqj24oXERukZlCjsn
   A==;
X-CSE-ConnectionGUID: 0YfoJQvRSiOhpeyRL4T0XA==
X-CSE-MsgGUID: N+iKZXAZTk2JOri7dsu1AQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11613"; a="82655666"
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="82655666"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Nov 2025 16:29:55 -0800
X-CSE-ConnectionGUID: BjkyWLhQQZG9MH9JGuK6HA==
X-CSE-MsgGUID: HpXykXzhSkSRcJfcm47GZA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,306,1754982000"; 
   d="scan'208";a="189173413"
Received: from lkp-server01.sh.intel.com (HELO 7b01c990427b) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 14 Nov 2025 16:29:54 -0800
Received: from kbuild by 7b01c990427b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vK4Aq-0007WB-04;
	Sat, 15 Nov 2025 00:29:52 +0000
Date: Sat, 15 Nov 2025 08:29:47 +0800
From: kernel test robot <lkp@intel.com>
To: Christoph Hellwig <hch@lst.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hch-misc:nfs-delegation-lru 14/20] fs/nfs/delegation.c:861:6:
 warning: variable 'error' is used uninitialized whenever 'if' condition is
 false
Message-ID: <202511150824.P0PWmqe4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.infradead.org/users/hch/misc.git nfs-delegation-lru
head:   09afc7e968dff67a9a0c9c728b08b8478841357d
commit: 5336c4abf5778ff0f1154efe26712d6315c32710 [14/20] NFS: take a delegation reference in nfs4_get_valid_delegation
config: mips-mtx1_defconfig (https://download.01.org/0day-ci/archive/20251115/202511150824.P0PWmqe4-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 0bba1e76581bad04e7d7f09f5115ae5e2989e0d9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251115/202511150824.P0PWmqe4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511150824.P0PWmqe4-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> fs/nfs/delegation.c:861:6: warning: variable 'error' is used uninitialized whenever 'if' condition is false [-Wsometimes-uninitialized]
     861 |         if (!nfs4_has_session(NFS_SERVER(inode)->nfs_client) ||
         |             ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     862 |             !(delegation->type & FMODE_WRITE))
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/nfs/delegation.c:865:9: note: uninitialized use occurs here
     865 |         return error;
         |                ^~~~~
   fs/nfs/delegation.c:861:2: note: remove the 'if' if its condition is always true
     861 |         if (!nfs4_has_session(NFS_SERVER(inode)->nfs_client) ||
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     862 |             !(delegation->type & FMODE_WRITE))
         |             ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     863 |                 error = nfs4_inode_return_delegation(inode);
   fs/nfs/delegation.c:855:11: note: initialize the variable 'error' to silence this warning
     855 |         int error;
         |                  ^
         |                   = 0
   1 warning generated.


vim +861 fs/nfs/delegation.c

   843	
   844	/**
   845	 * nfs4_inode_make_writeable
   846	 * @inode: pointer to inode
   847	 *
   848	 * Make the inode writeable by returning the delegation if necessary
   849	 *
   850	 * Returns zero on success, or a negative errno value.
   851	 */
   852	int nfs4_inode_make_writeable(struct inode *inode)
   853	{
   854		struct nfs_delegation *delegation;
   855		int error;
   856	
   857		delegation = nfs4_get_valid_delegation(inode, 0);
   858		if (!delegation)
   859			return 0;
   860	
 > 861		if (!nfs4_has_session(NFS_SERVER(inode)->nfs_client) ||
   862		    !(delegation->type & FMODE_WRITE))
   863			error = nfs4_inode_return_delegation(inode);
   864		nfs_put_delegation(delegation);
   865		return error;
   866	}
   867	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
