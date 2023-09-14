Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29EB463B
	for <oe-kbuild-all@lists.linux.dev>; Thu, 14 Sep 2023 05:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694670126; x=1726206126;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=lfsVOYKBGl+zhq8pTidkfBBNWqUGafXrtYk5WWbBKss=;
  b=he2NCCQqvHL+WTxNO8G9G/DwIdSUjUpypnqCB9OFyJeH99FHmlybMRWI
   8fhVTRua839FK6GQbUcxpThtVE2SAJCOjm6v9eSdWDhqvztEdzHKiTKjB
   lHK0EMy4q9BmgtfRo9X9sHB4jw7QFZjQlk5F+24jv0/2ZYQli7RYk9n7D
   Z9le9FQwwbtWFGhUpxS8y2DflLemOhMAwa6vKDZS/vzdUtXZBiIQgJKVg
   hkSUNBfkl5vyYpcZ6Gk+rOGl1OoLUL7C6REAhVdpJNnDkRTIEngDCVDoo
   M0ZZOS1yTgvX6FQLpi9FzZxzzWP7eGyzGuD3SVhoSpp4xDka9B5kWxAvA
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="442889910"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="442889910"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 22:42:04 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="721085534"
X-IronPort-AV: E=Sophos;i="6.02,145,1688454000"; 
   d="scan'208";a="721085534"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 13 Sep 2023 22:42:03 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgf71-0001Cr-1V;
	Thu, 14 Sep 2023 05:42:00 +0000
Date: Thu, 14 Sep 2023 13:41:38 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:x86/guarded_kvm_headers 13/24]
 arch/arm64/include/asm/kvm_arch_timer.h:109:58: warning: 'struct
 kvm_device_attr' declared inside parameter list will not be visible outside
 of this definition or declaration
Message-ID: <202309141335.eh0pnssZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://github.com/sean-jc/linux x86/guarded_kvm_headers
head:   9c11b02f61e145112d46a646b193604329601d9f
commit: a83ef3f8917185f2aa1a7daa42ccfa0087904d48 [13/24] KVM: arm64: Move ARM specific headers in include/kvm to arch directory
config: arm64-allnoconfig (https://download.01.org/0day-ci/archive/20230914/202309141335.eh0pnssZ-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309141335.eh0pnssZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309141335.eh0pnssZ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/arm64/include/asm/kvm_host.h:29,
                    from arch/arm64/kernel/cpufeature.c:85:
>> arch/arm64/include/asm/kvm_arch_timer.h:109:58: warning: 'struct kvm_device_attr' declared inside parameter list will not be visible outside of this definition or declaration
     109 | int kvm_arm_timer_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
         |                                                          ^~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_arch_timer.h:110:58: warning: 'struct kvm_device_attr' declared inside parameter list will not be visible outside of this definition or declaration
     110 | int kvm_arm_timer_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
         |                                                          ^~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_arch_timer.h:111:58: warning: 'struct kvm_device_attr' declared inside parameter list will not be visible outside of this definition or declaration
     111 | int kvm_arm_timer_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
         |                                                          ^~~~~~~~~~~~~~~
   In file included from arch/arm64/include/asm/kvm_host.h:31:
>> arch/arm64/include/asm/kvm_pmu.h:143:50: warning: 'struct kvm_device_attr' declared inside parameter list will not be visible outside of this definition or declaration
     143 |                                           struct kvm_device_attr *attr)
         |                                                  ^~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_pmu.h:148:50: warning: 'struct kvm_device_attr' declared inside parameter list will not be visible outside of this definition or declaration
     148 |                                           struct kvm_device_attr *attr)
         |                                                  ^~~~~~~~~~~~~~~
   arch/arm64/include/asm/kvm_pmu.h:153:50: warning: 'struct kvm_device_attr' declared inside parameter list will not be visible outside of this definition or declaration
     153 |                                           struct kvm_device_attr *attr)
         |                                                  ^~~~~~~~~~~~~~~


vim +109 arch/arm64/include/asm/kvm_arch_timer.h

1df08ba0aa95f1 include/kvm/arm_arch_timer.h Alex Bennée      2014-07-04  108  
99a1db7a2c9b2e include/kvm/arm_arch_timer.h Christoffer Dall 2017-05-02 @109  int kvm_arm_timer_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
99a1db7a2c9b2e include/kvm/arm_arch_timer.h Christoffer Dall 2017-05-02  110  int kvm_arm_timer_get_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
99a1db7a2c9b2e include/kvm/arm_arch_timer.h Christoffer Dall 2017-05-02  111  int kvm_arm_timer_has_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr);
99a1db7a2c9b2e include/kvm/arm_arch_timer.h Christoffer Dall 2017-05-02  112  

:::::: The code at line 109 was first introduced by commit
:::::: 99a1db7a2c9b2ecb9a801cee3f6a7a71945a2fca KVM: arm/arm64: Allow setting the timer IRQ numbers from userspace

:::::: TO: Christoffer Dall <cdall@linaro.org>
:::::: CC: Christoffer Dall <cdall@linaro.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
