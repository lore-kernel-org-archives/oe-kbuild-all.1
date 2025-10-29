Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F7BA31B82C
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 08:42:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761727349; cv=none; b=JsT105NFbU66/cdznSJnkuyiXYFd4XqtLMMxSFqfxb9gfm/tnXpjqqkVk2g9gasbg+xX0GvtoH1WiLPZRBJMXb9tZQTjLKuwEGqW96G5sqNFxSHLf31xG3XHy3O4yJyg5QidS1w8C5FmLm7Ot2ZZKdcupJwKeHrt23F9hSN0O0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761727349; c=relaxed/simple;
	bh=cRdY7XOswlm4a9BPdZbTOgAnf5nn6HApv28NZM1c0k4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f2irQmabz4BeAKHu1pn014jaiwb6jaJHw8IwXVtrGNenvVgDGlZTS8ivZlOn8dFzX3WgOJYslvbOEXma0jCRutB0y080itKBCwHSoqR7aEWC18ZEtGNUec51TSZpsoa7nLZschrgePcHWSBlZmSUJIJjL8OS+A9eP7QIP0WEQg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=j0AAh978; arc=none smtp.client-ip=198.175.65.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="j0AAh978"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761727348; x=1793263348;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=cRdY7XOswlm4a9BPdZbTOgAnf5nn6HApv28NZM1c0k4=;
  b=j0AAh978IOivWd8fXxPorTDYQCv6bzXwZeJJgD8wGJM+pHXl4GrwGpvn
   5Kc/K5+JGpW2YaERhrFAZSyopdu62Ap4SbkIKBG6/48xusEmeJBNWvUsb
   HCuAP72KpTroknALZVVLSNsElyvYXAlsbaIaoiGsSlENGlQcMXJs0hhkD
   0uxLsPBgf2cOGTvC0PH4iaNUx8c2ycScpwJ9uTXOnAQegb3dcJbhabrTj
   emdpir6VS6Q027zET+8NCsFygw4+b4SY8e3IrbR/T3TUM29IyCY0MaD6N
   074+idp78CQQ8Ck9eG7qojnOlPUjalMe2QZZWBEbBqiiQtBs9wEvC59CN
   w==;
X-CSE-ConnectionGUID: Y374eIUPSoyinuXEJCOe/g==
X-CSE-MsgGUID: R+IFbv87Qzai2lAP+hGe2Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67678508"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; 
   d="scan'208";a="67678508"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 01:42:27 -0700
X-CSE-ConnectionGUID: 6h0KGx3GToak83hx0ZXkNg==
X-CSE-MsgGUID: SoFLtdhORKmBrSR1sGPSJw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; 
   d="scan'208";a="189950777"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa005.fm.intel.com with ESMTP; 29 Oct 2025 01:42:26 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vE1l4-000KPl-1A;
	Wed, 29 Oct 2025 08:42:19 +0000
Date: Wed, 29 Oct 2025 16:41:13 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-6.1 0/1]
 include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return
 expression (different address spaces)
Message-ID: <202510291639.B6OoPLFk-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android14-6.1
head:   7ca912bfce3de8994246a3dc649a2819e8ed23ff
commit: bc4d82ee40515f0c770b28d0dc4fa532a2b1850e [0/1] ANDROID: KMI workaround for CONFIG_NETFILTER_FAMILY_BRIDGE
config: i386-randconfig-062-20251029 (https://download.01.org/0day-ci/archive/20251029/202510291639.B6OoPLFk-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251029/202510291639.B6OoPLFk-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510291639.B6OoPLFk-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
   net/bridge/br_forward.c: note: in included file (through include/linux/netdevice.h):
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
--
   net/bridge/br_stp_bpdu.c: note: in included file (through include/linux/netdevice.h, include/linux/netfilter.h, include/uapi/linux/netfilter_bridge.h, ...):
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
--
   net/bridge/br_input.c: note: in included file (through include/linux/netdevice.h):
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
--
   net/bridge/br_multicast.c: note: in included file (through include/linux/igmp.h):
   include/uapi/linux/igmp.h:60:32: sparse: sparse: array of flexible structures
   net/bridge/br_multicast.c: note: in included file:
   include/net/mld.h:32:43: sparse: sparse: array of flexible structures
   net/bridge/br_multicast.c: note: in included file (through include/linux/netdevice.h):
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep
>> include/net/net_namespace.h:215:24: sparse: sparse: incorrect type in return expression (different address spaces) @@     expected struct nf_hook_entries [noderef] __rcu ** @@     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep @@
   include/net/net_namespace.h:215:24: sparse:     expected struct nf_hook_entries [noderef] __rcu **
   include/net/net_namespace.h:215:24: sparse:     got struct nf_hook_entries **extern [addressable] [toplevel] init_nf_hooks_bridgep

vim +215 include/net/net_namespace.h

   209	
   210	static inline struct nf_hook_entries __rcu **get_nf_hooks_bridge(const struct net *net)
   211	{
   212		struct ext_net *ext_net;
   213	
   214		if (net == &init_net)
 > 215			return init_nf_hooks_bridgep;
   216		ext_net = container_of(net, struct ext_net, net);
   217		return ext_net->hooks_bridge;
   218	}
   219	#endif
   220	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
