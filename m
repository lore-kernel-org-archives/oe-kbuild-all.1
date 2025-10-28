Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E80E29C35A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 14:01:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761660077; cv=none; b=k1vN6/uRMFDSARtRSaioPINnWrgcOMQRvoPpXVmuY3Y44q+xujY8cKwR/Xx43Fvn9oCl7ReLrFY0iuREQB+HDCY8ih4NkN+WcXcwdpzf1SODTLDySb5esAMX2f0XCRclQ0Tv5+UIk1Ii+V1yx3GH5cHpANK//BqzHQx/QlfSpUM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761660077; c=relaxed/simple;
	bh=yTbsU5fL32Tr2GhF7ft9Im0CqqJmnanmWpNMRTTTCrs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q763PeSJbC45r18HnJYs2thTDNurl1K6anAhGj/e1rgMWAUG3mI71e2lmrHWjHpynZzWnXQxtptV+8VHOWdctzqmqdLGUGhHcMVqaEnM9ngWmaBLAy4/Ogvd5clyv0ewTotK8c25jHpZLNvWLn78bSH5z+b9w4RBknm3HqtAMBI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=CZljF5YK; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="CZljF5YK"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761660074; x=1793196074;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=yTbsU5fL32Tr2GhF7ft9Im0CqqJmnanmWpNMRTTTCrs=;
  b=CZljF5YKxd8CxgZmh6F0tbK+MsCLNdHM4rk11aXMbmb0MUUwHGtHKKrd
   GWasPjFxBn0fnEYW22db4MaYDJ3pujwzvDVM2y7FU5GoXuJcplsKbt733
   iReipkkcIm2omRl6Ajrs1KolDqhu9hGDS4XaZXFLPr1hfsrD8D6cgYwQX
   ivuCewH4eqX3RYHrxLVi8pqN6DWrLX48C7Eq11dm9sztM+C/WfzrAeaj9
   a5ato48k8fyJRjvETFVywltiV+iHbz7GNEA981MiA7Soz6s26zcPKuEII
   2mOM5P0x0N2zJHJR185sj1w4P2J21Ahp2n5/cVXPHuzhN9HFrfLg9I8Ip
   A==;
X-CSE-ConnectionGUID: qpxZOIBcTJi1mDKK1kGw2A==
X-CSE-MsgGUID: hwRKeIGITIGmyeGyRtDLNQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="62964312"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="62964312"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 07:01:13 -0700
X-CSE-ConnectionGUID: UVRqYVuKSrWlsr1ALsXGGQ==
X-CSE-MsgGUID: MRYt7MwCQzehp4N/QFqYfw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="185677361"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa008.fm.intel.com with ESMTP; 28 Oct 2025 07:01:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDkG6-000JBb-0a;
	Tue, 28 Oct 2025 14:01:10 +0000
Date: Tue, 28 Oct 2025 22:00:24 +0800
From: kernel test robot <lkp@intel.com>
To: David Ahern <dsahern@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dsahern:netdevsim-speed 1/1]
 drivers/net/netdevsim/ethtool.c:236:66: error: pasting ")" and "_BIT" does
 not give a valid preprocessing token
Message-ID: <202510282136.k3sjWcCl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/dsahern/linux netdevsim-speed
head:   ae20d62bc3e42f44ed7113d792ceb545036ca61d
commit: ae20d62bc3e42f44ed7113d792ceb545036ca61d [1/1] netdevsim: Add ability to change speed via ethtool APIs
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20251028/202510282136.k3sjWcCl-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 15.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510282136.k3sjWcCl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510282136.k3sjWcCl-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/net/netdevsim/netdevsim.h:18,
                    from drivers/net/netdevsim/ethtool.c:8:
   drivers/net/netdevsim/ethtool.c: In function 'nsim_get_link_ksettings':
>> include/linux/ethtool.h:260:19: error: pasting "ETHTOOL_LINK_MODE_" and "(" does not give a valid preprocessing token
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                   ^~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/netdevsim/ethtool.c:236:66: error: pasting ")" and "_BIT" does not give a valid preprocessing token
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |                                                                  ^
   include/linux/ethtool.h:260:41: note: in definition of macro 'ethtool_link_ksettings_add_link_mode'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                         ^~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/thread_info.h:27,
                    from include/asm-generic/preempt.h:5,
                    from ./arch/sh/include/generated/asm/preempt.h:1,
                    from include/linux/preempt.h:79,
                    from include/linux/spinlock.h:56,
                    from include/linux/wait.h:9,
                    from include/linux/wait_bit.h:8,
                    from include/linux/fs.h:7,
                    from include/linux/debugfs.h:15,
                    from drivers/net/netdevsim/ethtool.c:4:
>> include/linux/ethtool.h:260:19: error: implicit declaration of function 'ETHTOOL_LINK_MODE_' [-Wimplicit-function-declaration]
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                   ^~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/netdevsim/ethtool.c:239:32: error: 'Autoneg' undeclared (first use in this function)
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |                                ^~~~~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:32: note: each undeclared identifier is reported only once for each function it appears in
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |                                ^~~~~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                                 ^~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:43:31: note: to match this '('
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                               ^
   include/linux/bitops.h:53:41: note: in expansion of macro 'bitop'
      53 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
         |                                         ^~~~~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                                 ^~~~
   include/linux/bitops.h:47:20: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                    ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:47:19: note: to match this '('
      47 |          const##op(nr, addr) : op(nr, addr))
         |                   ^
   include/linux/bitops.h:53:41: note: in expansion of macro 'bitop'
      53 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
         |                                         ^~~~~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   In file included from include/linux/bitops.h:28:
>> include/asm-generic/bitops/generic-non-atomic.h:147:41: error: too few arguments to function 'generic___set_bit'; expected 2, have 1
     147 | #define const___set_bit                 generic___set_bit
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/bitops.h:47:10: note: in expansion of macro 'const___set_bit'
      47 |          const##op(nr, addr) : op(nr, addr))
         |          ^~~~~
   include/linux/bitops.h:53:41: note: in expansion of macro 'bitop'
      53 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
         |                                         ^~~~~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:28:1: note: declared here
      28 | generic___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
>> include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                                 ^~~~
   include/linux/bitops.h:47:35: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                   ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:47:34: note: to match this '('
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                  ^
   include/linux/bitops.h:53:41: note: in expansion of macro 'bitop'
      53 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
         |                                         ^~~~~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/bitops/non-atomic.h:7:24: error: too few arguments to function 'generic___set_bit'; expected 2, have 1
       7 | #define arch___set_bit generic___set_bit
         |                        ^~~~~~~~~~~~~~~~~
   include/linux/bitops.h:47:32: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                ^~
   include/asm-generic/bitops/non-instrumented-non-atomic.h:6:33: note: in expansion of macro 'arch___set_bit'
       6 | #define ___set_bit              arch___set_bit
         |                                 ^~~~~~~~~~~~~~
   include/linux/bitops.h:53:47: note: in expansion of macro '___set_bit'
      53 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
         |                                               ^~~~~~~~~~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:28:1: note: declared here
      28 | generic___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
>> include/linux/ethtool.h:260:19: error: pasting "ETHTOOL_LINK_MODE_" and "(" does not give a valid preprocessing token
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                   ^~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:68: error: pasting ")" and "_BIT" does not give a valid preprocessing token
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |                                                                    ^
   include/linux/ethtool.h:260:41: note: in definition of macro 'ethtool_link_ksettings_add_link_mode'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                         ^~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                                 ^~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:43:31: note: to match this '('
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                               ^
   include/linux/bitops.h:53:41: note: in expansion of macro 'bitop'
      53 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
         |                                         ^~~~~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                                 ^~~~
   include/linux/bitops.h:47:20: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                    ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:47:19: note: to match this '('
      47 |          const##op(nr, addr) : op(nr, addr))
         |                   ^
   include/linux/bitops.h:53:41: note: in expansion of macro 'bitop'
      53 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
         |                                         ^~~~~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/bitops/generic-non-atomic.h:147:41: error: too few arguments to function 'generic___set_bit'; expected 2, have 1
     147 | #define const___set_bit                 generic___set_bit
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/bitops.h:47:10: note: in expansion of macro 'const___set_bit'
      47 |          const##op(nr, addr) : op(nr, addr))
         |          ^~~~~
   include/linux/bitops.h:53:41: note: in expansion of macro 'bitop'
      53 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
         |                                         ^~~~~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:28:1: note: declared here
      28 | generic___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
>> include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                                 ^~~~
   include/linux/bitops.h:47:35: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                   ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:47:34: note: to match this '('
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                  ^
   include/linux/bitops.h:53:41: note: in expansion of macro 'bitop'
      53 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
         |                                         ^~~~~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/bitops/non-atomic.h:7:24: error: too few arguments to function 'generic___set_bit'; expected 2, have 1
       7 | #define arch___set_bit generic___set_bit
         |                        ^~~~~~~~~~~~~~~~~
   include/linux/bitops.h:47:32: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                ^~
   include/asm-generic/bitops/non-instrumented-non-atomic.h:6:33: note: in expansion of macro 'arch___set_bit'
       6 | #define ___set_bit              arch___set_bit
         |                                 ^~~~~~~~~~~~~~
   include/linux/bitops.h:53:47: note: in expansion of macro '___set_bit'
      53 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
         |                                               ^~~~~~~~~~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:28:1: note: declared here
      28 | generic___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
>> include/linux/ethtool.h:260:19: error: pasting "ETHTOOL_LINK_MODE_" and "(" does not give a valid preprocessing token
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                   ^~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/netdevsim/ethtool.c:236:66: error: pasting ")" and "_BIT" does not give a valid preprocessing token
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |                                                                  ^
   include/linux/ethtool.h:260:41: note: in definition of macro 'ethtool_link_ksettings_add_link_mode'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                         ^~~~
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/netdevsim/ethtool.c:240:32: error: invalid suffix 'baseT_Full' on integer constant
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |                                ^~~~~~~~~~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                                 ^~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:43:31: note: to match this '('
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                               ^
   include/linux/bitops.h:53:41: note: in expansion of macro 'bitop'
      53 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
         |                                         ^~~~~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> drivers/net/netdevsim/ethtool.c:240:32: error: invalid suffix 'baseT_Full' on integer constant
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |                                ^~~~~~~~~~~~
   include/linux/bitops.h:47:20: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                    ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                                 ^~~~
   include/linux/bitops.h:47:20: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                    ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:47:19: note: to match this '('
      47 |          const##op(nr, addr) : op(nr, addr))
         |                   ^
   include/linux/bitops.h:53:41: note: in expansion of macro 'bitop'
      53 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
         |                                         ^~~~~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:147:41: error: too few arguments to function 'generic___set_bit'; expected 2, have 1
     147 | #define const___set_bit                 generic___set_bit
         |                                         ^~~~~~~~~~~~~~~~~
   include/linux/bitops.h:47:10: note: in expansion of macro 'const___set_bit'
      47 |          const##op(nr, addr) : op(nr, addr))
         |          ^~~~~
   include/linux/bitops.h:53:41: note: in expansion of macro 'bitop'
      53 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
         |                                         ^~~~~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:28:1: note: declared here
      28 | generic___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:32: error: invalid suffix 'baseT_Full' on integer constant
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |                                ^~~~~~~~~~~~
   include/linux/bitops.h:47:35: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                   ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                                 ^~~~
   include/linux/bitops.h:47:35: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                   ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/bitops.h:47:34: note: to match this '('
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                  ^
   include/linux/bitops.h:53:41: note: in expansion of macro 'bitop'
      53 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
..


vim +236 drivers/net/netdevsim/ethtool.c

   226	
   227	static int nsim_get_link_ksettings(struct net_device *dev,
   228					  struct ethtool_link_ksettings *ks)
   229	{
   230		struct netdevsim *ns = netdev_priv(dev);
   231	
   232		ethtool_link_ksettings_zero_link_mode(ks, supported);
   233	        ethtool_link_ksettings_zero_link_mode(ks, advertising);
   234	
   235	#define NETDEVSIM_ETHTOOL_MODE(mode) \
 > 236		ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
   237		ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
   238	
 > 239		NETDEVSIM_ETHTOOL_MODE(Autoneg);
 > 240		NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
   241		NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
   242		NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
   243		NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
   244	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
