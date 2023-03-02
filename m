Received: from mga14.intel.com (mga14.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E078BA47
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Mar 2023 05:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677733383; x=1709269383;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=97WDR67BYmpe3Cm9rU4vIUSqRGU0b3ZvpTU7CX7OwAA=;
  b=GgU+1fnMVtm1fNxRfKJW8m0QByzFtrFpLYASkp9G6+qyQaOqRHKTjn1g
   t79uSHHwTajnfe4xLLZk60bUTOWfCg43Z9P6g8bHI/p92ksfKzPWAef9e
   w2J/15H1USvSenfoG5Kb6mc88m40hF9HDKk69hyAae0HZt5vFFpOGAQHr
   XO49LHWTQfRJkjtzhRNl5TYPo/jjmqyQ8JxtHSHhgbwd/zP7ig/AgNr1o
   6o/S4HKtkLn8Jzc6mPpv5rc579b813yB5bW7IJIONk/DTyVfdYALjJ8PU
   30kAVDEcqvbXNuehNSnjNr2YizmPmlagv2eWcA9pZ8DP5+rR921Iwtf6S
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="334649655"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="334649655"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2023 21:03:03 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10636"; a="784648097"
X-IronPort-AV: E=Sophos;i="5.98,226,1673942400"; 
   d="scan'208";a="784648097"
Received: from lkp-server01.sh.intel.com (HELO 776573491cc5) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 01 Mar 2023 21:03:02 -0800
Received: from kbuild by 776573491cc5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pXb5p-0000Dz-2p;
	Thu, 02 Mar 2023 05:03:01 +0000
Date: Thu, 2 Mar 2023 13:02:26 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:upstream-f2fs-stable-linux-5.4.y 665/975]
 fs/ubifs/file.c:1644:54: error: too many arguments to function call,
 expected 4, have 5
Message-ID: <202303021243.POvea2F7-lkp@intel.com>
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
config: x86_64-randconfig-a014 (https://download.01.org/0day-ci/archive/20230302/202303021243.POvea2F7-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common upstream-f2fs-stable-linux-5.4.y
        git checkout 0e764ea6471e002f101dd7726b6e97f0e55c2288
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash fs/ubifs/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202303021243.POvea2F7-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/ubifs/file.c:1644:54: error: too many arguments to function call, expected 4, have 5
           ubifs_getattr(mnt_userns, path, stat, request_mask, query_flags);
           ~~~~~~~~~~~~~                                       ^~~~~~~~~~~
   fs/ubifs/ubifs.h:1997:5: note: 'ubifs_getattr' declared here
   int ubifs_getattr(const struct path *path, struct kstat *stat,
       ^
>> fs/ubifs/file.c:1676:17: error: incompatible function pointer types initializing 'int (*)(const struct path *, struct kstat *, u32, unsigned int)' (aka 'int (*)(const struct path *, struct kstat *, unsigned int, unsigned int)') with an expression of type 'int (struct user_namespace *, const struct path *, struct kstat *, u32, unsigned int)' (aka 'int (struct user_namespace *, const struct path *, struct kstat *, unsigned int, unsigned int)') [-Werror,-Wincompatible-function-pointer-types]
           .getattr     = ubifs_symlink_getattr,
                          ^~~~~~~~~~~~~~~~~~~~~
   2 errors generated.


vim +1644 fs/ubifs/file.c

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
