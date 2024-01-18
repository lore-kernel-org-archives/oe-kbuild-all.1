Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3D32125A6
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 09:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705568651; cv=none; b=U6oB70RpJVRWxTHfi/kj8pBWBr3YwKvaKIBADLYSjNxgLEa5RTNml87bcSE9mJ4bToByM0pVGTv0BYOi2vNPwscvYqEA4DDPQvYeBT3LnvpLyYeUr72gd/jKLqryKXHOoj+4/ulMnwuNeYtdzinnWpqKNB7VhOznrSqZFV2NQBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705568651; c=relaxed/simple;
	bh=4DjnG5jzD2NozgBVxo3sEg89nTgo8GqY8Y50icPgxKw=;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:
	 X-Google-Smtp-Source:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding; b=I/3XPO+vulNuHU4j6G6be9wt212quEPUyV8qvGlcMJ2xFz6O9zEjH3+PkREXAMvdcuLAyyvOay4ZRzpIRI0qkbxpyz4vOPNCeYa7f5rmUlkxA7TvVzhN7REnk2AqnmlRiNpbPAwZePmGWYju+u///Y1hilQhaimrdsYghUJZ3qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QoJjibI8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QoJjibI8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F08CDC433C7
	for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 09:04:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705568651;
	bh=4DjnG5jzD2NozgBVxo3sEg89nTgo8GqY8Y50icPgxKw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=QoJjibI8/kEJQAAex60nrSQYgKnoEI895mptaHK4hRdpGjtzaw5vm/61ycBisLYX3
	 i4/kh5ur2mqpXOyUwU1Tl9VX5dlonHFTg1ZcQrW4q3EuLPuD2NbWQLxOa7OHMm2aOJ
	 guSHpHj1BxVjgklQdN7KZZ1ssPPsmFehFa6QkA8PKsMQJvcI1AfZCdXTOC0U6AQHu8
	 AEQj77gQzIgYB3gmUb30juqCFyorKLY1G4D2bR7UO5XokYTEd7f0SUOkV5nIRlW07e
	 V6210gxYALiNx1D4achuEavnbt/kSvzoLj+Gk9dBxSAOqL6QMa5iCJn5R3j3pw5eUx
	 ZdDl+I241FLLw==
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-50e7b273352so13437854e87.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 18 Jan 2024 01:04:10 -0800 (PST)
X-Gm-Message-State: AOJu0YzDJn/PRWI3/Dewaipr90i1Bl4swr6u67aWAR3o1nPqQdXN3ijZ
	KoVN6fkp+Ey1QFtQdzZaDp7gUDYlflDmH3kRzgkYOU4iuMoUBGdxQ6tkKEA7qglxE7BmeWe2Be7
	g2s9AtufHugHkSNBfy6a9KlHt/hk=
X-Google-Smtp-Source: AGHT+IH6wcBhoC+YMOO0KdyTPDPd5MtfcqqfD6ZhyGkBnR2HGKI/sIEKMi1pc87gMIuaT8itxHbFO7XwWi6nygFqoz4=
X-Received: by 2002:a05:6512:3ca0:b0:50e:b1fe:8ee4 with SMTP id
 h32-20020a0565123ca000b0050eb1fe8ee4mr325687lfv.111.1705568649219; Thu, 18
 Jan 2024 01:04:09 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401162158.2FqwkuiP-lkp@intel.com> <CABgObfZfjD9RqHOQsZquv7g_u4TRaJyNj315Z05R=piGnFAEvg@mail.gmail.com>
 <ZabOS2uWDJ1fAhQi@google.com> <CAAhV-H6UOdm1yEXcO3MvdwbFHq19ib-QW-PjRQ-9pWDU5KFuiQ@mail.gmail.com>
In-Reply-To: <CAAhV-H6UOdm1yEXcO3MvdwbFHq19ib-QW-PjRQ-9pWDU5KFuiQ@mail.gmail.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Thu, 18 Jan 2024 17:03:58 +0800
X-Gmail-Original-Message-ID: <CAAhV-H4hQ6pbim7czzXCeQ-q6t2uf7GgR9J6q5asqmkuoUx2GA@mail.gmail.com>
Message-ID: <CAAhV-H4hQ6pbim7czzXCeQ-q6t2uf7GgR9J6q5asqmkuoUx2GA@mail.gmail.com>
Subject: Re: [linux-next:master 697/13343] arch/loongarch/kvm/mmu.c:810:13:
 error: implicit declaration of function 'mmu_invalidate_retry_hva'; did you
 mean 'mmu_invalidate_retry_gfn'?
To: Sean Christopherson <seanjc@google.com>
Cc: Paolo Bonzini <pbonzini@redhat.com>, kernel test robot <lkp@intel.com>, 
	Chao Peng <chao.p.peng@linux.intel.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Fuad Tabba <tabba@google.com>, 
	Xu Yilun <yilun.xu@linux.intel.com>, Kai Huang <kai.huang@intel.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, Paolo,

If you take this patch,
https://lore.kernel.org/loongarch/20231220144024.7d9fd46b@canb.auug.org.au/=
T/#t
Please also take this one,
https://lore.kernel.org/loongarch/20231227012240.6545-1-rdunlap@infradead.o=
rg/T/#u

Thanks.

Huacai

On Wed, Jan 17, 2024 at 10:08=E2=80=AFAM Huacai Chen <chenhuacai@kernel.org=
> wrote:
>
> Hi, Sean,
>
> On Wed, Jan 17, 2024 at 2:43=E2=80=AFAM Sean Christopherson <seanjc@googl=
e.com> wrote:
> >
> > +KVM LoongArch maintainers
> >
> > On Tue, Jan 16, 2024, Paolo Bonzini wrote:
> > > On Tue, Jan 16, 2024 at 2:06=E2=80=AFPM kernel test robot <lkp@intel.=
com> wrote:
> > > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-=
next.git master
> > > > head:   8d04a7e2ee3fd6aabb8096b00c64db0d735bc874
> > > > commit: 8569992d64b8f750e34b7858eac5d7daaf0f80fd [697/13343] KVM: U=
se gfn instead of hva for mmu_notifier_retry
> > > > config: loongarch-allmodconfig (https://download.01.org/0day-ci/arc=
hive/20240116/202401162158.2FqwkuiP-lkp@intel.com/config)
> > > > compiler: loongarch64-linux-gcc (GCC) 13.2.0
> > > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci=
/archive/20240116/202401162158.2FqwkuiP-lkp@intel.com/reproduce)
> > >
> > > This was fixed-up when merging the KVM tree, but I missed it because
> > > it was not mentioned in the loongarch pull request. I'll send a fixup
> > > as soon as Linus gets back online.
> >
> > And I suspect KVM LooongArch isn't being fed into linux-next, e.g. the =
tree entry
> > in MAINTAINERS points at your repo.
> There is already a fix patch at
> https://lore.kernel.org/loongarch/20231220144024.7d9fd46b@canb.auug.org.a=
u/T/#t
>
> >
> > Side topic, where can I find a toolchain that can actually build KVM Lo=
oongArch?
> > Clang recognizes the arch, but barfs on a variety of things, and I can'=
t find the
> > right Debian packages for gcc.
> Normally we use toolchain from here:
> https://mirrors.edge.kernel.org/pub/tools/crosstool/
>
> Huacai
