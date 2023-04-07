Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4814623C4
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Apr 2023 16:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1680886682; x=1712422682;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=a3HsquorHt6NIt597zLLA0jRvHYs5k+0KiZz/IRLsRA=;
  b=M1WCvzc3i9cLuPAoR2tXqtPHg1+JmPpnreg1E9xLxagwQbArLYzZpGxn
   sDJ+3CdpHt4aMZdciOqapYkAaK46v07ddkl4KyQdea9HMt4TwMxiZYZTA
   mY/MZApAd5hxwqQqnYzNvcg4AQZ2cMyfFQftEKmFjvCDHszqYnwd7yKUH
   tj+nmvwcH+DEEJXnLPvp7CG9HsiJy2GEem74qHiYEG36HJTFx56WrJ89a
   2EPiolIpWQWxZW1eacDOdlyghmsW5eUB9dkSezoGHk9gLq+XAjo9PRekJ
   2CXHVw/Gs8T3l5bDe+AQoAq9sRRlT7ltLFlzXHYBu3oXJSDfibIhPUosZ
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="340515953"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="340515953"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Apr 2023 09:57:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10673"; a="811452135"
X-IronPort-AV: E=Sophos;i="5.98,327,1673942400"; 
   d="scan'208";a="811452135"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 07 Apr 2023 09:57:56 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pkpPP-000Shj-1L;
	Fri, 07 Apr 2023 16:57:55 +0000
Date: Sat, 8 Apr 2023 00:57:24 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dcui-tdx:decui/michaelv7dda/tdx/v4 10/11] drivers/hv/hv.c:279:25:
 error: implicit declaration of function 'cc_mkdec'
Message-ID: <202304080036.ETjopEW9-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/michaelv7dda/tdx/v4
head:   1d92fca91fe3723a3a86bb54b4d427c9fcb803e9
commit: 8fac891171a7ada90df55e3496b04b239e0a7266 [10/11] Drivers: hv: vmbus: Support TDX guests
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230408/202304080036.ETjopEW9-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/dcui/tdx/commit/8fac891171a7ada90df55e3496b04b239e0a7266
        git remote add dcui-tdx https://github.com/dcui/tdx
        git fetch --no-tags dcui-tdx decui/michaelv7dda/tdx/v4
        git checkout 8fac891171a7ada90df55e3496b04b239e0a7266
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304080036.ETjopEW9-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hv/hv.c: In function 'hv_synic_enable_regs':
>> drivers/hv/hv.c:279:25: error: implicit declaration of function 'cc_mkdec' [-Werror=implicit-function-declaration]
     279 |                         cc_mkdec(virt_to_phys(hv_cpu->synic_message_page)) >>
         |                         ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/cc_mkdec +279 drivers/hv/hv.c

   248	
   249	/*
   250	 * hv_synic_init - Initialize the Synthetic Interrupt Controller.
   251	 *
   252	 * If it is already initialized by another entity (ie x2v shim), we need to
   253	 * retrieve the initialized message and event pages.  Otherwise, we create and
   254	 * initialize the message and event pages.
   255	 */
   256	void hv_synic_enable_regs(unsigned int cpu)
   257	{
   258		struct hv_per_cpu_context *hv_cpu
   259			= per_cpu_ptr(hv_context.cpu_context, cpu);
   260		union hv_synic_simp simp;
   261		union hv_synic_siefp siefp;
   262		union hv_synic_sint shared_sint;
   263		union hv_synic_scontrol sctrl;
   264	
   265		/* Setup the Synic's message page */
   266		simp.as_uint64 = hv_get_register(HV_REGISTER_SIMP);
   267		simp.simp_enabled = 1;
   268	
   269		if (hv_isolation_type_snp() || hv_root_partition) {
   270			/* Mask out vTOM bit. ioremap_cache() maps decrypted */
   271			u64 base = (simp.base_simp_gpa << HV_HYP_PAGE_SHIFT) &
   272					~ms_hyperv.shared_gpa_boundary;
   273			hv_cpu->synic_message_page
   274				= (void *)ioremap_cache(base, HV_HYP_PAGE_SIZE);
   275			if (!hv_cpu->synic_message_page)
   276				pr_err("Fail to map synic message page.\n");
   277		} else {
   278			simp.base_simp_gpa =
 > 279				cc_mkdec(virt_to_phys(hv_cpu->synic_message_page)) >>
   280				HV_HYP_PAGE_SHIFT;
   281		}
   282	
   283		hv_set_register(HV_REGISTER_SIMP, simp.as_uint64);
   284	
   285		/* Setup the Synic's event page */
   286		siefp.as_uint64 = hv_get_register(HV_REGISTER_SIEFP);
   287		siefp.siefp_enabled = 1;
   288	
   289		if (hv_isolation_type_snp() || hv_root_partition) {
   290			/* Mask out vTOM bit. ioremap_cache() maps decrypted */
   291			u64 base = (siefp.base_siefp_gpa << HV_HYP_PAGE_SHIFT) &
   292					~ms_hyperv.shared_gpa_boundary;
   293			hv_cpu->synic_event_page
   294				= (void *)ioremap_cache(base, HV_HYP_PAGE_SIZE);
   295			if (!hv_cpu->synic_event_page)
   296				pr_err("Fail to map synic event page.\n");
   297		} else {
   298			siefp.base_siefp_gpa =
   299				cc_mkdec(virt_to_phys(hv_cpu->synic_event_page)) >>
   300				HV_HYP_PAGE_SHIFT;
   301		}
   302	
   303		hv_set_register(HV_REGISTER_SIEFP, siefp.as_uint64);
   304	
   305		/* Setup the shared SINT. */
   306		if (vmbus_irq != -1)
   307			enable_percpu_irq(vmbus_irq, 0);
   308		shared_sint.as_uint64 = hv_get_register(HV_REGISTER_SINT0 +
   309						VMBUS_MESSAGE_SINT);
   310	
   311		shared_sint.vector = vmbus_interrupt;
   312		shared_sint.masked = false;
   313	
   314		/*
   315		 * On architectures where Hyper-V doesn't support AEOI (e.g., ARM64),
   316		 * it doesn't provide a recommendation flag and AEOI must be disabled.
   317		 */
   318	#ifdef HV_DEPRECATING_AEOI_RECOMMENDED
   319		shared_sint.auto_eoi =
   320				!(ms_hyperv.hints & HV_DEPRECATING_AEOI_RECOMMENDED);
   321	#else
   322		shared_sint.auto_eoi = 0;
   323	#endif
   324		hv_set_register(HV_REGISTER_SINT0 + VMBUS_MESSAGE_SINT,
   325					shared_sint.as_uint64);
   326	
   327		/* Enable the global synic bit */
   328		sctrl.as_uint64 = hv_get_register(HV_REGISTER_SCONTROL);
   329		sctrl.enable = 1;
   330	
   331		hv_set_register(HV_REGISTER_SCONTROL, sctrl.as_uint64);
   332	}
   333	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
