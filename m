Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C125E1DDD9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Jan 2024 07:19:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KcbL0Nne"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704439160; x=1735975160;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MetQdrV+7oOUdNdqZjmdAbSsI/5Byh7LU939if3645c=;
  b=KcbL0NnetnCC/gxgJBn6ppKH2ysUgAGYza721FeP0zq7KD0u2WeR6k8T
   osg+9wyF8vlZzkF+rJi2+Ao0WSjA3nx7eubFm8dFxdTB8g+RWllP8ug1G
   cpqfv6+zGRFadJpGtsgIGkhXUcg8i6iGq2UvJ+horxVGnoTMIWAAnDovA
   88aoxN5XijkZYZBCGxhKBFTtTbwThoAzKykM2hsDvCipM00ai3nBoRGe9
   Z9mh06um/0ZVMHNdbBXXvIibDBjoULIViSl73Rf+QUkIdoXb4pxYGvkbA
   Gm2H6IMa1o8EGDMzKcDcRBGrECk8BU+ZkCRe0bxA+yclPxED503Hu06vz
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="400210705"
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="400210705"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 23:19:20 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,333,1695711600"; 
   d="scan'208";a="29053401"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 04 Jan 2024 23:19:19 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLeU8-0000vS-20;
	Fri, 05 Jan 2024 07:19:16 +0000
Date: Fri, 5 Jan 2024 15:18:16 +0800
From: kernel test robot <lkp@intel.com>
To: Jeff Layton <jlayton@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jlayton:leases 7/8] fs/lockd/svclock.c:405:15: error: no member
 named 'fl_owner' in 'struct file_lock'
Message-ID: <202401051503.SYnGmlYD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jeff,

FYI, the error/warning was bisected to this commit, please ignore it if it's irrelevant.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jlayton/linux.git leases
head:   bfa9c95ea16416c581e8940d6d36de21aca94011
commit: 14f919869f407fb2e693e4edbe541124d5eda2c6 [7/8] filelock: move fl_owner into fl_core
config: i386-randconfig-061-20240105 (https://download.01.org/0day-ci/archive/20240105/202401051503.SYnGmlYD-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401051503.SYnGmlYD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401051503.SYnGmlYD-lkp@intel.com/

All errors (new ones prefixed by >>):

>> fs/lockd/svclock.c:405:15: error: no member named 'fl_owner' in 'struct file_lock'
     405 |         if (lock->fl.fl_owner)
         |             ~~~~~~~~ ^
   fs/lockd/svclock.c:406:33: error: no member named 'fl_owner' in 'struct file_lock'
     406 |                 nlmsvc_put_lockowner(lock->fl.fl_owner);
         |                                      ~~~~~~~~ ^
   fs/lockd/svclock.c:428:61: error: no member named 'fl_owner' in 'struct file_lock'
     428 |         call->a_args.lock.svid = ((struct nlm_lockowner *)lock->fl.fl_owner)->pid;
         |                                                           ~~~~~~~~ ^
   3 errors generated.
--
>> fs/lockd/svcproc.c:85:17: error: no member named 'fl_owner' in 'struct file_lock'
      85 |                 if (!lock->fl.fl_owner) {
         |                      ~~~~~~~~ ^
   fs/lockd/svcproc.c:130:29: error: no member named 'fl_owner' in 'struct file_lock'
     130 |         test_owner = argp->lock.fl.fl_owner;
         |                      ~~~~~~~~~~~~~ ^
   2 errors generated.
--
>> fs/lockd/svcsubs.c:187:7: error: no member named 'fl_owner' in 'struct file_lock'
     187 |         lock.fl_owner = fl->fl_core.fl_owner;
         |         ~~~~ ^
   1 error generated.
--
>> fs/lockd/svc4proc.c:64:17: error: no member named 'fl_owner' in 'struct file_lock'
      64 |                 if (!lock->fl.fl_owner) {
         |                      ~~~~~~~~ ^
   fs/lockd/svc4proc.c:109:29: error: no member named 'fl_owner' in 'struct file_lock'
     109 |         test_owner = argp->lock.fl.fl_owner;
         |                      ~~~~~~~~~~~~~ ^
   2 errors generated.


vim +405 fs/lockd/svclock.c

89e0edfbea103d9 Benjamin Coddington 2019-05-23  401  
89e0edfbea103d9 Benjamin Coddington 2019-05-23  402  void
89e0edfbea103d9 Benjamin Coddington 2019-05-23  403  nlmsvc_release_lockowner(struct nlm_lock *lock)
89e0edfbea103d9 Benjamin Coddington 2019-05-23  404  {
89e0edfbea103d9 Benjamin Coddington 2019-05-23 @405  	if (lock->fl.fl_owner)
89e0edfbea103d9 Benjamin Coddington 2019-05-23  406  		nlmsvc_put_lockowner(lock->fl.fl_owner);
89e0edfbea103d9 Benjamin Coddington 2019-05-23  407  }
89e0edfbea103d9 Benjamin Coddington 2019-05-23  408  

:::::: The code at line 405 was first introduced by commit
:::::: 89e0edfbea103d9b274efa10a8fc7a88bdac8f76 lockd: Convert NLM service fl_owner to nlm_lockowner

:::::: TO: Benjamin Coddington <bcodding@redhat.com>
:::::: CC: J. Bruce Fields <bfields@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
