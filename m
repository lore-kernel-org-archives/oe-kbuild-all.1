Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC35B41D12D
	for <oe-kbuild-all@lists.linux.dev>; Fri,  7 Aug 2026 11:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786103248; cv=pass; b=c6QLztrjAEO+85yOWC9/ikO0vXyb2ltvybQE6wmpjkle1MT88dAXx726Q5Y5T9bvjx/7U9xslHS1P3kOmoMEZTdpjLplFCRXE6hnFVeWiIozei+RGkkvUXFQ7zUF24vI0jyQMjd8gckwAnfbXcR6iqR6uYeZL8ZKHSGzIfUwbQc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786103248; c=relaxed/simple;
	bh=4T88Wo94NIGMg0gaIg48U5g2EDQZQ/ApJjYoD3E3jp0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lwXlV3b6cL4mlmLODAtazG2R70RjP+BaIJeL7bP4rqhIffCZ5rwg1MGz15kGdY2QRh2OhcbpepnyGBxg2il6b+NDp8zD14VeUzOAHvJZuYw3Emn3Q9aLgLVtGYCnnjTIC6XyTh8fhm2nIGCJtbMg8+XgY58WCe7cMHJHnemaDOU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=G59OsMJs; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="G59OsMJs"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-80e24970f1dso27322057b3.0
        for <oe-kbuild-all@lists.linux.dev>; Fri, 07 Aug 2026 04:47:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786103227; cv=none;
        d=google.com; s=arc-20260327;
        b=s9y2tAVi/aZecaN9kf943QRY+7vLxxwTyOp8/oS8mIN9YYG2RVYQ9TL6LjrC6d5fFj
         Q+5DrgG/1qI8I9VBFzfUYSGfb/SjeiLZPTYFizSeaQS7sOD35FeVOS3nzMBY+qARBJTK
         TVFzb7m8t+EXXG+1ZM76BFOyveO8WUS7P3umEAboEWfV3XfySlyJBFP56MWWT4HWD5XM
         flGBIF70hbn35wk9U0KCiV+CC+F7E9Qjdye0U/gVPm5JADFdf+N2Dnv0sq0IT7MEtxcN
         NVWCQkgjyhSgTZ7wTNGswk5LZVlfxYn7EmCPpcyDYHjJzSj/QqBHvkikYrv6FXzHaXVk
         SW4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uoRS6lteyHuaa5Tp6C6fzOIn2zZDD6ahq8EkedV4ffQ=;
        fh=TfXFEDDprI4VAWO1nZfEjEgwYhKn7tXI7S3hgl6cdDY=;
        b=lBglwZU2PFVOmjIoBVzXL4raezcISOKUXjWvpI1a6wBAUmG5aTiIwVEEH3smQKHk8a
         9sX1yCVzw9GGJjv/jad7mrO+aKSn0qPkUveJX1BVNgu1plcyRz+F+jgc1N4FmU0WUwKl
         7FDdkFVJvZsnVgEnO3UVZ//BlMKP0z2fMVJ0v7eU2a2UCHTzkvKkq3r30DwsPEbq507n
         hCd6CKjsRpTNp/hlH7DDg6tvrv3lis1t0T3mOi5+okIgRxQgzmIFUtf6Zm97YS6zi0N7
         TOVcaSd3CKIKn0Wf31rsDAuN7H+dHkMSA1qckKyUSDr3uhJeBbUnmDcjTMiAR+WoIAsa
         AvLQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1786103227; x=1786708027; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uoRS6lteyHuaa5Tp6C6fzOIn2zZDD6ahq8EkedV4ffQ=;
        b=G59OsMJs+z0OtPy+BMbekpxyL7aFRX4FwTFJZTnq5UGTWQD2dGSpRv4qWFcgh64FFp
         Mc498lXEiTC9tO0DIgqcF+Bwu/MpSHMroU+LF++jwhhCRkqHxf69Fb1fqrSxDrSx1NEb
         P80YD5787pYLD313qqOYecWz+bnPD5hbvZQW/c0jXWJp2ToZUkhQUF20XCYJHNc3gr5F
         yyEU4Ykr4TJGiuw9sun7/WAP7MRc9iGI8ZgReRu/H8LzloY/VuZtQjFx670ix/eiopOY
         GEoJeAbG8OOtGp6zPSgfFT6qmSXE9pJ0vod/DTZolh/kvQYf5vpuoK45eZ9m7vyS8nIs
         kxmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786103227; x=1786708027;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uoRS6lteyHuaa5Tp6C6fzOIn2zZDD6ahq8EkedV4ffQ=;
        b=GrWZqFeldCM1cK+FcFg40cm7tXOmOS6ute5oRvHCQgqwuR7YnPYX+0PfqLRIodRQc7
         PGxaYQOfcivT1k5Nll76cLft1/6WjSppci8z58vXhe2ueyWOOWZtFk31gJsZcgX5crOW
         zm2DIebc8daNKnkaJApTnz+6lttl069/DNYHhn3dkIubh5ff1YkIm5JGKRZNikHEkNus
         ko5cpXu/hYEjUynxr24WTrfRQoIVs7FArs2YsEvoikBbbg8wrkhF0WpzBZvRx/Fi+zV+
         8d/DJIoez15WwcqaYtD6OTbb77GwyfDKwdQoTrnaIXiL3KcT4y+LMEiIf/QPnV8Z1tFx
         lwgg==
X-Forwarded-Encrypted: i=1; AHgh+RpqDctoa21/a/tx+nlkjBFAX3lanafUO0+4X6N0pOKGP+QE9m7AtOPUF2BZz1HGd/B5Gue/WbZRAelAg8PW@lists.linux.dev
X-Gm-Message-State: AOJu0YzJUJec7GVdacZomrX6XJNBeCZz0kBDtojkbh1epLk62fjbPzWC
	NSAAZhJlftiQXLNoorZ0gMtWZtdsbTJqZRGBIa3k0+knm18SOa/6/ldyIYDBggO+3cQqulnPmZe
	uQ/l3gZgjSehwW1AHfKec48KKHDVS9Nebiru6jeKUF04oFpMPk4wVc8OKJ9wj
X-Gm-Gg: AR+sD13IZrNCTgC+rNn7Dixd7YxM3r2vZOGJLSZ69/DY2ncG8zblylmxFFIohdkDrLs
	ve87uHKtPOE4pSAGyiU6MbMgJEgjE9ePQYJVmcVcxPlsHD8vNZoNxT7ui+7yFx9IeRqOcCYdk2n
	4bdr1iIb5jy15uakqkxpT4+uwCXQV324aCaflUUwFT3wby3lin/xbl/fvfCxhz+04j2NPFDapGF
	7qeUfBzWxhKRBbrvsQtgBRBc0B17rwkc7nlGSlJOFIj93qau/OahpT1mDn4ux2FRwB7TDb3EPnT
	RGQKCAPhWjQ59WnfGh/UFZNkAznDA+A6kgaTlF6029U=
X-Received: by 2002:a05:690c:c0f:b0:81d:e7d2:a46d with SMTP id
 00721157ae682-8225762b659mr50005557b3.5.1786103227417; Fri, 07 Aug 2026
 04:47:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202608070433.x3vNSfjt-lkp@intel.com> <20260806163644.20229f5ab7cbf176edbf2613@linux-foundation.org>
In-Reply-To: <20260806163644.20229f5ab7cbf176edbf2613@linux-foundation.org>
From: Muchun Song <songmuchun@bytedance.com>
Date: Fri, 7 Aug 2026 19:46:30 +0800
X-Gm-Features: AUfX_myppgswCKizRll7wa06WzEcopq9AaGL6Phs6d-kIlQXFDfCLVlPjtCaBeQ
Message-ID: <CAMZfGtUdQqMVJGZP9MkqTcxaOQX=jmBi=BgESLVQy4ek_9pMjw@mail.gmail.com>
Subject: Re: Re: [linux-next:master 8777/13479] mm/hugetlb.c:3095:39: warning:
 array subscript 4294967295 is above array bounds of 'struct list_head[1]'
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 7, 2026 at 7:37=E2=80=AFAM Andrew Morton <akpm@linux-foundation=
.org> wrote:
>
> On Fri, 07 Aug 2026 05:01:04 +0800 kernel test robot <lkp@intel.com> wrot=
e:
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   ea2bff00da89d7767d677bb68470130ba96f4928
> > commit: 20549ccf4da49ff6dcb35ffc741f92aa92e07aeb [8777/13479] mm/hugetl=
b: free cross-zone bootmem gigantic pages after allocation
> > config: parisc-randconfig-002-20260807 (https://download.01.org/0day-ci=
/archive/20260807/202608070433.x3vNSfjt-lkp@intel.com/config)
> > compiler: hppa-linux-gcc (GCC) 8.5.0
>
> Such an old compiler.
>
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260807/202608070433.x3vNSfjt-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202608070433.x3vNSfjt-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    mm/hugetlb.c: In function 'alloc_bootmem_huge_page':
> > >> mm/hugetlb.c:3095:39: warning: array subscript 4294967295 is above a=
rray bounds of 'struct list_head[1]' [-Warray-bounds]
> >        list_add(&m->list, &huge_boot_pages[nid_request]);
> >                            ~~~~~~~~~~~~~~~^~~~~~~~~~~~~
> >    In file included from mm/hugetlb.c:6:
> > >> include/linux/list.h:163:12: warning: array subscript -1 is below ar=
ray bounds of 'struct list_head[1]' [-Warray-bounds]
> >      new->prev =3D prev;
> >      ~~~~~~~~~~^~~~~~
>
> Well crap, that patch has been in there since June 12.

This isn't the first report. This is the second time we've had the
exact same report,
see [1]. Interestingly, the GCC versions are all the same (8.5.0), so
I think this must
be a GCC issue.

https://lore.kernel.org/all/202607010945.6lDjBFTU-lkp@intel.com/

Muchun,
Thanks.

>
> I can't reproduce it with the provided config and hppa-linux gcc-16.1.0.
>
> Muchun, I'd be inclined to pretend we never saw this.  But if you want
> to address it, please do a patch against mm-stable with
>
> Fixes: 20549ccf4da4 ("mm/hugetlb: free cross-zone bootmem gigantic pages =
after allocation")
>
