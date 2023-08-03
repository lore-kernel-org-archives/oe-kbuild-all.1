Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CBBEA0
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 22:45:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691102755; x=1722638755;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3k1FXpw9Z8bX374ZIy5mFLwoEbjsurtvyPHqRKVvWlI=;
  b=XIsVPlB0+HohlGVfu2KK8yhmBUbib72/lqr1MPugKYmBJ9ZhWIPH5sQg
   h4rpHD6K6ql1OOrUagKsRdxsP2FE+nG9ZU370Bo/EWGIoJ43nEK65RJxQ
   nafcpdXsd1c7pUxTMSdsfUk+HgQtXiA+ZX3UOzCT3UVtLK+b3DlWrjlCb
   0kB347MNjj5gpWrxJfHRTFwX9YNWAOxwuJt2drtl4yvHdaV+ByrrxTs7s
   wfFV4X81MT24TDwQbI6OvlNZ9uIQtEzx2IB/cOIcnvahsDqwx7NfoLkf9
   Rjhkh0r4nbONBW76fJhsgFPHba5edZpLRIatsEaXhbA7HUQqRcI8VWACi
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="456386443"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="456386443"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 15:45:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="843793265"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="843793265"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 03 Aug 2023 15:45:53 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRh4q-0002QF-20;
	Thu, 03 Aug 2023 22:45:52 +0000
Date: Fri, 4 Aug 2023 06:45:46 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgctime 4/10] fs/orangefs/inode.c:974:24: error:
 initialization of 'int (*)(struct inode *, int)' from incompatible pointer
 type 'int (*)(struct inode *, struct timespec64 *, int)'
Message-ID: <202308040649.QynArfbh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgctime
head:   95700cbb34eb6d1582628c9fbb710da3a20a3c56
commit: db10ad15580c9fcc3fff178a50169967db81325d [4/10] fs: change update_time prototype
config: parisc-randconfig-r036-20230731 (https://download.01.org/0day-ci/archive/20230804/202308040649.QynArfbh-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040649.QynArfbh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040649.QynArfbh-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/orangefs/inode.c:974:24: error: initialization of 'int (*)(struct inode *, int)' from incompatible pointer type 'int (*)(struct inode *, struct timespec64 *, int)' [-Werror=incompatible-pointer-types]
     974 |         .update_time = orangefs_update_time,
         |                        ^~~~~~~~~~~~~~~~~~~~
   fs/orangefs/inode.c:974:24: note: (near initialization for 'orangefs_file_inode_operations.update_time')
   In file included from fs/orangefs/protocol.h:287,
                    from fs/orangefs/inode.c:15:
   fs/orangefs/orangefs-debug.h:86:18: warning: 'num_kmod_keyword_mask_map' defined but not used [-Wunused-const-variable=]
      86 | static const int num_kmod_keyword_mask_map = (int)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> fs/orangefs/namei.c:445:24: error: initialization of 'int (*)(struct inode *, int)' from incompatible pointer type 'int (*)(struct inode *, struct timespec64 *, int)' [-Werror=incompatible-pointer-types]
     445 |         .update_time = orangefs_update_time,
         |                        ^~~~~~~~~~~~~~~~~~~~
   fs/orangefs/namei.c:445:24: note: (near initialization for 'orangefs_dir_inode_operations.update_time')
   In file included from fs/orangefs/protocol.h:287,
                    from fs/orangefs/namei.c:12:
   fs/orangefs/orangefs-debug.h:86:18: warning: 'num_kmod_keyword_mask_map' defined but not used [-Wunused-const-variable=]
      86 | static const int num_kmod_keyword_mask_map = (int)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
--
>> fs/orangefs/symlink.c:18:24: error: initialization of 'int (*)(struct inode *, int)' from incompatible pointer type 'int (*)(struct inode *, struct timespec64 *, int)' [-Werror=incompatible-pointer-types]
      18 |         .update_time = orangefs_update_time,
         |                        ^~~~~~~~~~~~~~~~~~~~
   fs/orangefs/symlink.c:18:24: note: (near initialization for 'orangefs_symlink_inode_operations.update_time')
   In file included from fs/orangefs/protocol.h:287,
                    from fs/orangefs/symlink.c:8:
   fs/orangefs/orangefs-debug.h:86:18: warning: 'num_kmod_keyword_mask_map' defined but not used [-Wunused-const-variable=]
      86 | static const int num_kmod_keyword_mask_map = (int)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +974 fs/orangefs/inode.c

1f26b0627b4613e Miklos Szeredi     2021-04-07  965  
95f5f88f8900c09 Mike Marshall      2018-05-11  966  /* ORANGEFS2 implementation of VFS inode operations for files */
bdd6f083586ff17 Martin Brandenburg 2018-04-03  967  static const struct inode_operations orangefs_file_inode_operations = {
cac2f8b8d8b50ef Christian Brauner  2022-09-22  968  	.get_inode_acl = orangefs_get_acl,
8bb8aefd5afb54a Yi Liu             2015-11-24  969  	.set_acl = orangefs_set_acl,
8bb8aefd5afb54a Yi Liu             2015-11-24  970  	.setattr = orangefs_setattr,
8bb8aefd5afb54a Yi Liu             2015-11-24  971  	.getattr = orangefs_getattr,
8bb8aefd5afb54a Yi Liu             2015-11-24  972  	.listxattr = orangefs_listxattr,
933287da750edef Martin Brandenburg 2016-01-30  973  	.permission = orangefs_permission,
a55f2d861585006 Martin Brandenburg 2017-11-07 @974  	.update_time = orangefs_update_time,
1f26b0627b4613e Miklos Szeredi     2021-04-07  975  	.fileattr_get = orangefs_fileattr_get,
1f26b0627b4613e Miklos Szeredi     2021-04-07  976  	.fileattr_set = orangefs_fileattr_set,
5db11c21a929cd9 Mike Marshall      2015-07-17  977  };
5db11c21a929cd9 Mike Marshall      2015-07-17  978  

:::::: The code at line 974 was first introduced by commit
:::::: a55f2d861585006f493e933ad32d65d71ba631fa orangefs: stop setting atime on inode dirty

:::::: TO: Martin Brandenburg <martin@omnibond.com>
:::::: CC: Mike Marshall <hubcap@omnibond.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
