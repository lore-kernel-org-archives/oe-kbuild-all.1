Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D479185931
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Aug 2024 13:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724418990; cv=none; b=iGFuNNmCBp3o+SBoibZs84hiKV7cI4r1NniYsBwGSaTplFlJwcbuSKxamVISX2TzwxmLQATM8AmvBxvl/q0GsMGof2smGT64GMI82HZHX1f4vC15aKdaRPUqvfOAd0NMN2737BlSy/5nwwd+k7OF5eTJQUNptsjGFjDn/QB1XZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724418990; c=relaxed/simple;
	bh=B2xZynX3kfI++wSxpPNV6K7tsudVOU3Aa/vkMfyM6XI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=A65LSOxpKW7ucOTI9y9z7Vn4DL8py9ZDPydi8o1kH/2uzrr2nCcHjIzXoLj4jJdm+g1IKSOk7P+JrFg/X40ZVaHHjNrDDQzAQrEClTPJ9f7Y7sjoDfURkwe72X6GwZ4+LmKimLWbn0cqWIizQvr8kYUlKJBVQokIkqPAHuukV70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R9FWO9rF; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R9FWO9rF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1724418988; x=1755954988;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B2xZynX3kfI++wSxpPNV6K7tsudVOU3Aa/vkMfyM6XI=;
  b=R9FWO9rFO2UOBDm59rD0lcqJAtw1YQaXZvOnQI5njMqbivAnu8r/HMXI
   MkaHV4eJFfYc9MCJL1K5xW4lWACtqAeZ9NPQCo+jHYO4RSBB9RFEMXJlV
   IOCTiwf/JUi2NutwIMXc+DEV2v9/mWA7HpYNimXo17RD+i9AVHBlJGYFq
   AWTjfgUOHuh5ttzFIqYVy5I/hCxfJW4idk9fiesXOjaoZVRUKZzOBYFJ8
   0gED0Y3dMGuTZYLYEj5dyw50qKrrgP+9Zr9Fqml9Ecw3T2PKOawJmzLVp
   qqRuyNiG8v51fB8N2lol4nYSuhSIEtqUSgVn8A5gPJ5BCtfxjBEw35Trz
   Q==;
X-CSE-ConnectionGUID: QtyyOy9uRaSmGPZvtz25Mw==
X-CSE-MsgGUID: cST6QRI0R/ur5NE2zgkNTA==
X-IronPort-AV: E=McAfee;i="6700,10204,11172"; a="23068783"
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="23068783"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Aug 2024 06:16:28 -0700
X-CSE-ConnectionGUID: tI/ULA85RtGOXDHdGqTYoQ==
X-CSE-MsgGUID: vzua4/StTfC8s7YxY8K2Fw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,170,1719903600"; 
   d="scan'208";a="66491253"
Received: from lkp-server01.sh.intel.com (HELO 9a732dc145d3) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 23 Aug 2024 06:16:27 -0700
Received: from kbuild by 9a732dc145d3 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1shU9R-000DjM-0M;
	Fri, 23 Aug 2024 13:16:25 +0000
Date: Fri, 23 Aug 2024 21:16:03 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:timestats-hoist 116/245] fs/xfs/xfs_mount.h:492:41:
 warning: statement with no effect
Message-ID: <202408232159.A0pM5PWM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git timestats-hoist
head:   2672953f103abef74446981c20b0286f4b3f402f
commit: 4a3f784e7ceb7a7e48afbca39f0cb87b008fcad6 [116/245] xfs: persist quota flags with metadir
config: i386-randconfig-002-20240823 (https://download.01.org/0day-ci/archive/20240823/202408232159.A0pM5PWM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240823/202408232159.A0pM5PWM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202408232159.A0pM5PWM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from fs/xfs/xfs_super.c:13:
   fs/xfs/xfs_super.c: In function 'xfs_fs_fill_super':
>> fs/xfs/xfs_mount.h:492:41: warning: statement with no effect [-Wunused-value]
     492 | # define xfs_set_resuming_quotaon(mp)   (false)
         |                                         ^
   fs/xfs/xfs_super.c:1781:17: note: in expansion of macro 'xfs_set_resuming_quotaon'
    1781 |                 xfs_set_resuming_quotaon(mp);
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~


vim +492 fs/xfs/xfs_mount.h

   478	
   479	__XFS_IS_OPSTATE(unmounting, UNMOUNTING)
   480	__XFS_IS_OPSTATE(clean, CLEAN)
   481	__XFS_IS_OPSTATE(shutdown, SHUTDOWN)
   482	__XFS_IS_OPSTATE(inode32, INODE32)
   483	__XFS_IS_OPSTATE(readonly, READONLY)
   484	__XFS_IS_OPSTATE(inodegc_enabled, INODEGC_ENABLED)
   485	__XFS_IS_OPSTATE(blockgc_enabled, BLOCKGC_ENABLED)
   486	#ifdef CONFIG_XFS_QUOTA
   487	__XFS_IS_OPSTATE(quotacheck_running, QUOTACHECK_RUNNING)
   488	__XFS_IS_OPSTATE(resuming_quotaon, RESUMING_QUOTAON)
   489	#else
   490	# define xfs_is_quotacheck_running(mp)	(false)
   491	# define xfs_is_resuming_quotaon(mp)	(false)
 > 492	# define xfs_set_resuming_quotaon(mp)	(false)
   493	# define xfs_clear_resuming_quotaon(mp)	(false)
   494	#endif
   495	__XFS_IS_OPSTATE(done_with_log_incompat, UNSET_LOG_INCOMPAT)
   496	__XFS_IS_OPSTATE(using_logged_xattrs, USE_LARP)
   497	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
