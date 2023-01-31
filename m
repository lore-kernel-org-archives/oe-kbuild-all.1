Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 78E7A640
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Jan 2023 04:56:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1675141012; x=1706677012;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=1oNNNBpQnO2b8A+PBJ+8rtaoHI20ZCEyB0rxszxPQYg=;
  b=oBWwj0m0XKVYLQ4X448XAHk/MzJM9O4OZp68AFQ+in4efiLQcUCW1RrY
   Q/8Q5P84fsXqwele3cN/qAdsX2Pqs+w9bPEkSqA52BRzvY7UaQsH4HdKk
   ybQw7blauDOMmm74BXwreJvRhj5UJCsi0kUrTHFe3TrxHojrx0AT/pwi8
   OxE66Rpw7bgJkkZzz1oc4v4e/Mmps8eYOC0swK7t71eFXEDDO0BQqtHdt
   JjTMf+gkiorfMD7q9BWKCO31HhgyWgebf17PvyHu6V8mBj9Vx9zWMRHY+
   OFVqfPj11GVFAZ1MFM4GLgowf9gl5h3ck/frH/a6bUYTRfJarSKLXKWav
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="390113222"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="390113222"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Jan 2023 20:56:37 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10606"; a="664348855"
X-IronPort-AV: E=Sophos;i="5.97,259,1669104000"; 
   d="scan'208";a="664348855"
Received: from lkp-server01.sh.intel.com (HELO ffa7f14d1d0f) ([10.239.97.150])
  by orsmga002.jf.intel.com with ESMTP; 30 Jan 2023 20:56:36 -0800
Received: from kbuild by ffa7f14d1d0f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pMih9-0004Ba-1O;
	Tue, 31 Jan 2023 04:56:35 +0000
Date: Tue, 31 Jan 2023 12:56:31 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sean-jc:svm/vnmi 13/17] include/linux/static_call_types.h:9:41:
 error: '__SCK__kvm_x86_get_hw_nmi_pending' undeclared; did you mean
 '__SCK__kvm_x86_set_vnmi_pending'?
Message-ID: <202301311213.AcPMcA5G-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/sean-jc/linux svm/vnmi
head:   1b255840b4258e213bb8c5b01375f6813152b12e
commit: 7978acc2594a453a13c42d5c1f69d8a4c24e3f28 [13/17] fixup
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20230131/202301311213.AcPMcA5G-lkp@intel.com/config)
compiler: gcc-11 (Debian 11.3.0-8) 11.3.0
reproduce (this is a W=1 build):
        # https://github.com/sean-jc/linux/commit/7978acc2594a453a13c42d5c1f69d8a4c24e3f28
        git remote add sean-jc https://github.com/sean-jc/linux
        git fetch --no-tags sean-jc svm/vnmi
        git checkout 7978acc2594a453a13c42d5c1f69d8a4c24e3f28
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=1 O=build_dir ARCH=x86_64 olddefconfig
        make W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/x86/kvm/x86.c:20:
   arch/x86/kvm/x86.c: In function 'process_nmi':
>> include/linux/static_call_types.h:9:41: error: '__SCK__kvm_x86_get_hw_nmi_pending' undeclared (first use in this function); did you mean '__SCK__kvm_x86_set_vnmi_pending'?
       9 | #define STATIC_CALL_KEY_PREFIX          __SCK__
         |                                         ^~~~~~~
   include/linux/compiler.h:216:69: note: in definition of macro '___ADDRESSABLE'
     216 |                 __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
         |                                                                     ^~~
   include/linux/static_call_types.h:53:9: note: in expansion of macro '__ADDRESSABLE'
      53 |         __ADDRESSABLE(STATIC_CALL_KEY(name))
         |         ^~~~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/static_call_types.h:12:41: note: in expansion of macro '__PASTE'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:12:49: note: in expansion of macro 'STATIC_CALL_KEY_PREFIX'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:53:23: note: in expansion of macro 'STATIC_CALL_KEY'
      53 |         __ADDRESSABLE(STATIC_CALL_KEY(name))
         |                       ^~~~~~~~~~~~~~~
   include/linux/static_call_types.h:57:9: note: in expansion of macro '__STATIC_CALL_ADDRESSABLE'
      57 |         __STATIC_CALL_ADDRESSABLE(name);                                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:33: note: in expansion of macro '__static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/kvm/x86.c:10156:13: note: in expansion of macro 'static_call'
   10156 |         if (static_call(kvm_x86_get_hw_nmi_pending)(vcpu))
         |             ^~~~~~~~~~~
   include/linux/static_call_types.h:9:41: note: each undeclared identifier is reported only once for each function it appears in
       9 | #define STATIC_CALL_KEY_PREFIX          __SCK__
         |                                         ^~~~~~~
   include/linux/compiler.h:216:69: note: in definition of macro '___ADDRESSABLE'
     216 |                 __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
         |                                                                     ^~~
   include/linux/static_call_types.h:53:9: note: in expansion of macro '__ADDRESSABLE'
      53 |         __ADDRESSABLE(STATIC_CALL_KEY(name))
         |         ^~~~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/static_call_types.h:12:41: note: in expansion of macro '__PASTE'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:12:49: note: in expansion of macro 'STATIC_CALL_KEY_PREFIX'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:53:23: note: in expansion of macro 'STATIC_CALL_KEY'
      53 |         __ADDRESSABLE(STATIC_CALL_KEY(name))
         |                       ^~~~~~~~~~~~~~~
   include/linux/static_call_types.h:57:9: note: in expansion of macro '__STATIC_CALL_ADDRESSABLE'
      57 |         __STATIC_CALL_ADDRESSABLE(name);                                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:33: note: in expansion of macro '__static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/kvm/x86.c:10156:13: note: in expansion of macro 'static_call'
   10156 |         if (static_call(kvm_x86_get_hw_nmi_pending)(vcpu))
         |             ^~~~~~~~~~~
   In file included from <command-line>:
>> include/linux/static_call_types.h:15:41: error: '__SCT__kvm_x86_get_hw_nmi_pending' undeclared (first use in this function); did you mean '__SCT__kvm_x86_set_vnmi_pending'?
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
      74 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:43:35: note: in expansion of macro 'STATIC_CALL_TRAMP'
      43 | #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
         |                                   ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:58:9: note: in expansion of macro '__raw_static_call'
      58 |         __raw_static_call(name);                                        \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:33: note: in expansion of macro '__static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/kvm/x86.c:10156:13: note: in expansion of macro 'static_call'
   10156 |         if (static_call(kvm_x86_get_hw_nmi_pending)(vcpu))
         |             ^~~~~~~~~~~
   In file included from include/asm-generic/bug.h:5,
                    from arch/x86/include/asm/bug.h:87,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/percpu.h:5,
                    from include/linux/context_tracking_state.h:5,
                    from include/linux/hardirq.h:5,
                    from include/linux/kvm_host.h:7,
                    from arch/x86/kvm/x86.c:20:
   arch/x86/kvm/x86.c: In function 'kvm_get_total_nmi_pending':
>> include/linux/static_call_types.h:9:41: error: '__SCK__kvm_x86_get_hw_nmi_pending' undeclared (first use in this function); did you mean '__SCK__kvm_x86_set_vnmi_pending'?
       9 | #define STATIC_CALL_KEY_PREFIX          __SCK__
         |                                         ^~~~~~~
   include/linux/compiler.h:216:69: note: in definition of macro '___ADDRESSABLE'
     216 |                 __UNIQUE_ID(__PASTE(__addressable_,sym)) = (void *)&sym;
         |                                                                     ^~~
   include/linux/static_call_types.h:53:9: note: in expansion of macro '__ADDRESSABLE'
      53 |         __ADDRESSABLE(STATIC_CALL_KEY(name))
         |         ^~~~~~~~~~~~~
   include/linux/compiler_types.h:75:22: note: in expansion of macro '___PASTE'
      75 | #define __PASTE(a,b) ___PASTE(a,b)
         |                      ^~~~~~~~
   include/linux/static_call_types.h:12:41: note: in expansion of macro '__PASTE'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:12:49: note: in expansion of macro 'STATIC_CALL_KEY_PREFIX'
      12 | #define STATIC_CALL_KEY(name)           __PASTE(STATIC_CALL_KEY_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:53:23: note: in expansion of macro 'STATIC_CALL_KEY'
      53 |         __ADDRESSABLE(STATIC_CALL_KEY(name))
         |                       ^~~~~~~~~~~~~~~
   include/linux/static_call_types.h:57:9: note: in expansion of macro '__STATIC_CALL_ADDRESSABLE'
      57 |         __STATIC_CALL_ADDRESSABLE(name);                                \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:33: note: in expansion of macro '__static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/kvm/x86.c:10176:41: note: in expansion of macro 'static_call'
   10176 |         return vcpu->arch.nmi_pending + static_call(kvm_x86_get_hw_nmi_pending)(vcpu);
         |                                         ^~~~~~~~~~~
   In file included from <command-line>:
>> include/linux/static_call_types.h:15:41: error: '__SCT__kvm_x86_get_hw_nmi_pending' undeclared (first use in this function); did you mean '__SCT__kvm_x86_set_vnmi_pending'?
      15 | #define STATIC_CALL_TRAMP_PREFIX        __SCT__
         |                                         ^~~~~~~
   include/linux/compiler_types.h:74:23: note: in definition of macro '___PASTE'
      74 | #define ___PASTE(a,b) a##b
         |                       ^
   include/linux/static_call_types.h:18:41: note: in expansion of macro '__PASTE'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                         ^~~~~~~
   include/linux/static_call_types.h:18:49: note: in expansion of macro 'STATIC_CALL_TRAMP_PREFIX'
      18 | #define STATIC_CALL_TRAMP(name)         __PASTE(STATIC_CALL_TRAMP_PREFIX, name)
         |                                                 ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:43:35: note: in expansion of macro 'STATIC_CALL_TRAMP'
      43 | #define __raw_static_call(name) (&STATIC_CALL_TRAMP(name))
         |                                   ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:58:9: note: in expansion of macro '__raw_static_call'
      58 |         __raw_static_call(name);                                        \
         |         ^~~~~~~~~~~~~~~~~
   include/linux/static_call_types.h:90:33: note: in expansion of macro '__static_call'
      90 | #define static_call(name)       __static_call(name)
         |                                 ^~~~~~~~~~~~~
   arch/x86/kvm/x86.c:10176:41: note: in expansion of macro 'static_call'
   10176 |         return vcpu->arch.nmi_pending + static_call(kvm_x86_get_hw_nmi_pending)(vcpu);
         |                                         ^~~~~~~~~~~
   arch/x86/kvm/x86.c:10177:1: error: control reaches end of non-void function [-Werror=return-type]
   10177 | }
         | ^
   cc1: some warnings being treated as errors


vim +9 include/linux/static_call_types.h

115284d89a436e Josh Poimboeuf 2020-08-18   8  
115284d89a436e Josh Poimboeuf 2020-08-18  @9  #define STATIC_CALL_KEY_PREFIX		__SCK__
9183c3f9ed710a Josh Poimboeuf 2020-08-18  10  #define STATIC_CALL_KEY_PREFIX_STR	__stringify(STATIC_CALL_KEY_PREFIX)
9183c3f9ed710a Josh Poimboeuf 2020-08-18  11  #define STATIC_CALL_KEY_PREFIX_LEN	(sizeof(STATIC_CALL_KEY_PREFIX_STR) - 1)
115284d89a436e Josh Poimboeuf 2020-08-18  12  #define STATIC_CALL_KEY(name)		__PASTE(STATIC_CALL_KEY_PREFIX, name)
73f44fe19d3596 Josh Poimboeuf 2021-01-27  13  #define STATIC_CALL_KEY_STR(name)	__stringify(STATIC_CALL_KEY(name))
115284d89a436e Josh Poimboeuf 2020-08-18  14  
115284d89a436e Josh Poimboeuf 2020-08-18 @15  #define STATIC_CALL_TRAMP_PREFIX	__SCT__
115284d89a436e Josh Poimboeuf 2020-08-18  16  #define STATIC_CALL_TRAMP_PREFIX_STR	__stringify(STATIC_CALL_TRAMP_PREFIX)
9183c3f9ed710a Josh Poimboeuf 2020-08-18  17  #define STATIC_CALL_TRAMP_PREFIX_LEN	(sizeof(STATIC_CALL_TRAMP_PREFIX_STR) - 1)
115284d89a436e Josh Poimboeuf 2020-08-18  18  #define STATIC_CALL_TRAMP(name)		__PASTE(STATIC_CALL_TRAMP_PREFIX, name)
115284d89a436e Josh Poimboeuf 2020-08-18  19  #define STATIC_CALL_TRAMP_STR(name)	__stringify(STATIC_CALL_TRAMP(name))
115284d89a436e Josh Poimboeuf 2020-08-18  20  

:::::: The code at line 9 was first introduced by commit
:::::: 115284d89a436e9b66da0c6c4f6efded806874b2 static_call: Add basic static call infrastructure

:::::: TO: Josh Poimboeuf <jpoimboe@redhat.com>
:::::: CC: Ingo Molnar <mingo@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
