Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D89029345A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 09:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750151353; cv=none; b=J9ENNPBb2FqlCS4RA+zNJFfKjI0D+lIKNUns9GJCQalOJ6bQ04ynSVbSRbcAQqB9L3y9iJNnEjhF+ozG/OXighCTAv2ZFxjunuXIbTtmUkb33TWsus37ouEhxH9af1PcYWvkFavtHLI/5HFilx7V7VpYSlbFqQZOXo0dSeTD3mM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750151353; c=relaxed/simple;
	bh=C9XF9btY++lfYvomDsltfsy859aIG52wzYV/jhACtDY=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=BHCZ6QhwWL9bVjY5Wtj3IuC0EjXpQINijPo627lOnyfHiS/PNQVDDY6w0LLIFs/XtJQISrhqXVuKMrDrRLq0Al+xXElz6aN36Pn9lHyAusK8s98A1hUPDUP6BVzcXUKojokE1jI2ljwCwuQwF7stLLpLhL1d89m37MItB8lcevU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KadKP8s7; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KadKP8s7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750151351; x=1781687351;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=C9XF9btY++lfYvomDsltfsy859aIG52wzYV/jhACtDY=;
  b=KadKP8s7RieyGvn/YfKgBi7SO507Jk5q0FfNThe8RcO50JtlnBB8WwX0
   +Ho1GqiHLD153Io5wTpl1D2OXNQvwB0DJVDaR6MKaTaIcGY87ldz/ommV
   NZrgRByDOcNOFTQDRVMjeR53s71LeMgKy3+PDjpcJU/Gn1lbUPPBZjv0g
   u1IiLgHE1yMWBg3zXycGufEJNqy7L08CnA4yLHUmyrBuBMw8f7FygX/47
   iDQ8AnW017NOgDl+wjkeJdDwjREMyiu3CrmU+XUzMSPwoYIBm+WnrsNKI
   tV1r8XfJJIhrx8hBco4wjvM1QTqhXYNwowZ2HHFVtX4q/wz4C0yS2olxj
   Q==;
X-CSE-ConnectionGUID: NUT1XqbEQnmYV4d53tUcsg==
X-CSE-MsgGUID: twl6QZMuRWSL1Uum7PBu7w==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51542152"
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="51542152"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Jun 2025 02:09:11 -0700
X-CSE-ConnectionGUID: cYLMdW9PQYKa9E2GMHKkHQ==
X-CSE-MsgGUID: bbKLjiAzTrqrFGn3CP437A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,242,1744095600"; 
   d="scan'208";a="148710848"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 17 Jun 2025 02:09:10 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRSJW-000FoK-36;
	Tue, 17 Jun 2025 09:09:06 +0000
Date: Tue, 17 Jun 2025 17:08:39 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian Brauner <christianvanbrauner@gmail.com>
Subject: [brauner-vfs:work.pidfs 1/3] fs/pidfs.c:596:25: sparse: sparse:
 incompatible types in comparison expression (different address spaces):
Message-ID: <202506171719.05s3AOr0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/vfs.git work.pidfs
head:   3e42260f33769251daa89686a4b617d7bbb66a95
commit: 56e50aa99df4ccdc736362bac4e62e2dfc55f58a [1/3] pidfs: keep pidfs dentry stashed once created
config: arm-randconfig-r133-20250617 (https://download.01.org/0day-ci/archive/20250617/202506171719.05s3AOr0-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.4.0
reproduce: (https://download.01.org/0day-ci/archive/20250617/202506171719.05s3AOr0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506171719.05s3AOr0-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/pidfs.c:596:25: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/pidfs.c:596:25: sparse:    struct dentry [noderef] __rcu *
   fs/pidfs.c:596:25: sparse:    struct dentry *
   fs/pidfs.c:737:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/pidfs.c:737:17: sparse:    struct dentry [noderef] __rcu *
   fs/pidfs.c:737:17: sparse:    struct dentry *
   fs/pidfs.c:951:17: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/pidfs.c:951:17: sparse:    struct dentry [noderef] __rcu *
   fs/pidfs.c:951:17: sparse:    struct dentry *
   fs/pidfs.c: note: in included file (through include/linux/mm_types.h, include/linux/mmzone.h, include/linux/gfp.h, ...):
   include/linux/rbtree.h:74:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   include/linux/rbtree.h:74:9: sparse:    struct rb_node [noderef] __rcu *
   include/linux/rbtree.h:74:9: sparse:    struct rb_node *

vim +596 fs/pidfs.c

   587	
   588			dentry = pid->stashed;
   589			if (!dentry) {
   590				/*
   591				 * No one held a pidfd for this struct pid.
   592				 * Mark it as dead so no one can add a pidfs
   593				 * entry anymore. We're about to be reaped and
   594				 * so no exit information would be available.
   595				 */
 > 596				rcu_assign_pointer(pid->stashed, PIDFS_PID_DEAD);
   597				return;
   598			}
   599	
   600			/* We own a reference assert that clearly. */
   601			VFS_WARN_ON_ONCE(__lockref_is_dead(&dentry->d_lockref));
   602			inode = d_inode(dentry);
   603			exit_info = &pidfs_i(inode)->__pei;
   604	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
