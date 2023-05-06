Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05CCD1FD5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  6 May 2023 12:55:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683377717; x=1714913717;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=XKDy5Z89IXhEjhwUAEMPMSb7JZCvdPfOEgqFFz0CKgM=;
  b=iBJE+lBfL8Sme8CX23RzilsGGdQ7S+Wu4TD5ngX2v3fIxF6Bnp13iezS
   R/V3rGA6YmtsYZcUede+Rr7/8u7lin3e31fi9QrIblqKm+vXvZxIipfhQ
   Xpn84UUwEoVt3UIhyOE1VFB+dr6BwslA/dZDdf9Iauvw6eJlK+6UTSrAO
   1edAmPV338gKkkEkhwHtRwJ6AN5U3qs2XTtmSAob+mP7yTTw43SOSPwSb
   rY57pnY6GsyOT0BJxT0rbq+ZI5syQv3bnXGBPIsgLSo/P7C82uFq84lE/
   gBiUrTYRjuKLI3u6uh20b22IY0JRffvRNfnygT50omojXDqwEorUZbOTA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="377462076"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="377462076"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 May 2023 05:55:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10702"; a="872246205"
X-IronPort-AV: E=Sophos;i="5.99,255,1677571200"; 
   d="scan'208";a="872246205"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 06 May 2023 05:55:15 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvHRT-0000JN-1Z;
	Sat, 06 May 2023 12:55:15 +0000
Date: Sat, 6 May 2023 20:54:22 +0800
From: kernel test robot <lkp@intel.com>
To: Dexuan Cui <decui@microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dcui-tdx:decui/mainline/v6-dda 8/13] drivers/hv/hv.c:240:25: error:
 implicit declaration of function 'cc_mkdec'
Message-ID: <202305062052.XidgtRIc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dcui/tdx decui/mainline/v6-dda
head:   cef8eab38588585b3c876df8d1ccf5831a6bf54f
commit: 2150e36e423a0c9a6b08a0550d0853eb5bb5f6bd [8/13] Drivers: hv: vmbus: Support TDX guests
config: arm64-allyesconfig (https://download.01.org/0day-ci/archive/20230506/202305062052.XidgtRIc-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/dcui/tdx/commit/2150e36e423a0c9a6b08a0550d0853eb5bb5f6bd
        git remote add dcui-tdx https://github.com/dcui/tdx
        git fetch --no-tags dcui-tdx decui/mainline/v6-dda
        git checkout 2150e36e423a0c9a6b08a0550d0853eb5bb5f6bd
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash drivers/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305062052.XidgtRIc-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/hv/hv.c: In function 'hv_synic_enable_regs':
>> drivers/hv/hv.c:240:25: error: implicit declaration of function 'cc_mkdec' [-Werror=implicit-function-declaration]
     240 |                         cc_mkdec(virt_to_phys(hv_cpu->synic_message_page))
         |                         ^~~~~~~~
   cc1: some warnings being treated as errors


vim +/cc_mkdec +240 drivers/hv/hv.c

   209	
   210	/*
   211	 * hv_synic_init - Initialize the Synthetic Interrupt Controller.
   212	 *
   213	 * If it is already initialized by another entity (ie x2v shim), we need to
   214	 * retrieve the initialized message and event pages.  Otherwise, we create and
   215	 * initialize the message and event pages.
   216	 */
   217	void hv_synic_enable_regs(unsigned int cpu)
   218	{
   219		struct hv_per_cpu_context *hv_cpu
   220			= per_cpu_ptr(hv_context.cpu_context, cpu);
   221		union hv_synic_simp simp;
   222		union hv_synic_siefp siefp;
   223		union hv_synic_sint shared_sint;
   224		union hv_synic_scontrol sctrl;
   225	
   226		/* Setup the Synic's message page */
   227		simp.as_uint64 = hv_get_register(HV_REGISTER_SIMP);
   228		simp.simp_enabled = 1;
   229	
   230		if (hv_isolation_type_snp() || hv_root_partition) {
   231			/* Mask out vTOM bit. ioremap_cache() maps decrypted */
   232			u64 base = (simp.base_simp_gpa << HV_HYP_PAGE_SHIFT) &
   233					~ms_hyperv.shared_gpa_boundary;
   234			hv_cpu->synic_message_page
   235				= (void *)ioremap_cache(base, HV_HYP_PAGE_SIZE);
   236			if (!hv_cpu->synic_message_page)
   237				pr_err("Fail to map synic message page.\n");
   238		} else {
   239			simp.base_simp_gpa =
 > 240				cc_mkdec(virt_to_phys(hv_cpu->synic_message_page))
   241				>> HV_HYP_PAGE_SHIFT;
   242		}
   243	
   244		hv_set_register(HV_REGISTER_SIMP, simp.as_uint64);
   245	
   246		/* Setup the Synic's event page */
   247		siefp.as_uint64 = hv_get_register(HV_REGISTER_SIEFP);
   248		siefp.siefp_enabled = 1;
   249	
   250		if (hv_isolation_type_snp() || hv_root_partition) {
   251			/* Mask out vTOM bit. ioremap_cache() maps decrypted */
   252			u64 base = (siefp.base_siefp_gpa << HV_HYP_PAGE_SHIFT) &
   253					~ms_hyperv.shared_gpa_boundary;
   254			hv_cpu->synic_event_page
   255				= (void *)ioremap_cache(base, HV_HYP_PAGE_SIZE);
   256			if (!hv_cpu->synic_event_page)
   257				pr_err("Fail to map synic event page.\n");
   258		} else {
   259			siefp.base_siefp_gpa =
   260				cc_mkdec(virt_to_phys(hv_cpu->synic_event_page))
   261				>> HV_HYP_PAGE_SHIFT;
   262		}
   263	
   264		hv_set_register(HV_REGISTER_SIEFP, siefp.as_uint64);
   265	
   266		/* Setup the shared SINT. */
   267		if (vmbus_irq != -1)
   268			enable_percpu_irq(vmbus_irq, 0);
   269		shared_sint.as_uint64 = hv_get_register(HV_REGISTER_SINT0 +
   270						VMBUS_MESSAGE_SINT);
   271	
   272		shared_sint.vector = vmbus_interrupt;
   273		shared_sint.masked = false;
   274	
   275		/*
   276		 * On architectures where Hyper-V doesn't support AEOI (e.g., ARM64),
   277		 * it doesn't provide a recommendation flag and AEOI must be disabled.
   278		 */
   279	#ifdef HV_DEPRECATING_AEOI_RECOMMENDED
   280		shared_sint.auto_eoi =
   281				!(ms_hyperv.hints & HV_DEPRECATING_AEOI_RECOMMENDED);
   282	#else
   283		shared_sint.auto_eoi = 0;
   284	#endif
   285		hv_set_register(HV_REGISTER_SINT0 + VMBUS_MESSAGE_SINT,
   286					shared_sint.as_uint64);
   287	
   288		/* Enable the global synic bit */
   289		sctrl.as_uint64 = hv_get_register(HV_REGISTER_SCONTROL);
   290		sctrl.enable = 1;
   291	
   292		hv_set_register(HV_REGISTER_SCONTROL, sctrl.as_uint64);
   293	}
   294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
