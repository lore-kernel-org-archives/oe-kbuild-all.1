Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33A97125DE
	for <oe-kbuild-all@lists.linux.dev>; Tue, 19 Dec 2023 09:01:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m7/4Ysxd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1702976471; x=1734512471;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EdUbOJERAZrkssHpzfOrd68THSaOp4I20BoNaZ1GaEE=;
  b=m7/4YsxdTGKOiyBoPjQ+/NKGgEbaBdqhQRLweIuG1H6PywtGKffDWcIf
   IIb//iOLBS8iZz3R2FITRwxX0vb+lcvwGp7MLWwzdszADnPrvSj9FLBfs
   gkazZTUl8VI94I04aKKXB822IY9kJ890bCEe0PKkcepPv+JXo5bOr+gPb
   E7GBT9dPJ1BRWGlxz4WI1s1+h4JOELuuihW9pFvyWVP61qP5Ky3h6Bnsg
   T8cC4v6/HLkHO7N4g0xDtHPe0in0K7J+zjCTSLLJIqHkpIw2N5WQxPzD+
   8vSYq1CAvNA3IM7Mf08l/ZhFZjgT1RkP7mVRxDdNjRCZU5ZwhVhMM8cDI
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="380612400"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="380612400"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Dec 2023 01:01:08 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10928"; a="894212903"
X-IronPort-AV: E=Sophos;i="6.04,287,1695711600"; 
   d="scan'208";a="894212903"
Received: from lkp-server02.sh.intel.com (HELO b07ab15da5fe) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 19 Dec 2023 01:01:07 -0800
Received: from kbuild by b07ab15da5fe with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rFVyL-00055h-09;
	Tue, 19 Dec 2023 09:01:05 +0000
Date: Tue, 19 Dec 2023 17:00:19 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android13-5.15 1/1]
 include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return
 expression (different address spaces)
Message-ID: <202312191600.bPjM4yAC-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android13-5.15
head:   b37eb4523002250e2382e8c5e0d8380ad349c6b6
commit: b37eb4523002250e2382e8c5e0d8380ad349c6b6 [1/1] ANDROID: KMI workaround for CONFIG_NETFILTER_FAMILY_BRIDGE
config: i386-randconfig-062-20231219 (https://download.01.org/0day-ci/archive/20231219/202312191600.bPjM4yAC-lkp@intel.com/config)
compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231219/202312191600.bPjM4yAC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202312191600.bPjM4yAC-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/bridge/br_forward.c: note: in included file (through include/linux/netdevice.h):
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
--
   net/bridge/br_input.c: note: in included file (through include/linux/netdevice.h):
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
--
   net/bridge/br_stp_bpdu.c: note: in included file (through include/linux/netdevice.h, include/linux/netfilter.h, include/uapi/linux/netfilter_bridge.h, ...):
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
--
   net/bridge/br_multicast.c: note: in included file:
   include/net/mld.h:32:43: sparse: sparse: array of flexible structures
   net/bridge/br_multicast.c: note: in included file (through include/linux/netdevice.h):
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
--
   net/netfilter/core.c:43:50: sparse: sparse: array of flexible structures
>> net/netfilter/core.c:43:30: sparse: sparse: symbol 'init_nf_hooks_bridge' was not declared. Should it be static?
   net/netfilter/core.c:44:30: sparse: sparse: symbol 'init_nf_hooks_bridgep' redeclared with different type (different address spaces):
>> net/netfilter/core.c:44:30: sparse:    struct nf_hook_entries [noderef] __rcu *[addressable] [toplevel] init_nf_hooks_bridgep
   net/netfilter/core.c: note: in included file (through include/linux/netdevice.h, include/linux/netfilter.h):
   include/net/net_namespace.h:198:31: sparse: note: previously declared as:
>> include/net/net_namespace.h:198:31: sparse:    struct nf_hook_entries *extern [addressable] [toplevel] init_nf_hooks_bridgep
   net/netfilter/core.c:664:26: sparse: sparse: incompatible types in comparison expression (different address spaces):
   net/netfilter/core.c:664:26: sparse:    void ( [noderef] __rcu * )( ... )
   net/netfilter/core.c:664:26: sparse:    void ( * )( ... )
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
--
   net/netfilter/nf_queue.c: note: in included file (through include/linux/netdevice.h, include/linux/netfilter.h):
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
--
   net/netfilter/ipvs/ip_vs_xmit.c: note: in included file (through include/linux/netdevice.h, include/net/sock.h, include/linux/tcp.h):
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **
>> include/net/net_namespace.h:205:25: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries ** @@
   include/net/net_namespace.h:205:25: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:205:25: sparse:     got struct nf_hook_entries **

vim +205 include/net/net_namespace.h

   195	
   196	#ifdef CONFIG_NETFILTER_FAMILY_BRIDGE
   197	extern struct net init_net;
 > 198	extern struct nf_hook_entries *init_nf_hooks_bridgep;
   199	
   200	static inline struct nf_hook_entries __rcu **get_nf_hooks_bridge(const struct net *net)
   201	{
   202		struct ext_net *ext_net;
   203	
   204		if (net == &init_net)
 > 205			return &init_nf_hooks_bridgep;
   206		ext_net = container_of(net, struct ext_net, net);
   207		return ext_net->hooks_bridge;
   208	}
   209	#endif
   210	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
