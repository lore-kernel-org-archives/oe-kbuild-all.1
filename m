Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793963862;
	b=QcNUNg35J7UqrhEl9X+tAXl1SzPQAeWX9jyeOTHkWpZw/0VX0GLK/jzBOoxmW2uQbPN3
	 JrUvqfMrw2evHOOCMVB1ITIzukel1l7gtWabTBBf+MPw8fmoeW9IZVeIOOyQekIZOJ+3t
	 cG9xYpy8td6ZWBXuhojGV3dxT49j8+cmCqjB74TJTml0SxOqMESQOXsZqJomEZsUtQp9L
	 JPOU/z5PrmnIgxPwOm4O/7inZoU1U7CCQzoHRAa7GJpPmMn5KKG7zoQe+YGR1Qt43a7v6
	 qlx9dwO7DTwLfLzGhKyt0benty+NOLmUUhq76ShSAeuyVoFqzHovQ/+wz7y7F+8VSRA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793963862;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=syd+CNdsIjsQRGD5YVqLOa0RRoQUs2COeya4f77xoOo=;
	b=nVrT/75gawvSTtEL5oqo2hMQYkSgJcqILrcvrFup2Y5KeXrmV55dzSKVPNpM9aPKucKT
	 zq2UQnPQ1ZC7v8MTMtXtuhmnOV/BlRueCMoBW4Ipb7Npqp71ieVWCx36XEXrMS/Xuy3xu
	 tdS8ZMzyF4eVFGfH8mPp2IjQoirTQslZskTwE/59BjM0PSI4aBjOLuJDxrlqobQJqQ8UU
	 jRLJ8N/1XoMO9h99bDEFVp+Sdf6PgyiS3JM2WPY68MrikvltEkdTfPhVOpmj+Oo8j2exL
	 BWYc6Y87XAKUVAjVnCZUDZHiyI6Y80BuCFZtSZ1qT1T2xmxlYi2b/HX77HfN62xwU1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IDhoEqEy;
	arc=none smtp.remote-ip=198.175.65.17
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 85E9D606D80C
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Nov 2026 11:17:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 85E9D606D80C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=IDhoEqEy
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793963861; x=1825499861;
  h=date:from:to:cc:subject:message-id;
  bh=iU/jDm3VUk80UBT/dOOjD5Dj3KSmV/WSrT8hLbGNSH4=;
  b=IDhoEqEyDhsOojWzam6JlCNdOtfXy4mKKViZ3g70qZCiuOmMwvxeS5U3
   cIoQMzd/M/cjFOakOCq5mwtbdOt9N1f2U4w6Bzrkxgj1OsyTp07GKhlmG
   4e9UeyIyZ/24g8QGV3yMT/XSobXQ44qQDg2FhcpcERdVBwgb/I+okTAwq
   Yg1O5kEiycKMxor0ge25rd2Y7yKvgmIH70UHk/fEDSx0KxTcd99C1arG6
   l7fIz0DtnIahN6Fw/nOciosgaEwrVlhxj/OWUPkPfvRFqTFKE8Xv0Y6E+
   EMzonJVBD4h/e2Oby17uFZPWAWALe6bxYKvq/y+Z/MucCbvAFFxmfoz9e
   A==;
X-CSE-ConnectionGUID: 9KHSN/XhQJ6PaVCsYVvHgA==
X-CSE-MsgGUID: Ww7xZ+pPRIynW80wGkKAbA==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2802588"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2802588"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Nov 2026 03:17:39 -0800
X-CSE-ConnectionGUID: 1t18zwedR3makGewzubfKg==
X-CSE-MsgGUID: zPR6Ku6WQOqoKQeQX46liw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7375123"
Received: from igk-lkp-server01.igk.intel.com (HELO 58ca8a381a5c) ([10.211.93.152])
  by fmviesa005.fm.intel.com with ESMTP; 06 Nov 2026 03:17:37 -0800
Received: from kbuild by 58ca8a381a5c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xPHwr-00000000AEF-3OL9;
	Fri, 06 Nov 2026 11:17:33 +0000
Date: Fri, 06 Nov 2026 12:17:02 +0100
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android14-kiwi-6.1 390/390]
 net/netfilter/core.c:43:30: sparse: sparse: symbol 'init_nf_hooks_bridge' was
 not declared. Should it be static?
Message-ID: <202611061218.q7KGOLAq-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://android.googlesource.com/kernel/common android14-kiwi-6.1
head:   900d46d1c904d34d7c3eeb0ef2119cffc5a8ab3d
commit: bc4d82ee40515f0c770b28d0dc4fa532a2b1850e [390/390] ANDROID: KMI workaround for CONFIG_NETFILTER_FAMILY_BRIDGE
config: arm64-randconfig-r2310-20261105 (https://download.01.org/0day-ci/archive/20261106/202611061218.q7KGOLAq-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 9.5.0
sparse: v0.6.5-rc1-21-g84ec0658
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261106/202611061218.q7KGOLAq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611061218.q7KGOLAq-lkp@intel.com/

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
--
   net/netfilter/ipvs/ip_vs_xmit.c: note: in included file (through include/linux/netdevice.h, include/net/sock.h, include/linux/tcp.h):
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
