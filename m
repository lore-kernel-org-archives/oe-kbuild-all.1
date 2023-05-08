Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0AF7168CD
	for <oe-kbuild-all@lists.linux.dev>; Mon,  8 May 2023 11:22:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1683544926; x=1715080926;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=GfXUPFk5DCDsmV5TV/6jFscKCjgUNylh8YPIAhl+Ip4=;
  b=djzibZKi7CfWhkxQEsoPtVkUARqn+mGOCi+Kns3h/TSS4ijMs6x/JojU
   uqYvWGPxvmJwU5Obxkyz6bOuCUDq1mKbg9UyibFhfGfN7IwmYQsUSlbj9
   VZfamoCuMTAsWBUjlPYjy5G2X60vNiI7suagjFSFsQPiayN8zaGNyEJQ3
   X5Tm5Di0KgetuiuYqcVn0gpMoDplhCApwYker96Hf76FK8n7wdMPBKM5m
   H2cVt2lUxVGCoEtuyeB7evuLlZKBdAUsw3hRJmWGep/aBGpwOnh+0QBkV
   +Aoiuz4mSYf30zFYsZJ98WEqRl26TxR962qWUcX1R5vdG3AZDXq+xhVJH
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="415178292"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="415178292"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 May 2023 04:21:44 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10703"; a="648834909"
X-IronPort-AV: E=Sophos;i="5.99,258,1677571200"; 
   d="scan'208";a="648834909"
Received: from lkp-server01.sh.intel.com (HELO dea6d5a4f140) ([10.239.97.150])
  by orsmga003.jf.intel.com with ESMTP; 08 May 2023 04:21:31 -0700
Received: from kbuild by dea6d5a4f140 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pvyvq-0001D3-2s;
	Mon, 08 May 2023 11:21:30 +0000
Date: Mon, 8 May 2023 19:21:09 +0800
From: kernel test robot <lkp@intel.com>
To: Jordan Niethe <jpn@linux.vnet.ibm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH v1 5/5] KVM: PPC: Add support for nested PAPR guests
Message-ID: <202305081806.CVv1rk9X-lkp@intel.com>
References: <20230508072332.2937883-6-jpn@linux.vnet.ibm.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230508072332.2937883-6-jpn@linux.vnet.ibm.com>

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
patch link:    https://lore.kernel.org/r/20230508072332.2937883-6-jpn%40linux.vnet.ibm.com
patch subject: [RFC PATCH v1 5/5] KVM: PPC: Add support for nested PAPR guests
config: powerpc-allyesconfig (https://download.01.org/0day-ci/archive/20230508/202305081806.CVv1rk9X-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/61dc8a829a1c96569deaa958b92fac9ae5dc8178
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jordan-Niethe/KVM-PPC-Use-getters-and-setters-for-vcpu-register-state/20230508-152631
        git checkout 61dc8a829a1c96569deaa958b92fac9ae5dc8178
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=powerpc prepare

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202305081806.CVv1rk9X-lkp@intel.com/

All errors (new ones prefixed by >>):

   scripts/genksyms/parse.y: warning: 9 shift/reduce conflicts [-Wconflicts-sr]
   scripts/genksyms/parse.y: warning: 5 reduce/reduce conflicts [-Wconflicts-rr]
   scripts/genksyms/parse.y: note: rerun with option '-Wcounterexamples' to generate conflict counterexamples
   In file included from include/linux/byteorder/big_endian.h:5,
                    from arch/powerpc/include/uapi/asm/byteorder.h:14,
                    from include/asm-generic/bitops/le.h:6,
                    from arch/powerpc/include/asm/bitops.h:336,
                    from include/linux/bitops.h:68,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from ./arch/powerpc/include/generated/asm/div64.h:1,
                    from include/linux/math.h:6,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/compat.h:10,
                    from arch/powerpc/kernel/asm-offsets.c:12:
   arch/powerpc/include/asm/guest-state-buffer.h: In function 'gse_put_vector128':
>> arch/powerpc/include/asm/guest-state-buffer.h:725:35: error: 'TS_VSRLOWOFFSET' undeclared (first use in this function); did you mean 'TS_FPROFFSET'?
     725 |         tmp[1] = cpu_to_be64(u.dw[TS_VSRLOWOFFSET]);
         |                                   ^~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:38:51: note: in definition of macro '__cpu_to_be64'
      38 | #define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
         |                                                   ^
   arch/powerpc/include/asm/guest-state-buffer.h:725:18: note: in expansion of macro 'cpu_to_be64'
     725 |         tmp[1] = cpu_to_be64(u.dw[TS_VSRLOWOFFSET]);
         |                  ^~~~~~~~~~~
   arch/powerpc/include/asm/guest-state-buffer.h:725:35: note: each undeclared identifier is reported only once for each function it appears in
     725 |         tmp[1] = cpu_to_be64(u.dw[TS_VSRLOWOFFSET]);
         |                                   ^~~~~~~~~~~~~~~
   include/uapi/linux/byteorder/big_endian.h:38:51: note: in definition of macro '__cpu_to_be64'
      38 | #define __cpu_to_be64(x) ((__force __be64)(__u64)(x))
         |                                                   ^
   arch/powerpc/include/asm/guest-state-buffer.h:725:18: note: in expansion of macro 'cpu_to_be64'
     725 |         tmp[1] = cpu_to_be64(u.dw[TS_VSRLOWOFFSET]);
         |                  ^~~~~~~~~~~
   In file included from arch/powerpc/include/asm/kvm_host.h:28,
                    from include/linux/kvm_host.h:45,
                    from arch/powerpc/include/asm/kvm_ppc.h:19,
                    from arch/powerpc/include/asm/dbell.h:17,
                    from arch/powerpc/kernel/asm-offsets.c:36:
   arch/powerpc/include/asm/guest-state-buffer.h: In function 'gse_get_vector128':
   arch/powerpc/include/asm/guest-state-buffer.h:851:14: error: 'TS_VSRLOWOFFSET' undeclared (first use in this function); did you mean 'TS_FPROFFSET'?
     851 |         u.dw[TS_VSRLOWOFFSET] = be64_to_cpu(src[1]);
         |              ^~~~~~~~~~~~~~~
         |              TS_FPROFFSET
   In file included from arch/powerpc/include/asm/kvm_host.h:26:
   arch/powerpc/include/asm/guest-state-buffer.h: In function 'gsb_recv':
   arch/powerpc/include/asm/hvcall.h:492:36: warning: left shift count >= width of type [-Wshift-count-overflow]
     492 | #define H_GUEST_FLAGS_WIDE     (1UL<<(63-0))
         |                                    ^~
   arch/powerpc/include/asm/guest-state-buffer.h:1018:27: note: in expansion of macro 'H_GUEST_FLAGS_WIDE'
    1018 |                 hflags |= H_GUEST_FLAGS_WIDE;
         |                           ^~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/guest-state-buffer.h:1020:14: error: implicit declaration of function 'plpar_guest_get_state' [-Werror=implicit-function-declaration]
    1020 |         rc = plpar_guest_get_state(hflags, gsb->guest_id, gsb->vcpu_id,
         |              ^~~~~~~~~~~~~~~~~~~~~
   arch/powerpc/include/asm/guest-state-buffer.h: In function 'gsb_send':
   arch/powerpc/include/asm/hvcall.h:492:36: warning: left shift count >= width of type [-Wshift-count-overflow]
     492 | #define H_GUEST_FLAGS_WIDE     (1UL<<(63-0))
         |                                    ^~
   arch/powerpc/include/asm/guest-state-buffer.h:1088:27: note: in expansion of macro 'H_GUEST_FLAGS_WIDE'
    1088 |                 hflags |= H_GUEST_FLAGS_WIDE;
         |                           ^~~~~~~~~~~~~~~~~~
>> arch/powerpc/include/asm/guest-state-buffer.h:1090:14: error: implicit declaration of function 'plpar_guest_set_state' [-Werror=implicit-function-declaration]
    1090 |         rc = plpar_guest_set_state(hflags, gsb->guest_id, gsb->vcpu_id,
         |              ^~~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
   make[2]: *** [scripts/Makefile.build:114: arch/powerpc/kernel/asm-offsets.s] Error 1
   make[2]: Target 'prepare' not remade because of errors.
   make[1]: *** [Makefile:1287: prepare0] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:226: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.


vim +725 arch/powerpc/include/asm/guest-state-buffer.h

e769880eca81b3 Jordan Niethe 2023-05-08  707  
e769880eca81b3 Jordan Niethe 2023-05-08  708  /**
e769880eca81b3 Jordan Niethe 2023-05-08  709   * gse_put_vector128() - add a vector guest state element to a buffer
e769880eca81b3 Jordan Niethe 2023-05-08  710   * @gsb: guest state buffer to add element to
e769880eca81b3 Jordan Niethe 2023-05-08  711   * @iden: guest state ID
e769880eca81b3 Jordan Niethe 2023-05-08  712   * @val: 16 byte vector value
e769880eca81b3 Jordan Niethe 2023-05-08  713   */
e769880eca81b3 Jordan Niethe 2023-05-08  714  static inline int gse_put_vector128(struct gs_buff *gsb, u16 iden,
e769880eca81b3 Jordan Niethe 2023-05-08  715  				    vector128 val)
e769880eca81b3 Jordan Niethe 2023-05-08  716  {
e769880eca81b3 Jordan Niethe 2023-05-08  717  	__be64 tmp[2];
e769880eca81b3 Jordan Niethe 2023-05-08  718  	union {
e769880eca81b3 Jordan Niethe 2023-05-08  719  		__vector128 v;
e769880eca81b3 Jordan Niethe 2023-05-08  720  		u64 dw[2];
e769880eca81b3 Jordan Niethe 2023-05-08  721  	} u;
e769880eca81b3 Jordan Niethe 2023-05-08  722  
e769880eca81b3 Jordan Niethe 2023-05-08  723  	u.v = val;
e769880eca81b3 Jordan Niethe 2023-05-08  724  	tmp[0] = cpu_to_be64(u.dw[TS_FPROFFSET]);
e769880eca81b3 Jordan Niethe 2023-05-08 @725  	tmp[1] = cpu_to_be64(u.dw[TS_VSRLOWOFFSET]);
e769880eca81b3 Jordan Niethe 2023-05-08  726  	return __gse_put(gsb, iden, sizeof(tmp), &tmp);
e769880eca81b3 Jordan Niethe 2023-05-08  727  }
e769880eca81b3 Jordan Niethe 2023-05-08  728  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
