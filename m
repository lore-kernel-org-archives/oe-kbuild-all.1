Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C7E1E25F8
	for <oe-kbuild-all@lists.linux.dev>; Wed, 18 Jun 2025 06:19:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750227594; cv=none; b=Fh6L+cDQqmeC04k1YSyHZkfB60PSDw/I5+OTFmPh2jayl4mhjepZCz1rWYDQPY9pvlbHxgsMU4Xedb0+MZWP4LxXBwO/iuD+7XTdDIZv6ob7siavCArJ2iHzRYrx0oy8/Jm1MM9WSRaJU58DAMFU/hdmkDPw8dQ4TqpRarqpF88=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750227594; c=relaxed/simple;
	bh=ptnwGTzj6YMKatvrZaLaa4y9ij+xS18u0yM5DI6DxQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eF7SupjfD6JJ51zfnZT24nL0lHwGKJtDfjvPkJiTNETmrTasvi4VXTtXfkmgktZpm6ikk/W1O0H3mT6XATDX+QM8onZYku+BACWgMcVmn36qoGvxdcYolo9cpVGF9q/qbzx0JH645oszqKAs2nzyKBHpPAdwAA14Bdtm9DA/avM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LxfChyyz; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LxfChyyz"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-234ae2bf851so6988775ad.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 17 Jun 2025 23:19:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750227592; x=1750832392; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ptnwGTzj6YMKatvrZaLaa4y9ij+xS18u0yM5DI6DxQY=;
        b=LxfChyyzie9+46C7QrbYsjYMwb4zFGpT5Yj3qoWUOdPO+6MZ3AcSfg6tit/XaEa66g
         sadDDgQEa9f7hUzskPWM0zzsVvA8nDCf6ALKgq0+m55tersrDULBV+8u+bYQyW5d2dK7
         cBh91+YLARAhRlbjo9VDv3ADkFcTi+mELEF0F1zawhJuKD876BC5c/9Zzy4dEzjs5jMy
         AsuTNJYgFu4gRDpiFkAGeXEsAj0Dx28oD5IGCc6J1G1/+oSKFu+EJSDTKuDL7XH6BKVO
         BIuBZB+UeSUrkO2StvDAnGgB9CrUVHvyZSD2f6TODG1aIVAVtDHQkPpIFvKRSnVaTOdf
         Stwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750227592; x=1750832392;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ptnwGTzj6YMKatvrZaLaa4y9ij+xS18u0yM5DI6DxQY=;
        b=tXUsSM15rqof9ctIvSp48iOkaC1+xh/+W9GW98tB22TrkBfeQXS1KvFtVarhHcKUk5
         mhw+huCt7+Zw1VkGeJD3GoaG82uy9Q4+bzZMTFkCT0fTfH5BxrW0fjFVpDK7oS4dfl7O
         i8UAFe/uFUeY1/P0RoJ+XH3ES3pVSq7X3XrwZRNTkuaDzz1bjj/mCE8bm6Cr5o1lWR6J
         9qKTWZxhxpR9JJ8BDaC6eMGP7AmHiun3v304BuieiMcJNTy88nzw0cqyHQzy1gkyM7Ae
         tFdDnRVHswyCu16uoArX42dpxMLE00lkM80B0Az9lUmZjkV2VklPtCybB+PN8QVEnhIz
         CXxw==
X-Forwarded-Encrypted: i=1; AJvYcCU3HG65RxfY4uq5PGZXfClgA5jXuSae1Bzoep+BnzUuYfQuYxOYlG8cM83Ic/jKMrbQ7qK4Lp2sIkike9UE@lists.linux.dev
X-Gm-Message-State: AOJu0YxUeQdpAXDJAvsZM3oQabNa67+VAYiTjhI/B6Uuh0Upa4JntvJ3
	bg/qWzc+CfrLIYfiYNZ+oS0XAHlED/IrBf81g9p79U0b0Ujf8hEdsIsftjo7ha831H7SMFX/Hr/
	d6SXxDr8kDGuofb30UuqiceVs3leMXLQ=
X-Gm-Gg: ASbGnctrwVkigs5dA48ifPHz2SJgDe2KBiMsTyXlW2IqpsAuufebPlonM89M/IA55F7
	cTgD0TieZnYs12EV+R1ekR8VfxiFTBgDhrdN2UDhNCcT2GFAEy1h8Af+oZVMeSlLo8dGlgTuNff
	O5z2/JMxQJD0At8CQMlXF8yv/iWShz5pza/igeh1mJUy8=
X-Google-Smtp-Source: AGHT+IFtnzX76bEKEbc2BXmLJccO2YsNEFGrLZRb7gLGYgWEKWunrctKo3sA+VxN8wWlXqDc4/YJ4oKSqaG76xV8EU4=
X-Received: by 2002:a17:902:c404:b0:234:f4a3:f73e with SMTP id
 d9443c01a7336-2366b1489fbmr84870505ad.9.1750227592465; Tue, 17 Jun 2025
 23:19:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250617140032.1133337-2-guillaume1.gomez@gmail.com> <202506181334.f0STx6ta-lkp@intel.com>
In-Reply-To: <202506181334.f0STx6ta-lkp@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 18 Jun 2025 08:19:40 +0200
X-Gm-Features: Ac12FXzEAYg6BwKSfXUGSw7sGa50QSsZn7SaLIMHw1acT4CRUVbCTxzzVjN85hc
Message-ID: <CANiq72ksZwH7GZKAjk=7FN2npWou+T-0pkbOF+fm6hVHdQtNZA@mail.gmail.com>
Subject: Re: [PATCH 1/1] Use new `--output-format=doctest` rustdoc command
 line flag to improve doctest handling
To: kernel test robot <lkp@intel.com>
Cc: Guillaume Gomez <guillaume1.gomez@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	oe-kbuild-all@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 18, 2025 at 7:51=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> kernel test robot noticed the following build errors:

It is just `rustfmt`, so no need to send a new version just for this.

By the way, from a quick look, it indeed looks like with this now we
can finally avoid relying on implementation details on the kernel
side, so this is great, thanks!

Cheers,
Miguel
