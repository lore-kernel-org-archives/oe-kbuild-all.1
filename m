Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5591263BD
	for <oe-kbuild-all@lists.linux.dev>; Thu,  3 Aug 2023 22:15:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691100953; x=1722636953;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yDldSkcB2P8dsKT3VJr5EPOkP/AVAXBENQ/dv3P5iGA=;
  b=VBwM063jDKxR/HAIeydrhp3ADTMgvMSBl2hNkb//gqobwA7suulMW80k
   xOcmVNDqsS2/bI3cBvBuhyu9EUrptO/UTOHYlcQCzE8VAzF5HGfpRLdyD
   muGUl9AULNRlS7xlt7er2c2N0EcRD0uo4KL6NAhuRfjgEr0sju4OV4oXh
   Pe8SlGNxhO03kl63CWVxFEOKRDf6MrFLHVW+u2UCULtLcCUxE8uAsMK71
   Ao5PixOj2wRiPDnX7t5txhWRy2eTqYc/w4dXD74itYAHorUZS3rDUt0+N
   tUhSTGMuK5t+dDusdB/UZe9N91Mz47dm5NOOUboj44XnloWF+FVy3UXQ/
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="456381563"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="456381563"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Aug 2023 15:15:52 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="976295587"
X-IronPort-AV: E=Sophos;i="6.01,253,1684825200"; 
   d="scan'208";a="976295587"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 03 Aug 2023 15:15:51 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRgbm-0002OX-2a;
	Thu, 03 Aug 2023 22:15:50 +0000
Date: Fri, 4 Aug 2023 06:15:06 +0800
From: kernel test robot <lkp@intel.com>
To: elver@google.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [melver:misc 1/3] thread 'main' panicked at
 '"ftrace_branch_data_union_(anonymous_at_include/linux/compiler_types_h_173_2)"
 is not a valid Ident',
 /opt/cross/rustc-1.68.2-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/proc-macro2-1.0.24/src/fallback.rs:693:9
Message-ID: <202308040656.G1JdyZms-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marco,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/melver/linux.git misc
head:   bca71808bcacdb0856ca03852590f052be8b02fa
commit: e5796665b0f4d5e5de02b3a29a314ff05aa41fa8 [1/3] compiler_types: Introduce the Clang __preserve_most function attribute
config: x86_64-rhel-8.3-rust (https://download.01.org/0day-ci/archive/20230804/202308040656.G1JdyZms-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308040656.G1JdyZms-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308040656.G1JdyZms-lkp@intel.com/

All errors (new ones prefixed by >>):

>> thread 'main' panicked at '"ftrace_branch_data_union_(anonymous_at_include/linux/compiler_types_h_173_2)" is not a valid Ident', /opt/cross/rustc-1.68.2-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/proc-macro2-1.0.24/src/fallback.rs:693:9
   stack backtrace:
      0: rust_begin_unwind
                at /rustc/9eb3afe9ebe9c7d2b84b71002d44f4a0edac95e0/library/std/src/panicking.rs:575:5
      1: core::panicking::panic_fmt
                at /rustc/9eb3afe9ebe9c7d2b84b71002d44f4a0edac95e0/library/core/src/panicking.rs:64:14
      2: proc_macro2::fallback::Ident::_new
      3: proc_macro2::Ident::new
      4: bindgen::ir::context::BindgenContext::rust_ident
      5: <bindgen::ir::comp::CompInfo as bindgen::codegen::CodeGenerator>::codegen
      6: <bindgen::ir::ty::Type as bindgen::codegen::CodeGenerator>::codegen
      7: <bindgen::ir::item::Item as bindgen::codegen::CodeGenerator>::codegen
      8: <bindgen::ir::comp::CompInfo as bindgen::codegen::CodeGenerator>::codegen
      9: <bindgen::ir::ty::Type as bindgen::codegen::CodeGenerator>::codegen
     10: <bindgen::ir::item::Item as bindgen::codegen::CodeGenerator>::codegen
     11: <bindgen::ir::module::Module as bindgen::codegen::CodeGenerator>::codegen
     12: <bindgen::ir::item::Item as bindgen::codegen::CodeGenerator>::codegen
     13: bindgen::ir::context::BindgenContext::gen
     14: bindgen::Builder::generate
     15: bindgen::main
   note: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.
   make[3]: *** [rust/Makefile:316: rust/uapi/uapi_generated.rs] Error 1
   make[3]: *** Deleting file 'rust/uapi/uapi_generated.rs'
>> thread 'main' panicked at '"ftrace_branch_data_union_(anonymous_at_include/linux/compiler_types_h_173_2)" is not a valid Ident', /opt/cross/rustc-1.68.2-bindgen-0.56.0/cargo/registry/src/github.com-1ecc6299db9ec823/proc-macro2-1.0.24/src/fallback.rs:693:9
   stack backtrace:
      0: rust_begin_unwind
                at /rustc/9eb3afe9ebe9c7d2b84b71002d44f4a0edac95e0/library/std/src/panicking.rs:575:5
      1: core::panicking::panic_fmt
                at /rustc/9eb3afe9ebe9c7d2b84b71002d44f4a0edac95e0/library/core/src/panicking.rs:64:14
      2: proc_macro2::fallback::Ident::_new
      3: proc_macro2::Ident::new
      4: bindgen::ir::context::BindgenContext::rust_ident
      5: <bindgen::ir::comp::CompInfo as bindgen::codegen::CodeGenerator>::codegen
      6: <bindgen::ir::ty::Type as bindgen::codegen::CodeGenerator>::codegen
      7: <bindgen::ir::item::Item as bindgen::codegen::CodeGenerator>::codegen
      8: <bindgen::ir::comp::CompInfo as bindgen::codegen::CodeGenerator>::codegen
      9: <bindgen::ir::ty::Type as bindgen::codegen::CodeGenerator>::codegen
     10: <bindgen::ir::item::Item as bindgen::codegen::CodeGenerator>::codegen
     11: <bindgen::ir::module::Module as bindgen::codegen::CodeGenerator>::codegen
     12: <bindgen::ir::item::Item as bindgen::codegen::CodeGenerator>::codegen
     13: bindgen::ir::context::BindgenContext::gen
     14: bindgen::Builder::generate
     15: bindgen::main
   note: Some details are omitted, run with `RUST_BACKTRACE=full` for a verbose backtrace.
   make[3]: *** [rust/Makefile:310: rust/bindings/bindings_generated.rs] Error 1
   make[3]: *** Deleting file 'rust/bindings/bindings_generated.rs'
   make[3]: Target 'rust/' not remade because of errors.
   make[2]: *** [Makefile:1293: prepare] Error 2
   make[1]: *** [Makefile:234: __sub-make] Error 2
   make[1]: Target 'prepare' not remade because of errors.
   make: *** [Makefile:234: __sub-make] Error 2
   make: Target 'prepare' not remade because of errors.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
