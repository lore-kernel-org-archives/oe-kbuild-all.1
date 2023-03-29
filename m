Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 100438827
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Mar 2023 21:44:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680126257; x=1711662257;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Ep/jWrPZ0wlnE5HSQBJuAscRme7OhXs9lbQ3wBNEbA=;
  b=Nwpo1tQZpzWSkd49sQn9DMPZaKluNIacEoiajTwD0zDOqtoL66tNzCSq
   oVFJ1eSyZkZ1L0IO/ZELtjLsIDMaG7yydE95dnBkRrHK53doDKBR8XWMg
   I60zdTVfGpuglp0mvBHaQSU2eh/nQTlvoNltzr8clnAt34CkmfALkBusc
   lLtydYJKuIyMseD2a+QMfr33soaRfpcaG5fc2jXoDnvdbysaJMffjuZBR
   hBZxtMsKZFl3AOuTkIb9m19BospMca7T9tlDI+9QGEOyOo5FkocLXp3RM
   Y/0oo7rBtVdWlXaXbBfIwUd0kgZcb63lFDueS2YS81BaPZjkwWk7n+70t
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="427280351"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="427280351"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2023 14:44:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10664"; a="828046920"
X-IronPort-AV: E=Sophos;i="5.98,301,1673942400"; 
   d="scan'208";a="828046920"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 29 Mar 2023 14:44:14 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1phdaX-000JzS-2q;
	Wed, 29 Mar 2023 21:44:13 +0000
Date: Thu, 30 Mar 2023 05:43:36 +0800
From: kernel test robot <lkp@intel.com>
To: Chuck Lever <chuck.lever@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cel:topic-shmem-stable-dir-cookies 1/1] mm/shmem.c:4038:17: error:
 implicit declaration of function 'shmem_dirent_destroy'
Message-ID: <202303300550.wSz8TwzL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux topic-shmem-stable-dir-cookies
head:   f24b5311a9ec85e941a370942947ce0ef018f7e3
commit: f24b5311a9ec85e941a370942947ce0ef018f7e3 [1/1] shmem: stable directory cookies
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230330/202303300550.wSz8TwzL-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/cel/linux.git/commit/?id=f24b5311a9ec85e941a370942947ce0ef018f7e3
        git remote add cel git://git.kernel.org/pub/scm/linux/kernel/git/cel/linux
        git fetch --no-tags cel topic-shmem-stable-dir-cookies
        git checkout f24b5311a9ec85e941a370942947ce0ef018f7e3
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303300550.wSz8TwzL-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/shmem.c: In function 'shmem_free_in_core_inode':
>> mm/shmem.c:4038:17: error: implicit declaration of function 'shmem_dirent_destroy' [-Werror=implicit-function-declaration]
    4038 |                 shmem_dirent_destroy(inode);
         |                 ^~~~~~~~~~~~~~~~~~~~
   mm/shmem.c: At top level:
>> mm/shmem.c:4114:27: error: 'shmem_dir_llseek' undeclared here (not in a function)
    4114 |         .llseek         = shmem_dir_llseek,
         |                           ^~~~~~~~~~~~~~~~
>> mm/shmem.c:4116:27: error: 'shmem_readdir' undeclared here (not in a function)
    4116 |         .iterate_shared = shmem_readdir,
         |                           ^~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/shmem_dirent_destroy +4038 mm/shmem.c

  4032	
  4033	static void shmem_free_in_core_inode(struct inode *inode)
  4034	{
  4035		if (S_ISLNK(inode->i_mode))
  4036			kfree(inode->i_link);
  4037		if (S_ISDIR(inode->i_mode))
> 4038			shmem_dirent_destroy(inode);
  4039		kmem_cache_free(shmem_inode_cachep, SHMEM_I(inode));
  4040	}
  4041	
  4042	static void shmem_destroy_inode(struct inode *inode)
  4043	{
  4044		if (S_ISREG(inode->i_mode))
  4045			mpol_free_shared_policy(&SHMEM_I(inode)->policy);
  4046	}
  4047	
  4048	static void shmem_init_inode(void *foo)
  4049	{
  4050		struct shmem_inode_info *info = foo;
  4051		inode_init_once(&info->vfs_inode);
  4052	}
  4053	
  4054	static void shmem_init_inodecache(void)
  4055	{
  4056		shmem_inode_cachep = kmem_cache_create("shmem_inode_cache",
  4057					sizeof(struct shmem_inode_info),
  4058					0, SLAB_PANIC|SLAB_ACCOUNT, shmem_init_inode);
  4059	}
  4060	
  4061	static void shmem_destroy_inodecache(void)
  4062	{
  4063		kmem_cache_destroy(shmem_inode_cachep);
  4064	}
  4065	
  4066	/* Keep the page in page cache instead of truncating it */
  4067	static int shmem_error_remove_page(struct address_space *mapping,
  4068					   struct page *page)
  4069	{
  4070		return 0;
  4071	}
  4072	
  4073	const struct address_space_operations shmem_aops = {
  4074		.writepage	= shmem_writepage,
  4075		.dirty_folio	= noop_dirty_folio,
  4076	#ifdef CONFIG_TMPFS
  4077		.write_begin	= shmem_write_begin,
  4078		.write_end	= shmem_write_end,
  4079	#endif
  4080	#ifdef CONFIG_MIGRATION
  4081		.migrate_folio	= migrate_folio,
  4082	#endif
  4083		.error_remove_page = shmem_error_remove_page,
  4084	};
  4085	EXPORT_SYMBOL(shmem_aops);
  4086	
  4087	static const struct file_operations shmem_file_operations = {
  4088		.mmap		= shmem_mmap,
  4089		.open		= generic_file_open,
  4090		.get_unmapped_area = shmem_get_unmapped_area,
  4091	#ifdef CONFIG_TMPFS
  4092		.llseek		= shmem_file_llseek,
  4093		.read_iter	= shmem_file_read_iter,
  4094		.write_iter	= generic_file_write_iter,
  4095		.fsync		= noop_fsync,
  4096		.splice_read	= generic_file_splice_read,
  4097		.splice_write	= iter_file_splice_write,
  4098		.fallocate	= shmem_fallocate,
  4099	#endif
  4100	};
  4101	
  4102	static const struct inode_operations shmem_inode_operations = {
  4103		.getattr	= shmem_getattr,
  4104		.setattr	= shmem_setattr,
  4105	#ifdef CONFIG_TMPFS_XATTR
  4106		.listxattr	= shmem_listxattr,
  4107		.set_acl	= simple_set_acl,
  4108		.fileattr_get	= shmem_fileattr_get,
  4109		.fileattr_set	= shmem_fileattr_set,
  4110	#endif
  4111	};
  4112	
  4113	static const struct file_operations shmem_dir_operations = {
> 4114		.llseek		= shmem_dir_llseek,
  4115		.read		= generic_read_dir,
> 4116		.iterate_shared	= shmem_readdir,
  4117		.fsync		= noop_fsync,
  4118	};
  4119	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
