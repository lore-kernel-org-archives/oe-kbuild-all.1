Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633483A1682
	for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 13:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776690449; cv=none; b=FRatl1ZoPaHyVzQydZcz1PKCQtP/6G1Pc/8GusMXY1yXkSEoqTQVOYNvGmURVelTS0Ng3LgCmxE7X2ve4lyS0m9WZUKgdh/+aOm/FSJHweORRT6lm0nW/1R0/fKaMAzcdelDEeUyT8zAiElOxVjyPOER3TzemFL4bb6SqFsynwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776690449; c=relaxed/simple;
	bh=JLX0QIE+ZaB7zS+4hzCYPPCnUIvUgu+mL5VLldlw4/E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rTB/CaxQ1gpEEogn5xv7RFMTQ26ePQPpbyvRo1Mk42A5kqw6sddIOmkn1VEF0Y1WSUvhYPVbs3xybpghobr3J7WD3sBJ7a3EAv3vQcjnOJWjLvMYJgcgFgBvgiJnoLytFVhr7S5nNsgHIf1B/DnTr6OhCVvFuCD5AgqP9LSSeXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i/uInSLj; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i/uInSLj"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43d7badbd7dso1405171f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 20 Apr 2026 06:07:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776690445; x=1777295245; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/Ag56mmJk7Zmpm+f5Y09lyaEBE2YSArv7z93rWOQIdM=;
        b=i/uInSLjQ6voF/bSbLZNCLicXIhHAbIkYrclC0bzrCTF7hN0TI9Eu8U+hjUO+OHt7g
         iU/BkvG/o5o/Ugi4mNNpE+6yw8abHwKO5nKKk2oJeVkmq7XTZj2lprS8ioMoZDvz6flF
         lj/Sb59yJoJNMIQGLX8JuUbqLq2xCbrFuTkka8gp07tybAI30YLPhKRI7gotQBnxmePn
         mm236ua5FKAgSgJ7dU3nqz3JuB42aAqKzC23tvViMwkrWbQbj6TFmU0tCzrwd7eSbxAR
         Zh3t8fP+szI8rd+ICBPjyRxNAElDJLTadUpzhUNUAXyVgk9cFm9i995uPC1wGw6Pkhbg
         WAwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776690445; x=1777295245;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/Ag56mmJk7Zmpm+f5Y09lyaEBE2YSArv7z93rWOQIdM=;
        b=jzO7mqJysGul5r7Uhxs7jTPmouXTQol60j7Y/roRbcNriiHEB9rPNEUq/19oqPh1WC
         pcrj11MAdL/cdzSQpSrj587RiStK89UsbTIrm2e+2Bldh2oHdEM8UZoeAGir1/wGjdOJ
         7wdvOzVLP2FzWtRAQso7483xB35Ms6/YDcZ2cN13H7lbxzAxpFAY+X3KsdgCKBBb2AE2
         O0j6pGymiJ611r9lOB8/nEsNaqs1cyA9iRYLzvi5Dua+pOrOVIPz73aqeVwoq0GAQESY
         o8iDLbExtU8k4MDa+zGfpXX5EYIFPlfGeGLJkwpwhaLTEkIdIRkGGs1bxaX7M1nSmJWa
         tsVw==
X-Forwarded-Encrypted: i=1; AFNElJ8klR92ZdaJu9Qv2B9JuVtrclR7vhxTmzO4lmJV+yaRi7wGes+fqGaC23hd+iKnGAzakBXu+LChL/3VS+2v@lists.linux.dev
X-Gm-Message-State: AOJu0YyM43ptXKbdxHzEMfCCpLJw9PS7O4/D1A/vEDQw6enLK/lLh2OI
	Eyd/Js+U9c2xthG6t02C/C7sBubum3OmqC4R0NZt7k6AD83VN+i9REN/
X-Gm-Gg: AeBDieuH6VNTp8aoZuYXat9pqgiT0U9s56F8uuZc0b+rH1IG/LZ1UEA5G/Y05HQfXpU
	G2OO/Mqu8HloFs1WQFQqRy3LUBfvWHLqtqPVq/R+2BcI0ppTg+nJRaPdjE0QbxRZ3Dal7UevWXc
	gSLpI3KcpwXOastj75a+iLu9WOD5vpEFiv8YMXni40VIsw2TNYT7HP+neBzMjzy9cOtu/oyrqwP
	+e0ACdhSEiviwyxKZr2XoYqyxl4V7TsPE49YMf273IxnQcpVMpo+SCvYlUyG3R9fS6VUmVFH1ic
	y8moiVMDEktMF+EOV88baWEAL3uk0pQ+3Oi56EMKua3E3MKBbJ4gtxs15ADs/hunvLkvC6aW3W/
	NvNv1vHtcBYMjlg8dv+/bCEKfBJXksWP48PMPQ+4g+F11GmdyaS7zFH3PlEf+y0nmoTP0UGwYIX
	BMSF6TocqHb7II6RLZVUy2oegG+yLtyEbouIpq9iwNtrx5L5XKp5l2a+IrfMKtz51yTQ==
X-Received: by 2002:a05:6000:4203:b0:43d:242:b9bb with SMTP id ffacd0b85a97d-43fe3dc5c80mr20542019f8f.18.1776690445002;
        Mon, 20 Apr 2026 06:07:25 -0700 (PDT)
Received: from gmail.com (deskosmtp.auranext.com. [195.134.167.217])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43fe4e4d525sm28070324f8f.31.2026.04.20.06.07.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Apr 2026 06:07:24 -0700 (PDT)
Date: Mon, 20 Apr 2026 15:07:22 +0200
From: Mahe Tardy <mahe.tardy@gmail.com>
To: bot+bpf-ci@kernel.org
Cc: alexei.starovoitov@gmail.com, andrii@kernel.org, ast@kernel.org,
	bpf@vger.kernel.org, coreteam@netfilter.org, daniel@iogearbox.net,
	fw@strlen.de, john.fastabend@gmail.com, lkp@intel.com,
	martin.lau@linux.dev, netdev@vger.kernel.org,
	netfilter-devel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
	pablo@netfilter.org, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCH bpf-next v4 3/6] bpf: add bpf_icmp_send_unreach kfunc
Message-ID: <aeYlCswvGdTHiAFp@gmail.com>
References: <20260420105816.72168-4-mahe.tardy@gmail.com>
 <c706a726c2e82dfc6162f96d7c04313301c24d1a4e36af5c421fda7a1c01b1a1@mail.kernel.org>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c706a726c2e82dfc6162f96d7c04313301c24d1a4e36af5c421fda7a1c01b1a1@mail.kernel.org>

On Mon, Apr 20, 2026 at 11:36:15AM +0000, bot+bpf-ci@kernel.org wrote:
> > diff --git a/net/core/filter.c b/net/core/filter.c
> > --- a/net/core/filter.c
> > +++ b/net/core/filter.c
> 
> [ ... ]
> 
> > +#if IS_ENABLED(CONFIG_IPV6)
> > +	case htons(ETH_P_IPV6):
> > +		if (code < 0 || code > ICMPV6_REJECT_ROUTE)
> > +			return -EINVAL;
> > +
> > +		nskb = skb_clone(skb, GFP_ATOMIC);
> > +		if (!nskb)
> > +			return -ENOMEM;
> > +
> > +		if (!skb_dst(nskb) && ip6_route_reply_fetch_dst(nskb) < 0) {
> > +			kfree_skb(nskb);
> > +			return -EHOSTUNREACH;
> > +		}
> 
> Is the route lookup needed here? Looking at icmpv6_send() in
> net/ipv6/icmp.c, it fills fl6.{daddr,saddr} and passes them to
> icmpv6_route_lookup() which performs its own route lookup. The function
> doesn't appear to use skb_dst() from the original skb:
> 
> icmpv6_send() {
>     ...
>     fl6.daddr = hdr->saddr;
>     fl6.saddr = saddr;
>     ...
>     dst = icmpv6_route_lookup(net, skb, sk, &fl6);
>     ...
> }
> 
> The same applies to the IPv4 path with icmp_send(). Additionally, at
> cgroup/egress the skb->_skb_refdst should already be set, and the same
> should be true for cgroup/ingress for inet proto.
> 
> Does the kfunc work without ip_route_reply_fetch_dst() and
> ip6_route_reply_fetch_dst()? If so, can these calls be removed?
> 
> Reference: Martin KaFai Lau's comment in v3 review
> https://lore.kernel.org/bpf/df4b0996-3e88-4ea4-983b-82866455a6fc@linux.dev/

Same reply as https://lore.kernel.org/bpf/aeYkdKm7B4NQ3BDo@gmail.com/,
too bad the LLM can't access the cover letter.

> 
> > +
> > +		*in_progress = true;
> > +		icmpv6_send(nskb, ICMPV6_DEST_UNREACH, code, 0);
> > +		*in_progress = false;
> > +		kfree_skb(nskb);
> > +		break;
> > +#endif
> > +	default:
> > +		return -EPROTONOSUPPORT;
> > +	}
> > +
> > +	return 0;
> > +}
> 
> [ ... ]
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/24663313503

