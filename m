Received: from mail-pl1-f202.google.com (mail-pl1-f202.google.com [209.85.214.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0177F1CF81
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jan 2024 18:43:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705430607; cv=none; b=DceGn8hJUn3IAQCGjSC3g8ObgUeRp7IRMogIBs7wHpeJ+kRVb3taW95KeBfeWpkInIvEhxpTGBq0TB2VN/VbVELE1gYFNcz0RdBwM9L0CTYyrIhso52A1odtTe/DKsbOuIrc3gfdvpwvSrq/HQlDH3THZZ0IH/LLtB8/k/NEBGo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705430607; c=relaxed/simple;
	bh=pEtZ/PQY4sAHgy10G42wlxTyPdXdm1MryNzot9hL0Ps=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:Date:
	 In-Reply-To:Mime-Version:References:Message-ID:Subject:From:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=Bvxc75syLXMN2sO+MjJihzdbP+RlCx0rOvSf/+46b4Nlfyp/egG9nd5JvJgnqCnmbQfKM6FWBeHPubdBWvgRtIsdb22WUGcR9IXxPyK8PpvZKw5k+Yn8UKYjjy4OD0YATgnmHNOw+f+gnubZFlIoCQondxgkWgurL4E1U5BAxO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rbb7kjN+; arc=none smtp.client-ip=209.85.214.202
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rbb7kjN+"
Received: by mail-pl1-f202.google.com with SMTP id d9443c01a7336-1d4d947ff1bso86017955ad.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Jan 2024 10:43:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1705430605; x=1706035405; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=u9TOTOYKiYXtR8fzChRZElUOVeadOh16NAbSU+XGjNg=;
        b=rbb7kjN+DaqJRo2OYbntHlcu/H6tqUR6JO6HxaG4wy7HWUiGM5oe9kiostqmshZI+b
         Ndo5vcBnpaLbkQ1M/TVrn9HOtrst9yJbjFVpOQgirlwufePQ+YMGQd30q6kMe7NYvlSH
         VknK3KgPTa5GsfhEGYG1VktAM0reZuCqv3xXsctuLy7f+y6wTpoiLuBn2kYXaBR8NwzT
         MmnGc83vxm/qO6u06nPvLFIPjFJuQEbTGlHCA3TZI3wU9ZFlVDnVU4hCnnYejtCcaTsO
         t1KFDpOTXnuUwPSXUd5p1P26AQbbOVmBu5dDbDIE3jhx6wAOcxpTskZcdq7pbgdDOmia
         8T7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705430605; x=1706035405;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=u9TOTOYKiYXtR8fzChRZElUOVeadOh16NAbSU+XGjNg=;
        b=OH72ctnNvxxTebwJOm4MMU5Y4EnWUZADJLh9QDtVfm6c8CUDnupAgTQC1weSWZOZ1R
         8cz+MNdh4V5Lg8jFt9IQVcLAW/GbyWt2bG7B4auPxaGlxNBfmsVcp4zqLm/2G7xpfJvF
         M1bdx1thYPdMAyb6hvPfYNXgodc/Q1CRalJWozsg9GUYEa3XSNp9B/3pqbeLeHuej53F
         I3vTenPl6AW47oGW3eiyvLiyC1D0/kdRZzwWh8H9jXId9zB1NCON7fk56FZ+2f0kUif5
         7wc9+bUarumqrGn+QXW2Ng8jz2A47xnHeeImXoQThqW6r3rY9W9VfCHL1fLV4WH5PVwk
         JxaA==
X-Gm-Message-State: AOJu0Yy1GTv6W4AwjP1Vh8vDcEPDwQ80eGmIXr2ysrULmuBc2TafWvXJ
	FCLhtNIrtycrd9PvvDTo+XR8vwv5BHjRF8aFvw==
X-Google-Smtp-Source: AGHT+IF1tJYaFGbxuwSQetApImgdes0brXERAz9LOY0tND9++HRAxi0e3vv4kZB0F2dVbVaRikCO0C2ShGk=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a17:902:dac2:b0:1d5:693a:8906 with SMTP id
 q2-20020a170902dac200b001d5693a8906mr508496plx.3.1705430605309; Tue, 16 Jan
 2024 10:43:25 -0800 (PST)
Date: Tue, 16 Jan 2024 10:43:23 -0800
In-Reply-To: <CABgObfZfjD9RqHOQsZquv7g_u4TRaJyNj315Z05R=piGnFAEvg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202401162158.2FqwkuiP-lkp@intel.com> <CABgObfZfjD9RqHOQsZquv7g_u4TRaJyNj315Z05R=piGnFAEvg@mail.gmail.com>
Message-ID: <ZabOS2uWDJ1fAhQi@google.com>
Subject: Re: [linux-next:master 697/13343] arch/loongarch/kvm/mmu.c:810:13:
 error: implicit declaration of function 'mmu_invalidate_retry_hva'; did you
 mean 'mmu_invalidate_retry_gfn'?
From: Sean Christopherson <seanjc@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: kernel test robot <lkp@intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Fuad Tabba <tabba@google.com>, 
	Xu Yilun <yilun.xu@linux.intel.com>, Kai Huang <kai.huang@intel.com>, 
	Tianrui Zhao <zhaotianrui@loongson.cn>, Bibo Mao <maobibo@loongson.cn>, 
	Huacai Chen <chenhuacai@kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

+KVM LoongArch maintainers

On Tue, Jan 16, 2024, Paolo Bonzini wrote:
> On Tue, Jan 16, 2024 at 2:06=E2=80=AFPM kernel test robot <lkp@intel.com>=
 wrote:
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next=
.git master
> > head:   8d04a7e2ee3fd6aabb8096b00c64db0d735bc874
> > commit: 8569992d64b8f750e34b7858eac5d7daaf0f80fd [697/13343] KVM: Use g=
fn instead of hva for mmu_notifier_retry
> > config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive=
/20240116/202401162158.2FqwkuiP-lkp@intel.com/config)
> > compiler: loongarch64-linux-gcc (GCC) 13.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240116/202401162158.2FqwkuiP-lkp@intel.com/reproduce)
>=20
> This was fixed-up when merging the KVM tree, but I missed it because
> it was not mentioned in the loongarch pull request. I'll send a fixup
> as soon as Linus gets back online.

And I suspect KVM LooongArch isn't being fed into linux-next, e.g. the tree=
 entry
in MAINTAINERS points at your repo.

Side topic, where can I find a toolchain that can actually build KVM Looong=
Arch?
Clang recognizes the arch, but barfs on a variety of things, and I can't fi=
nd the
right Debian packages for gcc.
