Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 492138F40
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Jan 2025 01:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737508802; cv=none; b=oeiPG3hLB5mqnn+l2c4vrETgjNXv7c8QHrk+VOPUNcdExgItcWUNNvKoqfy+PfdKKgphO0q6hmKgjAz4SQzlspjED78oTK3t0K0q2iROg1pzs/km1wMiUWruUdeRj1dFIdAkA7RWejdjHKyj6TR+VDXGfdBC4Mb43QLGKOX0CpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737508802; c=relaxed/simple;
	bh=HD1tbRd5y1iMbZ1VUCQOZUyJSrwedahRIeJPq9TVN/4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HF56K4gKgE2bV58D1KRXCYEvH7Tdlgbaa4ivIa1A21/MoFXtZA1E7A3EUXniGqP21+wpOQWdDOpug3r48OZk1c8RlU45yei45PaTPcm8/Yyy+p4R5XRuippmH5t473gZjpUWxaIwZGtvUaVLkH5xWS2MITcOxI9t+Xm6XjFMADY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m1EDUOf5; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m1EDUOf5"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737508801; x=1769044801;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HD1tbRd5y1iMbZ1VUCQOZUyJSrwedahRIeJPq9TVN/4=;
  b=m1EDUOf5Q8lTNTNTkBU/syUGGR3LsRyVTRYOfa2KD5j4MYcIvjLNud5C
   bYV/jQig9oxMCrf8jDmMuFlG76Ue+L9AlPD2ycXOEJAsMOw2qJ59EzAND
   BpxBT1TFpJ6ro/lJ5dI4eLzpYRTVhpcXNeMKnZIZr8ntmBYHY05LCW3Zb
   J8ifqjfqg5G8QU/dijHr7NuK46pnVYAw53jI9VcJZ+whgJAdF1Kx4DBtX
   nkUXUcdytCVdeKawqkGzyXNKbNuQSI5JYLUi1FVkFtZkqbzBzsEtPLdiM
   QnKfHBtkyHllFTheILF1/oDf6b4v2oQPKOBFLtHRY43TzoZMnP+SXcuZ5
   Q==;
X-CSE-ConnectionGUID: i/cRZ0A9SPiG7H4UXhgGjw==
X-CSE-MsgGUID: MSXsm0Q2QoSpuiyzRZPzsA==
X-IronPort-AV: E=McAfee;i="6700,10204,11322"; a="37647246"
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="37647246"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2025 17:20:00 -0800
X-CSE-ConnectionGUID: rbZXmRFVTFWUa1Ry31cq6Q==
X-CSE-MsgGUID: R+g+CkDZQ02XooCdrxubqw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,223,1732608000"; 
   d="scan'208";a="111981552"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Jan 2025 17:19:58 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1taPPQ-000ZFE-1D;
	Wed, 22 Jan 2025 01:19:56 +0000
Date: Wed, 22 Jan 2025 09:19:04 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, xiajingze <xiajingze1@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1834/1834] drivers/scsi/hpsa.o: warning: objtool:
 hpsa_find_cfg_addrs+0x123: unreachable instruction
Message-ID: <202501220929.hTMn2Z7o-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   75c81bcddd82381fbd4cef477a5b56eb2fe56697
commit: 241ad43fe7e9c24d5ba4cdd1ec22e731cdd22d14 [1834/1834] Compiler: Add clang's PGO support for kernel.
config: x86_64-randconfig-102-20250122 (https://download.01.org/0day-ci/archive/20250122/202501220929.hTMn2Z7o-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250122/202501220929.hTMn2Z7o-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501220929.hTMn2Z7o-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/hpsa.c:24:
   In file included from include/linux/pci.h:1666:
   In file included from include/linux/dmapool.h:14:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:2235:
   include/linux/vmstat.h:508:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     508 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     509 |                            item];
         |                            ~~~~
   include/linux/vmstat.h:515:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     515 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     516 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
   include/linux/vmstat.h:527:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     527 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     528 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   include/linux/vmstat.h:536:43: warning: arithmetic between different enumeration types ('enum zone_stat_item' and 'enum numa_stat_item') [-Wenum-enum-conversion]
     536 |         return vmstat_text[NR_VM_ZONE_STAT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~ ^
     537 |                            NR_VM_NUMA_EVENT_ITEMS +
         |                            ~~~~~~~~~~~~~~~~~~~~~~
   5 warnings generated.
>> drivers/scsi/hpsa.o: warning: objtool: hpsa_find_cfg_addrs+0x123: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
