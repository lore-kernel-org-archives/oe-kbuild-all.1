Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF6415B7
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 02:08:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705457305; cv=none; b=RJHBanRcKEbRrTNBRA+t1ELUBaiYdJvXCu30Jz/JTRCDrATxsR1tmK6giC0dBOZbUoPFMmwIqT0ZLGCeNemX4FTpZAszfkBJSDb9XaY8dHbWYRR3w+tI5hX2/wB/005LeZCgSV1/T9cuMpOmNtiSGz9wuzydje1pMn85CXEfEu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705457305; c=relaxed/simple;
	bh=Bm14510XYePLzpFu500ofgyv3b2dt8dJQ+40Vm5GQVA=;
	h=Received:DKIM-Signature:Received:X-Gm-Message-State:
	 X-Google-Smtp-Source:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:Message-ID:
	 Subject:To:Cc:Content-Type:Content-Transfer-Encoding; b=tH1nglp3mMuH5eukZ4CMqQaGcDX/A7ihYsjWzolP2K0Ajtp0juraVk+kTfvz/jk6HYb1QGoFXOROOl3aOHRhZRJbVAUjnbODZUYiRavJ16sGlwR2KJDXotozwXooc6HR9oAZYLdOOFIBHPBf0FpInfknivNcvBKmZLrQyIyIRV0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f988wN/g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f988wN/g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE183C433F1
	for <oe-kbuild-all@lists.linux.dev>; Wed, 17 Jan 2024 02:08:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705457304;
	bh=Bm14510XYePLzpFu500ofgyv3b2dt8dJQ+40Vm5GQVA=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=f988wN/gcPGM5IRkfpfYxH4z6zKjMV9cPC4yl2kvawWdAdpZQybsOc7T2FGdLVEYY
	 i/swwStbcnM89p1R0IIWYrAFfgqJXgGAomMvfsvQBCgTenRc0iEHPG71U+Drjj2CsT
	 xHiL0qX05MycKAgR3YUwjWWY15OSsWUHSNoqT65r4kqUK4xEZ2MZmjBZWspehsct2R
	 X0DvzX7v0Hj/l+VQDEkUEva7t38KcMXfQQTt34OJK6DAZnV0zMX+U+GiqmGw3TvsmK
	 0AB+9U5DB78IUywaPoSP6VctDCrqmrkEilBvOVjBfwE910FIHW4DMTYeEEz75Ol3Cu
	 +5FtpMyOFE90A==
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-a2cad931c50so506138966b.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jan 2024 18:08:24 -0800 (PST)
X-Gm-Message-State: AOJu0YysRcMi4tZwsjBultHtsqAr9pobOHO6SHhII22246YHEXad4VsD
	O4QA7BD3wi/TzPAFiOu3DBTBsieRdZPx1Af5PVo=
X-Google-Smtp-Source: AGHT+IHHEa1Q29hz/yiz+IRbSeevG759P2f+k7ymwiWy6GmA0z2dlrK+4T8XbLvezLvFMvM/eMBBxV6U102Y0UJF1hc=
X-Received: by 2002:a17:907:c310:b0:a2e:ac1a:974f with SMTP id
 tl16-20020a170907c31000b00a2eac1a974fmr464915ejc.12.1705457303136; Tue, 16
 Jan 2024 18:08:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202401162158.2FqwkuiP-lkp@intel.com> <CABgObfZfjD9RqHOQsZquv7g_u4TRaJyNj315Z05R=piGnFAEvg@mail.gmail.com>
 <ZabOS2uWDJ1fAhQi@google.com>
In-Reply-To: <ZabOS2uWDJ1fAhQi@google.com>
From: Huacai Chen <chenhuacai@kernel.org>
Date: Wed, 17 Jan 2024 10:08:12 +0800
X-Gmail-Original-Message-ID: <CAAhV-H6UOdm1yEXcO3MvdwbFHq19ib-QW-PjRQ-9pWDU5KFuiQ@mail.gmail.com>
Message-ID: <CAAhV-H6UOdm1yEXcO3MvdwbFHq19ib-QW-PjRQ-9pWDU5KFuiQ@mail.gmail.com>
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

Hi, Sean,

On Wed, Jan 17, 2024 at 2:43=E2=80=AFAM Sean Christopherson <seanjc@google.=
com> wrote:
>
> +KVM LoongArch maintainers
>
> On Tue, Jan 16, 2024, Paolo Bonzini wrote:
> > On Tue, Jan 16, 2024 at 2:06=E2=80=AFPM kernel test robot <lkp@intel.co=
m> wrote:
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-ne=
xt.git master
> > > head:   8d04a7e2ee3fd6aabb8096b00c64db0d735bc874
> > > commit: 8569992d64b8f750e34b7858eac5d7daaf0f80fd [697/13343] KVM: Use=
 gfn instead of hva for mmu_notifier_retry
> > > config: loongarch-allmodconfig (https://download.01.org/0day-ci/archi=
ve/20240116/202401162158.2FqwkuiP-lkp@intel.com/config)
> > > compiler: loongarch64-linux-gcc (GCC) 13.2.0
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20240116/202401162158.2FqwkuiP-lkp@intel.com/reproduce)
> >
> > This was fixed-up when merging the KVM tree, but I missed it because
> > it was not mentioned in the loongarch pull request. I'll send a fixup
> > as soon as Linus gets back online.
>
> And I suspect KVM LooongArch isn't being fed into linux-next, e.g. the tr=
ee entry
> in MAINTAINERS points at your repo.
There is already a fix patch at
https://lore.kernel.org/loongarch/20231220144024.7d9fd46b@canb.auug.org.au/=
T/#t

>
> Side topic, where can I find a toolchain that can actually build KVM Looo=
ngArch?
> Clang recognizes the arch, but barfs on a variety of things, and I can't =
find the
> right Debian packages for gcc.
Normally we use toolchain from here:
https://mirrors.edge.kernel.org/pub/tools/crosstool/

Huacai
