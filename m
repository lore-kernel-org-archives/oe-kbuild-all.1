Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68FAD196446
	for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 10:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721902073; cv=none; b=f6hYZn/vKQ7ZABSXd4U068UxZpPVRQC+/WiLOmwE/E/FCrdrKGSt+KHjGGBeM46JOHr8fcFKTdRFAvP3gmdTYtMaajsFQqtkf+PCk/uotpFvtsqx1NHfT0MKnRf8HsuX9kHhqV1h23ONVBfgiYC8etRxTj7/eC/4N+IGRsqoCt4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721902073; c=relaxed/simple;
	bh=NZZtN0VCcYttTqcOC4cpJJ/bAsc+jb9SL5tobmej0LU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qUwbuZPrIZy630+Eie2GjxLbLzKNo+3RI3LsKx6DuD4EbfVl3Q647StjzJ+n5bi0tXEsPaBWwbRx8LroDUmH/svKXZTzGOxj4v0t8tC4mg2YkTIVfz2+UhcDS3e+9LFFEJSOQK4YC2KmjlyEEdw3AyuwhpmzgGbXPXxokteVyAs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eJI6fdIK; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eJI6fdIK"
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-52efc60a6e6so964013e87.1
        for <oe-kbuild-all@lists.linux.dev>; Thu, 25 Jul 2024 03:07:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721902070; x=1722506870; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hD42VmJRlxXsGWTnYAPzNLw6t8bjEMubS59XLOw/47w=;
        b=eJI6fdIKze7j8TPqIxn4z04Taxq3N1OwzXKcHwWxLnV44fAG4O6UAUwn8Jh2RKsbZh
         cP/q8YiCb7sRU1g+a1YOuttD0mfOEFBTP1y36vv4THyXyetQ+CVpkNEp1kPxnC9hcW4c
         xs4LxXIYzbW6M4VoQRHmCfifHJy2XGmtxSRFZKbj07GK/r7C0L3d2P7tr5O+C0iegzOe
         NAcUkl5+FkYC8aVkk4kAGmcIa1OH+6hvbC/HZZZ7aUd55QgrGXKCDAqEaM8jnga6sxCM
         c7DLlzhGYbaXGnffosP0TMvbPMzKYV5HHnhGZZof7WsxBcQdRWzjv/z9lg9k9nuNg5hw
         OJzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721902070; x=1722506870;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hD42VmJRlxXsGWTnYAPzNLw6t8bjEMubS59XLOw/47w=;
        b=ItDFJ+u9K6u2H1evUI+f4wH/6ZTwG0/hQHFadpocZsVHBttg5WqkNMWqvHVRf91V/Y
         BtkQy+5Ac4WckfLGeN722NoLt0Ojh6aC6OQkfhmXRFHt/EFjDL7oeLQ8cx1ezKwGpaHx
         1hwky6tqxSNjydZWYy/lynKLlwpiiIcFPPwmBlJ9UmCV5ikO9Y9Pq6Tax15yGoxH/U1E
         BJbZKLg1LwZZqinVg4mIZfVTddvo9Y/G6U6KEIJVDNZMocbiTUMSHT4Ry/avSzicfDWW
         xZ823VwwJoclAKdsa/7i50Hbgh+u3KnYHnbrb4mAPhGRslWuZpd+oPlL1FkwzJFk4zhe
         AGmg==
X-Forwarded-Encrypted: i=1; AJvYcCWiRFVg9HrpYkn8EDnLMqcQgis+mJAFDjTILd6niwJ9NuYZkhsaOi24kTj5LD6tOKgL6AjD34zFYQrahNHx7QzjH1yLwSuaOCtyErBhAQ==
X-Gm-Message-State: AOJu0YwUEHWlNkeKPstfTntNEV3OkyORJgnXvv19qWHKGBO9n/srxuwO
	jKUR9bAT4UNQ1t98C/YJYR2XZ3ThLja94M/DMm+1QsYVptK3mCRs1QB9o1c93IxAqSCB5HtBOAt
	ia0pxTqjDF/l0frNR1Y3DZIZobUs=
X-Google-Smtp-Source: AGHT+IF4IFL3+gcH+1199eJGE05ikuNcJwCnDJTe11RZIgz0eMjtD/WVR0wukU/wKD9o3kdpX5aJ0JR2FJvm0WDgo3g=
X-Received: by 2002:a05:6512:3dac:b0:52c:df6f:a66 with SMTP id
 2adb3069b0e04-52fd6092895mr1147948e87.58.1721902069431; Thu, 25 Jul 2024
 03:07:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20240711-loongson1-dma-v9-2-5ce8b5e85a56@gmail.com>
 <202407140536.iIizeGVy-lkp@intel.com> <ZqHpWKLhRUi0N5Ps@matsya>
In-Reply-To: <ZqHpWKLhRUi0N5Ps@matsya>
From: Keguang Zhang <keguang.zhang@gmail.com>
Date: Thu, 25 Jul 2024 18:07:13 +0800
Message-ID: <CAJhJPsWi4Fs3o-XmDStMtAjxcdbobWXBy2ZopgdHftf_JMA19w@mail.gmail.com>
Subject: Re: [PATCH RESEND v9 2/2] dmaengine: Loongson1: Add Loongson-1 APB
 DMA driver
To: Vinod Koul <vkoul@kernel.org>
Cc: Keguang Zhang via B4 Relay <devnull+keguang.zhang.gmail.com@kernel.org>, 
	kernel test robot <lkp@intel.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, oe-kbuild-all@lists.linux.dev, 
	linux-mips@vger.kernel.org, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Jiaxun Yang <jiaxun.yang@flygoat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 25, 2024 at 1:57=E2=80=AFPM Vinod Koul <vkoul@kernel.org> wrote=
:
>
> On 14-07-24, 05:11, kernel test robot wrote:
> > Hi Keguang,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on d35b2284e966c0bef3e2182a5c5ea02177dd32e4]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Keguang-Zhang-vi=
a-B4-Relay/dt-bindings-dma-Add-Loongson-1-APB-DMA/20240711-191657
> > base:   d35b2284e966c0bef3e2182a5c5ea02177dd32e4
> > patch link:    https://lore.kernel.org/r/20240711-loongson1-dma-v9-2-5c=
e8b5e85a56%40gmail.com
> > patch subject: [PATCH RESEND v9 2/2] dmaengine: Loongson1: Add Loongson=
-1 APB DMA driver
> > config: i386-allmodconfig (https://download.01.org/0day-ci/archive/2024=
0714/202407140536.iIizeGVy-lkp@intel.com/config)
> > compiler: gcc-13 (Ubuntu 13.2.0-4ubuntu3) 13.2.0
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20240714/202407140536.iIizeGVy-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202407140536.iIizeGVy-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> >    In file included from include/linux/printk.h:598,
> >                     from include/asm-generic/bug.h:22,
> >                     from arch/x86/include/asm/bug.h:87,
> >                     from include/linux/bug.h:5,
> >                     from include/linux/fortify-string.h:6,
> >                     from include/linux/string.h:374,
> >                     from include/linux/scatterlist.h:5,
> >                     from include/linux/dmapool.h:14,
> >                     from drivers/dma/loongson1-apb-dma.c:8:
> >    drivers/dma/loongson1-apb-dma.c: In function 'ls1x_dma_start':
> > >> drivers/dma/loongson1-apb-dma.c:137:34: warning: format '%x' expects=
 argument of type 'unsigned int', but argument 5 has type 'dma_addr_t' {aka=
 'long long unsigned int'} [-Wformat=3D]
> >      137 |         dev_dbg(chan2dev(dchan), "cookie=3D%d, starting hwde=
sc=3D%x\n",
>
> You should not use %x for dma_addr_t, please see documentation
>
Will fix this in next version.
Thanks!

> --
> ~Vinod



--=20
Best regards,

Keguang Zhang
