Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 882CB1549F
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 May 2023 09:59:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683539990; x=1715075990;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2cg1STduZ4cu6EkunJcPMLKtekr/M0hAMTi+gGO7+xs=;
  b=GdSC+T2xgxcZrT0AAcfGbEPKAPfRzowyyT++LQxWlYFz/rxz+G7jw7Zo
   NAXiJYfNHGk/BvEp+NdG8v3E9T47h0cQWVHY6OQZGSoLRtEtDxMbBfkAa
   jAofav31e78J/rXexMRaGP7idJE7tE6VINRmsFLmzul2ZGmso+RhGzAwF
   1dgUdNfVDKAdzJroG28abai8styS1K3oO4/CFBgngKS4asNUqyA2nU0hQ
   rOundRcNCaa/iyojEXU/ohyURnKTr8c5t5OKiFIy9nenm6fjRqhb5kf2p
   iSwyAT58hwWiu/QzrIdeUR5ZHA1L2VIw9XbUkQqkd3oMuscb8EVb8XoIK
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="352661570"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="352661570"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 02:59:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="872739428"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="872739428"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 May 2023 02:59:28 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvxeT-0001BF-2W;
	Mon, 08 May 2023 09:59:29 +0000
Date: Mon, 8 May 2023 17:58:41 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jpn@linux.vnet.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 3/5] KVM: PPC: Add vr getters and setters
Message-ID: <202305081713.dSqlmUru-lkp@intel.com>
References: <20230508072332.2937883-4-jpn@linux.vnet.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508072332.2937883-4-jpn@linux.vnet.ibm.com>

Hi Jordan,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on powerpc/fixes]
[cannot apply to powerpc/topic/ppc-kvm powerpc/next linus/master v6.4-rc1 next-20230508]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jordan-Niethe/KVM-PPC-Use-getters-and-setters-for-vcpu-register-state/20230508-152631
base:   https://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git fixes
patch link:    https://lore.kernel.org/r/20230508072332.2937883-4-jpn%40linux.vnet.ibm.com
patch subject: [RFC PATCH v1 3/5] KVM: PPC: Add vr getters and setters
config: powerpc-allnoconfig (https://download.01.org/0day-ci/archive/20230508/202305081713.dSqlmUru-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/dcfb26d2bc528436a6510e451ccba1156276f67b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jordan-Niethe/KVM-PPC-Use-getters-and-setters-for-vcpu-register-state/20230508-152631
        git checkout dcfb26d2bc528436a6510e451ccba1156276f67b
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305081713.dSqlmUru-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from arch/powerpc/include/asm/kvm_ppc.h:22,
                    from arch/powerpc/include/asm/dbell.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:36:
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_get_vsx_vr':
>> arch/powerpc/include/asm/kvm_book3s.h:449:27: error: 'struct kvm_vcpu_arch' has no member named 'vr'; did you mean 'pvr'?
     449 |         return vcpu->arch.vr.vr[i];
         |                           ^~
         |                           pvr
   arch/powerpc/include/asm/kvm_book3s.h:447:70: warning: parameter 'i' set but not used [-Wunused-but-set-parameter]
     447 | static inline vector128 kvmppc_get_vsx_vr(struct kvm_vcpu *vcpu, int i)
         |                                                                  ~~~~^
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_set_vsx_vr':
   arch/powerpc/include/asm/kvm_book3s.h:454:20: error: 'struct kvm_vcpu_arch' has no member named 'vr'; did you mean 'pvr'?
     454 |         vcpu->arch.vr.vr[i] = val;
         |                    ^~
         |                    pvr
   arch/powerpc/include/asm/kvm_book3s.h:452:65: warning: parameter 'i' set but not used [-Wunused-but-set-parameter]
     452 | static inline void kvmppc_set_vsx_vr(struct kvm_vcpu *vcpu, int i, vector128 val)
         |                                                             ~~~~^
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_get_vscr':
   arch/powerpc/include/asm/kvm_book3s.h:459:27: error: 'struct kvm_vcpu_arch' has no member named 'vr'; did you mean 'pvr'?
     459 |         return vcpu->arch.vr.vscr.u[3];
         |                           ^~
         |                           pvr
   arch/powerpc/include/asm/kvm_book3s.h: In function 'kvmppc_set_vscr':
   arch/powerpc/include/asm/kvm_book3s.h:464:20: error: 'struct kvm_vcpu_arch' has no member named 'vr'; did you mean 'pvr'?
     464 |         vcpu->arch.vr.vscr.u[3] = val;
         |                    ^~
         |                    pvr
   make[2]: *** [scripts/Makefile.build:114: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1287: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +449 arch/powerpc/include/asm/kvm_book3s.h

   446	
   447	static inline vector128 kvmppc_get_vsx_vr(struct kvm_vcpu *vcpu, int i)
   448	{
 > 449		return vcpu->arch.vr.vr[i];
   450	}
   451	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
