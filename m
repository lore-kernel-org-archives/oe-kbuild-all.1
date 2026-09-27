Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F13FA2FD7D3
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Sep 2026 11:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790506834; cv=none; b=rpOw4wqeNJh3dytSUCpi3MZd291FeiRRtX68RkaDBi4xYndym9d88B1wQq8wlST5N0SxKAbKRhpishxeaoYmalNPDntD79FoTGt0GB+4ZB104pk6qqnFtMg23elSUIypy+sXZ9mKD8VLNDU+lnsDfUGpIm0Vs1ES2TQhq0WxpFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790506834; c=relaxed/simple;
	bh=nv6lekiCLCtCVjB/96cngWVG6hPUVVvsZZ93TmTlC3M=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Q7Lq3uTqwQMY4ky93K8L0/l88bGcqAS9EOwL/3oLLdykJnRIveXcy2rlkC0wpO4V7VmJfU0AElSjDWTayU40mUvjcXf9JhG2My9+J3QVfVsPRbhWS46QYIXXjHXDQ30zt2ZUyB8hfMh3A6TbNY5FgTtGZHPi/vseluzx7D50bUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=eBOgAkyf; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="eBOgAkyf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790506832; x=1822042832;
  h=date:from:to:cc:subject:message-id;
  bh=nv6lekiCLCtCVjB/96cngWVG6hPUVVvsZZ93TmTlC3M=;
  b=eBOgAkyfrPN6PpX+WC2mETULbf2wVZGmg8m5GXPIgxCOF4Auigdy/PZQ
   CLL7caXD4KV7V0f/oiXR3TljIjZ6/7V/pLZcDLKsa6EvzjhLSFeCTo7GN
   8WQDdAXSMYNcPr7F1mPBgkal2EH7zhAsk7JV6V3UA57BdxAsH82m7xEJQ
   g3Q54a7yPVj4AfpvowmK0IEqTExy/eAOskQKp/v0OmiVxl2y/gyFc77XZ
   qehq0/oXPQ7Z42ldZGPdgOUJRWbGMvnIz0sZmc+gCwSbq4tiislgonsep
   s/NpqTLpezNVMKQPKqpbRcym44RyPvnDDLtgW5SHXI8Tb6GcHruBD9D86
   w==;
X-CSE-ConnectionGUID: REHcNlJrTvi4uFPXyKJ3Zw==
X-CSE-MsgGUID: ld0vOLibRwGZxq2LKpaJFg==
X-IronPort-AV: E=McAfee;i="6800,10657,11917"; a="100561526"
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="100561526"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2026 04:00:31 -0700
X-CSE-ConnectionGUID: nHzYpbVnR2ythaNC34Y/Aw==
X-CSE-MsgGUID: nmLg5z9JTiivgqtnKU2Yrg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,126,1787036400"; 
   d="scan'208";a="274907208"
Received: from igk-lkp-server01.igk.intel.com (HELO 04362d00df5a) ([10.211.93.152])
  by fmviesa008.fm.intel.com with ESMTP; 27 Sep 2026 04:00:30 -0700
Received: from kbuild by 04362d00df5a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xAmcN-000000000YB-3S1K;
	Sun, 27 Sep 2026 11:00:27 +0000
Date: Sun, 27 Sep 2026 12:59:36 +0200
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2026-03 2/2]
 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:972:55: sparse:
 sparse: incorrect type in argument 6 (different address spaces)
Message-ID: <202609271225.THgvO6jH-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2026-03
head:   5db86224e3c427ca56cb943d55a31e39eb7e22f2
commit: 206030f6a92bd97997fba8ebb86e78058edecb97 [2/2] staging: vchiq_core: Factor out bulk transfer for blocking mode
config: arm64-randconfig-r2302-20260927 (https://download.01.org/0day-ci/archive/20260927/202609271225.THgvO6jH-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 7615da10b75c57286a4032eac8bb43c1b8d2ba46)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260927/202609271225.THgvO6jH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Fixes: 206030f6a92b ("staging: vchiq_core: Factor out bulk transfer for blocking mode")
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609271225.THgvO6jH-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:972:55: sparse: sparse: incorrect type in argument 6 (different address spaces) @@     expected void [noderef] __user *userdata @@     got struct bulk_waiter * @@
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:972:55: sparse:     expected void [noderef] __user *userdata
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c:972:55: sparse:     got struct bulk_waiter *
--
>> drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:3130:58: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected void *userdata @@     got void [noderef] __user *userdata @@
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:3130:58: sparse:     expected void *userdata
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:3130:58: sparse:     got void [noderef] __user *userdata
   drivers/staging/vc04_services/interface/vchiq_arm/vchiq_core.c:2162:15: sparse: sparse: memset with byte count of 230904

vim +972 drivers/staging/vc04_services/interface/vchiq_arm/vchiq_arm.c

   924	
   925	static int
   926	vchiq_blocking_bulk_transfer(struct vchiq_instance *instance, unsigned int handle, void *data,
   927				     unsigned int size, enum vchiq_bulk_dir dir)
   928	{
   929		struct vchiq_service *service;
   930		struct bulk_waiter_node *waiter = NULL, *iter;
   931		int ret;
   932	
   933		service = find_service_by_handle(instance, handle);
   934		if (!service)
   935			return -EINVAL;
   936	
   937		vchiq_service_put(service);
   938	
   939		mutex_lock(&instance->bulk_waiter_list_mutex);
   940		list_for_each_entry(iter, &instance->bulk_waiter_list, list) {
   941			if (iter->pid == current->pid) {
   942				list_del(&iter->list);
   943				waiter = iter;
   944				break;
   945			}
   946		}
   947		mutex_unlock(&instance->bulk_waiter_list_mutex);
   948	
   949		if (waiter) {
   950			struct vchiq_bulk *bulk = waiter->bulk_waiter.bulk;
   951	
   952			if (bulk) {
   953				/* This thread has an outstanding bulk transfer. */
   954				/* FIXME: why compare a dma address to a pointer? */
   955				if ((bulk->data != (dma_addr_t)(uintptr_t)data) || (bulk->size != size)) {
   956					/*
   957					 * This is not a retry of the previous one.
   958					 * Cancel the signal when the transfer completes.
   959					 */
   960					spin_lock(&service->state->bulk_waiter_spinlock);
   961					bulk->userdata = NULL;
   962					spin_unlock(&service->state->bulk_waiter_spinlock);
   963				}
   964			}
   965		} else {
   966			waiter = kzalloc(sizeof(*waiter), GFP_KERNEL);
   967			if (!waiter)
   968				return -ENOMEM;
   969		}
   970	
   971		ret = vchiq_bulk_xfer_blocking_interruptible(instance, handle, data, NULL, size,
 > 972							     &waiter->bulk_waiter, dir);
   973		if ((ret != -EAGAIN) || fatal_signal_pending(current) || !waiter->bulk_waiter.bulk) {
   974			struct vchiq_bulk *bulk = waiter->bulk_waiter.bulk;
   975	
   976			if (bulk) {
   977				/* Cancel the signal when the transfer completes. */
   978				spin_lock(&service->state->bulk_waiter_spinlock);
   979				bulk->userdata = NULL;
   980				spin_unlock(&service->state->bulk_waiter_spinlock);
   981			}
   982			kfree(waiter);
   983		} else {
   984			waiter->pid = current->pid;
   985			mutex_lock(&instance->bulk_waiter_list_mutex);
   986			list_add(&waiter->list, &instance->bulk_waiter_list);
   987			mutex_unlock(&instance->bulk_waiter_list_mutex);
   988			dev_dbg(instance->state->dev, "arm: saved bulk_waiter %pK for pid %d\n",
   989				waiter, current->pid);
   990		}
   991	
   992		return ret;
   993	}
   994	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
