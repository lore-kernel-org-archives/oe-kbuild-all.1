Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 651912BDC28
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 20:10:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753819804; cv=none; b=pWfr7jP/sLNNVFR5USoZi7Dd486qjNOJQGa9Rt50f7TnDkC2r0helodSlIVuMbT3+0QT9HaON1fL3UmMv5iC+VJEziTLtWDyxkT/oht7bA/YcBT8TYq6EDvhVFLLUXiLFj000ePcZl3IAB+NtkFw4lT7gGlIr7ZSnWWEs+0KrjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753819804; c=relaxed/simple;
	bh=arq1+8FaRL6a59+1sVBr0gzZ5GIBXU4EQvIZqvsylxI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KehSMJME4AfQkM04yX8O6VaHqLUTnG9WXuotVOfj+5PhQnoOARnoclbARpTN7XE/P8gadYksw+Oh9XZFDNVDt+HCReoDhaFdGC5mNgw5P8Ir7clw26m/q4DUbAV/U8x3xOXyVEjKM346vnbJqcabdM4HN5r9kQRKl7jND2G6zpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D0bzg80N; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D0bzg80N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753819802; x=1785355802;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=arq1+8FaRL6a59+1sVBr0gzZ5GIBXU4EQvIZqvsylxI=;
  b=D0bzg80NwV8TdOxmRCRwfeZavnHAWtt7hwNbQM9loujao0qvkNQ8PybP
   BV2whn2TlOn9V5eUnJqDkuuFr9L7oCRiEdlieMTHG9xoaeIJGx801s+tp
   G0duvjoPdQIs/WygICAU1fuz/krlHOBeXZ62qlHmX2EaS/isDvv8BLfoc
   5wMGloQB6B2jGbWK1gjaw4tO4+bJvWGGyxjPytkeAdJ5ACqI4cgTqIQlf
   NaACarqGAMQssVfuVhDaXnkY0kKOXMEi642a3OgDEf05eXruSLZa6ukFS
   IYljB/vtn9t4tvaQErykOzpnA3VKRPBCk7oC0V7L9Z34IP+UclI4P9I9C
   g==;
X-CSE-ConnectionGUID: SE5PAcWkTpy3layzOKNmqw==
X-CSE-MsgGUID: o0D+p4wyTm6nqxQZ784Mpw==
X-IronPort-AV: E=McAfee;i="6800,10657,11506"; a="43712712"
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="43712712"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Jul 2025 13:10:02 -0700
X-CSE-ConnectionGUID: k325xaNmRa6cdh9Fj0YL7w==
X-CSE-MsgGUID: un22ELSYR2ql3L1pMuETjw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,350,1744095600"; 
   d="scan'208";a="193637382"
Received: from lkp-server01.sh.intel.com (HELO 160750d4a34c) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 29 Jul 2025 13:10:01 -0700
Received: from kbuild by 160750d4a34c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1ugqe6-0001df-2p;
	Tue, 29 Jul 2025 20:09:58 +0000
Date: Wed, 30 Jul 2025 04:09:06 +0800
From: kernel test robot <lkp@intel.com>
To: Hannes Reinecke <hare@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [hare-scsi-devel:nvme-mpath-bpf 5/6]
 drivers/nvme/host/core.c:5386:3: error: implicit declaration of function
 'nvme_bpf_struct_ops_init'; did you mean 'bpf_struct_ops_find'?
Message-ID: <202507300411.3N5f06On-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hare/scsi-devel.git nvme-mpath-bpf
head:   7e438588a7436fb1145593e81e9cd827bde45af9
commit: 85207b99a33685a9fde16be6d130fe5fd8442545 [5/6] nvme-bpf: eBPF struct_ops path selectors
config: riscv-randconfig-001-20250730 (https://download.01.org/0day-ci/archive/20250730/202507300411.3N5f06On-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250730/202507300411.3N5f06On-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507300411.3N5f06On-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/nvme/host/core.c: In function 'nvme_core_init':
>> drivers/nvme/host/core.c:5386:3: error: implicit declaration of function 'nvme_bpf_struct_ops_init'; did you mean 'bpf_struct_ops_find'? [-Werror=implicit-function-declaration]
    5386 |   nvme_bpf_struct_ops_init();
         |   ^~~~~~~~~~~~~~~~~~~~~~~~
         |   bpf_struct_ops_find
   cc1: some warnings being treated as errors


vim +5386 drivers/nvme/host/core.c

  5339	
  5340	
  5341	static int __init nvme_core_init(void)
  5342	{
  5343		unsigned int wq_flags = WQ_UNBOUND | WQ_MEM_RECLAIM | WQ_SYSFS;
  5344		int result = -ENOMEM;
  5345	
  5346		_nvme_check_size();
  5347	
  5348		nvme_wq = alloc_workqueue("nvme-wq", wq_flags, 0);
  5349		if (!nvme_wq)
  5350			goto out;
  5351	
  5352		nvme_reset_wq = alloc_workqueue("nvme-reset-wq", wq_flags, 0);
  5353		if (!nvme_reset_wq)
  5354			goto destroy_wq;
  5355	
  5356		nvme_delete_wq = alloc_workqueue("nvme-delete-wq", wq_flags, 0);
  5357		if (!nvme_delete_wq)
  5358			goto destroy_reset_wq;
  5359	
  5360		result = alloc_chrdev_region(&nvme_ctrl_base_chr_devt, 0,
  5361				NVME_MINORS, "nvme");
  5362		if (result < 0)
  5363			goto destroy_delete_wq;
  5364	
  5365		result = class_register(&nvme_class);
  5366		if (result)
  5367			goto unregister_chrdev;
  5368	
  5369		result = class_register(&nvme_subsys_class);
  5370		if (result)
  5371			goto destroy_class;
  5372	
  5373		result = alloc_chrdev_region(&nvme_ns_chr_devt, 0, NVME_MINORS,
  5374					     "nvme-generic");
  5375		if (result < 0)
  5376			goto destroy_subsys_class;
  5377	
  5378		result = class_register(&nvme_ns_chr_class);
  5379		if (result)
  5380			goto unregister_generic_ns;
  5381	
  5382		result = nvme_init_auth();
  5383		if (result)
  5384			goto destroy_ns_chr;
  5385		if (IS_ENABLED(CONFIG_NVME_BPF))
> 5386			nvme_bpf_struct_ops_init();
  5387		return 0;
  5388	
  5389	destroy_ns_chr:
  5390		class_unregister(&nvme_ns_chr_class);
  5391	unregister_generic_ns:
  5392		unregister_chrdev_region(nvme_ns_chr_devt, NVME_MINORS);
  5393	destroy_subsys_class:
  5394		class_unregister(&nvme_subsys_class);
  5395	destroy_class:
  5396		class_unregister(&nvme_class);
  5397	unregister_chrdev:
  5398		unregister_chrdev_region(nvme_ctrl_base_chr_devt, NVME_MINORS);
  5399	destroy_delete_wq:
  5400		destroy_workqueue(nvme_delete_wq);
  5401	destroy_reset_wq:
  5402		destroy_workqueue(nvme_reset_wq);
  5403	destroy_wq:
  5404		destroy_workqueue(nvme_wq);
  5405	out:
  5406		return result;
  5407	}
  5408	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
