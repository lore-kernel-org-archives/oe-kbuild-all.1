Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E5F21BC08F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 15:18:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779808705; cv=none; b=BU8iqG6QJchX7LE9WscXon3167yMhycVdDdyqmsCBE843EHI4XSxNDMFWNCINkMI9ri0r7m5jTuG53v09gEWsXPT9luGigKljBwX09rif5A52ichOr4ArzID10pxCecS0vcRoyBLLZy/uFwjQabGdvE10huytfYepGqGnt1aPWs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779808705; c=relaxed/simple;
	bh=YdMB1LtyLqIriHtc7C7EYyISywkT2D2MpqY0VJfRR9s=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=MgJxqggIeP5FRTVnGXM/dtJd4zgBadZ/Xo2/RcWViO3NrQOSjlR+yx1vVGYvH92Uq+P42c/ddkqwZ5IlvFIksm4nYPXX2ek59UwISbnbPlI5reOFGGm4EmUhLQIOW6SbNIsUmW1NaIfZNF8QjOpD4BDszYQ+fLmh4u3c0D3CngI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BNzjstvZ; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BNzjstvZ"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-441209fb77eso6653458f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 26 May 2026 08:18:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779808702; x=1780413502; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yQeWuKcJdaKGP0co6PsxQWNihwyuFZGEvhAS+cv/Pqc=;
        b=BNzjstvZOeFrI2ll9hA0VeyEB2w2o8jNpjYRAe35yTjcSonRR7DLrxnAsOURQvqWZ9
         9yrARyiBpE1IWVs6CimJDuUSn7ht45LyZ43JRDHnrwuv+nlPIFOgfXbd7Z+MChMyhn8B
         sfj8bbsZDCMft4WqW3+iuaDL4BskCr/4Nkqg/5zSU54I5EuQYZTlYtYJUF+KJGg/S/AW
         otCyzGiQLArjZ3Z55QIbE1aIz0wK6p0XDxFgEHVRat60y53qsUpG4W/H9TypSwfz1kv3
         DGKTMOiZQ4jO8r505dy5vc/MVYZR/olgJrhtBWu2KXXTk/IpxkeUAdk9HrAV3F1Wknde
         6r/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779808702; x=1780413502;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yQeWuKcJdaKGP0co6PsxQWNihwyuFZGEvhAS+cv/Pqc=;
        b=Qfbsx67eL5faTq655l57BmwXGDjChsvfo0V7LIs3osQ3bBqx5MCRjXmRWC6Q918bk4
         vCfHHn6rhQcG7YDWpWmPaFiGn4dTgufwl4liufbToVh1ej9/j/dBZojzPOw6CIz7g8hq
         XDIN3nPOAWpH2qA8QTsZ7wBEwSji5vfxIKaay8UCArZPuD3yQfi+5vJEVbK+tXy/2OyT
         avzHd5Smvdi9sLlLeQmbnm7fQzFg3XW4a+TLTLwgWJB7RBz/jgR7c2IsjZgkqttCK3nv
         nRK4K4cKuzXWzXIrk+Ae0AKSfmuUJ9XDDEDFdgTpis6apqH99RlSPShEl3D09hfofLhR
         Ae2A==
X-Forwarded-Encrypted: i=1; AFNElJ+c/mhnbTILfcd5DvC3orA9dKlqD0D4t+nc9StdepTakLmBK9dDa3poAbNbDrX9Q0DxZKwW2D1dvPJpGTKB@lists.linux.dev
X-Gm-Message-State: AOJu0Yz5lHnO+Dca+z9y11A5QSQOeEk2zDqiqjLYYsuLRBE9JqDUDjUI
	UW8YGt+ReFAq8YOBWnE3CEfuJ8vSbHxhC6eOR//n15AUrSxh7RY8ypC8P+FB5iL4
X-Gm-Gg: Acq92OGItRfFdEmJ3G6DiBn/u7M2TOZuChUNPAKmdfh0yoh6aTunU3oUbWUNxJkph3m
	qSioo1eiuNGxQDZ1NPa2UurSCo463JYMIeHkl9SYxdxXbQ7HvuOIkF1Jb+efYmJrL9mBYY2SmeL
	+tdOc2ptgVSWhkgxGijbiBnoT0vBqDKKAteL5oEHyK7adgFGLc75F7/NYQVC5rbUWM892WBHGVb
	GPCGVoZHGE+Ktk1SiOMQ+ONrNEx412oU+blkxTlE4/w/gE2cSrQDRs0atVhHe0nkUfmSmFW4jMV
	/NvdH23h5LRDlvjrtpTtEiNo3Acnqc8NyCgQ1xAQPvAEK2K7FdA4qjQkWJhj+7TGGhvRIULbDg8
	vbTMqVqBgtjjlzq3mAO+J8DYJW9+XW4PKkU9NX98RkJ0yl3WLUvhJijJDYvbxzMBAufBy2SfMp/
	+LJbEzlfShpZZQLFXR3qMoZZ72+piXXmzhb+0gn4QHWX8y33CLnhORqLX1q40N1ze7WYns4oN4O
	Nw=
X-Received: by 2002:a05:6000:18af:b0:45e:9304:a4c3 with SMTP id ffacd0b85a97d-45eb333aa31mr28185448f8f.19.1779808701891;
        Tue, 26 May 2026 08:18:21 -0700 (PDT)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6cd1780sm38974606f8f.16.2026.05.26.08.18.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 08:18:21 -0700 (PDT)
Date: Tue, 26 May 2026 16:18:20 +0100
From: David Laight <david.laight.linux@gmail.com>
To: kernel test robot <lkp@intel.com>
Cc: Kacper Kokot <kacper.kokot.44@gmail.com>, Pablo Neira Ayuso
 <pablo@netfilter.org>, Florian Westphal <fw@strlen.de>, Phil Sutter
 <phil@nwl.cc>, "David S. Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 netfilter-devel@vger.kernel.org, coreteam@netfilter.org,
 linux-kernel@vger.kernel.org, oe-kbuild-all@lists.linux.dev,
 netdev@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH] netfilter: TCPMSS: fix dropped packets when MSS option
 is unaligned
Message-ID: <20260526161820.63c56e56@pumpkin>
In-Reply-To: <202605261527.v5NoRvES-lkp@intel.com>
References: <20260525201116.407338-2-kacper.kokot.44@gmail.com>
	<202605261527.v5NoRvES-lkp@intel.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 26 May 2026 15:50:00 +0200
kernel test robot <lkp@intel.com> wrote:

> Hi Kacper,
> 
> kernel test robot noticed the following build warnings:
> 
> [auto build test WARNING on nf-next/main]
> [also build test WARNING on netfilter-nf/main linus/master v6.16-rc1 next-20260525]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
> 
> url:    https://github.com/intel-lab-lkp/linux/commits/Kacper-Kokot/netfilter-TCPMSS-fix-dropped-packets-when-MSS-option-is-unaligned/20260526-041308
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/netfilter/nf-next.git main
> patch link:    https://lore.kernel.org/r/20260525201116.407338-2-kacper.kokot.44%40gmail.com
> patch subject: [PATCH] netfilter: TCPMSS: fix dropped packets when MSS option is unaligned
> config: x86_64-rhel-9.4-ltp (https://download.01.org/0day-ci/archive/20260526/202605261527.v5NoRvES-lkp@intel.com/config)
> compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260526/202605261527.v5NoRvES-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202605261527.v5NoRvES-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
>    net/netfilter/xt_TCPMSS.c: In function 'tcpmss_mangle_packet':
> >> net/netfilter/xt_TCPMSS.c:140:66: warning: suggest parentheses around comparison in operand of '&' [-Wparentheses]  
>      140 |                         if (((char *)&opt[i + 2] - (char *)tcph) & 0x1 != 0) {
>          |                                                                  ^

and, of course, the code works fine because 0x1 != 0 is 1.

K (or maybe R) said that with hindsight they should have corrected the
priority of & and | when they added && and || and just fixed all the
existing code so it still worked.

-- David

> 
> 
> vim +140 net/netfilter/xt_TCPMSS.c
> 
>     69	
>     70	static int
>     71	tcpmss_mangle_packet(struct sk_buff *skb,
>     72			     const struct xt_action_param *par,
>     73			     unsigned int family,
>     74			     unsigned int tcphoff,
>     75			     unsigned int minlen)
>     76	{
>     77		const struct xt_tcpmss_info *info = par->targinfo;
>     78		struct tcphdr *tcph;
>     79		int len, tcp_hdrlen;
>     80		unsigned int i;
>     81		__be16 oldval;
>     82		u16 newmss;
>     83		u8 *opt;
>     84	
>     85		/* This is a fragment, no TCP header is available */
>     86		if (par->fragoff != 0)
>     87			return 0;
>     88	
>     89		if (skb_ensure_writable(skb, skb->len))
>     90			return -1;
>     91	
>     92		len = skb->len - tcphoff;
>     93		if (len < (int)sizeof(struct tcphdr))
>     94			return -1;
>     95	
>     96		tcph = (struct tcphdr *)(skb_network_header(skb) + tcphoff);
>     97		tcp_hdrlen = tcph->doff * 4;
>     98	
>     99		if (len < tcp_hdrlen || tcp_hdrlen < sizeof(struct tcphdr))
>    100			return -1;
>    101	
>    102		if (info->mss == XT_TCPMSS_CLAMP_PMTU) {
>    103			struct net *net = xt_net(par);
>    104			unsigned int in_mtu = tcpmss_reverse_mtu(net, skb, family);
>    105			unsigned int min_mtu = min(dst_mtu(skb_dst(skb)), in_mtu);
>    106	
>    107			if (min_mtu <= minlen) {
>    108				net_err_ratelimited("unknown or invalid path-MTU (%u)\n",
>    109						    min_mtu);
>    110				return -1;
>    111			}
>    112			newmss = min_mtu - minlen;
>    113		} else
>    114			newmss = info->mss;
>    115	
>    116		opt = (u_int8_t *)tcph;
>    117		for (i = sizeof(struct tcphdr); i <= tcp_hdrlen - TCPOLEN_MSS; i += optlen(opt, i)) {
>    118			if (opt[i] == TCPOPT_MSS && opt[i+1] == TCPOLEN_MSS) {
>    119				u_int16_t oldmss;
>    120				u16 csum_oldmss, csum_newmss;
>    121	
>    122				oldmss = (opt[i+2] << 8) | opt[i+3];
>    123	
>    124				/* Never increase MSS, even when setting it, as
>    125				 * doing so results in problems for hosts that rely
>    126				 * on MSS being set correctly.
>    127				 */
>    128				if (oldmss <= newmss)
>    129					return 0;
>    130	
>    131				opt[i+2] = (newmss & 0xff00) >> 8;
>    132				opt[i+3] = newmss & 0x00ff;
>    133	
>    134				csum_oldmss = htons(oldmss);
>    135				csum_newmss = htons(newmss);
>    136	
>    137				/* MSS may be unaligned; fix up the incremental checksum
>    138				 * to avoid an invalid checksum and a dropped packet.
>    139				 */
>  > 140				if (((char *)&opt[i + 2] - (char *)tcph) & 0x1 != 0) {  
>    141					csum_oldmss = swab16(csum_oldmss);
>    142					csum_newmss = swab16(csum_newmss);
>    143				}
>    144	
>    145				inet_proto_csum_replace2(&tcph->check, skb,
>    146							 csum_oldmss, csum_newmss,
>    147							 false);
>    148				return 0;
>    149			}
>    150		}
>    151	
>    152		/* There is data after the header so the option can't be added
>    153		 * without moving it, and doing so may make the SYN packet
>    154		 * itself too large. Accept the packet unmodified instead.
>    155		 */
>    156		if (len > tcp_hdrlen)
>    157			return 0;
>    158	
>    159		/* tcph->doff has 4 bits, do not wrap it to 0 */
>    160		if (tcp_hdrlen >= 15 * 4)
>    161			return 0;
>    162	
>    163		/*
>    164		 * MSS Option not found ?! add it..
>    165		 */
>    166		if (skb_tailroom(skb) < TCPOLEN_MSS) {
>    167			if (pskb_expand_head(skb, 0,
>    168					     TCPOLEN_MSS - skb_tailroom(skb),
>    169					     GFP_ATOMIC))
>    170				return -1;
>    171			tcph = (struct tcphdr *)(skb_network_header(skb) + tcphoff);
>    172		}
>    173	
>    174		skb_put(skb, TCPOLEN_MSS);
>    175	
>    176		/*
>    177		 * IPv4: RFC 1122 states "If an MSS option is not received at
>    178		 * connection setup, TCP MUST assume a default send MSS of 536".
>    179		 * IPv6: RFC 2460 states IPv6 has a minimum MTU of 1280 and a minimum
>    180		 * length IPv6 header of 60, ergo the default MSS value is 1220
>    181		 * Since no MSS was provided, we must use the default values
>    182		 */
>    183		if (xt_family(par) == NFPROTO_IPV4)
>    184			newmss = min(newmss, (u16)536);
>    185		else
>    186			newmss = min(newmss, (u16)1220);
>    187	
>    188		opt = (u_int8_t *)tcph + sizeof(struct tcphdr);
>    189		memmove(opt + TCPOLEN_MSS, opt, len - sizeof(struct tcphdr));
>    190	
>    191		inet_proto_csum_replace2(&tcph->check, skb,
>    192					 htons(len), htons(len + TCPOLEN_MSS), true);
>    193		opt[0] = TCPOPT_MSS;
>    194		opt[1] = TCPOLEN_MSS;
>    195		opt[2] = (newmss & 0xff00) >> 8;
>    196		opt[3] = newmss & 0x00ff;
>    197	
>    198		inet_proto_csum_replace4(&tcph->check, skb, 0, *((__be32 *)opt), false);
>    199	
>    200		oldval = ((__be16 *)tcph)[6];
>    201		tcph->doff += TCPOLEN_MSS/4;
>    202		inet_proto_csum_replace2(&tcph->check, skb,
>    203					 oldval, ((__be16 *)tcph)[6], false);
>    204		return TCPOLEN_MSS;
>    205	}
>    206	
> 
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
> 

