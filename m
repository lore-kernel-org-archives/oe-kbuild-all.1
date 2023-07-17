Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FB60BE57
	for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 18:24:36 +0000 (UTC)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-635e0e6b829so33455726d6.0
        for <oe-kbuild-all@lists.linux.dev>; Mon, 17 Jul 2023 11:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1689618275; x=1692210275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CwL77U+pImf77eQIc8DlGi1nPJ8X0iDt7k7rEjj3+Gg=;
        b=fGcRLCnvCxev1mJ1HD+KdAc/nx+LruGp76QiZ9kFk3GntNSj1IfsQyLgvwGD8l30YN
         mq7NEhHuYwfFdenUZZI3hVayI/fyjshKJzMlOv2/VC6BAZlb668YJM30PoX1RmPps04h
         1k9apfD2RK9XJrKsxkEVsmEjonJBjfff49bv4rNXfQ+eBTcHG+gMOrZ6AT2B2jcdr9fu
         ma0A8hsa31AnwKVJ9MMKh/aP1n6HxW3P7yypOkbtMvSRmVYjDpFLmfhPzW1xg990Elti
         CpGd9niTS+nCWq4pNCy5/c9BpO7XDz0Zp3NIAlI240FfX1HIeWfRKXastzlR6+vHRx7g
         EbWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1689618275; x=1692210275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CwL77U+pImf77eQIc8DlGi1nPJ8X0iDt7k7rEjj3+Gg=;
        b=kfY4solFyFLLjDw8AgUyReGeziwlRRFU8glQAy7j1fAQ1kjSTw3kAL/EYLGXxW6vbL
         xdad9pEXdX776cRHyssGMQTX2yadVi2O7Ps0W0RK2NTlLTxshuuVFXrx71QyChz7fQsD
         fQ9AfTdFQ5UJp7FR740UiDCRxvpb6YMPZ14NJgoRpn05a1+ku4nAJhv3Yt6z9ocquxAp
         H36oMKIxIUJ80C5KCiP3gdk2xOJLqa+J+Cr+34tsqm3yJ5eOYISEAs7e+wQQe651neV3
         7wiymXaHkDAuwD9R+zRbY4+9K+7B3l9LY8hZZ+FdklJibYfnWLxqSgEjUdKpUdEcDoE9
         nGvA==
X-Gm-Message-State: ABy/qLZnF/bNU4Mj5hefkhrYUr0lfPrBqPQ3/7zN8s2FpktE/SaqNu7q
	lOG6ucHyzhBW99wFXyt8iDAGXWyijhHiKMDAmz1XNA==
X-Google-Smtp-Source: APBJJlGRmfP1Isd5hQ8VbKKkgZERir5oyftehpyBoeoq7qJEdXOQeEMAEMe0d/wL9w3nHAdwnEyvs1GwK2B3W21bsEg=
X-Received: by 2002:a0c:b410:0:b0:62d:ee5a:514b with SMTP id
 u16-20020a0cb410000000b0062dee5a514bmr12086499qve.11.1689618275011; Mon, 17
 Jul 2023 11:24:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202307171254.yFcH97ej-lkp@intel.com> <ZLUSG8bNnSqT0LO+@smile.fi.intel.com>
 <CAKwvOdnUjAXg4VRbCBKUOZDCKs-=5aA2-ef1tFRj-P=-1bBjaQ@mail.gmail.com> <ZLWDuZ5Q5qBnmS25@yury-ThinkPad>
In-Reply-To: <ZLWDuZ5Q5qBnmS25@yury-ThinkPad>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Mon, 17 Jul 2023 11:24:23 -0700
Message-ID: <CAKwvOdndG5O-UAc4Y-Rj8MGRni1xrjwyBTb+D1nh2Qpi3wWXUQ@mail.gmail.com>
Subject: Re: lib/test_bitmap.c:920:2: error: call to __compiletime_assert_348
 declared with 'error' attribute: BUILD_BUG_ON failed: !__builtin_constant_p(res)
To: Yury Norov <yury.norov@gmail.com>
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Alexander Lobakin <alexandr.lobakin@intel.com>, kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, 
	oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jul 17, 2023 at 11:09=E2=80=AFAM Yury Norov <yury.norov@gmail.com> =
wrote:
>
> On Mon, Jul 17, 2023 at 09:35:49AM -0700, Nick Desaulniers wrote:
> > On Mon, Jul 17, 2023 at 3:04=E2=80=AFAM Andy Shevchenko
> > <andriy.shevchenko@linux.intel.com> wrote:
> > >
> > > On Mon, Jul 17, 2023 at 12:42:57PM +0800, kernel test robot wrote:
> > > > Hi Alexander,
> > > >
> > > > FYI, the error/warning still remains.
> > >
> > > Alexander, either you can escalate this or just propose something to =
discuss.
> >
> > https://github.com/ClangBuiltLinux/linux/issues/1874
> > Sorry, a few more fires have popped up in the meantime.  Regardless of
> > changes to the compiler, we still support many versions of clang for
> > the kernel, so we'd need some workaround in the tests regardless.  I
> > saw there was already one for s390 + clang, but from this report we
> > will need another. Feel free to use that link above in comments in the
> > tests; we will clean those up once I have a better grasp on what's
> > going on with the compiler here.
>
> So, it's:
>  - not related to bitmap code,
>  - not only s390 issue, and
>  - fires with CLANG when GCOV and KASAN are enabled together.
>
> Is that correct? If so, I can disable the test for CLANG+GCOV+KASAN
> configuration unless the above is fixed.
>
> Nick, can you please confirm?

Yes, and I think disabling the test for that combination is the way to
go for now. I will sort out what's going on with this config and
hopefully we can relax that combination in the future.

>
> Because it's a build breaker, I'd like to have it fixed in v6.5.
>
> Thanks,
> Yury



--=20
Thanks,
~Nick Desaulniers
