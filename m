Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2436E76410
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 03:57:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733716627; cv=none; b=lfzgZ4B5ZWwd/jkkHKvt2yoMEh0d6yxaunLBdO/LolxGD3V98sT3ri2i2/84FvHpAtXZBbpNPK+BfYca/0HQoXVdsHHJWyEIqa+POm2llUfyo0fKOl1qwTYiet4KubD7IGxo/zcQqQ2u/ITnq1Jms/HWzzN+mIevXsAhYjiNmDo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733716627; c=relaxed/simple;
	bh=xeDaEktiXKNRX9+8lnlmiatf46YKce3jpTZDNGYdpzg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gRJRPdKUutIswzEvfFjuu0Qbw27pjb8epi2ltY+K9lMOdHIcJYyU1aEyxc2AytNI6AdP+h+JdH0o40qZMdD83AIciQRYCyIx+o3EKpcH8Ls18IFZ53K1KBRsephfca/+YOuMxHjQjXejHAIoCMjM6dXQ2Pszp6C28r7PWCfto0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SNNHsMK+; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SNNHsMK+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733716625; x=1765252625;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xeDaEktiXKNRX9+8lnlmiatf46YKce3jpTZDNGYdpzg=;
  b=SNNHsMK+KBFuQs48jGXrQkhK4hKP7BP4YAtgL7bxnqbD0wqCuP4W/IW+
   pp3B4QPyJxV/62bFgKTdS7PgJfzHPLLQfZsLKLsWCtG4syVCDh79Fwxem
   nQ+rvYSVIYOrAh1NiR9e2ZIEwAcsGEyqqbX0HmJx7F3hP/jFW1RjIfjbT
   3Uqvg7ZH8wyRsa4IPazf8uMaFbUQ6+SvTPgTYg1p/aowWNJKyq6pnjbP1
   ExXFFFhozSWxf+7OYF1LfbHBz0tTVkZb3H/mg6uaVpzj4RGwDvitBmzz2
   DD2MIic8ImZh+HvqqH3ArYK5Yu/8ZELITkJZAQAhh7uX9EBs9EQafKiRe
   g==;
X-CSE-ConnectionGUID: XTzl2C6wQRiYdW5u3ZSaDQ==
X-CSE-MsgGUID: thJFisRhTu23G+2UDB+1mA==
X-IronPort-AV: E=McAfee;i="6700,10204,11280"; a="34136360"
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="34136360"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Dec 2024 19:57:05 -0800
X-CSE-ConnectionGUID: gCwA66t6SdmRic+kTIAT0Q==
X-CSE-MsgGUID: t+1RKwtRTwGNdCkHNFQgDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,218,1728975600"; 
   d="scan'208";a="94753766"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Dec 2024 19:57:03 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKUtJ-0003ld-0B;
	Mon, 09 Dec 2024 03:57:01 +0000
Date: Mon, 9 Dec 2024 11:56:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 1/2]
 drivers/virtio/virtio_pvclock.c:49:6: warning: no previous prototype for
 function 'update_suspend_time'
Message-ID: <202412070918.rNq973VG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   195d9cb705b62681ea7f7d60f84ad75dfacdb871
commit: bf3f6f01039f7f03350da296935c1f2e2fca7550 [1/2] ANDROID: virtio: virtio_pvclock: initial driver impl
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20241207/202412070918.rNq973VG-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241207/202412070918.rNq973VG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412070918.rNq973VG-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/virtio/virtio_pvclock.c:9:
   In file included from include/linux/dma-mapping.h:10:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2030:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
>> drivers/virtio/virtio_pvclock.c:49:6: warning: no previous prototype for function 'update_suspend_time' [-Wmissing-prototypes]
      49 | void update_suspend_time(struct work_struct *work)
         |      ^
   drivers/virtio/virtio_pvclock.c:49:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
      49 | void update_suspend_time(struct work_struct *work)
         | ^
         | static 
   6 warnings generated.


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
