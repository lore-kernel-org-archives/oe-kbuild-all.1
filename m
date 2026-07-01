Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71E253B47FB
	for <oe-kbuild-all@lists.linux.dev>; Wed,  1 Jul 2026 10:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782903371; cv=none; b=h3nVIGfupCzeZ54bJ21ZXRJ4RvyTb/LtyE75x04xfZccvw5O7qv0Q9qPOC87ZbYvgegxq8ACdgtRFdLJDbfXOS5DWX2Q2LYS0pSprVeShfIwyJQoQXlCNkk+6GsNY8+6OwFq87L036Uoog6Jsd/VPbA8qW9xcZhXWvyKApxC+Oc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782903371; c=relaxed/simple;
	bh=m2GRfTxryAwxxXyNPjdyEqp6bEjiXxKRA7VxowcslLg=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KirOA6i9IdSfS4MrozEhg8dPvY+wX6v90wYWoD7l2AG6e7DqoNjsEKz32f1HbVqbWM6EFJ7JVbAMJdVG8S8cHye2+tY37taAeAUj0VdtxwGMmq5RebJ0hODya52qoud+tKxC/mEkKkomdG6Zc2RxD53A6ftuCpJOcglqzRATPAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=hW2Qjzva; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="hW2Qjzva"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1782903367; x=1814439367;
  h=date:from:to:cc:subject:message-id;
  bh=m2GRfTxryAwxxXyNPjdyEqp6bEjiXxKRA7VxowcslLg=;
  b=hW2QjzvaOnSJi6y7hkX8YN5AvurKO6GHu3O2abYBrlcrKTQ07niWWRHf
   N/oOcR3PkEbuUH2Mftf9RjgZK81dpkcRv5DQR9p0VnJZ0PtUadGfdKFBA
   MA5bGHooVu6yMf6f3Q0zQ5Y79e2E40dW01PhfRhpdAh6muAW/bQEeDe6v
   STR9ekNWcJLiAfwDhq2fHkd77uL5Iwr27lO3DBmkN3zEH7yrR37Md1Y9j
   zlytd3eC4swxJa9Hu93EOje7hf4/CXz01mENsQIWPUVF1Pe+Wwh6VilIg
   Bp48OMZI0gbHyWW/+P7Let5P13QDUiB1ETMMs6aS6qsx72RCM4C7d2wuG
   A==;
X-CSE-ConnectionGUID: JXz3MkiUSTmlmtT9Ik4kEA==
X-CSE-MsgGUID: 0qVnuq7eTviPFjC+haDkWQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11833"; a="95135805"
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="95135805"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Jul 2026 03:56:06 -0700
X-CSE-ConnectionGUID: abHQa6IoRDiH0yH1YguAhg==
X-CSE-MsgGUID: FuWa9aiLSde2XBtFSj2BIg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,141,1779174000"; 
   d="scan'208";a="251490569"
Received: from igk-lkp-server01.igk.intel.com (HELO e5a8ed462067) ([10.211.93.152])
  by orviesa010.jf.intel.com with ESMTP; 01 Jul 2026 03:56:04 -0700
Received: from kbuild by e5a8ed462067 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wesbW-000000000ll-0RQi;
	Wed, 01 Jul 2026 10:55:42 +0000
Date: Wed, 01 Jul 2026 12:55:08 +0200
From: kernel test robot <lkp@intel.com>
To: Tarun Sahu <tarunsahu@google.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: mm/memfd_luo.c:404:32: error: incompatible type for argument
 1 of 'phys_to_virt'
Message-ID: <202607011209.2J1vgY7B-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tarun-Sahu/kho-add-KHOSER_COPY_PTR-to-allow-phys-copy-of-serialized-ptr/20260623-195248
head:   324baa84cbf51b0e981cfb3b684037a4e4862433
commit: 324baa84cbf51b0e981cfb3b684037a4e4862433 luo: Update serialized data to use KHOSER_PTR
date:   8 days ago
config: x86_64-rhel-9.4-kselftests (https://download.01.org/0day-ci/archive/20260701/202607011209.2J1vgY7B-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260701/202607011209.2J1vgY7B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607011209.2J1vgY7B-lkp@intel.com/

All errors (new ones prefixed by >>):

   mm/memfd_luo.c: In function 'memfd_luo_finish':
>> mm/memfd_luo.c:404:32: error: incompatible type for argument 1 of 'phys_to_virt'
     404 |         ser = phys_to_virt(args->serialized_data);
         |                            ~~~~^~~~~~~~~~~~~~~~~
         |                                |
         |                                union <anonymous>
   In file included from include/linux/io.h:12,
                    from mm/memfd_luo.c:76:
   arch/x86/include/asm/io.h:148:46: note: expected 'phys_addr_t' {aka 'long long unsigned int'} but argument is of type 'union <anonymous>'
     148 | static inline void *phys_to_virt(phys_addr_t address)
         |                                  ~~~~~~~~~~~~^~~~~~~
   mm/memfd_luo.c: In function 'memfd_luo_retrieve':
   mm/memfd_luo.c:531:32: error: incompatible type for argument 1 of 'phys_to_virt'
     531 |         ser = phys_to_virt(args->serialized_data);
         |                            ~~~~^~~~~~~~~~~~~~~~~
         |                                |
         |                                union <anonymous>
   arch/x86/include/asm/io.h:148:46: note: expected 'phys_addr_t' {aka 'long long unsigned int'} but argument is of type 'union <anonymous>'
     148 | static inline void *phys_to_virt(phys_addr_t address)
         |                                  ~~~~~~~~~~~~^~~~~~~


vim +/phys_to_virt +404 mm/memfd_luo.c

b3749f174d6866 Pratyush Yadav          2025-11-25  386  
b3749f174d6866 Pratyush Yadav          2025-11-25  387  static void memfd_luo_finish(struct liveupdate_file_op_args *args)
b3749f174d6866 Pratyush Yadav          2025-11-25  388  {
b3749f174d6866 Pratyush Yadav          2025-11-25  389  	struct memfd_luo_folio_ser *folios_ser;
b3749f174d6866 Pratyush Yadav          2025-11-25  390  	struct memfd_luo_ser *ser;
b3749f174d6866 Pratyush Yadav          2025-11-25  391  
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  392) 	/*
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  393) 	 * If retrieve was successful, nothing to do. If it failed, retrieve()
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  394) 	 * already cleaned up everything it could. So nothing to do there
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  395) 	 * either. Only need to clean up when retrieve was not called.
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  396) 	 */
f85b1c6af5bc38 Pratyush Yadav (Google  2026-02-16  397) 	if (args->retrieve_status)
b3749f174d6866 Pratyush Yadav          2025-11-25  398  		return;
b3749f174d6866 Pratyush Yadav          2025-11-25  399  
324baa84cbf51b Tarun Sahu              2026-06-23  400  	ser = KHOSER_LOAD_PTR(args->serialized_data);
324baa84cbf51b Tarun Sahu              2026-06-23  401  	if (!ser)
b3749f174d6866 Pratyush Yadav          2025-11-25  402  		return;
b3749f174d6866 Pratyush Yadav          2025-11-25  403  
5968408926aa37 Tarun Sahu              2026-06-23 @404  	ser = phys_to_virt(args->serialized_data);
5968408926aa37 Tarun Sahu              2026-06-23  405  
b3749f174d6866 Pratyush Yadav          2025-11-25  406  	if (ser->nr_folios) {
b3749f174d6866 Pratyush Yadav          2025-11-25  407  		folios_ser = kho_restore_vmalloc(&ser->folios);
b3749f174d6866 Pratyush Yadav          2025-11-25  408  		if (!folios_ser)
b3749f174d6866 Pratyush Yadav          2025-11-25  409  			goto out;
b3749f174d6866 Pratyush Yadav          2025-11-25  410  
b3749f174d6866 Pratyush Yadav          2025-11-25  411  		memfd_luo_discard_folios(folios_ser, ser->nr_folios);
b3749f174d6866 Pratyush Yadav          2025-11-25  412  		vfree(folios_ser);
b3749f174d6866 Pratyush Yadav          2025-11-25  413  	}
b3749f174d6866 Pratyush Yadav          2025-11-25  414  
b3749f174d6866 Pratyush Yadav          2025-11-25  415  out:
b3749f174d6866 Pratyush Yadav          2025-11-25  416  	kho_restore_free(ser);
b3749f174d6866 Pratyush Yadav          2025-11-25  417  }
b3749f174d6866 Pratyush Yadav          2025-11-25  418  

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
