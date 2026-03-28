Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 313632609E3
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Mar 2026 14:10:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774707038; cv=none; b=UDqFX9TSjlPEoJFX25VVqdymExT+quQu2/Mcvq6B70yaY1QHIlz8dalVzTpiegOkXUW2l2BdfUQCE2wxC9Am9xpO93xZITiEBhsyA/Bx6nW3k11yCv9Dk9UShFj1d2/vBSv7pbe/rSRASHG7KVGDBOijSXzwJthzALTNrG5DR5U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774707038; c=relaxed/simple;
	bh=eLNk7FG+GuOyFmDrkvkfvyCN+/xhFOpw629vK73opy4=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E2Bwn7cYbyuGa2Y9tc0fWwnWExo9VNKld61gGp46sNg1SJJPq6yTUI1DNu1lDDflm+qGki9ZxK//cudahru7XQpJ1xUHhIPmLtp9MqCOXy7K66KFVlNEwKOdBjpOngJQWNsLSA4coYJGJfn+qEbRgtfE+jCI2nGU4dPzbYGszBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=m6i/i1th; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="m6i/i1th"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1774707036; x=1806243036;
  h=date:from:to:cc:subject:message-id;
  bh=eLNk7FG+GuOyFmDrkvkfvyCN+/xhFOpw629vK73opy4=;
  b=m6i/i1thd06dKLBME6/zFKRcSsDuPasgmaJniBM08dCiDFkIsMwbxMWe
   jaa80jAO7Nd9uxEX5eUzddBZfH/fx+/9KmGOSLcPSz7mYdlPL/h1zh4ct
   TNncYfunUKTCuJINwxPk/g/GVXICfUGi2ebyKjc37TlzR3y/kGje8lK7f
   IXJ8x793V3XstqFCWRTrvg/MaRuf0TIevXhIFOWZtqLa8vK68n0L6gkOI
   DzXvvndXaz7bieMhcQLPqOP4JikuhYexLUszuPVZCInJG+0JNUAHCweG2
   PEj61zWOn8RHR6T+w7I4egZPZRkHOOivTCVTeOCaF7gtxlEcgoUE4wsDo
   A==;
X-CSE-ConnectionGUID: lzqMc3f5THmpNjm7GlyXwA==
X-CSE-MsgGUID: 4hxctsrwRQiGKbqeuLSg1Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11742"; a="86451696"
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="86451696"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2026 07:10:34 -0700
X-CSE-ConnectionGUID: mrcOBv3aTha/CBqwHz4sig==
X-CSE-MsgGUID: chhR5npDRJyWFGwfa/TPyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,146,1770624000"; 
   d="scan'208";a="224767597"
Received: from lkp-server01.sh.intel.com (HELO 3905d212be1b) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 28 Mar 2026 07:10:33 -0700
Received: from kbuild by 3905d212be1b with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1w6UMw-00000000BTJ-2WdM;
	Sat, 28 Mar 2026 14:10:30 +0000
Date: Sat, 28 Mar 2026 22:09:41 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 0/2]
 net/netfilter/core.c:43:30: sparse: sparse: symbol 'init_nf_hooks_bridge' was
 not declared. Should it be static?
Message-ID: <202603282146.Uw3JL8iV-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   1c08e57193aa5219b8fa24e666d79da02af3adab
commit: bc4d82ee40515f0c770b28d0dc4fa532a2b1850e [0/2] ANDROID: KMI workaround for CONFIG_NETFILTER_FAMILY_BRIDGE
config: i386-randconfig-061-20260327 (https://download.01.org/0day-ci/archive/20260328/202603282146.Uw3JL8iV-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
sparse: v0.6.5-rc1
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260328/202603282146.Uw3JL8iV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202603282146.Uw3JL8iV-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> net/netfilter/core.c:43:30: sparse: sparse: symbol 'init_nf_hooks_bridge' was not declared. Should it be static?
   net/netfilter/core.c:44:30: sparse: sparse: symbol 'init_nf_hooks_bridgep' redeclared with different type (different address spaces):
   net/netfilter/core.c:44:30: sparse:    struct nf_hook_entries [noderef] __rcu **[addressable] [toplevel] init_nf_hooks_bridgep
   net/netfilter/core.c: note: in included file (through include/linux/netdevice.h, include/linux/netfilter.h):
   include/net/net_namespace.h:208:31: sparse: note: previously declared as:
   include/net/net_namespace.h:208:31: sparse:    struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
--
   net/netfilter/nf_queue.c: note: in included file (through include/linux/netdevice.h, include/linux/netfilter.h):
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep

vim +/init_nf_hooks_bridge +43 net/netfilter/core.c

    41	
    42	#ifdef CONFIG_NETFILTER_FAMILY_BRIDGE
  > 43	struct nf_hook_entries __rcu *init_nf_hooks_bridge[NF_INET_NUMHOOKS];
    44	struct nf_hook_entries __rcu **init_nf_hooks_bridgep = &init_nf_hooks_bridge[0];
    45	EXPORT_SYMBOL_GPL(init_nf_hooks_bridgep);
    46	#endif
    47	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
