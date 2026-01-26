Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EFFF306496
	for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 09:22:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769419358; cv=none; b=mZr0XhAaPuBmhwYUSH7Av33IIYjQ3FK5L471W5w/bTZUhhId1EOpxks/3S7liD6YfbzKJT5OceBsuQU+kMPdBFxz2BwjXgmshs26cAfA4llyRwS7CfuUZTWX6koDNq8XWUen51ilhsWRDeGEUKeq2g/cBmd/2u6MeRaXhlwZUSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769419358; c=relaxed/simple;
	bh=pwtagrJ6Orntn9rCTwPChBjN7HhxzqpgG+/pftaTDqI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=iSolLdcPYyrmzJbFnIcW/7XvU8sphEh5J/mLg8HENrfRX1unU1jxFZxw0vjhidBGNe8xt3hf2z6C1K4fZRscgxFsAWNpCfL+F4mpd7im9vOgFBedGHJ+9RNBWlifkeUQQZPVbJPjgPFkhs6IcuxhSzQFtenaRC7mdP2sx/rLmbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=09CBhijv; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="09CBhijv"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6581a45f30eso404527a12.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 26 Jan 2026 01:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769419355; x=1770024155; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7a6yIcsB2kt1CiNa5tFb4Ajz4/4gpPILl4lTvlfFzgs=;
        b=09CBhijvf3dRDSUNSd9nVxzIRs7KePAlfFHrslLj2JL2k1dXN2lSZ8tT6QjBQnboho
         2kE+1PoLdGuJv0o3nlaCCrOgkAqLMM570XSgb72vNIZm3TFCM9AUrtow1/QBTJya+0+Y
         Vnp/H/UTmRUgg9YupCE9OuTa3GhzYtGyABBJZSsWVRMge/emF51s+xcVWLeNi4ulMm4u
         84tsG3WwksfeSx6FmqYJnC3hoyQHlwUyftF4G9Atuqm4NCStPNB6CFqP0WrK6lPsyA8i
         BYIjsDHDH4B3GnGWopOuqH74BB83yVFLvkchVGrpFA8hD88BiLk7hpYk7WYbuXCfVZlo
         ghBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769419355; x=1770024155;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=7a6yIcsB2kt1CiNa5tFb4Ajz4/4gpPILl4lTvlfFzgs=;
        b=lQ9wtOvCs61xqNfAasDe0G+9zZAIvcG4neRSAUs5QtSyI5YMXuPlOWicmMgw8Hyo+n
         9A7oPeRefoPXwS1fTkknpFzJmg0UK0E/DDQHTeGeoa2ddKmUdaj43qJJmsAY3QMEnB+F
         JymkoQTUbiokjs0a2MQzYMOYQp7qjRZ8ABzkE1elsE4A9czrQ8wkW8D2o9VO7XREXE/+
         GWTgkvDXj043SunCZi3TcSILSVTEBNWCHycZKLpkdYDh9hxHBYJYxcfXL1hSa9Tu4IY9
         ZOXtGNdJcCkgC55PqanUAMRcFRsoPEKVw7GbsAUIfcTATXcWFl084aCd6US68bepSYrc
         IQeg==
X-Forwarded-Encrypted: i=1; AJvYcCWoiyPwf0XOsEInEDf5M+ECVmLg6xCMBnYRqe4906ncUDCF6W0X/TloJAeAla25DDSxfS2qLUUk7VMhSTmt@lists.linux.dev
X-Gm-Message-State: AOJu0YyrBqP2y4cLD+SDaIGB2hwOv6hFZrLRWPtdpxGwu7/KR1aMAdpb
	uuKvYTKvPUUuV7g3v0/er0hHlVgDrCupZ436Za6K5+sfhXR1InWcQiOk4qYGsYI4iupBXOrU/dL
	wYX3dofUyYYdPUyeDUg==
X-Received: from edqr22.prod.google.com ([2002:aa7:d596:0:b0:654:3514:7440])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:358f:b0:64b:4f44:60ef with SMTP id 4fb4d7f45d1cf-658706e14famr2889920a12.27.1769419355015;
 Mon, 26 Jan 2026 01:22:35 -0800 (PST)
Date: Mon, 26 Jan 2026 09:22:34 +0000
In-Reply-To: <CAJ-ks9=N6GViTH-7Ki1qpSfRdByBFxb9132et7J0OXTTcosLwg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <20260122144444.265412-1-gary@kernel.org> <202601250701.wXxtGd9z-lkp@intel.com>
 <CAJ-ks9=N6GViTH-7Ki1qpSfRdByBFxb9132et7J0OXTTcosLwg@mail.gmail.com>
Message-ID: <aXcyWhM-KSg52t0I@google.com>
Subject: Re: [PATCH v2 1/2] rust: task: use `as_char_ptr` instead of `as_ptr().cast()`
From: Alice Ryhl <aliceryhl@google.com>
To: Tamir Duberstein <tamird@kernel.org>
Cc: kernel test robot <lkp@intel.com>, Gary Guo <gary@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Panagiotis Foliadis <pfoliadis@posteo.net>, 
	Shankari Anand <shankari.ak0208@gmail.com>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 25, 2026 at 03:19:53PM -0500, Tamir Duberstein wrote:
> On Sat, Jan 24, 2026 at 6:34=E2=80=AFPM kernel test robot <lkp@intel.com>=
 wrote:
> >
> > Hi Gary,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on 053966c344dbd346e71305f530e91ea77916189f]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Gary-Guo/rust-di=
sallow-use-of-CStr-as_ptr/20260122-224657
> > base:   053966c344dbd346e71305f530e91ea77916189f
> > patch link:    https://lore.kernel.org/r/20260122144444.265412-1-gary%4=
0kernel.org
> > patch subject: [PATCH v2 1/2] rust: task: use `as_char_ptr` instead of =
`as_ptr().cast()`
> > config: x86_64-buildonly-randconfig-004-20260125 (https://download.01.o=
rg/0day-ci/archive/20260125/202601250701.wXxtGd9z-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87=
f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260125/202601250701.wXxtGd9z-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202601250701.wXxtGd9z-l=
kp@intel.com/
> >
> > All warnings (new ones prefixed by >>):
> >
> > >> warning: unused import: `str::CStrExt`
> >    --> rust/kernel/task.rs:12:5
> >    |
> >    12 |     str::CStrExt,
> >    |     ^^^^^^^^^^^^
> >    |
> >    =3D note: `#[warn(unused_imports)]` on by default
>=20
> Seems like the import needs to be conditional on
> CONFIG_DEBUG_ATOMIC_SLEEP. Aside: it can also be `as _` since it isn't
> named directly.

Can we just import the prelude instead of having a conditional import?

Alice
