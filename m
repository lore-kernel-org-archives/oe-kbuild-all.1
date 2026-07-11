Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC5823E342
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Jul 2026 19:42:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783798947; cv=none; b=SsrwXCWKsiYhB2Yba3RXlUFBOJXUR5LxVCESUSl2ijNcNfY6oAZsw1Zmmx/+mMF5I3l0fyDURTjoRms+TRbzCwd4YL0K5OqLFvCUK3HGVTQyPoMRvccwR9jJBIbkh42JkWTR/dWWayOgwWuYiflTSEHh1it7K4G8o0G5IeY2wvc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783798947; c=relaxed/simple;
	bh=INF3/yhLI/Ocw1w3CEYbv4HktvesKgIw6Ai8Mlc+VDk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Fl3O6XV9UTi0iDnpcbAVwSI330ePWbgHw7Y0gABKhY+Xmtx+u0rEkclcjYWYgnNimApTcJD0Oc5tUdlIAiYbqJcN1sG8BJMPkXCKoOIey1641cS2CATvL9MTi/e/Y8M9qDeYc2HApywfaPG5jg2dAyiQ4If7rbFig1N/KPEu3TI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QA8GrmIm; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QA8GrmIm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1783798944; x=1815334944;
  h=date:from:to:cc:subject:message-id;
  bh=INF3/yhLI/Ocw1w3CEYbv4HktvesKgIw6Ai8Mlc+VDk=;
  b=QA8GrmIm0VxMPGh0UQurx3ZKNXpkmfJtdchu/4xvj68AZm8mOuou0O6d
   m7UTwOMtseYkh1iAMCfkvCqhlv8geOUDhAiJnfFFFve5o8FiFt6j2cX4Y
   zX+nEoJ9EPq4IjKvqkD9emAH6jo9XuVDTaLASJR/eflOQF2rz6Tsne8xz
   lDbcENFl1h+J4QNBbhLAGvrQmyi62qm8QXqdvh/FCIb3NZ2U5FebKw7Xm
   40GifJVxKtbkKyGyzLezJk4S09SVYJimQ4Kh5FMJVs38eVW/we7tU0Ncb
   036Kwa/X1TFw2cIoKwWN6u9pzUjfqck9ooC3030+0Ze1xKz6Ttb2yGwiD
   Q==;
X-CSE-ConnectionGUID: MhuQLz9qRXqLhMmACGkX7w==
X-CSE-MsgGUID: DEWIWWrCTWGwzNEDDiIwSQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11841"; a="95073119"
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="95073119"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jul 2026 12:42:23 -0700
X-CSE-ConnectionGUID: 1bzsp7hTQk+m9xr9t/LMFA==
X-CSE-MsgGUID: czgtty3MQuOlamyzNPa+tA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,154,1779174000"; 
   d="scan'208";a="253434429"
Received: from lkp-server02.sh.intel.com (HELO ea128546eb3d) ([10.239.97.151])
  by orviesa006.jf.intel.com with ESMTP; 11 Jul 2026 12:42:22 -0700
Received: from kbuild by ea128546eb3d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1widad-00000000KM6-1oWP;
	Sat, 11 Jul 2026 19:42:19 +0000
Date: Sun, 12 Jul 2026 03:42:15 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 181/181]
 drivers/virtio/virtio_pvclock.c:49:6: warning: no previous prototype for
 function 'update_suspend_time'
Message-ID: <202607120325.OHjPyjlG-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

Hi Colin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   1517b793772a02ed13258dd27cd6ac22fe27c5a6
commit: bf3f6f01039f7f03350da296935c1f2e2fca7550 [181/181] ANDROID: virtio: virtio_pvclock: initial driver impl
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20260712/202607120325.OHjPyjlG-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260712/202607120325.OHjPyjlG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607120325.OHjPyjlG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:94:
   include/linux/compiler-clang.h:33:9: warning: '__SANITIZE_ADDRESS__' macro redefined [-Wmacro-redefined]
      33 | #define __SANITIZE_ADDRESS__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_ADDRESS__ 1
         |         ^
>> drivers/virtio/virtio_pvclock.c:49:6: warning: no previous prototype for function 'update_suspend_time' [-Wmissing-prototypes]
      49 | void update_suspend_time(struct work_struct *work)
         |      ^
   drivers/virtio/virtio_pvclock.c:49:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      49 | void update_suspend_time(struct work_struct *work)
         | ^
         | static 
   2 warnings generated.


vim +/update_suspend_time +49 drivers/virtio/virtio_pvclock.c

    48	
  > 49	void update_suspend_time(struct work_struct *work)
    50	{
    51		u64 suspend_ns, suspend_time_delta = 0;
    52		struct timespec64 inject_time;
    53		struct virtio_pvclock *vp;
    54	
    55		vp = container_of(work, struct virtio_pvclock,
    56				  update_suspend_time_work);
    57	
    58		virtio_cread(vp->vdev, struct virtio_pvclock_config, suspend_time_ns,
    59			     &suspend_ns);
    60	
    61		mutex_lock(&vp->inject_suspend_lock);
    62		if (suspend_ns > vp->injected_suspend_ns) {
    63			suspend_time_delta = suspend_ns - vp->injected_suspend_ns;
    64			vp->injected_suspend_ns = suspend_ns;
    65		}
    66		mutex_unlock(&vp->inject_suspend_lock);
    67	
    68		if (suspend_time_delta == 0) {
    69			dev_err(&vp->vdev->dev,
    70				"%s: suspend_time_ns is less than injected_suspend_ns\n",
    71				__func__);
    72			return;
    73		}
    74	
    75		inject_time = ns_to_timespec64(suspend_time_delta);
    76	
    77		timekeeping_inject_sleeptime64(&inject_time);
    78	
    79		dev_info(&vp->vdev->dev, "injected sleeptime: %llu ns\n",
    80			 suspend_time_delta);
    81	}
    82	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
