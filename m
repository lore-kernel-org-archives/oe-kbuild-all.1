Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E7238248893
	for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 16:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747066231; cv=none; b=c2AeLKewEqz+x8Ql7JjFDL4gLDeRy/i5KIPxUH5aImUkcPqsQ0NGYybAkGc9ReNFoAhhsxfdWDGRfkrVabjP+T3cU2HdqcyRqZwuZo+Tit7XHy2360YjgLKzjetVhJeciJLvOIJ2gmIchGEvLhI5VU6wywk5awZG3ctD0gu3F+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747066231; c=relaxed/simple;
	bh=z+KMeFxEPd46maozIj9V+Air8T6GZARAjf8u2/JQdYY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gR/ON4bCMGz19mA2C/fvtQ8xHbaJ6j2dtiBkiAAlzXxK4fxOqwkf4sWFD1YpjFe+z7O4QMvzFEO0lPgNzeNIhXBjSeb8NQhEihyHqlPOyfamAQK/7acpk07Jzk7kdyeMqnU7M2v8YQ1/iaLDPP78R0F6pKyh4NNB87y7TCK6ou8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Fs45Gbza; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Fs45Gbza"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7c5b8d13f73so598270185a.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 12 May 2025 09:10:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747066229; x=1747671029; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r3zhCgG3Dyl8jddNlVFV6o/53dnR/dAdq4qYjqQ9y+U=;
        b=Fs45GbzaOnxVl9PtqsTWfxsE0Iq2nJMNpU43s6505JbfKKrUMozMNVT0ZXLbZQ0cSx
         D7eYrHrpZV49DflZGHLvGLnXJw6uEIhyZ4/32ghZhQLDvITtORv3UP7cXSAsxnfcOHKN
         mvtGbfqQwVdQ41fQyBuJwatM44WRT5ba3zDGiq9O/jeTyWXqv/gYLgGYb8FDB3doklEX
         Peum39ws1eTQUb8nDZHeyFq0MmhtESwo6vnjnmrs5ueXquRHk/AXge+gUbKDX2v0NT9v
         j/pgb2gF6Ku+wrdEU1QTKJ52X1o2MjBwh36HgrdmBIL8D5X2i4ZTBHpkOTHe6xqx8l1C
         4AKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747066229; x=1747671029;
        h=in-reply-to:content-disposition:mime-version:references:subject:cc
         :to:from:date:feedback-id:message-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=r3zhCgG3Dyl8jddNlVFV6o/53dnR/dAdq4qYjqQ9y+U=;
        b=KXk4L2s9JVLdsB82ducJQ31mgYAIGGNzq4DzmvEFN7O1IbTgUME1/qiOWAAIQEGTlT
         h1Y2pHWv2xnpaaNHuD6OY5l1XTEAkIj9ySKtLEm2jlWCyb/MVahgVEF4luB6W+qMqfkm
         QSM18rkwkIB1LQJJl3m4MVjHvA19vo3pfg7xazsFxxaVO4hp0ABSQQQY8Bsv17QeZ639
         066DzSluqiACdDhHwP5s1zGNHpUc36TPSPu4XOUKxHEDM22BmZDVL4RC7PD+Zx4VBoNx
         2aaPQg4czbmK81an1oi+K3VsIPo4/ZyENoCDFddOeqN1JY5pAvmZ/69eh3xJakP81sxo
         12yg==
X-Forwarded-Encrypted: i=1; AJvYcCW3vH+pa12eDDiCPaVnrLLqZ41QuRX1Pu4xLL06+Cv9UWFH9X+qeQN1WJ1+ybb5yxxRt5EP7bLOgkbpnAX8@lists.linux.dev
X-Gm-Message-State: AOJu0YzYPKy1PNMD7/9+PRA2tKgRNiA17SN41SkfoT0HZgoOr7nmOK6v
	hXaMdYU3lMMe0xtMn3aarKU/cTgEoGuThvU5j3fZDNDgbhewguXi
X-Gm-Gg: ASbGncum3e8Bo0aIOxNbmSXZRKL8R6ySrITzUEM1ph9oEJdPmm6n3xxTpRKpb+z2yAJ
	bUyA9dqxbG+f9Br52z2/3doRwJNhN9DzE7C7wSADTmDwzy/dLk2f3DKB0LbKfda62AIE9zrXPYu
	e/NSZEHSW9uQXcgORQnlZQrG7nYAz1LSZM5aVCvLFj2GzzOZbPBCUHTGJkaMGJ/m3gN0sZUwT0c
	hepRcN8QAnBBzNNJ6Q8zrdtxWwFvLGG5Mps8JZLTYCiBQFhI2byC9r7SSi8ZXiaZRuFxi++1Dr5
	9PE5pwLufqECLchmRF4HAXOhq2atD4qrZp/8gjt308X7RjmDenIzxJQ0iQVOcibupVt91n0Sc3j
	b2Hc/LzU19nKaD49whx5oklWPrQp/fXcflCGPyFCOcA==
X-Google-Smtp-Source: AGHT+IHkerHNq2nfxQLiPCf0NupvtyGmI2QwczUOEeeNUQne1ODudQ5yFi7yUx7+5/tGhmqtx83Omg==
X-Received: by 2002:a05:620a:2901:b0:7c5:5e9f:eb2d with SMTP id af79cd13be357-7cd01157809mr2216804085a.44.1747066228483;
        Mon, 12 May 2025 09:10:28 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7cd0732a2edsm450757185a.18.2025.05.12.09.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 May 2025 09:10:28 -0700 (PDT)
Message-ID: <68221d74.050a0220.385801.772d@mx.google.com>
X-Google-Original-Message-ID: <aCIdceOwFva2ACq3@winterfell.>
Received: from phl-compute-01.internal (phl-compute-01.phl.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 818CC1200043;
	Mon, 12 May 2025 12:10:27 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Mon, 12 May 2025 12:10:27 -0400
X-ME-Sender: <xms:cx0iaOnQyTJlAd4_sDhi8JsHB-NLhufFwfO4tux-rT-1UXuiYSPlTQ>
    <xme:cx0iaF1lYd6J4PdwC0Oa8_6JxN2yjxBibTuGEW08eCGrQBIZgAIAWuZmD1PF92sEP
    dgD8fVq5Ry0GjQA6Q>
X-ME-Received: <xmr:cx0iaMoOpj8C0II5XDf0n7grzkZcMPHbpmyx_w46eO-H6AcryhFSt7YbXIvaZA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdeftddujedtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeeifeehvefhieffteegueeiheeifedvieef
    udekieeigfffgfekgedvgeeileefteenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpd
    gtrghsthdrrghsnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhf
    rhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvd
    eghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtgho
    mhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpoh
    huthdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphht
    thhopehlkhhpsehinhhtvghlrdgtohhmpdhrtghpthhtoheprghkphhmsehlihhnuhigqd
    hfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtg
    hpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhgpdhrtghpthhtoheprhhushht
    qdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohepoh
    gvqdhksghuihhlugdqrghllheslhhishhtshdrlhhinhhugidruggvvhdprhgtphhtthho
    pegsohhquhhnsehfihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:cx0iaCk0GV7O78L_65UB3jrjefD4OYbUfw9nxg2k8NcVQusTH6uU9Q>
    <xmx:cx0iaM3Pp5WkEgvHZ3DOm6-xOLkF-aY3QEDrpaBk2OjfARpkr53qyw>
    <xmx:cx0iaJtECFWERJ5_QvBmb2wOUwyQjEKPrPeA8OCayD-tHQi-JmQ6aw>
    <xmx:cx0iaIUJqr066FFbFKNeiAuSyaujsXydEl4KtjudQxLv4N8h57UT5w>
    <xmx:cx0iaH1YQKtxDJWUmxXR88rj09j1JEI7U0NZPlK5l1tZeNJk6gqjUG-F>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 12 May 2025 12:10:26 -0400 (EDT)
Date: Mon, 12 May 2025 09:10:25 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: lkp@intel.com, akpm@linux-foundation.org, a.hindborg@kernel.org,
	gary@garyguo.net, linux-mm@kvack.org,
	rust-for-linux@vger.kernel.org, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH] mm: rust: make CONFIG_MMU ifdefs more narrow
References: <202505072116.eSYC8igT-lkp@intel.com>
 <20250508083540.3832900-1-aliceryhl@google.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250508083540.3832900-1-aliceryhl@google.com>

On Thu, May 08, 2025 at 08:35:40AM +0000, Alice Ryhl wrote:
> Currently the entire kernel::mm module is ifdef'd out when CONFIG_MMU=n.
> However, there are some downstream users of the module in
> rust/kernel/task.rs and rust/kernel/miscdevice.rs. Thus, update the cfgs
> so that only MmWithUserAsync is removed with CONFIG_MMU=n.
> 
> The code is moved into a new file, since the #[cfg()] annotation
> otherwise has to be duplicated several times.
> 
> Closes: https://lore.kernel.org/all/202505071753.kldNHYVQ-lkp@intel.com/
> Closes: https://lore.kernel.org/all/202505072116.eSYC8igT-lkp@intel.com/
> Fixes: 3ca414d725d6 ("mm: rust: add abstraction for struct mm_struct")
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

One nit below, but overall it looks good to me, with or without it, feel
free to add:

Reviewed-by: Boqun Feng <boqun.feng@gmail.com>

> ---
>  rust/kernel/mm.rs             | 56 +++--------------------------
>  rust/kernel/mm/mmput_async.rs | 68 +++++++++++++++++++++++++++++++++++
>  2 files changed, 72 insertions(+), 52 deletions(-)
>  create mode 100644 rust/kernel/mm/mmput_async.rs
> 
> diff --git a/rust/kernel/mm.rs b/rust/kernel/mm.rs
> index 615907a0f3b4..43f525c0d16c 100644
> --- a/rust/kernel/mm.rs
> +++ b/rust/kernel/mm.rs
> @@ -10,7 +10,6 @@
>  //! control what happens when userspace reads or writes to that region of memory.
>  //!
>  //! C header: [`include/linux/mm.h`](srctree/include/linux/mm.h)
> -#![cfg(CONFIG_MMU)]
>  
>  use crate::{
>      bindings,
> @@ -21,6 +20,10 @@
>  pub mod virt;
>  use virt::VmaRef;
>  
> +#[cfg(CONFIG_MMU)]
> +pub use mmput_async::MmWithUserAsync;
> +mod mmput_async;
> +
>  /// A wrapper for the kernel's `struct mm_struct`.
>  ///
>  /// This represents the address space of a userspace process, so each process has one `Mm`
> @@ -111,50 +114,6 @@ fn deref(&self) -> &Mm {
>      }
>  }
>  
> -/// A wrapper for the kernel's `struct mm_struct`.
> -///
> -/// This type is identical to `MmWithUser` except that it uses `mmput_async` when dropping a
> -/// refcount. This means that the destructor of `ARef<MmWithUserAsync>` is safe to call in atomic
> -/// context.
> -///
> -/// # Invariants
> -///
> -/// Values of this type are always refcounted using `mmget`. The value of `mm_users` is non-zero.
> -#[repr(transparent)]
> -pub struct MmWithUserAsync {
> -    mm: MmWithUser,
> -}
> -
> -// SAFETY: It is safe to call `mmput_async` on another thread than where `mmget` was called.
> -unsafe impl Send for MmWithUserAsync {}
> -// SAFETY: All methods on `MmWithUserAsync` can be called in parallel from several threads.
> -unsafe impl Sync for MmWithUserAsync {}
> -
> -// SAFETY: By the type invariants, this type is always refcounted.
> -unsafe impl AlwaysRefCounted for MmWithUserAsync {
> -    #[inline]
> -    fn inc_ref(&self) {
> -        // SAFETY: The pointer is valid since self is a reference.
> -        unsafe { bindings::mmget(self.as_raw()) };
> -    }
> -
> -    #[inline]
> -    unsafe fn dec_ref(obj: NonNull<Self>) {
> -        // SAFETY: The caller is giving up their refcount.
> -        unsafe { bindings::mmput_async(obj.cast().as_ptr()) };
> -    }
> -}
> -
> -// Make all `MmWithUser` methods available on `MmWithUserAsync`.
> -impl Deref for MmWithUserAsync {
> -    type Target = MmWithUser;
> -
> -    #[inline]
> -    fn deref(&self) -> &MmWithUser {
> -        &self.mm
> -    }
> -}
> -
>  // These methods are safe to call even if `mm_users` is zero.
>  impl Mm {
>      /// Returns a raw pointer to the inner `mm_struct`.
> @@ -206,13 +165,6 @@ pub unsafe fn from_raw<'a>(ptr: *const bindings::mm_struct) -> &'a MmWithUser {
>          unsafe { &*ptr.cast() }
>      }
>  
> -    /// Use `mmput_async` when dropping this refcount.
> -    #[inline]
> -    pub fn into_mmput_async(me: ARef<MmWithUser>) -> ARef<MmWithUserAsync> {
> -        // SAFETY: The layouts and invariants are compatible.
> -        unsafe { ARef::from_raw(ARef::into_raw(me).cast()) }
> -    }
> -
>      /// Attempt to access a vma using the vma read lock.
>      ///
>      /// This is an optimistic trylock operation, so it may fail if there is contention. In that
> diff --git a/rust/kernel/mm/mmput_async.rs b/rust/kernel/mm/mmput_async.rs
> new file mode 100644
> index 000000000000..9289e05f7a67
> --- /dev/null
> +++ b/rust/kernel/mm/mmput_async.rs
> @@ -0,0 +1,68 @@
> +// SPDX-License-Identifier: GPL-2.0
> +
> +// Copyright (C) 2024 Google LLC.
> +
> +//! Version of `MmWithUser` using `mmput_async`.
> +//!
> +//! This is a separate file from `mm.rs` due to the dependency on `CONFIG_MMU=y`.
> +#![cfg(CONFIG_MMU)]
> +
> +use crate::{
> +    bindings,
> +    mm::MmWithUser,

It's better to use 

	use super::MmWithUser;

here, I think.

Regards,
Boqun


> +    types::{ARef, AlwaysRefCounted},
> +};
> +use core::{ops::Deref, ptr::NonNull};
> +
> +/// A wrapper for the kernel's `struct mm_struct`.
> +///
> +/// This type is identical to `MmWithUser` except that it uses `mmput_async` when dropping a
> +/// refcount. This means that the destructor of `ARef<MmWithUserAsync>` is safe to call in atomic
> +/// context.
> +///
> +/// # Invariants
> +///
> +/// Values of this type are always refcounted using `mmget`. The value of `mm_users` is non-zero.
> +#[repr(transparent)]
> +pub struct MmWithUserAsync {
> +    mm: MmWithUser,
> +}
> +
> +// SAFETY: It is safe to call `mmput_async` on another thread than where `mmget` was called.
> +unsafe impl Send for MmWithUserAsync {}
> +// SAFETY: All methods on `MmWithUserAsync` can be called in parallel from several threads.
> +unsafe impl Sync for MmWithUserAsync {}
> +
> +// SAFETY: By the type invariants, this type is always refcounted.
> +unsafe impl AlwaysRefCounted for MmWithUserAsync {
> +    #[inline]
> +    fn inc_ref(&self) {
> +        // SAFETY: The pointer is valid since self is a reference.
> +        unsafe { bindings::mmget(self.as_raw()) };
> +    }
> +
> +    #[inline]
> +    unsafe fn dec_ref(obj: NonNull<Self>) {
> +        // SAFETY: The caller is giving up their refcount.
> +        unsafe { bindings::mmput_async(obj.cast().as_ptr()) };
> +    }
> +}
> +
> +// Make all `MmWithUser` methods available on `MmWithUserAsync`.
> +impl Deref for MmWithUserAsync {
> +    type Target = MmWithUser;
> +
> +    #[inline]
> +    fn deref(&self) -> &MmWithUser {
> +        &self.mm
> +    }
> +}
> +
> +impl MmWithUser {
> +    /// Use `mmput_async` when dropping this refcount.
> +    #[inline]
> +    pub fn into_mmput_async(me: ARef<MmWithUser>) -> ARef<MmWithUserAsync> {
> +        // SAFETY: The layouts and invariants are compatible.
> +        unsafe { ARef::from_raw(ARef::into_raw(me).cast()) }
> +    }
> +}
> 
> base-commit: 03be7043bbae0380e3e314cde042e4bb5c63b48c
> -- 
> 2.49.0.987.g0cc8ee98dc-goog
> 
