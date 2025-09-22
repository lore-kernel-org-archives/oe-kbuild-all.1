Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9851330C35D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 13:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758548020; cv=none; b=PSwAPU8SJkTMmG2VyDIhbzYT4H+iYm8qChR7NhLLhFQac/DalqLdEPpb/9lEB9uy+jPDUtkr7I1uPmx+iLubHYjE6ejXNKBedDgRXT4vsaSf4j2zdCVylwe4xjahO6Pv5wpqA01OWiNGbtgxx7REiiOO5hSn3CdmrRdtzhtHtpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758548020; c=relaxed/simple;
	bh=it1BFZRzFVKW/mWqR8dh3F2hdXWXNR7FWkmj4uBZr5k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JAACHY1FRbAaCcszhpZzzfvfOz9ThUy3GahvkPdl7aNN4A/8I2mvKSPezhNt8gMNHvCrVhhGTSlD46PrkH+zMyboBk5oJ/FKHYqgLsnNCU/98i4ByKU4Jq0stmTBy2McD3v+ufirfFq1RdXP+knazLg86eelD2E6sHFgJ+5BoK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mxQUwtrW; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mxQUwtrW"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758548017; x=1790084017;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=it1BFZRzFVKW/mWqR8dh3F2hdXWXNR7FWkmj4uBZr5k=;
  b=mxQUwtrWlnlg1taq9/Ef+xb9YyCEUMn5qhDB5BvYDHuZpd7oSIuuNgNE
   7cyTS+cRVvdlbSEtjjjDDcHDRIhx1ogN2Ptb7GU9PdslRPKh6xixt6+ey
   kL5zW5tsbUiu5Hj8kuF3a+lv4U+Uu+408kuPdhZ9nhdPrJSKhdzT1rOLm
   mDiaPrDKxs2j8I+XFgo8XTY3pzUW8m6134IfJkhMdXhcrL53W5OCatXgg
   /mUpWToO42IP2Wn6/E8p/2h9t6X0y0R8d5UpcWZvsd7lq4zBmkHNxsEVL
   7MH/jL55v1M7di1HKWyfL812UXvU8w/sJ1k5L4L3MqDAM1E9SuAQGXP3G
   Q==;
X-CSE-ConnectionGUID: 3huKuVELRQG1wRYZ/ddGjw==
X-CSE-MsgGUID: jx18r4VCT2SbXr9o5rtNHQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="72173514"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="72173514"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 06:33:36 -0700
X-CSE-ConnectionGUID: cNUhIZVATT+yrChFTQQOTQ==
X-CSE-MsgGUID: 5f26DiNHQLa/Pf++W2Oh2A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="200190791"
Received: from lkp-server02.sh.intel.com (HELO 84c55410ccf6) ([10.239.97.151])
  by fmviesa002.fm.intel.com with ESMTP; 22 Sep 2025 06:33:36 -0700
Received: from kbuild by 84c55410ccf6 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1v0gfd-0001iP-0V;
	Mon, 22 Sep 2025 13:33:33 +0000
Date: Mon, 22 Sep 2025 21:32:49 +0800
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 11457/11516] arch/x86/kvm/emulate.c:3993:49:
 error: initialization of 'unsigned char' from 'int (*)(struct
 x86_emulate_ctxt *)' makes integer from pointer without a cast
Message-ID: <202509222120.gYT1wiPR-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bf2602a3cb2381fb1a04bf1c39a290518d2538d1
commit: 73ae7b15769883f22b199e1c6c67f7597e262fff [11457/11516] Merge branch 'next' of https://github.com/kvm-x86/linux.git
config: i386-buildonly-randconfig-003-20250922 (https://download.01.org/0day-ci/archive/20250922/202509222120.gYT1wiPR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509222120.gYT1wiPR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509222120.gYT1wiPR-lkp@intel.com/

All errors (new ones prefixed by >>):

   arch/x86/kvm/emulate.c:4091:9: error: implicit declaration of function 'F'; did you mean 'FS'? [-Wimplicit-function-declaration]
    4091 |         F(DstMem | SrcNone | Lock,              em_inc),
         |         ^
         |         FS
   arch/x86/kvm/emulate.c:4091:9: error: initializer element is not constant
   arch/x86/kvm/emulate.c:4091:9: note: (near initialization for 'group5[0].flags')
   arch/x86/kvm/emulate.c:4092:9: error: initializer element is not constant
    4092 |         F(DstMem | SrcNone | Lock,              em_dec),
         |         ^
   arch/x86/kvm/emulate.c:4092:9: note: (near initialization for 'group5[0].intercept')
   arch/x86/kvm/emulate.c:3993:21: error: field name not in record or union initializer
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                     ^
   arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro 'I'
    4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
         |         ^
   arch/x86/kvm/emulate.c:3993:21: note: (near initialization for 'group5[0].pad')
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                     ^
   arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro 'I'
    4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
         |         ^
   arch/x86/kvm/emulate.c:3993:30: warning: conversion from 'long long unsigned int' to 'unsigned char' changes value from '220676381741154496' to '192' [-Woverflow]
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                              ^
   arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro 'I'
    4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
         |         ^
   arch/x86/kvm/emulate.c:3993:36: error: field name not in record or union initializer
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                                    ^
   arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro 'I'
    4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
         |         ^
   arch/x86/kvm/emulate.c:3993:36: note: (near initialization for 'group5[0].pad')
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                                    ^
   arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro 'I'
    4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
         |         ^
>> arch/x86/kvm/emulate.c:3993:49: error: initialization of 'unsigned char' from 'int (*)(struct x86_emulate_ctxt *)' makes integer from pointer without a cast [-Wint-conversion]
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                                                 ^
   arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro 'I'
    4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
         |         ^
   arch/x86/kvm/emulate.c:3993:49: note: (near initialization for 'group5[0].pad[1]')
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                                                 ^
   arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro 'I'
    4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
         |         ^
   arch/x86/kvm/emulate.c:3993:49: error: initializer element is not computable at load time
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                                                 ^
   arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro 'I'
    4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
         |         ^
   arch/x86/kvm/emulate.c:3993:49: note: (near initialization for 'group5[0].pad[1]')
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                                                 ^
   arch/x86/kvm/emulate.c:4093:9: note: in expansion of macro 'I'
    4093 |         I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
         |         ^
   arch/x86/kvm/emulate.c:4090:39: warning: missing braces around initializer [-Wmissing-braces]
    4090 | static const struct opcode group5[] = {
         |                                       ^
    4091 |         F(DstMem | SrcNone | Lock,              em_inc),
         |         {
   arch/x86/kvm/emulate.c:3993:22: error: 'union <anonymous>' has no member named 'flags'
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                      ^~~~~
   arch/x86/kvm/emulate.c:4094:9: note: in expansion of macro 'I'
    4094 |         I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
         |         ^
>> arch/x86/kvm/emulate.c:3993:30: error: initialization of 'int (*)(struct x86_emulate_ctxt *)' from 'long long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                              ^
   arch/x86/kvm/emulate.c:4094:9: note: in expansion of macro 'I'
    4094 |         I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
         |         ^
   arch/x86/kvm/emulate.c:3993:30: note: (near initialization for 'group5[0].u.execute')
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                              ^
   arch/x86/kvm/emulate.c:4094:9: note: in expansion of macro 'I'
    4094 |         I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
         |         ^
   arch/x86/kvm/emulate.c:3993:37: error: 'union <anonymous>' has no member named 'u'
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                                     ^
   arch/x86/kvm/emulate.c:4094:9: note: in expansion of macro 'I'
    4094 |         I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
         |         ^
   arch/x86/kvm/emulate.c:3993:49: warning: excess elements in union initializer
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                                                 ^
   arch/x86/kvm/emulate.c:4094:9: note: in expansion of macro 'I'
    4094 |         I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
         |         ^
   arch/x86/kvm/emulate.c:3993:49: note: (near initialization for 'group5[0].u')
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                                                 ^
   arch/x86/kvm/emulate.c:4094:9: note: in expansion of macro 'I'
    4094 |         I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
         |         ^
   arch/x86/kvm/emulate.c:4090:39: warning: missing braces around initializer [-Wmissing-braces]
    4090 | static const struct opcode group5[] = {
         |                                       ^
    4091 |         F(DstMem | SrcNone | Lock,              em_inc),
         |         {
   arch/x86/kvm/emulate.c:4095:9: warning: braces around scalar initializer
    4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
         |         ^
   arch/x86/kvm/emulate.c:4095:9: note: (near initialization for 'group5[0].check_perm')
   arch/x86/kvm/emulate.c:3993:21: error: field name not in record or union initializer
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                     ^
   arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro 'I'
    4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
         |         ^
   arch/x86/kvm/emulate.c:3993:21: note: (near initialization for 'group5[0].check_perm')
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                     ^
   arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro 'I'
    4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
         |         ^
>> arch/x86/kvm/emulate.c:3993:30: error: initialization of 'int (*)(struct x86_emulate_ctxt *)' from 'long long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                              ^
   arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro 'I'
    4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
         |         ^
   arch/x86/kvm/emulate.c:3993:30: note: (near initialization for 'group5[0].check_perm')
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                              ^
   arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro 'I'
    4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
         |         ^
   arch/x86/kvm/emulate.c:3993:36: error: field name not in record or union initializer
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                                    ^
   arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro 'I'
    4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
         |         ^
   arch/x86/kvm/emulate.c:3993:36: note: (near initialization for 'group5[0].check_perm')
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                                    ^
   arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro 'I'
    4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
         |         ^
   arch/x86/kvm/emulate.c:3993:49: warning: excess elements in scalar initializer
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                                                 ^
   arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro 'I'
    4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
         |         ^
   arch/x86/kvm/emulate.c:3993:49: note: (near initialization for 'group5[0].check_perm')
    3993 | #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
         |                                                 ^
   arch/x86/kvm/emulate.c:4095:9: note: in expansion of macro 'I'
    4095 |         I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
         |         ^
   arch/x86/kvm/emulate.c:4090:39: warning: missing braces around initializer [-Wmissing-braces]
    4090 | static const struct opcode group5[] = {
         |                                       ^
    4091 |         F(DstMem | SrcNone | Lock,              em_inc),
         |         {
   arch/x86/kvm/emulate.c:4090:39: warning: missing braces around initializer [-Wmissing-braces]
   arch/x86/kvm/emulate.c:4090:39: warning: missing braces around initializer [-Wmissing-braces]
   arch/x86/kvm/emulate.c:4090:39: warning: missing braces around initializer [-Wmissing-braces]


vim +3993 arch/x86/kvm/emulate.c

f6511935f424b9 Joerg Roedel     2011-04-04  3981  
73fba5f4fe3e08 Avi Kivity       2010-07-29  3982  #define D(_y) { .flags = (_y) }
d40a6898e50c25 Paolo Bonzini    2014-03-27  3983  #define DI(_y, _i) { .flags = (_y)|Intercept, .intercept = x86_intercept_##_i }
d40a6898e50c25 Paolo Bonzini    2014-03-27  3984  #define DIP(_y, _i, _p) { .flags = (_y)|Intercept|CheckPerm, \
d40a6898e50c25 Paolo Bonzini    2014-03-27  3985  		      .intercept = x86_intercept_##_i, .check_perm = (_p) }
0b789eee2c0204 Gleb Natapov     2013-04-11  3986  #define N    D(NotImpl)
01de8b09e60689 Joerg Roedel     2011-04-04  3987  #define EXT(_f, _e) { .flags = ((_f) | RMExt), .u.group = (_e) }
1c2545be05f436 Takuya Yoshikawa 2012-04-30  3988  #define G(_f, _g) { .flags = ((_f) | Group | ModRM), .u.group = (_g) }
1c2545be05f436 Takuya Yoshikawa 2012-04-30  3989  #define GD(_f, _g) { .flags = ((_f) | GroupDual | ModRM), .u.gdual = (_g) }
39f062ff51b2a3 Nadav Amit       2014-11-26  3990  #define ID(_f, _i) { .flags = ((_f) | InstrDual | ModRM), .u.idual = (_i) }
2276b5116e9832 Nadav Amit       2015-01-26  3991  #define MD(_f, _m) { .flags = ((_f) | ModeDual), .u.mdual = (_m) }
045a282ca41505 Gleb Natapov     2012-12-20  3992  #define E(_f, _e) { .flags = ((_f) | Escape | ModRM), .u.esc = (_e) }
73fba5f4fe3e08 Avi Kivity       2010-07-29 @3993  #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
c4f035c60dad45 Avi Kivity       2011-04-04  3994  #define II(_f, _e, _i) \
d40a6898e50c25 Paolo Bonzini    2014-03-27  3995  	{ .flags = (_f)|Intercept, .u.execute = (_e), .intercept = x86_intercept_##_i }
d09beabd7cd4cf Joerg Roedel     2011-04-04  3996  #define IIP(_f, _e, _i, _p) \
d40a6898e50c25 Paolo Bonzini    2014-03-27  3997  	{ .flags = (_f)|Intercept|CheckPerm, .u.execute = (_e), \
d40a6898e50c25 Paolo Bonzini    2014-03-27  3998  	  .intercept = x86_intercept_##_i, .check_perm = (_p) }
aa97bb4891b1f1 Avi Kivity       2010-01-20  3999  #define GP(_f, _g) { .flags = ((_f) | Prefix), .u.gprefix = (_g) }
73fba5f4fe3e08 Avi Kivity       2010-07-29  4000  

:::::: The code at line 3993 was first introduced by commit
:::::: 73fba5f4fe3e08bd7acb18a65b53643445c8f028 KVM: x86 emulator: move decode tables downwards

:::::: TO: Avi Kivity <avi@redhat.com>
:::::: CC: Avi Kivity <avi@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
