Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 722CB3E4C71
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 13:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774962301; cv=pass; b=V91Wck3Eru9GqGWZdgoKsQh2a4ix86tt9ac1pgFat08W81im/ngZFCAV9tzTBHKTWDs+RJYySEBd6/Z2Wz/+P+UOwHVFEd37sWECKMzu2FcHk3aJbMtmLmFeTC558kNa6rsSX+ihWVplsVCNMQr6JFkekEMAtXbp8ymFsx+zoMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774962301; c=relaxed/simple;
	bh=EXe6ByVFgqHK9ot4yGzQ91DO+cEJ7cxXfss2LYdxr0o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L0JcUu7/XNPqN1iCLyhydexGlwOePFDDaAM1V40q/11zR/rLXkwHL3Z8B8Wq0bBJklJOzpzqimGWzbAPud+z/VBSfVOX+ktNVIy0DkDnxty8inoTaIEqsDWRtKiNb57yPQtsdilAZcBp5Ecv3xqTPzMjf7dcRfWwBzonValagdU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=p9GWVbMT; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="p9GWVbMT"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-48700b1ba53so52005555e9.1
        for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 06:04:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774962296; cv=none;
        d=google.com; s=arc-20240605;
        b=Y2PmIbsk8eu4kEoQGH/uNemJED+h3qT8srjJrA265Oo9AYSZLReQ2RYZO/naLJ5SeO
         OrHnveJmY9vO6AtZTSyOCT21mAfcRN3DIP0K20exruoArFVgZQ97waeCsfT4nt8HWf5g
         MkbawlBPfS0zPEV7mLxp7nEcCbj+BCci734D3DpGGXfauPG6jB0v7wj2Cfjxo5DP5Ofz
         k8z4Qt3RmYz25/NeWE3+aCCFOfDMmklqDO1yvaVd8GHR4SnOANr2aMMul3+HiMnnGf9M
         YuuHAazfyHEnzEThu5nIDhcmROMM+aLRKIIos/3nenbO4LN6DhksGb3tAMX9CXTeK5iD
         YOEQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=EXe6ByVFgqHK9ot4yGzQ91DO+cEJ7cxXfss2LYdxr0o=;
        fh=z/+jPtvEqJnd7LkH6rH9lNZro2fwrV191V9dVC3hT0s=;
        b=U2lD6CvRCsfyjQS3I9H4nnEC/8O+708jim4XN1r3jPEDm9QRlbUGxzSniX2zyjy5//
         uZMN+AMRX/7jsfs8hpTMcFZPZRc9wghCeej3QH3xHggsEgpS7sxz8PuCYOjdjHaXU7ti
         hLru3s1elW46kvnzgIxJq2Jl6/ThyVrwx1X76GRUwJg9fRQt4u8VEnur6IBSVKNegbeN
         1YGr8E5+zdKlOKXfDsUueI26+tqq4B7XjsRa4ZTqn802Lg1MNGy/R2Je2pCRjh7FCy4U
         2EjXLHdL5NoIoIxM3yu0+iMad3ftUAn/kRyUi+7MHGkCvciIu7YNQBXWVyR4tyLSblLp
         TXaQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774962296; x=1775567096; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EXe6ByVFgqHK9ot4yGzQ91DO+cEJ7cxXfss2LYdxr0o=;
        b=p9GWVbMTk1InVN5llgD/gfW53Yoq+yBCsbTP3b2gxViBYM8b4Ed0UiZ9kLoBDBo1Q3
         J1StSlMSE38f+B9t4R9tnhQBKUu8hh6+QzevotQZZT5XCVgNLuQvanClTE+YjwWI2i0F
         EBe+mGZD5pm2Xod/GG1vWQj34v8X2As/445h0/SIBKBn9k0Jixt5NydcxXgOa3AUl4uH
         au5wyrfS8dH0E4IDx6s1P6XkH2i53b8ylBC+GwO6mNj5F9Hr6ISUV8j5ULyOSj7LaQkz
         g2Qc6lZG3D+nPs5Ft6amsqW9WyUdxvuT2znqxpkKZ4P91XNuk/IcsKjDvCllmxIJk0VM
         jmSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774962296; x=1775567096;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EXe6ByVFgqHK9ot4yGzQ91DO+cEJ7cxXfss2LYdxr0o=;
        b=VenHOhPrZXvvtiF8W3PacyblaBr8QZ/Mi8CB9gdWQsyi15Gqz8bAhKeuB78EkTHeD5
         OcjVyQzqqX2qJuBbg/GFXfKaC4WZQHqIyDDOljOUpkYHlTuQsA+l2LQPxRXBMh9i8fQv
         Eb4dDx8r0gEFlDVA4rPkkAdEFkAHlAIu89Fe2hzaBzEawIaOIgsLslvV/wmlglxdzYzx
         32N3cjIi3g6BhGYv23Nkck4j3faCn8MZXQmLpt1GHUcG4NuOkd/Y/47j6yPUPJsIJS0v
         LenS80UYXbWFzsz7HqNUkbGHDF+/UBOJvcXNxNksg9gLnFd0uPIERuOEHZWmSwrX5xRC
         Tsng==
X-Forwarded-Encrypted: i=1; AJvYcCXPK33fXLokAWOUXXN/L0q4ZsXGc7/bFI45AUcgYuhQ2IViAgpK4fb0fl0ZO5ey6Osc5L8j5eZ4gpvi3Y+S@lists.linux.dev
X-Gm-Message-State: AOJu0YwWmNDqliTvK/HFGuIrQfhERghv4FBTY+4i0FvqDlavpROwN4uT
	6Xzc1+7aG42UvJXIk8Hok9CglwOmDmqJEmVXyjhvDcmtrqsLrde1wuqHlgfmJHYY023Di2CV9r5
	wNO4ujb52yFkWtGyKUZIz4rcw7yujRQllXO8KHDPx
X-Gm-Gg: ATEYQzyYPgwn4fWDbssX2asGfYWk7F840pS1iefLjAUJwIjkXPIUVFujDV1KneIA/TL
	UQGrA1XyDATM5f9Fk8nrRDAwL0EQmApsYZJvByN290IlNY4H0P26KQd2MHn+ePPmVZy+NSuHodS
	4Ij4R69VW0wVIyhA0ZF+d57CeMq6oXsSqe8r/FNT5EsWAApukz/vV+/FP9yXKdbqHiOfmAHcX3s
	IJz0WZc7gDqqnHtuLrZcIrl1osdxgK/nkW7ukrudMzxTBgeh5wnI0o0PO6lZz5dJeMAgNZK5grg
	bi4baAy5i2wPKCu10mzbh8RIBfmaLmqz9Zru1Q==
X-Received: by 2002:a05:600c:c493:b0:486:fd3a:fd22 with SMTP id
 5b1f17b1804b1-48727ef163bmr265057995e9.4.1774962296021; Tue, 31 Mar 2026
 06:04:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202603121235.tpnRxFKO-lkp@intel.com> <20260313213638.GA147391@ax162>
 <CANiq72mzEzjNg7O_2dWT_6QOJvJ3TwV+HyxNd_F4j6v9C+pc7A@mail.gmail.com>
 <2026031422-catsup-rectal-f886@gregkh> <CAH5fLgixE9MGXxNEnU5b0EXdgLQoTs5CMv_0OdnfCX3v=coUpw@mail.gmail.com>
 <abVG0JypVhDxx1Tt@google.com> <2026031444-wriggle-tradition-245f@gregkh>
 <CAH5fLggMZM3kYWO3xqb4o-mQG27aCYOmiiODW67CKLTstkB-PQ@mail.gmail.com> <2026033142-distinct-tanned-f749@gregkh>
In-Reply-To: <2026033142-distinct-tanned-f749@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 31 Mar 2026 15:04:41 +0200
X-Gm-Features: AQROBzCLOGQX2tSfSkAhkWuzSolMKQYyl-U7kjRDRXWr57ayx_jzC1qnpjdIn-Q
Message-ID: <CAH5fLgg63SYHQ34yqy7o2cA5f2Gh0aNTwTeQkzbWb+kV4Rr3Qw@mail.gmail.com>
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

On Tue, Mar 31, 2026 at 2:59=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Tue, Mar 31, 2026 at 01:32:03PM +0200, Alice Ryhl wrote:
> > On Sat, Mar 14, 2026 at 12:53=E2=80=AFPM Greg Kroah-Hartman
> > <gregkh@linuxfoundation.org> wrote:
> > >
> > > On Sat, Mar 14, 2026 at 11:30:24AM +0000, Alice Ryhl wrote:
> > > > On Sat, Mar 14, 2026 at 12:15:30PM +0100, Alice Ryhl wrote:
> > > > > On Sat, Mar 14, 2026 at 12:13=E2=80=AFPM Greg Kroah-Hartman
> > > > > <gregkh@linuxfoundation.org> wrote:
> > > > > >
> > > > > > On Fri, Mar 13, 2026 at 11:39:14PM +0100, Miguel Ojeda wrote:
> > > > > > > On Fri, Mar 13, 2026 at 10:36=E2=80=AFPM Nathan Chancellor <n=
athan@kernel.org> wrote:
> > > > > > > >
> > > > > > > > It looks like this is a conflict between Alice's "rust_bind=
er: check ownership
> > > > > > > > before using vma" [1] (currently in char-misc-linus [2]) an=
d Mike's
> > > > > > > > "userfaultfd: introduce vm_uffd_ops" [3] (currently in mm-u=
nstable [4]),
> > > > > > > > hence why it was bisected to the -next merge commit.
> > > > > > >
> > > > > > > Thanks Nathan, yeah, adding a raw pointer (not function point=
er) to
> > > > > > > the struct makes the type `!Sync` in Rust.
> > > > > > >
> > > > > > > I assume this is best handled with a patch on top of char-mis=
c-linus.
> > > > > > > Perhaps creating a wrapper to assert it is `Sync`, since the
> > > > > > > `BINDER_VM_OPS` contents are unused (so far).
> > > > > > >
> > > > > > > Cc'ing more folks related to the commit.
> > > > > >
> > > > > > char-misc-linus should get merged into Linus's tree "soon" and =
then we
> > > > > > can fix up the mm-unstable change for this.
> > > > >
> > > > > I'm working on the fix as we speak. It would be ideal if it went =
into
> > > > > char-misc-linus, because the commit that is wrong is mine, not th=
e one
> > > > > in mm.
> > > >
> > > > To clarify, to avoid breaking bisection, the commit needs to land
> > > > somewhere that is on top of commit 8ef2c15aeae0 ("rust_binder: chec=
k
> > > > ownership before using vma"), and before the mm commit. But I guess
> > > > there are several options for how to do that other than landing it
> > > > through char-misc-linus right now.
> > >
> > > I've sent off a pull request for the char-misc-linus branch now, and
> > > after -rc4 is out I'll queue this up on top of that to get merged for
> > > -rc5 to make this all work out ok.
> >
> > Friendly ping on this. I don't see this applied yet.
>
> Sorry for the delay, now queued up.

Thanks!

Alice
