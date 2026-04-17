Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDB8638AC8C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 17 Apr 2026 13:08:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776431334; cv=none; b=l8acrIwG7voraeX2hdhKJqGr6esQQ2A6lg1wYu+L+B5LTTiVB/UIduR1GyuLn006hYMvj90SFfDdS9j5lBMQsh4jwbWhhMWfFPgjcGf48lwe7afMInQs8QcyujkZHPjxVOhfrnAsMLPUvpkuu+mJZ3COwQoY0ySQ4z3plAOYfuk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776431334; c=relaxed/simple;
	bh=z4lbrx7T9wsIwKj9S+ZDppiVB9YxSc1NtTSaj9e38Kc=;
	h=Date:From:To:Cc:Subject:Message-ID; b=OTiZoMRALTWY9+GGxprBc+hPmMmeXh0XTpq1/tuyUmEMTeefev1OQj05lgq50Zr9rrhl+8XWb/wuQ3ypFSZIuDPipQe97uBUKjAVIJ2SJagYJfxil6gBYneju+7Nf1yVrWWKr1FQwEICjT2BRUYJw0BqmjI9g8OOEaW/cbXrg70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=WSE/W5OE; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="WSE/W5OE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776431333; x=1807967333;
  h=date:from:to:cc:subject:message-id;
  bh=z4lbrx7T9wsIwKj9S+ZDppiVB9YxSc1NtTSaj9e38Kc=;
  b=WSE/W5OEh9U9M3yRfpQm61W+J9WyDdrPPFkLbsN35ortWa4cs/ljmHAU
   5MNnDCCaeux9v/TZ8kjcaMbUbqp1+oGYtlf2Ht5AnXztdx50+6bIhno8A
   bt5hX6kMihJM6g7fnXr7E3X/nm5UXJRxy+6/6yv9KZ3wivvWFT9WjJdva
   KfPjZZUBj0Dn/i40U10hiTiUvKMfEoBL9m1168+kbJONnhB8gRI1GIWHz
   //4ju2Hzdq8EGr42s9TibvL7r4lcf4rIYlIbgXXvwzGmVX9CHzlqQOE4I
   Uy6sOSqoti78pc4qiHW7YgbRuhh1dM3v6mX+nt4FZJFEgTo+PkPdmPxUF
   Q==;
X-CSE-ConnectionGUID: ym7fk+/TTGmOg0t2oUOyZw==
X-CSE-MsgGUID: GHWSxdEuSeOL1ZQJULS1MA==
X-IronPort-AV: E=McAfee;i="6800,10657,11761"; a="87746807"
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="87746807"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Apr 2026 06:08:52 -0700
X-CSE-ConnectionGUID: 1Uej9Yq6TxK4X3D2xjURwA==
X-CSE-MsgGUID: S00rbwfzQnOaF/h+QCUurQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,184,1770624000"; 
   d="scan'208";a="230954000"
Received: from lkp-server01.sh.intel.com (HELO 7e48d0ff8e22) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 17 Apr 2026 06:08:51 -0700
Received: from kbuild by 7e48d0ff8e22 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDiwC-000000000NU-26Hz;
	Fri, 17 Apr 2026 13:08:48 +0000
Date: Fri, 17 Apr 2026 21:07:57 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Borkmann <daniel@iogearbox.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [cilium:pr/v6fix 11/11] net/ipv6/exthdrs_core.c:77:38:
 error: 'struct net' has no member named 'ipv6'; did you mean 'ipv4'?
Message-ID: <202604172120.cto1zuYh-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/cilium/linux.git pr/v6fix
head:   9af2f31e06cb3dd2f2d62545b4fc6ae8b94ebdaa
commit: 9af2f31e06cb3dd2f2d62545b4fc6ae8b94ebdaa [11/11] ipv6: Implement limits on extension header parsing
config: parisc-randconfig-r073-20260417 (https://download.01.org/0day-ci/archive/20260417/202604172120.cto1zuYh-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 9.5.0
smatch: v0.5.0-9007-gcf3ea02b
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260417/202604172120.cto1zuYh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604172120.cto1zuYh-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/inet_sock.h:24,
                    from include/net/inet_connection_sock.h:21,
                    from include/linux/tcp.h:20,
                    from include/linux/ipv6.h:103,
                    from include/net/ipv6.h:12,
                    from net/ipv6/exthdrs_core.c:9:
   include/net/request_sock.h: In function 'skb_steal_sock':
   include/net/request_sock.h:117:29: error: 'sock_pfree_ref' undeclared (first use in this function); did you mean 'sock_kfree_s'?
     117 |          skb->destructor == sock_pfree_ref;
         |                             ^~~~~~~~~~~~~~
         |                             sock_kfree_s
   include/net/request_sock.h:117:29: note: each undeclared identifier is reported only once for each function it appears in
   In file included from <command-line>:
   net/ipv6/exthdrs_core.c: In function 'ipv6_skip_exthdr':
>> net/ipv6/exthdrs_core.c:77:38: error: 'struct net' has no member named 'ipv6'; did you mean 'ipv4'?
      77 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                      ^~~~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
     686 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     706 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/exthdrs_core.c:77:19: note: in expansion of macro 'READ_ONCE'
      77 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                   ^~~~~~~~~
>> net/ipv6/exthdrs_core.c:77:38: error: 'struct net' has no member named 'ipv6'; did you mean 'ipv4'?
      77 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                      ^~~~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
     686 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     706 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/exthdrs_core.c:77:19: note: in expansion of macro 'READ_ONCE'
      77 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                   ^~~~~~~~~
>> net/ipv6/exthdrs_core.c:77:38: error: 'struct net' has no member named 'ipv6'; did you mean 'ipv4'?
      77 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                      ^~~~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
     686 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     706 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/exthdrs_core.c:77:19: note: in expansion of macro 'READ_ONCE'
      77 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                   ^~~~~~~~~
>> net/ipv6/exthdrs_core.c:77:38: error: 'struct net' has no member named 'ipv6'; did you mean 'ipv4'?
      77 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                      ^~~~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
     686 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     706 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/exthdrs_core.c:77:19: note: in expansion of macro 'READ_ONCE'
      77 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                   ^~~~~~~~~
>> net/ipv6/exthdrs_core.c:77:38: error: 'struct net' has no member named 'ipv6'; did you mean 'ipv4'?
      77 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                      ^~~~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
     686 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     706 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/exthdrs_core.c:77:19: note: in expansion of macro 'READ_ONCE'
      77 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                   ^~~~~~~~~
>> net/ipv6/exthdrs_core.c:77:38: error: 'struct net' has no member named 'ipv6'; did you mean 'ipv4'?
      77 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                      ^~~~
   include/linux/compiler_types.h:633:13: note: in definition of macro '__unqual_scalar_typeof'
     633 |   _Generic((x),      \
         |             ^
   include/asm-generic/rwonce.h:50:2: note: in expansion of macro '__READ_ONCE'
      50 |  __READ_ONCE(x);       \
         |  ^~~~~~~~~~~
   net/ipv6/exthdrs_core.c:77:19: note: in expansion of macro 'READ_ONCE'
      77 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                   ^~~~~~~~~
   In file included from ./arch/parisc/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:372,
                    from include/linux/export.h:5,
                    from net/ipv6/exthdrs_core.c:6:
>> net/ipv6/exthdrs_core.c:77:38: error: 'struct net' has no member named 'ipv6'; did you mean 'ipv4'?
      77 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                      ^~~~
   include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ_ONCE'
      44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                                                                        ^
   net/ipv6/exthdrs_core.c:77:19: note: in expansion of macro 'READ_ONCE'
      77 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                   ^~~~~~~~~
   In file included from <command-line>:
   net/ipv6/exthdrs_core.c: In function 'ipv6_find_hdr':
   net/ipv6/exthdrs_core.c:197:38: error: 'struct net' has no member named 'ipv6'; did you mean 'ipv4'?
     197 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                      ^~~~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
     686 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     706 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/exthdrs_core.c:197:19: note: in expansion of macro 'READ_ONCE'
     197 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                   ^~~~~~~~~
   net/ipv6/exthdrs_core.c:197:38: error: 'struct net' has no member named 'ipv6'; did you mean 'ipv4'?
     197 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                      ^~~~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
     686 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     706 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/exthdrs_core.c:197:19: note: in expansion of macro 'READ_ONCE'
     197 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                   ^~~~~~~~~
   net/ipv6/exthdrs_core.c:197:38: error: 'struct net' has no member named 'ipv6'; did you mean 'ipv4'?
     197 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                      ^~~~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
     686 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     706 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/exthdrs_core.c:197:19: note: in expansion of macro 'READ_ONCE'
     197 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                   ^~~~~~~~~
   net/ipv6/exthdrs_core.c:197:38: error: 'struct net' has no member named 'ipv6'; did you mean 'ipv4'?
     197 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                      ^~~~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
     686 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:706:2: note: in expansion of macro '_compiletime_assert'
     706 |  _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compiletime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__native_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compiletime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/ipv6/exthdrs_core.c:197:19: note: in expansion of macro 'READ_ONCE'
     197 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                   ^~~~~~~~~
   net/ipv6/exthdrs_core.c:197:38: error: 'struct net' has no member named 'ipv6'; did you mean 'ipv4'?
     197 |  int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
         |                                      ^~~~
   include/linux/compiler_types.h:686:9: note: in definition of macro '__compiletime_assert'
     686 |   if (!(condition))     \
         |         ^~~~~~~~~


vim +77 net/ipv6/exthdrs_core.c

    28	
    29	/*
    30	 * Skip any extension headers. This is used by the ICMP module.
    31	 *
    32	 * Note that strictly speaking this conflicts with RFC 2460 4.0:
    33	 * ...The contents and semantics of each extension header determine whether
    34	 * or not to proceed to the next header.  Therefore, extension headers must
    35	 * be processed strictly in the order they appear in the packet; a
    36	 * receiver must not, for example, scan through a packet looking for a
    37	 * particular kind of extension header and process that header prior to
    38	 * processing all preceding ones.
    39	 *
    40	 * We do exactly this. This is a protocol bug. We can't decide after a
    41	 * seeing an unknown discard-with-error flavour TLV option if it's a
    42	 * ICMP error message or not (errors should never be send in reply to
    43	 * ICMP error messages).
    44	 *
    45	 * But I see no other way to do this. This might need to be reexamined
    46	 * when Linux implements ESP (and maybe AUTH) headers.
    47	 * --AK
    48	 *
    49	 * This function parses (probably truncated) exthdr set "hdr".
    50	 * "nexthdrp" initially points to some place,
    51	 * where type of the first header can be found.
    52	 *
    53	 * It skips all well-known exthdrs, and returns pointer to the start
    54	 * of unparsable area i.e. the first header with unknown type.
    55	 * If it is not NULL *nexthdr is updated by type/protocol of this header.
    56	 *
    57	 * NOTES: - if packet terminated with NEXTHDR_NONE it returns NULL.
    58	 *        - it may return pointer pointing beyond end of packet,
    59	 *	    if the last recognized header is truncated in the middle.
    60	 *        - if packet is truncated, so that all parsed headers are skipped,
    61	 *	    it returns NULL.
    62	 *	  - First fragment header is skipped, not-first ones
    63	 *	    are considered as unparsable.
    64	 *	  - Reports the offset field of the final fragment header so it is
    65	 *	    possible to tell whether this is a first fragment, later fragment,
    66	 *	    or not fragmented.
    67	 *	  - ESP is unparsable for now and considered like
    68	 *	    normal payload protocol.
    69	 *	  - Note also special handling of AUTH header. Thanks to IPsec wizards.
    70	 *
    71	 * --ANK (980726)
    72	 */
    73	
    74	int ipv6_skip_exthdr(const struct sk_buff *skb, int start, u8 *nexthdrp,
    75			     __be16 *frag_offp)
    76	{
  > 77		int exthdr_max = READ_ONCE(init_net.ipv6.sysctl.max_ext_hdrs_cnt);
    78		u8 nexthdr = *nexthdrp;
    79		int exthdr_cnt = 0;
    80	
    81		*frag_offp = 0;
    82	
    83		while (ipv6_ext_hdr(nexthdr)) {
    84			struct ipv6_opt_hdr _hdr, *hp;
    85			int hdrlen;
    86	
    87			if (unlikely(exthdr_cnt++ >= exthdr_max))
    88				return -1;
    89			if (nexthdr == NEXTHDR_NONE)
    90				return -1;
    91			hp = skb_header_pointer(skb, start, sizeof(_hdr), &_hdr);
    92			if (!hp)
    93				return -1;
    94			if (nexthdr == NEXTHDR_FRAGMENT) {
    95				__be16 _frag_off, *fp;
    96				fp = skb_header_pointer(skb,
    97							start+offsetof(struct frag_hdr,
    98								       frag_off),
    99							sizeof(_frag_off),
   100							&_frag_off);
   101				if (!fp)
   102					return -1;
   103	
   104				*frag_offp = *fp;
   105				if (ntohs(*frag_offp) & ~0x7)
   106					break;
   107				hdrlen = 8;
   108			} else if (nexthdr == NEXTHDR_AUTH)
   109				hdrlen = ipv6_authlen(hp);
   110			else
   111				hdrlen = ipv6_optlen(hp);
   112	
   113			nexthdr = hp->nexthdr;
   114			start += hdrlen;
   115		}
   116	
   117		*nexthdrp = nexthdr;
   118		return start;
   119	}
   120	EXPORT_SYMBOL(ipv6_skip_exthdr);
   121	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
