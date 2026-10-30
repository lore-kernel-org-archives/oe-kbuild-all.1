Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793348435;
	b=caaWKBlL8RBpyhklehIKB5GlHnycDAACo9RayMmD8SkInPNNTgNBRHctgpFBtK91h1e9
	 7D3UZzE5Kjer9LYqWeJtfR8JhUJIW+qNjhaHUEk3LzUhT+irLcUWOS6fmw0vmvlT4KlnN
	 +skL28rkNyNBzm7KC4VftOcokDvTqFtqUvmDOidFNWzAK/EEY3LL5RlBphIchzUA7cHoE
	 SurlKuQptWYSO8/I1wm9BmJXBBITX0oHeBwU1U8asr1OanceVhDwAiJSGuCR3+8VILVuC
	 +e1NrzxfnPDJZ8oOpXSFpCpgQE+t4fwDF2/vDD1OzRjSwR3nWcq+b2PHk6g1y1yoHdQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793348435;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Date:From:
	 To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=lIPzTuhussiig+aEn2mZeROStxtfOxwExgWef6pP0yc=;
	b=RvfFt3AcyB6qmTx9fnPZ7oV0Xa6mFqXZWA4ohZwuQmdfEKAtKPBUFp0HHZJKPj7AE9Ds
	 lO29e57wu1D9NaBuE73lzJur0h3/xAN5FSyPTrqNaHAgZhZNM3ltjAJnyW5/mw8Cx2ubF
	 CrbYqSa1l9jjUojAbd5ZUEQu3LF5ARjDtnOICVm8DWQ1uIqvj7y3oChkZHB+E6msCoIVw
	 B2y/uFk5aK35tikIo5chPfKmeoKVQutGig5QdC/+65QLTZHt8jKpfHmUWgKCdmvGRsuXB
	 byCSywmfn92V8MXcM1UooAn2ZwT9fK6QKO6SCmbE04P0INGXRYIa1Y6bPGDyGwBvszg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SNzxkYDL;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XDxD2R1S;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C220606A327
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 08:20:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9C220606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=SNzxkYDL;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=XDxD2R1S
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69U8F6bw2683320
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 08:20:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=lIPzTuhussiig+aEn2mZeROS
	txtfOxwExgWef6pP0yc=; b=SNzxkYDLAXzpsny7h/UM+IgX6WF5LAIfnCyrglve
	7xSqnpMslNfHzuKPJZQ2QMN3Zs34YqfCe/7kMON6xG3J1f41+w7tIy5N2TlNnjp5
	KJJUyWXUNjyoG9QivhWAgkwWWUcAwNU1bbAE/QKFzWXQUAS4Sio6iQ6w2dveRxCl
	WtHWBXFFAa8EsHO+mMPh7Rag5vndVCEKo0EUr7qlJNzSySanIZbO5D2BduKpp1Nc
	gevlKgISR2bvahCScNq4ko7bt9/Phf65roMbbv+oSrC0taHbbGd6yjGq3ixAHlaS
	aeRtfW0BUPU31XqrO4jbbwxN2h+KQFj383H5kxfHOglf1Q==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6qhycy-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 08:20:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-93f37c94ceeso293643485a.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 01:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793348433; x=1793953233; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=lIPzTuhussiig+aEn2mZeROStxtfOxwExgWef6pP0yc=;
        b=XDxD2R1SbXz159CRkg+7iTUbnh3ixK0neVHTIW1PLQGjtQursZdStbeqSvD3uDWmOq
         pUJbclUA3vrxT786Pl0LAkga0uZlxUNXPFMxwa+zWbuTCKARzNwzomK6nLnGpZbkYRiQ
         IpclokzPKlBt4Antp+pKqaa618O05XUc4F/lTEK9JX7IIHpb3osgNjvI0n/q9o41teWU
         sQUfvKVdOVql9o0kS2un5w1EzaM64j4r+v+YAUWvOTNlpRmzkaO0bR81rJRcyrA+riaE
         Lkzz9M6hUfVnAf4Xxn+sNKxv9qSnwTk3fMCG6/eHcruZOAeCCE3An7tShOWMVijI5NZG
         pQTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793348433; x=1793953233;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=lIPzTuhussiig+aEn2mZeROStxtfOxwExgWef6pP0yc=;
        b=q234hb68Do+XAkc/iseX/TZLWpwxS3SVINPbJJA79TWi9wiqKlTOpPi0kEoM09xy2Z
         JCaH9yTpG0LrXijwRqz+x0kF4Hl+1O3qAGKWtjkNDkFpOQi7Q+msgu/rd0hmfIZdfhVk
         n8zqOCUSTpyzWiGa/awzqZBueOqkPTAx5oZqGhRg8lsVd0uoYVUSm9FSO+xkuDFvgN8D
         1sO2K6ZYFJ8pmtlZ28Smka3JxOLZvzM5PHoZDFGvSBI7UbX/QRBGp+BwLDbz/jt9d5zH
         RLjwt9t7Zc7/yF3AA8dd3iIAyHGR+NCNF/48Sn52Sym9USyEi7uf1wunwzl0VWPaKkXy
         DC7w==
X-Forwarded-Encrypted: i=1; AKwUvBwLWsE7ocnOrfCVA/AWX3epcydkUG8EoxHfTaBNSCalnFzVJc95cL6GRo+vWbuBBl2Cu8e6BswtA4InLZVJ@lists.linux.dev
X-Gm-Message-State: AFq9FYIUeuGVjlCrlUbtUbM5M8PU55vCW5CeRNeux18xJkZQEBfg7Skx
	F71HI7oEABiFggechDX0NAwsBFVa88oJCuIfX7+DVVFKIHAcZJ1a+BU6xygznd7OlBASeGiJv5q
	GAlXRKIIBr6n01o9NotuxplHnptNMqaUv5D12Iq0HYBroLXQUQuB5U0h27QfY05KKn/xs
X-Gm-Gg: AYBFou3CeZj9RYnAaMoZB7goGV3Z+k+OMt6uES1N7jmcTyD8b69fvcKnbYBS3qzDZi6
	9B7WxKwUSlHimbseuL/0YB32s2fw7UvHBlIqzm7d0K85vlvQup0Z+AvirrZw4zle+TAFqJG7o4r
	W6ErK2JJb4RKFXY0/mE5JWV9OZlT+9qE2NM1ZxYbEPoZa2f60n/3tFblDzIoPfzL8XXHox2sFHa
	8IZqM447Wjjfro5CUR88odEp58E8942yhDWJ/b/fCtePIwelTebh3orutPCh6oPt32A8rgknbdz
	0oGqmwRjh63pFfy3kHD0aPum/BOq0VrTEOWkaIcMH+3SSj2dr9/ewAFoAcQdpBJ8XPDe8mDJ5lM
	1ivlUgDjeQWlDKH+X5hvGtQUOGEhB36id+smOf62CwJL0NyfI3IKHaRG1zN7vfCVKDF9EiWndxH
	bRFHQQWB/IMlAY0wHFyMW6GQ==
X-Received: by 2002:a05:620a:1a20:b0:93f:2b65:593b with SMTP id af79cd13be357-944133ecfd3mr741679185a.38.1793348432637;
        Fri, 30 Oct 2026 01:20:32 -0700 (PDT)
X-Received: by 2002:a05:620a:1a20:b0:93f:2b65:593b with SMTP id af79cd13be357-944133ecfd3mr741676385a.38.1793348432139;
        Fri, 30 Oct 2026 01:20:32 -0700 (PDT)
Received: from localhost (net-93-144-6-81.cust.dsl.teletu.it. [93.144.6.81])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b725b8sm1972421f8f.20.2026.10.30.01.20.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 01:20:30 -0700 (PDT)
Date: Fri, 30 Oct 2026 09:20:30 +0100
From: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>
To: kernel test robot <lkp@intel.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>,
        Phil Sutter <phil@nwl.cc>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
        Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
        David Ahern <dsahern@kernel.org>, Ido Schimmel <idosch@nvidia.com>,
        Shuah Khan <skhan@linuxfoundation.org>, oe-kbuild-all@lists.linux.dev,
        netdev@vger.kernel.org, netfilter-devel@vger.kernel.org,
        coreteam@netfilter.org, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH nf-next 5/8] net: netfilter: add IPv4 over IPv6 tunnel
 flowtable acceleration
Message-ID: <auRTTqtCzyQAjDEe@lore-desk>
References: <20261029-flowtable-sw-accel-ip6ip-sit-v1-5-6a17c54f9fb7@oss.qualcomm.com>
 <202610301255.BRNUBmqH-lkp@intel.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Bcierrnx+NloiNUP"
Content-Disposition: inline
In-Reply-To: <202610301255.BRNUBmqH-lkp@intel.com>
X-Proofpoint-GUID: u-E00TR0UaVOqoZ_U57veg1vC3-fNr7n
X-Authority-Analysis: v=2.4 cv=KLzPn1Fo c=1 sm=1 tr=0 ts=6ae45351 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=7fYLNvKHbgS61GKHX+yayQ==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=NEAV23lmAAAA:8
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=i3X5FwGiAAAA:8 a=QyXUC8HyAAAA:8
 a=hGUAt8QyJn-wdT-a5YkA:9 a=CjuIK1q_8ugA:10 a=FPnsdwdfccfL58mOmmoA:9
 a=IoWCM6iH3mJn3m4BftBB:22 a=mmqRlSCDY2ywfjPLJ4af:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDAzMyBTYWx0ZWRfXzPYSMRVHaesr
 sAIUQ6ZQug9PbqNzVr5Hn2kUx3s8L0Tt6nIZ6f4bFDjT9XvYH3buJTvsay5eE5vDRbqwe1Sb2Qp
 OLDTOGxTfCYY6eeeybHLkEKOPBHa7/po4A3BWaMjjZ2LoK5TIvjOrUmp8rBn3qJeO4qhBFjlVOB
 qZ9NPiv/rf+1SKdTwJI+MKwQQcDIh/DRJA58HjsoR75qtl1cTDjMS2cdz4+oxblsg9Nx0n/DQb9
 /sIMiXaFB4pf6dGMxXxjZH/Nq2M4EgaQ/LRMO4BiY072lRbhXA8nbKthE72n5ViduPiN0UhVRiy
 ofGnZBHweZT+hAyB7mqjFuifFs+6p+eNZHDiexqlunlKu3dxlhwy1Eahg+v00dA+zfoOCSY/wyq
 sg7KvJhf89MBQZrcYpx6G6OTj95e1OWnv88qIgSRFpTF9op2Xb9j1JrXVen2EzvSogZ4FC97oJa
 jwT4QRyaMoeeZ9tHwng==
X-Proofpoint-ORIG-GUID: u-E00TR0UaVOqoZ_U57veg1vC3-fNr7n
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDAzMyBTYWx0ZWRfX2tMJ1UEUxbh1
 0UX66kBXzyqcRrHv3QelhuPYUc4Lx8nXoJZC1SUs1Uw3hh+2hgtA5y3TVwDRN0kC8zkkYsn/ZVr
 HDBzNy2YRXWTzpctqcEVjbS46RmkjiM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 adultscore=0 spamscore=0 malwarescore=0 impostorscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 suspectscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300033

--Bcierrnx+NloiNUP
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Hi Lorenzo,
>=20
> kernel test robot noticed the following build warnings:
>=20
> [auto build test WARNING on 734bef548a96e8774d6eef5dfa2026c6edc4e80b]
>=20
> url:    https://github.com/intel-lab-lkp/linux/commits/Lorenzo-Bianconi/n=
et-netfilter-nf_flow_table-recognize-IPv4-IPv6-in-tunnel-proto-matching/202=
61029-143512
> base:   734bef548a96e8774d6eef5dfa2026c6edc4e80b
> patch link:    https://lore.kernel.org/r/20261029-flowtable-sw-accel-ip6i=
p-sit-v1-5-6a17c54f9fb7%40oss.qualcomm.com
> patch subject: [PATCH nf-next 5/8] net: netfilter: add IPv4 over IPv6 tun=
nel flowtable acceleration
> config: m68k-defconfig (https://download.01.org/0day-ci/archive/20261030/=
202610301255.BRNUBmqH-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 16.2.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20261030/202610301255.BRNUBmqH-lkp@intel.com/reproduce)
>=20
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202610301255.BRNUBmqH-lkp=
@intel.com/
>=20
> All warnings (new ones prefixed by >>):
>=20
>    net/netfilter/nf_flow_table_ip.c: In function 'nf_flow_queue_xmit4':
> >> net/netfilter/nf_flow_table_ip.c:891:35: warning: variable 'dst' set b=
ut not used [-Wunused-but-set-variable=3D]
>      891 |                 struct dst_entry *dst;
>          |                                   ^~~
>    net/netfilter/nf_flow_table_ip.c: In function 'nf_flow_queue_xmit6':
>    net/netfilter/nf_flow_table_ip.c:1237:35: warning: variable 'dst' set =
but not used [-Wunused-but-set-variable=3D]
>     1237 |                 struct dst_entry *dst;
>          |                                   ^~~

ack, I will fix it in v2.

Regards,
Lorenzo

>=20
>=20
> vim +/dst +891 net/netfilter/nf_flow_table_ip.c
>=20
>    858=09
>    859	static int nf_flow_queue_xmit4(struct nf_flowtable_ctx *ctx,
>    860				       struct sk_buff *skb,
>    861				       struct flow_offload_tuple_rhash *tuplehash,
>    862				       const struct nf_hook_state *state)
>    863	{
>    864		struct flow_offload_tuple *other_tuple;
>    865		enum flow_offload_tuple_dir dir;
>    866		struct nf_flow_xmit xmit =3D {};
>    867		union nf_inet_addr *ip_addr;
>    868		struct flow_offload *flow;
>    869		struct neighbour *neigh;
>    870		struct rtable *rt;
>    871=09
>    872		if (unlikely(tuplehash->tuple.xmit_type =3D=3D FLOW_OFFLOAD_XMIT_=
XFRM)) {
>    873			rt =3D dst_rtable(tuplehash->tuple.dst_cache);
>    874			memset(skb->cb, 0, sizeof(struct inet_skb_parm));
>    875			IPCB(skb)->iif =3D skb->dev->ifindex;
>    876			IPCB(skb)->flags =3D IPSKB_FORWARDED;
>    877			return nf_flow_xmit_xfrm(skb, state, &rt->dst);
>    878		}
>    879=09
>    880		dir =3D tuplehash->tuple.dir;
>    881		flow =3D container_of(tuplehash, struct flow_offload, tuplehash[d=
ir]);
>    882		other_tuple =3D &flow->tuplehash[!dir].tuple;
>    883		ip_addr =3D (union nf_inet_addr *)&other_tuple->src_v4;
>    884=09
>    885		if (nf_flow_tunnel_push(state->net, skb, other_tuple,
>    886					tuplehash->tuple.dst_cache, &ip_addr) < 0)
>    887			return NF_DROP;
>    888=09
>    889		switch (tuplehash->tuple.xmit_type) {
>    890		case FLOW_OFFLOAD_XMIT_NEIGH: {
>  > 891			struct dst_entry *dst;
>    892=09
>    893			xmit.outdev =3D dev_get_by_index_rcu(state->net, tuplehash->tupl=
e.ifidx);
>    894			if (!xmit.outdev) {
>    895				flow_offload_teardown(flow);
>    896				return NF_DROP;
>    897			}
>    898			if (other_tuple->tun.encap_proto ?
>    899			    other_tuple->tun.encap_proto =3D=3D AF_INET6 :
>    900			    ctx->tun.inner_proto =3D=3D IPPROTO_IPV6) {
>    901				struct rt6_info *rt6;
>    902=09
>    903				rt6 =3D dst_rt6_info(tuplehash->tuple.dst_cache);
>    904				neigh =3D ip_neigh_gw6(rt6->dst.dev,
>    905						     rt6_nexthop(rt6, &ip_addr->in6));
>    906				dst =3D &rt6->dst;
>    907			} else {
>    908				rt =3D dst_rtable(tuplehash->tuple.dst_cache);
>    909				neigh =3D ip_neigh_gw4(rt->dst.dev,
>    910						     rt_nexthop(rt, ip_addr->ip));
>    911				dst =3D &rt->dst;
>    912			}
>    913			if (IS_ERR(neigh)) {
>    914				flow_offload_teardown(flow);
>    915				return NF_DROP;
>    916			}
>    917			xmit.dest =3D neigh->ha;
>    918			skb_dst_drop(skb);
>    919			skb_dst_set_noref(skb, &rt->dst);
>    920			break;
>    921		}
>    922		case FLOW_OFFLOAD_XMIT_DIRECT:
>    923			xmit.outdev =3D dev_get_by_index_rcu(state->net, tuplehash->tupl=
e.out.ifidx);
>    924			if (!xmit.outdev) {
>    925				flow_offload_teardown(flow);
>    926				return NF_DROP;
>    927			}
>    928			xmit.dest =3D tuplehash->tuple.out.h_dest;
>    929			xmit.source =3D tuplehash->tuple.out.h_source;
>    930			break;
>    931		default:
>    932			WARN_ON_ONCE(1);
>    933			return NF_DROP;
>    934		}
>    935		xmit.tuple =3D other_tuple;
>    936		xmit.needs_gso_segment =3D tuplehash->tuple.needs_gso_segment;
>    937=09
>    938		return nf_flow_queue_xmit(state->net, skb, &xmit);
>    939	}
>    940=09
>=20
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

--Bcierrnx+NloiNUP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCauRTTgAKCRA6cBh0uS2t
rNyiAP96de8d8ol5sTVxCRMFuA1Y2F1Jeg1ujGKpbilvjjArHQEA9gKtTM3eyFXo
NwZOtc15lb5dcMPPGX8LETiowFvdEA4=
=vQ0n
-----END PGP SIGNATURE-----

--Bcierrnx+NloiNUP--
