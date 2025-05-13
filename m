Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C78628F514
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 May 2025 17:50:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747158647; cv=none; b=gnXQr0YGNCfs7ViOqoamhSYPSfRIk2F5Rgc8P9LfD/d8vq31VE+vOvw126tycstRyfEX6G5iD6kHBcVmN7db3vgPekuFvyemnSSFOyr87o+42z/vvN70aSGKRNQsQoSrIFkn4wli5Ud20CUgyCK5ecrfZIzVIec4d8qPRjQglhg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747158647; c=relaxed/simple;
	bh=k9C2g9/J7qbl1b7sUjloVsxPQGZt3VlYjwQWqJ2UDkM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=eRrVXl30rd0ROXZAq/vmhm4juWZ78Dk995rH/6Zi0Q00QRJyz37w8L0D9o6RoJpHClCQUPbddQjqkzdWBquHlozoPHiQSblcqme6LeCoTHZjvunTAH/DgRFxSTmKg3RAnDF2cELQpmiUpLvrSrjEkuaOvWHk6e0t+mtvn3dTXPg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a54594c/; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a54594c/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1747158646; x=1778694646;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k9C2g9/J7qbl1b7sUjloVsxPQGZt3VlYjwQWqJ2UDkM=;
  b=a54594c/4K7fet+2+ayUat6jR7d3bKDf4nLfw0ZNhWs78R+mQ57l9ZXH
   q7FY/aaQVFeqjImu9ryt94CuBWXq+6Y2OCCBxcRaPON98sBBm29EeMTi0
   9wJHWvufFk0/YryuCXaE6WULi5mPV2cjAWkzK4UOIFa9jMC7vSCMFCEdH
   Uuf5QK6JZZyHEV8WqknqjaOhCAfTMjD2ZmeyC2aPze0fB5fLvsoIG+TJa
   LvwVGQsjybne6IpLpczVDRn3NYviHp2xlOX+60ON5R5keX/z3t0I3ZAzq
   Q6V3Zsh2hbKQvuxNiavyQC8NPkVVV2NUv/jEX7s1x1iovo5YGDtmjp9/Q
   w==;
X-CSE-ConnectionGUID: R7X+jgTNRAG65p1EE9fofQ==
X-CSE-MsgGUID: 1jo0RgZoSVqbl9xFuKUF/w==
X-IronPort-AV: E=McAfee;i="6700,10204,11432"; a="49144032"
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="49144032"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 May 2025 10:50:45 -0700
X-CSE-ConnectionGUID: 2kTm9Nh6QpiYoc0fl8m2Cw==
X-CSE-MsgGUID: G3+HraCqRjeA3XcIGVhLCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,285,1739865600"; 
   d="scan'208";a="174903931"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa001.jf.intel.com with ESMTP; 13 May 2025 10:50:44 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uEtm5-000GHN-1y;
	Tue, 13 May 2025 17:50:41 +0000
Date: Wed, 14 May 2025 01:49:52 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:dev/gicv5-v4 19/27] arch/arm64/kernel/smp.c:1149:36:
 sparse: sparse: incorrect type in argument 5 (different address spaces)
Message-ID: <202505140125.NylFrFlZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git dev/gicv5-v4
head:   5731383379ee882b2a7f7c82f36939a9f4e52fda
commit: edce5d721e12cb9ecb78004667f077d1f275e950 [19/27] arm64: smp: Support non-SGIs for IPIs
config: arm64-randconfig-r112-20250513 (https://download.01.org/0day-ci/archive/20250514/202505140125.NylFrFlZ-lkp@intel.com/config)
compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f819f46284f2a79790038e1f6649172789734ae8)
reproduce: (https://download.01.org/0day-ci/archive/20250514/202505140125.NylFrFlZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505140125.NylFrFlZ-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> arch/arm64/kernel/smp.c:1149:36: sparse: sparse: incorrect type in argument 5 (different address spaces) @@     expected void *dev @@     got struct irq_cpustat_t [noderef] __percpu * @@
   arch/arm64/kernel/smp.c:1149:36: sparse:     expected void *dev
   arch/arm64/kernel/smp.c:1149:36: sparse:     got struct irq_cpustat_t [noderef] __percpu *

vim +1149 arch/arm64/kernel/smp.c

  1136	
  1137	static void ipi_setup_lpi(int ipi, int ncpus)
  1138	{
  1139		for (int cpu = 0; cpu < ncpus; cpu++) {
  1140			int err, irq;
  1141	
  1142			irq = ipi_to_irq(ipi, cpu);
  1143	
  1144			err = irq_force_affinity(irq, cpumask_of(cpu));
  1145	
  1146			WARN(err, "Could not force affinity IRQ %d, err=%d\n", irq, err);
  1147	
  1148			err = request_irq(irq, ipi_handler, IRQF_NO_AUTOEN, "IPI",
> 1149					  &irq_stat);
  1150	
  1151			WARN(err, "Could not request IRQ %d, err=%d\n", irq, err);
  1152	
  1153			irq_set_status_flags(irq, (IRQ_HIDDEN | IRQ_NO_BALANCING_MASK));
  1154	
  1155			get_ipi_desc(cpu, ipi) = irq_to_desc(irq);
  1156		}
  1157	}
  1158	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
