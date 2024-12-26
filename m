Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 252C4143C7E
	for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 19:54:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735242859; cv=none; b=At1WmjUSKcAUVQOPV4vxjjwaWwqtkn8nKpOjgcy+krXEHCGyCsgAj8qYyGkG5SWrtiTnyhHf1Y89dbBHIZC3wCt4wyCvT3MXAQ4oUER9HGhTLXA0QXotujXCib39CMD7EZ554xWyaw/p8Kd3b3LwU6VS5a5AqeHYmNVSNP5zmmo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735242859; c=relaxed/simple;
	bh=iP4ywNqXOCYtytn9oIkGEVpZOAa7mRk4lFufdmwyKCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DOEua+gn/v2GyymPaPKrQEdeSWPrb+3SqL5YGEMHLB0Cn+5PEJiPz0o/oxE8PvZKQL2F27qufzLAijAZXBmGaxeLN9Sa3PMJo3kL+nf4OyV6pIKbyxMLje8Mq3/1bOjnRJRJHlbWSjmAHKIhknNReiJM2UcElydrfaA0+j/zj3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=jNxdr8dO; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="jNxdr8dO"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4679b5c66d0so1629201cf.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 26 Dec 2024 11:54:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1735242857; x=1735847657; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KkiYOSK+SB4neVILkmorb+PxqtegAF2YSxLIiY3S8k8=;
        b=jNxdr8dObCNX5GpwHSTIBaU23PX1UjilYB7Sop6rp+H7qtwqDLVCPeIkxooGOurT4z
         YSw0yUUuz1iKUXwAvJM5F3+2QGzuE9+rjgtzBuSOJNG1yEOLJ1rg9gSz6is/Hpaikcpi
         PwnbJlNnhU49K7LJPS/dC4mnSjSxaQPQm+YRbWoUYQ2Y+Jgtx/rNOTzxzfSEW7SZcPFf
         EDCAtV4JNN/qMcEmH3ffFYGZVuqGb9WYfIfKpTW1bcjMWlWVdDjh9dsBcqjTg9mDkozl
         +mDOyZ9PgYFbrvM30HcCk1smljHN3hWjO8MIMJJqsuViApIGfW4zRwFd3oGVlrDAZEP5
         +saQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735242857; x=1735847657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=KkiYOSK+SB4neVILkmorb+PxqtegAF2YSxLIiY3S8k8=;
        b=SXoLffq06gneiCmBjnFl6hflkGHjpoRRu3B3yVSMT4QQXq9ZDcYstCk3IY0YJfuxXz
         lnyVqzNa5PIbLEdJRoF4sHCt4TjPGGmStVU959YAWkugxptmUzP/3DSywlAGgO8Dk7Kn
         EPHRBYEcGytCsInM8hCiqnOJkdrwp5zMtZ+k1EBZlGYj3OPY8EuM72XlL0pD7EQm9T5/
         UDDBZHoKm38r1yRio7ddLxqg+U8coUGB+jYYY2AqrYvpjdSZgMHOmIt/ZVJZd25CH1pU
         eoXGTbhvxTYZDDegEUrNUnzAwTK9bnYZJpZdvOEICRXQ1XpuLGLoXu94ILZ0D9M3czRo
         qCcw==
X-Forwarded-Encrypted: i=1; AJvYcCUmZEiRnFn7UScW54umxHW0qFpwXHlUMoxy06hLZfBcfA/Xce1Lx6diVQTGgg7Xa0MK69y8Eq+fM3hCJmgM@lists.linux.dev
X-Gm-Message-State: AOJu0YyYUCb+mOrmO7bN7se/UoPBfOy53vDlMHxYntHBzMv9q9YFJ3Yo
	H4aUcd6+QY3ZjYRv0LSYPUG5Fj3RWnwOukkRZ7gk8LPnqCfVLGWIeHnNEEgJAcWWOKUQ6nFfSwC
	7n8ojsif7BO+cWWDkKsID3LhYHHyrxnRNWVKY
X-Gm-Gg: ASbGncvcTG3qqjHeVIPbq1/BtVAYBk7/dmSncmmPj6z2zcBqf9plNxA5BlbzPw24u8L
	+sagu2yUYCeTBPLGy7XCCBnvh8YeXcIF6GKnuFg==
X-Google-Smtp-Source: AGHT+IHD3Gh6L++7Zw6AHuHUEo93uirW+9v6XYfd5UD2jeNW/Sl70a+7AD5WUVLBgPY3+4R+NbyTETj/mpTbJIZaKjU=
X-Received: by 2002:a05:622a:120f:b0:465:18f3:79c8 with SMTP id
 d75a77b69052e-46a4c00f1e8mr18589851cf.13.1735242856805; Thu, 26 Dec 2024
 11:54:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20241226170710.1159679-14-surenb@google.com> <202412270328.HiJX1mRt-lkp@intel.com>
 <CAJuCfpHb23mRT6bS8LNd79Zm0XU9eq9hB671G21UnkU992j82Q@mail.gmail.com>
In-Reply-To: <CAJuCfpHb23mRT6bS8LNd79Zm0XU9eq9hB671G21UnkU992j82Q@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Thu, 26 Dec 2024 11:54:05 -0800
Message-ID: <CAJuCfpFc8+q96axtTLEP0=-nwF-9Wunim9O6A6HXN9t-ztJQuw@mail.gmail.com>
Subject: Re: [PATCH v7 13/17] mm/debug: print vm_refcnt state when dumping the vma
To: kernel test robot <lkp@intel.com>
Cc: akpm@linux-foundation.org, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, peterz@infradead.org, willy@infradead.org, 
	liam.howlett@oracle.com, lorenzo.stoakes@oracle.com, mhocko@suse.com, 
	vbabka@suse.cz, hannes@cmpxchg.org, mjguzik@gmail.com, oliver.sang@intel.com, 
	mgorman@techsingularity.net, david@redhat.com, peterx@redhat.com, 
	oleg@redhat.com, dave@stgolabs.net, paulmck@kernel.org, brauner@kernel.org, 
	dhowells@redhat.com, hdanton@sina.com, hughd@google.com, 
	lokeshgidra@google.com, minchan@google.com, jannh@google.com, 
	shakeel.butt@linux.dev, souravpanda@google.com, pasha.tatashin@soleen.com, 
	klarasmodin@gmail.com, corbet@lwn.net, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Dec 26, 2024 at 11:51=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
>
> On Thu, Dec 26, 2024 at 11:41=E2=80=AFAM kernel test robot <lkp@intel.com=
> wrote:
> >
> > Hi Suren,
> >
> > kernel test robot noticed the following build errors:
> >
> > [auto build test ERROR on 431614f1580a03c1a653340c55ea76bd12a9403f]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Suren-Baghdasary=
an/mm-introduce-vma_start_read_locked-_nested-helpers/20241227-010925
> > base:   431614f1580a03c1a653340c55ea76bd12a9403f
> > patch link:    https://lore.kernel.org/r/20241226170710.1159679-14-sure=
nb%40google.com
> > patch subject: [PATCH v7 13/17] mm/debug: print vm_refcnt state when du=
mping the vma
> > config: hexagon-randconfig-002-20241227 (https://download.01.org/0day-c=
i/archive/20241227/202412270328.HiJX1mRt-lkp@intel.com/config)
> > compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 60=
09708b4367171ccdbf4b5905cb6a803753fe18)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20241227/202412270328.HiJX1mRt-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202412270328.HiJX1mRt-l=
kp@intel.com/
> >
> > All errors (new ones prefixed by >>):
> >
> > >> mm/debug.c:189:54: error: no member named 'vm_refcnt' in 'struct vm_=
area_struct'
>
> Ugh, ok. On architectures with ARCH_SUPPORTS_PER_VMA_LOCK=3Dn this will
> happen. Preparing a fix.

This error actually also requires CONFIG_DEBUG_VM=3Dy.

>
> >      189 |                 vma->vm_flags, &vma->vm_flags, refcount_read=
(&vma->vm_refcnt));
> >          |                                                             =
  ~~~  ^
> >    include/linux/printk.h:514:35: note: expanded from macro 'pr_emerg'
> >      514 |         printk(KERN_EMERG pr_fmt(fmt), ##__VA_ARGS__)
> >          |                                          ^~~~~~~~~~~
> >    include/linux/printk.h:501:60: note: expanded from macro 'printk'
> >      501 | #define printk(fmt, ...) printk_index_wrap(_printk, fmt, ##_=
_VA_ARGS__)
> >          |                                                            ^=
~~~~~~~~~~
> >    include/linux/printk.h:473:19: note: expanded from macro 'printk_ind=
ex_wrap'
> >      473 |                 _p_func(_fmt, ##__VA_ARGS__);               =
            \
> >          |                                 ^~~~~~~~~~~
> >    1 error generated.
> >
> >
> > vim +189 mm/debug.c
> >
> >    178
> >    179  void dump_vma(const struct vm_area_struct *vma)
> >    180  {
> >    181          pr_emerg("vma %px start %px end %px mm %px\n"
> >    182                  "prot %lx anon_vma %px vm_ops %px\n"
> >    183                  "pgoff %lx file %px private_data %px\n"
> >    184                  "flags: %#lx(%pGv) refcnt %x\n",
> >    185                  vma, (void *)vma->vm_start, (void *)vma->vm_end=
, vma->vm_mm,
> >    186                  (unsigned long)pgprot_val(vma->vm_page_prot),
> >    187                  vma->anon_vma, vma->vm_ops, vma->vm_pgoff,
> >    188                  vma->vm_file, vma->vm_private_data,
> >  > 189                  vma->vm_flags, &vma->vm_flags, refcount_read(&v=
ma->vm_refcnt));
> >    190  }
> >    191  EXPORT_SYMBOL(dump_vma);
> >    192
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
