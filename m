Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5605F2E403
	for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 08:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751273050; cv=none; b=a+v6FmdOv9U+eir2k5r3RERQg9WMMTJCLNvxy7ZQHTlQTOjud1gvfmZx6mxwULdjQj8Se2qj6wpJMCr5YHtXmiBkJVl9AQSuAk8qJWsHWu3Odf2n6ootcONO7qrYfxlIAVQPD33lgxguXOg4c3nULePRGt95/cwhdSbZPn8HDVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751273050; c=relaxed/simple;
	bh=hJfbLRuFnnr8gAEE6//ksIP4SmDlGurpqlaKsqFIq+w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uwlcKOFBs6S1RK+KT3Ungr5cfVldgp48Ocyo0xjnbOeKDHsWEz5thV+XlrI7AFbglLLHTnj6dAodkZgVt856rwdQy/gbQ++4+IscbfkvE8zePi+Bh+jQ4kzb4hRaR7jNHRx4XSeMom66VNsLcEt9in//yxJFuL4mtQrtMWWVzIA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=CHjlQ1mG; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="CHjlQ1mG"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4a5903bceffso57159781cf.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 30 Jun 2025 01:44:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751273048; x=1751877848; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iiCw4e6C46xOcJozINpGOloW5lDrrrAuNKK3T9+bjyA=;
        b=CHjlQ1mGIi+ib1QnCRpxx4NTRmrfkAf3uTQpKumOSX2X1cvy0QV/4LW2He03Q+BIZD
         n/fuQabOoRFDQkRZ6n3SmiEIkf7MZii9Qn94cj3zDtFjbSHvBdbZ3EcLghXsqhH5fVA3
         JSF9VbOO8mkDTfGCeJuNrr3Juthv1qiWx4uObadBaxWoC/X7jVyjO/39Z8HXaca1q9lH
         hqMmMMW9MHSW6S4YU4yfjKRe/8xGDhbhOPoICCE2idUPO1gbRfKAZ9/qI5AeAW91a10F
         h78rcW4GoORtjBrteRGufxEooMPd0ycgc6A2LiLroEQVjvlHwIkriDC5Y4Ar90dkpODz
         cZlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751273048; x=1751877848;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iiCw4e6C46xOcJozINpGOloW5lDrrrAuNKK3T9+bjyA=;
        b=fMPJMZmzMYfJIftUyIQt7Qy8HoIfjRv2Lm6AvKLLgvkgkKOhfhdnPinvX0h+6C2j5+
         zm9gKPwPcWkjOE0Fc7zImErlxOBrC1M7HPl3j05MhrqM/lQJvy4p3jYHYQmmasW1aWSM
         VSv8GuTlQBWWeY9dcVQZkIEIxkPuCLxTjm1yAFCp9buthes94BbChYqB6h8fI1zuJJCM
         R6Gy8ShHon8SjJIyaT+0x/Q/OV9EJs91vwPC6ibnSoK7kHsFKU59smZ9wTCqL7jx7/I0
         6mSqdgHpGyGRHGmLUP3/NDXMuK4A44liGHnZbrZ0DOLja93f0g4a8fs4RkSyURmjqHuE
         gCnQ==
X-Gm-Message-State: AOJu0Yy0NsNoReQZqApn2HXJhgYJ+xGHKkSwE4WWu7KFUFNGl6fSlE6b
	iWfr29A3Ce5ubmsgMd5/olRjY5q+6FMgclSkl/uuvPR6lLn/KQdKsIvSJjgSEvGUEnWXtwW76RQ
	QdT7apnFvdSKfKPNil7c8Be5Jt+o3kc/TQc2fwuFe
X-Gm-Gg: ASbGncv+I3FN8fTrjhqee66EbdKwuRqGWa1o5+8jEObjZc7UbHdyrJhPr6TOw8r8Dst
	ol0ZJmQOI7RUe3OEq5r8oZlz/gjGrRblf6UvwvjOb7o9s3KyATUQF58bH0SZN44RyLREGjo59xp
	q9b1cQ+MsfTvaaquPWFJ9UHT5uUQf5E7AHPH1HEqmPWlA=
X-Google-Smtp-Source: AGHT+IEO6CGlcU0pGXJk0nD24+RYq1uMetRhmp3DMDxP/SvB1/Kr0/7JezKDmaqY8f+A7hfxy5hdY+IuJM+oAv0SQIM=
X-Received: by 2002:a05:622a:4d47:b0:4a7:6e64:ecae with SMTP id
 d75a77b69052e-4a7fcac457amr182969791cf.30.1751273047863; Mon, 30 Jun 2025
 01:44:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202506300504.avZTufkf-lkp@intel.com>
In-Reply-To: <202506300504.avZTufkf-lkp@intel.com>
From: Eric Dumazet <edumazet@google.com>
Date: Mon, 30 Jun 2025 01:43:56 -0700
X-Gm-Features: Ac12FXxYYW6Te0_qsySnuQysG6zDuyR5mF9XHmL5XGyLWaeqH02vz91zNyGm4b8
Message-ID: <CANn89iKuK7Q8gSzYi1Z8OoYQDJMbend_ja44mTNW3g5_SN+3BQ@mail.gmail.com>
Subject: Re: [linux-next:master 4262/5998] include/net/sock.h:2098:16: sparse:
 sparse: cast to non-scalar
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Jakub Kicinski <kuba@kernel.org>, 
	=?UTF-8?Q?Maciej_=C5=BBenczykowski?= <maze@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jun 29, 2025 at 2:58=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it master
> head:   2aeda9592360c200085898a258c4754bfe879921
> commit: c51da3f7a161c6822232be832abdffe47eb55b4c [4262/5998] net: remove =
sock_i_uid()
> config: alpha-randconfig-r123-20250630 (https://download.01.org/0day-ci/a=
rchive/20250630/202506300504.avZTufkf-lkp@intel.com/config)
> compiler: alpha-linux-gcc (GCC) 13.3.0
> reproduce: (https://download.01.org/0day-ci/archive/20250630/202506300504=
.avZTufkf-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202506300504.avZTufkf-lkp=
@intel.com/
>
> sparse warnings: (new ones prefixed by >>)
>    net/bluetooth/af_bluetooth.c:248:25: sparse: sparse: context imbalance=
 in 'bt_accept_enqueue' - different lock contexts for basic block
>    net/bluetooth/af_bluetooth.c: note: in included file (through include/=
net/bluetooth/bluetooth.h):
> >> include/net/sock.h:2098:16: sparse: sparse: cast to non-scalar
> >> include/net/sock.h:2098:16: sparse: sparse: cast from non-scalar
>
> vim +2098 include/net/sock.h
>
> ^1da177e4c3f41 Linus Torvalds 2005-04-16  2094
> e84a4927a404f3 Eric Dumazet   2025-06-20  2095  static inline kuid_t sk_u=
id(const struct sock *sk)
> e84a4927a404f3 Eric Dumazet   2025-06-20  2096  {
> e84a4927a404f3 Eric Dumazet   2025-06-20  2097          /* Paired with WR=
ITE_ONCE() in sockfs_setattr() */
> e84a4927a404f3 Eric Dumazet   2025-06-20 @2098          return READ_ONCE(=
sk->sk_uid);
> e84a4927a404f3 Eric Dumazet   2025-06-20  2099  }
> e84a4927a404f3 Eric Dumazet   2025-06-20  2100

Interesting, somehow my copy of sparse on x86_64 does not complain.
