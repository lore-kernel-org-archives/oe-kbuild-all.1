Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC766270EDD
	for <oe-kbuild-all@lists.linux.dev>; Tue,  1 Jul 2025 11:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751368422; cv=none; b=o8pARFoOZaNrO5keufOS4u8p7ICIP7O0ruPeXCJn/Ho28klPOTTvT7EMjVraRtM9d7aOq810rxR1FLuZSjuiB/pzB6tyEvU3uEV6ffOUk29oFx0+l7JNykFzJSH7AeXEugu7OXUyfP91DcRJYU7pBDM3Sdd0AE5RHzjTL1JvCTU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751368422; c=relaxed/simple;
	bh=8jDBnTO4KAeg7BWMwqi5hx2TF6/XIeEmV7vlcXF5FVc=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Frm0ahPv9bp+JSoGrTN4D+Ba/5sW4wtvz69eVooYu3x86XdiK/2lQWwM8lg4ejyP5sKxgHABjqUZhNiGSYmjUjt+xTRg3zufdzoeER1EL+621D+O3JwnOfQ5eitLkyVkOZjbDLR+QLl2PZ8qJBwnEIiuQDcjaLisWSNbEkxM9EU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com; spf=pass smtp.mailfrom=cloudflare.com; dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b=eJ/G4bsm; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloudflare.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cloudflare.com header.i=@cloudflare.com header.b="eJ/G4bsm"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ae0bde4d5c9so1011946466b.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 01 Jul 2025 04:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cloudflare.com; s=google09082023; t=1751368419; x=1751973219; darn=lists.linux.dev;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=RNW7caVwKhgGVodSQGEfKDOFvOt0nWsTUGnawMeLUPI=;
        b=eJ/G4bsm2GQd7rxJxAwPNWP7JuRDtA6KBLDmYz/L8sHL69HDFnW5HN8/SnGxnU0hTW
         TSteni/a+2E+3IFDBlw1JAkJDvg8v/ixod34iq796NWbAdsp+cFRkrOGVuk7j9r4/cOs
         7gw1bWO5S17drh6fhNOIkmkc+joAxXnwpnGP6HhDugkfUJwCHmimuajfqfdfJ97vy7ps
         MN0T/6GrseBXag+tjSozfMR7BSSQUYBIXUxVHIk2E2oYKjhAzJjz7XE8VTN3UF5s9ZfL
         STk3plM9DZPwmL/Q03MKqtjm6Gf0keHnU6MNOg4yMuF689QfN48MZu2Q+VZAbdKazPtI
         J5+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751368419; x=1751973219;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RNW7caVwKhgGVodSQGEfKDOFvOt0nWsTUGnawMeLUPI=;
        b=KCIZTs7ivHNex8LqCz4xSZhlmLnyJbZ+PPcgISWGB7zLA8l1Cc/6sB7NhzM95VBsst
         vq/00arXoVDuZpQlsBIwD046wPTeHliuSmvxeXYUcE8bGI7g4V5/k6h0dNvmuGITwLkU
         J/R8weQvRzIL3bBq9fFNYPvwAkafQ2xoz7roHJqpnBgs8UT75rrWAp0UGWYpPrBDo4UB
         UnuwLXj8NvW3CpdMgxxjesICaAtWdD7BpZkANGANuj4v7NvgB0uNfzilzoB1spS7UVXq
         IR3o/2ICeOY6wHjMoupaPqqBWkMF9bSxQbUg2JasEKiMhTWpB1jtXSB9/WUz4kDguVE6
         1MvQ==
X-Forwarded-Encrypted: i=1; AJvYcCUbP43YXY1fAp6XKZojAvJkzREZb/X2hO1JiGBarV6o0cxCzASrl+xQEi/SouPln7Hi+FGd1CpeI1YeMAR/@lists.linux.dev
X-Gm-Message-State: AOJu0YwCnfCwwYVYiWNHx5efHifZ5LqOTg0929EswiXeD1UIqUm9AeHz
	Asmqto8TwYj5QL+M4Oulsz/pIgYNRbk1Uzla/f1HEGQOLIzkcM8db2xIrp6yRBWTOunnRTuForP
	8ZBHm
X-Gm-Gg: ASbGncvXWAdyz5dU9se17gkuX8vcwDrfKVa8tDVupI+1xNpa4oQ/PeyFmocUHU7dYKP
	NA1wKy36U3uTtkWa0f3SqfM+9rlR7qP+wgcsiewtlAW+x6ppVATcqf1tyJUl2syJdaQkkHVRYk2
	82/LRMzzIRwgphw5MTGH2oLgyhZjLDve10VUzqPiD0IqZixIhdce52yXg2o7oRCg0sMpPIdmE5z
	sXIwaij5VJRKyjwgsRsU2DheMD7DifKTm19eIFhDmrs0FT9gWTQC3Nbl8S4fzwvxEcuRoAI+d0b
	OzSvUEhwmc/Mw7ylr5z+MENZt/dGLXaNpkf6RAkVGbQdGZ1z8PwIKI9dasYiM7Np
X-Google-Smtp-Source: AGHT+IGvBYigzda5z3S/KyAtKqMZgrtoNPrhpPSo3Xu3AtEfuPsxhlo4U3j9SMiIgVPvUL9uq9r0ig==
X-Received: by 2002:a17:907:3e87:b0:add:f189:1214 with SMTP id a640c23a62f3a-ae34fee2af8mr1390797166b.24.1751368418911;
        Tue, 01 Jul 2025 04:13:38 -0700 (PDT)
Received: from cloudflare.com ([2a09:bac5:5063:2dc::49:21c])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ae353c6bc08sm842446366b.131.2025.07.01.04.13.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Jul 2025 04:13:38 -0700 (PDT)
From: Jakub Sitnicki <jakub@cloudflare.com>
To: kernel test robot <lkp@intel.com>
Cc: bpf@vger.kernel.org,  oe-kbuild-all@lists.linux.dev,  Alexei Starovoitov
 <ast@kernel.org>,  Arthur Fabre <arthur@arthurfabre.com>,  Eric Dumazet
 <edumazet@google.com>,  Jakub Kicinski <kuba@kernel.org>,  Jesper Dangaard
 Brouer <hawk@kernel.org>,  Jesse Brandeburg <jbrandeburg@cloudflare.com>,
  Joanne Koong <joannelkoong@gmail.com>,  Lorenzo Bianconi
 <lorenzo@kernel.org>,  Toke =?utf-8?Q?H=C3=B8iland-J=C3=B8rgensen?=
 <thoiland@redhat.com>,  Yan
 Zhai <yan@cloudflare.com>,  netdev@vger.kernel.org,
  kernel-team@cloudflare.com,  Stanislav Fomichev <sdf@fomichev.me>
Subject: Re: [PATCH bpf-next 02/13] bpf: Helpers for skb dynptr
 read/write/slice
In-Reply-To: <202507010904.MkxDYPdY-lkp@intel.com> (kernel test robot's
	message of "Tue, 1 Jul 2025 10:03:30 +0800")
References: <20250630-skb-metadata-thru-dynptr-v1-2-f17da13625d8@cloudflare.com>
	<202507010904.MkxDYPdY-lkp@intel.com>
Date: Tue, 01 Jul 2025 13:13:37 +0200
Message-ID: <87frfgnoym.fsf@cloudflare.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, Jul 01, 2025 at 10:03 AM +08, kernel test robot wrote:
> Hi Jakub,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on bpf-next/master]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Jakub-Sitnicki/bpf-Ignore-dynptr-offset-in-skb-data-access/20250630-225941
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git master
> patch link:    https://lore.kernel.org/r/20250630-skb-metadata-thru-dynptr-v1-2-f17da13625d8%40cloudflare.com
> patch subject: [PATCH bpf-next 02/13] bpf: Helpers for skb dynptr read/write/slice
> config: microblaze-allnoconfig (https://download.01.org/0day-ci/archive/20250701/202507010904.MkxDYPdY-lkp@intel.com/config)
> compiler: microblaze-linux-gcc (GCC) 15.1.0
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250701/202507010904.MkxDYPdY-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202507010904.MkxDYPdY-lkp@intel.com/
>
> All error/warnings (new ones prefixed by >>):
>
>    In file included from kernel/sysctl.c:29:
>>> include/linux/filter.h:1788:1: error: expected identifier or '(' before '{' token
>     1788 | {
>          | ^
>    include/linux/filter.h:1795:1: error: expected identifier or '(' before '{' token
>     1795 | {
>          | ^
>>> include/linux/filter.h:1785:19: warning: 'bpf_dynptr_skb_write' declared 'static' but never defined [-Wunused-function]
>     1785 | static inline int bpf_dynptr_skb_write(const struct bpf_dynptr_kern *dst,
>          |                   ^~~~~~~~~~~~~~~~~~~~
>>> include/linux/filter.h:1792:21: warning: 'bpf_dynptr_skb_slice' declared 'static' but never defined [-Wunused-function]
>     1792 | static inline void *bpf_dynptr_skb_slice(const struct bpf_dynptr_kern *ptr,
>          |                     ^~~~~~~~~~~~~~~~~~~~
>
>
> vim +1788 include/linux/filter.h
>
> b5964b968ac64c Joanne Koong   2023-03-01  1784  
> e8b34e67737d71 Jakub Sitnicki 2025-06-30 @1785  static inline int bpf_dynptr_skb_write(const struct bpf_dynptr_kern *dst,
> e8b34e67737d71 Jakub Sitnicki 2025-06-30  1786  				       u32 offset, const void *src, u32 len,
> e8b34e67737d71 Jakub Sitnicki 2025-06-30  1787  				       u64 flags);
> b5964b968ac64c Joanne Koong   2023-03-01 @1788  {
> b5964b968ac64c Joanne Koong   2023-03-01  1789  	return -EOPNOTSUPP;
> b5964b968ac64c Joanne Koong   2023-03-01  1790  }
> 05421aecd4ed65 Joanne Koong   2023-03-01  1791  
> e8b34e67737d71 Jakub Sitnicki 2025-06-30 @1792  static inline void *bpf_dynptr_skb_slice(const struct bpf_dynptr_kern *ptr,
> e8b34e67737d71 Jakub Sitnicki 2025-06-30  1793  					 u32 offset, void *buf, u32 len);
> e8b34e67737d71 Jakub Sitnicki 2025-06-30  1794  

Copy-paste mistake - extra ';' in the stub definition when
CONFIG_NET=n. My bad.

Will fix and respin once people had more time to review.
