Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76013208A7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Sep 2023 13:49:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695822593; x=1727358593;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=I5eQWlZmbRZ0IoBspiUsTDIdUtCLCfbPZsVnY1iOfgw=;
  b=cTtJiX4dblo5pjawFEAJidLp6gelWXmPO4gxlO0Kla3lsMFlKv9l+1cN
   qs6BA3EnU5eBzu67Pd9sbJWEvPa+7RQvKAHAFDmPO9NXhVa4Zn9USKGJq
   xmuASF8OubCcB6SNn4Jxj17SeOPqIhoPygkGm/7XyEdGuoZDAqUG5KgL4
   1Ig5/ahF2rmzDsfJb/CZfoCcwsUu+E9ycEPnlfrXzLtzR8w0pksD65QaR
   E5jad6TNGbSRGJfAVpwaqA0s5CAPs/tm/uEZrLSE2misfnNneYWNNEeIg
   SYzjBIK0Qgh9LEfGkBiz0VnQtZHIIzEk3h1PxVaJuLhmG1DNzQVFHB410
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="3361626"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="3361626"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Sep 2023 06:49:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10846"; a="778552015"
X-IronPort-AV: E=Sophos;i="6.03,181,1694761200"; 
   d="scan'208";a="778552015"
Received: from lkp-server02.sh.intel.com (HELO c3b01524d57c) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 27 Sep 2023 06:49:49 -0700
Received: from kbuild by c3b01524d57c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qlUvD-0000GF-0T;
	Wed, 27 Sep 2023 13:49:47 +0000
Date: Wed, 27 Sep 2023 21:48:46 +0800
From: kernel test robot <lkp@intel.com>
To: Tianrui Zhao <zhaotianrui@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v22 22/25] LoongArch: KVM: Implement vcpu world switch
Message-ID: <202309272118.HMYROlD2-lkp@intel.com>
References: <20230927030959.3629941-23-zhaotianrui@loongson.cn>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230927030959.3629941-23-zhaotianrui@loongson.cn>

Hi Tianrui,

kernel test robot noticed the following build warnings:

[auto build test WARNING on kvm/queue]
[also build test WARNING on mst-vhost/linux-next linus/master v6.6-rc3 next-20230927]
[cannot apply to kvm/linux-next]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tianrui-Zhao/LoongArch-KVM-Add-kvm-related-header-files/20230927-134637
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20230927030959.3629941-23-zhaotianrui%40loongson.cn
patch subject: [PATCH v22 22/25] LoongArch: KVM: Implement vcpu world switch
config: loongarch-randconfig-002-20230927 (https://download.01.org/0day-ci/archive/20230927/202309272118.HMYROlD2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230927/202309272118.HMYROlD2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309272118.HMYROlD2-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/loongarch/kernel/asm-offsets.c:18:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      18 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:65:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      65 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:80:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      80 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:96:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
      96 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:132:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     132 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:173:6: warning: no previous prototype for 'output_thread_lbt_defines' [-Wmissing-prototypes]
     173 | void output_thread_lbt_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:183:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     183 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:215:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     215 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:223:6: warning: no previous prototype for 'output_signal_defines' [-Wmissing-prototypes]
     223 | void output_signal_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:261:6: warning: no previous prototype for 'output_smpboot_defines' [-Wmissing-prototypes]
     261 | void output_smpboot_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/loongarch/kernel/asm-offsets.c:294:6: warning: no previous prototype for 'output_kvm_defines' [-Wmissing-prototypes]
     294 | void output_kvm_defines(void)
         |      ^~~~~~~~~~~~~~~~~~
--
   arch/loongarch/kernel/asm-offsets.c:18:6: warning: no previous prototype for 'output_ptreg_defines' [-Wmissing-prototypes]
      18 | void output_ptreg_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:65:6: warning: no previous prototype for 'output_task_defines' [-Wmissing-prototypes]
      65 | void output_task_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:80:6: warning: no previous prototype for 'output_thread_info_defines' [-Wmissing-prototypes]
      80 | void output_thread_info_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:96:6: warning: no previous prototype for 'output_thread_defines' [-Wmissing-prototypes]
      96 | void output_thread_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:132:6: warning: no previous prototype for 'output_thread_fpu_defines' [-Wmissing-prototypes]
     132 | void output_thread_fpu_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:173:6: warning: no previous prototype for 'output_thread_lbt_defines' [-Wmissing-prototypes]
     173 | void output_thread_lbt_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:183:6: warning: no previous prototype for 'output_mm_defines' [-Wmissing-prototypes]
     183 | void output_mm_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:215:6: warning: no previous prototype for 'output_sc_defines' [-Wmissing-prototypes]
     215 | void output_sc_defines(void)
         |      ^~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:223:6: warning: no previous prototype for 'output_signal_defines' [-Wmissing-prototypes]
     223 | void output_signal_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~
   arch/loongarch/kernel/asm-offsets.c:261:6: warning: no previous prototype for 'output_smpboot_defines' [-Wmissing-prototypes]
     261 | void output_smpboot_defines(void)
         |      ^~~~~~~~~~~~~~~~~~~~~~
>> arch/loongarch/kernel/asm-offsets.c:294:6: warning: no previous prototype for 'output_kvm_defines' [-Wmissing-prototypes]
     294 | void output_kvm_defines(void)
         |      ^~~~~~~~~~~~~~~~~~


vim +/output_kvm_defines +294 arch/loongarch/kernel/asm-offsets.c

   293	
 > 294	void output_kvm_defines(void)

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
