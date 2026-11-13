Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=217.70.190.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794571202;
	b=ZqHaSu7tw58F+4ioH/3WW7Cs8QMeXr8YzF243of5393uDnf/CefsEJkLndfIyeq52a92
	 CxUBYIVDhdGI1sFZfgqO3iVZ5GbXeBxb5Rxa8xYHpc6Bt/RjYqM/ygfM7kyqJhStRs3H9
	 qYah3BEPk+TgCRhQocmGi6Y1ZW9pi8bMO9StWBS0WYv6qec45sDqKDOxnKVFMhLXbmYAp
	 oKRPYZkFHV6LAb+Be7kSXlN9Xr6aqIjPihiY4ephb8wibOafoq/ytN/d7tfOjeV30HjrS
	 qsuwuvjicd/cQBModr8P/dvh8t772kdELU8XuQOmuOMKA3mZOpItjHgFvcvn2+rt/CA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794571202;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To:X-Spam-Status:X-Spam-Checker-Version;
	bh=F6z6kO9QLC5dxZdKvObpAH8Cfuz+ZqCSODLNOd1MpAA=;
	b=OHzRXB5s6k1MAw4ZAVNjyEwKqTUqo2Oxis8awSUq+Mb4QLafPYcHP/ZTAMwzddzmP47g
	 jyF340nzdd8KwnUeUBVLyVnX+X+u1ALWNWaCBVZxfcopb/gQymfJXpx12QDfFZiIUuE7n
	 E0rkLQWTnkJ38Ij8hXxuhLmHALH2RNdn/rCc2zhU95EQB33e3oXOE9d+jZB2xsmAluxkK
	 opZ6ekGYZ0xvwquenDZU7ETrTOYcuMp4lJHf8BHYTlaLOh+PXgsXdFuzzEv9B3CW+cU4d
	 RThz0LK/ZFQQdEU/4S7A8j2lrQlZzcEC4jBHj6F3iHJYqwLyj3V6LflvPwZRwrvPfSg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=netfilter.org;
	spf=pass smtp.mailfrom=netfilter.org;
	dkim=pass header.d=netfilter.org header.i=@netfilter.org header.a=rsa-sha256 header.s=2025 header.b="rVTf/ivG";
	arc=none smtp.remote-ip=217.70.190.124
Received: from mail.netfilter.org (mail.netfilter.org [217.70.190.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id A1531606A882
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Nov 2026 12:00:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A1531606A882
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=netfilter.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=netfilter.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=netfilter.org header.i=@netfilter.org header.a=rsa-sha256 header.s=2025 header.b=rVTf/ivG
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=netfilter.org;
	s=2025; t=1794571199;
	bh=F6z6kO9QLC5dxZdKvObpAH8Cfuz+ZqCSODLNOd1MpAA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rVTf/ivGNWBBUPGu1fvNtyyeX3ZAPqW5L1Zd1htQsbyuB3Fo4VPrYlAxejPfmeQ8R
	 snZ/YNYEiEH/ITVoNOe+yHn4KBu4Gx7deR3PxUFhF4joGS3OK2tJAVTRY8AW++tPZw
	 6LVt56YNmpSZUmEh7h3XF3HrFeby5Gotp0ga0VTy8QWkh1ToPEWKgdJtANgNbnS/Sx
	 BOJczfqIKxN6iSuF5Vs6SIc5yhh0nF+Jmuu3vYTtRbXKGY6CIMAR/q2GDs7GKQgmSm
	 b9Q62BW4r999hHcZ1dDGm1R0GqiaVhFrGXJaZjsXjlhXmfnKqEH0ozMdWMg04aTjLV
	 rIqaQr4a1jp+A==
Received: from netfilter.org (mail-agni [217.70.190.124])
	by mail.netfilter.org (Postfix) with UTF8SMTPSA id 6B39560074;
	Fri, 13 Nov 2026 12:59:59 +0100 (CET)
Date: Fri, 13 Nov 2026 12:59:56 +0100
From: Pablo Neira Ayuso <pablo@netfilter.org>
To: Julian Anastasov <ja@ssi.bg>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev,
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org
Subject: Re: [netfilter-nf:for-netdev-nf-26-11-13 27/27]
 net/netfilter/ipvs/ip_vs_conn.c:1060:21: error: use of undeclared identifier
 'ip_vs_null_xmit_v6'; did you mean 'ip_vs_null_xmit'?
Message-ID: <avb7vOLH509WntPz@chamomile>
References: <202611131204.pFzcf1WG-lkp@intel.com>
 <e71d62ac-441c-ee4c-ed98-7216477d73ef@ssi.bg>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <e71d62ac-441c-ee4c-ed98-7216477d73ef@ssi.bg>

On Fri, Nov 13, 2026 at 01:52:27PM +0200, Julian Anastasov wrote:
> 
> 	Hello,
> 
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

That's strange, I have used git am, it should have complained about
this.

> 	Pablo, can some manual applying solve this or we should modify
> somehow this hunk to not match early in the file ? In this form it
> will do the same problem on the next tree.

This is:

[PATCH net 15/15] ipvs: pass correct sk to update_pmtu and on tunneling

My plan is to drop it in v2 of the IPVS PR, so you have another round
to post one patch that applies cleanly to nf.git or nf-next.git.

Thanks.
