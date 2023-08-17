Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DB1414AA6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 18:26:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692296799; x=1723832799;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sh1naDodHDvOa79Bgsc3tNbsZUlNplF6nO/UIdJBGJs=;
  b=cSy/kXI3BXb74n/RmXRtnNMdXTDjbDAorfyd3vmIxEmgQEVJxGFUSuOf
   1l1W3V7dQm+DQnrgM/pUKMhI024LdCR0NWI4LQzOYjulbPHrx11ApO7jB
   EqOKFFmKkMKV5Emp0lS6hvVMRwnZXgVYvHNj1HacsKSsKGT30OcYwXMQ3
   zJqI+9FiG5kZH22Ott4lxKcHffMFPG6FwnE7Jp39sqRvidYixZbKViS8u
   Jw4Ar528mm4Y81DveqxfuwEhecbx6i6rGCAbkTLtEB03crLbnxxy6Nkxx
   oWrlpSYDu22NVM5k6dXKFt9xNhkExBpF2P74qQlNSfDUjVCmFEhTdcRAj
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="357861826"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="357861826"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 11:26:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="684535996"
X-IronPort-AV: E=Sophos;i="6.01,180,1684825200"; 
   d="scan'208";a="684535996"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga003.jf.intel.com with ESMTP; 17 Aug 2023 11:26:37 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWhhc-0001Nr-0X;
	Thu, 17 Aug 2023 18:26:36 +0000
Date: Fri, 18 Aug 2023 02:26:14 +0800
From: kernel test robot <lkp@intel.com>
To: Gregory Greenman <gregory.greenman@intel.com>,
	Golan Ben Ami <golan.ben.ami@intel.com>,
	Michael Golant <michael.golant@intel.com>,
	Johannes Berg <johannes.berg@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:255: warning:
 Cannot understand  * @kfd_get_cu_occupancy - Collect number of waves
 in-flight on this device
Message-ID: <202308180218.pkkAOtv2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/iwlwifi/chromeos.git chromeos-5.10__release/core63-43
head:   61b59f76f27b6ba04eb55fcc6b6d84d2bf4e76b6
commit: 778a34a8eb2935deb2804ed6f7cd6d4e8f439899 UPSTREAM: drm/amdkfd: Fix kernel-doc syntax error
date:   2 years, 2 months ago
config: x86_64-randconfig-x015-20230817 (https://download.01.org/0day-ci/archive/20230818/202308180218.pkkAOtv2-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180218.pkkAOtv2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180218.pkkAOtv2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c:255: warning: Cannot understand  * @kfd_get_cu_occupancy - Collect number of waves in-flight on this device
    on line 255 - I thought it was a doc line


vim +255 drivers/gpu/drm/amd/amdgpu/../amdkfd/kfd_process.c

   253	
   254	/**
 > 255	 * @kfd_get_cu_occupancy - Collect number of waves in-flight on this device
   256	 * by current process. Translates acquired wave count into number of compute units
   257	 * that are occupied.
   258	 *
   259	 * @atr: Handle of attribute that allows reporting of wave count. The attribute
   260	 * handle encapsulates GPU device it is associated with, thereby allowing collection
   261	 * of waves in flight, etc
   262	 *
   263	 * @buffer: Handle of user provided buffer updated with wave count
   264	 *
   265	 * Return: Number of bytes written to user buffer or an error value
   266	 */
   267	static int kfd_get_cu_occupancy(struct attribute *attr, char *buffer)
   268	{
   269		int cu_cnt;
   270		int wave_cnt;
   271		int max_waves_per_cu;
   272		struct kfd_dev *dev = NULL;
   273		struct kfd_process *proc = NULL;
   274		struct kfd_process_device *pdd = NULL;
   275	
   276		pdd = container_of(attr, struct kfd_process_device, attr_cu_occupancy);
   277		dev = pdd->dev;
   278		if (dev->kfd2kgd->get_cu_occupancy == NULL)
   279			return -EINVAL;
   280	
   281		cu_cnt = 0;
   282		proc = pdd->process;
   283		if (pdd->qpd.queue_count == 0) {
   284			pr_debug("Gpu-Id: %d has no active queues for process %d\n",
   285				 dev->id, proc->pasid);
   286			return snprintf(buffer, PAGE_SIZE, "%d\n", cu_cnt);
   287		}
   288	
   289		/* Collect wave count from device if it supports */
   290		wave_cnt = 0;
   291		max_waves_per_cu = 0;
   292		dev->kfd2kgd->get_cu_occupancy(dev->kgd, proc->pasid, &wave_cnt,
   293				&max_waves_per_cu);
   294	
   295		/* Translate wave count to number of compute units */
   296		cu_cnt = (wave_cnt + (max_waves_per_cu - 1)) / max_waves_per_cu;
   297		return snprintf(buffer, PAGE_SIZE, "%d\n", cu_cnt);
   298	}
   299	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
