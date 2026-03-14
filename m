Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A82C22689C
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Mar 2026 11:15:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773486946; cv=pass; b=KswTuvwdeD6r9l8sGGngOPAxpjhnC+VeLF+IVl92pE9rZ78EckTgnzaaammxT4/rQLJWVFX8NBr05mo2R8XxuaU1v8Of1BYzOPwjL+PyfUd8rix7HgsXWFxaP7sRlUcGp6tlyFLlF7ot8LzSh5YsfpRxBGbsTFwh3qUR5LgDfbw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773486946; c=relaxed/simple;
	bh=zcMk2juHKP2RohK/1BK8E8XwH+Ave8HercTkx4NfKUI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GogbVAnd3GjZNYpo2g6+TPYgVkLRFRmlLSiRMQcsSCLEXm1vqEpEq7eyUo6u7fPXHvTniln3mWpgAVU/57tVCwWOu0KfJTZtaBTEqxJkDLh/30eetIpoUuSkZngyWkRp/GyhgpDEfJMtYYND49lqysVwBpXwIkqQe+JLp+lozPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=GrPbZxyR; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="GrPbZxyR"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439b78b638eso3194895f8f.2
        for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Mar 2026 04:15:44 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773486943; cv=none;
        d=google.com; s=arc-20240605;
        b=PsWCOxtbbmmOXrJ0ujU40M0Xrr5CYEWhcQB8b4iGYPLxeKZzLHTjd7LeLX4GMesC00
         b7/LkWoUb4EvbixwyuNjXBY0CRyH4Tdl+7YgEEZhmbRXYCDtfwEkDYrnXGIPqz0hiB2+
         PdP527Nlzn16tZ8o2JbSMoRirW2yWEx6FnkkxfUBhLB5Q9QyVfZVfuNr1BohbS8K08si
         SVtbC2RRTpfkCPHMbtDZvDsjyd4SjjidRFFUpA/JX65gq4FVOL5QEbIltve3R4cpUYoI
         RUfRDe+QiMpU3Ncys43JOYIVyFDMqL7LJTJ133NpNt8b8oqqEg3On1BFqwXYBETwzBlB
         xRCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zcMk2juHKP2RohK/1BK8E8XwH+Ave8HercTkx4NfKUI=;
        fh=lEq+N0vBDPMkJO0fAXJ1OojasPUTT8indru1CbC6C7g=;
        b=FNNlzLYywOIomrV89nDqJxAKRF3az2PA4pW4Qmw6sHIRLWMEwQLm3LHpv9q4F8O857
         8W+0aWJaCHRUzUMz4lfothDQNAuV6py0Bg7Ot67jZoH5/58ODmEIlvFP1y2++n64SHWu
         Kj0DNh++DRlnK8s/d4OisG+pp7hGjp5FAu+5OGelGfu0JS71YjygqmEhGcM1tyFhz/Fw
         ALDFYlNuqFpTyit9RgX1KBHJ17N4JQLJunIpzIcthXi+3JO9uYU+PCQpvqDzjSMDMwhq
         NmSSpNPCl2DAR0HYZwxRirMWKaTJXCu1PUT2kdV/+4xhJxjr1Zy5C+DOzKtsZdkJfVqL
         8PiQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773486943; x=1774091743; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zcMk2juHKP2RohK/1BK8E8XwH+Ave8HercTkx4NfKUI=;
        b=GrPbZxyRrBJHLots6+Mx+g3PfAWZuHtk72o3FXD0syDU59+b50Hr7/fSqv73jGaF0R
         PGFpk187neOMsAxMcVyhCoJZIEjKlkeneouQfLSfXiwLrtrrnXQVFtNfW6lIFyqzNa7n
         sQGDzrNfEvNhxLRqCdi7CJkzY4J3uAfVm7YKU1DnyBjMt6RSwKeZf/BR/9ulwWytDtoq
         MVctddAr8cChV8da7pzuLrEOOoydeNCt/EuN8nBrTDv+8Sy8U9cPiSPTxEK01SbDKOGm
         OWBpdEtdSrNNcuB/77bktUFa1Gn1PvYde/kVUGWc9JYl05n1L2O2kfJiq8ye1wPfZF3h
         5K8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773486943; x=1774091743;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zcMk2juHKP2RohK/1BK8E8XwH+Ave8HercTkx4NfKUI=;
        b=gYd289aMR0Nk8sfnd2SJ6Vu88ipOCP+ZkxQxWCiYjPrKJTdLMl/FKZe2Ct1WC6prnp
         F9HNFl0eXexyQGQW669NEgDg2rhPwZW6/cERAsvvAOblezRs8ltARkejOvn9WeAcPmpW
         dmspiet1Vh0Eney9LXrp7wd6mDxas6Rfmhe1Lg2FfVCbuAxHB5pAVJMvHOaa0oi+v+rX
         MW/dKX0R5jAtBERRXE3anaJnKqvjM41iUvk5/w5pD/oJI0USI4tJB1CogabnTiUdiwoz
         qdZujjrgYqwp0zw3hofyOxJD6IN2ri/mzo5TsVcY2RQUxKdmT7s5UttHUDiFXjqLXrJ/
         JixA==
X-Forwarded-Encrypted: i=1; AJvYcCW8WpNYrSjn5Lu6yqtxcpgF0XrcTlpcjAi5TxUO3xMLYW6iwrAxDJyeXLzhFQeKJMhZBt3ly7H5GQy4jE3F@lists.linux.dev
X-Gm-Message-State: AOJu0YwjFk7c3eK9ilbAefH2mOcO7i1sd8qjGxN0W/xmBlvONVGqWV80
	Ztbr4TstEv4TTARwyG9UlvAHd2G47jcYuIhHpFTDnJ4sp5urYNYrBUhU18W2G0FL+HNST9WQTf1
	W9ey1/MHUYT7ZTc+4jyDPYv6FJAmll7Iu+DqASx9/
X-Gm-Gg: ATEYQzzjidUQ+XHhCx5Q03B5gVy2wlrLxh55IL40taB1bQIdYPZm2zGXfuVUqwpW/RT
	O8v/OHGT05FfitiLuILJEqQg+IektQge6FW5aA+fMz7v0lB1QgRACB7lcTkF8cjXqWY17Cng3NJ
	nSQdode31HJO5CMKvFXovRjvVlnMm1Q/RkeCLdsUSYLKqTV0YKhAE5vGwaAL0d/vihzP3cZUIbs
	+PfvdcanF+KnZPXK0exfBXja4/7OMXaZsLnoFgRAqwSu1+6+8lnnNijx2DCeKJtLifm2R1Xj3q6
	qSIuNu6hjfo+BsyyzPuHdqzXns0seZp5d1s9mA==
X-Received: by 2002:a05:6000:1ac8:b0:439:bc79:9f8f with SMTP id
 ffacd0b85a97d-43a04d14d83mr12829860f8f.0.1773486942418; Sat, 14 Mar 2026
 04:15:42 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603121235.tpnRxFKO-lkp@intel.com> <20260313213638.GA147391@ax162>
 <CANiq72mzEzjNg7O_2dWT_6QOJvJ3TwV+HyxNd_F4j6v9C+pc7A@mail.gmail.com> <2026031422-catsup-rectal-f886@gregkh>
In-Reply-To: <2026031422-catsup-rectal-f886@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 14 Mar 2026 12:15:30 +0100
X-Gm-Features: AaiRm51ckUfgkRssBsogIj0VIQkDe2Z-Te-pFSaEkqjwee_TzN5cwYkr8WTmMWw
Message-ID: <CAH5fLgixE9MGXxNEnU5b0EXdgLQoTs5CMv_0OdnfCX3v=coUpw@mail.gmail.com>
Subject: Re: [linux-next:master 5585/5731] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, kernel test robot <lkp@intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Mark Brown <broonie@kernel.org>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 12:13=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Fri, Mar 13, 2026 at 11:39:14PM +0100, Miguel Ojeda wrote:
> > On Fri, Mar 13, 2026 at 10:36=E2=80=AFPM Nathan Chancellor <nathan@kern=
el.org> wrote:
> > >
> > > It looks like this is a conflict between Alice's "rust_binder: check =
ownership
> > > before using vma" [1] (currently in char-misc-linus [2]) and Mike's
> > > "userfaultfd: introduce vm_uffd_ops" [3] (currently in mm-unstable [4=
]),
> > > hence why it was bisected to the -next merge commit.
> >
> > Thanks Nathan, yeah, adding a raw pointer (not function pointer) to
> > the struct makes the type `!Sync` in Rust.
> >
> > I assume this is best handled with a patch on top of char-misc-linus.
> > Perhaps creating a wrapper to assert it is `Sync`, since the
> > `BINDER_VM_OPS` contents are unused (so far).
> >
> > Cc'ing more folks related to the commit.
>
> char-misc-linus should get merged into Linus's tree "soon" and then we
> can fix up the mm-unstable change for this.

I'm working on the fix as we speak. It would be ideal if it went into
char-misc-linus, because the commit that is wrong is mine, not the one
in mm.

Alice
