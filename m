Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C6C2862B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 22 Oct 2023 20:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mKRZC1x/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1698006673; x=1729542673;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=lGL1HJ+Mz8yiy7yOKQ7IK/uJoNIiEjiBN/MaS0IWs6Y=;
  b=mKRZC1x/TH7nNgaK4qdfijBDLGnhTfC/3/xQRGw9oPZehGZKKaWaZ/56
   Ev6YhzGkIFnEgwNRmaB61BToMKJ6+49v/LZjo7jFqFCBLFCwX9b9Cq92Y
   b7Y5PuBX5o8sXYdi1eXeDGXpfPoIoVowt+E6oTAVnhW+GM0yJBsbJBQwT
   PTJUTgpEHbKHBAgv+pIjt9F+NpOXVG0MWoHx1kdAsMXAtA1S6WZcS1Kzp
   ZMLSrfjfYpnDvkIMS+rK4iWyW74EpYLdCdG4EZnqkFuaAX8eYgEis9bpc
   n02YfbtJpPg4WE4/nBook9sUqJT4+voZWRDl18FZ0P4wyfZX1kq5cYoEz
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="5353027"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="5353027"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2023 13:31:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10871"; a="787286080"
X-IronPort-AV: E=Sophos;i="6.03,243,1694761200"; 
   d="scan'208";a="787286080"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 22 Oct 2023 13:31:09 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quf6J-0006FW-08;
	Sun, 22 Oct 2023 20:31:07 +0000
Date: Mon, 23 Oct 2023 04:30:26 +0800
From: kernel test robot <lkp@intel.com>
To: Andrea della Porta <andrea.porta@suse.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Cc: oe-kbuild-all@lists.linux.dev, nik.borisov@suse.com,
	Andrea della Porta <andrea.porta@suse.com>
Subject: Re: [PATCH 3/4] arm64/entry-common: Make Aarch32 syscalls'
 availability depend on aarch32_enabled()
Message-ID: <202310230423.r2U4Lqr8-lkp@intel.com>
References: <88bdea628a13747bff32c0c3055d6d6ef7264d96.1697614386.git.andrea.porta@suse.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <88bdea628a13747bff32c0c3055d6d6ef7264d96.1697614386.git.andrea.porta@suse.com>

Hi Andrea,

kernel test robot noticed the following build warnings:

[auto build test WARNING on arm64/for-next/core]
[also build test WARNING on arm-perf/for-next/perf arm/for-next arm/fixes kvmarm/next soc/for-next linus/master v6.6-rc6 next-20231020]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Andrea-della-Porta/arm64-Introduce-aarch32_enabled/20231018-191517
base:   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-next/core
patch link:    https://lore.kernel.org/r/88bdea628a13747bff32c0c3055d6d6ef7264d96.1697614386.git.andrea.porta%40suse.com
patch subject: [PATCH 3/4] arm64/entry-common: Make Aarch32 syscalls' availability depend on aarch32_enabled()
config: arm64-randconfig-003-20231023 (https://download.01.org/0day-ci/archive/20231023/202310230423.r2U4Lqr8-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231023/202310230423.r2U4Lqr8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310230423.r2U4Lqr8-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kernel/entry-common.c:805:11: warning: no previous prototype for 'el0t_32_sync_ni_handler' [-Wmissing-prototypes]
     805 | UNHANDLED(el0t, 32, sync_ni)
         |           ^~~~
   arch/arm64/kernel/entry-common.c:302:25: note: in definition of macro 'UNHANDLED'
     302 | asmlinkage void noinstr el##_##regsize##_##vector##_handler(struct pt_regs *regs)       \
         |                         ^~
>> arch/arm64/kernel/entry-common.c:806:11: warning: no previous prototype for 'el0t_32_irq_ni_handler' [-Wmissing-prototypes]
     806 | UNHANDLED(el0t, 32, irq_ni)
         |           ^~~~
   arch/arm64/kernel/entry-common.c:302:25: note: in definition of macro 'UNHANDLED'
     302 | asmlinkage void noinstr el##_##regsize##_##vector##_handler(struct pt_regs *regs)       \
         |                         ^~
>> arch/arm64/kernel/entry-common.c:807:11: warning: no previous prototype for 'el0t_32_fiq_ni_handler' [-Wmissing-prototypes]
     807 | UNHANDLED(el0t, 32, fiq_ni)
         |           ^~~~
   arch/arm64/kernel/entry-common.c:302:25: note: in definition of macro 'UNHANDLED'
     302 | asmlinkage void noinstr el##_##regsize##_##vector##_handler(struct pt_regs *regs)       \
         |                         ^~
>> arch/arm64/kernel/entry-common.c:808:11: warning: no previous prototype for 'el0t_32_error_ni_handler' [-Wmissing-prototypes]
     808 | UNHANDLED(el0t, 32, error_ni)
         |           ^~~~
   arch/arm64/kernel/entry-common.c:302:25: note: in definition of macro 'UNHANDLED'
     302 | asmlinkage void noinstr el##_##regsize##_##vector##_handler(struct pt_regs *regs)       \
         |                         ^~


vim +/el0t_32_sync_ni_handler +805 arch/arm64/kernel/entry-common.c

   803	
   804	#ifdef CONFIG_COMPAT
 > 805	UNHANDLED(el0t, 32, sync_ni)
 > 806	UNHANDLED(el0t, 32, irq_ni)
 > 807	UNHANDLED(el0t, 32, fiq_ni)
 > 808	UNHANDLED(el0t, 32, error_ni)
   809	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
