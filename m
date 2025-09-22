Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC1963093D3
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Sep 2025 13:50:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758549060; cv=none; b=meUOdRNVkYc30PGABA77xIaQmfODUL8Nv2O9IlWoPYGQ7nntcfavghtYh0VmNhlYqMpDjtJebvnVc0nbFTh1TIm48+WLRt9oX9z1rcmTVsxG6YWM4d1u20UgTUoTbzAiN27g8g4M0gDxo2oV2vh+j90BMdOlilOU9HQz6MODKjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758549060; c=relaxed/simple;
	bh=xuMj8JIif0DunRFNu6UAe427qJqk4M9GKuShNj9WJqk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=k24sIFDGphTa/1lQFIABD/l2EAlMjLdY8YuSoJcbStnvQd2izCDc0Uqump/jnJ8Y2yWoLDlbyw8LQtIPJ3hLbB5O7maHlnUqipwgs84TfgUPXZuO3ZTzBKB6Xuc7kJTdxgBruc982i11nWaRIYVuzHXeEH3UOLtWrryTZbdEbtk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ltIrnlWO; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ltIrnlWO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1758549058; x=1790085058;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=xuMj8JIif0DunRFNu6UAe427qJqk4M9GKuShNj9WJqk=;
  b=ltIrnlWOdoDhcECthmAVTo/AlbWawr2E7RpJ1ECpEb4xwi7r2os/M2Iw
   /Ja/Us5DetevNtVzpYTbRGRZXibDsorVCoUYKtfXH3JXa36psabZAskSv
   HkkU4jm3k6UQKi3QfH2ic5HGssZpCIDiDKGSU+pZwakrMCIfEDoA7sWxw
   MREgkBkHXalOPTgEGpld0U/dWEbkHwns1BtsUYJoksAYI6UDdpBE6uNw/
   efe69WEWUs73dCTugC/GEWuWLm8WqbxCEmFAES2FK4ndZUlT1PhTsxe8I
   zaDhKgT8u6AXuPPHKoc6x83QKOLfBkz+0V/lyEJZ+TkzzhNRKt373UqVZ
   A==;
X-CSE-ConnectionGUID: OlZveyxvTZicdf3x7ngOhA==
X-CSE-MsgGUID: TC5u8mt/ReGnsPPY+CVZhA==
X-IronPort-AV: E=McAfee;i="6800,10657,11561"; a="60027284"
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="60027284"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2025 06:50:57 -0700
X-CSE-ConnectionGUID: sDuLF2RpQ8GMcj0GelrVgw==
X-CSE-MsgGUID: TSMSeZcfRVaR/XOaxVKuDw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,285,1751266800"; 
   d="scan'208";a="200192727"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa002.fm.intel.com with ESMTP; 22 Sep 2025 06:50:55 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v0gwP-000000003o9-19Wl;
	Mon, 22 Sep 2025 13:50:53 +0000
Date: Mon, 22 Sep 2025 15:50:12 +0200
From: kernel test robot <lkp@intel.com>
To: Sean Christopherson <seanjc@google.com>
Cc: oe-kbuild-all@lists.linux.dev, Mark Brown <broonie@kernel.org>
Subject: [linux-next:master 11457/11516] arch/x86/kvm/emulate.c:4095:9:
 warning: braces around scalar initializer
Message-ID: <202509221549.6Yl5P2vW-lkp@intel.com>
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
config: x86_64-randconfig-2005-20250721 (https://download.01.org/0day-ci/archive/20250922/202509221549.6Yl5P2vW-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250922/202509221549.6Yl5P2vW-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202509221549.6Yl5P2vW-lkp@intel.com/

All warnings (new ones prefixed by >>):

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
   arch/x86/kvm/emulate.c:3993:49: error: initialization of 'unsigned char' from 'int (*)(struct x86_emulate_ctxt *)' makes integer from pointer without a cast [-Wint-conversion]
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
   arch/x86/kvm/emulate.c:3993:30: error: initialization of 'int (*)(struct x86_emulate_ctxt *)' from 'long long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
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
>> arch/x86/kvm/emulate.c:4095:9: warning: braces around scalar initializer
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
   arch/x86/kvm/emulate.c:3993:30: error: initialization of 'int (*)(struct x86_emulate_ctxt *)' from 'long long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
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
>> arch/x86/kvm/emulate.c:3993:49: warning: excess elements in scalar initializer
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


vim +4095 arch/x86/kvm/emulate.c

f6511935f424b9 Joerg Roedel        2011-04-04  3981  
73fba5f4fe3e08 Avi Kivity          2010-07-29  3982  #define D(_y) { .flags = (_y) }
d40a6898e50c25 Paolo Bonzini       2014-03-27  3983  #define DI(_y, _i) { .flags = (_y)|Intercept, .intercept = x86_intercept_##_i }
d40a6898e50c25 Paolo Bonzini       2014-03-27  3984  #define DIP(_y, _i, _p) { .flags = (_y)|Intercept|CheckPerm, \
d40a6898e50c25 Paolo Bonzini       2014-03-27  3985  		      .intercept = x86_intercept_##_i, .check_perm = (_p) }
0b789eee2c0204 Gleb Natapov        2013-04-11  3986  #define N    D(NotImpl)
01de8b09e60689 Joerg Roedel        2011-04-04  3987  #define EXT(_f, _e) { .flags = ((_f) | RMExt), .u.group = (_e) }
1c2545be05f436 Takuya Yoshikawa    2012-04-30  3988  #define G(_f, _g) { .flags = ((_f) | Group | ModRM), .u.group = (_g) }
1c2545be05f436 Takuya Yoshikawa    2012-04-30  3989  #define GD(_f, _g) { .flags = ((_f) | GroupDual | ModRM), .u.gdual = (_g) }
39f062ff51b2a3 Nadav Amit          2014-11-26  3990  #define ID(_f, _i) { .flags = ((_f) | InstrDual | ModRM), .u.idual = (_i) }
2276b5116e9832 Nadav Amit          2015-01-26  3991  #define MD(_f, _m) { .flags = ((_f) | ModeDual), .u.mdual = (_m) }
045a282ca41505 Gleb Natapov        2012-12-20  3992  #define E(_f, _e) { .flags = ((_f) | Escape | ModRM), .u.esc = (_e) }
73fba5f4fe3e08 Avi Kivity          2010-07-29 @3993  #define I(_f, _e) { .flags = (_f), .u.execute = (_e) }
c4f035c60dad45 Avi Kivity          2011-04-04  3994  #define II(_f, _e, _i) \
d40a6898e50c25 Paolo Bonzini       2014-03-27  3995  	{ .flags = (_f)|Intercept, .u.execute = (_e), .intercept = x86_intercept_##_i }
d09beabd7cd4cf Joerg Roedel        2011-04-04  3996  #define IIP(_f, _e, _i, _p) \
d40a6898e50c25 Paolo Bonzini       2014-03-27  3997  	{ .flags = (_f)|Intercept|CheckPerm, .u.execute = (_e), \
d40a6898e50c25 Paolo Bonzini       2014-03-27  3998  	  .intercept = x86_intercept_##_i, .check_perm = (_p) }
aa97bb4891b1f1 Avi Kivity          2010-01-20  3999  #define GP(_f, _g) { .flags = ((_f) | Prefix), .u.gprefix = (_g) }
73fba5f4fe3e08 Avi Kivity          2010-07-29  4000  
8d8f4e9f66ab36 Avi Kivity          2010-08-26  4001  #define D2bv(_f)      D((_f) | ByteOp), D(_f)
f6511935f424b9 Joerg Roedel        2011-04-04  4002  #define D2bvIP(_f, _i, _p) DIP((_f) | ByteOp, _i, _p), DIP(_f, _i, _p)
8d8f4e9f66ab36 Avi Kivity          2010-08-26  4003  #define I2bv(_f, _e)  I((_f) | ByteOp, _e), I(_f, _e)
f7857f35dbf8e7 Avi Kivity          2013-01-04  4004  #define F2bv(_f, _e)  F((_f) | ByteOp, _e), F(_f, _e)
d7841a4b1b6e85 Takuya Yoshikawa    2011-11-22  4005  #define I2bvIP(_f, _e, _i, _p) \
d7841a4b1b6e85 Takuya Yoshikawa    2011-11-22  4006  	IIP((_f) | ByteOp, _e, _i, _p), IIP(_f, _e, _i, _p)
8d8f4e9f66ab36 Avi Kivity          2010-08-26  4007  
b26deb0cad4af9 Peter Zijlstra      2025-04-26  4008  #define I6ALU(_f, _e) I2bv((_f) | DstMem | SrcReg | ModRM, _e),		\
b26deb0cad4af9 Peter Zijlstra      2025-04-26  4009  		I2bv(((_f) | DstReg | SrcMem | ModRM) & ~Lock, _e),	\
b26deb0cad4af9 Peter Zijlstra      2025-04-26  4010  		I2bv(((_f) & ~Lock) | DstAcc | SrcImm, _e)
6230f7fc0453c5 Avi Kivity          2010-08-26  4011  
0f54a321302dfb Nadav Amit          2014-08-29  4012  static const struct opcode group7_rm0[] = {
0f54a321302dfb Nadav Amit          2014-08-29  4013  	N,
b34a80517bfcd9 Jan Kiszka          2015-03-09  4014  	I(SrcNone | Priv | EmulateOnUD,	em_hypercall),
0f54a321302dfb Nadav Amit          2014-08-29  4015  	N, N, N, N, N, N,
0f54a321302dfb Nadav Amit          2014-08-29  4016  };
0f54a321302dfb Nadav Amit          2014-08-29  4017  
fd0a0d82083747 Mathias Krause      2012-08-30  4018  static const struct opcode group7_rm1[] = {
1c2545be05f436 Takuya Yoshikawa    2012-04-30  4019  	DI(SrcNone | Priv, monitor),
1c2545be05f436 Takuya Yoshikawa    2012-04-30  4020  	DI(SrcNone | Priv, mwait),
d7eb82030699e6 Joerg Roedel        2011-04-04  4021  	N, N, N, N, N, N,
d7eb82030699e6 Joerg Roedel        2011-04-04  4022  };
d7eb82030699e6 Joerg Roedel        2011-04-04  4023  
02d4160fbd7651 Vitaly Kuznetsov    2019-08-13  4024  static const struct opcode group7_rm2[] = {
02d4160fbd7651 Vitaly Kuznetsov    2019-08-13  4025  	N,
02d4160fbd7651 Vitaly Kuznetsov    2019-08-13  4026  	II(ImplicitOps | Priv,			em_xsetbv,	xsetbv),
02d4160fbd7651 Vitaly Kuznetsov    2019-08-13  4027  	N, N, N, N, N, N,
02d4160fbd7651 Vitaly Kuznetsov    2019-08-13  4028  };
02d4160fbd7651 Vitaly Kuznetsov    2019-08-13  4029  
fd0a0d82083747 Mathias Krause      2012-08-30  4030  static const struct opcode group7_rm3[] = {
1c2545be05f436 Takuya Yoshikawa    2012-04-30  4031  	DIP(SrcNone | Prot | Priv,		vmrun,		check_svme_pa),
b34a80517bfcd9 Jan Kiszka          2015-03-09  4032  	II(SrcNone  | Prot | EmulateOnUD,	em_hypercall,	vmmcall),
1c2545be05f436 Takuya Yoshikawa    2012-04-30  4033  	DIP(SrcNone | Prot | Priv,		vmload,		check_svme_pa),
1c2545be05f436 Takuya Yoshikawa    2012-04-30  4034  	DIP(SrcNone | Prot | Priv,		vmsave,		check_svme_pa),
1c2545be05f436 Takuya Yoshikawa    2012-04-30  4035  	DIP(SrcNone | Prot | Priv,		stgi,		check_svme),
1c2545be05f436 Takuya Yoshikawa    2012-04-30  4036  	DIP(SrcNone | Prot | Priv,		clgi,		check_svme),
1c2545be05f436 Takuya Yoshikawa    2012-04-30  4037  	DIP(SrcNone | Prot | Priv,		skinit,		check_svme),
1c2545be05f436 Takuya Yoshikawa    2012-04-30  4038  	DIP(SrcNone | Prot | Priv,		invlpga,	check_svme),
01de8b09e60689 Joerg Roedel        2011-04-04  4039  };
6230f7fc0453c5 Avi Kivity          2010-08-26  4040  
fd0a0d82083747 Mathias Krause      2012-08-30  4041  static const struct opcode group7_rm7[] = {
d7eb82030699e6 Joerg Roedel        2011-04-04  4042  	N,
1c2545be05f436 Takuya Yoshikawa    2012-04-30  4043  	DIP(SrcNone, rdtscp, check_rdtsc),
d7eb82030699e6 Joerg Roedel        2011-04-04  4044  	N, N, N, N, N, N,
d7eb82030699e6 Joerg Roedel        2011-04-04  4045  };
d67fc27ae2bdc2 Takuya Yoshikawa    2011-04-23  4046  
fd0a0d82083747 Mathias Krause      2012-08-30  4047  static const struct opcode group1[] = {
b26deb0cad4af9 Peter Zijlstra      2025-04-26  4048  	I(Lock, em_add),
b26deb0cad4af9 Peter Zijlstra      2025-04-26  4049  	I(Lock | PageTable, em_or),
b26deb0cad4af9 Peter Zijlstra      2025-04-26  4050  	I(Lock, em_adc),
b26deb0cad4af9 Peter Zijlstra      2025-04-26  4051  	I(Lock, em_sbb),
b26deb0cad4af9 Peter Zijlstra      2025-04-26  4052  	I(Lock | PageTable, em_and),
b26deb0cad4af9 Peter Zijlstra      2025-04-26  4053  	I(Lock, em_sub),
b26deb0cad4af9 Peter Zijlstra      2025-04-26  4054  	I(Lock, em_xor),
b26deb0cad4af9 Peter Zijlstra      2025-04-26  4055  	I(NoWrite, em_cmp),
73fba5f4fe3e08 Avi Kivity          2010-07-29  4056  };
73fba5f4fe3e08 Avi Kivity          2010-07-29  4057  
fd0a0d82083747 Mathias Krause      2012-08-30  4058  static const struct opcode group1A[] = {
0f89b207b04a1a Tom Lendacky        2016-12-14  4059  	I(DstMem | SrcNone | Mov | Stack | IncSP | TwoMemOp, em_pop), N, N, N, N, N, N, N,
73fba5f4fe3e08 Avi Kivity          2010-07-29  4060  };
73fba5f4fe3e08 Avi Kivity          2010-07-29  4061  
007a3b547512d6 Avi Kivity          2013-01-19  4062  static const struct opcode group2[] = {
67e944aff63cb6 Peter Zijlstra      2025-04-26  4063  	I(DstMem | ModRM, em_rol),
67e944aff63cb6 Peter Zijlstra      2025-04-26  4064  	I(DstMem | ModRM, em_ror),
67e944aff63cb6 Peter Zijlstra      2025-04-26  4065  	I(DstMem | ModRM, em_rcl),
67e944aff63cb6 Peter Zijlstra      2025-04-26  4066  	I(DstMem | ModRM, em_rcr),
67e944aff63cb6 Peter Zijlstra      2025-04-26  4067  	I(DstMem | ModRM, em_shl),
67e944aff63cb6 Peter Zijlstra      2025-04-26  4068  	I(DstMem | ModRM, em_shr),
67e944aff63cb6 Peter Zijlstra      2025-04-26  4069  	I(DstMem | ModRM, em_shl),
67e944aff63cb6 Peter Zijlstra      2025-04-26  4070  	I(DstMem | ModRM, em_sar),
007a3b547512d6 Avi Kivity          2013-01-19  4071  };
007a3b547512d6 Avi Kivity          2013-01-19  4072  
fd0a0d82083747 Mathias Krause      2012-08-30  4073  static const struct opcode group3[] = {
b26deb0cad4af9 Peter Zijlstra      2025-04-26  4074  	I(DstMem | SrcImm | NoWrite, em_test),
b26deb0cad4af9 Peter Zijlstra      2025-04-26  4075  	I(DstMem | SrcImm | NoWrite, em_test),
6204aea36b74cd Peter Zijlstra      2025-04-26  4076  	I(DstMem | SrcNone | Lock, em_not),
6204aea36b74cd Peter Zijlstra      2025-04-26  4077  	I(DstMem | SrcNone | Lock, em_neg),
af4fe07aa1e076 Peter Zijlstra      2025-04-26  4078  	I(DstXacc | Src2Mem, em_mul_ex),
af4fe07aa1e076 Peter Zijlstra      2025-04-26  4079  	I(DstXacc | Src2Mem, em_imul_ex),
af4fe07aa1e076 Peter Zijlstra      2025-04-26  4080  	I(DstXacc | Src2Mem, em_div_ex),
af4fe07aa1e076 Peter Zijlstra      2025-04-26  4081  	I(DstXacc | Src2Mem, em_idiv_ex),
73fba5f4fe3e08 Avi Kivity          2010-07-29  4082  };
73fba5f4fe3e08 Avi Kivity          2010-07-29  4083  
fd0a0d82083747 Mathias Krause      2012-08-30  4084  static const struct opcode group4[] = {
6204aea36b74cd Peter Zijlstra      2025-04-26  4085  	I(ByteOp | DstMem | SrcNone | Lock, em_inc),
6204aea36b74cd Peter Zijlstra      2025-04-26  4086  	I(ByteOp | DstMem | SrcNone | Lock, em_dec),
73fba5f4fe3e08 Avi Kivity          2010-07-29  4087  	N, N, N, N, N, N,
73fba5f4fe3e08 Avi Kivity          2010-07-29  4088  };
73fba5f4fe3e08 Avi Kivity          2010-07-29  4089  
fd0a0d82083747 Mathias Krause      2012-08-30  4090  static const struct opcode group5[] = {
95413dc41398fe Avi Kivity          2013-01-19  4091  	F(DstMem | SrcNone | Lock,		em_inc),
95413dc41398fe Avi Kivity          2013-01-19  4092  	F(DstMem | SrcNone | Lock,		em_dec),
f8457615b71c66 Sean Christopherson 2025-09-19  4093  	I(SrcMem | NearBranch | IsBranch | ShadowStack, em_call_near_abs),
f8457615b71c66 Sean Christopherson 2025-09-19  4094  	I(SrcMemFAddr | ImplicitOps | IsBranch | ShadowStack, em_call_far),
018d70ffcfec8a Eric Hankland       2021-11-30 @4095  	I(SrcMem | NearBranch | IsBranch,       em_jmp_abs),
018d70ffcfec8a Eric Hankland       2021-11-30  4096  	I(SrcMemFAddr | ImplicitOps | IsBranch, em_jmp_far),
0f89b207b04a1a Tom Lendacky        2016-12-14  4097  	I(SrcMem | Stack | TwoMemOp,		em_push), D(Undefined),
73fba5f4fe3e08 Avi Kivity          2010-07-29  4098  };
73fba5f4fe3e08 Avi Kivity          2010-07-29  4099  

:::::: The code at line 4095 was first introduced by commit
:::::: 018d70ffcfec8a01f77b0d840527203d337dd7f9 KVM: x86: Update vPMCs when retiring branch instructions

:::::: TO: Eric Hankland <ehankland@google.com>
:::::: CC: Paolo Bonzini <pbonzini@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
