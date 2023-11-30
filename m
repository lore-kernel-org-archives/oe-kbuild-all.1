Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C60931A6D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Nov 2023 16:05:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Sw+etOKO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1701360334; x=1732896334;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+PWXxZQpnHf1h2HOH0OMr9kAYnn9zEknUnRrPx5E6GU=;
  b=Sw+etOKOOrOumCmA8ZqrQtgeCYFqEhzs6cogMfg6Ud1i44sgroAfT+NU
   A759pVzAMO+uB3wiPdtlJ+GJnjPrjSwfhDp5moGPR+jLaBC20w6w2td31
   o84bwPp9AeQAe9HFOjKG2sDZd/IaAFY0CxscP1m/IxGU9utjwyHjTYi56
   IuNAE8zpq/cI48hMBYT39qoBwCoTaA1pfD2BfLQiJ5qeQ8IORDHFMZEo8
   ygsp6Yz8uAukyFR+/b49GHDpFOSng8uzV1aJfPCKZBc6pvYo/ehDN/p9Y
   P9xCIu2zZ1KSrKhx+Ay5n52YABRfrErjV08+O0XM25xXY5exob+QE0whb
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="333657"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="333657"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Nov 2023 08:05:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10910"; a="762758678"
X-IronPort-AV: E=Sophos;i="6.04,239,1695711600"; 
   d="scan'208";a="762758678"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by orsmga007.jf.intel.com with ESMTP; 30 Nov 2023 08:05:32 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r8jXd-0002Ia-0q;
	Thu, 30 Nov 2023 16:05:29 +0000
Date: Fri, 1 Dec 2023 00:04:33 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Guittot <vincent.guittot@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vincent-guittot:scmi/ffa-transport 1/2]
 drivers/firmware/arm_scmi/ffa.c:337:6: warning: no previous prototype for
 'ffa_shm_free_kernel_buf'
Message-ID: <202311302358.ndwGdAo1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.linaro.org/people/vincent.guittot/kernel.git scmi/ffa-transport
head:   58f815a694fe99b6067c8e74a23f7ef193a7f76e
commit: 4e6e5543e62399d3e18c26257137593114fb63cc [1/2] scmi/ffa: add a new scmi transport layer based on ffa
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20231130/202311302358.ndwGdAo1-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231130/202311302358.ndwGdAo1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311302358.ndwGdAo1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_scmi/ffa.c:337:6: warning: no previous prototype for 'ffa_shm_free_kernel_buf' [-Wmissing-prototypes]
     337 | void ffa_shm_free_kernel_buf(struct tee_shm *shm)
         |      ^~~~~~~~~~~~~~~~~~~~~~~
--
>> drivers/firmware/arm_scmi/ffa.c:116: warning: Function parameter or member 'ffa_dev' not described in 'scmi_ffa_service'


vim +/ffa_shm_free_kernel_buf +337 drivers/firmware/arm_scmi/ffa.c

   336	
 > 337	void ffa_shm_free_kernel_buf(struct tee_shm *shm)
   338	{
   339		struct ffa_device *ffa_dev = ffa_service->ffa_dev;
   340		const struct ffa_mem_ops *mem_ops = ffa_dev->ops->mem_ops;
   341		int ret;
   342	
   343		/* Nothing to free */
   344		if (shm == NULL)
   345			return;
   346	
   347		// reclaim shared memory
   348		ret = mem_ops->memory_reclaim(shm->sec_world_id, 0);
   349		if (ret)
   350			pr_err("mem_reclaim: 0x%llx %d", shm->sec_world_id, ret);
   351	
   352		free_pages((unsigned long)shm->kaddr, get_order(shm->size));
   353		kfree(shm);
   354	}
   355	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
