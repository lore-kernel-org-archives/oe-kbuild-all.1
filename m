Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0B59474
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 19:50:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681329024; x=1712865024;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=8YNsSA5PePpQdPRbOf2nvp/SQx4SogXVmZ3OpAfSvkk=;
  b=kOjus422MhnMpVHpWTfj7mnFgTZ+5o7HbF5MMsr3GF5mwK+80FJfnGE1
   srOog09N4KfkIwFm+riHLWGa5ISeLI3I2KIZGMLWDEtwwUXxQ0Q4Jigsq
   JhS0HrmtqQLNn7lJvbMQdu+kkMQ2Tfm4O9Z+0/RTsOG9fFBaOYhPJce+X
   vaSdsrgFiyWvicCraCieLFYo/GUoapb5EH3raqV5Lj2VXRQ76ekfK9/7H
   2W4PWb5lX3piklBk+hs1gUxEkGXxUP/UWf0Fq4iHUzQcbZY8kxZLEVMkY
   YIYEoXO/N7Eu94SiaE6xujzume64gV0iC6/VCd8UDbbFvx0HIw/I3ZGXQ
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="324366524"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="324366524"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 12:50:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="935258309"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="935258309"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 12 Apr 2023 12:50:22 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmgU2-000Y1P-0Q;
	Wed, 12 Apr 2023 19:50:22 +0000
Date: Thu, 13 Apr 2023 03:49:42 +0800
From: kernel test robot <lkp@intel.com>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [ardb:tmp-crypto-x86-local-labels 49/52] arch/x86/kernel/msr.o:
 warning: objtool: msr_device_destroy+0x4: indirect call found in RETPOLINE
 build
Message-ID: <202304130347.dXCFpvR5-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git tmp-crypto-x86-local-labels
head:   05c1b94d2afb1f4e0b2ce8bd48a8097df4288166
commit: 3308893d18a862828ec552159ea3dc35edd86957 [49/52] WIP
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230413/202304130347.dXCFpvR5-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git/commit/?id=3308893d18a862828ec552159ea3dc35edd86957
        git remote add ardb git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git
        git fetch --no-tags ardb tmp-crypto-x86-local-labels
        git checkout 3308893d18a862828ec552159ea3dc35edd86957
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130347.dXCFpvR5-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/msr.o: warning: objtool: msr_device_destroy+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/msr.o: warning: objtool: msr_devnode+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/msr.o: warning: objtool: filter_write+0x0: indirect call found in RETPOLINE build
>> arch/x86/kernel/msr.o: warning: objtool: msr_write+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/msr.o: warning: objtool: msr_device_create+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/msr.o: warning: objtool: msr_read+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/msr.o: warning: objtool: msr_open+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/msr.o: warning: objtool: msr_ioctl+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/msr.o: warning: objtool: get_allow_writes+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/msr.o: warning: objtool: set_allow_writes+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/msr.o: warning: objtool: msr_init+0x4: indirect call found in RETPOLINE build
--
>> arch/x86/kernel/cpuid.o: warning: objtool: cpuid_device_destroy+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpuid.o: warning: objtool: cpuid_devnode+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpuid.o: warning: objtool: cpuid_device_create+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpuid.o: warning: objtool: cpuid_smp_cpuid+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpuid.o: warning: objtool: cpuid_read+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpuid.o: warning: objtool: cpuid_open+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpuid.o: warning: objtool: cpuid_init+0x4: indirect call found in RETPOLINE build
--
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: inj_status_set+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: inj_misc_set+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: inj_addr_set+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: inj_synd_set+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: inj_status_get+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: inj_misc_get+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: inj_addr_get+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: inj_synd_get+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: inj_ipid_get+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: inj_ipid_set+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: inj_extcpu_get+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: trigger_mce+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: trigger_dfr_int+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: trigger_thr_int+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: inj_bank_get+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: raise_exception+0x0: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: mce_irq_ipi+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: raise_poll+0x0: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: mce_raise_notify+0x4: indirect call found in RETPOLINE build
>> arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: inj_readme_read+0x4: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: extcpu_fops_open+0x4: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: bank_fops_open+0x4: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: ipid_fops_open+0x4: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: synd_fops_open+0x4: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: addr_fops_open+0x4: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: misc_fops_open+0x4: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: status_fops_open+0x4: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: flags_read+0x4: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: inject_mce+0x0: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: flags_write+0x4: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: setup_inj_struct.constprop.0+0x0: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: toggle_hw_mce_inject.isra.0+0x0: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: do_inject+0x0: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: inj_bank_set+0x4: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: check_hw_inj_possible+0x0: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: raise_local.isra.0+0x0: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: raise_mce+0x0: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: mce_inject_raise+0x4: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: inj_extcpu_set+0x4: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: prepare_msrs+0x4: indirect call found in RETPOLINE build
   arch/x86/kernel/cpu/mce/mce-inject.o: warning: objtool: inject_init+0x4: indirect call found in RETPOLINE build

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
