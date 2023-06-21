Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3162BC2DE
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 10:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687341907; x=1718877907;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Mw5a9IlJMWkg8dMLU/gV8oSzDeA8YwS4Qw6wJbiYfng=;
  b=m9MfNKNgAAwwKomiNDb/82tJvEymXPhtqDgiKbeMZLMngv0oKo1PdYxP
   dxsC1c8hfUVhIFwtpQHPjlIKxNs9WWzxmjfhKIRIdX48MwhPfu3c7tumg
   CENUyYqX6qfRmnyoF2ke/zVsd7Aq5nCT8sW8PBztURkl7E2J/ftRp4UOB
   mfSavgcWxnEE4tEMUoXGbQ6xWiosLp8ht4IjXWMdMe6E0dmkRC4xTp04P
   yJkUS1dG41jpDOnYGeOzKDpq4lNrPf3OHCrpZfOf2igGEBGJsBzl19AAH
   DV5ZhO8qcT2wdq3gPOaEgVn0BpYLm+YM+ez7Cl4s1hA8A1VDFEsnQO8Hc
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="340470797"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="340470797"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 03:05:06 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10747"; a="784424106"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="784424106"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jun 2023 03:05:05 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBui0-0006ln-1Q;
	Wed, 21 Jun 2023 10:05:04 +0000
Date: Wed, 21 Jun 2023 18:04:55 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:jitalloc/v2.2 10/12] arch/powerpc/mm/mem.c:419:17: warning:
 braces around scalar initializer
Message-ID: <202306211714.xXTpVm1W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rppt/linux.git jitalloc/v2.2
head:   4d3b7e33eca22e1fe243f586c13c875d248d29f6
commit: 5f24f0d18c8afbea8c6adc7274c588f256197685 [10/12] arch: make execmem setup available regardless of CONFIG_MODULES
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230621/202306211714.xXTpVm1W-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306211714.xXTpVm1W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306211714.xXTpVm1W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/powerpc/mm/mem.c:419:18: error: 'struct execmem_range' has no member named 'text'
     419 |                 .text = {
         |                  ^~~~
>> arch/powerpc/mm/mem.c:419:17: warning: braces around scalar initializer
     419 |                 .text = {
         |                 ^
   arch/powerpc/mm/mem.c:419:17: note: (near initialization for 'execmem_params.jit.start')
   arch/powerpc/mm/mem.c:420:25: error: field name not in record or union initializer
     420 |                         .alignment = 1,
         |                         ^
   arch/powerpc/mm/mem.c:420:25: note: (near initialization for 'execmem_params.jit.start')
   arch/powerpc/mm/mem.c: In function 'execmem_arch_params':
   arch/powerpc/mm/mem.c:457:27: error: 'struct execmem_range' has no member named 'text'
     457 |         execmem_params.jit.text.start = VMALLOC_START;
         |                           ^
   arch/powerpc/mm/mem.c:458:27: error: 'struct execmem_range' has no member named 'text'
     458 |         execmem_params.jit.text.end = VMALLOC_END;
         |                           ^
   arch/powerpc/mm/mem.c:461:35: error: 'struct execmem_range' has no member named 'text'
     461 |                 execmem_params.jit.text.pgprot = PAGE_KERNEL_ROX;
         |                                   ^
   arch/powerpc/mm/mem.c:463:35: error: 'struct execmem_range' has no member named 'text'
     463 |                 execmem_params.jit.text.pgprot = PAGE_KERNEL_EXEC;
         |                                   ^


vim +419 arch/powerpc/mm/mem.c

   410	
   411	#ifdef CONFIG_EXECMEM
   412	static struct execmem_params execmem_params __ro_after_init = {
   413		.modules = {
   414			.text = {
   415				.alignment = 1,
   416			},
   417		},
   418		.jit = {
 > 419			.text = {
   420				.alignment = 1,
   421			},
   422		},
   423	};
   424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
