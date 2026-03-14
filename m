Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F09A21A3166
	for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Mar 2026 11:30:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773487828; cv=none; b=QLXQLwMCuVNRnp+lXbzVc0BxSo1EvApoYj2/1JqgnfArR97TN59DXIwJXIP8Wi7diddznnYAWrBhn6PmNlgzAGigeb8hA2oiivcGLCQ57RYkHjC45Im8KDFhaj7baYZ9/C8+Qoxi40nQ1nBK2KMDpec3+9+wefwnCX5gpR23Q2Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773487828; c=relaxed/simple;
	bh=i5/Mv7r0O1xhJ0MOUYqm/aCKF2kenGBq/6wEKwTk7fY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=P33KdfPAIfkgFefo+2J7NLkqAXLp3aQDGCLhrGgQ6qQqae1uoQQx1axCNwefhqB3nbSDzoj982zwS/9Ur1umWbw3MminAWuSUF0Zr/S406Q1LUEEoiK9+rOsI596nHvlTkKquqObpfV8H28Zh7j4A7JC69k60WF37CxSVC542J0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=wZJYQsti; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wZJYQsti"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-48535f4d5e1so26216575e9.0
        for <oe-kbuild-all@lists.linux.dev>; Sat, 14 Mar 2026 04:30:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1773487825; x=1774092625; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=i5/Mv7r0O1xhJ0MOUYqm/aCKF2kenGBq/6wEKwTk7fY=;
        b=wZJYQstiqcmpTifJ8HeFY52uEF65cmgsNghvZ4YeGSUXy0kvlj4F5c37JjTam+g4gw
         BzGmNPyBLta/QCBh0lqxEcKbIi3L77GAJCJr+WPWJaIfY2FEtz1l6i35Axr1nT4T7PYp
         LmTdlyttbouWxg60NVthWNHdMFOy6gBEvqHQjgtkeQfSeoTEa3pA1LOp+qH5XzN/vI5/
         z5DZZj7ycU9DU4qtJ1x7sZ2phzbNmxFRvFXX6Kgldwu+U0AfE6KU4GetBvCp/9brWOQB
         2ZaYr6gtWgztvx5W89IXTnsvIG/kzmNyY6AU8BCw3CQ25ls6TIloTbHhH0exeO2eNKCw
         YciQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773487825; x=1774092625;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=i5/Mv7r0O1xhJ0MOUYqm/aCKF2kenGBq/6wEKwTk7fY=;
        b=TSk6siCp1NV0rJ+r5QuF1FBe7cSthnjEAOzUA9CemE/lnlK10YGKFAvQjpF1JZ63n2
         vWWilQnW7ebwIPwx3nKXm/KesSLEm35YSvBf0WrYLQvX2Q1ocoAI7J954Q8KtPFcq6He
         md3Lx5MD6XXBn+jErGQjrpnjFQwqTfO8zLRARxcyzydYfMJNMWdyTlc7U9Wg7E5pkM0D
         RogenWZF3/gwwghYHCrCyNu+JOKmylVYcxQ2jv/WW7WI/OlK3BdgWcs7a3g44cHOcYOb
         sM4fw3Nid7MseOdhGAK4z2Tm+4h80YAGLcela3gGXRN+DUHCKrBU22t6MktfNS+85WNi
         Wv+w==
X-Forwarded-Encrypted: i=1; AJvYcCW9aSq+DpfvMTArxm1sSvfM9d7YzpuiHU0qx7Aml1NSZALR1R6IC2T/p2ncxhH/vaKZcV7XBCI1tJWSBd+0@lists.linux.dev
X-Gm-Message-State: AOJu0YwLvN2J+FE8nwiC97kpJkin4u7SB7wex1j+ohOwIYvOvWoysd34
	Vf2bKVcj1Tsx8k9nV5fstetLw70lj0M/lsRqYN7QQfRu6HWav5yp5WLmHrKcIHAkq1GNfsMjNd+
	cAH7ITVVTF3MQtJgs5w==
X-Received: from wmpj3.prod.google.com ([2002:a05:600c:4883:b0:483:509d:729b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b25:b0:485:3a03:ceca with SMTP id 5b1f17b1804b1-485567029b6mr109864745e9.23.1773487825162;
 Sat, 14 Mar 2026 04:30:25 -0700 (PDT)
Date: Sat, 14 Mar 2026 11:30:24 +0000
In-Reply-To: <CAH5fLgixE9MGXxNEnU5b0EXdgLQoTs5CMv_0OdnfCX3v=coUpw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
Mime-Version: 1.0
References: <202603121235.tpnRxFKO-lkp@intel.com> <20260313213638.GA147391@ax162>
 <CANiq72mzEzjNg7O_2dWT_6QOJvJ3TwV+HyxNd_F4j6v9C+pc7A@mail.gmail.com>
 <2026031422-catsup-rectal-f886@gregkh> <CAH5fLgixE9MGXxNEnU5b0EXdgLQoTs5CMv_0OdnfCX3v=coUpw@mail.gmail.com>
Message-ID: <abVG0JypVhDxx1Tt@google.com>
Subject: Re: [linux-next:master 5585/5731] error[E0277]: `*const
 kernel::bindings::vm_uffd_ops` cannot be shared between threads safely
From: Alice Ryhl <aliceryhl@google.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, kernel test robot <lkp@intel.com>, 
	Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Mark Brown <broonie@kernel.org>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 12:15:30PM +0100, Alice Ryhl wrote:
> On Sat, Mar 14, 2026 at 12:13=E2=80=AFPM Greg Kroah-Hartman
> <gregkh@linuxfoundation.org> wrote:
> >
> > On Fri, Mar 13, 2026 at 11:39:14PM +0100, Miguel Ojeda wrote:
> > > On Fri, Mar 13, 2026 at 10:36=E2=80=AFPM Nathan Chancellor <nathan@ke=
rnel.org> wrote:
> > > >
> > > > It looks like this is a conflict between Alice's "rust_binder: chec=
k ownership
> > > > before using vma" [1] (currently in char-misc-linus [2]) and Mike's
> > > > "userfaultfd: introduce vm_uffd_ops" [3] (currently in mm-unstable =
[4]),
> > > > hence why it was bisected to the -next merge commit.
> > >
> > > Thanks Nathan, yeah, adding a raw pointer (not function pointer) to
> > > the struct makes the type `!Sync` in Rust.
> > >
> > > I assume this is best handled with a patch on top of char-misc-linus.
> > > Perhaps creating a wrapper to assert it is `Sync`, since the
> > > `BINDER_VM_OPS` contents are unused (so far).
> > >
> > > Cc'ing more folks related to the commit.
> >
> > char-misc-linus should get merged into Linus's tree "soon" and then we
> > can fix up the mm-unstable change for this.
>=20
> I'm working on the fix as we speak. It would be ideal if it went into
> char-misc-linus, because the commit that is wrong is mine, not the one
> in mm.

To clarify, to avoid breaking bisection, the commit needs to land
somewhere that is on top of commit 8ef2c15aeae0 ("rust_binder: check
ownership before using vma"), and before the mm commit. But I guess
there are several options for how to do that other than landing it
through char-misc-linus right now.

Alice
