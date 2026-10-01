Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F8E493D5E
	for <oe-kbuild-all@lists.linux.dev>; Thu,  1 Oct 2026 15:06:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790867174; cv=none; b=aMgBTypFMV6v/nPhZ0SUIWwxfMX0u1Ci1bwMc+ZgVUhipDBNx4CK+FdKoiLywOuHncZTVguc2xi1+gFGSLmwxaxGZnFVRv4ulHS1CGzNvm/cQyAC11/uKRWdZSQn6vlXndtqBGtkzYxjGS39m5ZldsHdZNWGPI5iDKgLpPvS9yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790867174; c=relaxed/simple;
	bh=MluRRZUB/OFkKxe759UMzu9zesrZSp4axb6wksuUZYM=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U5TSNYtLoGODA0/mlHEZRL6loqUqTfPCckWaotR30PZhl+pKqNy7UdIflCxTZYYwhoWT59mnxdUuLYtd3VOfqSyekdlkFWYRgmwK1HJoK7Kr35t2N8s2XGFfDRH7IBQnwfms1LCA8lDulqp5FG84yeZZV7c5ZEwBRuZDBdOs1wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=TRnPwiyH; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="TRnPwiyH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790867172; x=1822403172;
  h=date:from:to:cc:subject:message-id;
  bh=MluRRZUB/OFkKxe759UMzu9zesrZSp4axb6wksuUZYM=;
  b=TRnPwiyHIs+brHXZC5a1YpUL0zqLUmvcAXAWbTrdNbbrAb0YTRjRV6e2
   SEBw1HDQ/47pLHOPPwQDMn2guCdZs8a2YHwu3f7rP/gJ+/ZrDL0XFrVec
   MjaXqlXC3e2Bpl9ZHVHj0r0zOHcFGFCJszQxziMfpKBxMR3coV8hBed1w
   +uQUMApCR8SXuEdM2EuH0L3MFbv5Lqu0Mea6Wu03SPBXtP77vBoQje35I
   8Dgao4khzZXzt0svhsB+YB4RvoyUeSqQ2U94bl2vHHULu0kGadRwKiINB
   DV0yBN7ZoJO3acX3Fior/j4oWNlfhLF00Hz1pDNcRU6rTwRX0XNuzmkt9
   w==;
X-CSE-ConnectionGUID: riC3gywZRmWg+4qK5Rkntw==
X-CSE-MsgGUID: inNbyDwkR7qL4tO+4spXuA==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="102149825"
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="102149825"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 08:06:11 -0700
X-CSE-ConnectionGUID: UQg3N0woTfqvXcc0NAjQMQ==
X-CSE-MsgGUID: Rh+fz3xPS5KmxdJGD5/BZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,134,1787036400"; 
   d="scan'208";a="275543791"
Received: from igk-lkp-server01.igk.intel.com (HELO 3fb566d470b1) ([10.211.93.152])
  by fmviesa007.fm.intel.com with ESMTP; 01 Oct 2026 08:06:10 -0700
Received: from kbuild by 3fb566d470b1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCIMJ-0000000007h-40pE;
	Thu, 01 Oct 2026 15:06:07 +0000
Date: Thu, 01 Oct 2026 17:05:15 +0200
From: kernel test robot <lkp@intel.com>
To: Fernando Fernandez Mancera <fmancera@suse.de>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: include/net/route.h:176:51: error: parameter name omitted
Message-ID: <202610011609.bSwqw8eT-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Fernando-Fernandez-Mancera/ipv4-introduce-CONFIG_IPV4-to-decouple-the-IPv4-stack/20260928-212957
head:   9699ec4e92ef081fbb0e1a4247538ba53e5b17bf
commit: 809c9f483b87854f5b7ede3ce9ac6e372855169c net: core: add IPv4 fallback stubs and guards for CONFIG_IPV4=n
date:   3 days ago
config: microblaze-randconfig-r2202-20261001 (https://download.01.org/0day-ci/archive/20261001/202610011609.bSwqw8eT-lkp@intel.com/config)
compiler: microblaze-linux-gcc (GCC) 8.5.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261001/202610011609.bSwqw8eT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610011609.bSwqw8eT-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/net/ip.h:30,
                    from mm/memcontrol.c:69:
   include/net/route.h: In function 'ip_route_output_flow':
>> include/net/route.h:176:51: error: parameter name omitted
    static inline struct rtable *ip_route_output_flow(struct net *, struct flowi4 *flp,
                                                      ^~~~~~~~~~~~


vim +176 include/net/route.h

   171	
   172	#if IS_ENABLED(CONFIG_IPV4)
   173	struct rtable *ip_route_output_flow(struct net *, struct flowi4 *flp,
   174					    const struct sock *sk);
   175	#else
 > 176	static inline struct rtable *ip_route_output_flow(struct net *, struct flowi4 *flp,
   177							  const struct sock *sk)
   178	{
   179		return ERR_PTR(-EAFNOSUPPORT);
   180	}
   181	#endif
   182	struct dst_entry *ipv4_blackhole_route(struct net *net,
   183					       struct dst_entry *dst_orig);
   184	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
