Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4826274FEF
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 13:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761743000; cv=none; b=bo64opBqVLrZFuLd/tcIH4NWvNCB0gpCYrsLONTzFVaWeGjpGLLVXUit2KIsLLuap2zNxYq/twiNdMJRBPklOOE6bdqWqwVQ6CrulaDlYnNBH00Mi8ad9oRlgf+4NcQYXOYrUXSJIRy3mLX+uZTB7hyzmxrKd5UZZDmryfbe8T0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761743000; c=relaxed/simple;
	bh=Fun4tpXfcsZYC1JXDjqkLkfa+U8FzldC4kYIzg1BW9g=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f5od92TvsH6F+jcmfQWwI2uWFVDItudyvex0tQvoMfNwcd8yrlAOFTLyWFkzk36mjIurcrgxN+iiHGDilb1F/FZ+uiPKPbEKaD3CoH+AJLpsn7aidagsu2ix8uxOlWisU6oc80Sy5lqrOzRfIXXgtYtvwNGQ5XXRY+x9It/oxTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GdWQQKiu; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GdWQQKiu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761742997; x=1793278997;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Fun4tpXfcsZYC1JXDjqkLkfa+U8FzldC4kYIzg1BW9g=;
  b=GdWQQKiuyMHOvo3LpxHaB2owhRTTWqFUu4ST9pT+05LQM+N5aKu2FK2P
   pWq4/t2AdkYF/v4qnYIw9FgsDv7CYWWJ3EnMDOeV/kT+0jt9/NzjbUW6C
   o+v8/Z4Emf6E5pB4LLg+j7sl02AwlUh4vKXvoXxrJNerm11M3j1dRFxfN
   fq8W4xSDRdw2pAOGzTuCUDM0fH6VqL6/KiFCwK/lpakGav+nxKX9r57Qu
   Pw4XcZriyCdn5QTgURDL1evATH4MSKtvdghdKdfi0va1JgQTaForzi+/e
   X3s3/WLz7xhOj905Qt7NqjI6kfhdpPIMmkqDt4kFxgQ8D9RPENVGDnL1J
   w==;
X-CSE-ConnectionGUID: hY7P7odGT/WQH3+NB+dYjw==
X-CSE-MsgGUID: pbRpuhToQWqV6sqNKl0unA==
X-IronPort-AV: E=McAfee;i="6800,10657,11596"; a="74538746"
X-IronPort-AV: E=Sophos;i="6.19,264,1754982000"; 
   d="scan'208";a="74538746"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 06:03:17 -0700
X-CSE-ConnectionGUID: 3KjoiJk1SgmMjYDOWa+WDg==
X-CSE-MsgGUID: TmPFf4nxTkCVn6KYo/u5hg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="189728499"
Received: from igk-lkp-server01.igk.intel.com (HELO c2fcd27ee2f4) ([10.211.93.152])
  by orviesa003.jf.intel.com with ESMTP; 29 Oct 2025 06:03:11 -0700
Received: from kbuild by c2fcd27ee2f4 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vE5pW-000000000vE-2pMR;
	Wed, 29 Oct 2025 13:03:10 +0000
Date: Wed, 29 Oct 2025 14:02:33 +0100
From: kernel test robot <lkp@intel.com>
To: David Ahern <dsahern@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dsahern:netdevsim-speed 1/1]
 drivers/net/netdevsim/ethtool.c:236:66: error: pasting ")" and "_BIT" does
 not give a valid preprocessing token
Message-ID: <202510291417.ajHJ4rB4-lkp@intel.com>
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
config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20251029/202510291417.ajHJ4rB4-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291417.ajHJ4rB4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291417.ajHJ4rB4-lkp@intel.com/

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
                    from include/linux/spinlock.h:60,
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
>> include/asm-generic/bitops/generic-non-atomic.h:147:41: error: too few arguments to function 'generic___set_bit'
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
>> include/linux/bitops.h:53:47: error: too few arguments to function '___set_bit'
      53 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
         |                                               ^~~~~~~~~~
   include/linux/bitops.h:47:32: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
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
   In file included from arch/x86/include/asm/bitops.h:424,
                    from include/linux/bitops.h:67:
   include/asm-generic/bitops/instrumented-non-atomic.h:26:1: note: declared here
      26 | ___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~
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
>> include/asm-generic/bitops/generic-non-atomic.h:147:41: error: too few arguments to function 'generic___set_bit'
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
>> include/linux/bitops.h:53:47: error: too few arguments to function '___set_bit'
      53 | #define __set_bit(nr, addr)             bitop(___set_bit, nr, addr)
         |                                               ^~~~~~~~~~
   include/linux/bitops.h:47:32: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
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
   include/asm-generic/bitops/instrumented-non-atomic.h:26:1: note: declared here
      26 | ___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~
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
>> drivers/net/netdevsim/ethtool.c:240:32: error: invalid suffix "baseT_Full" on integer constant
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
>> drivers/net/netdevsim/ethtool.c:240:32: error: invalid suffix "baseT_Full" on integer constant
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
   include/asm-generic/bitops/generic-non-atomic.h:147:41: error: too few arguments to function 'generic___set_bit'
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
   drivers/net/netdevsim/ethtool.c:240:32: error: invalid suffix "baseT_Full" on integer constant
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
