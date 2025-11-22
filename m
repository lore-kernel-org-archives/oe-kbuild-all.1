Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B263272E51
	for <oe-kbuild-all@lists.linux.dev>; Sat, 22 Nov 2025 07:37:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763797057; cv=none; b=rYqCx2O4cbUWDTE+6Vfag5DIYxH6HvkE2Qwrw44JFTAfQTmr0zZwN0ShgQB//iyvjIKrlXfe4gz5L5uDJrxKzlseElmAxSJ2jFa8sMdgmJJ2dKfx1Vercqarg6wKV3b4bYd+oa1DM/ZFZ88k+h6SbXdgLy79QcaM6O6tGPSPzIc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763797057; c=relaxed/simple;
	bh=3koCjdXkvafnpT6jEVh1wZykoAgCZIwu7REyUgD2Vzw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eDRJvA6jynYgtFMtBNHcglQgxbTq6Yt4gDUyAN35xt00Y/yRgB3BIUvAaF4HEGwFpzfFskg8pd0/RoLCpuadUZ6wYiOj7dRMGk/IZMXpG/JumLYFm8QYQwxN0rspVEn4zdYu97AgU4hFuntf3RK9J3zCvKESYorn5AN/aaDcChA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=w5B6lW7r; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="w5B6lW7r"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-88246401c9eso31966016d6.1
        for <oe-kbuild-all@lists.linux.dev>; Fri, 21 Nov 2025 23:37:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1763797053; x=1764401853; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=yV4GqWospvbrtUSnzynHACYrA/GyrRRftwngY7+lrAE=;
        b=w5B6lW7r2NdC5EVXIjLIUERsRvZsja1fCkmAutz/HzCFHPnbppHSxmqGrfCXvERj0S
         dJ+3j5yU8rOA3uwBdui9Eu7cfN0WYUkDKBYJc449IAhfRCB08ZYEZrUoW/WIeiKVRosL
         mFTYxPIEuYT5PTF3NHhS2ffDnSnZFxoMdFaGnaHFx4b4ChMnU9B0chboUfci1fv+8LLt
         MqeRpGj8ibb6nUD8xAV7Fp6ypVXcpvJTzp0YPkjhcB3zcXD7IwtI5CL9gZ9b7MCeVoC6
         qBetTpKO7ffHzagkQSUOwaCtIH2Sfl3e+LqazDFzVqvqYiWOLi7AGWHAUiNlj4WO3n45
         SGeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763797053; x=1764401853;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=yV4GqWospvbrtUSnzynHACYrA/GyrRRftwngY7+lrAE=;
        b=xAJ7cjhNlEtjfuuBXcWEAgPGfUKE8HEYQrgEoksWYDn7/MNJKDVWMjzb7tJdzg7Au9
         WyaEsttsVNhYyFP3/pczi/0sCxYfJpOklOy/wUTIwnJPB2IRTYndMIu1111QIN2uG6jG
         ken/8Rs2EAp5ciHEKPWzrQerlOPEcAHPN66S0XKehJe+zViDDYRJNarx4ISJwz/BmF+s
         6ZQnkngMZTqSHfh7CSxd4O1xm1Orb39LoltLBeHtS5NkhMQv2j71eedXYI40OFs8CMhx
         FVjhowNe71iUY239gcMveTRQGe2Y+OoUXIwsSd9nNegBgYgcwosc6bzauzx9CEMNBWFh
         bwiQ==
X-Forwarded-Encrypted: i=1; AJvYcCViJChamqVHEyQ0yF0zkv10FJKf1h7aWUMxOMwCgqSQV38R1EMofE8X2Hw+QjRQ5TUI9VDv3ncX/8HTmhxI@lists.linux.dev
X-Gm-Message-State: AOJu0YxuAReh5OeR0EuatF7kV7dB3DJFoZBmicjo1CPYighFKgKEFXI3
	7thWfhLmbWJOM0RX/HS97yVPE/8qhxDGwcsNloobu9KVdwvAJ7p1u7bI1x3oblDjWIeK3068oVw
	m2n2+ONhll5rHDjKdB96hU6E/j+wJyBpWOjpnsDhz
X-Gm-Gg: ASbGncuq9oVS6P6I8KMlKPdRNKO5xsBw+crn/y4NFTtK4M+Y3e1lwPu1HHn86ix91Tx
	8k5afgFMPyg4c/gIXzf3Qt9jN9WSRLWnIante0zaZhnj0f3x4A+4tG0yLd3GFuptxm2faK9CCrO
	3Fu8hASQJa7yZ7Bql5xGmpNfSMZmpwfLdxeb+J4FW4ea9U9qszmnVbl0OIPSy0YQ//Z6Es/hiZK
	rsREgRZzNs5JH6KOtmzF35h5zHs8/fmml3Iq18GWkxemIRG3Tw79OlVJiSdCMyQ05F/2w==
X-Google-Smtp-Source: AGHT+IEwPIhiknra0CXPiFnVyqZAHRThMZsJsztbTCo4AfutieyYvGR3bpwXMchvz+kxSR4Q3Mnt+sZgr0hoy96Q86E=
X-Received: by 2002:a05:6214:c84:b0:87c:a721:42f1 with SMTP id
 6a1803df08f44-8847c535a4emr66056936d6.52.1763797052760; Fri, 21 Nov 2025
 23:37:32 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202511210649.lhQnt194-lkp@intel.com> <aSAriWs68Hlng-nS@google.com>
 <CANiq72mzcvFrTXkgqcJVVrmSy-Z=69oz31KxuQicinmaodCyBQ@mail.gmail.com>
In-Reply-To: <CANiq72mzcvFrTXkgqcJVVrmSy-Z=69oz31KxuQicinmaodCyBQ@mail.gmail.com>
From: David Gow <davidgow@google.com>
Date: Sat, 22 Nov 2025 15:37:20 +0800
X-Gm-Features: AWmQ_bkowa1YrvmpJ0yRoKpk1URLnjI6MEucWtYOXgHxKfz0TJsKMQ2PLm0k-k4
Message-ID: <CABVgOSn7bkTY=H_xOXWUjaN3xcenoKnEj7zd1=C0UKwBQBSMDg@mail.gmail.com>
Subject: Re: [linux-next:master 2964/10599] error[E0609]: no field `dev` on
 type `drm_gem_object`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, kernel test robot <lkp@intel.com>, Lyude Paul <lyude@redhat.com>, 
	llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, 
	Johannes Berg <johannes@sipsolutions.net>, Danilo Krummrich <dakr@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Robin Murphy <robin.murphy@arm.com>, Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 21 Nov 2025 at 23:26, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Fri, Nov 21, 2025 at 10:06=E2=80=AFAM Alice Ryhl <aliceryhl@google.com=
> wrote:
> >
> > Perhaps this config is just not working in general?
>
> For context (copying myself from another recent thread):
>
>     x86_64, arm64 and riscv64 should be kept working, and I also
>     build-test loongarch64, including for stable kernels.
>
>     arm32 and UML are the ones that are best-effort (on my side at least)
>     so we play catch up as time allows, but loongarch64 so far should
>     always build and it would be sad to drop that.
>

The short answer for UML is that 64-bit should be working (though
unless it breaks the KUnit configs, it's very much best-effort), and
32-bit is much more likely to break. A lot of that is due to general
32-bit issues which probably affect arm32 as well, but there
definitely could be some UML-specific ones as well.

The issue you're seeing with the Atomic{U,I}64 types, though, has a
fix which should land in 6.19:
https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git/commit/?id=3Df7=
4cf399e02e24c544b0bd4b1fe8fa2c5ae30b18


> Relatedly, on my tests, I have also been seeing in UML:
>
>    RUSTC L rust/kernel.o - due to target missing
> error[E0425]: cannot find function `dma_set_mask` in crate `bindings`
>      --> rust/kernel/dma.rs:47:38
>       |
>    47 |         to_result(unsafe {
> bindings::dma_set_mask(self.as_ref().as_raw(), mask.value()) })
>       |                                      ^^^^^^^^^^^^ help: a
> function with a similar name exists: `xa_set_mark`
>       |
>      ::: /__w/quick/quick/linux/rust/bindings/bindings_generated.rs:24761=
:5
>       |
> 24761 |     pub fn xa_set_mark(arg1: *mut xarray, index: ffi::c_ulong,
> arg2: xa_mark_t);
>       |     -------------------------------------------------------------=
---------------
> similarly named function `xa_set_mark` defined here
>
> error[E0425]: cannot find function `dma_set_coherent_mask` in crate `bind=
ings`
>      --> rust/kernel/dma.rs:64:38
>       |
>    64 |         to_result(unsafe {
> bindings::dma_set_coherent_mask(self.as_ref().as_raw(), mask.value())
> })
>       |                                      ^^^^^^^^^^^^^^^^^^^^^
> help: a function with a similar name exists: `dma_coherent_ok`
>       |
>      ::: /__w/quick/quick/linux/rust/bindings/bindings_generated.rs:51489=
:5
>       |
> 51489 |     pub fn dma_coherent_ok(dev: *mut device, phys:
> phys_addr_t, size: usize) -> bool_;
>       |     -------------------------------------------------------------=
---------------------
> similarly named function `dma_coherent_ok` defined here
>
> error[E0425]: cannot find function `dma_map_sgtable` in crate `bindings`
>     --> rust/kernel/scatterlist.rs:212:23
>      |
>  212 |               bindings::dma_map_sgtable(dev.as_raw(),
> sgt.as_ptr(), dir.into(), 0)
>      |                         ^^^^^^^^^^^^^^^ help: a function with a
> similar name exists: `dma_unmap_sgtable`
>      |
>     ::: /__w/quick/quick/linux/rust/bindings/bindings_helpers_generated.r=
s:1339:5
>      |
> 1339 | /     pub fn dma_unmap_sgtable(
> 1340 | |         dev: *mut device,
> 1341 | |         sgt: *mut sg_table,
> 1342 | |         dir: dma_data_direction,
> 1343 | |         attrs: ffi::c_ulong,
> 1344 | |     );
>      | |______- similarly named function `dma_unmap_sgtable` defined here
>
> error[E0425]: cannot find function `dma_max_mapping_size` in crate `bindi=
ngs`
>    --> rust/kernel/scatterlist.rs:356:52
>     |
> 356 |         let max_segment =3D match unsafe {
> bindings::dma_max_mapping_size(dev.as_raw()) } {
>     |
> ^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
>
> Cc'ing David amd UML maintainers and Rust DMA team so that they are aware=
.

Hmm... this is interesting. There have been a bunch of issues from the
last ~day or so on UML which seem to come from things which are
missing in bindgen bindings, including some KUnit struct members, and
some to do with `vmap` members in DRM structs. The latter is a
somewhat nasty incompatibility with a hack to avoid conflicts with
libpcap on UML, but I'm yet to reproduce the others (including this
DMA one you mention).

Certainly, I can see dma_set_mask and dma_max_mapping_size in
`bindings` here, so I don't know why they'd be missing.

Cheers,
-- David
