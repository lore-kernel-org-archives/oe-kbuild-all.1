Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B0B431770F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 28 Oct 2025 14:20:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761661213; cv=none; b=hMxgcEPTbOw76RjbHASZfmz9TwKAVuyuanUvtVQl0jzRXvg0Ludf6+lNOwhf1EHk6EK3dN3MjmJZzmXIqKGGGJmq11rX68TY0gPa8yCNd2maX2Ap6RYyI3+wSABXkDF1F0Ze/EDXvRG+idw2rCOZ5xRgUB4qYIu9l1eDQJf+B+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761661213; c=relaxed/simple;
	bh=uzAi3ikuDvDJ6zAM1uQH0PW7cK35v1U0AxmZxlBSHQQ=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=dOCbzpXDDsxA2Wa7UQGXYGaZJD6eiswwDjr939tcbv3TvdSipGzwLcujRfRS5vFkSbL5vzqHdXWhBsuuerAoj7bWhQCsNmEIoomnIjvstra6wg/oAjtujdzP2BqPdx8k4iJLawjkdgcY6VwB6zELtdWQ7FbEUgwLCjiU2qr8Dpc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DveCNw1b; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DveCNw1b"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761661209; x=1793197209;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=uzAi3ikuDvDJ6zAM1uQH0PW7cK35v1U0AxmZxlBSHQQ=;
  b=DveCNw1bbeo0A2tvM28hyqDB+QBL2Lcz3F1z4Z3LhXMXtUEmfZWCy4V0
   YpwjdB4tgSCmdnBypZkP7MlXcKZBK2Ohzngwxscn/vdMMZ6bXz3qGqVoF
   BLQXIJOPs4BD9S3QlaQWtyJ1XilSbcUM4Bwb5P9rdgTbr6tmC+FWVpuZU
   LCFS4mRVtrQGD9Ii5wgLSEofjF7TGafGftPPG+GJ5KGUtZPWvgUrMQEcM
   AReG42qUPSEX6El1ZsGlDRtL+1bh/sT5ljrv6RrXTeggEnP2JLcQ6AkZ6
   NMQQIC9YtcXRB2IvkAEhEmIzNcfXPFSGTuINLAcs67jb4GLU/AhnLU10+
   A==;
X-CSE-ConnectionGUID: SKhS2n+yT5WkodXGJyECoQ==
X-CSE-MsgGUID: 2BKwkxwPQiKXSgoISN+P/w==
X-IronPort-AV: E=McAfee;i="6800,10657,11586"; a="89232838"
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="89232838"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2025 07:20:08 -0700
X-CSE-ConnectionGUID: 2/qRBdZ2SnK+ac4Z62R9CQ==
X-CSE-MsgGUID: E8o2rvSOQReM+4hm1+XwvA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,261,1754982000"; 
   d="scan'208";a="189712523"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 28 Oct 2025 07:20:05 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vDkYI-000JD1-0J;
	Tue, 28 Oct 2025 14:19:59 +0000
Date: Tue, 28 Oct 2025 22:11:27 +0800
From: kernel test robot <lkp@intel.com>
To: David Ahern <dsahern@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [dsahern:netdevsim-speed 1/1]
 include/asm-generic/bitops/generic-non-atomic.h:147:41: error: too few
 arguments to function 'generic___set_bit'
Message-ID: <202510282255.2U05lqNh-lkp@intel.com>
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
config: csky-randconfig-r071-20251028 (https://download.01.org/0day-ci/archive/20251028/202510282255.2U05lqNh-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 12.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251028/202510282255.2U05lqNh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510282255.2U05lqNh-lkp@intel.com/

All errors (new ones prefixed by >>):

   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     239 |         NETDEVSIM_ETHTOOL_MODE(Autoneg);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:239:32: error: 'Autoneg' undeclared (first use in this function)
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
   include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
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
>> include/asm-generic/bitops/non-atomic.h:7:24: error: too few arguments to function 'generic___set_bit'
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
   include/linux/ethtool.h:260:19: error: pasting "ETHTOOL_LINK_MODE_" and "(" does not give a valid preprocessing token
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
   include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
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
   include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
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
   include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
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
>> include/asm-generic/bitops/non-atomic.h:7:24: error: too few arguments to function 'generic___set_bit'
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
   include/linux/ethtool.h:260:19: error: pasting "ETHTOOL_LINK_MODE_" and "(" does not give a valid preprocessing token
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                   ^~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:66: error: pasting ")" and "_BIT" does not give a valid preprocessing token
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |                                                                  ^
   include/linux/ethtool.h:260:41: note: in definition of macro 'ethtool_link_ksettings_add_link_mode'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                         ^~~~
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:32: error: invalid suffix "baseT_Full" on integer constant
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
   include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
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
   drivers/net/netdevsim/ethtool.c:240:32: error: invalid suffix "baseT_Full" on integer constant
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
>> include/asm-generic/bitops/non-atomic.h:7:24: error: too few arguments to function 'generic___set_bit'
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
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:28:1: note: declared here
      28 | generic___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
   include/linux/ethtool.h:260:19: error: pasting "ETHTOOL_LINK_MODE_" and "(" does not give a valid preprocessing token
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                   ^~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:68: error: pasting ")" and "_BIT" does not give a valid preprocessing token
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |                                                                    ^
   include/linux/ethtool.h:260:41: note: in definition of macro 'ethtool_link_ksettings_add_link_mode'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                         ^~~~
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:32: error: invalid suffix "baseT_Full" on integer constant
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |                                ^~~~~~~~~~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
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
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:32: error: invalid suffix "baseT_Full" on integer constant
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |                                ^~~~~~~~~~~~
   include/linux/bitops.h:47:20: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                    ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
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
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
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
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
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
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/bitops/non-atomic.h:7:24: error: too few arguments to function 'generic___set_bit'
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
   drivers/net/netdevsim/ethtool.c:240:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     240 |         NETDEVSIM_ETHTOOL_MODE(10baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:28:1: note: declared here
      28 | generic___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
   include/linux/ethtool.h:260:19: error: pasting "ETHTOOL_LINK_MODE_" and "(" does not give a valid preprocessing token
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                   ^~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:66: error: pasting ")" and "_BIT" does not give a valid preprocessing token
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |                                                                  ^
   include/linux/ethtool.h:260:41: note: in definition of macro 'ethtool_link_ksettings_add_link_mode'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                         ^~~~
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:241:32: error: invalid suffix "baseT_Full" on integer constant
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |                                ^~~~~~~~~~~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
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
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:241:32: error: invalid suffix "baseT_Full" on integer constant
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |                                ^~~~~~~~~~~~~
   include/linux/bitops.h:47:20: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                    ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:28:1: note: declared here
      28 | generic___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:241:32: error: invalid suffix "baseT_Full" on integer constant
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |                                ^~~~~~~~~~~~~
   include/linux/bitops.h:47:35: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                   ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/bitops/non-atomic.h:7:24: error: too few arguments to function 'generic___set_bit'
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
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:28:1: note: declared here
      28 | generic___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
   include/linux/ethtool.h:260:19: error: pasting "ETHTOOL_LINK_MODE_" and "(" does not give a valid preprocessing token
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                   ^~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:68: error: pasting ")" and "_BIT" does not give a valid preprocessing token
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |                                                                    ^
   include/linux/ethtool.h:260:41: note: in definition of macro 'ethtool_link_ksettings_add_link_mode'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                         ^~~~
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:241:32: error: invalid suffix "baseT_Full" on integer constant
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |                                ^~~~~~~~~~~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
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
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:241:32: error: invalid suffix "baseT_Full" on integer constant
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |                                ^~~~~~~~~~~~~
   include/linux/bitops.h:47:20: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                    ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:28:1: note: declared here
      28 | generic___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:241:32: error: invalid suffix "baseT_Full" on integer constant
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |                                ^~~~~~~~~~~~~
   include/linux/bitops.h:47:35: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                   ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/bitops/non-atomic.h:7:24: error: too few arguments to function 'generic___set_bit'
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
   drivers/net/netdevsim/ethtool.c:241:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     241 |         NETDEVSIM_ETHTOOL_MODE(100baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:28:1: note: declared here
      28 | generic___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
   include/linux/ethtool.h:260:19: error: pasting "ETHTOOL_LINK_MODE_" and "(" does not give a valid preprocessing token
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                   ^~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:66: error: pasting ")" and "_BIT" does not give a valid preprocessing token
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |                                                                  ^
   include/linux/ethtool.h:260:41: note: in definition of macro 'ethtool_link_ksettings_add_link_mode'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                         ^~~~
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:242:32: error: invalid suffix "baseT_Full" on integer constant
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |                                ^~~~~~~~~~~~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
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
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:242:32: error: invalid suffix "baseT_Full" on integer constant
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |                                ^~~~~~~~~~~~~~
   include/linux/bitops.h:47:20: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                    ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:28:1: note: declared here
      28 | generic___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:242:32: error: invalid suffix "baseT_Full" on integer constant
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |                                ^~~~~~~~~~~~~~
   include/linux/bitops.h:47:35: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                   ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/bitops/non-atomic.h:7:24: error: too few arguments to function 'generic___set_bit'
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
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:28:1: note: declared here
      28 | generic___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
   include/linux/ethtool.h:260:19: error: pasting "ETHTOOL_LINK_MODE_" and "(" does not give a valid preprocessing token
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                   ^~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:68: error: pasting ")" and "_BIT" does not give a valid preprocessing token
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |                                                                    ^
   include/linux/ethtool.h:260:41: note: in definition of macro 'ethtool_link_ksettings_add_link_mode'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                         ^~~~
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:242:32: error: invalid suffix "baseT_Full" on integer constant
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |                                ^~~~~~~~~~~~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
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
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:242:32: error: invalid suffix "baseT_Full" on integer constant
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |                                ^~~~~~~~~~~~~~
   include/linux/bitops.h:47:20: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                    ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:28:1: note: declared here
      28 | generic___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:242:32: error: invalid suffix "baseT_Full" on integer constant
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |                                ^~~~~~~~~~~~~~
   include/linux/bitops.h:47:35: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                   ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/bitops/non-atomic.h:7:24: error: too few arguments to function 'generic___set_bit'
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
   drivers/net/netdevsim/ethtool.c:242:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     242 |         NETDEVSIM_ETHTOOL_MODE(1000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:28:1: note: declared here
      28 | generic___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
   include/linux/ethtool.h:260:19: error: pasting "ETHTOOL_LINK_MODE_" and "(" does not give a valid preprocessing token
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                   ^~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:66: error: pasting ")" and "_BIT" does not give a valid preprocessing token
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |                                                                  ^
   include/linux/ethtool.h:260:41: note: in definition of macro 'ethtool_link_ksettings_add_link_mode'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                         ^~~~
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:243:32: error: invalid suffix "baseT_Full" on integer constant
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |                                ^~~~~~~~~~~~~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
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
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:243:32: error: invalid suffix "baseT_Full" on integer constant
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |                                ^~~~~~~~~~~~~~~
   include/linux/bitops.h:47:20: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                    ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:28:1: note: declared here
      28 | generic___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:243:32: error: invalid suffix "baseT_Full" on integer constant
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |                                ^~~~~~~~~~~~~~~
   include/linux/bitops.h:47:35: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                   ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:236:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     236 |         ethtool_link_ksettings_add_link_mode(ks, supported, (mode)); \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/bitops/non-atomic.h:7:24: error: too few arguments to function 'generic___set_bit'
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
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:28:1: note: declared here
      28 | generic___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
   include/linux/ethtool.h:260:19: error: pasting "ETHTOOL_LINK_MODE_" and "(" does not give a valid preprocessing token
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                   ^~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:68: error: pasting ")" and "_BIT" does not give a valid preprocessing token
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |                                                                    ^
   include/linux/ethtool.h:260:41: note: in definition of macro 'ethtool_link_ksettings_add_link_mode'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |                                         ^~~~
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:243:32: error: invalid suffix "baseT_Full" on integer constant
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |                                ^~~~~~~~~~~~~~~
   include/linux/bitops.h:43:32: note: in definition of macro 'bitop'
      43 |         ((__builtin_constant_p(nr) &&                                   \
         |                                ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/linux/ethtool.h:260:49: error: expected ')' before '_BIT'
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
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:243:32: error: invalid suffix "baseT_Full" on integer constant
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |                                ^~~~~~~~~~~~~~~
   include/linux/bitops.h:47:20: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                    ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:28:1: note: declared here
      28 | generic___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:243:32: error: invalid suffix "baseT_Full" on integer constant
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |                                ^~~~~~~~~~~~~~~
   include/linux/bitops.h:47:35: note: in definition of macro 'bitop'
      47 |          const##op(nr, addr) : op(nr, addr))
         |                                   ^~
   include/linux/ethtool.h:260:9: note: in expansion of macro '__set_bit'
     260 |         __set_bit(ETHTOOL_LINK_MODE_ ## mode ## _BIT, (ptr)->link_modes.name)
         |         ^~~~~~~~~
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:237:9: note: in expansion of macro 'ethtool_link_ksettings_add_link_mode'
     237 |         ethtool_link_ksettings_add_link_mode(ks, advertising, (mode));
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
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
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
>> include/asm-generic/bitops/non-atomic.h:7:24: error: too few arguments to function 'generic___set_bit'
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
   drivers/net/netdevsim/ethtool.c:243:9: note: in expansion of macro 'NETDEVSIM_ETHTOOL_MODE'
     243 |         NETDEVSIM_ETHTOOL_MODE(10000baseT_Full);
         |         ^~~~~~~~~~~~~~~~~~~~~~
   include/asm-generic/bitops/generic-non-atomic.h:28:1: note: declared here
      28 | generic___set_bit(unsigned long nr, volatile unsigned long *addr)
         | ^~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors
..


vim +/generic___set_bit +147 include/asm-generic/bitops/generic-non-atomic.h

8238b4579866b7 Mikulas Patocka   2022-08-26  142  
bb7379bfa680bd Alexander Lobakin 2022-06-24  143  /*
bb7379bfa680bd Alexander Lobakin 2022-06-24  144   * const_*() definitions provide good compile-time optimizations when
bb7379bfa680bd Alexander Lobakin 2022-06-24  145   * the passed arguments can be resolved at compile time.
bb7379bfa680bd Alexander Lobakin 2022-06-24  146   */
bb7379bfa680bd Alexander Lobakin 2022-06-24 @147  #define const___set_bit			generic___set_bit
bb7379bfa680bd Alexander Lobakin 2022-06-24  148  #define const___clear_bit		generic___clear_bit
bb7379bfa680bd Alexander Lobakin 2022-06-24  149  #define const___change_bit		generic___change_bit
bb7379bfa680bd Alexander Lobakin 2022-06-24  150  #define const___test_and_set_bit	generic___test_and_set_bit
bb7379bfa680bd Alexander Lobakin 2022-06-24  151  #define const___test_and_clear_bit	generic___test_and_clear_bit
bb7379bfa680bd Alexander Lobakin 2022-06-24  152  #define const___test_and_change_bit	generic___test_and_change_bit
8238b4579866b7 Mikulas Patocka   2022-08-26  153  #define const_test_bit_acquire		generic_test_bit_acquire
bb7379bfa680bd Alexander Lobakin 2022-06-24  154  

:::::: The code at line 147 was first introduced by commit
:::::: bb7379bfa680bd48b468e856475778db2ad866c1 bitops: define const_*() versions of the non-atomics

:::::: TO: Alexander Lobakin <alexandr.lobakin@intel.com>
:::::: CC: Yury Norov <yury.norov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
