Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FCDFEBE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Apr 2023 01:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681779732; x=1713315732;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CSYa1/h9O3UhfPUohHgou6PJcarF447gqH084RhMSsI=;
  b=gYphjis4wTzOQBmC8QTjBTqIFcVehjdH5TVV+SQVAIXhVSbFaeIEjSRD
   rAzT/+fRwKSP84JINVzdQntuN2TIdQaxDygsOtwo4W8A5kjuMAiG82wVB
   VG7iFnePGvr1vGVgOMb5D7ifU+sZPzNvHWYL7utN2e4PFUnh7YjyjoB3Q
   zOOc2TVpxM1cc9iCZt9IchrK5A1Q9rZV81bWKlpQDsvVHkf0AWuL6TBV7
   dxO5rkjRHXKatEYxRztz+RzhhNLnAPVT6VRtLK49LiCO55zATHNLf9stj
   U6n8uq1CA4XKXUZzZiJEhtmnlDhqfUE2u0WQGIhWWTTCwpVJhKirZ1JSL
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="324662668"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="324662668"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2023 18:02:11 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10683"; a="641166411"
X-IronPort-AV: E=Sophos;i="5.99,205,1677571200"; 
   d="scan'208";a="641166411"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 17 Apr 2023 18:02:09 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1poZjV-000cnD-0F;
	Tue, 18 Apr 2023 01:02:09 +0000
Date: Tue, 18 Apr 2023 09:01:30 +0800
From: kernel test robot <lkp@intel.com>
To: Saurabh Sengar <ssengar@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev, Wei Liu <wei.liu@kernel.org>,
	Michael Kelley <mikelley@microsoft.com>
Subject: [hyperv:hyperv-next 19/22] arch/x86/kernel/cpu/mshyperv.c:462:47:
 error: 'hv_get_nmi_reason' undeclared
Message-ID: <202304180854.hFP3skoU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-next
head:   4dbdcfe1c5db80edca564d1b28b458792d2e0747
commit: 06598d08a6aa380ef548f09081c91c5add5014b8 [19/22] x86/hyperv: Make hv_get_nmi_reason public
config: i386-randconfig-a002-20230417 (https://download.01.org/0day-ci/archive/20230418/202304180854.hFP3skoU-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git/commit/?id=06598d08a6aa380ef548f09081c91c5add5014b8
        git remote add hyperv https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git
        git fetch --no-tags hyperv hyperv-next
        git checkout 06598d08a6aa380ef548f09081c91c5add5014b8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304180854.hFP3skoU-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/cpu/mshyperv.c: In function 'ms_hyperv_init_platform':
>> arch/x86/kernel/cpu/mshyperv.c:462:47: error: 'hv_get_nmi_reason' undeclared (first use in this function)
     462 |                 x86_platform.get_nmi_reason = hv_get_nmi_reason;
         |                                               ^~~~~~~~~~~~~~~~~
   arch/x86/kernel/cpu/mshyperv.c:462:47: note: each undeclared identifier is reported only once for each function it appears in


vim +/hv_get_nmi_reason +462 arch/x86/kernel/cpu/mshyperv.c

ca3ba2a2f4a49a Jason Wang       2014-02-28  438  
1e034743e918d1 Vitaly Kuznetsov 2015-09-23  439  #if IS_ENABLED(CONFIG_HYPERV) && defined(CONFIG_KEXEC_CORE)
2517281d63a2b0 Vitaly Kuznetsov 2015-08-01  440  	machine_ops.shutdown = hv_machine_shutdown;
b4370df2b1f515 Vitaly Kuznetsov 2015-08-01  441  	machine_ops.crash_shutdown = hv_machine_crash_shutdown;
1e034743e918d1 Vitaly Kuznetsov 2015-09-23  442  #endif
e1471463180ddc Joseph Salisbury 2020-09-26  443  	if (ms_hyperv.features & HV_ACCESS_TSC_INVARIANT) {
5f92b45c3b67e3 Ani Sinha        2021-07-16  444  		/*
5f92b45c3b67e3 Ani Sinha        2021-07-16  445  		 * Writing to synthetic MSR 0x40000118 updates/changes the
5f92b45c3b67e3 Ani Sinha        2021-07-16  446  		 * guest visible CPUIDs. Setting bit 0 of this MSR  enables
5f92b45c3b67e3 Ani Sinha        2021-07-16  447  		 * guests to report invariant TSC feature through CPUID
5f92b45c3b67e3 Ani Sinha        2021-07-16  448  		 * instruction, CPUID 0x800000007/EDX, bit 8. See code in
5f92b45c3b67e3 Ani Sinha        2021-07-16  449  		 * early_init_intel() where this bit is examined. The
5f92b45c3b67e3 Ani Sinha        2021-07-16  450  		 * setting of this MSR bit should happen before init_intel()
5f92b45c3b67e3 Ani Sinha        2021-07-16  451  		 * is called.
5f92b45c3b67e3 Ani Sinha        2021-07-16  452  		 */
b961aa757f940b Vitaly Kuznetsov 2022-10-13  453  		wrmsrl(HV_X64_MSR_TSC_INVARIANT_CONTROL, HV_EXPOSE_INVARIANT_TSC);
dce7cd62754b5d Andrea Parri     2019-10-03  454  		setup_force_cpu_cap(X86_FEATURE_TSC_RELIABLE);
dce7cd62754b5d Andrea Parri     2019-10-03  455  	}
1e2ae9ec072f3b Vitaly Kuznetsov 2016-04-15  456  
1e2ae9ec072f3b Vitaly Kuznetsov 2016-04-15  457  	/*
1e2ae9ec072f3b Vitaly Kuznetsov 2016-04-15  458  	 * Generation 2 instances don't support reading the NMI status from
1e2ae9ec072f3b Vitaly Kuznetsov 2016-04-15  459  	 * 0x61 port.
1e2ae9ec072f3b Vitaly Kuznetsov 2016-04-15  460  	 */
1e2ae9ec072f3b Vitaly Kuznetsov 2016-04-15  461  	if (efi_enabled(EFI_BOOT))
1e2ae9ec072f3b Vitaly Kuznetsov 2016-04-15 @462  		x86_platform.get_nmi_reason = hv_get_nmi_reason;
8730046c1498e8 K. Y. Srinivasan 2017-01-18  463  
1de72c706488b7 Michael Kelley   2018-11-04  464  	/*
1de72c706488b7 Michael Kelley   2018-11-04  465  	 * Hyper-V VMs have a PIT emulation quirk such that zeroing the
1de72c706488b7 Michael Kelley   2018-11-04  466  	 * counter register during PIT shutdown restarts the PIT. So it
1de72c706488b7 Michael Kelley   2018-11-04  467  	 * continues to interrupt @18.2 HZ. Setting i8253_clear_counter
1de72c706488b7 Michael Kelley   2018-11-04  468  	 * to false tells pit_shutdown() not to zero the counter so that
1de72c706488b7 Michael Kelley   2018-11-04  469  	 * the PIT really is shutdown. Generation 2 VMs don't have a PIT,
1de72c706488b7 Michael Kelley   2018-11-04  470  	 * and setting this value has no effect.
1de72c706488b7 Michael Kelley   2018-11-04  471  	 */
1de72c706488b7 Michael Kelley   2018-11-04  472  	i8253_clear_counter_on_shutdown = false;
1de72c706488b7 Michael Kelley   2018-11-04  473  

:::::: The code at line 462 was first introduced by commit
:::::: 1e2ae9ec072f3b7887f456426bc2cf23b80f661a x86/hyperv: Avoid reporting bogus NMI status for Gen2 instances

:::::: TO: Vitaly Kuznetsov <vkuznets@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
