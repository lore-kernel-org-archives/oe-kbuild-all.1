Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F23BD2749DA
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 10:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753783593; cv=none; b=siHrCUaZ77rczaesCvbc/VM/fdvsWfWz8NuZVFDb2Kk5Q8ZnLjrM3yHnep4biUOz6nmuSs0I1AcYA9kExxGnxl6zazktWqLXywLV7y0uP/gMICduBXmkNDPybPxPzl3ADAg9cCvVItVJeYbr4iLS2sjS1w0laKIkQP8WnCnkFzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753783593; c=relaxed/simple;
	bh=rwqc6ZdOVfKMgpH/GvJTRTBI/ETqCD8YkIwHBPZ0kR8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p31gMVS+Z7JmlL82AOi7JB2pDj8NGX0r8bmV3AMujXAEmBtKAoqgWiCU5dKEh2Au38ZGxPSTIZCcRNIszPktjPsongNWxMiPopI8b5aYFB4CQQ5wkk2NBk3kOkhn/UVScfHQKq/Uq6fH4HtkqhWylDCxvAaR5WaNv35myGeyHFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fVuMTQyf; arc=none smtp.client-ip=209.85.128.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fVuMTQyf"
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-45610582d07so34643485e9.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Jul 2025 03:06:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753783590; x=1754388390; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mdXN7Iex4BK1HyIVUk7Q0aYT6k4ehYGtHeixZxZQAkM=;
        b=fVuMTQyfa8DNExfjvmabjr2aRYdYbFMPvGGvZpdUc9fVxG920yfgTmdR6OBu4M4mN/
         Qa1LUKVabIaXsHJVcKm7kOQSiusQYbYe69bs9Apzwf2Owrzq8SC9xf+y/Yq8klJX7j0Z
         My2qysuWMLTCLwkqTAgbbbqOIzAphfz0jhw7Gim0KC4bHhKOobshxzaH9Etk8nOvU/95
         ZakHIVs0lZPIPHNuLsAlYYa3r2xFDHJriAdgr88274Mzoex4NfQMPF3AY4tx5v6nE6tS
         gSDp4Z2RK1SMzymUrgQpdUa1S/UA9H+6JnRjxleFVLNEdpVXPCa5V57tYrIItk/nZRx4
         IyNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753783590; x=1754388390;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mdXN7Iex4BK1HyIVUk7Q0aYT6k4ehYGtHeixZxZQAkM=;
        b=X+wmahzdwXPSlH1YVJTbf1RiRBkr71HWICJkPPILl9D9pHmoaDXxLBc59reN8HGCQe
         UozTNN6YJ90D6mExkMMLad+6fmm9NEuRQC2bMEvGHq2pXiEfnWziPUca3lDRH0hkkTsL
         Cuo69sDuG8Hhkr9oqWI2TPgMfff30e89n10V/X9lJuRlIDPEWi+IB5SmwZeO7MAUKoEH
         uavOESi9Af65PCDICmD7JRvfEf0I0C1yZcvAhAhH78DfEqI0wZGzCfPiZ3IOfjv2U1TP
         vtEnc9q1CbIqeRkRHvoNbT1B53BBw/YRdluT8e9PijkN1Uw5EVI0A5EIAvG2A4Uyf0a/
         bIyA==
X-Forwarded-Encrypted: i=1; AJvYcCUK9GXhNuF+XwdJO3BBU8b/hMXffSf8cznC7y2VJmtVbJv5sLbaeQ21aXfeFjKvNegz1BoHHLqUgbUDu+pi@lists.linux.dev
X-Gm-Message-State: AOJu0YzxwgKX2SsroarVelIvVWPpfAb5N/OpozrsM/TbeIZsNDJL7gf7
	K6dxFgSI53kAohFvNG263X3IkWIqmhUjKWHpDqx1NDr+j3vv3OaExqr+
X-Gm-Gg: ASbGncsa4vHINjRSAKF2CSitZQEmAg72S08rY5O7hRraHyrMyY43i7bXWaa2XJehV52
	bMQE36exFvY60Sw20agk63JBO7Fwp47q2EB+Fg2eNJKGegXk8jfwDrVJ0H+7sP+4C/ZlWe6mlQq
	mJESHDe/vneoYT5dcOM2+4wh5UAFfIVAeygxk4vTEoGWWQgsCQMGp8lK7QHsYXWEv+1AnYzsLpc
	LW68yfXSSRjhnbzSrwBDKR3TpJN/YLu/Dj3UrJNCRrYDWnp5DwmZWiJLYWZl8EJWdDgJEUf0zmq
	j8VX7vYxP7PgLYhEv96Cjp5qY1HzLGNmlS/6CrNao/+Cd3I0y6qXbOBwSOEwYhxlz/Kc4k6vExb
	u0WyKJ2HtBlum1wXfJNgeqwTa1Un2nmr5AwvXumywgzK8nqGFExA3X2k=
X-Google-Smtp-Source: AGHT+IFpV/5AQ7Le9es/B08A2PqUmoRpsyrCJrzXn4belGHLzurWA4MhsXCXoDQ9TRT225Ganr19WA==
X-Received: by 2002:a05:600c:4749:b0:456:1e4a:bb5b with SMTP id 5b1f17b1804b1-458765551c5mr111140555e9.32.1753783590072;
        Tue, 29 Jul 2025 03:06:30 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4587272b405sm167860195e9.19.2025.07.29.03.06.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Jul 2025 03:06:29 -0700 (PDT)
Date: Tue, 29 Jul 2025 12:06:26 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: Martin KaFai Lau <martin.lau@linux.dev>
Cc: alexei.starovoitov@gmail.com, andrii@kernel.org, ast@kernel.org,
	bpf@vger.kernel.org, coreteam@netfilter.org, daniel@iogearbox.net,
	fw@strlen.de, john.fastabend@gmail.com, netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	pablo@netfilter.org, lkp@intel.com
Subject: Re: [PATCH bpf-next v3 3/4] bpf: add bpf_icmp_send_unreach
 cgroup_skb kfunc
Message-ID: <aIidIq2EM--Ugp6f@gmail.com>
References: <202507270940.kXGmRbg5-lkp@intel.com>
 <20250728094345.46132-1-mahe.tardy@gmail.com>
 <20250728094345.46132-4-mahe.tardy@gmail.com>
 <b3f25e61-7b0c-4576-baae-9b498c3b8748@linux.dev>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b3f25e61-7b0c-4576-baae-9b498c3b8748@linux.dev>

On Mon, Jul 28, 2025 at 06:05:26PM -0700, Martin KaFai Lau wrote:
> On 7/28/25 2:43 AM, Mahe Tardy wrote:
> > This is needed in the context of Tetragon to provide improved feedback
> > (in contrast to just dropping packets) to east-west traffic when blocked
> > by policies using cgroup_skb programs.
> > 
> > This reuse concepts from netfilter reject target codepath with the
> > differences that:
> > * Packets are cloned since the BPF user can still return SK_PASS from
> >    the cgroup_skb progs and the current skb need to stay untouched
> 
> This needs more details. Which field(s) of the skb are changed by the kfunc,
> the skb_dst_set in ip[6]_route_reply_fetch_dst() and/or the code path in the
> icmp[v6]_send() ?

Okay I can add that: "ip[6]_route_reply_fetch_dst set the dst of the skb
by using the saddr as a daddr and routing it", I don't think
icmp[v6]_send touches the skb?

> 
> >    (cgroup_skb hooks only allow read-only skb payload).
> > * Since cgroup_skb programs are called late in the stack, checksums do
> >    not need to be computed or verified, and IPv4 fragmentation does not
> >    need to be checked (ip_local_deliver should take care of that
> >    earlier).
> > 
> > Signed-off-by: Mahe Tardy <mahe.tardy@gmail.com>
> > ---
> >   net/core/filter.c | 61 +++++++++++++++++++++++++++++++++++++++++++++++
> >   1 file changed, 61 insertions(+)
> > 
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > index 7a72f766aacf..050872324575 100644
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
> > @@ -85,6 +85,10 @@
> >   #include <linux/un.h>
> >   #include <net/xdp_sock_drv.h>
> >   #include <net/inet_dscp.h>
> > +#include <linux/icmp.h>
> > +#include <net/icmp.h>
> > +#include <net/route.h>
> > +#include <net/ip6_route.h>
> > 
> >   #include "dev.h"
> > 
> > @@ -12148,6 +12152,53 @@ __bpf_kfunc int bpf_sock_ops_enable_tx_tstamp(struct bpf_sock_ops_kern *skops,
> >   	return 0;
> >   }
> > 
> > +__bpf_kfunc int bpf_icmp_send_unreach(struct __sk_buff *__skb, int code)
> > +{
> > +	struct sk_buff *skb = (struct sk_buff *)__skb;
> > +	struct sk_buff *nskb;
> > +
> > +	switch (skb->protocol) {
> > +	case htons(ETH_P_IP):
> > +		if (code < 0 || code > NR_ICMP_UNREACH)
> > +			return -EINVAL;
> > +
> > +		nskb = skb_clone(skb, GFP_ATOMIC);
> > +		if (!nskb)
> > +			return -ENOMEM;
> > +
> > +		if (ip_route_reply_fetch_dst(nskb) < 0) {
> > +			kfree_skb(nskb);
> > +			return -EHOSTUNREACH;
> > +		}
> > +
> > +		icmp_send(nskb, ICMP_DEST_UNREACH, code, 0);
> > +		kfree_skb(nskb);
> > +		break;
> > +#if IS_ENABLED(CONFIG_IPV6)
> > +	case htons(ETH_P_IPV6):
> > +		if (code < 0 || code > ICMPV6_REJECT_ROUTE)
> > +			return -EINVAL;
> > +
> > +		nskb = skb_clone(skb, GFP_ATOMIC);
> > +		if (!nskb)
> > +			return -ENOMEM;
> > +
> > +		if (ip6_route_reply_fetch_dst(nskb) < 0) {
> 
> From a very quick look at icmpv6_send(), it does its own route lookup. I
> haven't looked at the v4 yet.
> 
> I am likely missing some details. Can you explain why it needs to do a
> lookup before calling icmpv6_send()?

From my understanding, I need to do this to invert the daddr with the
saddr to send the unreach message back to the sender.

> 
> > +			kfree_skb(nskb);
> > +			return -EHOSTUNREACH;
> > +		}
> > +
> > +		icmpv6_send(nskb, ICMPV6_DEST_UNREACH, code, 0);
> > +		kfree_skb(nskb);
> > +		break;
> > +#endif
> > +	default:
> > +		return -EPROTONOSUPPORT;
> > +	}
> > +
> > +	return SK_DROP;
> > +}
> > +
