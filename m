Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2074152166
	for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 13:45:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722260733; cv=none; b=U2U1wtQm/ojDKLj1zldb478GFlBTGbhgO0Au4uXOXRP/2hmd4GSp2gza6hm5c7QMZiWHpaBdHgZyIksyQtyEu+aJRqAG6Fw2zex2mtQd/vxfDr5Nz8EQVwkY633NZ2JMlFsZukvylM/XqPaLj0S/ffpeUu5jtxUu6HqHcxzdOjI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722260733; c=relaxed/simple;
	bh=UbWRQTpQEzeXs/avfzHN3XRm06yQr7tsogtEoarkBQE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=muudqC2sZnFwPaEGf5nF5fU2NgSmXMZXst1JzxzygywQ6zoyoGMXdwRtXl3OTvoLERS6EXEbvkhpoPDILg5NN7Hf5TmvUdHu4VPHB1I/nhA3mPCJjrzGJ7cecSdelPCR3VYc1yt89LT/V/rRP7U0karbodRFzbfhCIcGvUwKC2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com; spf=fail smtp.mailfrom=vimeo.com; dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b=TZ1+CPfG; arc=none smtp.client-ip=209.85.210.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=vimeo.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=vimeo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=vimeo.com header.i=@vimeo.com header.b="TZ1+CPfG"
Received: by mail-ot1-f46.google.com with SMTP id 46e09a7af769-70940c9657dso1338817a34.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 29 Jul 2024 06:45:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vimeo.com; s=google; t=1722260731; x=1722865531; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RvamCnhF7r32z4+iKhdiypORBTSaJg1fy8qu9w6+n+Q=;
        b=TZ1+CPfGimNEwuSKLKaBnRCkHeBK2DpEM5tKQ+BlgCIBNUZaHZk3YACQpiXnmk9Js+
         GRoDR8GR/E59CNpROnq7cMFDqGY3bHNfvKCuSBmo4RzST+NPsMKCDhTck3Sgck6UeSlu
         /3MhCI+7S+xRmi+as9c6qXa7/YGj0F7376VLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722260731; x=1722865531;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RvamCnhF7r32z4+iKhdiypORBTSaJg1fy8qu9w6+n+Q=;
        b=YC2BvQAklJAHPkoKdsgkt1NEft2uaSErWBk/td9U1wwC60kUxEGSExehxQwmps+oOx
         PiGwljEuoE4QuoZs/j39e96BzjK6Tnumk53l+NjNNhJZ9RW67asC+G9jeIS6P5BNQHpJ
         iNITGbPOegaFXV2MxysCFWiQPjIil0akIRnUj1st2QF2qpY5T1ZFfse9zIvBJVYMyK6w
         y8gmnXCHeomxZjIGK3YHAnSg8EmEqJMmXFqEz3taE6iUM1KDja4QuROqMn4GiPxcR0d9
         +kANlJGQRjk9Deq3R2sSBiw7ugCCuK2x3lFA0uYC761z76/HaqzQwgFafwo7CDyETbyz
         cYfA==
X-Forwarded-Encrypted: i=1; AJvYcCUvS1wde+nFDmoLOrU07rQKvXIq2PifaeowX24CCw//CXrAD9eDrBSsudYd0kP5RIXYuytbE3awrGsgYjYUfYcISZRaVuWlypA3JevcFQ==
X-Gm-Message-State: AOJu0YyCHwYYJ5IALzq0C1dROxOJofchYDRm9lhtM0hSnjmQsu9nkexi
	it5RsQlhdjevXtsvneJih085lNy/RFJixrDoWMd0udKrFMTerYOartwOZDM4XMh1ijsXhGXkN9P
	/P2HZUuTamtwiFC8BOzx0v6Y3K/IfL0T57BnrjA==
X-Google-Smtp-Source: AGHT+IEFP9e4qIdr7UC4mf6+Bt/3WALRELF0sMdPXc268DI1l6R7la56+gngTQsJwz1LeWuy0PGz8j8iM4PosZlpRlY=
X-Received: by 2002:a05:6870:569e:b0:25e:b732:a913 with SMTP id
 586e51a60fabf-267d4a4492amr8753349fac.0.1722260730750; Mon, 29 Jul 2024
 06:45:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <ZqXB99KGKrzyePeL@rli9-mobl> <20240728131824.51628ab73f6318fe62e85742@linux-foundation.org>
 <Zqb8f4ldSvBgHd2h@rli9-mobl>
In-Reply-To: <Zqb8f4ldSvBgHd2h@rli9-mobl>
From: David Finkel <davidf@vimeo.com>
Date: Mon, 29 Jul 2024 09:45:19 -0400
Message-ID: <CAFUnj5NoDGAd1y-8N3ikPwZdk6Ujb2OG8kq-fcnOjF52AXA=jg@mail.gmail.com>
Subject: Re: [akpm-mm:mm-unstable 36/78] test_memcontrol.c:201:6: warning:
 variable 'fd4_closed' is used uninitialized whenever 'if' condition is true
To: Philip Li <philip.li@intel.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, kernel test robot <lkp@intel.com>, 
	oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 28, 2024 at 10:21=E2=80=AFPM Philip Li <philip.li@intel.com> wr=
ote:
>
> On Sun, Jul 28, 2024 at 01:18:24PM -0700, Andrew Morton wrote:
> > On Sun, 28 Jul 2024 11:58:47 +0800 kernel test robot <lkp@intel.com> wr=
ote:
> >
> > > tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git m=
m-unstable
> > > head:   b39b3892d20a337489c55806f91af581474f3943
> > > commit: f2db5cca8182337f4ad485ebfd532b1a2d1c223a [36/78] mm, memcg: c=
g2 memory{.swap,}.peak write tests
> > > :::::: branch date: 2 days ago
> > > :::::: commit date: 3 days ago
> > > compiler: clang version 18.1.5 (https://github.com/llvm/llvm-project =
617a15a9eac96088ae5e9134248d8236e34b91b1)
> > > reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/a=
rchive/20240727/202407272301.bBC2CidR-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new =
version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/r/202407272301.bBC2CidR-lkp@intel.c=
om/
> > >
> > > All warnings (new ones prefixed by >>):
> > >
> > > >> test_memcontrol.c:201:6: warning: variable 'fd4_closed' is used un=
initialized whenever 'if' condition is true [-Wsometimes-uninitialized]
> >
> > um,
> >
> >       bool fd2_closed =3D false, fd3_closed =3D false, fd4_closed =3D f=
alse;
> >
> > fd4_closed cannot possibly be used uninitialized?
>
> One possible flow is early peak_fd fails to open and go to cleanup, then
> in cleanup side, the variable like fd4_closed is directly used.

Thanks for pointing that out!

My next patchset will move that line to the top of the function.
(Looks like the same issue is present for f2_closed and fd_3_closed)

>
> +       if (peak_fd =3D=3D -1)
> +               goto cleanup;
> +
> +       bool fd2_closed =3D false, fd3_closed =3D false, fd4_closed =3D f=
alse;
> +       int peak_fd2 =3D cg_open(memcg, "memory.peak", O_RDWR | O_APPEND =
| O_CLOEXEC);
> +
>  ...
>
>  cleanup:
> +       close(peak_fd);
> +       if (!fd2_closed)
> +               close(peak_fd2);
> +       if (!fd3_closed)
> +               close(peak_fd3);
> +       if (!fd4_closed)
> +               close(peak_fd4);
>
> >



--=20
David Finkel
Senior Principal Software Engineer, Core Services
