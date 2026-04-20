Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 877EA3A1685
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 13:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776690301; cv=none; b=dduY3ddoAMWDzefJFc3sv/ltbFySSA5LkhchPMk1mBVyku7YThN3jOf3KULIHf12rmvMRw+yolK6ihpdmTodRhSI6O3oJHsL4Fm8TG24wqwTqaWuiryRCOH0M6w6UCnDkO4ZvB7SUcFPo6y1xk2ZUBn0fPEv1nYM6TEEi21YUVQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776690301; c=relaxed/simple;
	bh=fVzxhqZXK6Qwiio7PBsf0pdv4mmkoZ3a6cA74QPhfCQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FMmACcWGn2oEt5cmRf5zLa2Z0sWzwOwvSZUuJXTp3jx1o60tNkne//dvZNyGYx28qsXWP4u238WNk0cM2BKWs397SpfNXtvGG2GuxRsaM1C/ALmWWzbZmsmRuAz38XVvOkF4gVTDVCFR8zPatevnvceTzAqrNvHFArBPfkgULwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UfH2dS/8; arc=none smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UfH2dS/8"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-4890d945eb4so8665425e9.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 06:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776690295; x=1777295095; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mZ7NBcfywwnvJcmvihRMyw1jnkfoOgzM6bLzAxo7IkU=;
        b=UfH2dS/8qzRgjtlYRbs0mqwl2fF3kXnGZdeDMr3XISO/lLn7MfBcptLvAEDLEoYuPX
         N5TOIBfGuZ3qrOKNltEwWzpuIBRoyb2ZNq+HpwF3DGIEA7LLxOfi64E1dQ6VyBoipRr4
         Jb/iIKGG2cS894h7Bog1HVvVzYSfqTy7dPlP0mZ2gJkHtNJNFpx9EDvQ9cLsQpM0VtTG
         jHOdgn8xOPB0vDYR1wV4iY11w/c26ow6Bj1ugb1rzM9YCkZrRm9LD+xPSJt9rMcetles
         CCmWNb6lWRHsrLVVQPIbIxdFaSrMrV0RSrXh60HuJDcEHqhB8htisQAOJCz5EJ535HoW
         s/GA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776690295; x=1777295095;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mZ7NBcfywwnvJcmvihRMyw1jnkfoOgzM6bLzAxo7IkU=;
        b=C3FCISiQs006cj8GrFtUikJAqbxaq6uSHT7Hh3CuhqqbOMcQqU1LEuytllphwSIjqB
         dx/JhXMkPSqcaSb7dwBupK/8Rk+F+GPBopk5WEQLqj/BCdAPSYz27ra9sfyKj7zQkeZc
         inY9fo3FXWqLwhe5jvKD6hzxyOn6WGLp59+QcQ4JNcl+1rCxo+/8yDPENcaNfqIs7dJL
         hbVOU4WNjWG1LdeIIpSi2PnibDdJzlg8PXwCokt19bgUWYys6Lq24QZL+00uR2wgK3Yc
         IrUYObvvLV9yB3PExA2O61IZqitW75axqWsa9wSrLpCf/sJUC7JMSPx3dCFdIb5ijNJ+
         dYPg==
X-Forwarded-Encrypted: i=1; AFNElJ/ptiLgT4hR/wNAPBZTpe+5Tg5G/W3Pocb3kdj1B41zr8osVIAiTcT5Wg4VSJ3thqp6rxC/UhBBf4RAyuQ4@lists.linux.dev
X-Gm-Message-State: AOJu0YzRShelu1wLHj7cIKUd7ainGVtb5Y0RZtPJzVebsF2Btf7o7bnE
	w60f+/B1aGORPVV0NC57Irqr6lsP1A4SjM1XtMr7rQ4ESLh+2s9ERPhc
X-Gm-Gg: AeBDieu/yuaNMNo5dx8bpfU5/ApH/wz+pL9TnPlVMnI4MAiuL4zn/7NWTivSEwo/IrD
	4EfyDpq+vyqNQ1AjwSmWBMth7kUWPHRsPFv0JGKplk/Kd8CTM9tqJG3Vgvm1gzee/P3aHniZBR9
	+102COujbP65JVd157iRmdUPhpW0XK0JMThclugi6UguRuRVyiloqAR5vtZkOVjjTlaom9bmuFu
	n47XmiaFghdI3/7+civeIAOcO6ryWbsALFpfpZG68LWW5wfiRv8CVbkc++5Knn81dSgTN/T3Y4j
	rDGMiZ8xCOMRiKvNzh+R+k6Ws8cigJjbHOJXX0rdP4fS9+8fIrqJYnCu1bBLGMzTgIhYvqypq+p
	XWV/Ysaqk+SpPSh+cN+jeCdVMfJabS0vl3muWhYlmeosqqqas+smw3kJb69KaJJRSFl8iKGgwRH
	Dby+DrTQMtrDCd/yEmPfn3p4/rWm7IMi4cwp4i1UU4/xrRPkavNMEs9NcXpbLf3Jy82Q==
X-Received: by 2002:a05:600c:b96:b0:48a:5339:a46 with SMTP id 5b1f17b1804b1-48a53390f6cmr9778795e9.9.1776690295193;
        Mon, 20 Apr 2026 06:04:55 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-488fc140c82sm262361005e9.12.2026.04.20.06.04.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 06:04:54 -0700 (PDT)
Date: Mon, 20 Apr 2026 15:04:52 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: alexei.starovoitov@gmail.com, andrii@kernel.org, ast@kernel.org,
	bpf@vger.kernel.org, coreteam@netfilter.org, daniel@iogearbox.net,
	fw@strlen.de, john.fastabend@gmail.com, lkp@intel.com,
	martin.lau@linux.dev, netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	pablo@netfilter.org, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCH bpf-next v4 1/6] net: move netfilter
 nf_reject_fill_skb_dst to core ipv4
Message-ID: <aeYkdKm7B4NQ3BDo@gmail.com>
References: <20260420105816.72168-2-mahe.tardy@gmail.com>
 <c0aa7f264055f44ac4c93aa4718473e89ed13b8bb11de3179ed40d2f88a99257@mail.kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c0aa7f264055f44ac4c93aa4718473e89ed13b8bb11de3179ed40d2f88a99257@mail.kernel.org>

On Mon, Apr 20, 2026 at 11:36:12AM +0000, bot+bpf-ci@kernel.org wrote:
> > diff --git a/include/net/route.h b/include/net/route.h
> > index f90106f383c5..ec2466fd0bec 100644
> > --- a/include/net/route.h
> > +++ b/include/net/route.h
> > @@ -173,6 +173,7 @@ struct rtable *ip_route_output_flow(struct net *, struct flowi4 *flp,
> >  				    const struct sock *sk);
> >  struct dst_entry *ipv4_blackhole_route(struct net *net,
> >  				       struct dst_entry *dst_orig);
> > +int ip_route_reply_fetch_dst(struct sk_buff *skb);
> >
> >  static inline struct rtable *ip_route_output_key(struct net *net, struct flowi4 *flp)
> >  {
> 
> [ ... ]
> 
> > diff --git a/net/ipv4/route.c b/net/ipv4/route.c
> > index bc1296f0ea69..7091ef936073 100644
> > --- a/net/ipv4/route.c
> > +++ b/net/ipv4/route.c
> > @@ -2945,6 +2945,21 @@ struct rtable *ip_route_output_flow(struct net *net, struct flowi4 *flp4,
> >  }
> >  EXPORT_SYMBOL_GPL(ip_route_output_flow);
> >
> > +int ip_route_reply_fetch_dst(struct sk_buff *skb)
> > +{
> > +	struct rtable *rt;
> > +	struct flowi4 fl4 = {
> > +		.daddr = ip_hdr(skb)->saddr
> > +	};
> > +
> > +	rt = ip_route_output_key(dev_net(skb->dev), &fl4);
> > +	if (IS_ERR(rt))
> > +		return PTR_ERR(rt);
> > +	skb_dst_set(skb, &rt->dst);
> > +	return 0;
> > +}
> > +EXPORT_SYMBOL_GPL(ip_route_reply_fetch_dst);
> 
> Is ip_route_reply_fetch_dst() actually needed before calling icmp_send()?
> 
> Martin KaFai Lau raised this question in v3 of the patch series and
> noted that icmpv6_send() does its own route lookup and doesn't use
> skb_dst() of the original skb. He also pointed out that at
> cgroup/egress, skb->_skb_refdst should already be set.
> 
> Looking at icmpv6_send(), the fl6.{daddr,saddr} are filled and passed
> to icmpv6_route_lookup, which performs the reverse/invert route lookup.
> The function doesn't appear to use skb_dst() of the original skb.
> 
> Since this patch moves ip_route_reply_fetch_dst() from netfilter to
> core specifically for the BPF kfunc, can you clarify why this routing
> step is necessary? Does the kfunc not work without
> ip[6]_route_reply_fetch_dst()?
> 
> Reference: https://lore.kernel.org/bpf/df4b0996-3e88-4ea4-983b-82866455a6fc@linux.dev/

Yes I replied to this in the cover letter, let me quote it:

Initially, this kfunc was added only to cgroup_skb programs, Alexei
suggested not creating its own kfunc set and adding it to the more
global bpf_kfunc_set_skb. Now that recursion is handled and I realized,
thanks to Martin, that fetching the dst route might be only useful in
situation in which the packet was not yet routed, I decided to extend
the kfunc to more program types and route the packet only if needed.

So in short, if we decide to go back to cgroup_skb only, we can remove
this, if we expand to other program types like we do, it still makes
sense to do it.

> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/24663313503

