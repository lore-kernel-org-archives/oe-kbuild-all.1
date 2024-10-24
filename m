Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E427F1CF96
	for <oe-kbuild-all@lists.linux.dev>; Thu, 24 Oct 2024 01:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729731752; cv=none; b=QiULEGNSdAc9nwm0SCW+qqJufB6TWuw9jV+tNQDI5JqoMSp++pH+3bHm3resZaYPQBqKE3WlNfpqKoshhouC6s3h4LHdPGMHBy6U1u0k+m8S5QNbR/Vji0C2WrXelKC0/FihYZGT2yEfJM7T5tRIrlXzqbNsI64jtzUXMdBnl3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729731752; c=relaxed/simple;
	bh=e54OxNMQhSnmXCxOMZYQywrgbKqE9kcqjwlT8PlLV2M=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=b8A9J/Ls8sC74awCkxpEbADwov7vSKdk5lUnV7Pjc5LYpveLjzeWqUpHig1b5+5a77HMqONZyGFjl6/FwLcgdtmQh9ZrfxdMVdSL82gVgWYlfbMsuwX5TZF/ddIdKtayYI/StTz/jfm2PMJN3Q8NYJSCYiYKR6ZAlSIfHZjqkUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=IOyACg0M; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="IOyACg0M"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1729731750; x=1761267750;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=e54OxNMQhSnmXCxOMZYQywrgbKqE9kcqjwlT8PlLV2M=;
  b=IOyACg0MFW4af9PRMWpZ7gKQw0sp3eOvX31Jz2j4tXCE3c2efVIDbhKd
   iWxwB33O5ZvGlq+EGZbPSyGg+QnibrKyhQDguxXfWiYoSQcK9ojSmlLYt
   NUfeCn71wpIayicX//moMsFDyreSE+zfZUYSvqF3p/vjvgKobE/p3cHBl
   gWasC+M5noMBgKyHrBuMf1KZUAQVtaY/HveB7gQs2eHAzV9UH5d654V80
   zLL329s620bmOaoN9KaRJyMSPx7fEYEI7FFw840oytXmvOVUKHGXaOhnS
   hv0sl/v+qqtYaN2h+Yre7w1s15OTvJbJnQ/CZo3mWSE+dfZ8f6pZGeYJr
   w==;
X-CSE-ConnectionGUID: miC5NfsfQb2F00AUcxfnOw==
X-CSE-MsgGUID: Ns3ejbilTWWUihPKL44HSw==
X-IronPort-AV: E=McAfee;i="6700,10204,11234"; a="39959187"
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="39959187"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Oct 2024 18:02:29 -0700
X-CSE-ConnectionGUID: zuW+3gBnQ1e6M1GfKw8upg==
X-CSE-MsgGUID: ud+S7w6tSxuQRieNzJar9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,227,1725346800"; 
   d="scan'208";a="80535784"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 23 Oct 2024 18:02:28 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t3mF7-000VmC-3A;
	Thu, 24 Oct 2024 01:02:25 +0000
Date: Thu, 24 Oct 2024 09:01:54 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Yuntao Liu <liuyuntao12@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 2431/15255] arch/x86/events/amd/iommu.c:441:64:
 warning: '%u' directive output may be truncated writing between 1 and 10
 bytes into a region of size 6
Message-ID: <202410240834.gfaxos6R-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   e7bc79687a034a22f94328123d5cf8c4d4436c35
commit: f04c0f3eb9b49427c273cd3e4d5a2ff895855b4b [2431/15255] make OPTIMIZE_INLINING config editable
config: x86_64-buildonly-randconfig-004-20241024 (https://download.01.org/0day-ci/archive/20241024/202410240834.gfaxos6R-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241024/202410240834.gfaxos6R-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410240834.gfaxos6R-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/events/amd/iommu.c: In function 'amd_iommu_pc_init':
>> arch/x86/events/amd/iommu.c:441:64: warning: '%u' directive output may be truncated writing between 1 and 10 bytes into a region of size 6 [-Wformat-truncation=]
     441 |         snprintf(perf_iommu->name, IOMMU_NAME_SIZE, "amd_iommu_%u", idx);
         |                                                                ^~
   In function 'init_one_iommu',
       inlined from 'amd_iommu_pc_init' at arch/x86/events/amd/iommu.c:474:9:
   arch/x86/events/amd/iommu.c:441:53: note: directive argument in the range [0, 4294967294]
     441 |         snprintf(perf_iommu->name, IOMMU_NAME_SIZE, "amd_iommu_%u", idx);
         |                                                     ^~~~~~~~~~~~~~
   arch/x86/events/amd/iommu.c:441:9: note: 'snprintf' output between 12 and 21 bytes into a destination of size 16
     441 |         snprintf(perf_iommu->name, IOMMU_NAME_SIZE, "amd_iommu_%u", idx);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +441 arch/x86/events/amd/iommu.c

25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  417  
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  418  static __init int init_one_iommu(unsigned int idx)
7be6296fdd75f7 arch/x86/kernel/cpu/perf_event_amd_iommu.c Suravee Suthikulpanit 2013-06-05  419  {
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  420  	struct perf_amd_iommu *perf_iommu;
7be6296fdd75f7 arch/x86/kernel/cpu/perf_event_amd_iommu.c Suravee Suthikulpanit 2013-06-05  421  	int ret;
7be6296fdd75f7 arch/x86/kernel/cpu/perf_event_amd_iommu.c Suravee Suthikulpanit 2013-06-05  422  
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  423  	perf_iommu = kzalloc(sizeof(struct perf_amd_iommu), GFP_KERNEL);
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  424  	if (!perf_iommu)
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  425  		return -ENOMEM;
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  426  
7be6296fdd75f7 arch/x86/kernel/cpu/perf_event_amd_iommu.c Suravee Suthikulpanit 2013-06-05  427  	raw_spin_lock_init(&perf_iommu->lock);
7be6296fdd75f7 arch/x86/kernel/cpu/perf_event_amd_iommu.c Suravee Suthikulpanit 2013-06-05  428  
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  429  	perf_iommu->pmu          = iommu_pmu;
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  430  	perf_iommu->iommu        = get_amd_iommu(idx);
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  431  	perf_iommu->max_banks    = amd_iommu_pc_get_max_banks(idx);
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  432  	perf_iommu->max_counters = amd_iommu_pc_get_max_counters(idx);
7be6296fdd75f7 arch/x86/kernel/cpu/perf_event_amd_iommu.c Suravee Suthikulpanit 2013-06-05  433  
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  434  	if (!perf_iommu->iommu ||
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  435  	    !perf_iommu->max_banks ||
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  436  	    !perf_iommu->max_counters) {
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  437  		kfree(perf_iommu);
f5863a00e73c43 arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-02-24  438  		return -EINVAL;
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  439  	}
f5863a00e73c43 arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-02-24  440  
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22 @441  	snprintf(perf_iommu->name, IOMMU_NAME_SIZE, "amd_iommu_%u", idx);
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  442  
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  443  	ret = perf_pmu_register(&perf_iommu->pmu, perf_iommu->name, -1);
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  444  	if (!ret) {
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  445  		pr_info("Detected AMD IOMMU #%d (%d banks, %d counters/bank).\n",
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  446  			idx, perf_iommu->max_banks, perf_iommu->max_counters);
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  447  		list_add_tail(&perf_iommu->list, &perf_amd_iommu_list);
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  448  	} else {
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  449  		pr_warn("Error initializing IOMMU %d.\n", idx);
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  450  		kfree(perf_iommu);
25df39f2cfd06a arch/x86/events/amd/iommu.c                Suravee Suthikulpanit 2017-03-22  451  	}
7be6296fdd75f7 arch/x86/kernel/cpu/perf_event_amd_iommu.c Suravee Suthikulpanit 2013-06-05  452  	return ret;
7be6296fdd75f7 arch/x86/kernel/cpu/perf_event_amd_iommu.c Suravee Suthikulpanit 2013-06-05  453  }
7be6296fdd75f7 arch/x86/kernel/cpu/perf_event_amd_iommu.c Suravee Suthikulpanit 2013-06-05  454  

:::::: The code at line 441 was first introduced by commit
:::::: 25df39f2cfd06a4b49ad592c5b7cba0cbf24e27f x86/events/amd/iommu: Enable support for multiple IOMMUs

:::::: TO: Suravee Suthikulpanit <suravee.suthikulpanit@amd.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
