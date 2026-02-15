Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE97823D297
	for <oe-kbuild-all@lists.linux.dev>; Sun, 15 Feb 2026 03:05:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771124708; cv=none; b=dE3q6HIjLw4MrOrq+d2jl1EHPbsDRWBlxhcEa9swzdlQsr/+AlLclyydi+U+hE8iq5yDNXz4uc3YAIFFMGhPyU9EV3hA8FotAWM0UhXwCAKUL/TgbLFUW1i37uhwGlCqUqSvo5F6dHlZm7LTpaZkk70OgaqPtWvjU90qbEqWuiE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771124708; c=relaxed/simple;
	bh=UvYx9woUDqoUCQqtIaWaFh59S1Rfm56VSUum8fMXkd4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=StFaakGD7qD4RznCmKZBpSLQwijsUuYrXVfguF4B5NYiH+3aGi6xEq1TL6hLrusgcme3NUkGKP3trvKGMX0XKVin8OrWQtkU8k/F5WgzxjA8h2J0R52dkisIYFhtlLt3lciUHOmQWkMygsebHfEpGpEhfLcIJyAYxQ720wV8X4I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D65pDJ15; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D65pDJ15"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1771124707; x=1802660707;
  h=date:from:to:cc:subject:message-id;
  bh=UvYx9woUDqoUCQqtIaWaFh59S1Rfm56VSUum8fMXkd4=;
  b=D65pDJ15ACN7X2Ha9RpnFkty5CWUVWM/5D856Gj/TEFxKnKM6ZVklKgk
   7kFiZUVhTDu1rRpqgGW3KWWc1zRI+aGmdC1v2E5U+K5KAkgq0X/oA1x+L
   pNbRYJPztkfjhNpHxxzdYwfDx+n6/HL/75cEzJTFxSkGO4Ye4d9iQIKWt
   17CwubDZ0HHbZXi20bemsSLo7UQeB+xAxrhvWf1HIMqip9te6mX+HgJka
   xXjSXWgv+pw8neo3zu+erU42j9yPEDrAKdOarmOf94w0QcdVoEBdJNR9t
   LrgTKZ4E4WsNSCPerY9pDvZFrw5W4Ty07L7IzLR+N71StTg21cgHCj1jc
   A==;
X-CSE-ConnectionGUID: OkbZnkZ/QWCI/HVXr1se2A==
X-CSE-MsgGUID: vn0iDuJzTmuD5MwDF2g4mA==
X-IronPort-AV: E=McAfee;i="6800,10657,11701"; a="72351007"
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="72351007"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Feb 2026 19:05:07 -0800
X-CSE-ConnectionGUID: prSKwWuCRI+kGEyUULNGXA==
X-CSE-MsgGUID: 2L5JrYe9RrGa7D/jnb1q7w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,291,1763452800"; 
   d="scan'208";a="212526303"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 14 Feb 2026 19:05:05 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vrSRS-00000000xDC-2iwL;
	Sun, 15 Feb 2026 03:05:02 +0000
Date: Sun, 15 Feb 2026 11:04:18 +0800
From: kernel test robot <lkp@intel.com>
To: "Darrick J. Wong" <darrick.wong@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [djwong-xfs:fuse-iomap-bpf 102/106]
 fs/fuse/fuse_iomap_bpf.c:122:9: sparse: sparse: incompatible types in
 comparison expression (different address spaces):
Message-ID: <202602151021.DKBt6bY3-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/djwong/xfs-linux.git fuse-iomap-bpf
head:   cfabfd535988652f4ce050030fbbf472e820a672
commit: ad5afdc0027febb0800630e335524507788f9e34 [102/106] fuse: enable fuse servers to upload BPF programs to handle iomap requests
config: arm64-randconfig-r122-20260215 (https://download.01.org/0day-ci/archive/20260215/202602151021.DKBt6bY3-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260215/202602151021.DKBt6bY3-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602151021.DKBt6bY3-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/fuse/fuse_iomap_bpf.c:122:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fuse/fuse_iomap_bpf.c:122:9: sparse:    struct fuse_iomap_bpf_ops [noderef] __rcu *
   fs/fuse/fuse_iomap_bpf.c:122:9: sparse:    struct fuse_iomap_bpf_ops *
   fs/fuse/fuse_iomap_bpf.c:159:9: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fuse/fuse_iomap_bpf.c:159:9: sparse:    struct fuse_iomap_bpf_ops [noderef] __rcu *
   fs/fuse/fuse_iomap_bpf.c:159:9: sparse:    struct fuse_iomap_bpf_ops *
   fs/fuse/fuse_iomap_bpf.c:242:1: sparse: sparse: symbol 'btf_fuse_iomap_bpf_ops_id' was not declared. Should it be static?
   fs/fuse/fuse_iomap_bpf.c:244:1: sparse: sparse: symbol 'btf_fuse_iomap_begin_out_id' was not declared. Should it be static?
   fs/fuse/fuse_iomap_bpf.c:246:1: sparse: sparse: symbol 'btf_fuse_iomap_ioend_out_id' was not declared. Should it be static?
   fs/fuse/fuse_iomap_bpf.c:136:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fuse/fuse_iomap_bpf.c:136:15: sparse:    struct fuse_iomap_bpf_ops [noderef] __rcu *
   fs/fuse/fuse_iomap_bpf.c:136:15: sparse:    struct fuse_iomap_bpf_ops *
   fs/fuse/fuse_iomap_bpf.c:136:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fuse/fuse_iomap_bpf.c:136:15: sparse:    struct fuse_iomap_bpf_ops [noderef] __rcu *
   fs/fuse/fuse_iomap_bpf.c:136:15: sparse:    struct fuse_iomap_bpf_ops *
   fs/fuse/fuse_iomap_bpf.c:136:15: sparse: sparse: incompatible types in comparison expression (different address spaces):
   fs/fuse/fuse_iomap_bpf.c:136:15: sparse:    struct fuse_iomap_bpf_ops [noderef] __rcu *
   fs/fuse/fuse_iomap_bpf.c:136:15: sparse:    struct fuse_iomap_bpf_ops *

vim +122 fs/fuse/fuse_iomap_bpf.c

    89	
    90	/* Register an iomap bpf program with a fuse connection */
    91	static int fuse_iomap_bpf_reg(void *kdata, struct bpf_link *link)
    92	{
    93		struct fuse_iomap_bpf_ops *ops = kdata;
    94		struct file *fusedev_file;
    95		struct fuse_dev *fud;
    96		struct fuse_conn *fc;
    97	
    98		CLASS(fd, fusedev_fd)(ops->fuse_fd);
    99		if (fd_empty(fusedev_fd))
   100			return -EBADF;
   101	
   102		fusedev_file = fd_file(fusedev_fd);
   103		if (fusedev_file->f_op != &fuse_dev_operations)
   104			return -EBADF;
   105	
   106		fud = fuse_get_dev(fusedev_file);
   107		fc = fud->fc;
   108	
   109		if (!fc->iomap)
   110			return -EOPNOTSUPP;
   111	
   112		spin_lock(&fuse_iomap_bpf_ops_lock);
   113		if (fc->iomap_conn.bpf_ops) {
   114			spin_unlock(&fuse_iomap_bpf_ops_lock);
   115			return -EBUSY;
   116		}
   117	
   118		/*
   119		 * The initial ops user count bias is transferred to fc so that we only
   120		 * initiate wakeup events when someone tries to unregister the BPF.
   121		 */
 > 122		rcu_assign_pointer(fc->iomap_conn.bpf_ops, ops);
   123		ops->fc = fc;
   124		spin_unlock(&fuse_iomap_bpf_ops_lock);
   125	
   126		return 0;
   127	}
   128	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
