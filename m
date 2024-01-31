Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DBBC12C52B
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 18:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706724215; cv=none; b=KH81N9CUbG8QnsRewcKxwU6dHIg4wXDK7efC4BwGje4sm41ePYfeeTJHReETpeoqrEbDyHNRcaPuEB8z6EJl8rJlpecXrAhs0+ZfhL8iwUFvMNTkh7B2KuPrSnX1olTsltKTDvLihWvndKJJG1IYbpc+MKi5vaTiEL5QR13wnWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706724215; c=relaxed/simple;
	bh=9KvedbFYxKFVriGxDduY6ZRGv3uniYt4P+SjFXgBxKE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pcjCekhY98BIMnpWh68uXAwYCDN6snmPx6evy367bM1RxtW+jLWlRa5fezsPU+Sm5EUx8i+juZRIGBvDFtYsCR7M+pPS3zSxJ12MG7ViRXIb46h+Pb5igVS48kXFQseTqS0hndUNR2SYJ5F8sBgPIU+n38b293jlbTsfrjyLmrU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=smRr64z6; arc=none smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="smRr64z6"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-6002a655d77so314017b3.2
        for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 10:03:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706724212; x=1707329012; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JbR5C7qXmrPANeKESbR7Tb/koJLQDFXIVDj0fA4f4cU=;
        b=smRr64z6Jax0fNPJxvD4GGwQJd9JUq3OsRGX/K5kSorzCuy9oRgZBouzrdDGFc8ut+
         Rt+JFKcJbZZRS802nBo39UmtR4gyna6V3SDL0XBwjHBk7ujAKMCUeRxCIP4G8sns7jZY
         ca7ZYRoAG2flViCnzqYQzhkGKalTpTp6M+InaeU3WCMJ6hzaOwBHGpP87DLBLy0BF4VB
         lzl4zEnuRqhnXi0btBCLPDqoktrKUua/6YDov4fkk6bshBfFxh8g2s2aa3KNPJnfJpAD
         abzlBqPcJ9U/3+RUJGWmq14k5nRVL7eYcfLrC2yF7x1txF7Lu5KZ9vx2tD82BBLxwNYE
         JbiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706724212; x=1707329012;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JbR5C7qXmrPANeKESbR7Tb/koJLQDFXIVDj0fA4f4cU=;
        b=raLlcQaZwLeWOINpakkTux2s6TCZyfDrw3EO7R5XKDlPmDRAVlvvIyzTwBipongl9L
         7IcqRe2Zy4CKoBUg2uizpZxMCJVU19mYVMwuamp/CeijJFrY2h7tmJPJ0yJFnniDmwLj
         E1lV6u+lnxeApohRGUuze5Q7HnyQsNfABzXfybq/b/3OabJAB7BroqaunNiA/bn92wQs
         VyIqQsErrXiiYODNjFzkS+olzBmx+A+WH5zJdpVSHjfx9t0chuYDx90CE60v2YLBkx8Q
         YVc6SPVWXunANMJyn5emE2Fmq+WU/E56InvX1wkZR+tj0c4ckXJFLHNKKiKXL7rPaQMZ
         vY2w==
X-Gm-Message-State: AOJu0YxxP+/TTg5EEV3CdbqOSdxQ8Q702GBze/cvm5OcdQCfas6fUtfE
	dTzlA/TWFGtrGFwYWt7i9JkHUsCYSHI8EYN3pRRS06BVUgr8RzbBVqC1YOqxe4u7n9dNZwc50Qn
	RtE9NCy5CH/YdKzCTFqfHaGj20imSmAm6gJcq
X-Google-Smtp-Source: AGHT+IHvG+sScMoNbZKThgAlHEduCUX9gM07y6FFnNiqKwsYRY1SQqqF6IGpHWdV+3UMD/zGuBruw4MCk8bktvSDagM=
X-Received: by 2002:a0d:eb48:0:b0:604:1709:a5f9 with SMTP id
 u69-20020a0deb48000000b006041709a5f9mr868796ywe.18.1706724212303; Wed, 31 Jan
 2024 10:03:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <1a42e4fc-54a0-49f1-94ba-f075e0ef29a8@moroto.mountain> <CAJuCfpHyTjB+HKEZn+ddkQOCdHZJMgG4bYOfJM=NOBcGBkYeew@mail.gmail.com>
In-Reply-To: <CAJuCfpHyTjB+HKEZn+ddkQOCdHZJMgG4bYOfJM=NOBcGBkYeew@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Wed, 31 Jan 2024 10:03:21 -0800
Message-ID: <CAJuCfpEOWmrJz-50MpjzuxbVSQpCDSE+_E1LmVAzNtOOmj+o6w@mail.gmail.com>
Subject: Re: [linux-next:master 2565/2825] mm/userfaultfd.c:983
 move_zeropage_pte() warn: inconsistent returns 'dst_ptl'.
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: oe-kbuild@lists.linux.dev, lkp@intel.com, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 30, 2024 at 6:37=E2=80=AFPM Suren Baghdasaryan <surenb@google.c=
om> wrote:
>
> On Mon, Jan 29, 2024 at 9:13=E2=80=AFPM Dan Carpenter <dan.carpenter@lina=
ro.org> wrote:
> >
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   596764183be8ebb13352b281a442a1f1151c9b06
> > commit: ea4df6a5ea81105879ca5549555e231c4596fbc4 [2565/2825] userfaultf=
d: handle zeropage moves by UFFDIO_MOVE
> > config: x86_64-randconfig-161-20240129 (https://download.01.org/0day-ci=
/archive/20240130/202401300107.U8iMAkTl-lkp@intel.com/config)
> > compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> > | Closes: https://lore.kernel.org/r/202401300107.U8iMAkTl-lkp@intel.com=
/
> >
> > smatch warnings:
> > mm/userfaultfd.c:983 move_zeropage_pte() warn: inconsistent returns 'ds=
t_ptl'.
> >
> > vim +/dst_ptl +983 mm/userfaultfd.c
> >
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  962  static int move_zero=
page_pte(struct mm_struct *mm,
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  963                      =
      struct vm_area_struct *dst_vma,
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  964                      =
      struct vm_area_struct *src_vma,
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  965                      =
      unsigned long dst_addr, unsigned long src_addr,
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  966                      =
      pte_t *dst_pte, pte_t *src_pte,
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  967                      =
      pte_t orig_dst_pte, pte_t orig_src_pte,
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  968                      =
      spinlock_t *dst_ptl, spinlock_t *src_ptl)
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  969  {
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  970       pte_t zero_pte;
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  971
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  972       double_pt_lock(=
dst_ptl, src_ptl);
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  973       if (!pte_same(p=
tep_get(src_pte), orig_src_pte) ||
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  974           !pte_same(p=
tep_get(dst_pte), orig_dst_pte))
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  975               return =
-EAGAIN;
> >
> > double_pt_unlock(dst_ptl, src_ptl) before returning?
>
> Thanks for reporting and sorry for the delay!
> Yes, this is definitely a bug. I'll post a fix tomorrow morning.

Fixed version v2 is posted:
https://lore.kernel.org/all/20240131175618.2417291-1-surenb@google.com/

> Thanks,
> Suren.
>
> >
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  976
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  977       zero_pte =3D pt=
e_mkspecial(pfn_pte(my_zero_pfn(dst_addr),
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  978                      =
                  dst_vma->vm_page_prot));
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  979       ptep_clear_flus=
h(src_vma, src_addr, src_pte);
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  980       set_pte_at(mm, =
dst_addr, dst_pte, zero_pte);
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  981       double_pt_unloc=
k(dst_ptl, src_ptl);
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  982
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24 @983       return 0;
> > ea4df6a5ea8110 Suren Baghdasaryan 2024-01-24  984  }
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
> >
