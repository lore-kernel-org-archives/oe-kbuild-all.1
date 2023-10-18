Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E59E511C80
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Oct 2023 11:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lJLvQCDd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697626874; x=1729162874;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=b7hfNspF9ey+2tGUTcWz1QyeYYFPkrt3Dt1lwu5N8Ig=;
  b=lJLvQCDd8mqfialraan/+nwUYPCUwQCF1275/QxOVxXfQ1xerHMjIW3Z
   lrO3DPCSQmtJYSXckjDOkk1+zvyVf/04rG/QvMHr8wYFKuG7JuED/1qLc
   IsYgIcFHZT/Oi+YmAHKVsEve5zSMdU9nSLL5WwXngRFYwPuGgU5vq6MTd
   Zl6rG8TIsHhu5D1PeA0jtyl4YljX9uBYGLYfI0h4kOZvw9ALTBdz1Iqse
   NnmT6dGj/QtQc4Wi6cFHb22YYLkiH3Vj1Jz9A3I7051cdDoUQTw/a+G/z
   nL8KaxlbfaJLXhux+eW0/KT8CIqryRM6Bv1u3wQhKW5WlBO23YuOIwdBG
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="452457523"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="452457523"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Oct 2023 04:01:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10866"; a="847236161"
X-IronPort-AV: E=Sophos;i="6.03,234,1694761200"; 
   d="scan'208";a="847236161"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by FMSMGA003.fm.intel.com with ESMTP; 18 Oct 2023 04:00:35 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qt4Hx-0000Gf-0E;
	Wed, 18 Oct 2023 11:00:33 +0000
Date: Wed, 18 Oct 2023 18:59:33 +0800
From: kernel test robot <lkp@intel.com>
To: Eric Dumazet <edumazet@google.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Paolo Abeni <pabeni@redhat.com>, David Ahern <dsahern@kernel.org>
Subject: [linux-next:master 5136/13299] include/asm-generic/rwonce.h:44:26:
 warning: array subscript 0 is outside array bounds of '__u8[0]' {aka
 'unsigned char[]'}
Message-ID: <202310181854.pKtHd7fD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Eric,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   2dac75696c6da3c848daa118a729827541c89d33
commit: fa17a6d8a5bd0cd7565b613cb804242cd0f6b7ab [5136/13299] ipv6: lockless IPV6_ADDR_PREFERENCES implementation
config: alpha-defconfig (https://download.01.org/0day-ci/archive/20231018/202310181854.pKtHd7fD-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231018/202310181854.pKtHd7fD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310181854.pKtHd7fD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from arch/alpha/include/asm/rwonce.h:33,
                    from include/linux/compiler.h:246,
                    from include/linux/string.h:5,
                    from net/sunrpc/xprtsock.c:23:
   In function 'ip6_sock_set_addr_preferences',
       inlined from 'xs_tcp_finish_connecting' at net/sunrpc/xprtsock.c:2325:4,
       inlined from 'xs_tcp_setup_socket' at net/sunrpc/xprtsock.c:2405:11:
>> include/asm-generic/rwonce.h:44:26: warning: array subscript 0 is outside array bounds of '__u8[0]' {aka 'unsigned char[]'} [-Warray-bounds=]
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:40: note: in definition of macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                        ^~~
   include/net/ipv6.h:1365:9: note: in expansion of macro 'WRITE_ONCE'
    1365 |         WRITE_ONCE(inet6_sk(sk)->srcprefs,
         |         ^~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   include/net/ipv6.h:1366:21: note: in expansion of macro 'READ_ONCE'
    1366 |                    (READ_ONCE(inet6_sk(sk)->srcprefs) & prefmask) | pref);
         |                     ^~~~~~~~~
   In function 'xs_tcp_setup_socket':
   cc1: note: source object is likely at address zero
   In function 'ip6_sock_set_addr_preferences',
       inlined from 'xs_tcp_finish_connecting' at net/sunrpc/xprtsock.c:2325:4,
       inlined from 'xs_tcp_setup_socket' at net/sunrpc/xprtsock.c:2405:11:
   include/asm-generic/rwonce.h:55:37: warning: array subscript 0 is outside array bounds of '__u8[0]' {aka 'unsigned char[]'} [-Warray-bounds=]
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/asm-generic/rwonce.h:61:9: note: in expansion of macro '__WRITE_ONCE'
      61 |         __WRITE_ONCE(x, val);                                           \
         |         ^~~~~~~~~~~~
   include/net/ipv6.h:1365:9: note: in expansion of macro 'WRITE_ONCE'
    1365 |         WRITE_ONCE(inet6_sk(sk)->srcprefs,
         |         ^~~~~~~~~~
   In function 'xs_tcp_setup_socket':
   cc1: note: source object is likely at address zero
   In function 'ip6_sock_set_addr_preferences',
       inlined from 'xs_tcp_tls_finish_connecting' at net/sunrpc/xprtsock.c:2478:4:
>> include/asm-generic/rwonce.h:44:26: warning: array subscript 0 is outside array bounds of '__u8[0]' {aka 'unsigned char[]'} [-Warray-bounds=]
      44 | #define __READ_ONCE(x)  (*(const volatile __unqual_scalar_typeof(x) *)&(x))
         |                         ~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:55:40: note: in definition of macro '__WRITE_ONCE'
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |                                        ^~~
   include/net/ipv6.h:1365:9: note: in expansion of macro 'WRITE_ONCE'
    1365 |         WRITE_ONCE(inet6_sk(sk)->srcprefs,
         |         ^~~~~~~~~~
   include/asm-generic/rwonce.h:50:9: note: in expansion of macro '__READ_ONCE'
      50 |         __READ_ONCE(x);                                                 \
         |         ^~~~~~~~~~~
   include/net/ipv6.h:1366:21: note: in expansion of macro 'READ_ONCE'
    1366 |                    (READ_ONCE(inet6_sk(sk)->srcprefs) & prefmask) | pref);
         |                     ^~~~~~~~~
   In function 'xs_tcp_tls_finish_connecting':
   cc1: note: source object is likely at address zero
   In function 'ip6_sock_set_addr_preferences',
       inlined from 'xs_tcp_tls_finish_connecting' at net/sunrpc/xprtsock.c:2478:4:
   include/asm-generic/rwonce.h:55:37: warning: array subscript 0 is outside array bounds of '__u8[0]' {aka 'unsigned char[]'} [-Warray-bounds=]
      55 |         *(volatile typeof(x) *)&(x) = (val);                            \
         |         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~
   include/asm-generic/rwonce.h:61:9: note: in expansion of macro '__WRITE_ONCE'
      61 |         __WRITE_ONCE(x, val);                                           \
         |         ^~~~~~~~~~~~
   include/net/ipv6.h:1365:9: note: in expansion of macro 'WRITE_ONCE'
    1365 |         WRITE_ONCE(inet6_sk(sk)->srcprefs,
         |         ^~~~~~~~~~
   In function 'xs_tcp_tls_finish_connecting':
   cc1: note: source object is likely at address zero


vim +44 include/asm-generic/rwonce.h

e506ea451254ab Will Deacon 2019-10-15  28  
e506ea451254ab Will Deacon 2019-10-15  29  /*
e506ea451254ab Will Deacon 2019-10-15  30   * Yes, this permits 64-bit accesses on 32-bit architectures. These will
e506ea451254ab Will Deacon 2019-10-15  31   * actually be atomic in some cases (namely Armv7 + LPAE), but for others we
e506ea451254ab Will Deacon 2019-10-15  32   * rely on the access being split into 2x32-bit accesses for a 32-bit quantity
e506ea451254ab Will Deacon 2019-10-15  33   * (e.g. a virtual address) and a strong prevailing wind.
e506ea451254ab Will Deacon 2019-10-15  34   */
e506ea451254ab Will Deacon 2019-10-15  35  #define compiletime_assert_rwonce_type(t)					\
e506ea451254ab Will Deacon 2019-10-15  36  	compiletime_assert(__native_word(t) || sizeof(t) == sizeof(long long),	\
e506ea451254ab Will Deacon 2019-10-15  37  		"Unsupported access size for {READ,WRITE}_ONCE().")
e506ea451254ab Will Deacon 2019-10-15  38  
e506ea451254ab Will Deacon 2019-10-15  39  /*
e506ea451254ab Will Deacon 2019-10-15  40   * Use __READ_ONCE() instead of READ_ONCE() if you do not require any
3c9184109e78ea Will Deacon 2019-10-30  41   * atomicity. Note that this may result in tears!
e506ea451254ab Will Deacon 2019-10-15  42   */
b78b331a3f5c07 Will Deacon 2019-10-15  43  #ifndef __READ_ONCE
e506ea451254ab Will Deacon 2019-10-15 @44  #define __READ_ONCE(x)	(*(const volatile __unqual_scalar_typeof(x) *)&(x))
b78b331a3f5c07 Will Deacon 2019-10-15  45  #endif
e506ea451254ab Will Deacon 2019-10-15  46  

:::::: The code at line 44 was first introduced by commit
:::::: e506ea451254ab17e0bf918ca36232fec2a9b10c compiler.h: Split {READ,WRITE}_ONCE definitions out into rwonce.h

:::::: TO: Will Deacon <will@kernel.org>
:::::: CC: Will Deacon <will@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
