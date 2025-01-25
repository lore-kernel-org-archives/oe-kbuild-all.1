Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD5AF25A65C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 25 Jan 2025 13:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737812766; cv=none; b=hS92ZW1g/udebpQt0QYYJ4KwAycYBxPaiorYg1pCBrQF8pcJoiKk/uvzq7eJ8DQ5XM4ivCG1fSF9K736e/VdqTupKlkyIfQChGudnvOTsxJ2Zwf1A5YGUltmC3kMT0sKUGDj4bKKV4LcjiSpLnTpwjCYkKgQRSbh2NZOo3LqojM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737812766; c=relaxed/simple;
	bh=SlBLI/v3M0Ul+Js7BiyWWeaz0q5XgH0982p0QJzFmrI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HlLCJI6mmGjuXPmA4IC0jBhVutfMnfQgsXlZDeA9al14RtK7rIfOJdTyOqQm2doNP6ZTUaPmmHPTjF2M+BtzfLz/UvKjBxcwL7yEaa/VPsOPSELYXA1k8AxRPqdSo0AalmvInvaNFtQLNsTLYcCqx2CQjzKSVZHKUFljzsjTht0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WLrndvrY; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WLrndvrY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737812765; x=1769348765;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SlBLI/v3M0Ul+Js7BiyWWeaz0q5XgH0982p0QJzFmrI=;
  b=WLrndvrYjq/hF3N2trjo7iD6xua3uFtwP19UnL9lS2ESNyCk/1tKgl+c
   Vo55GGgvpmNK4Eh+NiBGwrRqlvokVoN45t37x822sWNXFLyYjc5/pnu4p
   xqO5ZNpLTg/MkkQr5nXU55xVesslCV+53+Dr9Vbr9dlgqZUqCqbC+5FIe
   B81SCZHe0yhHc6ei/DCtUZ9AZxF1rTxPNb5EJ9JsuQiHbrsiUIMONVkjC
   jJ7LPqaPXOt4J4lomEx9RNWcLhu+u2JV2KipBQL+D393kS8IbLPkM0qtd
   kgxsUN4gm1vmoxbr5tg7ly9DEuNwEOLtXowQjrGux11//xYLHhjEsHLbK
   A==;
X-CSE-ConnectionGUID: nrBlSd7sQ+2NB5rCFyDiHg==
X-CSE-MsgGUID: Mcsl+BQnRNaxJ6aOsUkWRQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11326"; a="38034717"
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="38034717"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2025 05:46:04 -0800
X-CSE-ConnectionGUID: yv5SyrBUTgCGOcqS8ANVOw==
X-CSE-MsgGUID: rsy99WUNQ8itxmJSrs5/gw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,234,1732608000"; 
   d="scan'208";a="108552178"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa010.fm.intel.com with ESMTP; 25 Jan 2025 05:46:03 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tbgU5-000dr1-0k;
	Sat, 25 Jan 2025 13:46:01 +0000
Date: Sat, 25 Jan 2025 21:45:22 +0800
From: kernel test robot <lkp@intel.com>
To: steven@liquorix.net
Cc: oe-kbuild-all@lists.linux.dev
Subject: [zen:6.12/invlpgb-v7 5/12] arch/x86/include/asm/invlpgb.h:7:10:
 fatal error: 'vdso/page.h' file not found
Message-ID: <202501252158.FVKwXZ67-lkp@intel.com>
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
config: i386-buildonly-randconfig-002-20250125 (https://download.01.org/0day-ci/archive/20250125/202501252158.FVKwXZ67-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250125/202501252158.FVKwXZ67-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501252158.FVKwXZ67-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/x86/kernel/asm-offsets.c:14:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:13:
   In file included from include/linux/cgroup.h:17:
   In file included from include/linux/fs.h:33:
   In file included from include/linux/percpu-rwsem.h:7:
   In file included from include/linux/rcuwait.h:6:
   In file included from include/linux/sched/signal.h:9:
   In file included from include/linux/sched/task.h:13:
   In file included from include/linux/uaccess.h:12:
   In file included from arch/x86/include/asm/uaccess.h:17:
   In file included from arch/x86/include/asm/tlbflush.h:13:
>> arch/x86/include/asm/invlpgb.h:7:10: fatal error: 'vdso/page.h' file not found
       7 | #include <vdso/page.h>
         |          ^~~~~~~~~~~~~
   1 error generated.
   make[3]: *** [scripts/Makefile.build:102: arch/x86/kernel/asm-offsets.s] Error 1 shuffle=2247401298
   make[3]: Target 'prepare' not remade because of errors.
   make[2]: *** [Makefile:1203: prepare0] Error 2 shuffle=2247401298
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:224: __sub-make] Error 2 shuffle=2247401298
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:224: __sub-make] Error 2 shuffle=2247401298
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
