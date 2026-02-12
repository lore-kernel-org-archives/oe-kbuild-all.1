Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D40151A262D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 12 Feb 2026 00:51:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770857519; cv=none; b=i/bON0IFp4sPvWNiFMLh6QP+4LIP1IIv5Tk/mr+eKJQE50EvnInn/5q4QGoVxh3dYwVCHls4jL51ALrSaFWuciAah8FE8tWXdSFdN2063y/zci58eWabFxlob2HFkiiQ26ubNsOnegTWqPAyefZkmfyoge/MsoLOHDS3i67UdvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770857519; c=relaxed/simple;
	bh=ZMsmGFlcxaLIHWZKO9GNgWN7eJJ4U7JEsuQipFdcFAM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=uch8dqv/eejwZLQSI8y1wdAE3EFtM87g+5fgEYr63nwKiYCt8Hs/PDmFYZeJlxjcTG6hWU96I0l2oInV/gQxcndaTU+5HJzcxJZTE0YszcaMkMn4NuBKJCzM2GBX43k+ek6FxHYuqbdR+8QDmr44lI9oNW5ykX+samBdHHMSJ+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UcEvjOUu; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UcEvjOUu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770857519; x=1802393519;
  h=date:from:to:cc:subject:message-id;
  bh=ZMsmGFlcxaLIHWZKO9GNgWN7eJJ4U7JEsuQipFdcFAM=;
  b=UcEvjOUubBuSEAu9ybkNBDp63C//5cFmU1mBnlQUDrryK6NPXaHXXt6O
   6mR0vQTmt1D4QkGWglWO2c+aSOObih3ZlOZlL2vsycwby8uNgpSnQbQS4
   px0iFkbMtgvylEkyhl9tM9LPjMRX+XOsj+w8a4AHWPT601/YDAXsiqnVv
   pHdc6WSYRTBoTDh1yKbLKQZi97a6S9UcltmRNbme6BJQ8rkNAsfkMdmPM
   /yJygAeC2POZ6xuwl6GRiViF3M1kazggBcar1kHD6KdaW+8sAdNDfHqnE
   n2kA1MPMNWy2eSoXORRb86cNie7INvd8YxTE8bMYQ2FV3GYr6vFbqh0x0
   g==;
X-CSE-ConnectionGUID: Whmqay/rTI+qVptzRn33Ew==
X-CSE-MsgGUID: f7HYaIYoRc6tWRsM3AsFlw==
X-IronPort-AV: E=McAfee;i="6800,10657,11698"; a="72117459"
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="72117459"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Feb 2026 16:51:58 -0800
X-CSE-ConnectionGUID: dDEaWa2bT6qzheEfMaisqg==
X-CSE-MsgGUID: MZLZXoRvQ0ielmc46U4uww==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,285,1763452800"; 
   d="scan'208";a="242105759"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 11 Feb 2026 16:51:57 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vqKvz-00000000qX6-0hps;
	Thu, 12 Feb 2026 00:51:55 +0000
Date: Thu, 12 Feb 2026 08:51:14 +0800
From: kernel test robot <lkp@intel.com>
To: "Peter Zijlstra (Intel)" <peterz@infradead.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [peterz-queue:sched/flat 11/11] arm-linux-gnueabi-ld:
 kernel/sched/fair.c:287: undefined reference to `__aeabi_uldivmod'
Message-ID: <202602120803.JHgVd4Qp-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git sched/flat
head:   f73d5a79af644ba37d1204b2037147ca2ec91983
commit: 0900b7ccd9fd82ebb9af824a43994c4d20c7cca8 [11/11] sched/eevdf: Move to a single runqueue
config: arm-randconfig-002-20260212 (https://download.01.org/0day-ci/archive/20260212/202602120803.JHgVd4Qp-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 10.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260212/202602120803.JHgVd4Qp-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602120803.JHgVd4Qp-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: kernel/sched/fair.o: in function `update_curr':
   kernel/sched/fair.c:287: undefined reference to `__aeabi_uldivmod'
>> arm-linux-gnueabi-ld: kernel/sched/fair.c:287: undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: kernel/sched/fair.o: in function `place_entity':
   kernel/sched/fair.c:287: undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: kernel/sched/fair.o: in function `yield_task_fair':
   kernel/sched/fair.c:287: undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: kernel/sched/fair.o: in function `entity_lag':
   kernel/sched/fair.c:287: undefined reference to `__aeabi_uldivmod'
   arm-linux-gnueabi-ld: kernel/sched/fair.o:kernel/sched/fair.c:287: more undefined references to `__aeabi_uldivmod' follow

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
