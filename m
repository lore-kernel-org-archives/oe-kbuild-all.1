Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E5802F49FE
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 17:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765562120; cv=none; b=nWZPTt2jBEPzPOb9h+3ZAJBW5kKhsB+LxEunDLK4FAmzmO5e0+irBHBNMjTFe77tAnt2PZQ3Wcxri3xLy+zNOKN6VTQEZF/3MsZKckoFbL7Gzemc7LszVwY/IUmZQaz+cInvfTRrCzs1DXQjp1RG2CgM7dGBDhis/qb34LcYlTk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765562120; c=relaxed/simple;
	bh=Nwt0ODL1pbpDKn762ppPp15inp4Hscfhn0AIOk+Debo=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=uMO/3t8iUldnBRdmrHfWPjLnZ0PBoBVxFZvz5DOW8MbP4A0BjSxi06BXM+99fGjISjCBQVWrKky93L3xBBQpoNyla812Vze22yH1nSAc4f32CCt8tF5VnqjQ7rB1dKBTCcFJbm3ym5tcKNiGUdFES/8yQgJojVXgPcdLY6DpZ3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WRl8/NhM; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WRl8/NhM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765562118; x=1797098118;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Nwt0ODL1pbpDKn762ppPp15inp4Hscfhn0AIOk+Debo=;
  b=WRl8/NhM1L2WSOkUwl4ktwf8CXIFYGFm1BRE2I0aqjj02lzlkpgQVkZR
   0/jsxLG8V4X+v3opJH7gYw4LX2zg8h5/2e4O0XoSlLO7aHQRyVrfKshvq
   qRIKpVzIVFlY71xqZgz30XN4es1+EfOH5C7XlwwfK3AQFFpfZFp3EGqWx
   GsBAIY5VWQ7H5s+9QI8ETO7ekYWIG2Jk3b6O7SCQtlMVmuZAlyge/neWj
   4Xxy5QzpfeabbzmGv8AO/P9jE9VKgSSIxT510b5c3y/E/eKsRn90jHqEc
   IqS3T+SYaLHT2/SpgA5WoQ/NJbqXsERinanwP1iKtgrtcY4TApjKIRyGD
   Q==;
X-CSE-ConnectionGUID: Cvzxl30sS2C5Kwx/uWJMcQ==
X-CSE-MsgGUID: xhNVB6sDSayIV+s5L455HA==
X-IronPort-AV: E=McAfee;i="6800,10657,11640"; a="67641467"
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="67641467"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Dec 2025 09:55:16 -0800
X-CSE-ConnectionGUID: kLGBCLcYRBasfb/eLI8iSw==
X-CSE-MsgGUID: 16L5K1zcSomWdKXeap7vdQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,144,1763452800"; 
   d="scan'208";a="202075990"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 12 Dec 2025 09:55:14 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vU7MG-000000006Ol-23Ek;
	Fri, 12 Dec 2025 17:55:12 +0000
Date: Sat, 13 Dec 2025 01:55:01 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12 1/1]
 drivers/dma-buf/dma-fence.c:1083:24: sparse: sparse: incorrect type in
 return expression (different address spaces)
Message-ID: <202512130152.Hi3zWGcW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12
head:   dd99b3dd2a23838f5718ec95ff4d9c782d4ce276
commit: 087f4434a20872505b3a7c50990b5cb5c9ac2154 [1/1] BACKPORT: dma-fence: Add safe access helpers and document the rules
config: i386-randconfig-063-20251212 (https://download.01.org/0day-ci/archive/20251213/202512130152.Hi3zWGcW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251213/202512130152.Hi3zWGcW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512130152.Hi3zWGcW-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   drivers/dma-buf/dma-fence.c:1081:51: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char const * @@
   drivers/dma-buf/dma-fence.c:1081:51: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1081:51: sparse:     got char const *
>> drivers/dma-buf/dma-fence.c:1083:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char * @@
   drivers/dma-buf/dma-fence.c:1083:24: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1083:24: sparse:     got char *
   drivers/dma-buf/dma-fence.c:1113:51: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char const * @@
   drivers/dma-buf/dma-fence.c:1113:51: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1113:51: sparse:     got char const *
   drivers/dma-buf/dma-fence.c:1115:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char * @@
   drivers/dma-buf/dma-fence.c:1115:24: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1115:24: sparse:     got char *
   drivers/dma-buf/dma-fence.c: note: in included file (through include/trace/trace_events.h, include/trace/define_trace.h, include/trace/events/dma_fence.h):
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *driver_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *driver_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *timeline_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *timeline_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *driver_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *driver_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in argument 1 (different address spaces) @@     expected char const *str @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected char const *str
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *
   include/trace/events/dma_fence.h:12:1: sparse: sparse: incorrect type in assignment (different address spaces) @@     expected void const *timeline_ptr_ @@     got char const [noderef] __rcu * @@
   include/trace/events/dma_fence.h:12:1: sparse:     expected void const *timeline_ptr_
   include/trace/events/dma_fence.h:12:1: sparse:     got char const [noderef] __rcu *

vim +1083 drivers/dma-buf/dma-fence.c

  1054	
  1055	/**
  1056	 * dma_fence_driver_name - Access the driver name
  1057	 * @fence: the fence to query
  1058	 *
  1059	 * Returns a driver name backing the dma-fence implementation.
  1060	 *
  1061	 * IMPORTANT CONSIDERATION:
  1062	 * Dma-fence contract stipulates that access to driver provided data (data not
  1063	 * directly embedded into the object itself), such as the &dma_fence.lock and
  1064	 * memory potentially accessed by the &dma_fence.ops functions, is forbidden
  1065	 * after the fence has been signalled. Drivers are allowed to free that data,
  1066	 * and some do.
  1067	 *
  1068	 * To allow safe access drivers are mandated to guarantee a RCU grace period
  1069	 * between signalling the fence and freeing said data.
  1070	 *
  1071	 * As such access to the driver name is only valid inside a RCU locked section.
  1072	 * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
  1073	 * by the &rcu_read_lock and &rcu_read_unlock pair.
  1074	 */
  1075	const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
  1076	{
  1077		RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
  1078				 "RCU protection is required for safe access to returned string");
  1079	
  1080		if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
  1081			return fence->ops->get_driver_name(fence);
  1082		else
> 1083			return "detached-driver";
  1084	}
  1085	EXPORT_SYMBOL(dma_fence_driver_name);
  1086	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
