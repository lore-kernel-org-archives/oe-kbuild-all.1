Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31B541DE3C0
	for <oe-kbuild-all@lists.linux.dev>; Fri, 28 Feb 2025 22:21:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740781267; cv=none; b=GHd7JIqX5H+tG3eWmKmLsv+/0BQSm85EN6nzV5gPukYutBlb7BDJ59QQfn7KsjnE8UX+DjH0mTx1EF2AaXMcxiYUc2i3QRt8BaUsW93h2lCr2OrcTNidOKK5CFMoMeTMY2IeBS213kQ3yucF1uXoH3n6FrtDJhq4cJU1+47Op90=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740781267; c=relaxed/simple;
	bh=2wVOFR6kQfdaf5Xr5GRV1Igca1g/ZeEILSI4ch+y8As=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZHtSfjmJVvHp+iX3jqzqGknl/SJz1AoMMOgBBN/XwwY7+CyXkSetuCAmI/OChtEQDAawyBxvccY3JcjVdh+4IdInthPz7ZkQuZRGmmDtktzxtZntZKvHZTjdLJ8evS4Q6XzN1Xj4ImP7zrU5I9/QGbtEcnSt4Zco2IU/LGlSKHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Lq1Fx3ku; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Lq1Fx3ku"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740781265; x=1772317265;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2wVOFR6kQfdaf5Xr5GRV1Igca1g/ZeEILSI4ch+y8As=;
  b=Lq1Fx3kuJUi6K1q5/kT57Ojh5Iu99Q1Pn55BvNy+IX6+X8m6TFYxqAbm
   cFxSsmcvfeA7mo/UTgFUEQAhIlXtXbvFU8FfwSOTjf6QLDaMjJZXi2+lx
   pjhigTlR0uEqVVfvf6pXuK1T3mmpvyoYd2/xwWvxzh1EvOB86nGw99NM0
   V/v4kSwYsX2fzX68TTD2T/zQnHJAULYm+kU2GcrV0D6S679bL2Ch8iQ9c
   lxHh8U25zleCr3UfRPecKnsdyw5+/L4uz+lkZgeVf/ynO6Iy2kxq5KvQG
   +eqjOWZNX0ftDFXSp4z8eEpazepYgeR9YHukOTko4fdOQxobDuK4I5Vzt
   w==;
X-CSE-ConnectionGUID: aDxZxtN7Sr+G08gy4eKbFQ==
X-CSE-MsgGUID: OdmhrKFMR0aTj+/nZvYIIA==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="41916441"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="41916441"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Feb 2025 14:21:05 -0800
X-CSE-ConnectionGUID: ou3d8QRNT/WvtRlzBR3pZA==
X-CSE-MsgGUID: 0ItkE4VWR5OLPsy1Ub+tEA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="154631554"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 28 Feb 2025 14:21:03 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1to8j7-000FZc-1D;
	Fri, 28 Feb 2025 22:21:01 +0000
Date: Sat, 1 Mar 2025 06:20:34 +0800
From: kernel test robot <lkp@intel.com>
To: David Howells <dhowells@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dhowells-fs:netfs-fixes 3/8] fs/erofs/fscache.c:122:20: error:
 assignment to 'netfs_io_terminated_t' {aka 'void (*)(void *, long int)'}
 from incompatible pointer type 'void (*)(void *, ssize_t,  bool)' {aka 'void
 (*)(void *, long int,  _Bool)'}
Message-ID: <202503010641.9lvNP9vk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git netfs-fixes
head:   b988444962f6ecb07d923fc585b24fe462bf7f27
commit: 7e07425561b1413ec202a01d1ccafc53f9017edb [3/8] netfs: Fix the request's work item to not require a ref
config: x86_64-buildonly-randconfig-004-20250301 (https://download.01.org/0day-ci/archive/20250301/202503010641.9lvNP9vk-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250301/202503010641.9lvNP9vk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503010641.9lvNP9vk-lkp@intel.com/

All errors (new ones prefixed by >>):

   fs/erofs/fscache.c: In function 'erofs_fscache_req_io_alloc':
>> fs/erofs/fscache.c:122:20: error: assignment to 'netfs_io_terminated_t' {aka 'void (*)(void *, long int)'} from incompatible pointer type 'void (*)(void *, ssize_t,  bool)' {aka 'void (*)(void *, long int,  _Bool)'} [-Werror=incompatible-pointer-types]
     122 |         io->end_io = erofs_fscache_req_end_io;
         |                    ^
   fs/erofs/fscache.c: In function 'erofs_fscache_bio_alloc':
   fs/erofs/fscache.c:202:23: error: assignment to 'netfs_io_terminated_t' {aka 'void (*)(void *, long int)'} from incompatible pointer type 'void (*)(void *, ssize_t,  bool)' {aka 'void (*)(void *, long int,  _Bool)'} [-Werror=incompatible-pointer-types]
     202 |         io->io.end_io = erofs_fscache_bio_endio;
         |                       ^
   cc1: some warnings being treated as errors


vim +122 fs/erofs/fscache.c

f2151df5743536 Jingbo Xu 2024-03-08  115  
f2151df5743536 Jingbo Xu 2024-03-08  116  static struct erofs_fscache_io *erofs_fscache_req_io_alloc(struct erofs_fscache_rq *req)
f2151df5743536 Jingbo Xu 2024-03-08  117  {
f2151df5743536 Jingbo Xu 2024-03-08  118  	struct erofs_fscache_io *io = kzalloc(sizeof(*io), GFP_KERNEL);
f2151df5743536 Jingbo Xu 2024-03-08  119  
f2151df5743536 Jingbo Xu 2024-03-08  120  	if (!io)
f2151df5743536 Jingbo Xu 2024-03-08  121  		return NULL;
f2151df5743536 Jingbo Xu 2024-03-08 @122  	io->end_io = erofs_fscache_req_end_io;
f2151df5743536 Jingbo Xu 2024-03-08  123  	io->private = req;
f2151df5743536 Jingbo Xu 2024-03-08  124  	refcount_inc(&req->ref);
f2151df5743536 Jingbo Xu 2024-03-08  125  	refcount_set(&io->ref, 1);
f2151df5743536 Jingbo Xu 2024-03-08  126  	return io;
d435d53228dd03 Xin Yin   2022-05-09  127  }
d435d53228dd03 Xin Yin   2022-05-09  128  

:::::: The code at line 122 was first introduced by commit
:::::: f2151df5743536e0b98a2094bd58b52d4e060016 erofs: make iov_iter describe target buffers over fscache

:::::: TO: Jingbo Xu <jefflexu@linux.alibaba.com>
:::::: CC: Gao Xiang <hsiangkao@linux.alibaba.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
