Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55E7B38DC7F
	for <oe-kbuild-all@lists.linux.dev>; Tue, 13 Oct 2026 03:25:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791861909; cv=pass; b=f9WevCvd0MJb/tjL5tkfFnzwTzFbI99JEE0R/0NtxL38+Q5+bFGMeQBnhXwfC4HHI8cZ/+7ZHsUBSAr85M7QdUMzSTn12eXyp1EZ4t/Djb4nGAZdyksJ8jcYsNqA+QqBggtOnWkorXJKxT/iecKRnX9T30b3ujn9UtYTLXVyA7w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791861909; c=relaxed/simple;
	bh=Qlj6+PdrddA+XIaFJDL/MjE18zhPUetQeHCIDXrZrJk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DJdrNyd8mk4T0YTKBhNEFQ003h43KVzYASS9T/HfPXNtCcjL5y9ORMubWZU9epx1MCYZr5zJds+d16dNJuDpvRQYRXSz4ZDVV7+zvURzJstoHabhGe649XWQfz3vWCIgomfroIG6rNV1k/bEnJSr+2FTZh+iNJrrsp7fHV/45n0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FyYKxv22; arc=pass smtp.client-ip=209.85.208.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FyYKxv22"
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-3a9787a14ecso17794861fa.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 12 Oct 2026 20:25:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791861906; cv=none;
        d=google.com; s=arc-20260327;
        b=fZIdo5dT1Rh0k0p9zPQcxtJYqyybSQda0UsRto8tmchwf1UEMnu5Gt3urzZxYvZriV
         uIP73r4oY/K0xBmWZlTe7rTgVmPjucBPIURZQZ4AW2PADkpavdC3ID43JE1eBxo3YqFD
         Uf61H/HQ/BMCrU9QCE+L7TzXcs1UMuIbkMceabUaS13AbcIftsOrDIxRX/9M4ilW39ke
         IX4xaK6ri15BvrZjr+XGORyPyPvms7/8q+uQ6w4FWmWIsphChGyqcIaAyS0RUBqzQXlC
         FLGdq/LysZ/H+wQ2ESxErcjJOC6y11Hjify1EkBCC5rcFtFSLNP7o/fH/77nKj2qmMi3
         xUaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=uTqggzvRy7T1WnAA8c/5d02IgpIAPQR2aC2FYAifG4U=;
        fh=HGVyyehmg35FJwLo975Wpn9JcaUCKU0Wcp3m2hZnLPQ=;
        b=kweBJu/FMSKctgYnb5qvJFsfsoDjoUFJXOPqc3XEO/T2lBgYmNoHYFKWPJUNAI4u2D
         n3wg6ePl2kQNq9YrTo/JA3J7xKlAauEusc0PPU9ihzr/OlvLHJyEemPxACe3Z8xh+/qW
         QXzht7LrD5SvHQ/JYPdP2h/xHq/it1Q94qfE/WroQhx62XmhjvBcZybqD9MZvh9Ni4Hd
         90amjh+rFJltZiogSs/tMapVxyB+No6tSY4y5oAHSmEaYB3IONyiQgpfkIuRGCQiHi0A
         6dJVlr/O8H6C9sLNYfq8mAAGhgUfOkZmf7wONxs9ZdRjWgDSFCdpAIqiZjxefBvKEb4V
         FW3w==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791861906; x=1792466706; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uTqggzvRy7T1WnAA8c/5d02IgpIAPQR2aC2FYAifG4U=;
        b=FyYKxv22asPY8jbWPA1n0pVmWIniTFUy2DQgMIbUQ+YTGWCTgQmUAT2pEs+peNg/5f
         7NWvPkzXQKNSxu0CV3s3AIHQukOKEppEMXoy0EJ3kfczrXe5Tz4DWm0iyYG1QktgGAhd
         U4uvetaZeYxtIEdXunQ0VTp+q6DX2/5eh+06wK3wHq34q+50bPqMdjrPhMz0go++CWuk
         kUvly7ZEEYAZDNw7frQl4R6jB65OxtJYEzXlkjVeUqdacfSpHWyz8kJ2HppV1UZypO4q
         Nj4VvO94lzCmnPDrLycEIinaVVaVMmX07BxG67bNcECPYDE5/4b3TZoI8JmjbzFD95bc
         l1JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791861906; x=1792466706;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uTqggzvRy7T1WnAA8c/5d02IgpIAPQR2aC2FYAifG4U=;
        b=HTC/MbCxXLrLfnvDrA+7hzIehSfqZN9BrxZcBaBts64XkaH5rlqav7G4v1XX2C05jp
         UC3s8xyqFau0jG9hg53m2RfZj9jvE0OqhJGbjH8C1d1AgLtAGoqHym8fVYzzfjcanGdN
         s/+jX8LuJWK7U68Ifl4xmiF0FyiqIcCa3J10UCUmAktUlbzrrpuxEaoLDZ+osy0tvC+7
         dTOGpmQeXX48NXChBt4KFBV/69l29jolvIWOH4ZfWKE8dh01qcak0vXxzKbZzr4F5BZl
         RTYsan6HEJDjm3tEEvmmNTC8JveCiS6TS7kw8UyhDW63sQiU0ECXk4oJ0uZDfxmqTlwg
         6/Mg==
X-Forwarded-Encrypted: i=1; AKwUvByldCZKfqz+eItqNq7AlllmklpEXbiabczEu70uI3NYTOI/yodE20gOr7aINL+z0FOVryE0zyAEaggngo4L@lists.linux.dev
X-Gm-Message-State: AFq9FYK239Zdq3drgZiSeJJiRT6J/hr5DKJniqyS7ZN1PAbPfWoXV/5l
	z3bxehvr4asXPjQbSVzVJywjEWoPBds2CYiAXjoHpncaZNTfDpk0XB5DHKn0WPZ1MhGNjgxG6zW
	geT+feqYfhXyYcEgtnRtMYEM1eSJ86xs=
X-Gm-Gg: AYBFou2AItKp/7bFzTC+K/Mv2taoZs7He5PRXG7nvaP7IavWiaGpPAqCWWhVMtc0kzG
	imEWMeaW/w0vft+lvCOF/8Q+3zNxhhqEXkrIk2ng6p85Bk86ANktnJF1/u/lkAEDhKcbLiPXq1t
	nlv0Gf6+nWGfK2koUi8GmbGTDeC6R7BMRlxC6gxxZq8xC/Z6UBM1678taeDZhXMuEB+rspz4aIZ
	JI7XPn3qwa7ZV7GcztjtlCsEaPV2p8dZD3B/GtB6J8HooGe/W2iXtTKkHrvFMTH3F4m2LCrgPlA
	ZNg2oM3TV/ZMxtQTje0ExC8nSztNXB46kEMNRZM99/pNrClyEQc5Iy6pANViMGsj4FiZeXYZBdA
	IWqA/mPCVDaPgABJ6qEtMQ7DTSQRudSubskMh424=
X-Received: by 2002:a2e:a991:0:b0:3a9:76b7:c515 with SMTP id
 38308e7fff4ca-3a9c5253a1bmr24195321fa.8.1791861906046; Mon, 12 Oct 2026
 20:25:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <CA+=Fv5RJpeusA2W4rRHOJMPRn8iF=OngRy05X22Myurs0wA-sQ@mail.gmail.com>
 <20261010022039.1610210-1-mattst88@gmail.com> <20261012133753.3a5868e9@pumpkin>
In-Reply-To: <20261012133753.3a5868e9@pumpkin>
From: Matt Turner <mattst88@gmail.com>
Date: Mon, 12 Oct 2026 23:24:52 -0400
X-Gm-Features: AclHuK_03Oc5vixjhdWzw-DLdJM5sKo0togD5oZVsH_2hFCEPrVq0SbRDKzpVzA
Message-ID: <CAEdQ38E=_qKf+Ljy0qyBATVnjQYihGOkffgYaJuQLSmxim6Btg@mail.gmail.com>
Subject: Re: [PATCH] alpha: add 128-bit shift helpers
To: David Laight <david.laight.linux@gmail.com>
Cc: Magnus Lindholm <linmag7@gmail.com>, Richard Henderson <richard.henderson@linaro.org>, 
	linux-alpha@vger.kernel.org, linux-kernel@vger.kernel.org, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 8:37=E2=80=AFAM David Laight
<david.laight.linux@gmail.com> wrote:
>
> On Fri,  9 Oct 2026 22:20:39 -0400
> Matt Turner <mattst88@gmail.com> wrote:
>
> > Selecting ARCH_SUPPORTS_INT128 lets generic code shift __int128 values =
by
> > a variable count. gcc open-codes such a shift when optimizing for speed=
,
> > but with CONFIG_CC_OPTIMIZE_FOR_SIZE=3Dy it calls the libgcc routines
> > __ashlti3, __ashrti3 and __lshrti3 instead. The kernel does not link
> > against libgcc and Alpha does not provide them, so the link fails:
> >
> >   alpha-linux-ld: lib/ubsan.o: in function `get_signed_val':
> >   (.text+0x1c0): undefined reference to `__ashlti3'
> >   (.text+0x1f8): undefined reference to `__ashrti3'
> >   alpha-linux-ld: kernel/time/timekeeping.o: in function `delta_to_ns_s=
afe':
> >   (.text+0x2ac): undefined reference to `__lshrti3'
> >
> > Provide the three helpers in C, as s390 does, and export them for
> > modules. They are built into the kernel proper rather than lib.a so the
> > exports are present even when nothing built in references them.
>
> Do they need an explicit (shift &=3D 63)?
> I've seen gcc/clang remove an explicit '&=3D 63' because they know the
> hardware instruction ignores the high bits.
> But I'm not sure what happens here.
> Adding it won't make much difference - unless it matters.

No, I don't think so, the 64-bit shift counts are already 0..63 for
any count in 0..127. The !shift check is what keeps 64 - shift from
reaching 64.

gcc doesn't remove an explicit mask here, by the way. It costs an
extra and per function on Alpha. Out-of-range counts give the same
results as libgcc's versions, which is all the callers could expect.
