Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BD1F8F6F
	for <oe-kbuild-all@lists.linux.dev>; Sat,  5 Aug 2023 11:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691235572; x=1722771572;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uVSNOYTCgGQ1CuYSkUhGtCPGVLEPCv2giiOj53yjfkM=;
  b=fvyJrAaDFvb0mUfB8Lo4RUzcZKBTIrMlBJlHw+dnvQ2EDTRuAWALzofo
   0d2zPIqdzeB0szDRqZMGYocdmjboFvWJWcAcHnKgY6zKr5ZlNiC6xKtpO
   SCCHqkyEl9Awv7i2mE2/loYGiaTJQlopPyuj4AwKrV8foLzxDz8bPEAZe
   DC9C1bQIUYIhSvn51t9DiUpjf4ij2+Ks+AoIrSpvaslLjInHN3Ib+lKPy
   opTRUhzBOcs3p6smo1NEAQ1eSmsZf6wawrR/QjWrVXM+d+J0t70AdZZYV
   du0CL9CfQY8f9E3tfA+D2GlVMq2Dfem01bNh5/imWiYblG7jvIzVItppI
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="373967796"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="373967796"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Aug 2023 04:39:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10792"; a="976889202"
X-IronPort-AV: E=Sophos;i="6.01,257,1684825200"; 
   d="scan'208";a="976889202"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 Aug 2023 04:39:30 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qSFd3-0003UF-2T;
	Sat, 05 Aug 2023 11:39:29 +0000
Date: Sat, 5 Aug 2023 19:39:29 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgctime 4/10] fs/orangefs/inode.c:906:13: warning: unused
 variable 'dirty_flags'
Message-ID: <202308051903.k8ld1GlO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgctime
head:   e84ede6c44e4d6e1716d0d54bbda0b1b298cc801
commit: 9eb0ea317f50681da8fe3c40899d1ca67301fb13 [4/10] fs: rework generic_update_time to update timestamps itself
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230805/202308051903.k8ld1GlO-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230805/202308051903.k8ld1GlO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308051903.k8ld1GlO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/orangefs/inode.c: In function 'orangefs_update_time':
>> fs/orangefs/inode.c:906:13: warning: unused variable 'dirty_flags' [-Wunused-variable]
     906 |         int dirty_flags = 0;
         |             ^~~~~~~~~~~
   In file included from fs/orangefs/protocol.h:287,
                    from fs/orangefs/inode.c:15:
   fs/orangefs/orangefs-debug.h: At top level:
   fs/orangefs/orangefs-debug.h:86:18: warning: 'num_kmod_keyword_mask_map' defined but not used [-Wunused-const-variable=]
      86 | static const int num_kmod_keyword_mask_map = (int)
         |                  ^~~~~~~~~~~~~~~~~~~~~~~~~


vim +/dirty_flags +906 fs/orangefs/inode.c

   902	
   903	int orangefs_update_time(struct inode *inode, struct timespec64 *time, int flags)
   904	{
   905		struct iattr iattr;
 > 906		int dirty_flags = 0;
   907	
   908		gossip_debug(GOSSIP_INODE_DEBUG, "orangefs_update_time: %pU\n",
   909		    get_khandle_from_ino(inode));
   910		flags = generic_update_time(inode, flags);
   911		memset(&iattr, 0, sizeof iattr);
   912	        if (flags & S_ATIME)
   913			iattr.ia_valid |= ATTR_ATIME;
   914		if (flags & S_CTIME)
   915			iattr.ia_valid |= ATTR_CTIME;
   916		if (flags & S_MTIME)
   917			iattr.ia_valid |= ATTR_MTIME;
   918		return __orangefs_setattr(inode, &iattr);
   919	}
   920	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
