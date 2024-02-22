Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25BF149015
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Feb 2024 14:06:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708610766; cv=none; b=ZavlqbYTqjyYRl5K80MMTSYfWm2+pPm/qyziJ8sHdvBDDEbM5ghHHVp+tMdy3Wp8MlpS685shtXRHnHoxbjkUAs5psFuCD/MLxQp937qiA5HFnATrwNs1Li48cWzoyciRjSBhOt6YmJiAt9yh5POzIpovAcXWklY+mVs1H1J73U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708610766; c=relaxed/simple;
	bh=ckr4p0BIVvvA6fG/RmkOU+Q2sKyYlNpbXt6r1kL8P+E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lOsIujGaK00jK31PRPZTqL/E5auiJ+zk4a1QjZf9o2lr/sbxI1F1lRnivZPSM3B13/lbVntFlPindEZUkmdJLarJd9dbMSRP3md77nPBg/MW3xXDim6SNhFcsmOg1LJwUijPmILw3S3hqYV/jW4iEVrPqYm6QHylmJzEVlgsl5E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j5mQob2u; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j5mQob2u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1708610765; x=1740146765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ckr4p0BIVvvA6fG/RmkOU+Q2sKyYlNpbXt6r1kL8P+E=;
  b=j5mQob2uel7OAW+9GI3wlQNHCDdBCc7uMvrIKNTjcAJwdcAqzeYK3kjJ
   UnA7mO2YQiLKL7I2LW7OQK4wERB1eaBVmtJHGeekslx1zPvl5FSVb7W1j
   zl8iPx6gGahi6hhFI0ORXwggtE5y23F7x+bHJUMxTAtbkBjGc4lW8Gi8r
   otbL0RAkj1uEkRnkI4eIAA2Z0lyoHTkjgn0ZWTR3uwjTje1dywyGCGc0b
   +dNgjD4W2K4yrIZzk2fezK/rsdAC1JkrXp4BRNmesZU3EvIoeqQerOMU6
   43QjgvlQ8aftumQWgnWLWsjmgF/Jq286MYi3tA+ZoRml4dsHPX27W+ErC
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10991"; a="20386500"
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="20386500"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Feb 2024 06:05:40 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,179,1705392000"; 
   d="scan'208";a="5888874"
Received: from lkp-server02.sh.intel.com (HELO 3c78fa4d504c) ([10.239.97.151])
  by orviesa008.jf.intel.com with ESMTP; 22 Feb 2024 06:05:36 -0800
Received: from kbuild by 3c78fa4d504c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rd9hW-0006NP-2G;
	Thu, 22 Feb 2024 14:05:31 +0000
Date: Thu, 22 Feb 2024 22:05:04 +0800
From: kernel test robot <lkp@intel.com>
To: jasperwang@tencent.com, kaixuxia@tencent.com, frankjpliu@tencent.com,
	kasong@tencent.com, sagazchen@tencent.com, kernelxing@tencent.com,
	aurelianliu@tencent.com, jason.zeng@intel.com, wu.zheng@intel.com,
	yingbao.jia@intel.com, pei.p.jia@intel.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: kernel/smp.c:181:3: warning: add explicit braces to avoid dangling
 else
Message-ID: <202402222115.tgI9oG24-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/OpenCloudOS/OpenCloudOS-Kernel.git linux-5.4/lts/5.4.119-20.0009
head:   3bf5c3f6e32e9cfe13f09bac3ae93b8e39d472c1
commit: 505452dd073c1a8f6faa0bda630a39b375055edc smp: introduce a new interface smp_call_function_many_async
date:   2 years, 11 months ago
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20240222/202402222115.tgI9oG24-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240222/202402222115.tgI9oG24-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402222115.tgI9oG24-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/smp.c:181:3: warning: add explicit braces to avoid dangling else [-Wdangling-else]
     181 |                 else __cpumask_set_cpu(cpu, mask);
         |                 ^
   1 warning generated.


vim +181 kernel/smp.c

   136	
   137	/*
   138	 * Insert a previously allocated call_single_data_t element
   139	 * for execution on the given CPU. data must already have
   140	 * ->func, ->info, and ->flags set.
   141	 */
   142	static int generic_exec_single(int cpu, call_single_data_t *csd,
   143				       smp_call_func_t func, void *info, struct cpumask *mask)
   144	{
   145		if (cpu == smp_processor_id()) {
   146			unsigned long flags;
   147	
   148			/*
   149			 * We can unlock early even for the synchronous on-stack case,
   150			 * since we're doing this from the same CPU..
   151			 */
   152			csd_unlock(csd);
   153			local_irq_save(flags);
   154			func(info);
   155			local_irq_restore(flags);
   156			return 0;
   157		}
   158	
   159	
   160		if ((unsigned)cpu >= nr_cpu_ids || !cpu_online(cpu)) {
   161			csd_unlock(csd);
   162			return -ENXIO;
   163		}
   164	
   165		csd->func = func;
   166		csd->info = info;
   167	
   168		/*
   169		 * The list addition should be visible before sending the IPI
   170		 * handler locks the list to pull the entry off it because of
   171		 * normal cache coherency rules implied by spinlocks.
   172		 *
   173		 * If IPIs can go out of order to the cache coherency protocol
   174		 * in an architecture, sufficient synchronisation should be added
   175		 * to arch code to make it appear to obey cache coherency WRT
   176		 * locking and barrier primitives. Generic code isn't really
   177		 * equipped to do the right thing...
   178		 */
   179		if (llist_add(&csd->llist, &per_cpu(call_single_queue, cpu)))
   180			if (!mask) arch_send_call_function_single_ipi(cpu);
 > 181			else __cpumask_set_cpu(cpu, mask);
   182	
   183		return 0;
   184	}
   185	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
