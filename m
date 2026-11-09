Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794253083;
	b=DUQJyWAGWblnY7YC+28H12s4Wv14FQbAqpJ8X8Ere7i6VYXzIVTUMep3BDYdx8v4LTX7
	 uXqL+kqZk2bglJmCK+EV03gBs/Bv2UT4L/R4yyK2LdMEkacwLwIwBt/PwvXJ3U1fELJQW
	 0QZgmK9nShfUvEdyNYehsg/qZ4358qd0vN2gewSBrYYmJWBEqIynTqNQY94qU8wWIFc1q
	 rA+URlQi707+rUrvvAzTALnstu28X7e0Rtx1UG+qg6Ab+l2uaeF0TvlNEH13JcxZLJDun
	 40hvdHkWl+NhN8PsB1svQd8KvoIuVG0iWf+xv2GNUMcmD/omnfrFwX7Tdly3IIsmztA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794253083;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=is+9N6EH7ZEUTc2+bilHmINOWqiOtCqFbbnGadcFv2Y=;
	b=lrETx/opw57qrdAdByUMzvIuizjxT3LrI7YqZplCFMYbsuenC6zdZCeKvKSWlYudLlVH
	 I7P9xAYTHdyvEU4CvevlBWd7OsVuyDLSqO++ILs10lqf9HZ2Xw4dOqPmdqKDplM3YBJl2
	 Hod5N0po0KYxWS+7Jxrd6wBk4tgxdpBPOVd2RODxkoNTe0cR3mzTRB94FMht/VOL2x/6r
	 5wY4sGEfItp0w9KApj+b6sbBiT1OqobYj8LWbNrPOo8K3mzr0QE4hK+YIMZOzzW+msmAl
	 3uHrGEbv6IE3aSwGjA6LaE0OB5iaVSFhm35qwhhL8r7nvsPLurPrfyhugPkS1KkwoGA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J73jff5v;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A7D1606A321
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Nov 2026 19:38:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8A7D1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=J73jff5v
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794253083; x=1825789083;
  h=date:from:to:cc:subject:message-id;
  bh=pWclAGcOpDHqr0v3M2XbgydUQAxMs5joCV3lan8FO8Q=;
  b=J73jff5vd2+8r40oauDI5RsH0m+W6tgFu7hw8BuzYrq4Iyc45tED7WiY
   Ma2T+oy5T2157Svv5CvGSgZhARTPNZ0cnWQHM22PUBjTOIUBToFdGdBPi
   2agNbW5uJm9dBI3PS2h4bQd0odaQkXcO7WiXU7TtZkT3+VudDGB3sPRdY
   L6ZGgAgvgpn/Z4xfhgv9xjU52wzTdjVs6VArzOGSgIda9pJVZuXV+ds5M
   1EFgURGeL44Jifxduqb0XFK8JkGHDNFTs+Kkut5+r0Vby80zgCiomBLBu
   8mESbwR8fVbk5u4Cp5DRd78ObkAkgMSzOPwWQxd1qw7YDyX75UmBejCaQ
   Q==;
X-CSE-ConnectionGUID: xKUdYlPDRJu7GnNCgduCIg==
X-CSE-MsgGUID: 9IyEN+zxR8y2KdMpok5scA==
X-IronPort-AV: E=McAfee;i="6800,10657,11961"; a="3015302"
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="3015302"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2026 11:38:02 -0800
X-CSE-ConnectionGUID: RohIu2L1Tqe3u4sPr033Lw==
X-CSE-MsgGUID: 3LC6bipTTTOlYuqdpIH+lg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,204,1787036400"; 
   d="scan'208";a="8284155"
Received: from igk-lkp-server01.igk.intel.com (HELO 1db0d17a343c) ([10.211.93.152])
  by fmviesa001.fm.intel.com with ESMTP; 09 Nov 2026 11:38:01 -0800
Received: from kbuild by 1db0d17a343c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xQVBm-000000000SV-0yWw;
	Mon, 09 Nov 2026 19:37:58 +0000
Date: Mon, 09 Nov 2026 20:37:43 +0100
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Yeoreum Yun <yeoreum.yun@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>
Subject: [sudeep-holla:for-next/arm_fw/updates 2/2]
 drivers/firmware/arm/smccc/smccc.c:21:21: sparse: sparse: symbol
 'smccc_soc_id_version' was not declared. Should it be static?
Message-ID: <202611092008.peLqOBq7-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

Hi Sudeep,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git for-next/arm_fw/updates
head:   49c49ca0c4d02848a9576f72c4741c38c5ba09de
commit: 49c49ca0c4d02848a9576f72c4741c38c5ba09de [2/2] firmware: arm: Group interface drivers under arm/
config: arm64-randconfig-r2311-20261109 (https://download.01.org/0day-ci/archive/20261109/202611092008.peLqOBq7-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.3.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261109/202611092008.peLqOBq7-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611092008.peLqOBq7-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm/smccc/smccc.c:21:21: sparse: sparse: symbol 'smccc_soc_id_version' was not declared. Should it be static?
>> drivers/firmware/arm/smccc/smccc.c:22:21: sparse: sparse: symbol 'smccc_soc_id_revision' was not declared. Should it be static?

vim +/smccc_soc_id_version +21 drivers/firmware/arm/smccc/smccc.c

f2ae97062a48b1 drivers/firmware/smccc/smccc.c Sudeep Holla       2020-05-18  19  
a37e31fc97efe7 drivers/firmware/smccc/smccc.c Andre Przywara     2021-01-06  20  bool __ro_after_init smccc_trng_available = false;
35727af2b15d98 drivers/firmware/smccc/smccc.c Shanker Donthineni 2023-03-18 @21  s32 __ro_after_init smccc_soc_id_version = SMCCC_RET_NOT_SUPPORTED;
35727af2b15d98 drivers/firmware/smccc/smccc.c Shanker Donthineni 2023-03-18 @22  s32 __ro_after_init smccc_soc_id_revision = SMCCC_RET_NOT_SUPPORTED;
a37e31fc97efe7 drivers/firmware/smccc/smccc.c Andre Przywara     2021-01-06  23  

:::::: The code at line 21 was first introduced by commit
:::::: 35727af2b15d98a2dd2811d631d3a3886111312e irqchip/gicv3: Workaround for NVIDIA erratum T241-FABRIC-4

:::::: TO: Shanker Donthineni <sdonthineni@nvidia.com>
:::::: CC: Marc Zyngier <maz@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
