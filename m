Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BE92594B2
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Dec 2024 05:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734672585; cv=none; b=QmJvVtNr2RCE/AuBXKHrUtHfn+2oa3C/hBk9B6/SumfmxsUjpWfq1EFnvAaaq1SMDSg1dO3DTift+lUDgEoDibN9tJzAztj4KbMNwQxif5khtdkpOZGPp9ogqczhR4kTNOVoh1GUV7ZS4/S/Je6wUY/IZjSokf8ymVfPx81i1ug=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734672585; c=relaxed/simple;
	bh=jxDiixZY5RK5tzU6xXk79Qdc2IsIMzYhYj4KAOYaFvk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=t/UAFPa7sx2YRPaB9h+4l525w81R7dpRsObgA3/gv1EqVKNm8w2kUfwTR+9rIv4BuFnwnKHd2WSrkj91/Or/eQho9kOLaF9TfBjXjLbKYGVig01YnZdvj6/QPAnVEjGxAYWNKIKs9PCahpUL6XTtSBeOcX5fketowHaddpaXfrk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mDMyplY7; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mDMyplY7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1734672583; x=1766208583;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jxDiixZY5RK5tzU6xXk79Qdc2IsIMzYhYj4KAOYaFvk=;
  b=mDMyplY7e3+86vH1dwThovcZ3FmB1lmuoa6vW6eZKe/DDoJLeq+lh0mt
   ajVFE2G80DPFV8xKfDTaLxolT0bjorCx+KiHfcC2pXy9QBNu6MMEaRNV7
   KtHDeXjjU1WE8IMi3sGH8ZiEDnueIW7JsvpKje86Zgkvla0uSW36swBlC
   UTlL5mG8OxKZBqMUG4UJr9LpuHT0zKsdozjOyl4/62DbR6B9wQ8paLRsD
   EkNbUGE76ihQJ2J4Xem0YPbrJFXRW7MvmvT9rE+cJX1ypMMeJuAh4yC4G
   MGPNFYcBefSC8eN4LREM8/j+f4XSIoS7qweUbXJPK1FAqmJomD8opfZL1
   g==;
X-CSE-ConnectionGUID: AOMuslRpQYawYLsu2Em6eA==
X-CSE-MsgGUID: JxIDv99MSkuFGT/JccNDsQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11291"; a="45900941"
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="45900941"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2024 21:29:43 -0800
X-CSE-ConnectionGUID: 5F70WHegRse6jj4ofdq5gg==
X-CSE-MsgGUID: iSM54nrgSBux3ktqIv0bgg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,249,1728975600"; 
   d="scan'208";a="98617815"
Received: from lkp-server01.sh.intel.com (HELO a46f226878e0) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 19 Dec 2024 21:29:42 -0800
Received: from kbuild by a46f226878e0 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tOVZz-0000s7-2o;
	Fri, 20 Dec 2024 05:29:39 +0000
Date: Fri, 20 Dec 2024 13:29:34 +0800
From: kernel test robot <lkp@intel.com>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frederic-dynticks:cpuidle/polling-v2 3/6]
 drivers/acpi/processor_idle.c:26:10: fatal error: asm/cpuidle.h: No such
 file or directory
Message-ID: <202412201333.QcEqU4ZQ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/frederic/linux-dynticks.git cpuidle/polling-v2
head:   392f31dc16a3051efbbb05d969e477dfb87975c4
commit: 71e6b3692a4500cd108e952a27a99197abfac156 [3/6] x86/cpuidle: Move buggy mwait implementations away from CPUIDLE_FLAG_MWAIT
config: loongarch-randconfig-001-20241220 (https://download.01.org/0day-ci/archive/20241220/202412201333.QcEqU4ZQ-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241220/202412201333.QcEqU4ZQ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412201333.QcEqU4ZQ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/processor_idle.c:26:10: fatal error: asm/cpuidle.h: No such file or directory
      26 | #include <asm/cpuidle.h>
         |          ^~~~~~~~~~~~~~~
   compilation terminated.


vim +26 drivers/acpi/processor_idle.c

    14	
    15	#include <linux/module.h>
    16	#include <linux/acpi.h>
    17	#include <linux/dmi.h>
    18	#include <linux/sched.h>       /* need_resched() */
    19	#include <linux/tick.h>
    20	#include <linux/cpuidle.h>
    21	#include <linux/cpu.h>
    22	#include <linux/minmax.h>
    23	#include <linux/perf_event.h>
    24	#include <acpi/processor.h>
    25	#include <linux/context_tracking.h>
  > 26	#include <asm/cpuidle.h>
    27	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
