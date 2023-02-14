Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A480328F0
	for <oe-kbuild-all@lists.linux.dev>; Tue, 14 Feb 2023 06:16:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676355419; x=1707891419;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=FAPqDtvaRSO5E7INo/wDyByzwPM5tFvBw4WJigQzRPc=;
  b=COd49gM6bIeP/C2TebDjMCr6DMkxT99c+wsxnfH/9Q0dFYfu3Ka4pkO3
   rZO01KuoSIh8Rx1ZIiMFs/3cWNlFCkLAeycvX1qVl4i0UjwrHLN1V1h/n
   XsnBqNZ9ojlg0boNFf6TcociVtwCLuPs/nhw9IsTANfVFOklwMSQGwKNc
   8a20bERpBtoY2UkcSdMMSqf8vh4krX3P5wQaczHS1QL2vUmm61XIx0tlv
   /ikLiXpQGZNITV8mHQIO12dnFj+wDYoQaLi9ypK/e2wCK/ATrywS5f/35
   6wITuHQ+muWNiu1v6bwPa+HUX/yvBA900fFvsKCzjVmhP6iZOWW0ctepG
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="395705108"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="395705108"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 22:16:59 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10620"; a="671122285"
X-IronPort-AV: E=Sophos;i="5.97,294,1669104000"; 
   d="scan'208";a="671122285"
Received: from lkp-server01.sh.intel.com (HELO 4455601a8d94) ([10.239.97.150])
  by fmsmga007.fm.intel.com with ESMTP; 13 Feb 2023 22:16:58 -0800
Received: from kbuild by 4455601a8d94 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pRocb-0008GJ-1B;
	Tue, 14 Feb 2023 06:16:57 +0000
Date: Tue, 14 Feb 2023 14:16:28 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-5.15 3/4]
 arch/arm64/kvm/hyp/nvhe/psci-relay.c:34:5: warning: no previous prototype
 for function '__pkvm_register_psci_notifier'
Message-ID: <202302141400.MTCToNgy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-5.15
head:   8e245b4c3a574fbb94b6b655f84e071febc147a6
commit: 7d67ca44dd4b17b36d9dd52e4613f608af3b16c8 [3/4] ANDROID: KVM: arm64: Notify pKVM modules of PSCI events
config: arm64-randconfig-r032-20230213 (https://download.01.org/0day-ci/archive/20230214/202302141400.MTCToNgy-lkp@intel.com/config)
compiler: clang version 17.0.0 (https://github.com/llvm/llvm-project db89896bbbd2251fff457699635acbbedeead27f)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm64 cross compiling tool for clang build
        # apt-get install binutils-aarch64-linux-gnu
        git remote add android-common https://android.googlesource.com/kernel/common
        git fetch --no-tags android-common android14-5.15
        git checkout 7d67ca44dd4b17b36d9dd52e4613f608af3b16c8
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=arm64 SHELL=/bin/bash arch/arm64/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302141400.MTCToNgy-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:34:5: warning: no previous prototype for function '__pkvm_register_psci_notifier' [-Wmissing-prototypes]
   int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct kvm_cpu_context *))
       ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:34:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct kvm_cpu_context *))
   ^
   static 
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:221:28: warning: no previous prototype for function 'kvm_host_psci_cpu_entry' [-Wmissing-prototypes]
   asmlinkage void __noreturn kvm_host_psci_cpu_entry(bool is_cpu_on)
                              ^
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:221:12: note: declare 'static' if the function is not intended to be used outside of this translation unit
   asmlinkage void __noreturn kvm_host_psci_cpu_entry(bool is_cpu_on)
              ^
              static 
   2 warnings generated.


vim +/__pkvm_register_psci_notifier +34 arch/arm64/kvm/hyp/nvhe/psci-relay.c

    33	
  > 34	int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct kvm_cpu_context *))
    35	{
    36		return cmpxchg(&pkvm_psci_notifier, NULL, cb) ? -EBUSY : 0;
    37	}
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
