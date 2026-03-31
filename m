Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 719F228D8DB
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 03:16:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774927008; cv=pass; b=OSLZuKM1pS6pqIiiQ+cJ7CnnkR5/RBRB1PGh06U8VzEl16HGi/sODmmXwEFDEJOWaN5k2TMVYi5qiMXcW/VkvEYJupsLb0pzKVovlh/LkWI8cvJv+CBm3XQWG2ClYLfyL5mq2XMmnekVtIagO3iR9kQAfP6JGJg4viZHKIqDk8Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774927008; c=relaxed/simple;
	bh=OZUfCm20mnU6SRCc5qYIeU7TSznn5TljyuLEeUld9aI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NkMxKdAdU+6VSysBEcHmG3L3W4Sr9uHtHMacJp0M98+bQ47i1yMe/v9ZaCWU/pDy9B46ecAb9OuSWRMiQQvBXwkshrgtlDQu0mNoq4B5hjxOrtI205bDYcZjOj46SrVKz10mg7W5IHm2DR/5LRdISVXIkr1BsqgqMMZjjK/XcAs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S3mo8O8E; arc=pass smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S3mo8O8E"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82418b0178cso2491294b3a.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Mar 2026 20:16:46 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774927006; cv=none;
        d=google.com; s=arc-20240605;
        b=e1UaMDQqK5Tp804FGHnJEfZT+MkcWBFSZeDhmOoNBkKNPN62CtbjMzqBBGiaCrV5gh
         2qINJdUUE2MMdV5Fwp7KpjWp/jc0M5BgBTSsogOp1zW5Y6SZ45ir6j/zHjiY+Z5sGRq9
         Gas5z0XmGwNcDdqFEc28jj8Ta1lcLMsssvyvoOhe3XakVlilCusVM25e8LhC1PdHOjuO
         U8XtcwzjvR9ZMONaVlabVGMkvgmlpvrG5jNODMDldDnVQCMZsDYphEOuDJeMffJPmzL4
         IrgJmyiB1egT+/I+c6WI3+qZ286Qjs8MPKcbU8PS9BkY6IGH+Lq1g5CKx2ja+6GV1VXT
         6KFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jjkCSJGTx0kYz2G9Pyleds319xKwqsILqbgvz8ReooQ=;
        fh=pIqc1qBbGJTACQe7Q+JmnhdK+31nZ5ZYFmpVCGOy8Fg=;
        b=WY26SkS0vU7BrR81GgptCH5WRldBZ8V4p1JZQ+MRXDzcyKaDSufcWDHwxlx5D/VA1F
         VuT4ogMIhPaJrrkFL4I6bVKidjTDkwDsaUxIO4SnB9kyDqOVWFjhFciJuF54zg6G48n7
         uad3H7vlkWpzbc9Dq3b6Sr8REOe1qnb+KtBMz7zHjSB6dwl+jtXTnyXDtFZ+lgPVaoUJ
         uYVeaExTaztofKEkPwB6wkvqLUqf4BiGz4sRifhOAIJFDWEupeQQx+baa1OX8QWYkQnG
         XECuf2+JgoKixbJF28fyC8BxFIeIkYVBcD1W/uX/WczwvUs/FnHz5XUiSZD6U+Frpedj
         OEuQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774927006; x=1775531806; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jjkCSJGTx0kYz2G9Pyleds319xKwqsILqbgvz8ReooQ=;
        b=S3mo8O8EFdZjmR9/imIPVn+IQD2sOcR/JaX1EzORzZdqcbEywALi0BZwBUZc4A/XAu
         QY/iU+GgmPkqtJsyZ1tj2PmRO35X8Fjzt80vLJcWuQzCfl6jVg2xn2/CfJDXbfQgfTPu
         ZeDy/iQFjwyzIDBjKZ7V4lTAsmdW5vNLgBHyoc469pddln6mydShDL/DbQBOJc0kui3w
         PgmjFynnklV60H66bbyy2LJ7eAZ/4op+U6fsiAv0g2/oYxqCAtPsdtxlANq8y84Eir06
         Uep34OKDWOmv7PoXF4BtzwyP4ZeZ1UeIUu8rf2GifwYFv+5PX0Ti3YesTAb8BAtJsmCK
         banQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774927006; x=1775531806;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jjkCSJGTx0kYz2G9Pyleds319xKwqsILqbgvz8ReooQ=;
        b=bUt5Lstk488HnztPfJ0ZFEf2L5tVHq4GzHlXIB2EpJwFi/UUvxsd3uIxqN1xEHJWLQ
         qZt9TZd8V49R/cOD4trh5pAd5QG4VAB3JQqZo6dxiE3Q5wEli+6ZJknO78DRUWjvMZWS
         MndudUCgmkjD2WGqRwUebGtr/LFx/gGyRB4KjVRE5cfR+M85/F30unE5hD02NKn7Ikgd
         FOcfYr0rW9n0Dxr8j4daOyWJYd/uqoDyMoV5eIWlcTnyTP3nhuopW/3qPCgzpxrkM/hV
         bqOnd1r2Tl8sofi8PktEMFRAAUrLaQMuDISIsOskR8z3YgB3218uBcw4fDVqyj+eAARk
         3y8A==
X-Forwarded-Encrypted: i=1; AJvYcCVWiU3PzJyLytXshVpj3pbK3dIYoQemkQnrTxtjzahkypxtl9U46Yf/zKU+Ck3oDJxEZ6wUTDufOK8/kNYe@lists.linux.dev
X-Gm-Message-State: AOJu0YzLG+QmA4ja7kTMkpRlvUmcmHaXsuV8Y6eQo0J6RDL9KZtRC5uO
	x01VyO+DRnuBOMt4TXTob4vZaPyHUxB9ZsggLLgs4/L9he6VAh403jezpF3JvukxQySKlIsT5sB
	X7tRm36m6GndSdKhbwUSm3TW6vo2TzW4=
X-Gm-Gg: ATEYQzzbeJxTn50De309IKt71jcKw0VzU++LLV/dfDNO1tnvxyYyQN7nAR7YuVjoqam
	/fg8XDl+sypz+3Hwmt7foqikb0E+ox8gWlIWUHMgVPWf6GMNbrBt7SZXv8zYtrpURQaRu/MvYVk
	BxpDulHMo+m8X6VXbPQlIkeITSy0/Ek5b8y0v/L7Kmo4QS5t/k4DywggTB+ssPdlF4ALM0kcRqT
	/qhtsPxoQUgIswQl0jNg31w+WMxjLR632Hr0if+VyAfdzvC59SlLSa0nQMMdNE/Lm5IH9iaUiiu
	RBjDn9KdraY4D6NB
X-Received: by 2002:a05:6a00:3699:b0:82a:6167:b1ae with SMTP id
 d2e1a72fcca58-82c95d465c0mr13377941b3a.24.1774927005577; Mon, 30 Mar 2026
 20:16:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20260201063532.44807-1-pilgrimtao@gmail.com> <20260201063532.44807-3-pilgrimtao@gmail.com>
In-Reply-To: <20260201063532.44807-3-pilgrimtao@gmail.com>
From: Chengkaitao <pilgrimtao@gmail.com>
Date: Tue, 31 Mar 2026 11:16:33 +0800
X-Gm-Features: AQROBzBAxGIDAH3ts6Ui9lBm3gfklFisQpwjANMscsN6aLMHkfss2YVM3lRECS8
Message-ID: <CAAWJmAaOL_NUtJZfHguSdPUsNVCSU0U=GWnTeVAKhnGgwSKeEg@mail.gmail.com>
Subject: Re: [PATCH v6 2/2] mm: Convert vmemmap_p?d_populate() to static functions
To: akpm@linux-foundation.org
Cc: linux-mm@kvack.org, "David Hildenbrand (Red Hat)" <david@kernel.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andrew Morton=EF=BC=8C

I noticed this patch was dropped; the failure report is here:
https://lore.kernel.org/all/202603251338.grra8xt7-lkp@intel.com/#R

Could this be a false positive? The series has two patches: the first
one already removed references to vmemmap_p?d_populate() on sparc; see:
https://lore.kernel.org/all/20260201063532.44807-3-pilgrimtao@gmail.com/T/#=
mefaa36aeff173d08f0508cd44be46e830c067fe9

Might the build error be because only the second patch was applied,
without the first?

On Sun, Feb 1, 2026 at 2:35=E2=80=AFPM chengkaitao <pilgrimtao@gmail.com> w=
rote:
>
> From: Chengkaitao <chengkaitao@kylinos.cn>
>
> Since the vmemmap_p?d_populate functions are unused outside the mm
> subsystem, we can remove their external declarations and convert
> them to static functions.
>
> Signed-off-by: Chengkaitao <chengkaitao@kylinos.cn>
> ---
>  include/linux/mm.h  |  7 -------
>  mm/sparse-vmemmap.c | 10 +++++-----
>  2 files changed, 5 insertions(+), 12 deletions(-)
>
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index f0d5be9dc736..10a0664b4ce2 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -4238,13 +4238,6 @@ unsigned long section_map_size(void);
>  struct page * __populate_section_memmap(unsigned long pfn,
>                 unsigned long nr_pages, int nid, struct vmem_altmap *altm=
ap,
>                 struct dev_pagemap *pgmap);
> -pgd_t *vmemmap_pgd_populate(unsigned long addr, int node);
> -p4d_t *vmemmap_p4d_populate(pgd_t *pgd, unsigned long addr, int node);
> -pud_t *vmemmap_pud_populate(p4d_t *p4d, unsigned long addr, int node);
> -pmd_t *vmemmap_pmd_populate(pud_t *pud, unsigned long addr, int node);
> -pte_t *vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
> -                           struct vmem_altmap *altmap, unsigned long ptp=
fn,
> -                           unsigned long flags);
>  void *vmemmap_alloc_block(unsigned long size, int node);
>  struct vmem_altmap;
>  void *vmemmap_alloc_block_buf(unsigned long size, int node,
> diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> index 37522d6cb398..67f9a08c2376 100644
> --- a/mm/sparse-vmemmap.c
> +++ b/mm/sparse-vmemmap.c
> @@ -151,7 +151,7 @@ void __meminit vmemmap_verify(pte_t *pte, int node,
>                         start, end - 1);
>  }
>
> -pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, i=
nt node,
> +static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long =
addr, int node,
>                                        struct vmem_altmap *altmap,
>                                        unsigned long ptpfn, unsigned long=
 flags)
>  {
> @@ -195,7 +195,7 @@ static void * __meminit vmemmap_alloc_block_zero(unsi=
gned long size, int node)
>         return p;
>  }
>
> -pmd_t * __meminit vmemmap_pmd_populate(pud_t *pud, unsigned long addr, i=
nt node)
> +static pmd_t * __meminit vmemmap_pmd_populate(pud_t *pud, unsigned long =
addr, int node)
>  {
>         pmd_t *pmd =3D pmd_offset(pud, addr);
>         if (pmd_none(*pmd)) {
> @@ -208,7 +208,7 @@ pmd_t * __meminit vmemmap_pmd_populate(pud_t *pud, un=
signed long addr, int node)
>         return pmd;
>  }
>
> -pud_t * __meminit vmemmap_pud_populate(p4d_t *p4d, unsigned long addr, i=
nt node)
> +static pud_t * __meminit vmemmap_pud_populate(p4d_t *p4d, unsigned long =
addr, int node)
>  {
>         pud_t *pud =3D pud_offset(p4d, addr);
>         if (pud_none(*pud)) {
> @@ -221,7 +221,7 @@ pud_t * __meminit vmemmap_pud_populate(p4d_t *p4d, un=
signed long addr, int node)
>         return pud;
>  }
>
> -p4d_t * __meminit vmemmap_p4d_populate(pgd_t *pgd, unsigned long addr, i=
nt node)
> +static p4d_t * __meminit vmemmap_p4d_populate(pgd_t *pgd, unsigned long =
addr, int node)
>  {
>         p4d_t *p4d =3D p4d_offset(pgd, addr);
>         if (p4d_none(*p4d)) {
> @@ -234,7 +234,7 @@ p4d_t * __meminit vmemmap_p4d_populate(pgd_t *pgd, un=
signed long addr, int node)
>         return p4d;
>  }
>
> -pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int node)
> +static pgd_t * __meminit vmemmap_pgd_populate(unsigned long addr, int no=
de)
>  {
>         pgd_t *pgd =3D pgd_offset_k(addr);
>         if (pgd_none(*pgd)) {
> --
> 2.50.1 (Apple Git-155)
>

--=20
Yours,
Chengkaitao
