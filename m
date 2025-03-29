Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C660134B0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 29 Mar 2025 17:09:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743268163; cv=none; b=qASWpb5gY9eHRyipMHho6r0svwXZhFfljm31KTMJgMNMIUTQzs6tVM0huYU18/6WLeqr9aC0DRzwpFal4i/kDO8GQcDg3v55jNLh6F4vsOq9aaLA1pqGazD3nt6hHDnQGwVKLXbO3coplJGoRcRh329/dn6dEvgehrrlINVk3fE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743268163; c=relaxed/simple;
	bh=kit3fjm3pNmis8lEG6CKzdmV7k8hG9uzIrMiWaiTuKc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GR7OYHN3cjUI4y66iELwOn+VlIcGkYrHdxxWU3SFD+02kj3akLTHISIIyUnbdXotR33agnfA3V5fMGzPbVc/3tHj+sNgul/z5CMyxDNg1P8NZBgQr1pgxLCvHouvsqVUaY2W1Y4R8jEM6u1HscJE/WIhWQkPyLDETVr0u1Kgn04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Zk5gQ0Fn; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Zk5gQ0Fn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1743268161; x=1774804161;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kit3fjm3pNmis8lEG6CKzdmV7k8hG9uzIrMiWaiTuKc=;
  b=Zk5gQ0FnsTIC6YtIV90uu4oiCUgHeX6OvgMrBmczMlttew2JS+pXBMJD
   HkZVCiSik/vUJzmkxbKPKQJBBSPJYAvs8GDqRwp1fAoPJAWr2Qp+R2N45
   TRu810Ph56qNwEEGUhPq8RuJTkxAlPXk2r20OSIPWyq++9c47k8BDNiT5
   A+RfCe2k2Pqbii1CbKxVgzpWyKNZTWpNaXGHt7XQWLBIKKgvr31EcKqVq
   +zvIGvU2IyYItEsz0sYlkp5zSvd1xUM4sSrzscx3kzHmPhOQWb0ihxE1i
   6iR6vfbc/tL/D3mCXSmNib0Cz5kzJ2e+bgwTzgbBNKx5gNGDmCvE9+jxl
   w==;
X-CSE-ConnectionGUID: 4YSDewtGTs+xJx82L5EwpQ==
X-CSE-MsgGUID: 5oLPp2VBRk+2oOn8f/o+Pg==
X-IronPort-AV: E=McAfee;i="6700,10204,11388"; a="44769853"
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="44769853"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Mar 2025 10:09:20 -0700
X-CSE-ConnectionGUID: VzWZC1+xQWegPyBKvYJfYA==
X-CSE-MsgGUID: JaVMuMUaSYCPVt2WWyawfQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,286,1736841600"; 
   d="scan'208";a="125606583"
Received: from lkp-server02.sh.intel.com (HELO e98e3655d6d2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 29 Mar 2025 10:09:19 -0700
Received: from kbuild by e98e3655d6d2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tyZgL-0008Fu-03;
	Sat, 29 Mar 2025 17:09:17 +0000
Date: Sun, 30 Mar 2025 01:09:11 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15-lts 0/1]
 include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return
 expression (different address spaces)
Message-ID: <202503300037.qEx3y6MB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15-lts
head:   5e1b899f19c3d900664c1ca05c4714c24647d82b
commit: 0145780bfc78d0a429997fd132f7cf8af61cc632 [0/1] ANDROID: fix KASAN-related kernel crash by KMI W/A for NETFILTER_FAMILY_BRIDGE
config: x86_64-randconfig-123-20250329 (https://download.01.org/0day-ci/archive/20250330/202503300037.qEx3y6MB-lkp@intel.com/config)
compiler: clang version 20.1.1 (https://github.com/llvm/llvm-project 424c2d9b7e4de40d0804dd374721e6411c27d1d1)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250330/202503300037.qEx3y6MB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503300037.qEx3y6MB-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/bridge/br_forward.c: note: in included file (through include/linux/netdevice.h):
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
--
   net/bridge/br_stp_bpdu.c: note: in included file (through include/linux/netdevice.h, include/linux/netfilter.h, include/uapi/linux/netfilter_bridge.h, ...):
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
--
   net/bridge/br_input.c: note: in included file (through include/linux/netdevice.h):
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
--
   net/bridge/br_multicast.c: note: in included file:
   include/net/mld.h:32:43: sparse: sparse: array of flexible structures
   net/bridge/br_multicast.c: note: in included file (through include/linux/netdevice.h):
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep

vim +205 include/net/net_namespace.h

   199	
   200	static inline struct nf_hook_entries __rcu **get_nf_hooks_bridge(const struct net *net)
   201	{
   202		struct ext_net *ext_net;
   203	
   204		if (net == &init_net)
 > 205			return init_nf_hooks_bridgep;
   206		ext_net = container_of(net, struct ext_net, net);
   207		return ext_net->hooks_bridge;
   208	}
   209	#endif
   210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
