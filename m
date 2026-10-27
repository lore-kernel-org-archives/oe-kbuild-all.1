Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.9
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793105214;
	b=F4c3oxbh+8/6l/+hCLzCxFWyHwHgDf2ETY0RqydpmfGecIZjZd4qOPZt0YnaCtUKy7Le
	 6Zp7Kd3kS3vTem1fKP3BLCI6ZtJszdF8TosmNtq2dypMBhoud9kUQ4bSTyDh6BXs/TR7C
	 RMPdOadUn6euEih//Ie2fpHkP8+Cl9UzuaJvrPydmSdw6kDR3z5DQKO4nQrepUOp9YYzK
	 RAUMnuhMQPH+GPMrTrKlxRe1/AYfV0CEYh2JFK3LTYv11YjQsJJec0AdWq40QErfXQ//s
	 ZWOdmPrUrKvFhynEUwCbyVqgIKO7ZKSpdItRYcB8xnafvUoh6ifPJXjR86O2GX+vuVg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793105214;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=azx0/ZPObCoc1avdAlBi2fTolJQ7ABiUkB1J7MoqScA=;
	b=QsoA2GxcTau33qbUtt0+a4JHDsmxRR1p/3/qLt0nHUNGNM3QUBaIku25NTfiBoEggVwo
	 Kz9y4uwOJCBrdYNmm0+roX9BuA9VsXocExy7vhHBs4QPMmM629X+4z6yp6GlaDVXrjlRr
	 JnddYAFLBqdY9PYPnf3A5Yo9107n3+g9C0HPqeV1z9Fm48UKRVAiM9lE14HoNGpw4iNsv
	 PjZZvkamisM3wr71rgHmFLLFfHLQ0hpcTG34pwV+1EcHV8ZPEEZYMtVordcAgCJ7a1u32
	 MBBAFdzsgzifXQyCKw7/1QpZb4COn9ZMSvmxkoJVE55YllaECMOwEEuS6dmse+jECCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CJwP8eXX;
	arc=none smtp.remote-ip=198.175.65.9
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA8F3606A31A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 Oct 2026 12:46:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AA8F3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=CJwP8eXX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793105210; x=1824641210;
  h=date:from:to:cc:subject:message-id;
  bh=td7zflz6V8BDxcuRVgNgCvhqO3l8plmHiVDNR7AMxqI=;
  b=CJwP8eXXz0tZcrm7DTDDbZgdxdx9xrMc5bcaPsnjyfZ0bjZInY95LD50
   0soc9RTLt5WJPt0m0nnWyN2WVat+PFM6X8GsRGIiuwhkd2Lxk0JXieAqQ
   GypWwwxRveWautTlAiDyvS+G3mrn8qTWdAtTp6fl06DAme5Mb15tpV2qg
   Tk1nlQXP2IXQi42uztt2akIzrwY7rk6fuw4ucSsGTIuRQaYqQ+PMzd0Dl
   GAFaJkKfjsitsNRgS4KBuVAFXVA1Woe7A0eS+s3imatxbMDI/AKAEtLni
   f+YK9e1pHshjKAYS1CaxGnzZy0vdEEbujyrHcr4f6LxRUvV3iG+cPngjS
   Q==;
X-CSE-ConnectionGUID: LYv2OS4mQZ6HVxAwWggGlA==
X-CSE-MsgGUID: SX5gAtnQROCgC20u+lys1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11947"; a="1684233"
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="1684233"
Received: from fmviesa012.fm.intel.com ([10.60.135.152])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2026 05:46:50 -0700
X-CSE-ConnectionGUID: Syh7UVkHTIS6UgWKYjPY2Q==
X-CSE-MsgGUID: bHPe0o/ySf+L8GY58ivUFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,181,1787036400"; 
   d="scan'208";a="6293074"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa012.fm.intel.com with ESMTP; 27 Oct 2026 05:46:49 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xLgZi-00000000XGm-1xgB;
	Tue, 27 Oct 2026 12:46:46 +0000
Date: Tue, 27 Oct 2026 20:45:52 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cilium:jit-arm64 12/19]
 include/linux/compiler_types.h:702:38: error: call to
 '__compiletime_assert_744' declared with attribute error: BUILD_BUG_ON
 failed: !is_lsi_offset(offsetof(struct bpf_array, map.max_entries), 2)
Message-ID: <202610272023.JjayDdUA-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/cilium/linux.git jit-arm64
head:   a3a5fcef0bc23044a39190fa16bb5cfeefd46e79
commit: b6d640a0d2eebaae063c527d7fc21f97cf0d7fdd [12/19] bpf, arm64: Shorten the tail call sequence
config: arm64-randconfig-1003-20261027 (https://download.01.org/0day-ci/archive/20261027/202610272023.JjayDdUA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261027/202610272023.JjayDdUA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610272023.JjayDdUA-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   In function 'emit_bpf_tail_call',
       inlined from 'build_insn' at arch/arm64/net/bpf_jit_comp.c:2148:7:
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_744' declared with attribute error: BUILD_BUG_ON failed: !is_lsi_offset(offsetof(struct bpf_array, map.max_entries), 2)
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:898:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(!is_lsi_offset(offsetof(struct bpf_array, map.max_entries), 2));
     ^~~~~~~~~~~~
>> include/linux/compiler_types.h:702:38: error: call to '__compiletime_assert_746' declared with attribute error: BUILD_BUG_ON failed: !is_lsi_offset(offsetof(struct bpf_prog, bpf_func), 3)
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
                                         ^
   include/linux/compiler_types.h:683:4: note: in definition of macro '__compiletime_assert'
       prefix ## suffix();    \
       ^~~~~~
   include/linux/compiler_types.h:702:2: note: in expansion of macro '_compiletime_assert'
     _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
     ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
    #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
                                        ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:2: note: in expansion of macro 'BUILD_BUG_ON_MSG'
     BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
     ^~~~~~~~~~~~~~~~
   arch/arm64/net/bpf_jit_comp.c:900:2: note: in expansion of macro 'BUILD_BUG_ON'
     BUILD_BUG_ON(!is_lsi_offset(offsetof(struct bpf_prog, bpf_func), 3));
     ^~~~~~~~~~~~


vim +/__compiletime_assert_744 +702 include/linux/compiler_types.h

eb5c2d4b45e3d2 Will Deacon 2020-07-21  688  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  689  #define _compiletime_assert(condition, msg, prefix, suffix) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21  690  	__compiletime_assert(condition, msg, prefix, suffix)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  691  
eb5c2d4b45e3d2 Will Deacon 2020-07-21  692  /**
eb5c2d4b45e3d2 Will Deacon 2020-07-21  693   * compiletime_assert - break build and emit msg if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  694   * @condition: a compile-time constant condition to check
eb5c2d4b45e3d2 Will Deacon 2020-07-21  695   * @msg:       a message to emit if condition is false
eb5c2d4b45e3d2 Will Deacon 2020-07-21  696   *
eb5c2d4b45e3d2 Will Deacon 2020-07-21  697   * In tradition of POSIX assert, this macro will break the build if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  698   * supplied condition is *false*, emitting the supplied error message if the
eb5c2d4b45e3d2 Will Deacon 2020-07-21  699   * compiler has support to do so.
eb5c2d4b45e3d2 Will Deacon 2020-07-21  700   */
eb5c2d4b45e3d2 Will Deacon 2020-07-21  701  #define compiletime_assert(condition, msg) \
eb5c2d4b45e3d2 Will Deacon 2020-07-21 @702  	_compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
eb5c2d4b45e3d2 Will Deacon 2020-07-21  703  

:::::: The code at line 702 was first introduced by commit
:::::: eb5c2d4b45e3d2d5d052ea6b8f1463976b1020d5 compiler.h: Move compiletime_assert() macros into compiler_types.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
