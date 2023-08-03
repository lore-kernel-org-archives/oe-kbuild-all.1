Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DDD200B4
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 17:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691082947; x=1722618947;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+P+0FsCiuHEuXzYk/zugcVycgCefTItYzYQl9cRBWhY=;
  b=glxCQ//nG4RziMeK0kkdn6vxCdSIYYI+ynLObMHfB1dhaTnsCdTcksDL
   Aj9w2WdjCFE6cX1ek2MxIFYFXDC0tpd88PuD+xONSeqMcKHKKwpW/YHd8
   +uhbrmFTcEjC3YxBod98B2jOSBL5SXcIOTdFaWqyEjw22Kr7S3YDQr0o/
   NdgEUJspuP+4qOruonIYrp2AZVo8aL3A1mNyZqKkOpOyYBTt6UZGdwvNP
   vt7Azr0HqVR1lxF4ZVHiVCD5c6lGovemx2SiLHIW7yGZBs6Yp73VQ6HIY
   2ZUojbCCQ5919gvzon+HloyUAx+pc4/xxy/lpBRL2VFsfXYxurwMWSnRF
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="350243311"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="350243311"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 10:15:45 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="819739528"
X-IronPort-AV: E=Sophos;i="6.01,252,1684825200"; 
   d="scan'208";a="819739528"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 03 Aug 2023 10:15:44 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRbvL-0002FT-1I;
	Thu, 03 Aug 2023 17:15:43 +0000
Date: Fri, 4 Aug 2023 01:15:42 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgctime 4/10] fs/orangefs/inode.c:908:36: warning: passing
 argument 2 of 'generic_update_time' makes integer from pointer without a
 cast
Message-ID: <202308040121.DS3WVdeA-lkp@intel.com>
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
config: loongarch-allyesconfig (https://download.01.org/0day-ci/archive/20230804/202308040121.DS3WVdeA-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040121.DS3WVdeA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040121.DS3WVdeA-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/orangefs/inode.c: In function 'orangefs_update_time':
>> fs/orangefs/inode.c:908:36: warning: passing argument 2 of 'generic_update_time' makes integer from pointer without a cast [-Wint-conversion]
     908 |         generic_update_time(inode, time, flags);
         |                                    ^~~~
         |                                    |
         |                                    struct timespec64 *
   In file included from include/linux/highmem.h:5,
                    from include/linux/bvec.h:10,
                    from include/linux/blk_types.h:10,
                    from include/linux/blkdev.h:9,
                    from fs/orangefs/inode.c:13:
   include/linux/fs.h:2346:48: note: expected 'int' but argument is of type 'struct timespec64 *'
    2346 | extern int generic_update_time(struct inode *, int);
         |                                                ^~~
   fs/orangefs/inode.c:908:9: error: too many arguments to function 'generic_update_time'
     908 |         generic_update_time(inode, time, flags);
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/fs.h:2346:12: note: declared here
    2346 | extern int generic_update_time(struct inode *, int);
         |            ^~~~~~~~~~~~~~~~~~~
   fs/orangefs/inode.c: At top level:
   fs/orangefs/inode.c:974:24: error: initialization of 'int (*)(struct inode *, int)' from incompatible pointer type 'int (*)(struct inode *, struct timespec64 *, int)' [-Werror=incompatible-pointer-types]
     974 |         .update_time = orangefs_update_time,
         |                        ^~~~~~~~~~~~~~~~~~~~
   fs/orangefs/inode.c:974:24: note: (near initialization for 'orangefs_file_inode_operations.update_time')
   In file included from fs/orangefs/protocol.h:287,
                    from fs/orangefs/inode.c:15:
   fs/orangefs/orangefs-debug.h:86:18: warning: 'num_kmod_keyword_mask_map' defined but not used [-Wunused-const-variable=]
      86 | static const int num_kmod_keyword_mask_map = (int)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/generic_update_time +908 fs/orangefs/inode.c

933287da750ede Martin Brandenburg 2016-01-30  902  
95582b00838837 Deepa Dinamani     2018-05-08  903  int orangefs_update_time(struct inode *inode, struct timespec64 *time, int flags)
a55f2d86158500 Martin Brandenburg 2017-11-07  904  {
a55f2d86158500 Martin Brandenburg 2017-11-07  905  	struct iattr iattr;
a55f2d86158500 Martin Brandenburg 2017-11-07  906  	gossip_debug(GOSSIP_INODE_DEBUG, "orangefs_update_time: %pU\n",
a55f2d86158500 Martin Brandenburg 2017-11-07  907  	    get_khandle_from_ino(inode));
a55f2d86158500 Martin Brandenburg 2017-11-07 @908  	generic_update_time(inode, time, flags);
a55f2d86158500 Martin Brandenburg 2017-11-07  909  	memset(&iattr, 0, sizeof iattr);
a55f2d86158500 Martin Brandenburg 2017-11-07  910          if (flags & S_ATIME)
a55f2d86158500 Martin Brandenburg 2017-11-07  911  		iattr.ia_valid |= ATTR_ATIME;
a55f2d86158500 Martin Brandenburg 2017-11-07  912  	if (flags & S_CTIME)
a55f2d86158500 Martin Brandenburg 2017-11-07  913  		iattr.ia_valid |= ATTR_CTIME;
a55f2d86158500 Martin Brandenburg 2017-11-07  914  	if (flags & S_MTIME)
a55f2d86158500 Martin Brandenburg 2017-11-07  915  		iattr.ia_valid |= ATTR_MTIME;
afd9fb2a31797b Martin Brandenburg 2018-02-13  916  	return __orangefs_setattr(inode, &iattr);
a55f2d86158500 Martin Brandenburg 2017-11-07  917  }
a55f2d86158500 Martin Brandenburg 2017-11-07  918  

:::::: The code at line 908 was first introduced by commit
:::::: a55f2d861585006f493e933ad32d65d71ba631fa orangefs: stop setting atime on inode dirty

:::::: TO: Martin Brandenburg <martin@omnibond.com>
:::::: CC: Mike Marshall <hubcap@omnibond.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
