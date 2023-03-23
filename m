Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C23220E6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 23 Mar 2023 06:04:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1679551454; x=1711087454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=D2+dndj9VN3cVLeet+G6rVEma98/h11NfrKIC9cMHtU=;
  b=IpP/S2juXlzu5Dbo+enoqVh+K8mdN5kRDfyYPd9LUYkilc6xD0GrpNps
   Q5SYi7Lop0v1rUEZLXbV1uwt64XBNnt7Qod9IaGVwiRJJnfy+0bbFMAbv
   T93BYjx42eTii9dS5RIJ8pPqNuIsCHkANpHFKYGOHZwVDPza2ZOV3cb/A
   1Dw0ShgL3X9NEWkgQOF0RYr11vGYaLTZG3zXIo4E9ug11y590UE0pDLd2
   Tp2vNXLRE8mhjZYZ4NO1rD6roCFme/DFW0ly1KU11/CBvvWWiCu3/bTNu
   c0EtUvq3AHIDf9uxxUt6AR/WMeowunsVBJn47EZqrTD9MdL0/msNZGIuv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="319056591"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="319056591"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Mar 2023 23:04:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10657"; a="714674253"
X-IronPort-AV: E=Sophos;i="5.98,283,1673942400"; 
   d="scan'208";a="714674253"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 22 Mar 2023 23:04:12 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pfE3X-000E1t-2Z;
	Thu, 23 Mar 2023 06:04:11 +0000
Date: Thu, 23 Mar 2023 14:03:50 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:tmpfs 3/3] mm/shmem.c:2389:23: warning: cast from pointer
 to integer of different size
Message-ID: <202303231415.ZJGD4Atf-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git tmpfs
head:   3c91485aa13464b37e93c8e969da56964d9b801c
commit: 3c91485aa13464b37e93c8e969da56964d9b801c [3/3] tmpfs: add support for stable directory cookies
config: i386-randconfig-a001 (https://download.01.org/0day-ci/archive/20230323/202303231415.ZJGD4Atf-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git/commit/?id=3c91485aa13464b37e93c8e969da56964d9b801c
        git remote add jlayton https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git
        git fetch --no-tags jlayton tmpfs
        git checkout 3c91485aa13464b37e93c8e969da56964d9b801c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303231415.ZJGD4Atf-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/shmem.c: In function 'shmem_readdir':
>> mm/shmem.c:2389:23: warning: cast from pointer to integer of different size [-Wpointer-to-int-cast]
    2389 |                 pos = (loff_t)dentry->d_fsdata;
         |                       ^


vim +2389 mm/shmem.c

  2371	
  2372	static int shmem_readdir(struct file *file, struct dir_context *ctx)
  2373	{
  2374		struct inode *dir = file_inode(file);
  2375		struct shmem_inode_info *dinfo = SHMEM_I(dir);
  2376		struct dentry *dentry;
  2377		loff_t pos = ctx->pos;
  2378		int idx = (int)ctx->pos;
  2379	
  2380		if (!dir_emit_dots(file, ctx))
  2381			return 0;
  2382	
  2383		idr_for_each_entry_continue(&dinfo->dirindex, dentry, idx) {
  2384			struct inode *inode = d_inode(dentry);
  2385	
  2386			if (!dir_emit(ctx, dentry->d_name.name, dentry->d_name.len,
  2387				      inode->i_ino, dt_type(inode->i_mode)))
  2388				break;
> 2389			pos = (loff_t)dentry->d_fsdata;
  2390		}
  2391		ctx->pos = pos;
  2392		return 0;
  2393	}
  2394	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
