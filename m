Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E63A2FFFB9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  3 Nov 2025 11:03:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762167819; cv=none; b=cqe2YQhTnTHAqVwHu1Mqjg6kPjK5SKocqG/p2/kJhJ0N8JR0MgSdZWDVDOP3/DJg7b2cZ7cdBrshK8UX+Q0EFB5Dnw83dq+8mhfuIc0Bmt+jpJHx8THm6hofAMGxNY+8qB1HCvZOcj78htuyyNZlbNXjIts2HfKTTJNcxK/tTLU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762167819; c=relaxed/simple;
	bh=ZWKf1U4K8p8K7ajfbNKacDFOZXuDZuDDSYcIrkzA/N0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fiP5hSooizu2DpksggsniBFB5q0S3kQsjjt/QIugocbujbV/gmhnRB/xt7IOWnv/awvN5Tz7xbWmwu2FuZwgIlTVdRiBrJ9xPrd7K7zMtLmnxSnMpUKlAYEGjCoB6klmRfplyt2wevFy4Drx9y1ZdLVL2vmXPhmgQ8E3Wc6BGh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=eCv5i1OR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="eCv5i1OR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762167816;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zhTdrnjfA8ppQxzFb9fDiTAH4jVhlOQqvIRjACG6oMI=;
	b=eCv5i1ORlbybQ6Q4g7cwrCix9jLd2QdyO63zsqQ5zkJGW3UA/U62s1453YgFLtGeTp3cc4
	X+cGnJfx4YipgwPxgMZQYhH0u7mb6rEXt2K3kfTQtnQMvBTp96kucYbSNTq5nUyC7bO9wV
	9CzXHFHlkDC64Pa2w9RVKXhAvNGD68s=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-L3MuvNAaMu-ByAMZrRxlWg-1; Mon, 03 Nov 2025 06:03:35 -0500
X-MC-Unique: L3MuvNAaMu-ByAMZrRxlWg-1
X-Mimecast-MFC-AGG-ID: L3MuvNAaMu-ByAMZrRxlWg_1762167814
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b6d4f19c13cso325556066b.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 03 Nov 2025 03:03:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762167814; x=1762772614;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zhTdrnjfA8ppQxzFb9fDiTAH4jVhlOQqvIRjACG6oMI=;
        b=KBBfcCQ1f02S/zce1OPi5m8UN5WVt1Psxjpz9J+RVuLUa+H8qYVLzPIUgw01+hnk3M
         NKHE/tNm+aEcxaBVEWT8jImBZx0kE6KaF54xyhREpNTIBM/iTuTJeVIPco/8yPFS/at4
         aQAxryZ9gX6Wh+6cdssx8pCZvuYdNEQOoADgJHNVK4e7h+qcGV63ZfkIdCYZubvvgOYm
         JojZeuoUbIoBapkg3gDTJAMSmHHojzAN8GP0p1t6kS1cNdgHExUYSRCIZfommRuxbs9c
         Z0pf+MTUV+W1hPiTWmAl+R0wJAj3J/ytoiJufrxUC6fSqJePlxavyfzXCi0j8VCf1irx
         mGig==
X-Forwarded-Encrypted: i=1; AJvYcCXmNRB8g6t3i76BHtlcWHmbqIKQbZOiwFtBftNxfGml5kvl++OB+wOomSBmTRXnt3IRfDZV4D4IwBUTUUaN@lists.linux.dev
X-Gm-Message-State: AOJu0YxDIc8M6djP/YKWEMJeS13bRd1eJuFRfmER1WxOYFfTjnBYU2da
	phgAuUz5UFHtBPuuZYOT01LjV7zpGd0d+49HHpYBGQZ45+Ke8iLCKcpOwwPMGwBeBSSvhw2NgyJ
	tHeQ3v6MZOfaADPoOpMRQJ48+RKrqjCYVFETPFNGuyiluE3xfxtQSBFHRgYIXp0jZOL1aLK3RUw
	XZ55VS7JSWo7SOSLLr8vVd/jbzd2qp70cpElR423Lpew==
X-Gm-Gg: ASbGnctYBZo/8kAxnTtU+vQ/eo9LuX356onaLGXXJatXbrYORVa6N2ZLNdvErJlFSRo
	ao9igOo07potkyWTPBtR2iDn3qozCTrLc6jJ4Lif45CQXCCAQVLkAr04NEztLkoI3sQkTqQ0XVa
	SCPFsMewMkDsUiGlpdIoyqpfAYtE9u6ab+ES8QwgHzIp6RAkyCHg4PTpU=
X-Received: by 2002:a17:907:1c93:b0:b40:8deb:9cbe with SMTP id a640c23a62f3a-b70700bad7dmr1398097266b.2.1762167814131;
        Mon, 03 Nov 2025 03:03:34 -0800 (PST)
X-Google-Smtp-Source: AGHT+IF70Lv5L7m6M605bcYwYl5gdYYQmJQe9fOmppY9gxiQqdJv0qTmTVSWhGn8kw4mBFNTlWE3YlDmM/dVhBYh+OE=
X-Received: by 2002:a17:907:1c93:b0:b40:8deb:9cbe with SMTP id
 a640c23a62f3a-b70700bad7dmr1398093866b.2.1762167813668; Mon, 03 Nov 2025
 03:03:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cfafc5247fbfcd2561de16bcff67c1afd5676c9e.1761918165.git.rrobaina@redhat.com>
 <202511012016.TaXzGDDi-lkp@intel.com>
In-Reply-To: <202511012016.TaXzGDDi-lkp@intel.com>
From: Ricardo Robaina <rrobaina@redhat.com>
Date: Mon, 3 Nov 2025 08:03:22 -0300
X-Gm-Features: AWmQ_bnNelXrYhZN2hvHONfShTGA5EvaaCJcqVosrEermFLRrvdG6VLVDrGvFk4
Message-ID: <CAABTaaCf+5mY8gze4Ojy2fttEuuEtjj3Zm1dHScXVfWtKAQbSQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] audit: add audit_log_packet_ip4 and
 audit_log_packet_ip6 helper functions
To: kernel test robot <lkp@intel.com>
Cc: audit@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netfilter-devel@vger.kernel.org, coreteam@netfilter.org, 
	oe-kbuild-all@lists.linux.dev, paul@paul-moore.com, eparis@redhat.com, 
	fw@strlen.de, pablo@netfilter.org, kadlec@netfilter.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: YiYkDq5AHGsN7ILJB8aKgq3AE479kXawI2DnFNdyVRE_1762167814
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

I didn't get these warning messages in my local build. I'll fix it and
submit a new version.

On Sat, Nov 1, 2025 at 10:15=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Ricardo,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on pcmoore-audit/next]
> [also build test ERROR on netfilter-nf/main nf-next/master linus/master v=
6.18-rc3 next-20251031]
> [If your patch is applied to the wrong git tree, kindly drop us a note.
> And when submitting patch, we suggest to use '--base' as documented in
> https://git-scm.com/docs/git-format-patch#_base_tree_information]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Ricardo-Robaina/au=
dit-add-audit_log_packet_ip4-and-audit_log_packet_ip6-helper-functions/2025=
1031-220605
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/pcmoore/audit.git=
 next
> patch link:    https://lore.kernel.org/r/cfafc5247fbfcd2561de16bcff67c1af=
d5676c9e.1761918165.git.rrobaina%40redhat.com
> patch subject: [PATCH v4 1/2] audit: add audit_log_packet_ip4 and audit_l=
og_packet_ip6 helper functions
> config: m68k-defconfig (https://download.01.org/0day-ci/archive/20251101/=
202511012016.TaXzGDDi-lkp@intel.com/config)
> compiler: m68k-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251101/202511012016.TaXzGDDi-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202511012016.TaXzGDDi-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    net/netfilter/nft_log.c: In function 'nft_log_eval_audit':
> >> net/netfilter/nft_log.c:48:31: error: implicit declaration of function=
 'audit_log_packet_ip4'; did you mean 'audit_log_capset'? [-Wimplicit-funct=
ion-declaration]
>       48 |                         fam =3D audit_log_packet_ip4(ab, skb) =
? NFPROTO_IPV4 : -1;
>          |                               ^~~~~~~~~~~~~~~~~~~~
>          |                               audit_log_capset
> >> net/netfilter/nft_log.c:51:31: error: implicit declaration of function=
 'audit_log_packet_ip6'; did you mean 'audit_log_capset'? [-Wimplicit-funct=
ion-declaration]
>       51 |                         fam =3D audit_log_packet_ip6(ab, skb) =
? NFPROTO_IPV6 : -1;
>          |                               ^~~~~~~~~~~~~~~~~~~~
>          |                               audit_log_capset
>
>
> vim +48 net/netfilter/nft_log.c
>
>     28
>     29  static void nft_log_eval_audit(const struct nft_pktinfo *pkt)
>     30  {
>     31          struct sk_buff *skb =3D pkt->skb;
>     32          struct audit_buffer *ab;
>     33          int fam =3D -1;
>     34
>     35          if (!audit_enabled)
>     36                  return;
>     37
>     38          ab =3D audit_log_start(NULL, GFP_ATOMIC, AUDIT_NETFILTER_=
PKT);
>     39          if (!ab)
>     40                  return;
>     41
>     42          audit_log_format(ab, "mark=3D%#x", skb->mark);
>     43
>     44          switch (nft_pf(pkt)) {
>     45          case NFPROTO_BRIDGE:
>     46                  switch (eth_hdr(skb)->h_proto) {
>     47                  case htons(ETH_P_IP):
>   > 48                          fam =3D audit_log_packet_ip4(ab, skb) ? N=
FPROTO_IPV4 : -1;
>     49                          break;
>     50                  case htons(ETH_P_IPV6):
>   > 51                          fam =3D audit_log_packet_ip6(ab, skb) ? N=
FPROTO_IPV6 : -1;
>     52                          break;
>     53                  }
>     54                  break;
>     55          case NFPROTO_IPV4:
>     56                  fam =3D audit_log_packet_ip4(ab, skb) ? NFPROTO_I=
PV4 : -1;
>     57                  break;
>     58          case NFPROTO_IPV6:
>     59                  fam =3D audit_log_packet_ip6(ab, skb) ? NFPROTO_I=
PV6 : -1;
>     60                  break;
>     61          }
>     62
>     63          if (fam =3D=3D -1)
>     64                  audit_log_format(ab, " saddr=3D? daddr=3D? proto=
=3D-1");
>     65
>     66          audit_log_end(ab);
>     67  }
>     68
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
>

