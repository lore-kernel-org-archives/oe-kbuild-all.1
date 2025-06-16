Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0BBA92BEFFA
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Jun 2025 14:46:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750085178; cv=none; b=rYwtjEH8N6TpgP3f6KKyhgSvXwjWVFwmCulZK5zMmtdHC7DqcS/eJC+Bdu8xnasEvOP/H2QThY61JPSVfz4vw0QbRidX8SoBpwbJiqJ9Xrrnb0U9oVxYKafinomo0AfpK/W35TLYl1/qDHR9lduFRlCdVGAw/I+coMNt0BDbK8A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750085178; c=relaxed/simple;
	bh=HdgRyVXHnFBNc1Dt3/M31eAb8+37LVrchSA6R/dmX/g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AM+gPrLOCVGUCuaKwY/qMAGRgnFQDmrwJoeOqND6m35uBPg8zpCPpxAQQlttlyDauUbjQo571Or1Ild0FNempMoNspCN4IGZnFvsnL4eQZzm2wdbYGUDijE4Mz2R4QE0ywgEPkZFZSTLBMdPcqj1ad+uHSsqKSOXfjRMXpXAKKc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RTulx407; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RTulx407"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1750085177; x=1781621177;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HdgRyVXHnFBNc1Dt3/M31eAb8+37LVrchSA6R/dmX/g=;
  b=RTulx407EruwfHlocbjWsgKy8Tt1VrJF5yfsB0jLT9hOdpP/jLvsxfqv
   tSLQqUt+5WK3Yd65KJXGzR+LK2qJKJc+chKlNtdwaxtRATlBfwfjRAYOD
   ecoZxR3IcjManlzhMqWvqpsLAogJJE19gMmzhrBXmvmLEGK56Rh2Zf8hi
   sSqyVOVVltBC9wgzIpH17hnU2Kg7q9hNodCJClzw7tqrtGQXZ3L2GzlUc
   IwGijHsVvy76MRgRW6TFmDM8cpArAg7/ohO5ceiWcAHS673orDcyhzji1
   NqKuuP/zYn1EJs2XV+/8A2FP3OP3pT87oZet75vgqdAYS3hkAmlzMw/oZ
   Q==;
X-CSE-ConnectionGUID: xlgfytQ2Q8ecGiriqvrwPw==
X-CSE-MsgGUID: S+551mleS36r9kjM2o1gUQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="52367173"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="52367173"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Jun 2025 07:46:16 -0700
X-CSE-ConnectionGUID: tCxBoOvFTMyNlVKQ+BCiMg==
X-CSE-MsgGUID: uIynNRjwRuK1EN5+M+2K9Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; 
   d="scan'208";a="153366552"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 16 Jun 2025 07:46:15 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uRB6D-000F68-01;
	Mon, 16 Jun 2025 14:46:13 +0000
Date: Mon, 16 Jun 2025 22:46:06 +0800
From: kernel test robot <lkp@intel.com>
To: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Subject: [linux-next:master 2144/2828] drivers/dma-buf/dma-fence.c:1112:51:
 sparse: sparse: incorrect type in return expression (different address
 spaces)
Message-ID: <202506162214.1eA69hLe-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   050f8ad7b58d9079455af171ac279c4b9b828c11
commit: 506aa8b02a8d6898c64cc095d233fbae1cef8b8a [2144/2828] dma-fence: Add safe access helpers and document the rules
config: m68k-randconfig-r132-20250616 (https://download.01.org/0day-ci/archive/20250616/202506162214.1eA69hLe-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce: (https://download.01.org/0day-ci/archive/20250616/202506162214.1eA69hLe-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506162214.1eA69hLe-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/dma-buf/dma-fence.c:1112:51: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char const * @@
   drivers/dma-buf/dma-fence.c:1112:51: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1112:51: sparse:     got char const *
>> drivers/dma-buf/dma-fence.c:1114:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char * @@
   drivers/dma-buf/dma-fence.c:1114:24: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1114:24: sparse:     got char *
   drivers/dma-buf/dma-fence.c:1144:51: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char const * @@
   drivers/dma-buf/dma-fence.c:1144:51: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1144:51: sparse:     got char const *
   drivers/dma-buf/dma-fence.c:1146:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected char const [noderef] __rcu * @@     got char * @@
   drivers/dma-buf/dma-fence.c:1146:24: sparse:     expected char const [noderef] __rcu *
   drivers/dma-buf/dma-fence.c:1146:24: sparse:     got char *

vim +1112 drivers/dma-buf/dma-fence.c

  1085	
  1086	/**
  1087	 * dma_fence_driver_name - Access the driver name
  1088	 * @fence: the fence to query
  1089	 *
  1090	 * Returns a driver name backing the dma-fence implementation.
  1091	 *
  1092	 * IMPORTANT CONSIDERATION:
  1093	 * Dma-fence contract stipulates that access to driver provided data (data not
  1094	 * directly embedded into the object itself), such as the &dma_fence.lock and
  1095	 * memory potentially accessed by the &dma_fence.ops functions, is forbidden
  1096	 * after the fence has been signalled. Drivers are allowed to free that data,
  1097	 * and some do.
  1098	 *
  1099	 * To allow safe access drivers are mandated to guarantee a RCU grace period
  1100	 * between signalling the fence and freeing said data.
  1101	 *
  1102	 * As such access to the driver name is only valid inside a RCU locked section.
  1103	 * The pointer MUST be both queried and USED ONLY WITHIN a SINGLE block guarded
  1104	 * by the &rcu_read_lock and &rcu_read_unlock pair.
  1105	 */
  1106	const char __rcu *dma_fence_driver_name(struct dma_fence *fence)
  1107	{
  1108		RCU_LOCKDEP_WARN(!rcu_read_lock_held(),
  1109				 "RCU protection is required for safe access to returned string");
  1110	
  1111		if (!test_bit(DMA_FENCE_FLAG_SIGNALED_BIT, &fence->flags))
> 1112			return fence->ops->get_driver_name(fence);
  1113		else
> 1114			return "detached-driver";
  1115	}
  1116	EXPORT_SYMBOL(dma_fence_driver_name);
  1117	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
