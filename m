Received: from mail-il1-f179.google.com (mail-il1-f179.google.com [209.85.166.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD0F303A24
	for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 21:43:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760132587; cv=none; b=uMzqhhAv3rB1y88KHMGFkz8i35m+kBtk/lcqxl0/m6SWZo6beID0eTCgtzehAvxay0V5fxBALo+VqKFup1Wv/x95LM5XCXhuFVzcFXYwLgnqxtJPxARk4SGu4golskiWZOKzP3PmWyt4EUKEBI7svoRYg/56hD4RpLaAYh+2SZs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760132587; c=relaxed/simple;
	bh=fwjcVIiQrqDfhLwRQIz7WRB+b/8kgGHlcJpHFwbz7Bo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Aw8hRqH4URJaoH+sAYOTQXkJoBW0ljm9Wrnx2xt3CcFDPJ6MAP3uchm8AKdkFnAUNJOqONJdvksdvmVLk0B3rrSHtQeirCGK3gWxNjDBXWeNNTGt6hTOHhfW8aCPk0iOkGOogWTZsq0sSWawVw0wU9K2fPlngYQrJvub5LWzBWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jSBcHQoN; arc=none smtp.client-ip=209.85.166.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jSBcHQoN"
Received: by mail-il1-f179.google.com with SMTP id e9e14a558f8ab-42f8a966fe8so47705ab.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 10 Oct 2025 14:43:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1760132585; x=1760737385; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zTEdXIM9TCGjTEQmnu4q5KwtmIgjop26pFrSD5vSjaM=;
        b=jSBcHQoN08Q8eOP+ETGGtiKFVbzIRWpPhPlZJ6/anKBCnxUq0X7q51n3iAAjrYc2on
         YiiRfvLsRGT4sKuc8aCGfoz48pY6MrYgFDSdmAumv7zT3ZZPZjX5J+TokbdUx9RtucXL
         ZgcKZzORIVbI6DfiZda3Wxss4+k0F0/sgqAXDOgaSURC3aWdl+CZoeABfsDzfGWE7AjK
         UCDMU+5RrQsD+WhS30fRHR3RER5qZ/XFkFQC8IdWGnc5Kw5HwvcMNiQCx5w25YXfp0X2
         LFVlgNdcrOYGtNwQFoYcC+a9rfapLt7B5JC+79BdIKvOLIDSWYdE/0JGNmQ2yczSpU5b
         xSmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760132585; x=1760737385;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=zTEdXIM9TCGjTEQmnu4q5KwtmIgjop26pFrSD5vSjaM=;
        b=Z0/ymHXM6NkMPy6FEvvprNjZXJXNqMAsxD8CuEjbrAXAm2vc/Msd7JJvGM8Vd5frPz
         +18BrxuXaiN+Dz8qbZEAPNipQ035LgSLiXY6D6QSWtWU+nuH4keaCXu4/jzffR7uAdox
         inTrLRwveIm8kVG7oNFNJBVm1OXfPNIEEMJL+JwGGtgHbRoVamh1lgJ/W0Y26Hp67jtt
         Dig9kdCz4yBRXpRwBhoVlhtztGsUkXQfxy3iVUEfR53xwPYpWMBJKH6VqxnOYAKpG6g6
         xbCzEA31d+IYHwSkoN9LBQ656ZIJpIYyEp0951zSRpyMCUsoF31+7r58B9bP+aTijm+R
         I/ZA==
X-Forwarded-Encrypted: i=1; AJvYcCXcm/ThYc4EsCQZJg4dELzvAOw25ttib9FMbyxjnEYyFltsjbcChalO9/QfETu1edSoCGFCl7EHemDmgxiR@lists.linux.dev
X-Gm-Message-State: AOJu0YyiZWlOBgXo9w+l1vJnmWYRp2BRxUqcpTqSAkRF8Us8LNSHmE8J
	thHhvEZYFwhkmNPrY9FTmuezjbkd6CDfT/RCyw+vnnwDBtlIBZEZ28fLj5y0/Zsjjz5fHjhzwax
	oOCCYOXuDX4gKo5/FDzaowI9uu7cMYfbpjzG2vrv4
X-Gm-Gg: ASbGncsJUcVT5/Ud17K/eyHqwa+4UJ/Rx86dMZeEGhI8nmhh+Cc9c8PN68Jik9VO8tC
	e/qKK/cz00fknAamYiDrylJNWAS0dKlUL1Scb34bBDFAmlnyXefnL3LVk0atoWn+TRCAOR03oR/
	IO68VEOl5X1tsYcS3hek2gkR3HYV50Chcm31P9iaUACzjzonoJgnvvromPCqcN5w33osMpDt9b2
	wiIY7OMl6mQpc/x0l01eMfwdppHZ62clPcfK+/79w==
X-Google-Smtp-Source: AGHT+IFYO/m3ZokqgLgfZFSBuJ8vQyfm/3HMocIoflB016BCepHu8r9v6klK4bxjJEyMNFam7jZJfb7DI/PhTm+ebno=
X-Received: by 2002:a05:622a:348:b0:4b7:a274:d54b with SMTP id
 d75a77b69052e-4e6eac0ca05mr25279901cf.12.1760132584434; Fri, 10 Oct 2025
 14:43:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20251010011951.2136980-2-surenb@google.com> <202510110501.92Srmvgx-lkp@intel.com>
In-Reply-To: <202510110501.92Srmvgx-lkp@intel.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Fri, 10 Oct 2025 14:42:53 -0700
X-Gm-Features: AS18NWCwzOb_Fs69JrpmWw3AQRynK9NMKzj3B1QDKKaakj7u0qI0Eoy3eq_sHTw
Message-ID: <CAJuCfpEa2rdLuu81SJ807M1vuGd1eY4GMO2CrrfU8gY=VRtPcA@mail.gmail.com>
Subject: Re: [PATCH 1/8] mm: implement cleancache
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, david@redhat.com, lorenzo.stoakes@oracle.com, 
	Liam.Howlett@oracle.com, vbabka@suse.cz, alexandru.elisei@arm.com, 
	peterx@redhat.com, sj@kernel.org, rppt@kernel.org, mhocko@suse.com, 
	corbet@lwn.net, axboe@kernel.dk, viro@zeniv.linux.org.uk, brauner@kernel.org, 
	hch@infradead.org, jack@suse.cz, willy@infradead.org, 
	m.szyprowski@samsung.com, robin.murphy@arm.com, hannes@cmpxchg.org, 
	zhengqi.arch@bytedance.com, shakeel.butt@linux.dev, axelrasmussen@google.com, 
	yuanchu@google.com, weixugc@google.com, minchan@kernel.org, 
	linux-mm@kvack.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Oct 10, 2025 at 2:18=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> Hi Suren,
>
> kernel test robot noticed the following build errors:
>
> [auto build test ERROR on 70478cb9da6fc4e7b987219173ba1681d5f7dd3d]
>
> url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasaryan=
/mm-implement-cleancache/20251010-134501
> base:   70478cb9da6fc4e7b987219173ba1681d5f7dd3d
> patch link:    https://lore.kernel.org/r/20251010011951.2136980-2-surenb%=
40google.com
> patch subject: [PATCH 1/8] mm: implement cleancache
> config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/2=
0251011/202510110501.92Srmvgx-lkp@intel.com/config)
> compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd70=
8029e0b2869e80abe31ddb175f7c35361f90)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20251011/202510110501.92Srmvgx-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202510110501.92Srmvgx-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> mm/cleancache.c:119:13: error: casting from randomized structure point=
er type 'struct address_space *' to 'struct cleancache_inode *'
>      119 |         *ccinode =3D (struct cleancache_inode *)folio->mapping=
;
>          |                    ^
>    1 error generated.

Matthew's suggestion to use unions for members with multiple uses will
remove the need for typecasting and should solve this issue.

>
>
> vim +119 mm/cleancache.c
>
>    113
>    114  static void folio_attachment(struct folio *folio, struct cleancac=
he_inode **ccinode,
>    115                               unsigned long *offset)
>    116  {
>    117          lockdep_assert_held(&(folio_pool(folio)->lock));
>    118
>  > 119          *ccinode =3D (struct cleancache_inode *)folio->mapping;
>    120          *offset =3D folio->index;
>    121  }
>    122
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki
