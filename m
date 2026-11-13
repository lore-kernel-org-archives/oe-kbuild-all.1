Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.238.174.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794572137;
	b=hM6MQDUVPznepidnNh6f2YgjbRu3qhLSznZ+RMZLL2lUxwt2qxvV43Xu2COn7WvVWoHE
	 Z33VhGpZiu2uZMynCwXmsA6jIti0zyleDVZ0OW/T/wGSAgDdzbt1ONrrzfyHPWFLr8VAG
	 WK2SwNvzn9Im+MxwTBSS4RmZsJFp+cVk4gNuC0P+SQp5igo7XxYZWc50crxVjNRiZbLj6
	 yCpbm6mafbnIjGaL1pqeqQ+6Q04uGffxgfC37o2ISlhxlyyiBhXQjVDVIpMSKoOsXIOpX
	 IKHP0SLwy/kKS0JCgrH+oQXmg1UArgsM8XtNy8nVfefBY5TXfiZ1DbBkkmTliK8moqA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794572137;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:Date:
	 From:To:cc:Subject:In-Reply-To:Message-ID:References:MIME-Version:
	 Content-Type;
	bh=t8N8x2Igtk7oV4L5xhpxOoH6I/G26PM/FWp4GyRjTGc=;
	b=Q+q/ScGUE0drsxBnYGoG1WwOVoxeswyZxfQViIbohAcSWTUe8sn55/dshYmo3Vy2BuES
	 mvswJLm3sldBgfdWg0s5kpvO8Fwort8h50zxm1AXY33+RBhw2BzyPNkJ7Q9gJQgCDcclV
	 JD4jv9i4GqRRBiAZoKTMofffgr1vOb4LW3ZeUAa9TUsVRO00BYirNnXVs9yxVVNUIAgvl
	 KW/8QOoiIzuojMnYoMqVdqHk4nKutFq90hxfYK+EXqoyYEckRcOLZetPthNPhm4NfZemF
	 CZOyvjLMsQeQFiEFqDGzQ4shiBCEJLW45qpfjP0rVZjAZmLTv4/bn5YpGVYjSFuCIBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ssi.bg;
	spf=pass smtp.mailfrom=ssi.bg;
	dkim=pass header.d=ssi.bg header.i=@ssi.bg header.a=rsa-sha256 header.s=ssi header.b=MsT49Gp1;
	arc=none smtp.remote-ip=193.238.174.39
Received: from mx.ssi.bg (mx.ssi.bg [193.238.174.39])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BC5D606A32A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 12:15:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BC5D606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ssi.bg
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ssi.bg
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=ssi.bg header.i=@ssi.bg header.a=rsa-sha256 header.s=ssi header.b=MsT49Gp1
Received: from mx.ssi.bg (localhost [127.0.0.1])
	by mx.ssi.bg (Potsfix) with ESMTP id 9EE0D21420;
	Fri, 13 Nov 2026 14:15:35 +0200 (EET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ssi.bg; h=cc:cc
	:content-type:content-type:date:from:from:in-reply-to:message-id
	:mime-version:references:reply-to:subject:subject:to:to; s=ssi;
	 bh=t8N8x2Igtk7oV4L5xhpxOoH6I/G26PM/FWp4GyRjTGc=; b=MsT49Gp1OBtt
	D9qWJQmX7+BEMl7euSARvTw4W6g/oJF2AuIrcdd4yhbbk20bFXAw7BNo+8upoDae
	/49fPMBDvEjstJxodgOuKoAHo08Flp6Xtxeh9v/KUUfbMo9KY44wV9wi46v4eSyr
	iFDyIPIGLRSYMmy4bOVwJ5ILKF0rIS9Ypdb2FkjV3GmvSfDNnXI5yvafClp1c7Zs
	o1qL/MVHCbN5jhbIZl6yM4zBURkgY/D2uVhLhxTLISht1BEc9FyI0oNHD9LsB6jf
	3c9oX0oKnJ+GmFYRV17J+3osCdK+CtHAOPLWNQAqHaJboNhpOFFwjYWkZXjE2qls
	EAj5z79fILvpGi2P5QjiVpB8wG6IxIuirmg1W99maLPttlZDe2jLH2OVE8l/AQyW
	oKLPW/rRxYPa0xscW2kgKKACkn0XUvNFipANTjmdvXB3Tw5QcemPTuLPLPPMh5O/
	SlxIcgrGLPHPjfQVH79yTQF1m419yKWOHIRniDFj8ehbjYc662r7s7bdktSlZc8n
	TXDC8ZEePQrdHYINgZ/Z0JVMTITawI9Hna0miwmsSS3b/Jh+pZH7db41TeiD5cn/
	jPXi2Z6MoJb5V3KUKwnxmxBCSHYBx4kI7DbOBdVwHuJWD1Rl0xRe44sEy2eqTKSW
	LZRIN0MJ4WT2gOXiFuSLIUJt2Wxd/3E=
Received: from box.ssi.bg (box.ssi.bg [193.238.174.46])
	by mx.ssi.bg (Potsfix) with ESMTPS;
	Fri, 13 Nov 2026 14:15:35 +0200 (EET)
Received: from ja.ssi.bg (unknown [213.16.62.126])
	by box.ssi.bg (Potsfix) with ESMTPSA id 12DEB601BD;
	Fri, 13 Nov 2026 14:15:35 +0200 (EET)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by ja.ssi.bg (8.18.2/8.18.2) with ESMTP id 6ADCFXJk042625;
	Fri, 13 Nov 2026 14:15:33 +0200
Date: Fri, 13 Nov 2026 14:15:33 +0200 (EET)
From: Julian Anastasov <ja@ssi.bg>
To: kernel test robot <lkp@intel.com>
cc: oe-kbuild-all@lists.linux.dev, netfilter-devel@vger.kernel.org,
        coreteam@netfilter.org, Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: [netfilter-nf:for-netdev-nf-26-11-13 27/27]
 net/netfilter/ipvs/ip_vs_conn.c:1060:21: error: use of undeclared identifier
 'ip_vs_null_xmit_v6'; did you mean 'ip_vs_null_xmit'?
In-Reply-To: <e71d62ac-441c-ee4c-ed98-7216477d73ef@ssi.bg>
Message-ID: <a4565204-36ef-1723-d016-a52c8144516e@ssi.bg>
References: <202611131204.pFzcf1WG-lkp@intel.com> <e71d62ac-441c-ee4c-ed98-7216477d73ef@ssi.bg>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII


	Hello,

On Fri, 13 Nov 2026, Julian Anastasov wrote:

> On Fri, 13 Nov 2026, kernel test robot wrote:
> 
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf.git for-netdev-nf-26-11-13
> > head:   937b060406a547e4d931525e600540726ea26532
> > commit: 937b060406a547e4d931525e600540726ea26532 [27/27] ipvs: pass correct sk to update_pmtu and on tunneling
> > config: i386-randconfig-2200-20261113 (https://download.01.org/0day-ci/archive/20261113/202611131204.pFzcf1WG-lkp@intel.com/config)
> > compiler: clang version 22.1.8 (https://github.com/llvm/llvm-project ca7933e47d3a3451d81e72ac174dcb5aa28b59d1)
> > smatch: v0.5.0-9187-g5189e3fb
> > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261113/202611131204.pFzcf1WG-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202611131204.pFzcf1WG-lkp@intel.com/
> > 
> > All errors (new ones prefixed by >>):
> > 
> > >> net/netfilter/ipvs/ip_vs_conn.c:1060:21: error: use of undeclared identifier 'ip_vs_null_xmit_v6'; did you mean 'ip_vs_null_xmit'?
> >     1060 |                 cp->packet_xmit = ip_vs_null_xmit_v6;
> >          |                                   ^~~~~~~~~~~~~~~~~~
> >          |                                   ip_vs_null_xmit
> >    include/net/ip_vs.h:1992:5: note: 'ip_vs_null_xmit' declared here
> >     1992 | int ip_vs_null_xmit(struct sk_buff *skb, struct ip_vs_conn *cp,
> >          |     ^
> >    1 error generated.
> > 
> > 
> > vim +1060 net/netfilter/ipvs/ip_vs_conn.c
> > 
> >   1034	
> >   1035	/*
> >   1036	 *	Bind a connection entry with the corresponding packet_xmit.
> >   1037	 *	Called by ip_vs_conn_new.
> >   1038	 */
> >   1039	static inline void ip_vs_bind_xmit(struct ip_vs_conn *cp)
> >   1040	{
> >   1041		switch (IP_VS_FWD_METHOD(cp)) {
> >   1042		case IP_VS_CONN_F_MASQ:
> >   1043			cp->packet_xmit = ip_vs_nat_xmit;
> >   1044			break;
> >   1045	
> >   1046		case IP_VS_CONN_F_TUNNEL:
> >   1047	#ifdef CONFIG_IP_VS_IPV6
> >   1048			if (cp->daf == AF_INET6)
> >   1049				cp->packet_xmit = ip_vs_tunnel_xmit_v6;
> >   1050			else
> >   1051	#endif
> >   1052				cp->packet_xmit = ip_vs_tunnel_xmit;
> >   1053			break;
> >   1054	
> >   1055		case IP_VS_CONN_F_DROUTE:
> >   1056			cp->packet_xmit = ip_vs_dr_xmit;
> >   1057			break;
> >   1058	
> >   1059		case IP_VS_CONN_F_LOCALNODE:
> > > 1060			cp->packet_xmit = ip_vs_null_xmit_v6;
> 
> 	We were not lucky this time. The original patch was trying to
> patch ip_vs_bind_xmit_v6() but due to the similar code in 
> ip_vs_bind_xmit() the change after applying occured in the IPv4 function
> which comes first.
> 
> 	Pablo, can some manual applying solve this or we should modify
> somehow this hunk to not match early in the file ? In this form it
> will do the same problem on the next tree.

	I hopefully solved this problem by reordering some code
for better speed, just posted v4.

> 
> >   1061			break;
> >   1062	
> >   1063		case IP_VS_CONN_F_BYPASS:
> >   1064			cp->packet_xmit = ip_vs_bypass_xmit;
> >   1065			break;
> >   1066		}
> >   1067	}
> >   1068	
> > 
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki

Regards

--
Julian Anastasov <ja@ssi.bg>

