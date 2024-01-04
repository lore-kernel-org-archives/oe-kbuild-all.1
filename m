Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CD12CCBA
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jan 2024 22:47:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="JC8akjnE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1704408462; x=1735944462;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EiH9QOxcteCUq8FKBSEwAmJX9QLm0sg0e3+nkV7qkvM=;
  b=JC8akjnEmivUdRrGgiasG74teG7SJD/mc1VYwWMJC3j/6zC58xnV1H8B
   aEMhj+gRh8YvvPQsz4sayyiKpCVcYX6U/v/6osnihHLjuJ7bWkVsDB5Nz
   rIl2CUCOswipyt4eEDYE3ROcv7EejRnt7p/MYh1kQL5P9kigQZWSSgJXV
   wcqo19F1x1/5qjXE4IyBfbeaIG96BNLX2oNBq8RSoVnXwg34p6DVmvgvf
   ItWtPjhe01u6Nqf7XYAFImDtsm8sMhpWn98sSKnYcvvm3zr56pdMTh/+c
   z3k2E6i0NQoX8ovUJydFn9V6sHhPvnO0Rj7zAK1jHBaMGLCFQo7CXV7Wc
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10943"; a="10760964"
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="10760964"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jan 2024 14:43:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.04,332,1695711600"; 
   d="scan'208";a="22653002"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmviesa001.fm.intel.com with ESMTP; 04 Jan 2024 14:43:23 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rLWQq-0000UQ-0s;
	Thu, 04 Jan 2024 22:43:20 +0000
Date: Fri, 5 Jan 2024 06:43:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return
 expression (different address spaces)
Message-ID: <202401050654.ljNFxKcU-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   c046e1739fb043703dbf6e388ed896375841532b
commit: 0145780bfc78d0a429997fd132f7cf8af61cc632 [1/1] ANDROID: fix KASAN-related kernel crash by KMI W/A for NETFILTER_FAMILY_BRIDGE
config: x86_64-randconfig-121-20240104 (https://download.01.org/0day-ci/archive/20240105/202401050654.ljNFxKcU-lkp@intel.com/config)
compiler: ClangBuiltLinux clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240105/202401050654.ljNFxKcU-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401050654.ljNFxKcU-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/ipv4/ip_forward.c: note: in included file (through include/linux/netdevice.h):
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
   net/ipv4/ip_input.c: note: in included file (through include/linux/inet.h):
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:205:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:205:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
   net/ipv4/ip_input.c: note: in included file (through include/net/net_namespace.h, include/linux/inet.h):
   include/linux/skbuff.h:2501:28: sparse: sparse: self-comparison always evaluates to false
   net/ipv4/ip_input.c: note: in included file (through include/linux/inet.h):
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
   net/ipv4/arp.c: note: in included file (through include/linux/inet.h):
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
   net/ipv4/raw.c: note: in included file (through include/linux/netdevice.h, include/net/fib_rules.h, include/linux/mroute.h):
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
   net/ipv4/ip_output.c: note: in included file (through include/linux/inet.h):
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
