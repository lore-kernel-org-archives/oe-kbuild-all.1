Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794566207;
	b=B+UW9K+c0q3CzwaJLc8sBuQth7k4vIA5PUIdlyGwKyvWSpaPe4DzEfIpX2LAXp5p9fwI
	 8jOUrWTosEwlhUuafIf9q1aUZbRXeKIhNck+TPH07G7dJOMSMZyhHAp56zo4WMxGpmvpH
	 RTGEt4/SKJn234P+nePqA3UqBdbWo5dE24EkXbUSDM/959qk7IxcLvBMvvnbvRODBec3I
	 hjZQxhoyobf99H8BZZK1R5ozXjT8+jrgLLoGkBoqS2O8NIQV4+Yu3VQ0aUnkSmUoC9Zji
	 xP3hs86dD5KsJL679AgI8h1IlN7pJDDPxhBBGZ8VmtDY1G8j8CpZCmzcMlYbZL7DTNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794566207;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=TIRq3qoQcx37PZQ5Pufc9RJv8Db/W04dnNHwHC7tD8Q=;
	b=egX97GbFgg4nFVorZxdTHuHbEVLYnRHNdDvoOj0uQTdwMx+FXQ0lHrtUQW5zEglyzaJm
	 0gVj/eIzPxjgmcTMePbBbg0D8AkEQPp4KC4yhjT55ep/gyLihjm0qxqAil+eu8MgYryPW
	 qg+htrMtzxj8VbihiYAYkrTgbRkHO2sDnFUoGbq1DwJtzIx1SHF/k7LVeFnAmn5XuVkst
	 ljq8Qst20dniiJcKC9lOVXKTDvVK68itZGzKa758fmNP8HmTGMV9ybvOXoxgptgGrtztl
	 WVGIMuTdH9GlHRi2D15HIApWSDTxksj97KGi5UF+mBwyIvPA2yfsssJPGneUCqAuPWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j8LeEg17;
	arc=none smtp.remote-ip=192.198.163.18
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DD1D606A327
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 10:36:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7DD1D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=j8LeEg17
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794566207; x=1826102207;
  h=date:from:to:cc:subject:message-id;
  bh=PxZGGZVfUGf2zlRupJ1kyqh1m8QnwxCVKNETj7t8TMg=;
  b=j8LeEg17fGXhf6kRol9996WWdqUQoqDCNW05Za40fjt7zjBLaBF1l4YB
   tX6wB3TjA0BlwobwibOEVauFMeJubsxSvrm1KopHSKvOgBGT0q1weYElY
   fb89YTmtPLoJU4VwLt6fYRq1OcCEKoMFiH8utoqSNvLpuI5NeBgwXydBE
   fGpzIYInomFqZNPP+1JWPvdgBmNNpelD7E6LpNpymteDCdy1LX7WHdWwH
   rF0gRwrqQZ7/NplVsyCHcPC+a9no70ZftoMbOcNF2oivoQFHNTQdtn6tG
   IU3j84Jquy86vt7p1bMhYYUc3Bk99fi6fQc1ElboYbfrnHCAEBZbMHFU1
   A==;
X-CSE-ConnectionGUID: eT+kiyOSS+6pJ6FuF1AONg==
X-CSE-MsgGUID: cZTQ764FQxKKjev0C37MFA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3394031"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3394031"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 02:36:46 -0800
X-CSE-ConnectionGUID: q7tak3DESQSKyD+7KqDt3g==
X-CSE-MsgGUID: bzSleLlmQLWz0dbMaeSfFA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="9442417"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 13 Nov 2026 02:36:44 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRoeA-000000001D9-0rdI;
	Fri, 13 Nov 2026 10:36:42 +0000
Date: Fri, 13 Nov 2026 11:36:04 +0100
From: kernel test robot <lkp@intel.com>
To: Julian Anastasov <ja@ssi.bg>
Cc: oe-kbuild-all@lists.linux.dev, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [netfilter-nf:for-netdev-nf-26-11-13 27/27]
 net/netfilter/ipvs/ip_vs_conn.c:1060:35: error: 'ip_vs_null_xmit_v6'
 undeclared; did you mean 'ip_vs_null_xmit'?
Message-ID: <202611131101.le6Vd9B2-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git for-netdev-nf-26-11-13
head:   937b060406a547e4d931525e600540726ea26532
commit: 937b060406a547e4d931525e600540726ea26532 [27/27] ipvs: pass correct sk to update_pmtu and on tunneling
config: loongarch-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261113/202611131101.le6Vd9B2-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 16.2.0
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611131101.le6Vd9B2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611131101.le6Vd9B2-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/netfilter/ipvs/ip_vs_conn.c: In function 'ip_vs_bind_xmit':
>> net/netfilter/ipvs/ip_vs_conn.c:1060:35: error: 'ip_vs_null_xmit_v6' undeclared (first use in this function); did you mean 'ip_vs_null_xmit'?
    1060 |                 cp->packet_xmit = ip_vs_null_xmit_v6;
         |                                   ^~~~~~~~~~~~~~~~~~
         |                                   ip_vs_null_xmit
   net/netfilter/ipvs/ip_vs_conn.c:1060:35: note: each undeclared identifier is reported only once for each function it appears in


vim +1060 net/netfilter/ipvs/ip_vs_conn.c

  1034	
  1035	/*
  1036	 *	Bind a connection entry with the corresponding packet_xmit.
  1037	 *	Called by ip_vs_conn_new.
  1038	 */
  1039	static inline void ip_vs_bind_xmit(struct ip_vs_conn *cp)
  1040	{
  1041		switch (IP_VS_FWD_METHOD(cp)) {
  1042		case IP_VS_CONN_F_MASQ:
  1043			cp->packet_xmit = ip_vs_nat_xmit;
  1044			break;
  1045	
  1046		case IP_VS_CONN_F_TUNNEL:
  1047	#ifdef CONFIG_IP_VS_IPV6
  1048			if (cp->daf == AF_INET6)
  1049				cp->packet_xmit = ip_vs_tunnel_xmit_v6;
  1050			else
  1051	#endif
  1052				cp->packet_xmit = ip_vs_tunnel_xmit;
  1053			break;
  1054	
  1055		case IP_VS_CONN_F_DROUTE:
  1056			cp->packet_xmit = ip_vs_dr_xmit;
  1057			break;
  1058	
  1059		case IP_VS_CONN_F_LOCALNODE:
> 1060			cp->packet_xmit = ip_vs_null_xmit_v6;
  1061			break;
  1062	
  1063		case IP_VS_CONN_F_BYPASS:
  1064			cp->packet_xmit = ip_vs_bypass_xmit;
  1065			break;
  1066		}
  1067	}
  1068	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
