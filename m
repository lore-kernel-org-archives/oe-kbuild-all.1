Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.16
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794569269;
	b=c1PQUnbZxd4+2ixZt3nPO6Q40PnO/FPTnDybX2sFgmfLH+81Kbq+qZS/a9xEA6QpsvLi
	 UKLRywmR3f8khAf912+Mk9cXWrmv5opZqtO4A+s/YA+RDaKWXRnk83DhBZiRkn4pyl+du
	 4siu/09YvrEssL8yLLBOS242+NOuVb5qf3jdVJzZukOkIKfW1XHVn5qtZ9SqBntcMnJpd
	 E2jLWl7l/KVP2UGHvFniM9iAP4dwohen87bDjmNuYRZN/WUQDgFgL8ci/zvFqJCS7feQH
	 Dwqr+IJrmLn2JPQ5ESS1lWiUDIAKiQV3hAQ2fLv1EWEf/iwhzzX+2l4kW24ZVBXVN1w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794569269;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=jb+Jq8mEOSP/+3jfof2fCZx8nezK1iMhQ/ZomWq2Dds=;
	b=e9ANgJ6vSqKhqXmdOkZmMzIslqvTHUkCj2ZC8KC3jZsHF33T6z6sjktEb3IeMOZXYxfz
	 gJtbdrXhLoy3sS2otEqg93QGVOBLNfOKHj0Cemt2B8VtDN2nrChiWRDsB2MJlBbmRorTG
	 zpL18cAcu0Ewh7395OrOYs6kF4QuYmgYHsd80q+xvmoeKbl8hT+WZR6cBj6dScwIdCUkx
	 +ERQfB6cvjpg308V5g55FeX1SzdgjFtXCxqUy75hRBi/yKQYoquT5Sw4Lf+0hyaUAs2xX
	 4mzBzZ89WzuevulzMD9sc3tFBNLOvrH3K6y4MqxG3J/uaSXlNQHEVpsJoZ56M3xZp5A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iUnV1Zfn;
	arc=none smtp.remote-ip=192.198.163.16
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C355606A323
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 11:27:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C355606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=iUnV1Zfn
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1794569268; x=1826105268;
  h=date:from:to:cc:subject:message-id;
  bh=azZBVjK2FhUaA/+MTuxXdpchAxTrUD8ifmvHKMgoAF8=;
  b=iUnV1Zfnwtu5P9e+T1G89DCgnDsh3jkBBjFWM+0iK62+n2OoU6lW9e4M
   8GMSZdMG+fhcWi9nTi0v8G5z+z5NN2DTI2IeJTAWBvWjP5B1bFFsYAen6
   ffES1VzNSFcUKFgz+h2gFmMae5TGqRKdxEJsBHfMMEj7MlXn+F3r3Apt6
   UPjakL4h8GJauTaA2+E3kyvOyRLQCiz82Jx24NrTCaV3oCKY2Mm5i/8ZU
   joGUjU5AruTY7befmEwcZgTm84TxPZNPTN3gLNrrZHxriBubqbv/vLip6
   CNknlzJhJXgnjRJXagMokJgxm0vnKPmpeMPCJdylFqL2OuBKm6/QKZL3+
   w==;
X-CSE-ConnectionGUID: uLeQ2z7nQRGyCuxHv+ubkg==
X-CSE-MsgGUID: IloZ9uODRxWAjPoLq9/ENA==
X-IronPort-AV: E=McAfee;i="6800,10657,11964"; a="3401335"
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="3401335"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Nov 2026 03:27:48 -0800
X-CSE-ConnectionGUID: 3hG9YljaTAmbgwapWiCNDg==
X-CSE-MsgGUID: 2pIXz34iR8+hDBvpVX12RQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,211,1787036400"; 
   d="scan'208";a="8811776"
Received: from igk-lkp-server01.igk.intel.com (HELO 1073a420ae3a) ([10.211.93.152])
  by orviesa007.jf.intel.com with ESMTP; 13 Nov 2026 03:27:47 -0800
Received: from kbuild by 1073a420ae3a with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xRpRX-000000001Dl-2ohb;
	Fri, 13 Nov 2026 11:27:43 +0000
Date: Fri, 13 Nov 2026 12:27:22 +0100
From: kernel test robot <lkp@intel.com>
To: Julian Anastasov <ja@ssi.bg>
Cc: oe-kbuild-all@lists.linux.dev, netfilter-devel@vger.kernel.org,
 coreteam@netfilter.org, Pablo Neira Ayuso <pablo@netfilter.org>
Subject: [netfilter-nf:for-netdev-nf-26-11-13 27/27]
 net/netfilter/ipvs/ip_vs_conn.c:1060:21: error: use of undeclared identifier
 'ip_vs_null_xmit_v6'; did you mean 'ip_vs_null_xmit'?
Message-ID: <202611131204.pFzcf1WG-lkp@intel.com>
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
config: i386-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261113/202611131204.pFzcf1WG-lkp@intel.com/config)
compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611131204.pFzcf1WG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611131204.pFzcf1WG-lkp@intel.com/

All errors (new ones prefixed by >>):

>> net/netfilter/ipvs/ip_vs_conn.c:1060:21: error: use of undeclared identifier 'ip_vs_null_xmit_v6'; did you mean 'ip_vs_null_xmit'?
    1060 |                 cp->packet_xmit = ip_vs_null_xmit_v6;
         |                                   ^~~~~~~~~~~~~~~~~~
         |                                   ip_vs_null_xmit
   include/net/ip_vs.h:1992:5: note: 'ip_vs_null_xmit' declared here
    1992 | int ip_vs_null_xmit(struct sk_buff *skb, struct ip_vs_conn *cp,
         |     ^
   1 error generated.


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
