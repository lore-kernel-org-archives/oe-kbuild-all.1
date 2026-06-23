Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 306D938D018
	for <oe-kbuild-all@lists.linux.dev>; Tue, 23 Jun 2026 01:31:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782178268; cv=none; b=q335BEXk5SoKHl0V36qQ8ytVsyYI2a9xEKUE6m82JVdSLRsj0acZlr4DknWW983RoPu+Pe3+H+lPmPaqdHvDVx1xkqNJgwjNXJcULnkl7alRCBYXGDBg/sautc3UUMOxK5tsSOSdrrPlLDSy/sEvAFDvy5fm0s/0B8bfNGlPfk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782178268; c=relaxed/simple;
	bh=5ncRsk8L4Gf61ZJz4xAZrzzDZQCVg2bOoaGPwue8jfw=;
	h=Date:From:To:Cc:Subject:Message-ID; b=n1aT064a2llFbQ5+v8hr3Rh7b7/UG93yKmmG3eQkSws3A3bNw4rEAsMa5A7j/Sv9IOUGLBzjjB2VWbbo8Lbm+Og8js8RrQTglGN60d5p8sRo/Y5f6R6OrtcykB3rz2YO/ii/Szr1x0elyilc89xvB+m14NVflfuMqbabhMIQeJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=T2Xe9I+L; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="T2Xe9I+L"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782178267; x=1813714267;
  h=date:from:to:cc:subject:message-id;
  bh=5ncRsk8L4Gf61ZJz4xAZrzzDZQCVg2bOoaGPwue8jfw=;
  b=T2Xe9I+Lo2TXB08kpI5nABRDrzitSJWgTLqrmZOvo0M+slfUghmD9/CQ
   70qb1APOcQhIIgcY1jPHabcn8Q1tDVsFt3dAYCDahbhiY27rGiREsIkQ6
   abmuWdDvchzep7seErAdOcGWbSqVnuVGXvFA944ZOGRZYrdXvflaVhRqy
   6MsebLkAaA2Fa+t4dwiopYFblcMsXB9xi/8b0CJ81P9z9VoWM5HFZr6Tw
   Q6ZCkBr6piT2FV5WOMK9XV8kTM6J17Usw/pwQctPY0wa3w84vnZy/s9lk
   ThC0mONF3wR/UQNJHojWLFSgHLdLgtjQJY/W3Tgwb1QH3/hesHazsoIHv
   A==;
X-CSE-ConnectionGUID: Ra2a0OnlSjCoJxDCjDD2hg==
X-CSE-MsgGUID: /B8lNFSqTjudDgl++lhBbg==
X-IronPort-AV: E=McAfee;i="6800,10657,11825"; a="93505454"
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="93505454"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Jun 2026 18:31:02 -0700
X-CSE-ConnectionGUID: ZOtZnkTtTm6kTb4FttJHNg==
X-CSE-MsgGUID: Y89c0wiwQ0m7QaAmOSMbeg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,219,1774335600"; 
   d="scan'208";a="245242066"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by fmviesa010.fm.intel.com with ESMTP; 22 Jun 2026 18:31:00 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wbpyc-0000000028l-13Ns;
	Tue, 23 Jun 2026 01:30:58 +0000
Date: Tue, 23 Jun 2026 09:30:28 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@suse.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:configfs-ns.v6 26/26]
 fs/configfs/mount.c:200:undefined reference to `get_net_ns_by_pid'
Message-ID: <202606230953.3lsztmyl-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git configfs-ns.v6
head:   22642e5d1c63efa6b484188105d45886f637d2be
commit: 22642e5d1c63efa6b484188105d45886f637d2be [26/26] Switch to net namespaces
config: s390-randconfig-001-20260623 (https://download.01.org/0day-ci/archive/20260623/202606230953.3lsztmyl-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260623/202606230953.3lsztmyl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606230953.3lsztmyl-lkp@intel.com/

All errors (new ones prefixed by >>):

   s390-linux-ld: fs/configfs/mount.o: in function `configfs_ns_id':
   fs/configfs/mount.c:34:(.text+0x12): undefined reference to `init_net'
   s390-linux-ld: fs/configfs/mount.o: in function `configfs_init_fs_context':
>> fs/configfs/mount.c:200:(.text+0x90): undefined reference to `get_net_ns_by_pid'
   s390-linux-ld: fs/configfs/mount.o: in function `configfs_init':
   fs/configfs/mount.c:306:(.init.text+0x82): undefined reference to `init_net'
   s390-linux-ld: fs/configfs/dir.o: in function `configfs_unregister_subsystem':
   fs/configfs/dir.c:2048:(.text+0x15d4): undefined reference to `init_net'
   s390-linux-ld: fs/configfs/dir.o: in function `configfs_register_subsystem':
   fs/configfs/dir.c:1892:(.text+0x2194): undefined reference to `init_net'
   s390-linux-ld: fs/configfs/dir.o: in function `configfs_link_subsystems':
   fs/configfs/dir.c:1936:(.text+0x2c30): undefined reference to `init_net'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_STMFX
   Depends on [n]: HAS_IOMEM [=y] && I2C [=y] && OF [=n]
   Selected by [y]:
   - PINCTRL_STMFX [=y] && PINCTRL [=y] && I2C [=y] && HAS_IOMEM [=y]


vim +200 fs/configfs/mount.c

   197	
   198	static int configfs_init_fs_context(struct fs_context *fc)
   199	{
 > 200		struct net *net_ns = get_net_ns_by_pid(current->pid);
   201	
   202		fc->fs_private = net_ns;
   203		fc->ops = &configfs_context_ops;
   204		return 0;
   205	}
   206	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
