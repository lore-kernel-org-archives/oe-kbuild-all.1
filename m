Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0673723D288
	for <oe-kbuild-all@lists.linux.dev>; Thu,  2 Oct 2025 22:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759443119; cv=none; b=BYdDNdZ95eUl/2ZtfKFlYtg5VoJPoeLhFSmZCsNfkOystEymxqG/NAXHBKvYShmoLte8DbhabElqex6pYDK9fAlND4UOFWT1z4d/tQnzSx4amgeUNP0EcihzTbezg9jemuLBWCmp376gdKEvonoJf3HupnjeuGrfUImakE4/f7M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759443119; c=relaxed/simple;
	bh=lraP0hz23/2MXfOmQ8ZprXbjkp5lv6pLnFTmwv/0En4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eY4V+qjXuAtk88C8xdkgeCRU0/lnqQB/3I9T32DDgQGjXYgD3JrIyTnqUxBZUecg6ZbNjCYLdSbSqGQ7OT5LrSSkS0cvNfZt4AFmq7N5idUGTDJl3ckMnHMGSIzcsErv642joS/hYWMq7Z5EgfbGv00/dEGAzrjWTLMaJQ9fDN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hIKeflyf; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hIKeflyf"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-267fa729a63so2506525ad.3
        for <oe-kbuild-all@lists.linux.dev>; Thu, 02 Oct 2025 15:11:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759443117; x=1760047917; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bu6T7CVwhfawMHtvRlEfFhPE/85D7sRoHUpa1kduIKg=;
        b=hIKeflyfvfoAZ5VYgyw6gU7eMA4y1MYVF5BgIOploTLshzbTx8jdDc46bgc4NOmcvS
         oBqCbSM9H0UZ0UEqejvtprKbUQgbDpibXepCfMbytlLChrz2W3kqh0MQ4qYnq9Tdqx94
         dQMH4APNZ1veOAYSHpIyMCS8yUz4xOL+NpRceCzuniw+IcCKPofQfLhFtfZbmQ8151Uc
         8pwtcHWK6dwLnxsqQvgYKsFXTexRWhjwDfjKRooQ85drKnFnokIncqYuwatc/Hizscii
         9wghKiG21q7ZarKw9Ow4qTJX6VjYxXutiNjPAH9eTJHnCuwkq7+0h3abPcG8PVkaphVH
         3mXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759443117; x=1760047917;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Bu6T7CVwhfawMHtvRlEfFhPE/85D7sRoHUpa1kduIKg=;
        b=M8ABI5QPyDIhXUObAODc+PDPUgcYsTzQW54Su1VUhVdLNZVGUT7fZYAfaD5eNEwwVF
         nwiIbNsSJ0+KLoTJx5c1G0P/mLdJXvrBV2YnrAVXmmHYQk1TWcxEiq9tiiMcfymUoWqc
         4addVyAQox+WQd50xKWZ1/P6CNq5nb9353V5fj6dHXLAK5fxAcA7zd8W+LiSe1O/cqWo
         QYdkGCXZhxu/L/EjPxqLXpiKQGklXCq6oLUDjFaB98wZpuKbc/PFNOyHg44y/Y4BQ/Pf
         wlanXgKTEf1jslbr/fctKEhIMKWF8LPZQuMjFTurCO8YOwmaVAx3z3GOIUaSaftk57Kt
         nAmQ==
X-Forwarded-Encrypted: i=1; AJvYcCWtK9P+MqSuhAttxnT71j/Wg2cVN0fqXL61e19XWIht4JhgCN0AaOcWTcvXoovJ+By6DwIECgU7vHAdZStn@lists.linux.dev
X-Gm-Message-State: AOJu0YzvhmNviAhSQuabTYsdekMzeIR1N/Lx4iYu4dAaiwnk9ORT2nAc
	Ck/qURW7FMKnzZA1A+LfvbzjsXEHU3F3D00Q5krnSXnaoeWWWj7+MQrMr1odAEZ71evqj1fE1j9
	pV5iL6RJ/CJxgwQnwVHTsqsaahjI6d04=
X-Gm-Gg: ASbGncs8KjINMqIldHK4aOpf7W3klxW2608DrCbYv5kBEoisXsCKmRqAJg0NNSC71Wx
	9/T7c08rmqOH1HebPKvM4Uv12hZt2KlgSnUHEpHMdmDJPuIuxVLEyK9DlSZOXp99rbWZhhHDWMI
	krafp56QjPTSZL6wtQpvdlqwF77paEYv8x6cqhYyxLWb+E855VSXBV2ZpsN/3FA/XR/+fbGExDS
	jF6uu9mXonV30sxYYwXgmGxi9hSSDCMwd822+b/Eg9HkqzK4QhVym5Dlqd4eVn4VGVAfFnFVlUM
	tRvycRV36zdzP6tV3er7T65hewLyTW1bVmgYiA7Su2bPZYPXOg==
X-Google-Smtp-Source: AGHT+IGwKnqSVieJ3MfyTgFFO/O9vpr8rro3ogT4lM4nX7G7iGhsfj8Tx0MNi0UQc58JqTsdSFoH8GBJjyKfBVPnZAY=
X-Received: by 2002:a17:902:b196:b0:266:914a:2e7a with SMTP id
 d9443c01a7336-28e9a665b6emr3287285ad.6.1759443117189; Thu, 02 Oct 2025
 15:11:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202510030449.VfSaAjvd-lkp@intel.com> <20251002141925.ab86656b1d50f6e27f216209@linux-foundation.org>
 <CANiq72kOhRdGtQe2UVYmDLdbw6VNkiMtdFzkQizsfQV0gLY1Hg@mail.gmail.com> <5467d9cc-54c3-415c-9ddd-a1ff1026f29e@nvidia.com>
In-Reply-To: <5467d9cc-54c3-415c-9ddd-a1ff1026f29e@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Oct 2025 00:11:44 +0200
X-Gm-Features: AS18NWDnPckM1PfneojmzdbCoOjMOJM9kMDMDSDk4r7YVa59EgpddvEXF-NHdJI
Message-ID: <CANiq72nE2gAuK_ym2=As3yXRDoNFbKuSa4oac7abhpjy45ZQGA@mail.gmail.com>
Subject: Re: [linux-next:master 13069/13300] error[E0425]: cannot find value
 `VM_MERGEABLE` in crate `bindings`
To: John Hubbard <jhubbard@nvidia.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	Jakub Acs <acsjakub@amazon.de>, llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, rust-for-linux@vger.kernel.org, 
	John Baublitz <john.m.baublitz@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 2, 2025 at 11:52=E2=80=AFPM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> It seems like bindgen's --clang-macro-fallback argument can avoid the
> entire class of problems, is there some reason Rust for Linux has avoided
> that option?
>
> Although, in order to make it work with fixdep, additional somewhat compl=
ex
> build system changes are required. I've got it to almost work locally jus=
t
> now... :)

I am glad you ask! ;)

We were the ones pushing for the option -- John implemented a
workaround that I suggested, with optimizations on performance:

     https://github.com/rust-lang/rust-bindgen/issues/753#issuecomment-1674=
833380
    https://github.com/rust-lang/rust-bindgen/pull/2779

I think the last time I tried it was early this year -- here is the
test patch I had:

    https://lore.kernel.org/rust-for-linux/CANiq72m20pom+B9EmWO+91E8fjbMEob=
3JmvHRQ6UaXe_JmatfA@mail.gmail.com/

It is in my backlog to go back to the option, test it again and so on.
In any case, note that we will need to increase the minimum, so it may
take some time.

Further context at:

    https://github.com/Rust-for-Linux/linux/issues/353

I hope that clarifies.

Cheers,
Miguel
