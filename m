Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E878B7F
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Apr 2023 09:57:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1682157465; x=1713693465;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ClQp/UahUKVuWcB2xPqfu+gWEopXby252zF+36AZ/hg=;
  b=n+bn6ggyihh61iKomCvU3DtwBIRglXtZK8bHPfX2aNS/qngEVB7nI2Ls
   GAAaPCA9eRYi5TnLjARA128AypBoemfiy8d46cgQJNq0yvQiQfSLshFUt
   b8DDN4UA72TPdRu6JBBUx7fcDu5aazxtAdY+VNzp4TZt/P3pL2YlfsfP4
   9tKiDszoPku14HX+No/uyWiIJ3rfuFj5RSwMLlyAvINwJKf+iTKbh6Ig6
   ++TmbdDqFlk/n+5Pkfa7EQh15r3tdaMFcO4nUka29+WrStWkY7uH25/Tc
   oiCJ0Yi5AnQFhy1uoq1yQn5spmSuqvH6JitD24wnFjjD6fBN+dLTJ1R5j
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="432420829"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="432420829"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Apr 2023 02:57:43 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10687"; a="695190967"
X-IronPort-AV: E=Sophos;i="5.99,218,1677571200"; 
   d="scan'208";a="695190967"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 22 Apr 2023 02:57:42 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pq9zx-000hEU-0e;
	Sat, 22 Apr 2023 09:57:41 +0000
Date: Sat, 22 Apr 2023 17:56:51 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dcui-tdx:decui/michaelv7dda/tdx/v5 9/10] drivers/hv/hv.c:265:25:
 error: implicit declaration of function 'cc_mkdec'
Message-ID: <202304221751.61LjjzuD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/michaelv7dda/tdx/v5
head:   4b485dee53a76f5b055d2feac48bb166243bc67d
commit: 28390a5ef42b5661a4dca06eca0305faa3868c0b [9/10] Drivers: hv: vmbus: Support TDX guests
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230422/202304221751.61LjjzuD-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/dcui/tdx/commit/28390a5ef42b5661a4dca06eca0305faa3868c0b
        git remote add dcui-tdx https://github.com/dcui/tdx
        git fetch --no-tags dcui-tdx decui/michaelv7dda/tdx/v5
        git checkout 28390a5ef42b5661a4dca06eca0305faa3868c0b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304221751.61LjjzuD-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hv/hv.c: In function 'hv_synic_enable_regs':
>> drivers/hv/hv.c:265:25: error: implicit declaration of function 'cc_mkdec' [-Werror=implicit-function-declaration]
     265 |                         cc_mkdec(virt_to_phys(hv_cpu->synic_message_page))
         |                         ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/cc_mkdec +265 drivers/hv/hv.c

   234	
   235	/*
   236	 * hv_synic_init - Initialize the Synthetic Interrupt Controller.
   237	 *
   238	 * If it is already initialized by another entity (ie x2v shim), we need to
   239	 * retrieve the initialized message and event pages.  Otherwise, we create and
   240	 * initialize the message and event pages.
   241	 */
   242	void hv_synic_enable_regs(unsigned int cpu)
   243	{
   244		struct hv_per_cpu_context *hv_cpu
   245			= per_cpu_ptr(hv_context.cpu_context, cpu);
   246		union hv_synic_simp simp;
   247		union hv_synic_siefp siefp;
   248		union hv_synic_sint shared_sint;
   249		union hv_synic_scontrol sctrl;
   250	
   251		/* Setup the Synic's message page */
   252		simp.as_uint64 = hv_get_register(HV_REGISTER_SIMP);
   253		simp.simp_enabled = 1;
   254	
   255		if (hv_isolation_type_snp() || hv_root_partition) {
   256			/* Mask out vTOM bit. ioremap_cache() maps decrypted */
   257			u64 base = (simp.base_simp_gpa << HV_HYP_PAGE_SHIFT) &
   258					~ms_hyperv.shared_gpa_boundary;
   259			hv_cpu->synic_message_page
   260				= (void *)ioremap_cache(base, HV_HYP_PAGE_SIZE);
   261			if (!hv_cpu->synic_message_page)
   262				pr_err("Fail to map synic message page.\n");
   263		} else {
   264			simp.base_simp_gpa =
 > 265				cc_mkdec(virt_to_phys(hv_cpu->synic_message_page))
   266				>> HV_HYP_PAGE_SHIFT;
   267		}
   268	
   269		hv_set_register(HV_REGISTER_SIMP, simp.as_uint64);
   270	
   271		/* Setup the Synic's event page */
   272		siefp.as_uint64 = hv_get_register(HV_REGISTER_SIEFP);
   273		siefp.siefp_enabled = 1;
   274	
   275		if (hv_isolation_type_snp() || hv_root_partition) {
   276			/* Mask out vTOM bit. ioremap_cache() maps decrypted */
   277			u64 base = (siefp.base_siefp_gpa << HV_HYP_PAGE_SHIFT) &
   278					~ms_hyperv.shared_gpa_boundary;
   279			hv_cpu->synic_event_page
   280				= (void *)ioremap_cache(base, HV_HYP_PAGE_SIZE);
   281			if (!hv_cpu->synic_event_page)
   282				pr_err("Fail to map synic event page.\n");
   283		} else {
   284			siefp.base_siefp_gpa =
   285				cc_mkdec(virt_to_phys(hv_cpu->synic_event_page))
   286				>> HV_HYP_PAGE_SHIFT;
   287		}
   288	
   289		hv_set_register(HV_REGISTER_SIEFP, siefp.as_uint64);
   290	
   291		/* Setup the shared SINT. */
   292		if (vmbus_irq != -1)
   293			enable_percpu_irq(vmbus_irq, 0);
   294		shared_sint.as_uint64 = hv_get_register(HV_REGISTER_SINT0 +
   295						VMBUS_MESSAGE_SINT);
   296	
   297		shared_sint.vector = vmbus_interrupt;
   298		shared_sint.masked = false;
   299	
   300		/*
   301		 * On architectures where Hyper-V doesn't support AEOI (e.g., ARM64),
   302		 * it doesn't provide a recommendation flag and AEOI must be disabled.
   303		 */
   304	#ifdef HV_DEPRECATING_AEOI_RECOMMENDED
   305		shared_sint.auto_eoi =
   306				!(ms_hyperv.hints & HV_DEPRECATING_AEOI_RECOMMENDED);
   307	#else
   308		shared_sint.auto_eoi = 0;
   309	#endif
   310		hv_set_register(HV_REGISTER_SINT0 + VMBUS_MESSAGE_SINT,
   311					shared_sint.as_uint64);
   312	
   313		/* Enable the global synic bit */
   314		sctrl.as_uint64 = hv_get_register(HV_REGISTER_SCONTROL);
   315		sctrl.enable = 1;
   316	
   317		hv_set_register(HV_REGISTER_SCONTROL, sctrl.as_uint64);
   318	}
   319	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
