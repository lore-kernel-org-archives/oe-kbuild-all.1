Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0773C29CA
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Jun 2024 06:16:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719468985; cv=none; b=W35o459n0LlVLQMKptT3BUv+NrkYpDdESwD3dYuecmLslexQh5NTU9UUzeJIpDVxYs+Pk/G071Pn9OVDVdK63VCmSusWrDPJMGwsO4AClNLGwA75F3fYp9hoIB9O68/S2TFvxjmNpqqvmBSjVkmiu6PPYgQdIk180kGVmaOWLog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719468985; c=relaxed/simple;
	bh=xUDqyZGFgT3Ei4PIRYLMa7p+cw0D7RZbZ/mHrYDIWwk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=rsgEzk0w3XfrBTKgz+OLPI+l2Sd7InVdKafgLaaA+5nPIFEYgHJalFuvsvxTnwsqFUtvaXAJl3wCXMrpLVCJQfHEg28L5BcYsJJE9uVcryvcumELWH6zwF8bpkYBAZQ6D9uYkBpJBsfqhODJytJblpKcOiauaZ0b9po4q750Qu4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bLW7zNYS; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bLW7zNYS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1719468984; x=1751004984;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xUDqyZGFgT3Ei4PIRYLMa7p+cw0D7RZbZ/mHrYDIWwk=;
  b=bLW7zNYS5398QxdAsglZfW3QQKCt2lxsd7FbADZ7oCiSKmgDx1kkCVcQ
   4rhWYbjP+w06V96buJ3QVAKznEGE86lV8XX8p1Q0gDjq6dibASFTCn0U2
   NJUaOauTdGWFYMIZK5/O/1qIfdsvB2RwBtyFRhtZGI68bFlN7Nxnhg9/d
   c2DIM3J3lYvn6pvnr4tjCTY2+cpRpy7X07b5BgLZwWL+XSfePF2q0WvDY
   hKLzL6VD9QXkXI79mPluqLWTwPIMiT2bwoNQ2EpON+RXaljvttRNJd1at
   gtDbOBurKyREwMSt2RdNodttkCcLBDEVOBEhbGMlC0g16qAu8mSGE6lKz
   A==;
X-CSE-ConnectionGUID: nNN5zNkpTV22kJG4qyzmfw==
X-CSE-MsgGUID: AJzdxDx1Tx2Vl6R0OfiNAg==
X-IronPort-AV: E=McAfee;i="6700,10204,11115"; a="34109784"
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="34109784"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jun 2024 23:16:23 -0700
X-CSE-ConnectionGUID: llF44r6cRbWQUSlDjoIxIQ==
X-CSE-MsgGUID: /Ne1YL+LSi+LdHMd7qQ3gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,269,1712646000"; 
   d="scan'208";a="44379531"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 26 Jun 2024 23:16:22 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sMiQe-000FyU-0t;
	Thu, 27 Jun 2024 06:16:20 +0000
Date: Thu, 27 Jun 2024 14:15:45 +0800
From: kernel test robot <lkp@intel.com>
To: Qu Wenruo <wqu@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, David Sterba <dsterba@suse.com>,
	Josef Bacik <josef@toxicpanda.com>
Subject: [kdave-btrfs-devel:misc-next 18/21] fs/btrfs/fs.h:229:39: warning:
 left shift count >= width of type
Message-ID: <202406271454.C5EJ4siE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/kdave/btrfs-devel.git misc-next
head:   2eed75cd05c7d61c183d018f3032f20dcff2e986
commit: c7c36d123d0489d845d8727c7e71d851786fb397 [18/21] btrfs: introduce new "rescue=ignoresuperflags" mount option
config: i386-randconfig-001-20240627 (https://download.01.org/0day-ci/archive/20240627/202406271454.C5EJ4siE-lkp@intel.com/config)
compiler: gcc-9 (Ubuntu 9.5.0-4ubuntu2) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240627/202406271454.C5EJ4siE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406271454.C5EJ4siE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/btrfs/ctree.h:20,
                    from fs/btrfs/file.c:20:
>> fs/btrfs/fs.h:229:39: warning: left shift count >= width of type [-Wshift-count-overflow]
     229 |  BTRFS_MOUNT_IGNORESUPERFLAGS  = (1UL << 32),
         |                                       ^~


vim +229 fs/btrfs/fs.h

   190	
   191	/*
   192	 * Flags for mount options.
   193	 *
   194	 * Note: don't forget to add new options to btrfs_show_options()
   195	 */
   196	enum {
   197		BTRFS_MOUNT_NODATASUM			= (1UL << 0),
   198		BTRFS_MOUNT_NODATACOW			= (1UL << 1),
   199		BTRFS_MOUNT_NOBARRIER			= (1UL << 2),
   200		BTRFS_MOUNT_SSD				= (1UL << 3),
   201		BTRFS_MOUNT_DEGRADED			= (1UL << 4),
   202		BTRFS_MOUNT_COMPRESS			= (1UL << 5),
   203		BTRFS_MOUNT_NOTREELOG   		= (1UL << 6),
   204		BTRFS_MOUNT_FLUSHONCOMMIT		= (1UL << 7),
   205		BTRFS_MOUNT_SSD_SPREAD			= (1UL << 8),
   206		BTRFS_MOUNT_NOSSD			= (1UL << 9),
   207		BTRFS_MOUNT_DISCARD_SYNC		= (1UL << 10),
   208		BTRFS_MOUNT_FORCE_COMPRESS      	= (1UL << 11),
   209		BTRFS_MOUNT_SPACE_CACHE			= (1UL << 12),
   210		BTRFS_MOUNT_CLEAR_CACHE			= (1UL << 13),
   211		BTRFS_MOUNT_USER_SUBVOL_RM_ALLOWED	= (1UL << 14),
   212		BTRFS_MOUNT_ENOSPC_DEBUG		= (1UL << 15),
   213		BTRFS_MOUNT_AUTO_DEFRAG			= (1UL << 16),
   214		BTRFS_MOUNT_USEBACKUPROOT		= (1UL << 17),
   215		BTRFS_MOUNT_SKIP_BALANCE		= (1UL << 18),
   216		BTRFS_MOUNT_PANIC_ON_FATAL_ERROR	= (1UL << 19),
   217		BTRFS_MOUNT_RESCAN_UUID_TREE		= (1UL << 20),
   218		BTRFS_MOUNT_FRAGMENT_DATA		= (1UL << 21),
   219		BTRFS_MOUNT_FRAGMENT_METADATA		= (1UL << 22),
   220		BTRFS_MOUNT_FREE_SPACE_TREE		= (1UL << 23),
   221		BTRFS_MOUNT_NOLOGREPLAY			= (1UL << 24),
   222		BTRFS_MOUNT_REF_VERIFY			= (1UL << 25),
   223		BTRFS_MOUNT_DISCARD_ASYNC		= (1UL << 26),
   224		BTRFS_MOUNT_IGNOREBADROOTS		= (1UL << 27),
   225		BTRFS_MOUNT_IGNOREDATACSUMS		= (1UL << 28),
   226		BTRFS_MOUNT_NODISCARD			= (1UL << 29),
   227		BTRFS_MOUNT_NOSPACECACHE		= (1UL << 30),
   228		BTRFS_MOUNT_IGNOREMETACSUMS		= (1UL << 31),
 > 229		BTRFS_MOUNT_IGNORESUPERFLAGS		= (1UL << 32),
   230	};
   231	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
