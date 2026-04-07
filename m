Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DA5037DE9A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  7 Apr 2026 22:05:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775599535; cv=pass; b=HqtvE+hJAgG2+kD9qSnKkN1euH/mlP/1PvfDq4YSFtLxOrC56OiYtRkxeEsG9ERuEyQLYe41eYqMNRYINuc9mANJ36PXZ7dXcX7eFGDp32ixY7/thj9ZVfSZlN3iqeZBN2D6tdJ2vZqivvEjuLdRMx10jjE96PU7hD27J+orUKE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775599535; c=relaxed/simple;
	bh=iLatwWqBYFmxk9mYv2vpAYMFlXcmULXHBcnERT3qdlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QqUkhgZ6uIGzb9Pse0f7cxteB6FHQbSWjteDLhVypVrDfhOjxSrjbKVDlVDyLwraql2aDmhRlJ4JZCBS4DGI5OGPswwUQbrQVqrCC/AN8cwa9v+ZwacTPhnjKDSTRde2hPqBOj5Gg6vUXjLt6PILGqy1V5durt3X3OLfqlaV4JY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Th0vJSFk; arc=pass smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Th0vJSFk"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-43cfce3a195so3423515f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 07 Apr 2026 15:05:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775599533; cv=none;
        d=google.com; s=arc-20240605;
        b=XEV6bm4gRZ0+bhOpxFHnyraAptO43wsvk2TnCwpcjJstaXoLLam3ouXp6YY7UERVtu
         ZGrsCIgDwstaFYP47tKA2D3GT6To5UCvP6njopcGH8wCFZ8jzKJqzOs0vwNoHXz4QJCX
         MW/XNOTUmmnYZXQuEakLmrKVeHWEOh1YMlVfv7p8NQzrzJ/0Yqg2zfOxzubnHXspPcXe
         WnsxL5HchMCP2fFrD2Y5A97tyeICLDenflo8h9MsnvAR2qKHJIboe/tsq60FjQmneSuh
         x2MJ4OWKYaSDf0F7PpmT/0YAgoQ2zJ0AUaZNjpEsYtv4cfUxogUBBBKFI8PdvoR/xTTO
         DG9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=MG6irsax2dWjsgBAdF5tVJt+HiAYcnDKOtc9l26Py+M=;
        fh=SWna85ahfbUMp8mqm6vp068sE6R/HB2MznraAjS2Gfc=;
        b=iqV1HIo5ouL2PHLHgdmHvEUxDAaxNiwveTyrnvPCaeB+V51LeEny2LbcTEvUbWTpc1
         ugoCmbV9G4wKttZr921svSSTAGpztB8OlYB3tOMSwraH9Vqhur6BNoURPZlzoMYMnok8
         5Eg76YL/owteJpEEsFKolUDbVSED0UXnc+fUgy2/WvZ+pWvM5hIT9ACD/Gg+M29SycSV
         ljzGin8LUr9Ou/5Y8jL452HvfvcR0rkqRic5wQtWbiHVTxZKFOCkcc8mtU0owXN96Npd
         NCn1rceRR7cywsq8vCYx0SuYApIkL/tJfpbNgdullpD83zfYapNoYne0SsYr+/3TygoR
         l9Ig==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775599533; x=1776204333; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MG6irsax2dWjsgBAdF5tVJt+HiAYcnDKOtc9l26Py+M=;
        b=Th0vJSFkvxBL17k1p1kFXlN7RzQVjKkJP7PCRgB3gd8UwYmFvAkQH9wGJhCjNAxsq5
         rCS8z7wjvORr8O0IGqrOgo3uDLURn+tm3334cSGFoHzqzRB0n7vdc1Ea9jtVCohZWcPF
         iWgm8Qv6+UrGObphpgQuEIkBHPzxej/PskHx1LoqnNwMd4moeQkK+hKPRwaHLbdBJA3w
         U1L+s2ek9XfI0spV7rP4jH4ZDrAUhaZ5DL4Y4A1eG/CqpisBXH2twU1YIxdaVkpaQan9
         scQ9AtvUaprbysHFCcEUe5Cl5nJpjdj9mqFL3WUtWgzlsKTASR8/jmWJ7kCqqDJyRr60
         5KjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775599533; x=1776204333;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MG6irsax2dWjsgBAdF5tVJt+HiAYcnDKOtc9l26Py+M=;
        b=Z7/5QpQAKo2+Wkm4u2yFy370XFGUIOliULiL1U10XqmlUPHAw9llYnDRmGhZp7YrkB
         MFx67dd+KMAc3N6vlE0YzHP3C3t+gCFxTmBL7J/s2efTo909QA7lMZw4Ssn/B3xY1Cxy
         oDkkCp0H5qqf/yREqF1eEJ1B/y9eLU1D9wmGqCjDaYu2MuclO5yNxfV1KxkVCCtBgNww
         Tqf0GMOQppU/90WjYv4/cR0CfkB8f+R4LWkvNpW3aumf9dLN6HhthPXDzqETkTsGPNVe
         XsXwrJj+BeEccoHKipmPsbTu4VT4MEWyDKSZ5KAjHsI7lzpL+5wJWStRJMRVFSfpcTSt
         DbMg==
X-Forwarded-Encrypted: i=1; AJvYcCWjHIGFdFkxooqyQRUszvQ2niimYE2QAphjw5uZe/PARhPWeo3f2s+c2WNcPRT61DvMG9P95jzUv29INhWB@lists.linux.dev
X-Gm-Message-State: AOJu0Yx8XKpWp6WFxHmub7PR7Dn2y5uo9ysX8fbuRs/MfMXRMvKnxHZV
	EUCn4xQIQ0crVvF9MB4zPDpEifjQ8nb5zSvlojJNOFQI0DB8nupelC3+1ihQki2LNWGi15hjJC/
	0i2DuUJUJZFvX6ZilR9DkJRH6ICB37jvtJjd9Tw5X
X-Gm-Gg: AeBDievEC9ilCCepB+/79rNgubIJEqhZ+IMuN4meRLF8c+T1uoRrQ8LdZd83ZAsVhIA
	n2cO9r+v44AXglqyDpHhRiOrXq7Ng04PX6XjJL5UCs91ZuWeFoQDg9KTcgBFabb8fWLlTnZ/p1G
	brTVYNg90S961goNQHVqKHvliCr4dZ98gr6LiDjNxgUFdUwq5DL1PI2FdHEkp4TyWmbI/Yi4dZG
	Vts4LNOC7sIUAD+yukJJxLcQTDmN1s6P99f/quj4LWnbE2RnBNGUzwAwXPtlVt4geliriQBj8vj
	+A1bB6FUB7OlCAjy6mLXFidJFq9WyXCXCYPPjTLsNlx22D1l
X-Received: by 2002:a05:6000:22c8:b0:439:a95b:3c43 with SMTP id
 ffacd0b85a97d-43d292c6b32mr27982031f8f.21.1775599532335; Tue, 07 Apr 2026
 15:05:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604071509.y5vLetYd-lkp@intel.com> <20260407145902.057044dc19e7313b21418ff4@linux-foundation.org>
In-Reply-To: <20260407145902.057044dc19e7313b21418ff4@linux-foundation.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 8 Apr 2026 00:05:20 +0200
X-Gm-Features: AQROBzBS8AAmv7_Gd4m6Vdm8r3Fj8wyDr1G_Q3blKHwyOYaH046KJHSKTcfAdPg
Message-ID: <CAH5fLgjuFLXRgiHD27ErSRgxu7-uzqjf8z3H9Bj0=xKSaCHW_Q@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 113/133] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, "Mike Rapoport (Microsoft)" <rppt@kernel.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, David Hildenbrand <david@kernel.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2026 at 11:59=E2=80=AFPM Andrew Morton <akpm@linux-foundatio=
n.org> wrote:
>
> On Tue, 07 Apr 2026 15:58:09 +0800 kernel test robot <lkp@intel.com> wrot=
e:
>
> > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-=
unstable
> > head:   3fa44141e0bbd5062f2ef0c5cdddd98275d3223e
> > commit: 694fc0bd3ca5420f4e1105d2dec02327cfc5d64b [113/133] userfaultfd:=
 introduce vm_uffd_ops
> > config: x86_64-randconfig-074-20260407 (https://download.01.org/0day-ci=
/archive/20260407/202604071509.y5vLetYd-lkp@intel.com/config)
> > compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87=
f0227cb60147a26a1eeb4fb06e3b505e9c7261)
> > rustc: rustc 1.88.0 (6b00bc388 2025-06-23)
> > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/arc=
hive/20260407/202604071509.y5vLetYd-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new ve=
rsion of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202604071509.y5vLetYd-l=
kp@intel.com/
>
> Various forms of "userfaultfd: introduce vm_uffd_ops" have been in
> mm.git since March 6.  Thanks (much), but is it possible to get more
> timely notifications?
>
> > All errors (new ones prefixed by >>):
> >
> > >> error[E0277]: `*const kernel::bindings::vm_uffd_ops` cannot be share=
d between threads safely
> >    --> drivers/android/binder/page_range.rs:146:23
> >    |
> >    146   | static BINDER_VM_OPS: bindings::vm_operations_struct =3D pin=
_init::zeroed();
> >    |                       ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^ `*const kerne=
l::bindings::vm_uffd_ops` cannot be shared between threads safely
> >    |
> >    =3D help: within `kernel::bindings::vm_operations_struct`, the trait=
 `Sync` is not implemented for `*const kernel::bindings::vm_uffd_ops`
> >    note: required because it appears within the type `kernel::bindings:=
:vm_operations_struct`
> >    --> rust/bindings/bindings_generated.rs:74703:12
> >    |
> >    74703 | pub struct vm_operations_struct {
> >    |            ^^^^^^^^^^^^^^^^^^^^
> >    =3D note: shared static variables must have a type that implements `=
Sync`
>
> We've seen this one before.  Sorry, I'm (still) not set up for
> build-testing rusty things and I suspect I'm not the only one.
>
> Alice, Miguel: please can you help us here?

Hi Andrew,

I introduced this bug in commit 8ef2c15aeae0 ("rust_binder: check
ownership before using vma") and fixed it again in commit ec327abae5ed
("rust_binder: use AssertSync for BINDER_VM_OPS"). This means that the
bug is present from v7.0-rc4 and was fixed as of v7.0-rc7. To avoid
this build failure, the "userfaultfd: introduce vm_uffd_ops" commit
must either be on top of v7.0-rc7, or it must be on a base that does
not include v7.0-rc4.

Alice
