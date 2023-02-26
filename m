Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 870987B
	for <oe-kbuild-all@lists.linux.dev>; Sun, 26 Feb 2023 00:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1677370308; x=1708906308;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=0pf7h9K/oq95f1Lj9PZYFKkSN+aqKe+HmUVb+wShJnw=;
  b=AhkA9jgm4Rwjdu5BDwohGcpclKIzK4BmdFj7uMsaGKbOK+oohOv1j0LP
   Lxdxz8O39BsmwKq8iYbDM6Twx8gCesQ8EooYCuzxP6DRE52L0LY+CkAud
   ci90AKz9Szl7IG1gZOuzJIJmujWlWnYzYuIRqs7K33cFi4gzEFnsX1Vkj
   erPRdqXIOyFoDisWgYU7OFcoiOJPeHDrLyuO8Nz7XeU0DcZTPvJijhElL
   UNWrBqn3CWW96z2AzEmSQ6U3gw+kv1b2tsJt7XVzhKDnpPJWwp215Pxw/
   w06oX1MjxKXE4dxMZKdTe7sXRclSdEA3Cfn8Y+qB+P902MrPVkyMrbEPe
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="396221263"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="396221263"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Feb 2023 16:11:46 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10632"; a="623135996"
X-IronPort-AV: E=Sophos;i="5.97,328,1669104000"; 
   d="scan'208";a="623135996"
Received: from lkp-server01.sh.intel.com (HELO 3895f5c55ead) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 25 Feb 2023 16:11:45 -0800
Received: from kbuild by 3895f5c55ead with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pW4dk-0003Sd-1F;
	Sun, 26 Feb 2023 00:11:44 +0000
Date: Sun, 26 Feb 2023 08:11:18 +0800
From: kernel test robot <lkp@intel.com>
To: Shivam Kumar <shivam.kumar1@nutanix.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v8 1/3] KVM: Implement dirty quota-based throttling of
 vcpus
Message-ID: <202302260853.KRSFLysa-lkp@intel.com>
References: <20230225204758.17726-2-shivam.kumar1@nutanix.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230225204758.17726-2-shivam.kumar1@nutanix.com>

Hi Shivam,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on kvm/queue]
[also build test ERROR on linus/master next-20230225]
[cannot apply to kvmarm/next mst-vhost/linux-next kvm/linux-next v6.2]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Shivam-Kumar/KVM-Implement-dirty-quota-based-throttling-of-vcpus/20230226-045019
base:   https://git.kernel.org/pub/scm/virt/kvm/kvm.git queue
patch link:    https://lore.kernel.org/r/20230225204758.17726-2-shivam.kumar1%40nutanix.com
patch subject: [PATCH v8 1/3] KVM: Implement dirty quota-based throttling of vcpus
config: riscv-rv32_defconfig (https://download.01.org/0day-ci/archive/20230226/202302260853.KRSFLysa-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/bdbf0891df39e87ef29d704ad4b9866ec34ea20c
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Shivam-Kumar/KVM-Implement-dirty-quota-based-throttling-of-vcpus/20230226-045019
        git checkout bdbf0891df39e87ef29d704ad4b9866ec34ea20c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=riscv SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202302260853.KRSFLysa-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c: In function 'update_dirty_quota':
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3317:58: error: 'struct kvm' has no member named 'dirty_quota_enabled'
    3317 |         if (!vcpu || (vcpu->kvm != kvm) || !READ_ONCE(kvm->dirty_quota_enabled))
         |                                                          ^~
   include/linux/compiler_types.h:338:23: note: in definition of macro '__compiletime_assert'
     338 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:358:9: note: in expansion of macro '_compiletime_assert'
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3317:45: note: in expansion of macro 'READ_ONCE'
    3317 |         if (!vcpu || (vcpu->kvm != kvm) || !READ_ONCE(kvm->dirty_quota_enabled))
         |                                             ^~~~~~~~~
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3317:58: error: 'struct kvm' has no member named 'dirty_quota_enabled'
    3317 |         if (!vcpu || (vcpu->kvm != kvm) || !READ_ONCE(kvm->dirty_quota_enabled))
         |                                                          ^~
   include/linux/compiler_types.h:338:23: note: in definition of macro '__compiletime_assert'
     338 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:358:9: note: in expansion of macro '_compiletime_assert'
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3317:45: note: in expansion of macro 'READ_ONCE'
    3317 |         if (!vcpu || (vcpu->kvm != kvm) || !READ_ONCE(kvm->dirty_quota_enabled))
         |                                             ^~~~~~~~~
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3317:58: error: 'struct kvm' has no member named 'dirty_quota_enabled'
    3317 |         if (!vcpu || (vcpu->kvm != kvm) || !READ_ONCE(kvm->dirty_quota_enabled))
         |                                                          ^~
   include/linux/compiler_types.h:338:23: note: in definition of macro '__compiletime_assert'
     338 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:358:9: note: in expansion of macro '_compiletime_assert'
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3317:45: note: in expansion of macro 'READ_ONCE'
    3317 |         if (!vcpu || (vcpu->kvm != kvm) || !READ_ONCE(kvm->dirty_quota_enabled))
         |                                             ^~~~~~~~~
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3317:58: error: 'struct kvm' has no member named 'dirty_quota_enabled'
    3317 |         if (!vcpu || (vcpu->kvm != kvm) || !READ_ONCE(kvm->dirty_quota_enabled))
         |                                                          ^~
   include/linux/compiler_types.h:338:23: note: in definition of macro '__compiletime_assert'
     338 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:358:9: note: in expansion of macro '_compiletime_assert'
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:28: note: in expansion of macro '__native_word'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |                            ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3317:45: note: in expansion of macro 'READ_ONCE'
    3317 |         if (!vcpu || (vcpu->kvm != kvm) || !READ_ONCE(kvm->dirty_quota_enabled))
         |                                             ^~~~~~~~~
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3317:58: error: 'struct kvm' has no member named 'dirty_quota_enabled'
    3317 |         if (!vcpu || (vcpu->kvm != kvm) || !READ_ONCE(kvm->dirty_quota_enabled))
         |                                                          ^~
   include/linux/compiler_types.h:338:23: note: in definition of macro '__compiletime_assert'
     338 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:358:9: note: in expansion of macro '_compiletime_assert'
     358 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:9: note: in expansion of macro 'compiletime_assert'
      36 |         compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),  \
         |         ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:9: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |         compiletime_assert_rwonce_type(x);                              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3317:45: note: in expansion of macro 'READ_ONCE'
    3317 |         if (!vcpu || (vcpu->kvm != kvm) || !READ_ONCE(kvm->dirty_quota_enabled))
         |                                             ^~~~~~~~~
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3317:58: error: 'struct kvm' has no member named 'dirty_quota_enabled'
    3317 |         if (!vcpu || (vcpu->kvm != kvm) || !READ_ONCE(kvm->dirty_quota_enabled))
         |                                                          ^~
   include/linux/compiler_types.h:314:27: note: in definition of macro '__unqual_scalar_typeof'
     314 |                 _Generic((x),                                           \
         |                           ^
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3317:45: note: in expansion of macro 'READ_ONCE'
    3317 |         if (!vcpu || (vcpu->kvm != kvm) || !READ_ONCE(kvm->dirty_quota_enabled))
         |                                             ^~~~~~~~~
   In file included from ./arch/riscv/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:247,
                    from include/linux/build_bug.h:5,
                    from include/linux/bits.h:22,
                    from include/linux/kvm_types.h:21,
                    from include/kvm/iodev.h:6,
                    from arch/riscv/kvm/../../../virt/kvm/kvm_main.c:16:
>> arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3317:58: error: 'struct kvm' has no member named 'dirty_quota_enabled'
    3317 |         if (!vcpu || (vcpu->kvm != kvm) || !READ_ONCE(kvm->dirty_quota_enabled))
         |                                                          ^~
   include/asm-generic/rwonce.h:44:73: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                         ^
   arch/riscv/kvm/../../../virt/kvm/kvm_main.c:3317:45: note: in expansion of macro 'READ_ONCE'
    3317 |         if (!vcpu || (vcpu->kvm != kvm) || !READ_ONCE(kvm->dirty_quota_enabled))
         |                                             ^~~~~~~~~


vim +3317 arch/riscv/kvm/../../../virt/kvm/kvm_main.c

  3312	
  3313	void update_dirty_quota(struct kvm *kvm, unsigned long page_size_bytes)
  3314	{
  3315		struct kvm_vcpu *vcpu = kvm_get_running_vcpu();
  3316	
> 3317		if (!vcpu || (vcpu->kvm != kvm) || !READ_ONCE(kvm->dirty_quota_enabled))
  3318			return;
  3319	
  3320		vcpu->run->dirty_quota_bytes -= page_size_bytes;
  3321		if (vcpu->run->dirty_quota_bytes <= 0)
  3322			kvm_make_request(KVM_REQ_DIRTY_QUOTA_EXIT, vcpu);
  3323	}
  3324	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
