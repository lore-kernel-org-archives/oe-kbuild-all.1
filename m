Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11F72229B1F
	for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Sep 2025 16:41:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758904873; cv=none; b=YOC3MAmneZMd5sgWzgBgVTt9+LphJGHtLGeHfBvOqutw0jluwplbbIYlddkb3p0tDWRKq0+4+7q2TrdLJMXcOtOLwb1X0CbFkTr7IwbYjwZBdrCsvLeBs9lfIlgkxjsWjj+Wz/0iouTtoLcTPzLB+uFSvd2eIHd87bj/Mjd8u3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758904873; c=relaxed/simple;
	bh=aVQU6Uf390VwLwgOyoJaPwfqW7aHy5b1UHicJhjquUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hUg4/El7RvjKFRd2xsW6ELft2KyhSSUX9K5waEISKrAo/9wi3zJXGV1WR94SNjQQo7NymAfEl2FsOmi7o+afzcoa8B/mWBrHs9GxjwwtyUuYUGCY8EhLnHeHrlfG2vGfUtggKjPWtlyAbGJHNMY7V0EZpY6/HjSlwMJ2uSDYLqQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fe7wcSLw; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fe7wcSLw"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b3727611d76so270829166b.2
        for <oe-kbuild-all@lists.linux.dev>; Fri, 26 Sep 2025 09:41:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758904870; x=1759509670; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OhK/I355tEzWCZLpIKaGMRHfbyhnGIybWqmQS9Bgtnk=;
        b=Fe7wcSLwSRBdQzifF/+lfU6xWvab+phYXZg51STbwXp8jmlhmkGOebSIvbJ8I9TxLw
         GLshtTXM6mgoIYG08WNT2UbNWaaXPn1PzeUTgwAIF5kfhMh4E8geGK64I7NQ9XBpdwGM
         sahgGQr7E06WKZLXo4fwWVn0rmHmnPLydYRFANgtzf/scwdJufWTGdRrT7R2pNzsbE3C
         KtMz/c0C1r+wdcmONEqh66VvdEsvQK5E1JAsMWh+0DlWYwBfID7q7NDXcpCC2ID5/xdj
         3xjl07h3tJH1YuMkA5gZDMGRMqi8El6kx92HDEmqHjmAhCjlRAFIvC54SO921CP000lg
         UjNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758904870; x=1759509670;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OhK/I355tEzWCZLpIKaGMRHfbyhnGIybWqmQS9Bgtnk=;
        b=Q+Y5TWb9ok7D6bmqkSHqbzgYGTIVBOrkct+p3LkiOefAg/TR3DvJa+nqz3tDTblvsr
         eDbmVsUlwDM/J1KRgY36na/aD5c8Z9YWDAMIZ2N2oaaBe8MDj/77JQtxJiDeLLlVmoEQ
         iSO4fo3Gr3z5dWbgvBjr1VQnkW+uniXb/SYfLKrulSNYc1JAI53pFcFX+Ocuz0Lp1b8L
         isE22sg+SRehPnNdEa/KqBlq0l+MwM6ysk3klukmOvu0Mncw7mow33GZjISIEa7VgkVE
         Ey+4Zqtn6cioAlBG99GOdtPvcMAYHEN1rFwCYDiJVw2b7XoERsQUxDNYUJkPAtMWlHJi
         Djgg==
X-Forwarded-Encrypted: i=1; AJvYcCUmz9dEr/o96ymIuMCz4cqJr836XfY11dKzGOwZSiJ0F+FlP/HBhw6eSFjxx9iCrvx1reSEp6G7J3uIEHei@lists.linux.dev
X-Gm-Message-State: AOJu0YyIy7e8NWMRQdyR5LmM1C6BxDfkQdv/KulY5Ez8GwOtg55p1zb7
	yfDoQe1AOxGQ+sKN/XEGc/Dw3Tl+YxordjLOJI1YqWXcDW1Jx9h4J1rxGZ6DYTUbwvOjscbpFGW
	KsGX28dJE83EWd+7prb00+3+y7AQeKuA=
X-Gm-Gg: ASbGncsI19+nkWgibufcgdyk4NbJFXJ/60d/cf8+Hb9E9Tm3ZhGyNGGRkVoeJ4oKqHT
	yW9FMMT3xlYzt90SbsCkGIxprrXp6K+p1vAnQLF3R+nvD8ZyytDYL9EUojk1PDjnUvRm8NASQUC
	L0bhsD3OeNWbfnYbjZkU6Y4uJzJh+ujre6Pyc6GGz71EjCM+9/cpVwgOfJqsWMlZZY0PoOgbE9u
	h9qryEdgJx9hFAzgFbl4drwGfinJZAR2Kvgw+V9uWZnx9E3/3qjHYU=
X-Google-Smtp-Source: AGHT+IGiAgB3Cp3l/+LWlbB0J5SQqcA//CNAV4YTQyXTFqA9cx49Yh6QtYgAgO3MbSqw95Dgnu0URBo7YFe9FVeY/8Q=
X-Received: by 2002:a17:907:86a9:b0:b3a:1300:e8e4 with SMTP id
 a640c23a62f3a-b3a13102ed4mr8997966b.12.1758904870081; Fri, 26 Sep 2025
 09:41:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250924204409.1706524-2-joshua.hahnjy@gmail.com> <202509260132.awvdNKqF-lkp@intel.com>
In-Reply-To: <202509260132.awvdNKqF-lkp@intel.com>
From: Joshua Hahn <joshua.hahnjy@gmail.com>
Date: Fri, 26 Sep 2025 12:40:58 -0400
X-Gm-Features: AS18NWAvPCxQoYx4Q1NMydC8ffwXDXCS1U2zPQc-T1l-6SyQtlRE3k2R9alT660
Message-ID: <CAN+CAwNBg+3RwAsBxOEMk6aK+tb2O45wfnJxBdxRPSBi+vHEUg@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] mm/page_alloc/vmstat: Simplify refresh_cpu_vm_stats
 change detection
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, Andrew Morton <akpm@linux-foundation.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Chris Mason <chris.mason@fusionio.com>, 
	Kiryl Shutsemau <kirill@shutemov.name>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Brendan Jackman <jackmanb@google.com>, David Hildenbrand <david@redhat.com>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Michal Hocko <mhocko@suse.com>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Zi Yan <ziy@nvidia.com>, linux-kernel@vger.kernel.org, kernel-team@meta.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Dan,

On Fri, Sep 26, 2025 at 11:34=E2=80=AFAM Dan Carpenter <dan.carpenter@linar=
o.org> wrote:
>
> Hi Joshua,
>
> kernel test robot noticed the following build warnings:
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Joshua-Hahn/mm-pag=
e_alloc-vmstat-Simplify-refresh_cpu_vm_stats-change-detection/20250925-0445=
32
> base:   097a6c336d0080725c626fda118ecfec448acd0f
> patch link:    https://lore.kernel.org/r/20250924204409.1706524-2-joshua.=
hahnjy%40gmail.com
> patch subject: [PATCH v2 1/4] mm/page_alloc/vmstat: Simplify refresh_cpu_=
vm_stats change detection
> config: mips-randconfig-r073-20250925 (https://download.01.org/0day-ci/ar=
chive/20250926/202509260132.awvdNKqF-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project c=
afc064fc7a96b3979a023ddae1da2b499d6c954)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> | Closes: https://lore.kernel.org/r/202509260132.awvdNKqF-lkp@intel.com/
>
> smatch warnings:
> mm/page_alloc.c:2591 decay_pcp_high() error: uninitialized symbol 'todo'.
>
> vim +/todo +2591 mm/page_alloc.c
>
> 06fb80866d37b0 Joshua Hahn    2025-09-24  2564  bool decay_pcp_high(struc=
t zone *zone, struct per_cpu_pages *pcp)
> 51a755c56dc05a Ying Huang     2023-10-16  2565  {
> 51a755c56dc05a Ying Huang     2023-10-16  2566          int high_min, to_=
drain, batch;
> 06fb80866d37b0 Joshua Hahn    2025-09-24  2567          bool todo;
>
> needs to be initialized to false.

Thank you for the catch, I think Christoph also pointed out the same
thing earlier.
I'll be sure to fix this up in the next version! Have a great day!
Joshua
