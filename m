Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com [209.85.221.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42E93258CD0
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Mar 2026 11:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773489511; cv=pass; b=e4dYNGZ3L0GYlf1l0lOf9xdoL0aRqEWFH17So6rzuJHfmGmkOTV+cYY2Bx46MaRS3aCAZXc9XfpijnGWZ3svs+6sxuDLb6l9QY7xwc1snng/dtCWlvpSuImoKHxvL6xYBUq/3FlFqoOQrFC3+wT+8HAy8faJP1LaoEQber+CHfc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773489511; c=relaxed/simple;
	bh=tDUhjLbO8rNxXQmgp1rHTtbqYnNDwW9KMFRsKCA0ywM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=n+GExK1m86BQkAyIk7nKUX5dzQCnTlc+dQGTIp7Pofd0hh7hwDyoh3/2iZEfiYpwEwNEZ+wrcd8VzQAkfW5Y1HSac3lmEWfooJAIcBMMJsGbWL4wHk2JIWWHZHqNyF2FHODrzbRnLLRWi/bEtivsvyEXMvbfbVu/ZZUnn3OtKQk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=E+GuzajE; arc=pass smtp.client-ip=209.85.221.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="E+GuzajE"
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-439b97a8a8cso3166538f8f.1
        for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Mar 2026 04:58:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773489508; cv=none;
        d=google.com; s=arc-20240605;
        b=i6ClbMEFRkXu0nXfxMFkFjs505BkDekq5nS+djbe6Q4iS8d05qcfn30KWhKNu/lJEP
         PQSPkH70t9q0UBtjliwzXeCl9iaXWWtUnQTdGP3J2HXwtSsMQv5K/aQOlPpsMo61ymRy
         0wTSYnTYG1bEEHBoFKSUxk4zJzVtc3g+7tlVpWnai/F7had11nG9Uej2dARHYelXkk9s
         vNosM91pO/qxL15hpQtfHE7v91+Upr2dUxMFujmTkvzv9Tt8GIElIDvv1IEoGFCMuGnb
         Bp1qntLp6rOJzVdAUHDNI4Of92EW8E2a+CDu+GdPzxRFcYlBLtJq+U4EDIsYAW7eedEO
         +TQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tDUhjLbO8rNxXQmgp1rHTtbqYnNDwW9KMFRsKCA0ywM=;
        fh=4BOecfKO9wf5k8mODe2msP9+2Nw6dIaFMl+mgVaLvD8=;
        b=Ay4A9fOStZxS4h9Jk7nzPW7vNQh+YO2UtoYtgNzE27noTvfa0aa3oDAgqO6vgU/jza
         itdNOTvpV9xUN8RTtWjeU+jVOOsgo5mL3p9n5qSlCFMqLlu014xp2oY0UPkWLoM/bHL3
         l6mSxknqGM2heiB8P6GZkj0ZnSFKDdsPdvNvuE1pjIWJc7qBj5FAlx+qJ/nnSNO/ueve
         GYzMyoRTODxaWNMlZ5fgsFQnGpH6RROmufG9vl1lgrJy7pUWgA1Jinmp7n9dO0f9DB2R
         jFq8IVwdEbBzPgdva5ICMt6rJFqggk9CiO9ZD93Z+sL7qA36CIGySUF36CEM7clbwMDC
         RqAg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773489508; x=1774094308; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tDUhjLbO8rNxXQmgp1rHTtbqYnNDwW9KMFRsKCA0ywM=;
        b=E+GuzajEKXhFCLdkNhAHAAedtFtwz8e0TPtW0nwLF4SRuEJPBRJ4vepBUkABM1tx3w
         Vg4195D7YIWPXVLqggTmVY5gqggWS2rfddyMO68JqG5loabWubGeV4XeJRF1UteS7uDD
         X4paTN+v8pl3bQtcKmiAXp+eDpS/1YPvq521rLspT+G7Cyz9CBOQ6WobQlRg5d1fCplK
         XFVjXIqrzQroYKobnq7Tao35T6RQm5TbN0CDLzfgTMgLC0yupfH+Xs8zOLcZm73uVU8b
         m0n+CMN2C3P2N6lxu3HEdL9yUiKAA9FP85l+DRBRTOKLFAjZJ3qWLfko3PNyHCLYAneC
         OdtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773489508; x=1774094308;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tDUhjLbO8rNxXQmgp1rHTtbqYnNDwW9KMFRsKCA0ywM=;
        b=c23OdYPjPCTiEyWsG6psXnTj6c+TEvhFuR0yk3OUArREZ1hMqhELWVsUiLS5dFQ0Sx
         vhLLIcYbFCv1lkCEYno2QyiPJA3C5FqJDkWkV58EqLzF/DhB35zzusS0yl0fdN4PSSAb
         bcav3mIUqLYWM8rsvpsXXDDTjK98P9YBMaSJagyxei5EVaoh9Eerm8M7uVBQgWwsXcja
         zzGO8q2k5W9nGZdE8vKhBIBNgrODDYBpZGsD4B+BCNr7JtKERuSJLizKgS8VwL1gXGDK
         5L+eML8zi6ihZxNvINAUSRx+pKUgASLwR4H7pDYmbdc2xiRh25lE9ndhAXe1ev/yMoMJ
         iyoQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp0467HLQn/vnJ+qRokbO/xSuhgi9pM0f7N0eYFrFKN0udxJMEEDhIpxo+iaGVr+8GWxv63l5ahEyZ1eup@lists.linux.dev
X-Gm-Message-State: AOJu0Ywh8vDS5dwF/wsqhgpNpxxDi3cBaWhgC8JdCZPBzE6Mh7iAsd9M
	YZf9ZQHwQtMYJvUPSLYOVep2UN2GMI/v3Yef7dtqsBOnz8EPRtvFgDZf4h4BpHmP3j461jVV/+d
	5Fu9OUgoXby/XAfzMKCrjSrMU3MgwSSReB82mMHTY
X-Gm-Gg: ATEYQzyaaQXtudR1PqaMK23CzcE/EPdtAImzmGCTYTa1B9ZsGyfAoka6vALMeu/zXhb
	+OD066JJa3mGzQU0cX3Cx3Qki1bXzFLBJqSIQhMZ01N/vVWh91vrBLVJjaiSKNtYd/X0UbT6tc2
	noD3sG5iaAJfYo1dUYYVqL3GlRUgpS7C1QdLNybRor5SWJkztCHqDYV143BJ4cupzVnACRyhhwH
	fP64DIWre1ySFMfPqfvqH/YJ76231PJI2D9i3Pr2D8oJU4ZXuSxz40FfaCo/4W9daOT0QgwjjsE
	eJHVimYEqHazJP4JiKaCxe6e1357xljId/Ql2A==
X-Received: by 2002:a05:6000:1885:b0:439:cd8c:209f with SMTP id
 ffacd0b85a97d-43a04d87c31mr12531040f8f.23.1773489508090; Sat, 14 Mar 2026
 04:58:28 -0700 (PDT)
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
In-Reply-To: <2026031444-wriggle-tradition-245f@gregkh>
From: Alice Ryhl <aliceryhl@google.com>
Date: Sat, 14 Mar 2026 12:58:15 +0100
X-Gm-Features: AaiRm53w--KuwJ99Osd9jUt6yvtILxF4awX5YKpSHdok6ctk4q24IRBVS1ZMNeo
Message-ID: <CAH5fLgjruspkrLagRirzfDbq=k3OEnA5JBLY-BNXMD+JsJam2w@mail.gmail.com>
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

On Sat, Mar 14, 2026 at 12:53=E2=80=AFPM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Sat, Mar 14, 2026 at 11:30:24AM +0000, Alice Ryhl wrote:
> > On Sat, Mar 14, 2026 at 12:15:30PM +0100, Alice Ryhl wrote:
> > > On Sat, Mar 14, 2026 at 12:13=E2=80=AFPM Greg Kroah-Hartman
> > > <gregkh@linuxfoundation.org> wrote:
> > > >
> > > > On Fri, Mar 13, 2026 at 11:39:14PM +0100, Miguel Ojeda wrote:
> > > > > On Fri, Mar 13, 2026 at 10:36=E2=80=AFPM Nathan Chancellor <natha=
n@kernel.org> wrote:
> > > > > >
> > > > > > It looks like this is a conflict between Alice's "rust_binder: =
check ownership
> > > > > > before using vma" [1] (currently in char-misc-linus [2]) and Mi=
ke's
> > > > > > "userfaultfd: introduce vm_uffd_ops" [3] (currently in mm-unsta=
ble [4]),
> > > > > > hence why it was bisected to the -next merge commit.
> > > > >
> > > > > Thanks Nathan, yeah, adding a raw pointer (not function pointer) =
to
> > > > > the struct makes the type `!Sync` in Rust.
> > > > >
> > > > > I assume this is best handled with a patch on top of char-misc-li=
nus.
> > > > > Perhaps creating a wrapper to assert it is `Sync`, since the
> > > > > `BINDER_VM_OPS` contents are unused (so far).
> > > > >
> > > > > Cc'ing more folks related to the commit.
> > > >
> > > > char-misc-linus should get merged into Linus's tree "soon" and then=
 we
> > > > can fix up the mm-unstable change for this.
> > >
> > > I'm working on the fix as we speak. It would be ideal if it went into
> > > char-misc-linus, because the commit that is wrong is mine, not the on=
e
> > > in mm.
> >
> > To clarify, to avoid breaking bisection, the commit needs to land
> > somewhere that is on top of commit 8ef2c15aeae0 ("rust_binder: check
> > ownership before using vma"), and before the mm commit. But I guess
> > there are several options for how to do that other than landing it
> > through char-misc-linus right now.
>
> I've sent off a pull request for the char-misc-linus branch now, and
> after -rc4 is out I'll queue this up on top of that to get merged for
> -rc5 to make this all work out ok.

That works, thanks!

Alice
