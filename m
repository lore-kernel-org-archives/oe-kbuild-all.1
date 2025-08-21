Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B536A21C9ED
	for <oe-kbuild-all@lists.linux.dev>; Thu, 21 Aug 2025 10:07:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755770852; cv=none; b=C9/fT4bhTf2taMO3IxHu7YF2NpPgrs9QF3X10CzLX355pRblTIGgGCGIEdXavjfL6naD2Cvk1R59hHBwpHFhGQ7vE7nP81/bf6vtURZs014uFkv/R9WjsI6cTJdYxEtE1u0h14LbXH2oAx3RkQHP09q/+tGm6GUU/WOJ4A1I1MU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755770852; c=relaxed/simple;
	bh=/f/94QecEzJSbok6a2PB96bB2GRRMTiOU5dFvEzl6Nw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LUWS2fpe/jXsXaN6zVBa6FhvFwJT7zYZ95BLLOlkG8Y2hv8B3u4ljRrgaEbcF5zHEYlJ5YNeptoqaCXch1dS7A0djrqWFx3Jyekl0ahzEuwNvwETyZ6gKYU7P7MQS2bPleueD/1qegPvj8u/1hKd8Z9QMn2b6A3cPZJaSzsSpSY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gAaw2Equ; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gAaw2Equ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1755770851; x=1787306851;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/f/94QecEzJSbok6a2PB96bB2GRRMTiOU5dFvEzl6Nw=;
  b=gAaw2EqugwvmtOJbZG83EtX7KBfl/jvQCYwdzvE7MTcrtcNcS1+H6VvE
   8ugkU7d+3A0XYpjmcEbmMMjjRsJXmS966UnEYqtec/X1lItrm/DlIXYrH
   hNdBsheZy+KQZevTbFLFFwDN4EGGVyhP886Nd3DuUIODmDYvTJw1zaTMC
   yH3dhG15MiRef1qddWGemZLuzCt1tpHHFmHhM5yR03OI1n40vJY6xji9z
   8Y4Jw8P2GAerjN7loEsklL33XPBnw2EEA3lH+HtHSyVvyG7Vr7ZCfIdV7
   tfy8Xy++BFF3K6E/KUKX9PDvNFF6wnyjeMW3P39xnMNcNaPIXHWPaO6Jr
   w==;
X-CSE-ConnectionGUID: tBItwKdeTjeD/7fsqHkXkw==
X-CSE-MsgGUID: PXcGj24JQqio4DPpw4McMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11527"; a="58151429"
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="58151429"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Aug 2025 03:07:30 -0700
X-CSE-ConnectionGUID: ahJRCOcLRua6gL9pHP/K0A==
X-CSE-MsgGUID: sJFnDOD2Q2ic5Aq4Xqk8Ew==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,306,1747724400"; 
   d="scan'208";a="168736927"
Received: from lkp-server02.sh.intel.com (HELO 4ea60e6ab079) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 21 Aug 2025 03:07:29 -0700
Received: from kbuild by 4ea60e6ab079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1up2Bu-000KB1-3C;
	Thu, 21 Aug 2025 10:06:57 +0000
Date: Thu, 21 Aug 2025 18:06:01 +0800
From: kernel test robot <lkp@intel.com>
To: Heiko Carstens <hca@linux.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: [linux-next:master 3631/3950]
 drivers/infiniband/hw/mlx5/mr.c:840:31: warning: 'sprintf' may write a
 terminating nul past the end of the destination
Message-ID: <202508211859.UoYsJbLN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   7fa4d8dc380fbd81a9d702a855c50690c9c6442c
commit: de88e74889a30bd9ff4047726021cde857348b4b [3631/3950] s390/bitops: Slightly optimize ffs() and fls64()
config: s390-allyesconfig (https://download.01.org/0day-ci/archive/20250821/202508211859.UoYsJbLN-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250821/202508211859.UoYsJbLN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202508211859.UoYsJbLN-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/infiniband/hw/mlx5/mr.c: In function 'mlx5r_cache_create_ent_locked':
>> drivers/infiniband/hw/mlx5/mr.c:840:31: warning: 'sprintf' may write a terminating nul past the end of the destination [-Wformat-overflow=]
     840 |         sprintf(ent->name, "%d", order);
         |                               ^
   In function 'mlx5_mkey_cache_debugfs_add_ent',
       inlined from 'mlx5r_cache_create_ent_locked' at drivers/infiniband/hw/mlx5/mr.c:930:3:
   drivers/infiniband/hw/mlx5/mr.c:840:9: note: 'sprintf' output between 2 and 5 bytes into a destination of size 4
     840 |         sprintf(ent->name, "%d", order);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/sprintf +840 drivers/infiniband/hw/mlx5/mr.c

12cc1a02734133 Leon Romanovsky    2017-05-30  827  
73d09b2fe8336f Michael Guralnik   2023-01-26  828  static void mlx5_mkey_cache_debugfs_add_ent(struct mlx5_ib_dev *dev,
73d09b2fe8336f Michael Guralnik   2023-01-26  829  					    struct mlx5_cache_ent *ent)
e126ba97dba9ed Eli Cohen          2013-07-07  830  {
73d09b2fe8336f Michael Guralnik   2023-01-26  831  	int order = order_base_2(ent->rb_key.ndescs);
73eb8f03f0ecfc Greg Kroah-Hartman 2019-01-22  832  	struct dentry *dir;
e126ba97dba9ed Eli Cohen          2013-07-07  833  
828cf5936bea24 Leon Romanovsky    2023-02-02  834  	if (!mlx5_debugfs_root || dev->is_rep)
828cf5936bea24 Leon Romanovsky    2023-02-02  835  		return;
828cf5936bea24 Leon Romanovsky    2023-02-02  836  
73d09b2fe8336f Michael Guralnik   2023-01-26  837  	if (ent->rb_key.access_mode == MLX5_MKC_ACCESS_MODE_KSM)
73d09b2fe8336f Michael Guralnik   2023-01-26  838  		order = MLX5_IMR_KSM_CACHE_ENTRY + 2;
e126ba97dba9ed Eli Cohen          2013-07-07  839  
73d09b2fe8336f Michael Guralnik   2023-01-26 @840  	sprintf(ent->name, "%d", order);
73d09b2fe8336f Michael Guralnik   2023-01-26  841  	dir = debugfs_create_dir(ent->name, dev->cache.fs_root);
73eb8f03f0ecfc Greg Kroah-Hartman 2019-01-22  842  	debugfs_create_file("size", 0600, dir, ent, &size_fops);
73eb8f03f0ecfc Greg Kroah-Hartman 2019-01-22  843  	debugfs_create_file("limit", 0600, dir, ent, &limit_fops);
57e7071683ef61 Shay Drory         2023-09-21  844  	debugfs_create_ulong("cur", 0400, dir, &ent->mkeys_queue.ci);
73eb8f03f0ecfc Greg Kroah-Hartman 2019-01-22  845  	debugfs_create_u32("miss", 0600, dir, &ent->miss);
e126ba97dba9ed Eli Cohen          2013-07-07  846  }
73d09b2fe8336f Michael Guralnik   2023-01-26  847  

:::::: The code at line 840 was first introduced by commit
:::::: 73d09b2fe8336f5f37935e46418666ddbcd3c343 RDMA/mlx5: Introduce mlx5r_cache_rb_key

:::::: TO: Michael Guralnik <michaelgur@nvidia.com>
:::::: CC: Jason Gunthorpe <jgg@nvidia.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
