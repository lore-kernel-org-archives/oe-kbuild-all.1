Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47FC443E9FC
	for <oe-kbuild-all@lists.linux.dev>; Tue,  6 Oct 2026 20:28:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791318520; cv=none; b=pHOQpjSZ38hOpqzPDaMNq4bpXOA0OOyskZToKnZGXgTFyOSAUTd00t/g8boLB/JSjcGqyw0NslLE+YhRPIX+yFsAaLTxbYGtmJzL8mMXPk3peaDK54j1teybzNOjhi5ysFSPgbIQvxQ8fgwbzx+5QxenjsqCnSpxHGw7mqul1DQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791318520; c=relaxed/simple;
	bh=CWkb4hPsPpRnP8n5a3eG9vxPu4EL1fdgDG/gE36/rHQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=qciYJ2VFfJ0tv8FgtGqxF7Pw8IZcarpXNEjk+73E+7o3C4AjfEplZG3USDD1xw/uXL39IYLXw3c3j8l5IAD8mlbcVpk8H8R+q5d7Qwav9TaMnzsCogWs0Xanc9/1t5hLcJFKBeMeW9DnVwQ+9GMKPZ8VxN3l900z0YBuEBr+K30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=jDzvAH7r; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="jDzvAH7r"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1791318519; x=1822854519;
  h=date:from:to:cc:subject:message-id;
  bh=CWkb4hPsPpRnP8n5a3eG9vxPu4EL1fdgDG/gE36/rHQ=;
  b=jDzvAH7rJKYy3+h1oedy9YAwhSrRb0JSoCm4AITwpiZeqazizrlAOmfZ
   FtYWV1/5wVTZ7sDWmmflMmDhb46dF9RPWuJS40DT2W8/RaQmIhwiSdiKn
   LnsnBbeSoLc8Po3o9xEUbHcMapkpyMF2QFzHCBYxiZXkxBei2t+QBoh+m
   2TkqHdZ/sahjDSpHsPlgx2b53xIzfsNjnifyctdQ1GuOuh5UpDjUc5teo
   QMHXKfuxdI1p7nbpJljuLeHWzlaQgO/8A2Cee4PiJXUnqQDjuJ6+GwW8D
   OGMjTGeHrqj3zeuob4t9QmVINNVU1qU7sTWGhd+wWz3dNbQ62SWLnFtF1
   Q==;
X-CSE-ConnectionGUID: +cH+kt5ASyOqNWBc218acg==
X-CSE-MsgGUID: YivaNUDMRz2Ft3L5zAQqSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11927"; a="103392052"
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="103392052"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Oct 2026 13:28:35 -0700
X-CSE-ConnectionGUID: PUCuSHGMT0++kdSjMMRAaw==
X-CSE-MsgGUID: 9CRgIxYvSVqeF2QkzhDVhA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,143,1787036400"; 
   d="scan'208";a="280485454"
Received: from igk-lkp-server01.igk.intel.com (HELO d0de6c2a75a7) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 06 Oct 2026 13:28:34 -0700
Received: from kbuild by d0de6c2a75a7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xEBm3-000000001lg-2BeG;
	Tue, 06 Oct 2026 20:28:31 +0000
Date: Tue, 06 Oct 2026 22:27:55 +0200
From: kernel test robot <lkp@intel.com>
To: Miklos Szeredi <mszeredi@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, fuse-devel@lists.sourceforge.net,
 Amir Goldstein <amir73il@gmail.com>
Subject: [mszeredi-fuse:extent-map-v3 28/29]
 fs/fuse/ext_map.c:150:23: warning: unused variable 'pfn'
Message-ID: <202610062207.LQIBA0hv-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mszeredi/fuse.git extent-map-v3
head:   abdbd9557c238384900ebd545f426a609e0162ae
commit: 91fc78ad913efd321396e414a561474c9072d334 [28/29] fuse: add extent map I/O support
config: nios2-randconfig-r2106-20261006 (https://download.01.org/0day-ci/archive/20261006/202610062207.LQIBA0hv-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261006/202610062207.LQIBA0hv-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610062207.LQIBA0hv-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/fuse/ext_map.c: In function 'fuse_ext_map_huge_fault':
>> fs/fuse/ext_map.c:150:23: warning: unused variable 'pfn' [-Wunused-variable]
     150 |         unsigned long pfn;
         |                       ^~~
   At top level:
>> fs/fuse/ext_map.c:141:31: warning: 'fuse_ext_map_iomap_ops' defined but not used [-Wunused-const-variable=]
     141 | static const struct iomap_ops fuse_ext_map_iomap_ops = {
         |                               ^~~~~~~~~~~~~~~~~~~~~~


vim +/pfn +150 fs/fuse/ext_map.c

   140	
 > 141	static const struct iomap_ops fuse_ext_map_iomap_ops = {
   142		.iomap_begin		= fuse_ext_map_iomap_begin,
   143	};
   144	
   145	static vm_fault_t fuse_ext_map_huge_fault(struct vm_fault *vmf, unsigned int order)
   146	{
   147		struct inode *inode = file_inode(vmf->vma->vm_file);
   148		bool write_fault = (vmf->flags & FAULT_FLAG_WRITE) && (vmf->vma->vm_flags & VM_SHARED);
   149		vm_fault_t ret;
 > 150		unsigned long pfn;
   151	
   152		if (WARN_ON_ONCE(!IS_DAX(inode)))
   153			return VM_FAULT_SIGBUS;
   154	
   155		if (write_fault) {
   156			sb_start_pagefault(inode->i_sb);
   157			file_update_time(vmf->vma->vm_file);
   158		}
   159	
   160		filemap_invalidate_lock_shared(inode->i_mapping);
   161	
   162		ret = dax_iomap_fault(vmf, order, &pfn, NULL, &fuse_ext_map_iomap_ops);
   163		if (ret & VM_FAULT_NEEDDSYNC)
   164			ret = dax_finish_sync_fault(vmf, order, pfn);
   165	
   166		filemap_invalidate_unlock_shared(inode->i_mapping);
   167	
   168		if (write_fault)
   169			sb_end_pagefault(inode->i_sb);
   170	
   171		return ret;
   172	}
   173	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
