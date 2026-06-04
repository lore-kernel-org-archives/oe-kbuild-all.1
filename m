Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3C954A2E3A
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jun 2026 17:20:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780593640; cv=none; b=IMFlsvht/bLhjIyHY3734eM7kTkUheaSG6S+VNvugB/kjL/aXyOdxLxxwfcosBHCTgszEFUhXZ12zZFtWCLZhl15TeK42btLy4O26ZujptzgZylxpdmeR1WAGu3LX/QsNDDDuX2ssGKdd1NXx0CWwy9hl7XuAxawqs0q8DeWk+A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780593640; c=relaxed/simple;
	bh=PJ4LTY7VZ65RVpSCO8LYEkkOANTSbu5ro8JAjaiRLA4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QKl3Jd/noVhBNxeYXmahQkvwyExUNkaQ6z2ZLnhaWzK54Z78ohCyv1A3IfvdTwQn/yAO45MBM/0YJECY5waWqt3oJwjkuAoND8gwfnlvllfuzxF6SqyspJkVDTetZbc1vC41R+S041xBKmt3HWWj/WQHWzlKXwxulTX1cXHYP68=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=beDolVWL; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="beDolVWL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1780593639; x=1812129639;
  h=date:from:to:cc:subject:message-id;
  bh=PJ4LTY7VZ65RVpSCO8LYEkkOANTSbu5ro8JAjaiRLA4=;
  b=beDolVWLTg/HDL6MdzM4KyHMQqzWKdhBB4P+PySiCe4YHcx8Vqcygk+F
   /Hjz726wCg8+ojSl1pXVCrjtxEhfhyGM+qlpzyaRjOIOiK09qeTFN6g8O
   72wPumizBo794GU3COtVuxA1zrDq5cCAzWYuD7gPeXe+zhTELRo303XaK
   muHkfIcELpkJqkV46vw8wEznkueAmYykyf17cXmPsWB0knGV0etRxlZAy
   BEcXbZk9NtpEXwYDWxlMwBV33MQjPfhxNJs5Rtp0azcig3D5lOhQ3A2li
   +YJysqwCwAfMYTZg5T6hGfawSpqF6eTWHCItYg8YAOtMZIgPXLp22No+P
   A==;
X-CSE-ConnectionGUID: iLgp+B9YQ+CO9ZaEmbVD2Q==
X-CSE-MsgGUID: 4bvwl7mwQ8Sf/r+j9X1v+A==
X-IronPort-AV: E=McAfee;i="6800,10657,11807"; a="68963165"
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="68963165"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jun 2026 10:20:38 -0700
X-CSE-ConnectionGUID: k6EGIqnTRh+zSky76MeVyw==
X-CSE-MsgGUID: s6qDEdTVTa6YYKoiEceIxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,187,1774335600"; 
   d="scan'208";a="240135814"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by fmviesa006.fm.intel.com with ESMTP; 04 Jun 2026 10:16:53 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wVBgZ-00000000F0I-0ESf;
	Thu, 04 Jun 2026 17:16:51 +0000
Date: Fri, 05 Jun 2026 01:15:54 +0800
From: kernel test robot <lkp@intel.com>
To: Alexey Gladkov <legion@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [legion:sysctls-v1 29/31] net/ipv4/sysctl_net_ipv4.c:645:30:
 error: 'struct netns_ipv4' has no member named
 'sysctl_fib_multipath_hash_fields'
Message-ID: <202606050128.xWvDHj5s-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/legion/linux.git sysctls-v1
head:   7c8f50dd793cb0314002e78bb70e3bfd0346e606
commit: ed699fdc856ea36d4d96deb3905ebf7c90b86305 [29/31] sysctl: use ctl_field in IPv4 netns sysctls
config: openrisc-randconfig-r072-20260604 (https://download.01.org/0day-ci/archive/20260605/202606050128.xWvDHj5s-lkp@intel.com/config)
compiler: or1k-linux-gcc (GCC) 10.5.0
smatch: v0.5.0-9185-gbcc58b9c
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260605/202606050128.xWvDHj5s-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606050128.xWvDHj5s-lkp@intel.com/

All error/warnings (new ones prefixed by >>):

   net/ipv4/sysctl_net_ipv4.c: In function 'ipv4_sysctl_fib_multipath_hash_fields_data':
>> net/ipv4/sysctl_net_ipv4.c:645:30: error: 'struct netns_ipv4' has no member named 'sysctl_fib_multipath_hash_fields'
     645 |  return &ctx->ns.net_ns->ipv4.field;    \
         |                              ^
   net/ipv4/sysctl_net_ipv4.c:648:1: note: in expansion of macro 'IPV4_DATA'
     648 | IPV4_DATA(sysctl_fib_multipath_hash_fields)
         | ^~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c: In function 'ipv4_sysctl_fib_multipath_hash_policy_data':
>> net/ipv4/sysctl_net_ipv4.c:645:30: error: 'struct netns_ipv4' has no member named 'sysctl_fib_multipath_hash_policy'
     645 |  return &ctx->ns.net_ns->ipv4.field;    \
         |                              ^
   net/ipv4/sysctl_net_ipv4.c:649:1: note: in expansion of macro 'IPV4_DATA'
     649 | IPV4_DATA(sysctl_fib_multipath_hash_policy)
         | ^~~~~~~~~
   net/ipv4/sysctl_net_ipv4.c: In function 'ipv4_sysctl_fib_multipath_use_neigh_data':
>> net/ipv4/sysctl_net_ipv4.c:645:30: error: 'struct netns_ipv4' has no member named 'sysctl_fib_multipath_use_neigh'
     645 |  return &ctx->ns.net_ns->ipv4.field;    \
         |                              ^
   net/ipv4/sysctl_net_ipv4.c:650:1: note: in expansion of macro 'IPV4_DATA'
     650 | IPV4_DATA(sysctl_fib_multipath_use_neigh)
         | ^~~~~~~~~
   At top level:
>> net/ipv4/sysctl_net_ipv4.c:643:14: warning: 'ipv4_sysctl_igmp_qrv_data' defined but not used [-Wunused-function]
     643 | static void *ipv4_ ## field ## _data(const struct ctl_context *ctx) \
         |              ^~~~~
   net/ipv4/sysctl_net_ipv4.c:666:1: note: in expansion of macro 'IPV4_DATA'
     666 | IPV4_DATA(sysctl_igmp_qrv)
         | ^~~~~~~~~
>> net/ipv4/sysctl_net_ipv4.c:643:14: warning: 'ipv4_sysctl_fib_multipath_use_neigh_data' defined but not used [-Wunused-function]
     643 | static void *ipv4_ ## field ## _data(const struct ctl_context *ctx) \
         |              ^~~~~
   net/ipv4/sysctl_net_ipv4.c:650:1: note: in expansion of macro 'IPV4_DATA'
     650 | IPV4_DATA(sysctl_fib_multipath_use_neigh)
         | ^~~~~~~~~
>> net/ipv4/sysctl_net_ipv4.c:643:14: warning: 'ipv4_sysctl_fib_multipath_hash_policy_data' defined but not used [-Wunused-function]
     643 | static void *ipv4_ ## field ## _data(const struct ctl_context *ctx) \
         |              ^~~~~
   net/ipv4/sysctl_net_ipv4.c:649:1: note: in expansion of macro 'IPV4_DATA'
     649 | IPV4_DATA(sysctl_fib_multipath_hash_policy)
         | ^~~~~~~~~
>> net/ipv4/sysctl_net_ipv4.c:643:14: warning: 'ipv4_sysctl_fib_multipath_hash_fields_data' defined but not used [-Wunused-function]
     643 | static void *ipv4_ ## field ## _data(const struct ctl_context *ctx) \
         |              ^~~~~
   net/ipv4/sysctl_net_ipv4.c:648:1: note: in expansion of macro 'IPV4_DATA'
     648 | IPV4_DATA(sysctl_fib_multipath_hash_fields)
         | ^~~~~~~~~


vim +645 net/ipv4/sysctl_net_ipv4.c

   641	
   642	#define IPV4_DATA(field)						\
 > 643	static void *ipv4_ ## field ## _data(const struct ctl_context *ctx)	\
   644	{									\
 > 645		return &ctx->ns.net_ns->ipv4.field;				\
   646	}
   647	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
