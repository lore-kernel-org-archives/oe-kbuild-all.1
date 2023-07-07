Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7843D17ACA
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Jul 2023 22:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688767633; x=1720303633;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CV6iS8MJX0duEAetke9uoz2ohWTj3Aozk1A8ICekzhw=;
  b=dLI0KCMYB3E9iCj5tzMZqRAtKLMbYGWwzmzM9a0fiUrpLxzxtKWKXAqu
   CmrgYC6Ddogm16P+dCVrNRrpQNy31ppjJQTb0isjQOhi8+rT6YA6DHcS3
   6h1EfbpYl+lNacAS7vKs+pPlgQvNw8csvInQGlpfACT5Qfk1rWeotGMD5
   xg8D2PPQL3C/uFgxsxQ/CIVeyIfKAhQg+3YsessM0Ar3CYwYnSw/L9OyZ
   e0QI5u8BRsZylgzpU7JNs31aNmj2Xui6GI07Gb6N1KTuB1uDVd18hCwxw
   buGXnIWspGV3NXEnRTWTuo18t6y1UlWOw47lJl6EAGw9c/lS6kKsB1bNT
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="427677751"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="427677751"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jul 2023 15:07:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10764"; a="966763816"
X-IronPort-AV: E=Sophos;i="6.01,189,1684825200"; 
   d="scan'208";a="966763816"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 07 Jul 2023 15:07:11 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHtba-0002KY-2s;
	Fri, 07 Jul 2023 22:07:10 +0000
Date: Sat, 8 Jul 2023 06:06:21 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:mgctime 98/106] fs/inode.c:2081:19: warning: no previous
 prototype for 'current_mg_time'
Message-ID: <202307080641.rXmWDajL-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git mgctime
head:   1af6cffa656fe06b30ca4bd6dbf1acc456e49f56
commit: dcef79543331362189988bf4c5ef2f99f79ff43f [98/106] fs: add infrastructure for multigrain inode i_m/ctime
config: alpha-randconfig-r032-20230708 (https://download.01.org/0day-ci/archive/20230708/202307080641.rXmWDajL-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230708/202307080641.rXmWDajL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307080641.rXmWDajL-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/inode.c: In function 'atime_needs_update':
   fs/inode.c:1953:15: error: implicit declaration of function 'current_coarse_time'; did you mean 'current_time'? [-Werror=implicit-function-declaration]
    1953 |         now = current_coarse_time(inode);
         |               ^~~~~~~~~~~~~~~~~~~
         |               current_time
   fs/inode.c:1953:15: error: incompatible types when assigning to type 'struct timespec64' from type 'int'
   fs/inode.c: In function 'touch_atime':
   fs/inode.c:1987:15: error: incompatible types when assigning to type 'struct timespec64' from type 'int'
    1987 |         now = current_coarse_time(inode);
         |               ^~~~~~~~~~~~~~~~~~~
   fs/inode.c: At top level:
>> fs/inode.c:2081:19: warning: no previous prototype for 'current_mg_time' [-Wmissing-prototypes]
    2081 | struct timespec64 current_mg_time(struct inode *inode)
         |                   ^~~~~~~~~~~~~~~
   fs/inode.c:2115:26: error: conflicting types for 'current_coarse_time'; have 'struct timespec64(struct inode *)'
    2115 | static struct timespec64 current_coarse_time(struct inode *inode)
         |                          ^~~~~~~~~~~~~~~~~~~
   fs/inode.c:1953:15: note: previous implicit declaration of 'current_coarse_time' with type 'int()'
    1953 |         now = current_coarse_time(inode);
         |               ^~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/current_mg_time +2081 fs/inode.c

  2072	
  2073	/**
  2074	 * current_mg_time - Return FS time (possibly fine-grained)
  2075	 * @inode: inode.
  2076	 *
  2077	 * Return the current time truncated to the time granularity supported by
  2078	 * the fs, as suitable for a ctime/mtime change. If the ctime is flagged
  2079	 * as having been QUERIED, get a fine-grained timestamp.
  2080	 */
> 2081	struct timespec64 current_mg_time(struct inode *inode)
  2082	{
  2083		struct timespec64 now;
  2084		atomic_long_t *pnsec = (atomic_long_t *)&inode->__i_ctime.tv_nsec;
  2085		long nsec = atomic_long_read(pnsec);
  2086	
  2087		if (nsec & I_CTIME_QUERIED) {
  2088			ktime_get_real_ts64(&now);
  2089		} else {
  2090			struct timespec64 ctime;
  2091	
  2092			ktime_get_coarse_real_ts64(&now);
  2093	
  2094			/*
  2095			 * If we've recently fetched a fine-grained timestamp
  2096			 * then the coarse-grained one may still be earlier than the
  2097			 * existing one. Just keep the existing ctime if so.
  2098			 */
  2099			ctime = inode_get_ctime(inode);
  2100			if (timespec64_compare(&ctime, &now) > 0)
  2101				now = ctime;
  2102		}
  2103	
  2104		return timestamp_truncate(now, inode);
  2105	}
  2106	EXPORT_SYMBOL(current_mg_time);
  2107	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
