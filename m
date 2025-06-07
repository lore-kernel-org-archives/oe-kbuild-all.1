Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8EF51DED4C
	for <oe-kbuild-all@lists.linux.dev>; Sat,  7 Jun 2025 19:34:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749324874; cv=none; b=kKkQM9XywdtvjqNjrEcYrcDkeB4bP4DgFF0x0rYP+dtzPw5Nzq9PbKAx8mFvv/qxFdJd7DYISAE2KsdJ1eubLxwV98174zCwb2pGLy7OECpKgzrkgOero1LP+R9z7aiK+dkjisfC5EYcMfI1L959poV+yx7jUl45fTymqQ17BYw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749324874; c=relaxed/simple;
	bh=Y7C8xwPUuxURdJgfnmoDn+0tTUk/ooIDTkLxshAGGDI=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=MwCiNl1k2azxmZN+qNH+lgzujXJrRk4cfykspXuSQXj2PEzsIOIY61VqsQxmlTeNITPlYR8uC6Y7G8Ymt6dUek4pHEWqadJMVAv2v/+NSjC2THGOMt1xscJKeWY+Q+WKNUAxtcb/DAha7kvg8rwq73gnrfmKrSj4Chl6lDv8jwc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=F0VViRei; arc=none smtp.client-ip=198.175.65.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="F0VViRei"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1749324873; x=1780860873;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Y7C8xwPUuxURdJgfnmoDn+0tTUk/ooIDTkLxshAGGDI=;
  b=F0VViRei5KdDtdT82kAbpsL5onQuUhiUYMzh585vPv4wkJuGWHEW3+mp
   9KBVdvP2QSccQmO0qjSzQIgpJHtbPlARwxW/j64+NDm84pH8EIvSYcd8t
   0sGHk49n9KuTk8d+ctjPmJyaeBKtRmtzJvjo1P387rk93EX+4xIkDDzIA
   YSuJt5FNwNF7uh/993ZIn84jQ0QyKQF57glZpoMRolcRfTCtboDO2ro6h
   tThD3FUn+VyruvyXcg1IdPFfW3pdTM09E3hItNy4kkrCinJdYQAMMB9cX
   2fT+kGk0k0E7uM+ew82N2s8xs1JYtYgWbgY8JOvY9B/j4CaBdEwkGcxY7
   w==;
X-CSE-ConnectionGUID: 8nIEmHC5SZ6Q6rEODceVsA==
X-CSE-MsgGUID: GYDEKn1mT72ZI5qat0cyeQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11457"; a="55110029"
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="55110029"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 07 Jun 2025 12:34:32 -0700
X-CSE-ConnectionGUID: s5y6c3sgQrKmH2q0GNEqPA==
X-CSE-MsgGUID: uowT7fhyQkScSj2g0bHQyQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,218,1744095600"; 
   d="scan'208";a="151128797"
Received: from lkp-server01.sh.intel.com (HELO e8142ee1dce2) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 07 Jun 2025 12:34:30 -0700
Received: from kbuild by e8142ee1dce2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uNzJD-0005xx-1P;
	Sat, 07 Jun 2025 19:34:27 +0000
Date: Sun, 8 Jun 2025 03:34:27 +0800
From: kernel test robot <lkp@intel.com>
To: Leon Romanovsky <leonro@nvidia.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [leon-rdma:move-drivers 6/14] xtensa-linux-ld:
 drivers/dpll/dpll_core.o:undefined reference to `genl_register_family'
Message-ID: <202506080308.nzoV0p9r-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Leon,

First bad commit (maybe != root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/leon/linux-rdma.git move-drivers
head:   7c037ebae89e2ccf00fd35276d97b5a2fa113e27
commit: 645b7fb71aae737976c0802df992ff4622a9b5ef [6/14] dpll: Add DPLL entry to kernel configuration
config: xtensa-randconfig-r123-20250606 (https://download.01.org/0day-ci/archive/20250608/202506080308.nzoV0p9r-lkp@intel.com/config)
compiler: xtensa-linux-gcc (GCC) 15.1.0
reproduce: (https://download.01.org/0day-ci/archive/20250608/202506080308.nzoV0p9r-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202506080308.nzoV0p9r-lkp@intel.com/

All errors (new ones prefixed by >>):

>> xtensa-linux-ld: drivers/dpll/dpll_core.o:(.init.literal+0xc): undefined reference to `genl_register_family'
   xtensa-linux-ld: drivers/dpll/dpll_core.o: in function `dpll_device_unregister':
>> drivers/dpll/dpll_core.c:531:(.text+0x2a4): undefined reference to `rtnl_lock'
   xtensa-linux-ld: drivers/dpll/dpll_core.o: in function `dpll_netdev_pin_set':
   drivers/dpll/dpll_core.c:525:(.text+0x2d0): undefined reference to `rtnl_lock'
   xtensa-linux-ld: drivers/dpll/dpll_core.o: in function `dpll_device_unregister':
>> drivers/dpll/dpll_core.c:531:(.text+0x2ac): undefined reference to `rtnl_unlock'
   xtensa-linux-ld: drivers/dpll/dpll_core.o: in function `dpll_netdev_pin_set':
   drivers/dpll/dpll_core.c:527:(.text+0x2fe): undefined reference to `rtnl_unlock'
>> xtensa-linux-ld: drivers/dpll/dpll_core.c:538:(.text+0x31c): undefined reference to `rtnl_lock'
   xtensa-linux-ld: drivers/dpll/dpll_core.o: in function `dpll_netdev_pin_clear':
   drivers/dpll/dpll_core.c:525:(.text+0x334): undefined reference to `rtnl_lock'
   xtensa-linux-ld: drivers/dpll/dpll_core.o: in function `dpll_netdev_pin_set':
   drivers/dpll/dpll_core.c:538:(.text+0x324): undefined reference to `rtnl_unlock'
   xtensa-linux-ld: drivers/dpll/dpll_core.o: in function `dpll_netdev_pin_clear':
   drivers/dpll/dpll_core.c:527:(.text+0x364): undefined reference to `rtnl_unlock'
   xtensa-linux-ld: drivers/dpll/dpll_core.o: in function `dpll_init':
>> drivers/dpll/dpll_core.c:862:(.init.text+0xf): undefined reference to `genl_register_family'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_nl_device_id_get_doit':
>> drivers/dpll/dpll_netlink.c:1507:(.text+0x6008): undefined reference to `init_net'
>> xtensa-linux-ld: drivers/dpll/dpll_netlink.c:1507:(.text+0x6004): undefined reference to `init_net'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_nl_pin_set_doit':
   drivers/dpll/dpll_netlink.c:1407:(.text+0x5dbc): undefined reference to `init_net'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.c:1407:(.text+0x5db8): undefined reference to `init_net'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_nl_pin_id_get_doit':
   drivers/dpll/dpll_netlink.c:1335:(.text+0x5434): undefined reference to `init_net'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o:drivers/dpll/dpll_netlink.c:1335: more undefined references to `init_net' follow
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_pin_available':
>> drivers/dpll/dpll_netlink.c:1207:(.text+0x228): undefined reference to `do_trace_netlink_extack'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_pin_find':
   drivers/dpll/dpll_netlink.c:1240:(.text+0x2f2): undefined reference to `do_trace_netlink_extack'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_pin_available':
>> drivers/dpll/dpll_netlink.c:1207:(.text+0x234): undefined reference to `nla_strcmp'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_pin_find':
   drivers/dpll/dpll_netlink.c:1218:(.text+0x363): undefined reference to `nla_strcmp'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_pin_available':
   drivers/dpll/dpll_netlink.c:1207:(.text+0x240): undefined reference to `nla_strcmp'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_pin_find':
   drivers/dpll/dpll_netlink.c:1222:(.text+0x3ce): undefined reference to `nla_strcmp'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_pin_available':
   drivers/dpll/dpll_netlink.c:1207:(.text+0x248): undefined reference to `nla_strcmp'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o:drivers/dpll/dpll_netlink.c:1225: more undefined references to `nla_strcmp' follow
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_pin_available':
   drivers/dpll/dpll_netlink.c:1207:(.text+0x254): undefined reference to `do_trace_netlink_extack'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_pin_find':
   drivers/dpll/dpll_netlink.c:1233:(.text+0x47b): undefined reference to `do_trace_netlink_extack'
>> xtensa-linux-ld: drivers/dpll/dpll_netlink.c:1247:(.text+0x558): undefined reference to `do_trace_netlink_extack'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_pin_find_from_nlattr':
   drivers/dpll/dpll_netlink.c:1293:(.text+0x65f): undefined reference to `do_trace_netlink_extack'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_pin_find':
>> drivers/dpll/dpll_netlink.c:1247:(.text+0x55c): undefined reference to `nla_memcpy'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_pin_find_from_nlattr':
>> include/net/netlink.h:1887:(.text+0x68b): undefined reference to `nla_memcpy'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_pin_find':
   drivers/dpll/dpll_netlink.c:1247:(.text+0x57c): undefined reference to `do_trace_netlink_extack'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_pin_find_from_nlattr':
   drivers/dpll/dpll_netlink.c:1300:(.text+0x884): undefined reference to `do_trace_netlink_extack'
>> xtensa-linux-ld: drivers/dpll/dpll_netlink.c:70:(.text+0x8f4): undefined reference to `lockdep_rtnl_is_held'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_netdev_pin':
>> drivers/dpll/dpll_netlink.c:71:(.text+0x942): undefined reference to `lockdep_rtnl_is_held'
>> xtensa-linux-ld: drivers/dpll/dpll_netlink.c:468:(.text+0x9b8): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_dplls':
>> include/net/netlink.h:2216:(.text+0xafb): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_netdev_pin':
>> drivers/dpll/dpll_netlink.c:468:(.text+0x9c4): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_dplls':
   include/net/netlink.h:1445:(.text+0xb5a): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_netdev_pin':
   drivers/dpll/dpll_netlink.c:468:(.text+0x9e8): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o:include/net/netlink.h:1445: more undefined references to `nla_put' follow
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_netdev_pin':
>> drivers/dpll/dpll_netlink.c:468:(.text+0xa30): undefined reference to `nla_put_64bit'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_dplls':
   drivers/dpll/dpll_netlink.c:297:(.text+0xe1a): undefined reference to `nla_put_64bit'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.c:566:(.text+0xee4): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_get_one':
   include/net/netlink.h:1445:(.text+0xfda): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_dplls':
   drivers/dpll/dpll_netlink.c:566:(.text+0xef0): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_get_one':
   include/net/netlink.h:1643:(.text+0x1023): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_dplls':
   drivers/dpll/dpll_netlink.c:566:(.text+0xef4): undefined reference to `nla_put_64bit'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_get_one':
   drivers/dpll/dpll_netlink.c:574:(.text+0x1037): undefined reference to `nla_put_64bit'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_dplls':
   drivers/dpll/dpll_netlink.c:566:(.text+0xf10): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_get_one':
   include/net/netlink.h:1600:(.text+0x10ff): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_dplls':
   drivers/dpll/dpll_netlink.c:566:(.text+0xf14): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_get_one':
   include/net/netlink.h:1445:(.text+0x1118): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_dplls':
   drivers/dpll/dpll_netlink.c:566:(.text+0xf18): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o:include/net/netlink.h:1445: more undefined references to `nla_put' follow
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_get_one':
   drivers/dpll/dpll_netlink.c:1441:(.text+0x1378): undefined reference to `do_trace_netlink_extack'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_find_from_nlattr':
   drivers/dpll/dpll_netlink.c:1470:(.text+0x149a): undefined reference to `do_trace_netlink_extack'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_get_one':
   drivers/dpll/dpll_netlink.c:1441:(.text+0x137c): undefined reference to `nla_memcpy'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_find_from_nlattr':
   include/net/netlink.h:1887:(.text+0x14c3): undefined reference to `nla_memcpy'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_get_one':
   drivers/dpll/dpll_netlink.c:1441:(.text+0x139c): undefined reference to `do_trace_netlink_extack'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_find_from_nlattr':
   drivers/dpll/dpll_netlink.c:1432:(.text+0x1662): undefined reference to `do_trace_netlink_extack'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_get_one':
   drivers/dpll/dpll_netlink.c:1441:(.text+0x13a8): undefined reference to `nla_strcmp'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_find_from_nlattr':
   drivers/dpll/dpll_netlink.c:1420:(.text+0x16da): undefined reference to `nla_strcmp'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_get_one':
   drivers/dpll/dpll_netlink.c:1441:(.text+0x13b0): undefined reference to `do_trace_netlink_extack'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_find_from_nlattr':
   drivers/dpll/dpll_netlink.c:1425:(.text+0x1722): undefined reference to `do_trace_netlink_extack'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_get_one':
   drivers/dpll/dpll_netlink.c:1441:(.text+0x13c4): undefined reference to `do_trace_netlink_extack'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_find_from_nlattr':
   drivers/dpll/dpll_netlink.c:1475:(.text+0x17bc): undefined reference to `do_trace_netlink_extack'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.c:426:(.text+0x1894): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_parents':
   include/net/netlink.h:2216:(.text+0x1a26): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_find_from_nlattr':
   drivers/dpll/dpll_netlink.c:426:(.text+0x189c): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_parents':
   include/net/netlink.h:1445:(.text+0x1a63): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_find_from_nlattr':
   drivers/dpll/dpll_netlink.c:426:(.text+0x18a0): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o:include/net/netlink.h:1445: more undefined references to `nla_put' follow
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_find_from_nlattr':
>> drivers/dpll/dpll_netlink.c:426:(.text+0x18bc): undefined reference to `skb_trim'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_parents':
>> include/net/netlink.h:1094:(.text+0x1b3a): undefined reference to `skb_trim'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_parents':
   drivers/dpll/dpll_netlink.c:369:(.text+0x1bb4): undefined reference to `nla_put_64bit'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_esync':
   drivers/dpll/dpll_netlink.c:384:(.text+0x1cea): undefined reference to `nla_put_64bit'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_parents':
   drivers/dpll/dpll_netlink.c:369:(.text+0x1bb8): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_esync':
   include/net/netlink.h:1445:(.text+0x1d02): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_parents':
   drivers/dpll/dpll_netlink.c:369:(.text+0x1bc0): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_esync':
   include/net/netlink.h:2216:(.text+0x1d4f): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_parents':
   drivers/dpll/dpll_netlink.c:369:(.text+0x1bc4): undefined reference to `nla_put_64bit'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_esync':
   drivers/dpll/dpll_netlink.c:394:(.text+0x1d72): undefined reference to `nla_put_64bit'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_parents':
   drivers/dpll/dpll_netlink.c:369:(.text+0x1bc8): undefined reference to `nla_put_64bit'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_esync':
   drivers/dpll/dpll_netlink.c:398:(.text+0x1d8b): undefined reference to `nla_put_64bit'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_parents':
   drivers/dpll/dpll_netlink.c:369:(.text+0x1be0): undefined reference to `skb_trim'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_esync':
   include/net/netlink.h:1094:(.text+0x1e4c): undefined reference to `skb_trim'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_esync':
   drivers/dpll/dpll_netlink.c:600:(.text+0x1ec8): undefined reference to `__alloc_skb'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_event_send':
   include/linux/skbuff.h:1336:(.text+0x1f62): undefined reference to `__alloc_skb'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_esync':
   drivers/dpll/dpll_netlink.c:600:(.text+0x1ecc): undefined reference to `genlmsg_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_event_send':
   drivers/dpll/dpll_netlink.c:610:(.text+0x1f78): undefined reference to `genlmsg_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_esync':
   drivers/dpll/dpll_netlink.c:600:(.text+0x1edc): undefined reference to `skb_trim'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_event_send':
   include/net/netlink.h:1094:(.text+0x2020): undefined reference to `skb_trim'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_esync':
   drivers/dpll/dpll_netlink.c:600:(.text+0x1efc): undefined reference to `netlink_broadcast_filtered'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_event_send':
   include/net/netlink.h:1151:(.text+0x2133): undefined reference to `netlink_broadcast_filtered'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_esync':
   drivers/dpll/dpll_netlink.c:600:(.text+0x1f00): undefined reference to `sk_skb_reason_drop'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_event_send':
   include/linux/skbuff.h:1275:(.text+0x2146): undefined reference to `sk_skb_reason_drop'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_change_ntf':
   drivers/dpll/dpll_netlink.c:328:(.text+0x21ec): undefined reference to `nla_put_64bit'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_freq':
   drivers/dpll/dpll_netlink.c:341:(.text+0x2320): undefined reference to `nla_put_64bit'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_change_ntf':
   drivers/dpll/dpll_netlink.c:328:(.text+0x21f8): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_freq':
   include/net/netlink.h:2216:(.text+0x2396): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_change_ntf':
   drivers/dpll/dpll_netlink.c:328:(.text+0x2204): undefined reference to `nla_put_64bit'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_freq':
   drivers/dpll/dpll_netlink.c:349:(.text+0x2404): undefined reference to `nla_put_64bit'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_change_ntf':
   drivers/dpll/dpll_netlink.c:328:(.text+0x2214): undefined reference to `skb_trim'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_freq':
   include/net/netlink.h:1094:(.text+0x246e): undefined reference to `skb_trim'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_device_change_ntf':
   drivers/dpll/dpll_netlink.c:328:(.text+0x2220): undefined reference to `nla_put_64bit'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_freq':
   drivers/dpll/dpll_netlink.c:355:(.text+0x24c2): undefined reference to `nla_put_64bit'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.c:506:(.text+0x2600): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_cmd_pin_get_one':
   include/net/netlink.h:1643:(.text+0x2744): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_freq':
   drivers/dpll/dpll_netlink.c:506:(.text+0x2608): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_cmd_pin_get_one':
   include/net/netlink.h:1445:(.text+0x2777): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_freq':
   drivers/dpll/dpll_netlink.c:506:(.text+0x260c): undefined reference to `nla_put_64bit'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_cmd_pin_get_one':
   drivers/dpll/dpll_netlink.c:520:(.text+0x278f): undefined reference to `nla_put_64bit'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_freq':
   drivers/dpll/dpll_netlink.c:506:(.text+0x261c): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_cmd_pin_get_one':
   include/net/netlink.h:1643:(.text+0x27f6): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_freq':
   drivers/dpll/dpll_netlink.c:506:(.text+0x2628): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_cmd_pin_get_one':
   include/net/netlink.h:1643:(.text+0x283a): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_msg_add_pin_freq':
   drivers/dpll/dpll_netlink.c:506:(.text+0x2630): undefined reference to `nla_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o:include/net/netlink.h:1445: more undefined references to `nla_put' follow
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_cmd_pin_get_one':
   drivers/dpll/dpll_netlink.c:684:(.text+0x2b88): undefined reference to `__alloc_skb'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_pin_event_send':
   include/linux/skbuff.h:1336:(.text+0x2be6): undefined reference to `__alloc_skb'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_cmd_pin_get_one':
   drivers/dpll/dpll_netlink.c:684:(.text+0x2b8c): undefined reference to `genlmsg_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_pin_event_send':
   drivers/dpll/dpll_netlink.c:696:(.text+0x2bfc): undefined reference to `genlmsg_put'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_cmd_pin_get_one':
   drivers/dpll/dpll_netlink.c:684:(.text+0x2b9c): undefined reference to `skb_trim'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_pin_event_send':
   include/net/netlink.h:1094:(.text+0x2c9c): undefined reference to `skb_trim'
   xtensa-linux-ld: drivers/dpll/dpll_netlink.o: in function `dpll_cmd_pin_get_one':
   drivers/dpll/dpll_netlink.c:684:(.text+0x2bbc): undefined reference to `netlink_broadcast_filtered'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
