Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066C3325482
	for <oe-kbuild-all@lists.linux.dev>; Fri,  5 Dec 2025 07:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764920754; cv=none; b=lVp7x57GVdvC01gFEJa3yryPi6rCuVdtnyY+wCNPnhVjrBpfwCYxUCoG9Z9bWQ8AlC5D6HGCm4zMaztC6MQMNbsyW/LQp63J+9jVqnN0Vi8N/sGL3R7b95SlyCiTP5czVsFnN3WPMq18BQdRdaxn8bca+8gWco3rFCzXn6lLu2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764920754; c=relaxed/simple;
	bh=aecHwkwZ4tndOR2bm6+Fjh/BOYqByredQbOObcRfyHA=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=N2/qMUdwE3gqYFjmRgWLttDxR5VriIGBmOJCmeA5W9hzh98sB9vMMZjoxKZud1Mmof+TMh3GPra0QdE/Y/J6m88QBn+RxgKzf4IYk8IgFQbjeOHCC/QV+ZztUuj+Z6E01IrAWloVB8EkSCaLW9E5fnbaC3PFGm6ya24QpsuX6x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MLlommwM; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MLlommwM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1764920743; x=1796456743;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=aecHwkwZ4tndOR2bm6+Fjh/BOYqByredQbOObcRfyHA=;
  b=MLlommwMw0EYdHnHRWuACX+oqczrfgjQ0O5Qe90yvjWvMihogmQBP/sb
   VHGGYnP4sYq97xZQNaH3FLwODiJp7775dlK5nL0JNe/1KAzJAzNXA9T/0
   R3XUrBZ2v4n8e4RgIWCOGnr328ES93svhaydQJ2A+6U5th1/saJdCT0U4
   aOA2IEJWsOiWlbtNzNMUMuWU1MDFpSsGescXfNEqmLULDcqAnjSxlIf6U
   YOaCKMs1vxTJL4DPIXVAT7oTy8k3DZ4VQ4oQ1eDCdFbKIfMGwRzmKSLT3
   OGHAySNz0uXIvYBPdTIz4tElu3/4IiAvPJHKNFiIcokMQXd49XcSp4Idv
   A==;
X-CSE-ConnectionGUID: +1XCYUfuR6aZn0+fbLeFiA==
X-CSE-MsgGUID: ZlJazq2aSSeOxtrZZ1aPGQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11632"; a="78304967"
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="78304967"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Dec 2025 23:45:35 -0800
X-CSE-ConnectionGUID: awcvM3/0SEadm7G7IisMTA==
X-CSE-MsgGUID: GI8u4mQKRvqCq9bTQMYs6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.20,251,1758610800"; 
   d="scan'208";a="196025402"
Received: from lkp-server01.sh.intel.com (HELO 4664bbef4914) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 04 Dec 2025 23:45:33 -0800
Received: from kbuild by 4664bbef4914 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vRQVP-00000000ElF-1DYL;
	Fri, 05 Dec 2025 07:45:31 +0000
Date: Fri, 5 Dec 2025 15:45:14 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yongqiang Guo <guoyongqiang12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3479/3479]
 drivers/ub/urma/ubcore/ubcore_connect_adapter.c:190:1: warning: no previous
 prototype for 'ubcore_find_remove_ex_tp_info'
Message-ID: <202512051530.omM8ItZN-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f9a278cf61499e631038cf7d7847bb990cf89d7e
commit: cd3e93f2a6d3bba9ff616fb065a943877d3d7894 [3479/3479] urma: implement ubcore basic connection and bonding support
config: arm64-randconfig-r061-20251205 (https://download.01.org/0day-ci/archive/20251205/202512051530.omM8ItZN-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251205/202512051530.omM8ItZN-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512051530.omM8ItZN-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/ub/urma/ubcore/ubcore_connect_adapter.c:190:1: warning: no previous prototype for 'ubcore_find_remove_ex_tp_info' [-Wmissing-prototypes]
     190 | ubcore_find_remove_ex_tp_info(struct ubcore_device *dev, uint64_t tp_handle)
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for PGP_PRELOAD
   Depends on [n]: CRYPTO [=y] && ASYMMETRIC_KEY_TYPE [=n]
   Selected by [y]:
   - PGP_PRELOAD_PUBLIC_KEYS [=y] && CRYPTO [=y]


vim +/ubcore_find_remove_ex_tp_info +190 drivers/ub/urma/ubcore/ubcore_connect_adapter.c

   188	
   189	struct ubcore_ex_tp_info *
 > 190	ubcore_find_remove_ex_tp_info(struct ubcore_device *dev, uint64_t tp_handle)
   191	{
   192		struct ubcore_ex_tp_info *ex_tp_info = NULL;
   193		uint32_t hash;
   194	
   195		hash = ubcore_get_ex_tp_hash(&tp_handle);
   196		spin_lock(&dev->ht[UBCORE_HT_EX_TP].lock);
   197		if (dev->ht[UBCORE_HT_EX_TP].head == NULL) {
   198			spin_unlock(&dev->ht[UBCORE_HT_EX_TP].lock);
   199			return NULL;
   200		}
   201	
   202		ex_tp_info = ubcore_hash_table_lookup_nolock(&dev->ht[UBCORE_HT_EX_TP],
   203							     hash, &tp_handle);
   204		if (ex_tp_info == NULL) {
   205			spin_unlock(&dev->ht[UBCORE_HT_EX_TP].lock);
   206			ubcore_log_warn("Failed to find ex_tp_info, tp_handle: %llu.\n",
   207					tp_handle);
   208			return NULL;
   209		}
   210		ubcore_hash_table_remove_nolock(&dev->ht[UBCORE_HT_EX_TP],
   211						&ex_tp_info->hnode);
   212		spin_unlock(&dev->ht[UBCORE_HT_EX_TP].lock);
   213	
   214		return ex_tp_info;
   215	}
   216	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
