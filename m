Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D860225178
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 19:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691092255; x=1722628255;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ZVKaHsPewinJ8bUp/yim/klLHsP8D7rZbBCfSOQsA4o=;
  b=gREaQijm4oDNsNYE/zcqqS4q6d8GjLWzrse2CBewItOS63RWLsxyG+Iq
   zK+utQta0fDf1E0TW5S/l2DtFHNXtknp58qHUG8VYkUPqtePaSIQ1YChg
   6nVQLrjSUQOBKPfCkLhm11/qO/CNlgWm7LKSersiJVclkM28I1AolZg63
   +1P/Ct64ADmIJCeEXTqT74ARQK75EdM2qF+b0L0oRnbSTmswGJlTlbVRI
   M5Hqe9B7wMvxRLX9OUdK1m/ELO5ZGRTH1OShVYkrVqDUBMypViF6w2HBA
   KT2bmWO+5hrsShxJoxZaDwJs/O2GJiOXUPFtJh/ruYrEyEB9qAkXwz5J7
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="349575688"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="349575688"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 12:50:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="729773715"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="729773715"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 03 Aug 2023 12:50:47 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qReLO-0002KH-0i;
	Thu, 03 Aug 2023 19:50:46 +0000
Date: Fri, 4 Aug 2023 03:50:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgctime 4/10] fs/orangefs/symlink.c:18:24: error:
 initialization of 'int (*)(struct inode *, int)' from incompatible pointer
 type 'int (*)(struct inode *, struct timespec64 *, int)'
Message-ID: <202308040336.pI9J8T2V-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgctime
head:   ffef667f9698cae637fe41b46df59816f79c050f
commit: 8e5568e178ddba11db584128ea843e8fba301dba [4/10] fs: change update_time prototype
config: arm-randconfig-r024-20230731 (https://download.01.org/0day-ci/archive/20230804/202308040336.pI9J8T2V-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040336.pI9J8T2V-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040336.pI9J8T2V-lkp@intel.com/

All errors (new ones prefixed by >>):

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


vim +18 fs/orangefs/symlink.c

1182fca3bc0044 Mike Marshall      2015-07-17  11  
6f3fc1070be028 Al Viro            2016-05-14  12  const struct inode_operations orangefs_symlink_inode_operations = {
a7d3e78ab53ff4 Mike Marshall      2016-03-14  13  	.get_link = simple_get_link,
8bb8aefd5afb54 Yi Liu             2015-11-24  14  	.setattr = orangefs_setattr,
8bb8aefd5afb54 Yi Liu             2015-11-24  15  	.getattr = orangefs_getattr,
8bb8aefd5afb54 Yi Liu             2015-11-24  16  	.listxattr = orangefs_listxattr,
933287da750ede Martin Brandenburg 2016-01-30  17  	.permission = orangefs_permission,
a55f2d86158500 Martin Brandenburg 2017-11-07 @18  	.update_time = orangefs_update_time,

:::::: The code at line 18 was first introduced by commit
:::::: a55f2d861585006f493e933ad32d65d71ba631fa orangefs: stop setting atime on inode dirty

:::::: TO: Martin Brandenburg <martin@omnibond.com>
:::::: CC: Mike Marshall <hubcap@omnibond.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
