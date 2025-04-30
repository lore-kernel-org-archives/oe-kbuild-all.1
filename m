Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 910C8EC2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 30 Apr 2025 05:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745989604; cv=none; b=Bc4Urxo4dYznV5WAMT+T0Q74CsszzXyt9fHIpNBWCETQym317b5lJ13K2Rt2UkuiAnHzhztzjKT/4QzSqID7aWCHoNQqqpJDxMDlDmDT+qUtB54OnMmR1iEtR6/Mctg91UF5w8LEQt1x7vZUONnaR81UScXpAtYVDx39jX0y2x4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745989604; c=relaxed/simple;
	bh=LBI2fG5yl1PAjdo0BMunHcJDpVY8i6Vg1flsFNpReZM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t1zTudaU8ujT0su4lbz3JZCWly6Da6SGnqO+hWD3tsiS76s0gU9nw9bXsPwzwCZ6xUC1Xn+9/j2xgXfso2lIaWX5JB8qmW72Ql8+r9UV2K1hemVLfRVDRsXT/r7WWSSIH43fPU0BnBx5B/QRMXvuAhMuLohj5WY4cJRr8v37K8c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f0Gzt3V2; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f0Gzt3V2"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3032a9c7cfeso724144a91.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Apr 2025 22:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745989601; x=1746594401; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VPXDhh+HvBh4rGOyWQU6Gi61Wi13PrW/ZJi+FHXHhnc=;
        b=f0Gzt3V2gXBnfZPiXiIx+Ed+RQEYPgwlVzMZYyYwZRrwDPZG9TJ9+EyGKLcjbhKtxp
         V+fPJ77uF8MAfFq5oVolNqo1Km8B3DJcTpPeMeem6+ST2cvU4zgH2E4coCCmAp1m8UGt
         h2XlO9Xc96uda7drI3AtqQPxxpQmwPO7EjcqPT0LIZ0c3GJACLfg1Dq86e/at7RIE1bC
         WvgUpjutyXBMmGsdqWJi2HR82x2vo93YiomEX7BD7Uz2Dvl+8BxMe1jSX94MC2vAkbsU
         4tGP9FM7o8ueaawTyNNkOPmlKDgrTtqF86eCwHS3tzSR/AXRwn5uKbszLJ4YtUdyr2by
         Ey+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745989601; x=1746594401;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=VPXDhh+HvBh4rGOyWQU6Gi61Wi13PrW/ZJi+FHXHhnc=;
        b=rGDS9lcoB75lDQxeBs3MBac7kHHl2au8sQz+ERmB45oL9kvlc3QYarKUO+3RV0cpCQ
         SBaEOfuwYigP/oTT3JoOTKPffQFGtOK7A/CqV+/uBVV7jJd9CA6Io3j6StdTFXXEu13b
         4eycPx+6ADVu90ro3yRkaT5fcSqebynI1RGXuin0g8bDa5YMdXJeY8V4M9OPTBbDXndQ
         Ng+ZzcMN2B4iOdo3SWOpqF2UGpmjbqVvsWbSiupVxUInTYwIO5wPuMtnLLO9y/yXkQXQ
         lh2cgMJb9oOUKOZRk1Ir3i2+znJHLej6ucoMZcEduoXRaz0DZlrQDSE4yR0Hnvte9kcb
         TpDg==
X-Forwarded-Encrypted: i=1; AJvYcCX3AKADqleQ/yK2/6mMZ67Bt1Mt+iaBoD9lpzal8czAYggWTJczm1GDvm/oNORb+19K8Uh4/y1FlZrWuAx/@lists.linux.dev
X-Gm-Message-State: AOJu0YxNhlm7IxzawR9jN0p9CPYXhofnHzDyj7u3D4nB6E2MKGSrHkoW
	ICJe2QVXG+5KyG61/RV2HnOr+eXFbb/9udoLda7wZU80vBaUcPJnFO6ZbaJK0kswj5JdlHwHf4A
	oL+KoZ/ef/gjE9agLe9QSq6Az9LM=
X-Gm-Gg: ASbGnctATKUKzM5yL6puB8ccNyeys8zQDoo8bm5yPJyQl4a1D7ytBgkpJ12DxUnpRcX
	XZx/i8c08p7fECLLZKmKSYfNM3iJ7Nw+MV24pBIsfVH/Ar3WIsKohpZz9VjxWjgkYL6m0RzDN5f
	2H/fIbwSOqbnK8xeUkUBEICw==
X-Google-Smtp-Source: AGHT+IEzqC4paYNq+CnclUgZwSKfOpMtymiWrVElxIXTnJhK11ZchV3pDUjrj8GgmxCihX2zoLbLZ65xRi4DAXKpYpc=
X-Received: by 2002:a17:90b:1b50:b0:305:5f2c:c580 with SMTP id
 98e67ed59e1d1-30a335595b7mr890206a91.2.1745989600684; Tue, 29 Apr 2025
 22:06:40 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202504301208.YQCguEmE-lkp@intel.com>
In-Reply-To: <202504301208.YQCguEmE-lkp@intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 30 Apr 2025 07:06:28 +0200
X-Gm-Features: ATxdqUE04ahtdk0VVUgpSRZDrUSkdYxIwl2xeO0hSjDBIOSm9RZjm6rJjgvOkwQ
Message-ID: <CANiq72n6tTox7jMX89p4vLihghrJeDcBL+MWR8rp4_Y0LyxcKg@mail.gmail.com>
Subject: Re: error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
To: kernel test robot <lkp@intel.com>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 6:55=E2=80=AFAM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   8bac8898fe398ffa3e09075ecea2be511725fb0b
> commit: 584e61452f75bfeac2cdd83730b4059526ec60c7 rust: helpers: Remove vo=
latile qualifier from io helpers
> date:   2 weeks ago
> config: um-randconfig-r063-20250430 (https://download.01.org/0day-ci/arch=
ive/20250430/202504301208.YQCguEmE-lkp@intel.com/config)
> compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf=
1a2591520c2491aa35339f227775f4d3adf6)
> rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250430/202504301208.YQCguEmE-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504301208.YQCguEmE-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
>    --> rust/kernel/block/mq/operations.rs:15:33
>    |
>    15 | use core::{marker::PhantomData, sync::atomic::AtomicU64, sync::at=
omic::Ordering};
>    |                                 ^^^^^^^^^^^^^^---------
>    |                                 |             |
>    |                                 |             help: a similar name e=
xists in the module: `AtomicU32`
>    |                                 no `AtomicU64` in `sync::atomic`
> --
> >> error[E0432]: unresolved import `core::sync::atomic::AtomicU64`
>    --> rust/kernel/block/mq/request.rs:16:20
>    |
>    16 |     sync::atomic::{AtomicU64, Ordering},
>    |                    ^^^^^^^^^
>    |                    |
>    |                    no `AtomicU64` in `sync::atomic`
>    |                    help: a similar name exists in the module: `Atomi=
cU32`

Cc'ing Andreas.

Cheers,
Miguel
