Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23C3729AC
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jan 2023 20:57:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675112245; x=1706648245;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OEzNX/62avGAj9S65H3eLy6PlgNDUk/FMQLpkPtZJ1c=;
  b=JI2CxdicJ+6pV7faH9s6j4kaMYqNwyxiY66IoNcPCy0x0H+SxoogOYlE
   cT24vkp91fNtbGgOns2DrloA6ehp6eGwmEGqAPtqJePcWp5bVgK8YcEBU
   FqxseAfh2tID2m8K6XyeZ+fgtw8gLWCM+nvCpfqh2rMCAp5iInuOlY1BB
   2nbNSOcPZYtQyNHGxIFXVJIDHOYLc3f6IGC5KRN8rneGVYoMI0rbuU6aV
   lOQYAw1osManMR14ZgvZxWExNT51C2cHGFdgWxtGBr6bDf5ymWThTkoZt
   3YSNNphvVoJ06Uij+p1BlBOc5svrpIf6festyCMdfvCK6B8ALe026Hb4h
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="327690357"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="327690357"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 12:55:21 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="664232207"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="664232207"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2023 12:55:20 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMbBP-0003ts-1t;
	Mon, 30 Jan 2023 20:55:19 +0000
Date: Tue, 31 Jan 2023 04:55:00 +0800
From: kernel test robot <lkp@intel.com>
To: Christian Brauner <brauner@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Seth Forshee <sforshee@kernel.org>
Subject: [vfs-idmapping:b4/fs-acl-remove-generic-xattr-handlers 2/9]
 include/linux/posix_acl.h:162: multiple definition of `posix_acl_listxattr';
 init/do_mounts.o:include/linux/posix_acl.h:162: first defined here
Message-ID: <202301310442.tXwRT1ID-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git b4/fs-acl-remove-generic-xattr-handlers
head:   d62ca8f8268fbd7f6e1c53dff832a4a46ef7ac2c
commit: b02a998708f0481423e28d34df82b07be9e05317 [2/9] xattr: simplify listxattr helpers
config: um-i386_defconfig (https://download.01.org/0day-ci/archive/20230131/202301310442.tXwRT1ID-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git/commit/?id=b02a998708f0481423e28d34df82b07be9e05317
        git remote add vfs-idmapping https://git.kernel.org/pub/scm/linux/kernel/git/vfs/idmapping.git
        git fetch --no-tags vfs-idmapping b4/fs-acl-remove-generic-xattr-handlers
        git checkout b02a998708f0481423e28d34df82b07be9e05317
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=um SUBARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=um SUBARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   ld: kernel/sysctl.o: in function `posix_acl_listxattr':
>> include/linux/posix_acl.h:162: multiple definition of `posix_acl_listxattr'; init/do_mounts.o:include/linux/posix_acl.h:162: first defined here
   ld: mm/shmem.o: in function `posix_acl_listxattr':
>> include/linux/posix_acl.h:162: multiple definition of `posix_acl_listxattr'; init/do_mounts.o:include/linux/posix_acl.h:162: first defined here
   ld: fs/namei.o: in function `posix_acl_listxattr':
>> include/linux/posix_acl.h:162: multiple definition of `posix_acl_listxattr'; init/do_mounts.o:include/linux/posix_acl.h:162: first defined here
   ld: fs/inode.o: in function `posix_acl_listxattr':
>> include/linux/posix_acl.h:162: multiple definition of `posix_acl_listxattr'; init/do_mounts.o:include/linux/posix_acl.h:162: first defined here
   ld: fs/xattr.o: in function `posix_acl_listxattr':
>> include/linux/posix_acl.h:162: multiple definition of `posix_acl_listxattr'; init/do_mounts.o:include/linux/posix_acl.h:162: first defined here
   ld: fs/reiserfs/namei.o: in function `posix_acl_listxattr':
>> include/linux/posix_acl.h:162: multiple definition of `posix_acl_listxattr'; init/do_mounts.o:include/linux/posix_acl.h:162: first defined here
   ld: fs/reiserfs/inode.o: in function `posix_acl_listxattr':
>> include/linux/posix_acl.h:162: multiple definition of `posix_acl_listxattr'; init/do_mounts.o:include/linux/posix_acl.h:162: first defined here
   ld: fs/reiserfs/file.o: in function `posix_acl_listxattr':
>> include/linux/posix_acl.h:162: multiple definition of `posix_acl_listxattr'; init/do_mounts.o:include/linux/posix_acl.h:162: first defined here
   ld: fs/reiserfs/super.o: in function `posix_acl_listxattr':
>> include/linux/posix_acl.h:162: multiple definition of `posix_acl_listxattr'; init/do_mounts.o:include/linux/posix_acl.h:162: first defined here
   ld: fs/reiserfs/xattr.o: in function `posix_acl_listxattr':
>> include/linux/posix_acl.h:162: multiple definition of `posix_acl_listxattr'; init/do_mounts.o:include/linux/posix_acl.h:162: first defined here
   ld: fs/ext4/file.o: in function `posix_acl_listxattr':
>> include/linux/posix_acl.h:162: multiple definition of `posix_acl_listxattr'; init/do_mounts.o:include/linux/posix_acl.h:162: first defined here
   ld: fs/ext4/ialloc.o: in function `posix_acl_listxattr':
>> include/linux/posix_acl.h:162: multiple definition of `posix_acl_listxattr'; init/do_mounts.o:include/linux/posix_acl.h:162: first defined here
   ld: fs/ext4/inode.o: in function `posix_acl_listxattr':
>> include/linux/posix_acl.h:162: multiple definition of `posix_acl_listxattr'; init/do_mounts.o:include/linux/posix_acl.h:162: first defined here
   ld: fs/ext4/namei.o: in function `posix_acl_listxattr':
>> include/linux/posix_acl.h:162: multiple definition of `posix_acl_listxattr'; init/do_mounts.o:include/linux/posix_acl.h:162: first defined here
   ld: fs/ext4/page-io.o: in function `posix_acl_listxattr':
>> include/linux/posix_acl.h:162: multiple definition of `posix_acl_listxattr'; init/do_mounts.o:include/linux/posix_acl.h:162: first defined here
   ld: fs/ext4/super.o: in function `posix_acl_listxattr':
>> include/linux/posix_acl.h:162: multiple definition of `posix_acl_listxattr'; init/do_mounts.o:include/linux/posix_acl.h:162: first defined here
   ld: fs/ext4/xattr.o: in function `posix_acl_listxattr':
>> include/linux/posix_acl.h:162: multiple definition of `posix_acl_listxattr'; init/do_mounts.o:include/linux/posix_acl.h:162: first defined here


vim +162 include/linux/posix_acl.h

   152	
   153	static inline int vfs_remove_acl(struct user_namespace *mnt_userns,
   154					 struct dentry *dentry, const char *acl_name)
   155	{
   156		return -EOPNOTSUPP;
   157	}
   158	int posix_acl_listxattr(struct inode *inode, char **buffer,
   159				ssize_t *remaining_size)
   160	{
   161		return 0;
 > 162	}
   163	#endif /* CONFIG_FS_POSIX_ACL */
   164	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
