Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3CC3FCC
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 02:23:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774664631; cv=none; b=Ql9M8GnuFGk4TwDCwf98VD3qsmGxehAYRIrF5T0w/x6b/Cba/WsDMgvasQwfRQx22lmDWLZl6ZnTakwaTPAqRnnQNM8RFZQK0JiVS9oxBSwMrwwrgZ3QbVBwpqWFv5aHCW58uehzdHMqP9hRcWU+wAZS1TwafVrUIu1L3SZWdr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774664631; c=relaxed/simple;
	bh=LW8+pmy0AkdyvX30CJJM9XoGS/6oTWTLP5zn7tc15Jk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=EedHrFCHL8d48WpKxWIuoOBrbHo6EElG84WEzJJsiSrieWBvQVcX05mgHN+Xu3myzh51ffFqGtrt3hiDpYEjBLt6eL5Hb4xvgQjk0aeu6UVohZw5Ms+PozyRb7JEPnM9rKBF634rTv3T96E+v3/+698Ilqpn7b2spRQ5iQ6ZDfk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Oe7OD0Da; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Oe7OD0Da"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774664628; x=1806200628;
  h=date:from:to:cc:subject:message-id;
  bh=LW8+pmy0AkdyvX30CJJM9XoGS/6oTWTLP5zn7tc15Jk=;
  b=Oe7OD0Da4mzy7i8toXTjA2ZA00JtaV/PiKHEaByfMAhoK6+YXyq0a4XV
   to0tj4fFIiE5U6uRI2WppK13rHjeOOtPxZU1KaoQCNmYXA3dFndP56ADO
   TumQzs12R0HqlVHWzU+5Nn8xkmG9aNB5pClBZn65L1ZExHHtEa/GLOLIK
   1JedFuStIDKo19XM4XhsZBoRxW5ht7dMirKJbECuIvMa/UyPnLVE72Tgp
   oMTpx4LIclHOCqvVzYW0IJ2DBd/0GOQR1Ji/uBLKKAiGcncBfh9qoUnUs
   CyaWx7bBvu1mtrQ5EnJoNKn64bw/KDxGrv+YeJhgWyThAYhidExVPKIQr
   w==;
X-CSE-ConnectionGUID: SJ2TFA8VRG6w4GROcc6d9A==
X-CSE-MsgGUID: rEEG15r9QD+5ovoQRIUOKA==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="79349188"
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="79349188"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Mar 2026 19:23:47 -0700
X-CSE-ConnectionGUID: qzV/zr6OTVaIMvf5wqQRgQ==
X-CSE-MsgGUID: cCR7IgHGTzmPmgDe3PYVcg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,145,1770624000"; 
   d="scan'208";a="230262097"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 27 Mar 2026 19:23:46 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6JKw-00000000B0T-3HXY;
	Sat, 28 Mar 2026 02:23:42 +0000
Date: Sat, 28 Mar 2026 10:23:06 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 5/5] fs/fuse/dev.c:213:
 warning: Function parameter or member 'sync' not described in
 'fuse_dev_wake_and_unlock'
Message-ID: <202603281030.rOOeMCvG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   5358ce5b12374ccfca58d40797ac7c5dad72ff05
commit: c6ca13e9aa82eae71566f1ef9d91051135153934 [5/5] FROMLIST: fuse: give wakeup hints to the scheduler
config: x86_64-randconfig-104-20260322 (https://download.01.org/0day-ci/archive/20260328/202603281030.rOOeMCvG-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603281030.rOOeMCvG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603281030.rOOeMCvG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   fs/fuse/dev.c:213: warning: Function parameter or member 'fiq' not described in 'fuse_dev_wake_and_unlock'
>> fs/fuse/dev.c:213: warning: Function parameter or member 'sync' not described in 'fuse_dev_wake_and_unlock'
   fs/fuse/dev.c:213: warning: expecting prototype for A new request is available, wake fiq(). Prototype was for fuse_dev_wake_and_unlock() instead


vim +213 fs/fuse/dev.c

be2ff42c5d6ebc8 Kirill Tkhai    2018-09-11  207  
ae3aad77f46fbba Stefan Hajnoczi 2018-06-18  208  /**
ae3aad77f46fbba Stefan Hajnoczi 2018-06-18  209   * A new request is available, wake fiq->waitq
ae3aad77f46fbba Stefan Hajnoczi 2018-06-18  210   */
c6ca13e9aa82eae Pradeep P V K   2021-12-06  211  static void fuse_dev_wake_and_unlock(struct fuse_iqueue *fiq, bool sync)
ae3aad77f46fbba Stefan Hajnoczi 2018-06-18  212  __releases(fiq->lock)
ae3aad77f46fbba Stefan Hajnoczi 2018-06-18 @213  {
c6ca13e9aa82eae Pradeep P V K   2021-12-06  214  	if (sync)
c6ca13e9aa82eae Pradeep P V K   2021-12-06  215  		wake_up_sync(&fiq->waitq);
c6ca13e9aa82eae Pradeep P V K   2021-12-06  216  	else
ae3aad77f46fbba Stefan Hajnoczi 2018-06-18  217  		wake_up(&fiq->waitq);
ae3aad77f46fbba Stefan Hajnoczi 2018-06-18  218  	kill_fasync(&fiq->fasync, SIGIO, POLL_IN);
ae3aad77f46fbba Stefan Hajnoczi 2018-06-18  219  	spin_unlock(&fiq->lock);
ae3aad77f46fbba Stefan Hajnoczi 2018-06-18  220  }
ae3aad77f46fbba Stefan Hajnoczi 2018-06-18  221  

:::::: The code at line 213 was first introduced by commit
:::::: ae3aad77f46fbba56eff7141b2fc49870b60827e fuse: add fuse_iqueue_ops callbacks

:::::: TO: Stefan Hajnoczi <stefanha@redhat.com>
:::::: CC: Miklos Szeredi <mszeredi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
