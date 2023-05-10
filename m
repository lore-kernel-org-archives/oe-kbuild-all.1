Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BB2E362
	for <oe-kbuild-all@lists.linux.dev>; Wed, 10 May 2023 02:21:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683685275; x=1715221275;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Ra8qfUUFu94Ok4fnDXWqXJEfhyE8q2x3RNLmp+zvDCc=;
  b=HRdmt2PA+AVokUGmbL1ad+dOZGaAQtxbz2/5n2EyqRmFhCRJexYndRmL
   7ngSE7ipuYJqD5wfWVlkiPhoHlUncWk8dlzwPkbQWy2PERBlgFqx8InXl
   LNdn9/epzf7sHYboyrZpcU3YLRwfytGDDjOS9Qfoxl3ON7yjsAamOScsA
   Ufy5MGESctBTwJtb66HEjn08Fp8crz16HPDkIVJrGuassdkd7/kSa76O8
   qPl7n6Fp6DntO/SVLWgWZO9dg2raLagqgsJS7EAknJzbz3ey74Di+aBty
   7hqAAr9tnYn//Ol84iDVnxIuKD0I3b0BaFxdCDNKFTieWMXWBb8ZaZTic
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="352291162"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="352291162"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 May 2023 19:21:08 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10705"; a="649574258"
X-IronPort-AV: E=Sophos;i="5.99,263,1677571200"; 
   d="scan'208";a="649574258"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 09 May 2023 19:21:07 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pwZRy-0002n8-0z;
	Wed, 10 May 2023 02:21:06 +0000
Date: Wed, 10 May 2023 10:20:10 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 15734/27338]
 arch/x86/kernel/kvm.c:290:9: error: implicit declaration of function
 'timekeeping_inject_virtual_suspend_time'
Message-ID: <202305101017.KeVmju0k-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Hikaru,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   30753182dd1db5909d634086432b96232b04f250
commit: de318e50b913193dbd9598c26d197234f4bced89 [15734/27338] BACKPORT: FROMLIST: kvm/x86: virtual suspend time injection: Implement guest side
config: i386-randconfig-a003 (https://download.01.org/0day-ci/archive/20230510/202305101017.KeVmju0k-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-12) 11.3.0
reproduce (this is a W=1 build):
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common mirror-chromeos-5.10-arcvm
        git checkout de318e50b913193dbd9598c26d197234f4bced89
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=i386 olddefconfig
        make W=1 O=build_dir ARCH=i386 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305101017.KeVmju0k-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kernel/kvm.c: In function '__sysvec_kvm_hv_callback':
>> arch/x86/kernel/kvm.c:290:9: error: implicit declaration of function 'timekeeping_inject_virtual_suspend_time' [-Werror=implicit-function-declaration]
     290 |         timekeeping_inject_virtual_suspend_time(kvm_get_suspend_time());
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/timekeeping_inject_virtual_suspend_time +290 arch/x86/kernel/kvm.c

   273	
   274	DEFINE_IDTENTRY_SYSVEC(sysvec_kvm_hv_callback)
   275	{
   276		struct pt_regs *old_regs = set_irq_regs(regs);
   277		u32 token;
   278	
   279		ack_APIC_irq();
   280	
   281		inc_irq_stat(irq_hv_callback_count);
   282	
   283		if (__this_cpu_read(apf_reason.enabled)) {
   284			token = __this_cpu_read(apf_reason.token);
   285			kvm_async_pf_task_wake(token);
   286			__this_cpu_write(apf_reason.token, 0);
   287			wrmsrl(MSR_KVM_ASYNC_PF_ACK, 1);
   288		}
   289	
 > 290		timekeeping_inject_virtual_suspend_time(kvm_get_suspend_time());
   291	
   292		set_irq_regs(old_regs);
   293	}
   294	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
