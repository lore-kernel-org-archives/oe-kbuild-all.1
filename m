Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792727038;
	b=tqpBwFiavftGBYwjHDfBdCGYEApFWYBNDr7syRBZDgWYE70YXHvhRWXNK5ZItx51L1kI
	 OCAYSEHP+P5UcYG4wGxONTSMurSFw9tjsBx5XBN02DYDlyRRjEnGMfRt0Ia5UBF/yn1l3
	 i/VS8DSp/6NX3Alr6lbJmghk1U8RLL0FN3t49W/Vdf5vOG3LiMk38tcdA52EVTL6gYNEI
	 QV2JABCIsPK+BsN5Ka1TSjcOqLSirVSfYNp1d3pE9XfBKsFNeaLx4xXaQbWDb/mbJuqRN
	 IhAZpBLn87TpN8I86DG8AfQI9WXs4Zo5O7rsq3Y6HFMrM/9mr5qSmiKxaJ96q221Qaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792727038;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kGAxfXaLl7bbml/IqQ6qcVdP1a0UIUaZp84Cq+8lmsM=;
	b=0s8y0Sb1fgAwdmc5Vr7dwAU6Q2PQseHW9QdYd6e14ldJlDrDIoMueANxAVOLdhWrgq6b
	 UsJnmkSYyOivefnEthKxpvtslRTUG5IGJTjLREJEb61X94xz9XW7FF3t8Sw7yocfEyJRJ
	 HIXoSCjtZiX/MHS9Nt+MDs5neT+vwk6UbAgFxoOKGviN45Z94xgkPYS6a0wQVP8bzLEEK
	 mIHoGsThOfC2T5brOtv8l9pgbFZuCyBqoxtkfwy+y0N6LZOZLrgRiy3IaRiGTzg4UO64V
	 DanuFBMbT+4/frsLtRm3pYn2AcQqQtHuJjWi20Vhu5lQ5Mb1NY75mqM/wIae5wZ+d0g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dTD9uamU;
	arc=none smtp.remote-ip=198.175.65.12
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A062606A320
	for <oe-kbuild-all@lists.linux.dev>; Fri, 23 Oct 2026 03:43:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5A062606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=dTD9uamU
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792727036; x=1824263036;
  h=date:from:to:cc:subject:message-id;
  bh=xGMTNhnhtiuOTWvaT49+Oapf4lIJuKGdgWslE+G0S6A=;
  b=dTD9uamUMUDX01K4B3NHejx3d2KKmq2uGYLHHcCJ51rTwvlclu4nviHV
   RJqt6wWt7WbpWoZlCssg0ehqT6TOBrcIIptb7wTaQPWTVmiqiainLVaee
   CjyJpi1vIdbP5Dny7G6K/LXStGGpPCteKuSPUigKytKMV5IViWmS5v/80
   f0MJVj5/RYI6QC6sywXjqJ+3RVg38QS+83d2Ib4PZwy0MZtX2NdmzQuZX
   xbtZftQ0Vq7J/lkZJRkCDPjz65NEIdqqgPDfU38eLntpfqT1JnawpSdmm
   QDWR0+/V/e8eNYD0fZY0QuRhYiIx6l/rGGwMPJPZQcmx60mwObzDctTog
   g==;
X-CSE-ConnectionGUID: DtYLNabeSPO6czyOvE2u1w==
X-CSE-MsgGUID: hByrG7i2R/WH78BPfFOC/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11943"; a="1366567"
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="1366567"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 20:43:56 -0700
X-CSE-ConnectionGUID: ybOrxGveRUSHyz4vpOA8Vw==
X-CSE-MsgGUID: p3BqOemyQXaCe3X89QaL7A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,173,1787036400"; 
   d="scan'208";a="3438480"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Oct 2026 20:43:54 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xK6C8-00000000S6A-1UYy;
	Fri, 23 Oct 2026 03:43:52 +0000
Date: Fri, 23 Oct 2026 11:42:59 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 347/347]
 drivers/virtio/virtio_pvclock.c:49:6: warning: no previous prototype for
 function 'update_suspend_time'
Message-ID: <202610231150.mbNfjgIo-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Colin,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   197f6e4d013155f82e6c7a4f8917da803628f323
commit: bf3f6f01039f7f03350da296935c1f2e2fca7550 [347/347] ANDROID: virtio: virtio_pvclock: initial driver impl
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20261023/202610231150.mbNfjgIo-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610231150.mbNfjgIo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610231150.mbNfjgIo-lkp@intel.com/

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
