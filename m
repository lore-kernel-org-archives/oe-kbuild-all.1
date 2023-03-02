Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2895110B
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 06:14:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677737646; x=1709273646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4j5NfcbM48yDV53yYVidXTuP7kvvXo9rTxDIULVkl/E=;
  b=DzUOun1H4Vm8McXqM7+/JNtEvuSK48UDkB7y+ZBF1vjafPLFcGsNKHIG
   UQpkMMtsL3/TJBet18pQl+y+HL2vgQjiB3CWKlp/WRtdHbAHBhP8wnPQY
   iYgg8n6e+FeC3av7hYUbdilJlm8JCiWke+irVUBCFwfneG2s8uslZdriT
   Q3dfrpoji7O0iW+3o1yp+zXg8Ez9TbrCFjGkY49Y68NY7RjZfFSuOscZE
   GnWmUseSPI147cK7O3NAEWItXyamxzrJ7jEgEGdyVkAzAsnZ8Q2Mcrgu5
   Qrge7zycY0bf6Z/lmqy8WwEhLWoTRBpbYBV+XT7P+qyh3zeh5JyxzgqwL
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="420892599"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="420892599"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 22:14:05 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="674830997"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="674830997"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 01 Mar 2023 22:14:04 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXcCZ-0000GH-26;
	Thu, 02 Mar 2023 06:14:03 +0000
Date: Thu, 2 Mar 2023 14:13:42 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-5.4.y 665/975]
 fs/ubifs/file.c:1644:23: error: passing argument 1 of 'ubifs_getattr' from
 incompatible pointer type
Message-ID: <202303021409.k514LHEw-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common upstream-f2fs-stable-linux-5.4.y
head:   493f9241a6b8df703431ca8204a1dba1ccc05256
commit: 0e764ea6471e002f101dd7726b6e97f0e55c2288 [665/975] ubifs: report correct st_size for encrypted symlinks
config: i386-randconfig-a002 (https://download.01.org/0day-ci/archive/20230302/202303021409.k514LHEw-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common upstream-f2fs-stable-linux-5.4.y
        git checkout 0e764ea6471e002f101dd7726b6e97f0e55c2288
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash fs/ubifs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021409.k514LHEw-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   fs/ubifs/file.c: In function 'ubifs_symlink_getattr':
>> fs/ubifs/file.c:1644:23: error: passing argument 1 of 'ubifs_getattr' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1644 |         ubifs_getattr(mnt_userns, path, stat, request_mask, query_flags);
         |                       ^~~~~~~~~~
         |                       |
         |                       struct user_namespace *
   In file included from fs/ubifs/file.c:40:
   fs/ubifs/ubifs.h:1997:38: note: expected 'const struct path *' but argument is of type 'struct user_namespace *'
    1997 | int ubifs_getattr(const struct path *path, struct kstat *stat,
         |                   ~~~~~~~~~~~~~~~~~~~^~~~
   fs/ubifs/file.c:1644:35: error: passing argument 2 of 'ubifs_getattr' from incompatible pointer type [-Werror=incompatible-pointer-types]
    1644 |         ubifs_getattr(mnt_userns, path, stat, request_mask, query_flags);
         |                                   ^~~~
         |                                   |
         |                                   const struct path *
   In file included from fs/ubifs/file.c:40:
   fs/ubifs/ubifs.h:1997:58: note: expected 'struct kstat *' but argument is of type 'const struct path *'
    1997 | int ubifs_getattr(const struct path *path, struct kstat *stat,
         |                                            ~~~~~~~~~~~~~~^~~~
>> fs/ubifs/file.c:1644:41: warning: passing argument 3 of 'ubifs_getattr' makes integer from pointer without a cast [-Wint-conversion]
    1644 |         ubifs_getattr(mnt_userns, path, stat, request_mask, query_flags);
         |                                         ^~~~
         |                                         |
         |                                         struct kstat *
   In file included from fs/ubifs/file.c:40:
   fs/ubifs/ubifs.h:1998:23: note: expected 'u32' {aka 'unsigned int'} but argument is of type 'struct kstat *'
    1998 |                   u32 request_mask, unsigned int flags);
         |                   ~~~~^~~~~~~~~~~~
>> fs/ubifs/file.c:1644:9: error: too many arguments to function 'ubifs_getattr'
    1644 |         ubifs_getattr(mnt_userns, path, stat, request_mask, query_flags);
         |         ^~~~~~~~~~~~~
   In file included from fs/ubifs/file.c:40:
   fs/ubifs/ubifs.h:1997:5: note: declared here
    1997 | int ubifs_getattr(const struct path *path, struct kstat *stat,
         |     ^~~~~~~~~~~~~
   fs/ubifs/file.c: At top level:
>> fs/ubifs/file.c:1676:24: error: initialization of 'int (*)(const struct path *, struct kstat *, u32,  unsigned int)' {aka 'int (*)(const struct path *, struct kstat *, unsigned int,  unsigned int)'} from incompatible pointer type 'int (*)(struct user_namespace *, const struct path *, struct kstat *, u32,  unsigned int)' {aka 'int (*)(struct user_namespace *, const struct path *, struct kstat *, unsigned int,  unsigned int)'} [-Werror=incompatible-pointer-types]
    1676 |         .getattr     = ubifs_symlink_getattr,
         |                        ^~~~~~~~~~~~~~~~~~~~~
   fs/ubifs/file.c:1676:24: note: (near initialization for 'ubifs_symlink_inode_operations.getattr')
   cc1: some warnings being treated as errors


vim +/ubifs_getattr +1644 fs/ubifs/file.c

  1639	
  1640	static int ubifs_symlink_getattr(struct user_namespace *mnt_userns,
  1641					 const struct path *path, struct kstat *stat,
  1642					 u32 request_mask, unsigned int query_flags)
  1643	{
> 1644		ubifs_getattr(mnt_userns, path, stat, request_mask, query_flags);
  1645	
  1646		if (IS_ENCRYPTED(d_inode(path->dentry)))
  1647			return fscrypt_symlink_getattr(path, stat);
  1648		return 0;
  1649	}
  1650	
  1651	const struct address_space_operations ubifs_file_address_operations = {
  1652		.readpage       = ubifs_readpage,
  1653		.writepage      = ubifs_writepage,
  1654		.write_begin    = ubifs_write_begin,
  1655		.write_end      = ubifs_write_end,
  1656		.invalidatepage = ubifs_invalidatepage,
  1657		.set_page_dirty = ubifs_set_page_dirty,
  1658	#ifdef CONFIG_MIGRATION
  1659		.migratepage	= ubifs_migrate_page,
  1660	#endif
  1661		.releasepage    = ubifs_releasepage,
  1662	};
  1663	
  1664	const struct inode_operations ubifs_file_inode_operations = {
  1665		.setattr     = ubifs_setattr,
  1666		.getattr     = ubifs_getattr,
  1667	#ifdef CONFIG_UBIFS_FS_XATTR
  1668		.listxattr   = ubifs_listxattr,
  1669	#endif
  1670		.update_time = ubifs_update_time,
  1671	};
  1672	
  1673	const struct inode_operations ubifs_symlink_inode_operations = {
  1674		.get_link    = ubifs_get_link,
  1675		.setattr     = ubifs_setattr,
> 1676		.getattr     = ubifs_symlink_getattr,
  1677	#ifdef CONFIG_UBIFS_FS_XATTR
  1678		.listxattr   = ubifs_listxattr,
  1679	#endif
  1680		.update_time = ubifs_update_time,
  1681	};
  1682	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
