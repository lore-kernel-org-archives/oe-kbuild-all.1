Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7753778F4A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 15:30:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763739014; cv=none; b=o7zjg0BENUA4hykzZJCKQEmuTJX3dCRh/FHGQ4re6QG5mWEspemSHHpXTA4LAyco1NGIl3dEN6Qfhgi5lJU5d072zGLMZdwwEttCVCD+jDmSMcS2lVQR9w3y41KXB6ftdemYcyHVfHDf6oEAkaebGPX9hbBZNVzklX3Q+zTfqmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763739014; c=relaxed/simple;
	bh=+7JaZ904HEfoToTNqFXnfKLDp6L6QuFWgSLqJgbr5TQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hzNVpidto6/7Bvp1qE3I8e/rE6z9PgWmJvMK7zVh6goWREl9XOzT+xTjDyOadXf7w+JCkreokjVUIhpZwMwBJt4dUyEqVUQbPRuGBfHEZtz/YhK6LKBjdv6vbsoXp1c0Vr5ei+aPn0ilq1B49O6uR+2twPiPFeMsFqu/JIARN30=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YqoMjkJc; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YqoMjkJc"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-bceaaed0514so125625a12.3
        for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 07:30:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763739013; x=1764343813; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u2mvpQ6p+JPlOzBY+YV20bR1O2Kxu26V2VO57Tqxgmw=;
        b=YqoMjkJcQmOpixTis7YMtlbAnXVE9ONzJiVPJIaBljg88IpaDZnQRd2mUR4/2iz8wD
         e2JsOuSeEa/0anccj/aixx3ANF6BswjX+oEd0mBzeHInmZnxbgZxEbc21IO/d7paOiHV
         I9bbYgm9/92pA2qkMGBB6K7k2xjY2gCTYB507oitFV/pbx9QgHDzchI9alJ47b3t5cRS
         faN2pnZPH4qPWz4fX0kg+l/jtf+o6vk0Kv6jUC7/E3LAQKnMpv81KEXVor3d1PhGlxFp
         /n5ALPsVYx/U5f7qmOZu44SBR1xPTdyB4mUPiAscNcpVUmXh8momHvDGZ0421nzQVsPK
         K1vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763739013; x=1764343813;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u2mvpQ6p+JPlOzBY+YV20bR1O2Kxu26V2VO57Tqxgmw=;
        b=Sd/ii4e2sXrQn+DI+y36Ke7jsO/jlcAc3Q3+5eijhd0LNnvF7gB138wPfh4c4PL79C
         /qyYUi++xK+FXpnLMRJgTFHHpjYQ/XdHKvUbMV5Zn6G9RHgEOTqW5xm6zoW+wZGXlfNq
         vl40qnVm5lbasMpRqasxQqW01KOvn94s3fJLVelXQeSAkupLyuxEWAvkgcyaZBVMmkSg
         JLtBG2YoopJ46ydWOr+XzhKqaWfV+zMqq9s+7OB7kbCJrc8nnYN0MzvVvIjbLh6UzfSd
         CDa1RdPhbYalW7jr6i38vwoeTL/THtwRGmthGBLO19lYeQpQX+3dPOACcv6deqFIIrqN
         +wKA==
X-Forwarded-Encrypted: i=1; AJvYcCU/lPHB+8CmMjKcYZrNmu1G8nofaq02iNky1u9VWh93f3hWXUJmlC2Bh24MOeI1cWdEXtg4HAEpbQSS876P@lists.linux.dev
X-Gm-Message-State: AOJu0Yyy6op2l1TAHnhOhP8TmSPCf/JVk2Izwbo1qqJduKdBJXkGPgee
	NtFg69FJiidrPdjllqWPk6LDINQY9Hbz/pN8PUUAXKV7Sq4Ggj3g8F4wKvpEqMlAadJuqdLcTaW
	QCW6X24JM7EhpOHWSnR4fyHKSpPgx934=
X-Gm-Gg: ASbGncvndcqDy7Pup2VsmrSrVeZNbkvS9c6Z0HL3PnjDpYsrLDJPG5BK5OlL4a1lNPp
	MmNPcPv2AitKFw9TGjSnD4GRESI4QqM7bVa8yYTzKHW9g+ZcsWgyJWvHDsPSjdsxAelKW1gWlee
	OV9pzklkXSgSeBuYZf3JUavnyRTx5bGi8LJx12JVNb2p/W9kr9vQq/o7Kva1dLcFEXD6EJ1v69W
	gKSZ/v3idElW4zlNSUZ/8fT2FpgtFopL0sEJaVDsBsu1Ae+bt0dxkA9rfn5nkj2a5Mmcf2osJvl
	XSFQQJ2Am3Rvik4EY71Be5Ha6C+Vt7XYVsv6EetKzT+Qi5bbBgUNvvsNau0qydSzqdtgg46slTQ
	wQTLK28JnU2U38w==
X-Google-Smtp-Source: AGHT+IEJNAec/VNO4xmyIScwh5VSum2fjqj0VWiV0z8Z2rPyySBfGlVQDrqDGlOu5guG9erl3rYIIaqy5jHoUUeIwG8=
X-Received: by 2002:a05:7022:441c:b0:119:e56b:c3f5 with SMTP id
 a92af1059eb24-11c9f38e94fmr464472c88.5.1763739012499; Fri, 21 Nov 2025
 07:30:12 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511210055.RUsFNku1-lkp@intel.com> <DEE5GDTBSJ5O.KGQ3AG72NF30@nvidia.com>
 <aSAr-aA2U26lr3iI@google.com> <DEEEZRYSYSS0.28PPK371D100F@nvidia.com>
 <aSBy3HQ9Z-h2LbB8@google.com> <CANiq72=P8AS_XeMdkakuGeTQ5SGb4wvH8qyVoY32FR+PLQu+zQ@mail.gmail.com>
 <20251121143008.2f5acc33.gary@garyguo.net> <DEEH8WPYR4KA.1WUYP0D5F9TYA@nvidia.com>
In-Reply-To: <DEEH8WPYR4KA.1WUYP0D5F9TYA@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Nov 2025 16:30:00 +0100
X-Gm-Features: AWmQ_bmPKo7Yv7lG7AzLgke0QOCQSypk_ziJ4woRpErZhoidpeodemRVc_AkWUE
Message-ID: <CANiq72kqX8Ua7NFHUwLBW1Gpb-Ewh2wHnWmXH6SUQBUyrrSdbg@mail.gmail.com>
Subject: Re: [linux-next:master 9676/10599] ld.lld: error: undefined symbol: rust_build_error
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Gary Guo <gary@garyguo.net>, Alice Ryhl <aliceryhl@google.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Trevor Gross <tmgross@umich.edu>, Miguel Ojeda <ojeda@kernel.org>, kernel test robot <lkp@intel.com>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Huacai Chen <chenhuacai@kernel.org>, WANG Xuerui <kernel@xen0n.name>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 21, 2025 at 4:27=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
>     CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy
>
> I don't know whether this "CC" setting also affects Rust, but assuming
> it does, we can very well imagine that at least one of
> `from_expr`/`fits_within` does not get inlined, causing the compiler to
> not be able to satisfy the `build_assert`.
>
> If that's true, then this is an oversight of mine rather than a
> fundamental problem, and could affect all architectures. I'll try to
> reproduce the issue locally to test this theory.

Yes, it does affect Rust, i.e. we use the same levels for both.

Would `inline(always)` work?

Cheers,
Miguel
