Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28C8E230243
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 12:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740659156; cv=none; b=oQFeV6jHSTBsS072mnZqFlS3/91Su7vqMhkt8CCpoiSgRaRhz42/Me5h0c/E+ru6O0WREPgG3chINlEKaC5RZZeNUz2qSfmGqz/SLiBg8UHQUkm2n7zuNW8P2g6X1eXar0P1U0EmTQpYwbN2HUPcxk9n2dhbjQdW6Vnro+OVuj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740659156; c=relaxed/simple;
	bh=BEdOhyyduwP9ezp7aGUIgcG1Bqiz0aA6deV8dR8dKBE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a4daYCC1kAg6oZ6wUPGna1urcMiqtcXPBZvPP57+ZV50GlD6wJcn4lScKRh5b7TpTE3kulh4EKh+Ce0hhv0j76W6QQVxhvL9gCuWscRQswcmIDdVFI2MlYFUISyCwYn9PXf6X4G1QgKDzih2p9pTAjUHG/yX7Pqa/Ili0X0G9es=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=A3CeWJL9; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="A3CeWJL9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740659155; x=1772195155;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BEdOhyyduwP9ezp7aGUIgcG1Bqiz0aA6deV8dR8dKBE=;
  b=A3CeWJL9vGTi1J6q0XOFt8ijs5bUzOJ9wsKx0SYfG1b4eeCiKN79Em1C
   czPK1Dnx1GeMGo4QDt7VvLm8RD5L50K4lvki0Ro5+FO5AgNIruO+JNqfc
   oePfWizCsmMHb8c/QX4cNGrmQbmjBLGZFVQj0WuW2e+XoO5YNOM5iVc+f
   4v7IAyLS9BJZkB0HGOH5ZVxfbWQqy6bX0zBDReisWQUj4M6afok01jQfY
   cM7BjFCJzaMYs4iYQS4WLYf9/6nIX1Mje2GJOmQ241xvuFSyS5zCEY7hO
   9+4ylkfVUC/BIFio6d+lJouhQSyvngmCYpzFP0gcLRj21id5WiZxrGGB7
   A==;
X-CSE-ConnectionGUID: gf9BcLdtT8yBTTPD6vu9Bg==
X-CSE-MsgGUID: D5yeJhNnT2KlBwBRI14GjA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="41428737"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="41428737"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 04:25:51 -0800
X-CSE-ConnectionGUID: FFiLnh1uSAuyYaTHwOmgUQ==
X-CSE-MsgGUID: LC9iEk9JRmGl1fMaPepiAA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; 
   d="scan'208";a="121140994"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 27 Feb 2025 04:25:50 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tncxX-000DLK-2a;
	Thu, 27 Feb 2025 12:25:47 +0000
Date: Thu, 27 Feb 2025 20:25:06 +0800
From: kernel test robot <lkp@intel.com>
To: Zheyun Shen <szy0127@sjtu.edu.cn>
Cc: oe-kbuild-all@lists.linux.dev, Sean Christopherson <seanjc@google.com>,
	Tom Lendacky <thomas.lendacky@amd.com>
Subject: [sean-jc:svm/sev_cache_opts 7/8] arch/x86/include/asm/smp.h:175:15:
 error: return type defaults to 'int'
Message-ID: <202502272043.5pPlghqG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux svm/sev_cache_opts
head:   0abca5ad72cf2bc8ebbb6b93be9a5c768f463d48
commit: 3c2b47771dc542fbdb237bd5218112905717dfae [7/8] x86, lib: Add wbinvd and wbnoinvd helpers to target multiple CPUs
config: i386-buildonly-randconfig-001-20250227 (https://download.01.org/0day-ci/archive/20250227/202502272043.5pPlghqG-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250227/202502272043.5pPlghqG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272043.5pPlghqG-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/tlbflush.h:12,
                    from arch/x86/include/asm/uaccess.h:17,
                    from include/linux/uaccess.h:12,
                    from include/linux/sched/task.h:13,
                    from include/linux/sched/signal.h:9,
                    from include/linux/rcuwait.h:6,
                    from include/linux/percpu-rwsem.h:7,
                    from include/linux/fs.h:33,
                    from include/linux/cgroup.h:17,
                    from include/linux/memcontrol.h:13,
                    from include/linux/swap.h:9,
                    from include/linux/suspend.h:5,
                    from arch/x86/kernel/asm-offsets.c:14:
>> arch/x86/include/asm/smp.h:175:15: error: return type defaults to 'int' [-Werror=implicit-int]
     175 | static inline wbnoinvd_on_many_cpus(struct cpumask *cpus)
         |               ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=1430866881
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1264: prepare0] Error 2 shuffle=1430866881
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:251: __sub-make] Error 2 shuffle=1430866881
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:251: __sub-make] Error 2 shuffle=1430866881
   make: Target 'prepare' not remade because of errors.


vim +/int +175 arch/x86/include/asm/smp.h

   174	
 > 175	static inline wbnoinvd_on_many_cpus(struct cpumask *cpus)
   176	{
   177		wbnoinvd();
   178	}
   179	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
