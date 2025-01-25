Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67A1B65C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 13:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737813367; cv=none; b=TAYkbXIRurJiZSiofxAqk1fj10IWk8Se2Fo8PYZV5+d883nWKYXYL1Djl2QPPG1YFJwiKsT+z3P7IKU7js0QVv2+g54aZd89e64Xk1f1mz59jbHaJ5uaSTqnW/UX88ZauiDYgUq8U1X+8E/9xbDyhlfDyDZU8OuADwlRkkO3nok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737813367; c=relaxed/simple;
	bh=MOLikgqUakRV/gcRoM8vIJTXSp1vIo7dpqkVbny5JTk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=P0CvfyADkUwSLfkjUEu+0o/bJ56TTxnllNfeAiRUd5TCrOL+PL9z5hmQ4a3tJILldKMiKfPBbghLIBVM9e1/P2vphC9S5JTxXl4kyibqv/KfGbkrOqniYhWj318mAOUFoO2tesHnmd9Wd6qDGwTGykaC+k7WJGw8QwO5vJh6YqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URcnQ9JB; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URcnQ9JB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737813366; x=1769349366;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=MOLikgqUakRV/gcRoM8vIJTXSp1vIo7dpqkVbny5JTk=;
  b=URcnQ9JBXrV8a3k3B+nzLpqbGlLgRlxSSsP6N+u9UtByCbnVHlEdnVE6
   LS9+TDMEEC8BSusJGVYKtdX/Kje36vEYJELxLfPTKOfJoiMXaz1MhPINd
   bPbDiNwd1Nl5vvLOXK7iuUfK39Sbzmp/CNVhtCQwYp8/rJgLxC7f8iKL2
   nijK6xT4pOzGZYkgvLNfdOGKaHAWYeZK0SCBe/EgjewK09jKCdnDgaG6V
   JvtFEqBcfouyrBRI1bjyV+cIpy2Rt+emgPeoBQpvWkDPhsQkengVRopLn
   aRVhoMBgqvw2MtIh379xfg4EEeY4BDorP0aZZinlDEVYQ1XEt5HT5vscz
   w==;
X-CSE-ConnectionGUID: 5mobufNhQCycPAOCiNr7IQ==
X-CSE-MsgGUID: FtJr69yaQJSZFjRVr+t1Ng==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="38034988"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="38034988"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 05:56:05 -0800
X-CSE-ConnectionGUID: XIq57b2kQKSkTJmZFjU/zA==
X-CSE-MsgGUID: 6x86bdoeS02nLTyNg4QRdg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="108553057"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Jan 2025 05:56:04 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbgdm-000drR-0F;
	Sat, 25 Jan 2025 13:56:02 +0000
Date: Sat, 25 Jan 2025 21:55:38 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/invlpgb-v7 5/12] arch/x86/include/asm/invlpgb.h:7:10:
 fatal error: vdso/page.h: No such file or directory
Message-ID: <202501252148.TqVAoTZJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/zen-kernel/zen-kernel 6.12/invlpgb-v7
head:   02d1759eda082f9595f3232f5dffd5d49943924a
commit: cc3f8dd3033c79abd9f37a94efed74a535a703c9 [5/12] x86/mm: add INVLPGB support code
config: i386-buildonly-randconfig-001-20250125 (https://download.01.org/0day-ci/archive/20250125/202501252148.TqVAoTZJ-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501252148.TqVAoTZJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501252148.TqVAoTZJ-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/include/asm/tlbflush.h:13,
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
>> arch/x86/include/asm/invlpgb.h:7:10: fatal error: vdso/page.h: No such file or directory
       7 | #include <vdso/page.h>
         |          ^~~~~~~~~~~~~
   compilation terminated.
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=2381298264
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2 shuffle=2381298264
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2 shuffle=2381298264
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2 shuffle=2381298264
   make: Target 'prepare' not remade because of errors.

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for X86_BROADCAST_TLB_FLUSH
   Depends on [n]: CPU_SUP_AMD [=y] && 64BIT [=n]
   Selected by [y]:
   - CPU_SUP_AMD [=y]


vim +7 arch/x86/include/asm/invlpgb.h

     4	
     5	#include <linux/kernel.h>
     6	#include <vdso/bits.h>
   > 7	#include <vdso/page.h>
     8	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
