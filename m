Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E423438BD
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 17:13:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783962835; cv=pass; b=avInQkdECUsc1hRulklOjXTOjrDWjFXWHyJ6LrpHrbDiKx61wXEzIp8bX4P6QxoGtJo95m+XGgvDrHzIECO1Ycv44kKbkD7CZUrh/CKTEUTbzblOC6kkUl0Gc7K8BtS6ZRZ2jYMeCn3WtrV/sWEKQG2AELjP+B4I+x8ZOEMCiHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783962835; c=relaxed/simple;
	bh=TjQ6oSrJqIbqwiPcXyVFyD/2FyLsA5eQvC5UyOCv/XA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eZljAmrvPWyYnUTcm4yiEgmmGNVQqxrsC5ESfjl+rE7eQ/uyDCxvVodhA+Sr3FRjhR22uGg+4jeb6XtEk1C6d7nWeMbzqNgIwxB6q6A8pwWUOVoAyZ3Om6NGnnmkhR/ZpYH8wzWoCEK+4Lh7u6R60Jr8FDl+Z6JvPZvTXWSyxLA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=mEkjZ47Q; arc=pass smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="mEkjZ47Q"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c15a5b265so15491cf.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Jul 2026 10:13:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783962833; cv=none;
        d=google.com; s=arc-20260327;
        b=quTZd20yZ2KLfPwSJXQZw7dd3AC5prahx1al8WxsyYtYmkMfk/HhiDy6zm1UG70qwR
         kMDW7QrcnYiOnDhmlfTOkb3AhGhaGI63pw5DYndcrCsfBESvPEyiYtGkS/u7tHZkpzzH
         qr3bQJ3g5q0G1XvzQjOzMPvVBlIH1OVbb7RgqIrEuG35LBbYSQUwaoQ61Z9Lxz4i5e7p
         Tfv3yayd4j0f0Dm7Dal6YYRbckCmDVaU6N1XK6aDgSAH0rLSwOxR+HNa//dAKPKSj4Ox
         aS8/6F5XMzLPLuy63iOrNCAMHi28Cm4iqrPi5nNLPyv0lITvVcZyChLjxnTjd7UMmcCe
         S6Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=DD5wqd94WlUPEbfxha2Dsl5QwxgMVxPOf/Hd4g6KPFg=;
        fh=4BcFy/snOhYEHZAcW8BbVF9izjJHJmjtPGxcOf/ScBE=;
        b=eUhDWQsiUPc3gLcKBkNqWdiHTkTvtyHnG9mLnStDVX2/SbgwhhocpmUgvsBFONF4mD
         QzEH5p1WY5/23T4UMa9CITR08HP1id6dLJGqp1uFMMAwusIGZ8xSsPbPK3qfXAZJOzUg
         oN/Oz18eA8Q6KqndtbF5XknkyeRbRbAtxV+VMVek05wt8zTsvUMLq06I4M5E8lSvqvMF
         8GfbuYDDXzqtRYaqYwDb7ALoZH0CDsolPqjmXwmpuZNYIuWYjV5ElawFyzwoUEZfHO3Y
         P/KqTl/9iEvdSvmzTIgeRoKLjHC32v5Zh3VDWOJv9ZBY5Elhjalcfua/Gjli+mI6gUrh
         WlaA==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783962833; x=1784567633; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=DD5wqd94WlUPEbfxha2Dsl5QwxgMVxPOf/Hd4g6KPFg=;
        b=mEkjZ47QIP8dtgUStjxgs0C3vnRW+q+pEp7rdmqZt0P5/e+lC4+Du3o5z85J1gbmfv
         yqhmYUkCe9KycjVfAibbgjNGtiZ2QhIDoWMEYK4Gq38tfO6r5wDvnbha4r5wDdkWo6R4
         Jhdjj99u5t0lQqKCwNI5otKT2+b/AcDUrdWJzOLY74OcOz/OLvpS66j0bLRTq7gl4rVh
         FC3pmyej58qCuo6rxJ4CgM8tdDGp+HXBbXiMzy0BdfwuODwdOtbWmQcDqa5vpH4Mjo1G
         3FxVIcZc1rrNA+HGnEeZR155SznzWq7cWOISuixFSUWEDQgLrFhyETXc43LFgtJRNQkN
         WyJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783962833; x=1784567633;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DD5wqd94WlUPEbfxha2Dsl5QwxgMVxPOf/Hd4g6KPFg=;
        b=eo+zkjJ7jsI1fnR5/N0rzYlxFgjEG0RSa0LW72XX1mQ3ML0BE/DA79mxMNMUQMzLJk
         nI4qwfhWtp2D6Z9pXpMgl86SJYeACFlakk8fVrsiXECeWPSSTqaqKRiiMvFHTEILX+4W
         x9rqYq7WM/wvhsJsvd1ruCD1mgwbNt/l3lc7H7ICaAQjSWaUNkYVQukDYCYqqqjeEAy9
         kKxQ/pmnoBjsOnQMLKBxDN1ZKNOuusZUk58CplKi2lmNJQSr1wPI4qeblrDuJtgZYWb+
         9cRoLiNbPbBvMkXQ/KTn7xzc//hBdeVplw29R6X4s9oiwdN52Dtg/8lkcOOKRm9TQpSy
         GeuQ==
X-Forwarded-Encrypted: i=1; AHgh+RqFBcoZyEkEVPLE53p35ySFMSScsfPXyAFKjBWJu+/oI4mtFn9ckf+riFT1sqYwD2KzNYf0Um81W9DSFZ/4@lists.linux.dev
X-Gm-Message-State: AOJu0YwDi+MCwHPQljVT4zGRaq1ddJ53m4VLy4ElsAEJIT+JkMIigdI2
	OVqz/D3kTI1MS0HmIYgx8fzMDI2xN43ladNGQaTrBfb82c0yS900YYZ2G0mf6VZL049hxGxkjh8
	Ono7W0Jq+9YTxbZWXoeTtAr6xyTwlqx0gMpLhv6Z7
X-Gm-Gg: AfdE7clg98xroZzXLAfmgtDyLhrEmUWbMZixlytBjU8fcmf1lP1bsNDrmbp13jSTYXn
	WOA5Ixv45Lqasy9BFMPiV2o4Xsxmt8FXKX72f6N6ntqQeu9MPsY7GKS2mw3b6iO81LCADYbVU0a
	mWbU5FAjAeGPGi5L+EXG8pw11oQ142G/romWkddqdFxlYmCKkTLfA6KUZyMaJu9w6UgZth2UASX
	OW1ZZ46Xl06KfzfWR7fnNjLyklY7+jzB+GyTE7yTT7XTgjOvbUqyc2UqCLB6siUllZfpfQ=
X-Received: by 2002:a05:622a:5811:b0:516:d25f:f038 with SMTP id
 d75a77b69052e-51d7bcdc629mr5265721cf.10.1783962832725; Mon, 13 Jul 2026
 10:13:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202607091820.qbjlGhKK-lkp@intel.com> <CAJuCfpHjUij9kkD6QiWxYvsYD3iKga9rzJZWnN9vCf3bhp-dXA@mail.gmail.com>
 <CAL41Mv6UNWWdv3a2g2+tKuy+EX=8FJZSCcEAyHYyuUybYK4NMg@mail.gmail.com>
In-Reply-To: <CAL41Mv6UNWWdv3a2g2+tKuy+EX=8FJZSCcEAyHYyuUybYK4NMg@mail.gmail.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 13 Jul 2026 10:13:41 -0700
X-Gm-Features: AUfX_mxwf8jEAJ4-Emw6NQ7o3A5xX_dOnGVyXZPm3JwYCxoc_8oz7g9QKalCMCc
Message-ID: <CAJuCfpEpFDUNjgsHiETmxTLyVfHdCKEk8sR2fQtixBR8JOYRoA@mail.gmail.com>
Subject: Re: [akpm-mm:mm-new 344/369] mm/alloc_tag.c:356:58: error: implicit
 declaration of function 'compat_ptr'
To: Abhishek Bapat <abhishekbapat@google.com>
Cc: kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, 
	David Hildenbrand <david@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Linux Memory Management List <linux-mm@kvack.org>, mm-commits@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 13, 2026 at 9:43=E2=80=AFAM Abhishek Bapat <abhishekbapat@googl=
e.com> wrote:
>
> Hi everyone,
>
> I can send a fixup patch for this error if needed. Could someone guide
> me on whether I should amend the original patch-set and send a v9
> patchset or if there's another way to handle this without sending a v9
> patchset?

I think Andrew already fixed it up (I saw an email flying by but I'll
double-check).

>
> Thanks,
> Abhishek.
>
> On Thu, Jul 9, 2026 at 7:45=E2=80=AFAM Suren Baghdasaryan <surenb@google.=
com> wrote:
> >
> > On Thu, Jul 9, 2026 at 3:00=E2=80=AFAM kernel test robot <lkp@intel.com=
> wrote:
> > >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git m=
m-new
> > > head:   59e34180e138a293260301c139cf7ee800978533
> > > commit: 27ace96bf8195484c9e9e1a08eb5af5a4e81f9f0 [344/369] alloc_tag:=
 add ioctl to /proc/allocinfo
> > > config: sparc64-randconfig-001-20260709 (https://download.01.org/0day=
-ci/archive/20260709/202607091820.qbjlGhKK-lkp@intel.com/config)
> > > compiler: sparc64-linux-gcc (GCC) 15.2.0
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20260709/202607091820.qbjlGhKK-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202607091820.qbjlGhKK=
-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    mm/alloc_tag.c: In function 'allocinfo_compat_ioctl':
> > > >> mm/alloc_tag.c:356:58: error: implicit declaration of function 'co=
mpat_ptr' [-Wimplicit-function-declaration]
> > >      356 |         return allocinfo_ioctl(file, cmd, (unsigned long)c=
ompat_ptr(arg));
> > >          |                                                          ^=
~~~~~~~~~
> > >
> > >
> > > vim +/compat_ptr +356 mm/alloc_tag.c
> >
> > Missing #include <linux/compat.h>
> > After adding it the error goes away.
> >
> > >
> > >    351
> > >    352  #ifdef CONFIG_COMPAT
> > >    353  static long allocinfo_compat_ioctl(struct file *file, unsigne=
d int cmd,
> > >    354                                     unsigned long arg)
> > >    355  {
> > >  > 356          return allocinfo_ioctl(file, cmd, (unsigned long)comp=
at_ptr(arg));
> > >    357  }
> > >    358  #endif
> > >    359
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
