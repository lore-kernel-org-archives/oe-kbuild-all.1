Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8868F171B0
	for <oe-kbuild-all@lists.linux.dev>; Wed, 21 Jun 2023 13:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1687354935; x=1718890935;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=avcxcAJcdb86KMa44AlDgrhRAhKjHxyX5istsfwRPLk=;
  b=THykyh+Bwj/0ToXrIVYxOn53XusucFZypXqaMDMxDCozzKdgwjRWvi7Z
   VmJ+2wPrmd7LUL29BNrlAccEDItq8kvzIaLVH2TfwJxrwxLl0JOYKR3lc
   HvjDaG0L+fycM7axlJa0Y5umRnkv36XfQAUs6Q6ysiyEXsWh3Db3RnGn+
   Uq+Sn8DDg9XRYQLoqvynY2duLnVN3GRQCZOfaNP1tq9g02udo3HywoI9h
   My4JBZh36co8vNk1Kvz35p/N7bZK1c9xOFqlrpbEaMU3HIE5DQDwLeaTo
   /jCfdWSLMaJGBDVesYYl5+ixtCjjD8CjSrDJWFeIYi+r+4VRWfc3z4JdW
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="359044220"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="359044220"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jun 2023 06:42:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10748"; a="784503123"
X-IronPort-AV: E=Sophos;i="6.00,260,1681196400"; 
   d="scan'208";a="784503123"
Received: from lkp-server01.sh.intel.com (HELO 783282924a45) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 21 Jun 2023 06:42:08 -0700
Received: from kbuild by 783282924a45 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qBy63-0006rT-2P;
	Wed, 21 Jun 2023 13:42:07 +0000
Date: Wed, 21 Jun 2023 21:41:13 +0800
From: kernel test robot <lkp@intel.com>
To: "Mike Rapoport (IBM)" <rppt@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Mike Rapoport <rppt@kernel.org>
Subject: [rppt:jitalloc/v2.2 10/12] arch/powerpc/mm/mem.c:419:18: error:
 'struct execmem_range' has no member named 'text'
Message-ID: <202306212120.m2OLgLBW-lkp@intel.com>
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
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20230621/202306212120.m2OLgLBW-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230621/202306212120.m2OLgLBW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202306212120.m2OLgLBW-lkp@intel.com/

All errors (new ones prefixed by >>):

>> arch/powerpc/mm/mem.c:419:18: error: 'struct execmem_range' has no member named 'text'
     419 |                 .text = {
         |                  ^~~~
   arch/powerpc/mm/mem.c:419:17: warning: braces around scalar initializer
     419 |                 .text = {
         |                 ^
   arch/powerpc/mm/mem.c:419:17: note: (near initialization for 'execmem_params.jit.start')
>> arch/powerpc/mm/mem.c:420:25: error: field name not in record or union initializer
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
 > 420				.alignment = 1,
   421			},
   422		},
   423	};
   424	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
