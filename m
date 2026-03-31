Received: from mail-wm1-f53.google.com (mail-wm1-f53.google.com [209.85.128.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9501F3D5659
	for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 11:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774956739; cv=pass; b=qeB2amHwKCpQ5JBZuieUUyTrFwXcnzGFAw9OD84Ef7zc4xVI1f/DlomWSwjUScVkh7x9/JPbGBeRp91/4IdYFTaoyJuOLjd2VBs5Wl7G+1w2I5PWSoS2JzLtkPUIVY3Er2aW5nHPTvZPxIelmKR/21I6yi98dYsv5mfnTTkXzRc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774956739; c=relaxed/simple;
	bh=M67a/b1x6rgEx0jm9LICh8Vkeoo3mKrczTQasuX51XQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YqTdlPcTO0wvc68wg/tvJEt0epS5LR9jAzFHSEtun/jj7Gxdc+iMtpgaBgxmdN2vR05gBIstlfTGGO1UoOVw3Efw6D/yd3U5AbCcPS3kdrFdjE94rJF0lb9nhPtYQHUpA3OhVAZ+00gzdKY7vDZOn87sXiqfw/nGtjTrFzBocpo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ED0R3e1k; arc=pass smtp.client-ip=209.85.128.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ED0R3e1k"
Received: by mail-wm1-f53.google.com with SMTP id 5b1f17b1804b1-486fb14227cso73722005e9.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 31 Mar 2026 04:32:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774956737; cv=none;
        d=google.com; s=arc-20240605;
        b=Rx1LI1AbchqXw7qbEsbpw/V99d1W8/mKIA7WDFUJwLf6I829aVi9673fr13bWzKI2t
         CJhwNUn/UwQfBS4cOTwWU7A28zKGaKxTNd/p6RkoOvOSPSjwkW5gcILUKrd1LKFVFjsM
         EmGBLvUJ3up4URuEYBXL5GLGxXVF9EK4xXz4vObfIAdHYB6sPbMSNwlowqp0U88kkuma
         FLLQZ5SP5YY7hd3hFhpisQmA9dJu8yWqIsaeh5yBUhCPglE3JgXG7sNwMAsujkvcnpYO
         EwZ2nFpJx13mrPBswfqvxk6+A5LFxLacqLA97vT2U1n2KyHL//RVSTpvIrhmuWgBUBlK
         lADg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=M67a/b1x6rgEx0jm9LICh8Vkeoo3mKrczTQasuX51XQ=;
        fh=yx4qwXOB1HbkqmEdu8WgxCjmoTMThb8gaFlzAFxjOGA=;
        b=kZ9OjHs2X3jxs3rFbdpREA/AXR59JbH73Ya8HxXGcggyy45dmFJhaD9O1WPNRiEGt5
         VX2FCo75yOb81kSSsGpnCbRFSbh3mAEIEPhtwL4NGQW07ydvPklxhXwxCYxTFHMEFE9K
         yhuwOkMWgq5av8KmQejMLtjwwb+doQCJVEGiqfqPVSI6FwqHKX33xRIaKmt4o57LL6Fl
         7RVwSTP9uC+R2fzZSSCvisQLnKIaDc3LL5qNErZZMhH7HdRPVIs1/HlEf3iUcIGkrZuW
         vV3XmFb9MtbsTG6GVOxc8Y/Co1otzRaJisKkNLFdkS7rWJhrqRDU4D/K1OhR6pIqpsvS
         uZyg==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1774956737; x=1775561537; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M67a/b1x6rgEx0jm9LICh8Vkeoo3mKrczTQasuX51XQ=;
        b=ED0R3e1kC+ZdKUXD5A5XhI9i20ykQG27DgdFlT9Bjxymy0p98uD1agNo7QBX2nn2qD
         rwgRFfRAnupubmg4l0L4bwzOA/EwPC7BVnOMkybNHp0duKEG+71EXb2FEm9WLZrrVRpJ
         F2dtqNrgRAoxPb0MjuhopoUFY7chaH91RP+LriGxOAgkrBTC8uVeVPEJguzmSdabCF+e
         JgAKd7NgfDUX1ohcrunrpIipEVa/IZAE7mXNPW4Fmxd4uS/DxB5NQCLt4LGwgl7aOF9D
         76nfeEW+z+kWBvMy5z3l3+50xPjX3ZdkV7q/GqHiLd8+LKoMLQzQdpivY4/yTWKh+DR0
         91SQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774956737; x=1775561537;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=M67a/b1x6rgEx0jm9LICh8Vkeoo3mKrczTQasuX51XQ=;
        b=O22zxcy2gvx6l5xBo62P2DqLe1IiKSIGJ2a5uYzGklzmFIUc+j5MBEF3KdNk8ElWv8
         jGJ1PJE2v0mI7NWLIUjgECwnYGHsCXSbJbqd6XXGeS2sZZfRVV+D5/OUYABBs8nXCwo0
         39lt8i461fow1zuKKxNPfd2K3Edjs5x2SvO2E0CM73lbv2TdKiZkl/JG6uAvoHvC2qP0
         asuKV+Hc3ZG+kSJKdl8LZ25RHJEVmPcrxZRsGMhj9M1q6MsH62cCeqLoXf6pg0wJ3Tt4
         v2BVnM3n9oO11ay+UezS7XW6r/51vwMquVEBLKKcYAcIpnxo5QtqPVlOejCEmNvMUpfn
         gCrw==
X-Forwarded-Encrypted: i=1; AJvYcCX1FkWnJ1cUfuVtNXAKNmBR95mnjwtGXgY9pJJfhlWj+JckRu76pn1SXNfBGy6GNAeJ4nQSLjVUNc3ZkLfB@lists.linux.dev
X-Gm-Message-State: AOJu0YwDo/YodthWhUIVpH9lOvTsKD/GeZuvqACr36skCZ2q+xw2dbD+
	pgu32R/qxDDRdaL60ZiSFXe3h8sltSo2mutyw0k7ppgTwUQTIwjeq7NHQpCgjPRUfWbmRtFV5Q2
	tir+snXfFFtPJMiNHkTe1GhyvBU0BjId7OlBkBpY6
X-Gm-Gg: ATEYQzxofSh+CNWdzUGeyesuJJPSKRnGHEjyKaNhUyNWStYpMwqcf6lQgGX2j5FU26L
	xMT4Lgoe/auSI8x8re6TEsJ0+GUjeusuolkLLssC/H+Ze/LZ0An5gfn9LfVmVKwfUsQQIS1fBpJ
	4W0WlYOsHssgvzAyPjA2uThHcCLnIq8nx/xMWceFIdZRlYf5IdUE8WBojPVM8yPo+abXWnYDBoo
	PzjpnpKRti+kpfQqq7JoXhkuGkg6S/bAuAxmRpO90f3CF2s9j7VpnAzOB6mDOAqDyXDAa1XJ0m+
	Jhkwp9y8/x7Mx3zqEpFJKIIPxUsKt7Rw/DeT9w==
X-Received: by 2002:a05:600c:638d:b0:477:76bf:e1fb with SMTP id
 5b1f17b1804b1-48727efadcamr273504385e9.16.1774956736497; Tue, 31 Mar 2026
 04:32:16 -0700 (PDT)
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
Date: Tue, 31 Mar 2026 13:32:03 +0200
X-Gm-Features: AQROBzCQEjffcE5il2ENOqxKPlkZVapSxJMQJFQeH4ua_CsBeZl83tkO6WEAH3c
Message-ID: <CAH5fLggMZM3kYWO3xqb4o-mQG27aCYOmiiODW67CKLTstkB-PQ@mail.gmail.com>
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

Friendly ping on this. I don't see this applied yet.

Alice
