Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4C742253FC
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Apr 2026 02:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776135299; cv=none; b=O7xZavUEXpcHK1MLQG9D7Nhj+UJFYfuZ6bvk7fNZTn8C6JGl1que6wWOfFMCTkegnMXDeRCDeVMJ3OSw61byc0e+VRzV6DRVJFGMauPDpiJ1uIS5UlvQfTu+a5Fm8Q/rZswko+rluILoiQXNJmvrCYId8+Y2bFVOs8HvVbo7xJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776135299; c=relaxed/simple;
	bh=IdDav3IM2Aj12rxWKTWf6IotNgBC08GMI9zpk/9neh8=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Ik9z4fUWYsaQyq7g6H3x5KqAEMlxhwtukHG4Xy7rztOm12R8r0SCWRSoC7E8zrRayPqVm5qee5RUtdFykpNGuhqZKu5scGx0V9ExFwA0smeGO+s9DaBb11CsNQfydCyvCOxJuzEdXm37oI34AB+9TfOc76375fp4pl5xky8gbMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=I1+in/7i; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="I1+in/7i"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776135297; x=1807671297;
  h=date:from:to:cc:subject:message-id;
  bh=IdDav3IM2Aj12rxWKTWf6IotNgBC08GMI9zpk/9neh8=;
  b=I1+in/7iZ/JMNE6Dr0IfDrD2rfoE4p0so+hBO+lAglxrbp8Hq17IJeto
   fnMhow4XdoFPPdHNcdvkopTM1lW6mk+KUpFgjJLSzQZYcQ+8Gz6uaci9n
   69q458BWNt9yhCfQ86OV+z4m4/nhBkw5Fltgwx6e3wsmYPX5T5nmW7xud
   n8IwH6lzyYQLhZu0rGdhWSHWGjVI78i1iqWpFurCGZqgYU37IPBCa3JoM
   D1XA1GzlstmPT00eCNebBycuXJR4Y2WRswnxOByK1WOsIcdtzPbzD5Axj
   6ctPN7xj3ZaodwAHbouj2lVkZdN50s2oqZC8FUstd0RCrPlCn1AU1eUAZ
   w==;
X-CSE-ConnectionGUID: w5WGGazaRhyGQqPfZH60tw==
X-CSE-MsgGUID: BTGiaxbXQeiI3VLM/6kHEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11758"; a="77193022"
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="77193022"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Apr 2026 19:54:56 -0700
X-CSE-ConnectionGUID: Ap8sSWzoTPGC6fmSKlyVQw==
X-CSE-MsgGUID: qXmDGssnS7SiDaFQq55RmQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,178,1770624000"; 
   d="scan'208";a="253173391"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa002.fm.intel.com with ESMTP; 13 Apr 2026 19:54:55 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wCTvR-000000000I1-0Q4e;
	Tue, 14 Apr 2026 02:54:53 +0000
Date: Tue, 14 Apr 2026 04:54:01 +0200
From: kernel test robot <lkp@intel.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thermal:thermal/cooling-device-with-id 24/25]
 include/linux/thermal.h:245: multiple definition of
 `devm_thermal_of_cooling_device_register';
 drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245:
 first defined here
Message-ID: <202604140433.v3GAd1RY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thermal/linux.git thermal/cooling-device-with-id
head:   4fea531ae8a1095b1fc1122441fc173a33b93005
commit: 1da9dad287e0abae276c2f8cacd7ad105b78293b [24/25] thermal/of: Pass the of_index and add a function to register with an index
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260414/202604140433.v3GAd1RY-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260414/202604140433.v3GAd1RY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604140433.v3GAd1RY-lkp@intel.com/

All errors (new ones prefixed by >>):

   ld: drivers/net/ethernet/chelsio/cxgb4/l2t.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/smt.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/t4_hw.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/sge.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/clip_tbl.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/cxgb4_ethtool.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/cxgb4_uld.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/srq.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/sched.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/cxgb4_filter.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_u32.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/cxgb4_ptp.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_flower.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/cxgb4_cudbg.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/cxgb4_mps.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/cudbg_common.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/cudbg_lib.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/cudbg_zlib.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_mqprio.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/cxgb4_tc_matchall.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/cxgb4_debugfs.o: in function `devm_thermal_of_cooling_device_register':
   include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/net/ethernet/chelsio/cxgb4/cxgb4_thermal.o: in function `devm_thermal_of_cooling_device_register':
   include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/net/ethernet/chelsio/cxgb4/cxgb4_main.o:include/linux/thermal.h:245: first defined here
--
   ld: drivers/crypto/chelsio/chcr_algo.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/crypto/chelsio/chcr_core.o:include/linux/thermal.h:245: first defined here
--
   ld: drivers/infiniband/hw/cxgb4/cm.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/infiniband/hw/cxgb4/device.o:include/linux/thermal.h:245: first defined here
   ld: drivers/infiniband/hw/cxgb4/provider.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/infiniband/hw/cxgb4/device.o:include/linux/thermal.h:245: first defined here
   ld: drivers/infiniband/hw/cxgb4/mem.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/infiniband/hw/cxgb4/device.o:include/linux/thermal.h:245: first defined here
   ld: drivers/infiniband/hw/cxgb4/cq.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/infiniband/hw/cxgb4/device.o:include/linux/thermal.h:245: first defined here
   ld: drivers/infiniband/hw/cxgb4/qp.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/infiniband/hw/cxgb4/device.o:include/linux/thermal.h:245: first defined here
   ld: drivers/infiniband/hw/cxgb4/resource.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/infiniband/hw/cxgb4/device.o:include/linux/thermal.h:245: first defined here
   ld: drivers/infiniband/hw/cxgb4/ev.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/infiniband/hw/cxgb4/device.o:include/linux/thermal.h:245: first defined here
   ld: drivers/infiniband/hw/cxgb4/id_table.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/infiniband/hw/cxgb4/device.o:include/linux/thermal.h:245: first defined here
   ld: drivers/infiniband/hw/cxgb4/restrack.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/infiniband/hw/cxgb4/device.o:include/linux/thermal.h:245: first defined here
--
   ld: drivers/target/iscsi/cxgbit/cxgbit_cm.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/target/iscsi/cxgbit/cxgbit_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/target/iscsi/cxgbit/cxgbit_target.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/target/iscsi/cxgbit/cxgbit_main.o:include/linux/thermal.h:245: first defined here
   ld: drivers/target/iscsi/cxgbit/cxgbit_ddp.o: in function `devm_thermal_of_cooling_device_register':
>> include/linux/thermal.h:245: multiple definition of `devm_thermal_of_cooling_device_register'; drivers/target/iscsi/cxgbit/cxgbit_main.o:include/linux/thermal.h:245: first defined here


vim +245 include/linux/thermal.h

1da9dad287e0ab Daniel Lezcano 2026-04-09  240  
1da9dad287e0ab Daniel Lezcano 2026-04-09  241  struct thermal_cooling_device *
1da9dad287e0ab Daniel Lezcano 2026-04-09  242  devm_thermal_of_cooling_device_register(struct device *dev, int of_index,
1da9dad287e0ab Daniel Lezcano 2026-04-09  243  					const char *type, void *devdata,
1da9dad287e0ab Daniel Lezcano 2026-04-09  244  					const struct thermal_cooling_device_ops *ops)
7a2cdcd2cf3066 Daniel Lezcano 2026-04-08 @245  {
7a2cdcd2cf3066 Daniel Lezcano 2026-04-08  246  	return ERR_PTR(-ENODEV);
7a2cdcd2cf3066 Daniel Lezcano 2026-04-08  247  }
7a2cdcd2cf3066 Daniel Lezcano 2026-04-08  248  

:::::: The code at line 245 was first introduced by commit
:::::: 7a2cdcd2cf30669aa2c538071edc8c5d27a29895 thermal/core: Move OF functions def in the CONFIG_OF section in thermal.h

:::::: TO: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
:::::: CC: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
