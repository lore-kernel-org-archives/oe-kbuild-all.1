Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 974DE28AAEC
	for <oe-kbuild-all@lists.linux.dev>; Wed,  7 May 2025 15:39:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746632353; cv=none; b=cabSJTZnPzakucTHt3qWo2QB20QzE25MYnm4801Jjj6XlnHNpzaft8VZEgS2teha9oVavDOuom56dE4Y3jTWirDQw1p6hX+uDmvOIF2lsIjvt5uJnbUdovgXnTN0TzMAEs1RxZo0msKLji9gAa4NYoE6oAAqiKaeIOFzDHp2mks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746632353; c=relaxed/simple;
	bh=DE15O3alvMb0eifNrXlvhXfeB78p4PzWbvy+7QY8GN4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=a24xGNCy/LDZfuaTH18T2QPP5kbDI0NNxUHsqQbmYnnxnibu/D9u+pqTlPfukzrb0tNX1q6Rq2/57K24HQQisTtKbutUteZrLDCghycKwGX/J7nW2/PLsoaHthzs2105n8WHONmNuXNKDNSWlcXTQcRtcJLr3pJkAOmyc2MZP+g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtQWnOau; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtQWnOau"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-30f30200b51so72297721fa.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 07 May 2025 08:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1746632349; x=1747237149; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=+1kdy2Z1F/GzQcWzO+CXpY+tVajh37/iNgKKaLXmnJo=;
        b=dtQWnOauB9EhYqbu4CFwLbW3MtVtCK0shQcKerTZj6oeybbUChGTsezfxaSY88UiWy
         ZHbqaBXWIwl5b+u0cDvD8ID0CUDr028uqgbBrH8FfDohOj+fV+OKA9SsU3R57hKtShTw
         QqRXK/NzfoMBJeH2TnwSkdV/1SH1y8nwsjrWVGkPPl35LthRLKZGldwVfuKZBGZKiiQS
         dZBJOHVUA6G9vyrz+JIhcf+Mg3HLpucGV1BzeXuh9dMpReZNH1c8sifQUJ50byYSkmFq
         4nxyTDBYKAU9/ZfHdqTPVDY9r4hOeh7bvY18oGKL2cKsv7pZtktyDpyBLjIqTbzaCIPR
         GDJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746632349; x=1747237149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+1kdy2Z1F/GzQcWzO+CXpY+tVajh37/iNgKKaLXmnJo=;
        b=UuMnH42Eeu0G3nB7WmW58E9hUCQikRL7e4JucuF1hZMGLPAprwyDhhWX9Sp8eGy7s+
         tl9OSNMdQ7NBhe2+JvAoRoQTG/11uK5iE4DI4EvHmy0wEkNdvYfYpr4DsGSey9KQI7+4
         xAvDO/99N9z7KOfRjkGX4yCE7an1ShsOo0tIfxDZFKHMDhWmscH8x773Db6rO4EXZm7a
         lWsLmz/qUqSM1ujElOtgZiAfdEnPwsuIM17YtqcYVxAsPRm9XbKgHXxALcvAYRN/ryGs
         yPwDi4Xo3idib/Sexvhc3sSs68PD62SyQTLmtdHOXUdyKKlyrTL97IXNbQr3JR4PRvyD
         KuqQ==
X-Gm-Message-State: AOJu0Yy6D5It18cSHxIq93pW8IzrXp2pAMGa4JOfI6MP5hnVvhDxGw2A
	Cy7xqG+TQJ7wjJYtf3i5B+3Vle11Eif6OPMr6j4F3/QqeqTdAavrfW8DMCrR8RpLK13m/uLo0oe
	3KgJ+oq2fbWojJTzpaSnBSIgml9w=
X-Gm-Gg: ASbGncuLYB7BGcLLKyWWnY4Iw6rH74VVUqswZJFVPdCWEnPAVHFRU2u+eZivuj0nHpG
	kaXa0krYNbRGnHIVkFq9d4g+kcXQ2lOLwrs7ciPm9v3pdz9UrVzBzKN7jR+SWZgq/9qhKkqXBXX
	aH66bi+czQCnPd/PfcJWhLkr274H03ZJbpFwfxn8/DbUy+lrYosZJ0sS0=
X-Google-Smtp-Source: AGHT+IG6EkCfAhIVVwTaHUJ7pjv5njYRdNHcx1Ze0bBuB0PTorch/aQpS/448HufWgV9/eeqKWk0AT8UwWBvxDqOFrU=
X-Received: by 2002:a05:651c:19a8:b0:30d:e104:9ad1 with SMTP id
 38308e7fff4ca-326ad36d991mr13728641fa.38.1746632348308; Wed, 07 May 2025
 08:39:08 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202505071347.5qXsnO7G-lkp@intel.com>
In-Reply-To: <202505071347.5qXsnO7G-lkp@intel.com>
From: Tamir Duberstein <tamird@gmail.com>
Date: Wed, 7 May 2025 11:38:31 -0400
X-Gm-Features: ATxdqUESX7-N-uhSL1bmdA-nnhdQfpoppCeSiWHs9Ru6NAQcnjfkywY_VFIPK7g
Message-ID: <CAJ-ks9kM5KNoXcPEc_CwNZQhBg_5d5q_551q1GBBYbcd+KvwEw@mail.gmail.com>
Subject: Re: [tj-wq:tmp2 1/2] error[E0308]: mismatched types
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, Tejun Heo <tj@kernel.org>, 
	Benno Lossin <benno.lossin@proton.me>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, May 7, 2025 at 2:07=E2=80=AFAM kernel test robot <lkp@intel.com> wr=
ote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tj/wq.git tmp2
> head:   2762750ac5c6395dfa69b2cf1e3208fe6ae45cd5
> commit: 345e029b561e03c4647b3d5b6603f40745a2ac92 [1/2] rust: workqueue: r=
emove HasWork::OFFSET
> config: riscv-randconfig-r072-20250428 (https://download.01.org/0day-ci/a=
rchive/20250507/202505071347.5qXsnO7G-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f=
819f46284f2a79790038e1f6649172789734ae8)
> rustc: rustc 1.78.0 (9b00956e5 2024-04-29)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250507/202505071347.5qXsnO7G-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202505071347.5qXsnO7G-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
>    ***
>    *** Rust bindings generator 'bindgen' < 0.69.5 together with libclang =
>=3D 19.1
>    *** may not work due to a bug (https://github.com/rust-lang/rust-bindg=
en/pull/2824),
>    *** unless patched (like Debian's).
>    ***   Your bindgen version:  0.65.1
>    ***   Your libclang version: 21.0.0
>    ***
>    ***
>    *** Please see Documentation/rust/quick-start.rst for details
>    *** on how to set up the Rust support.
>    ***
> >> error[E0308]: mismatched types
>    --> rust/kernel/lib.rs:204:9
>    |
>    204 |           ptr.sub(offset) as *const $type
>    |           ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ types differ in mutability
>    |
>    ::: rust/kernel/workqueue.rs:495:18
>    |
>    495 |               ) -> *mut Self {
>    |                    --------- expected `*mut ClosureWork<T>` because =
of return type
>    ...
>    505 | / impl_has_work! {
>    506 | |     impl{T} HasWork<Self> for ClosureWork<T> { self.work }
>    507 | | }
>    | |_- in this macro invocation
>    |
>    =3D note: expected raw pointer `*mut ClosureWork<T>`
>    found raw pointer `*const ClosureWork<T>`
>    =3D note: this error originates in the macro `$crate::container_of` wh=
ich comes from the expansion of the macro `impl_has_work` (in Nightly build=
s, run with -Z macro-backtrace for more info)
>
> --
> 0-DAY CI Kernel Test Service
> https://github.com/intel/lkp-tests/wiki

This is caused by the absence of the prerequisite patch, as discussed
in https://lore.kernel.org/all/CAJ-ks9k2FEfL4SWw3ThhhozAeHB=3DUe9-_1pxb9XVP=
RR2E1Z+SQ@mail.gmail.com/.
