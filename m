Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 996A679F0
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 Mar 2024 06:25:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709447126; cv=none; b=I7WciI+e2zrdMlj5GAgI0CnNkPgU8ue4FgCXV9hSEC1BNS1Tu1bVuig+748sfe9HISGzdPDLRddqhAHjZQUbpcRPCD74AmVYFArJijQ5+1/mUuW16CaBl1g6tga49LwwgUchcd644i3R6guLG046VGCt1WLuYnEoN0TmaktEaYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709447126; c=relaxed/simple;
	bh=ahBCTr9ZyxnFx0A6LTnbEvtnjRSloAGbW4bNa1x8mqk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=j7qO3Ze1f0bea3Sh649k7D9SYSbI2WZoxHmyl0R2ra3YWWnvbzSbI8CeEo7VDnXHBz7qgfWXZGp1Jh8xohU1x9RRUNLhl+4Uz1+AZrt2/igggVIsUJ4an6SU1odEBzJWWhd/wDMxUOExjDDF8vq1dCr4WXwZUNrzb1Y97wt6Aco=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WzYXQV38; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WzYXQV38"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709447123; x=1740983123;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ahBCTr9ZyxnFx0A6LTnbEvtnjRSloAGbW4bNa1x8mqk=;
  b=WzYXQV38Lq/ccmYwumaehWVLx6qpYYHUhYWLlCNVbG0SBFfZ2ZKGhwKp
   ICGn52I3Wvt1RyNI/kTbCTSTCl7mMNVT5QDcr/KUr4MZODNKtGQeeknHh
   TEOR1rhfxT1obcqORDPzlXU4X6h9t3ZNMY4f6d0gSOPpHZZ6+/Mk1CnuL
   vbJpDkuNKC+4fECeS6uF6xY8e9KeFVHYnDpaUlOv2BVMSkAkeO3eZBG/M
   tKfMGED0XT+zP7EHQdcKaa+e3/4iWmzknAD1YTnLWlgr/yZMgN8IjlLNW
   HkmOQtmfib6oA1oKKxx+m8lQmeWcbQRS4G+i7hCIKcZGVJAPDqnP0ICLY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11001"; a="21492768"
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="21492768"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Mar 2024 22:25:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,200,1705392000"; 
   d="scan'208";a="8572330"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Mar 2024 22:25:20 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rgfHh-0000sk-1O;
	Sun, 03 Mar 2024 06:25:17 +0000
Date: Sun, 3 Mar 2024 14:24:57 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [opencloudos:next 75/98] fs/cgroupfs/mount.c:154:19: warning: no
 previous prototype for 'cgroupfs_alloc_entry'
Message-ID: <202403031416.pp5Zxjsc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git next
head:   a4b2dc2ffad1810ebe7a86710aa1e5cc312aa2a1
commit: bc252e34ee4ccd2ba29fdf620c287491201d2c3b [75/98] cgroupfs: add files inside sys
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20240303/202403031416.pp5Zxjsc-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240303/202403031416.pp5Zxjsc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403031416.pp5Zxjsc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/cgroupfs/mount.c:122:6: warning: no previous prototype for 'cgroupfs_umount_remove_tree' [-Wmissing-prototypes]
     122 | void cgroupfs_umount_remove_tree(cgroupfs_entry_t *root)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> fs/cgroupfs/mount.c:154:19: warning: no previous prototype for 'cgroupfs_alloc_entry' [-Wmissing-prototypes]
     154 | cgroupfs_entry_t *cgroupfs_alloc_entry(const char *name,
         |                   ^~~~~~~~~~~~~~~~~~~~
   fs/cgroupfs/mount.c:174:16: warning: no previous prototype for 'cgroupfs_iop_lookup' [-Wmissing-prototypes]
     174 | struct dentry *cgroupfs_iop_lookup(struct inode *dir, struct dentry *dentry, unsigned int flags)
         |                ^~~~~~~~~~~~~~~~~~~
   fs/cgroupfs/mount.c:215:5: warning: no previous prototype for 'cgroupfs_readdir' [-Wmissing-prototypes]
     215 | int cgroupfs_readdir(struct file *file, struct dir_context *ctx)
         |     ^~~~~~~~~~~~~~~~
   fs/cgroupfs/mount.c:500:12: warning: no previous prototype for 'cgroupfs_init' [-Wmissing-prototypes]
     500 | int __init cgroupfs_init(void)
         |            ^~~~~~~~~~~~~


vim +/cgroupfs_alloc_entry +154 fs/cgroupfs/mount.c

   153	
 > 154	cgroupfs_entry_t *cgroupfs_alloc_entry(const char *name,
   155				cgroupfs_entry_t *parent, int cgroupfs_type)
   156	{
   157		cgroupfs_entry_t *p = kmalloc(sizeof(cgroupfs_entry_t), GFP_KERNEL);
   158		if (!p)
   159			return NULL;
   160		memset(p, 0, sizeof(cgroupfs_entry_t));
   161	
   162		p->namelen = strlen(name);
   163		p->name = kmalloc(p->namelen + 1, GFP_KERNEL);
   164		if (!p->name) {
   165			kfree(p);
   166			return NULL;
   167		}
   168		memcpy((void *)(p->name), (void *)name, p->namelen + 1);
   169		p->parent = parent;
   170		p->cgroupfs_type = cgroupfs_type;
   171		return p;
   172	}
   173	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
