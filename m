Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AE79134B1
	for <oe-kbuild-all@lists.linux.dev>; Mon, 16 Sep 2024 03:19:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726456791; cv=none; b=titFCPne/o6P/OvwWibKOJPVdvLg8gI1mx/8HVc/p1Ry9etG88HJy5K0x8g53i0MLSwBroc5vIq/XU8xcHlSp2pqrEM/dCeZAon/Hp2mfjkSLTlBPUpigph9BxUwAYuo0r4XcJhmU6XiUw9I9j0BLO5BZDW/f3a17FFcsHQRlFo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726456791; c=relaxed/simple;
	bh=ji3/2BVWq3SQIt5vgFlKXwX6+Nj7Kzn10Wl8wS9dyjE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=swAscN1OYGm8FMbQV3Yj5cGLr8vo7+o1OdhPo9W3BBJTzv5xQ7b1t96hgbnSMYPUYa4Gs/d7tpPoQ56iisVuN0rakX5naNC8jKwA/EgtAFcSy4thmwhZD2MJq2vW1umDEuZwWuDQq1QD+I1rlySlZGIt+ypmWuiLChKFOWuVdqU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AvrNc9cD; arc=none smtp.client-ip=192.198.163.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AvrNc9cD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1726456789; x=1757992789;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ji3/2BVWq3SQIt5vgFlKXwX6+Nj7Kzn10Wl8wS9dyjE=;
  b=AvrNc9cDvQ2xBR3N4k2lZ+Ds3beig5+FQwDAQ8445T/a+1J36FTl2fgH
   yGmakrYSAV+qbXz1FQWtu9Nstt4y659o7Ote6I/TDO72uC/yyKnbaszlq
   xeuCEGkZLMwM+oTMG7N5JF2sTqpEtxAlfC6JnWAyAhdKU064DUkODsz5l
   UOFAjbcYsfoEgnuvjk+mSGgE55avKZmNsY2G9xlyjiQTyun+Q190g9VFL
   QB1r7k4HOixRN9xLublftEVKB++o8Ch5s26+MQAETbSrFA56aCcNVvPXP
   F1EM3T4XcxhkR66rWB5CGdlOqKhI2sa4xip40aM/EdoskZYcQFnjhwLMF
   A==;
X-CSE-ConnectionGUID: R0V41JsTSM+muENxyhvV3A==
X-CSE-MsgGUID: c7B2YBelR+eikicLrwY0Ow==
X-IronPort-AV: E=McAfee;i="6700,10204,11196"; a="28191443"
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="28191443"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
  by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Sep 2024 20:19:48 -0700
X-CSE-ConnectionGUID: tEl7q7XlSoCNuLSpfPp+pg==
X-CSE-MsgGUID: A+gTVCdvRAeWDqghurKsvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,232,1719903600"; 
   d="scan'208";a="73580915"
Received: from lkp-server01.sh.intel.com (HELO 53e96f405c61) ([10.239.97.150])
  by orviesa005.jf.intel.com with ESMTP; 15 Sep 2024 20:19:47 -0700
Received: from kbuild by 53e96f405c61 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sq2HA-0009Iw-3D;
	Mon, 16 Sep 2024 03:19:44 +0000
Date: Mon, 16 Sep 2024 11:19:03 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hao Chen <970353908@qq.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 7633/13950] drivers/ptp/ptp_hisi.c:731:36:
 warning: unused variable 'hisi_ptp_acpi_match'
Message-ID: <202409161130.34ZDV9qj-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   84404f248a61323e09909849803ea4efce81742f
commit: e6aa0ecf50a8a0da6b742aacd9cbd47463275a30 [7633/13950] net: hns3: add support for Hisilicon ptp sync device
config: arm64-randconfig-003-20240916 (https://download.01.org/0day-ci/archive/20240916/202409161130.34ZDV9qj-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project bf684034844c660b778f0eba103582f582b710c9)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240916/202409161130.34ZDV9qj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202409161130.34ZDV9qj-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/ptp/ptp_hisi.c:3:
   In file included from include/linux/mm.h:2204:
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
>> drivers/ptp/ptp_hisi.c:731:36: warning: unused variable 'hisi_ptp_acpi_match' [-Wunused-const-variable]
     731 | static const struct acpi_device_id hisi_ptp_acpi_match[] = {
         |                                    ^~~~~~~~~~~~~~~~~~~
   5 warnings generated.


vim +/hisi_ptp_acpi_match +731 drivers/ptp/ptp_hisi.c

   730	
 > 731	static const struct acpi_device_id hisi_ptp_acpi_match[] = {
   732		{ "HISI0411", 0 },
   733		{ }
   734	};
   735	MODULE_DEVICE_TABLE(acpi, hisi_ptp_acpi_match);
   736	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
