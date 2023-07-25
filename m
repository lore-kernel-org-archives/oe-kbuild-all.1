Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE17925936
	for <oe-kbuild-all@lists.linux.dev>; Tue, 25 Jul 2023 21:10:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690319418; x=1721855418;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9FwZldX74uF393cHxe9LCA7jnXZZKiFJdpzZOoQQtOs=;
  b=mqTMhtCp+t1C2BLg6fLL1YtWVx70+nEZQa2p8EkhNTqzyg6V6Sr8q1Nu
   /7TdBhqEXe/V+76O2Hd79M/qXOF0pqudaO1/KKrQy7BGyTyM/Cb+qq485
   VffEx/BT2QJL5wDMBuToV2zZTXIKcnewY7QvRUXQUFS/BOo4XDMk3dW+f
   OU2hn0S9XpHy69+E5PuwIzzEG9InBAEnxs1oTfAe0nzhv28rRXlJqQEZ0
   yUugp00WomddJs0D2PopTQqXmihApedxmOeiSFhag27u6JlDzRD/ReZzx
   YXc0YswzvGqXmY0VSwyEXH7i9y++8Z6pXRtvNjpMts9kvQdWesom6z2pY
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="347455378"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="347455378"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jul 2023 14:10:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10782"; a="972836129"
X-IronPort-AV: E=Sophos;i="6.01,231,1684825200"; 
   d="scan'208";a="972836129"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by fmsmga006.fm.intel.com with ESMTP; 25 Jul 2023 14:10:17 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOPIO-0000Lb-27;
	Tue, 25 Jul 2023 21:10:16 +0000
Date: Wed, 26 Jul 2023 05:09:57 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 3/4]
 arch/arm64/kvm/hyp/nvhe/psci-relay.c:34:5: warning: no previous prototype
 for '__pkvm_register_psci_notifier'
Message-ID: <202307260515.ZnuHFKj0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   342aff08ae23fc8432a2e83887841ce0e83a623c
commit: 2829c605886e4e984533dfd6617822f585334f29 [3/4] ANDROID: KVM: arm64: Notify pKVM modules of PSCI events
config: arm64-randconfig-r013-20230725 (https://download.01.org/0day-ci/archive/20230726/202307260515.ZnuHFKj0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307260515.ZnuHFKj0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307260515.ZnuHFKj0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/arm64/kvm/hyp/nvhe/psci-relay.c:34:5: warning: no previous prototype for '__pkvm_register_psci_notifier' [-Wmissing-prototypes]
      34 | int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct kvm_cpu_context *))
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/arm64/kvm/hyp/nvhe/psci-relay.c:221:28: warning: no previous prototype for 'kvm_host_psci_cpu_entry' [-Wmissing-prototypes]
     221 | asmlinkage void __noreturn kvm_host_psci_cpu_entry(bool is_cpu_on)
         |                            ^~~~~~~~~~~~~~~~~~~~~~~


vim +/__pkvm_register_psci_notifier +34 arch/arm64/kvm/hyp/nvhe/psci-relay.c

    33	
  > 34	int __pkvm_register_psci_notifier(void (*cb)(enum pkvm_psci_notification, struct kvm_cpu_context *))
    35	{
    36		return cmpxchg(&pkvm_psci_notifier, NULL, cb) ? -EBUSY : 0;
    37	}
    38	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
