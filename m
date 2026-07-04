Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B88234F492
	for <oe-kbuild-all@lists.linux.dev>; Sat,  4 Jul 2026 05:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783143245; cv=none; b=j2jdbIgiFwZtwGXGDkbCSJ2ELAvkAQr/+0fEBsrqvS5jdNh3ZS6iNPFTDFf22JbgOqm+CI2TZxbfsBwnAh5wrK78/nksUPiqt0Nr+gBHC3Akdbe/OOtCw3VXB0lGIUWxK9mGIxLzZ2yhfpXOaF1MZL9+OoARt5trXYva+id8dMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783143245; c=relaxed/simple;
	bh=jGz0J6HN5U6JM7seQKm5861yt1f2B+nq/4cvDQpxlhM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=hN5LFUqMyumXSJL7t6e00/TkK0a7sB/bqp4CEE173j6vVijjwv5/pD6OJa4Bvtuaxa6RfXHeYolDMEi+XnkSt+BXtWv7jveZ5ict2zOa2fVsptg3WEyR15bjtUM2lk8/+7s8Bqmas4V1ot8S/2og7j2WdlIGC/vnvtFRv+UWX8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=fXEue9SX; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="fXEue9SX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783143243; x=1814679243;
  h=date:from:to:cc:subject:message-id;
  bh=jGz0J6HN5U6JM7seQKm5861yt1f2B+nq/4cvDQpxlhM=;
  b=fXEue9SXkG+HHXJL5L7/ih1JL9C3M9OW6U5BvZhWgB8ThXjudMRPAI5T
   nBf1dxC/A2MifjXzo7MRr9o1R7QfvKiAhLNI5xfgjMsYjefzAbckr+CWZ
   5GiiuelIip2/PME1E8gwVMFvxsSWqDFBRIKOAQRNFBqUWhXOlzmOzhSh9
   SeI+H32OYE6Y+oQ8IPBKBLl9Z9AGbwxmnw8B/buJeWmyiQeBXVZF2ltaQ
   JShDE5b3g+5T9+TR6ZLA4X2jIOMPrVZm8roRFghdQPSj37RmDb52RdObS
   RpFjMw6zXSo6sbD563DEE8e5JIjDHo28kv6djUNjVZpiGoMFBR+wvobcI
   w==;
X-CSE-ConnectionGUID: CVKsn/D4R1SdFurLb3Fy6A==
X-CSE-MsgGUID: nLl9x0whRQGJ2+783p0iGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11836"; a="83854459"
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="83854459"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Jul 2026 22:33:56 -0700
X-CSE-ConnectionGUID: V4SyeTDgRMibN0QlN4Nj+A==
X-CSE-MsgGUID: ZC0CfTPCS0izakeadNkBxA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,147,1779174000"; 
   d="scan'208";a="257581234"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa005.jf.intel.com with ESMTP; 03 Jul 2026 22:33:55 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wft0i-00000000Csl-2NII;
	Sat, 04 Jul 2026 05:33:52 +0000
Date: Sat, 04 Jul 2026 13:32:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android12-5.10 0/1] fs/fuse/dev.c:213:
 warning: Function parameter or member 'sync' not described in
 'fuse_dev_wake_and_unlock'
Message-ID: <202607041301.VRf0LRtn-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android12-5.10
head:   a00af2707c1d0a67daa8f91db74300f65d84db3b
commit: 05a8f2c4d2f5b0664b97f3c426783cc26a946b3b [0/1] FROMLIST: fuse: give wakeup hints to the scheduler
config: i386-randconfig-012-20260702 (https://download.01.org/0day-ci/archive/20260704/202607041301.VRf0LRtn-lkp@intel.com/config)
compiler: gcc-13 (Debian 13.3.0-16) 13.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260704/202607041301.VRf0LRtn-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607041301.VRf0LRtn-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/fuse/dev.c:213: warning: Function parameter or member 'fiq' not described in 'fuse_dev_wake_and_unlock'
>> fs/fuse/dev.c:213: warning: Function parameter or member 'sync' not described in 'fuse_dev_wake_and_unlock'


vim +213 fs/fuse/dev.c

be2ff42c5d6ebc Kirill Tkhai    2018-09-11  207  
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18  208  /**
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18  209   * A new request is available, wake fiq->waitq
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18  210   */
05a8f2c4d2f5b0 Pradeep P V K   2021-12-06  211  static void fuse_dev_wake_and_unlock(struct fuse_iqueue *fiq, bool sync)
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18  212  __releases(fiq->lock)
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18 @213  {
05a8f2c4d2f5b0 Pradeep P V K   2021-12-06  214  	if (sync)
05a8f2c4d2f5b0 Pradeep P V K   2021-12-06  215  		wake_up_sync(&fiq->waitq);
05a8f2c4d2f5b0 Pradeep P V K   2021-12-06  216  	else
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18  217  		wake_up(&fiq->waitq);
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18  218  	kill_fasync(&fiq->fasync, SIGIO, POLL_IN);
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18  219  	spin_unlock(&fiq->lock);
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18  220  }
ae3aad77f46fbb Stefan Hajnoczi 2018-06-18  221  

:::::: The code at line 213 was first introduced by commit
:::::: ae3aad77f46fbba56eff7141b2fc49870b60827e fuse: add fuse_iqueue_ops callbacks

:::::: TO: Stefan Hajnoczi <stefanha@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
