Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E17A274642
	for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 15:19:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744643957; cv=none; b=gownh7Ky/z8VFVGEHPDL67Xf2ijxx35TpnDqs33hs262yzvq+jxh+n4vrkeHvxwCKM2JxU0yLnHrhVYM65GuMKrOCJQO1YUfzrP6zqxyBAyh1XBngHRF7dIeJkaa29iOGREY90QByIeIXAjt82iFp/XemCzCxXMqkfHlHgOBRWY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744643957; c=relaxed/simple;
	bh=p8h5KkB+GURRTJzeWUMeXBkjHv3dd9xsMdCzuGRKP10=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qlD5YxWremuzISvVGiWsoeG0kQ/MuhCYClxggp7Q/gdv8vCNTKwO1GI1OtOq2zlNBjHdmOv+Lqp/2xA2S/qgGjV/6dYBZqLV38fCvIifVZvhqHv3vacdgz+Trn9tsyn40oY+VIzsF1mh17Czs5DdvR1D/e4N3+kNT27/icAu/Qs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=17BKJHbu; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="17BKJHbu"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5e5cbd8b19bso12911a12.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 14 Apr 2025 08:19:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744643953; x=1745248753; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qqGkP7AzdyRb+ubyQ7gizWBenRx1QoIqZMI8aSglq0E=;
        b=17BKJHbuuczXkHL2+0muXrjYiP1+E98N1yfD+sfrf5MEByTVvpARYibCxy/ARLNj4a
         cQUCyQYKra/IRJSCk/+gE72r4QD6VzLu6l6R4MP9z7rP3CB/z/6IIlfzdG4sN6kZvQBg
         2lZYVUEzfRF17Zj/uboZkqfVrzSii4xMahnhCfCkCqqIuBxTFZxJpYzCWds9e9L9tvW/
         z/08BYUr/5W4CheVC0WDYrXckziZC10YKVVfdX3c40TAEL5NQ5MDCluTAe7Cx0/0TwdF
         Jznp8S/EQ/MXnVryGP9rXI38hBbY+7vcwkcvUHm6eiFwCLoZQX3IxMc2LJwErTCKl0G4
         Hr8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744643953; x=1745248753;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qqGkP7AzdyRb+ubyQ7gizWBenRx1QoIqZMI8aSglq0E=;
        b=f3YowgdXgyTyPt1yz1EyZkcNz36wSchSXOIu0mmS0jLv1V4cQQ2+/AbYSGqtgYudc1
         TTE3VlfUWYbB0YPVFJqB00BgTHRUtqBHCGy5ZVmF8CJb2Ryx4N8lOvcv7IfqYs0e32Lc
         1sX/rs5ktkzxdq6XFrkn6UxwF2X2o+Iy+t+ibP5BbjuBf2aP/24W7Ys/54KMarPpA/KF
         gH2jSw4aGJWmMliPT1VuTHOWAkx1ngsGlpB9yUBQNghSPtKGdxNBzexteLTsQCoBFJQr
         l/KYf7VyUHzl15BxN22qrYZZgdGkH+/7/MTP9eInfCkNmMZowb86dXY6bTqK+/nNLuwP
         iUkA==
X-Gm-Message-State: AOJu0YxXaXCDedKVKbSSaxgObS5rh9abN14DmpO3rYhw0IVxGCdKFnR+
	AItU5ey4XT/ugxDFYTI5UwMC9dTnkS3tINaTtDGzIulP0pfh4nTp6+B1DkHINhEbWn2VhUerFpJ
	tTv8AO5kBPOlZS0zMNDub1xuM+rw4kJx7Vyyx
X-Gm-Gg: ASbGncv5ICL23xuzxWLyB/YO6JHJAGHEfzvqjwa8GY5qqGvSwYZSdXqlXStSfKAosVX
	72bFlKOcDfHKV26e+hU3kJxkEhcy7+u4F5yeYgRq9IIn4qGBBR7dI9proh92HEiZOCJu6mdQsNe
	daJ9RW9ywRLZaWDWcKZL+/5iR/PayDng==
X-Google-Smtp-Source: AGHT+IF2tbwdkcZoHBAlrPM/vjguNGPuQVp07BhndSI42K9ZzEGR8BkolfUA2D15wvLc1267hCzg4MFq260Gt1lETYU=
X-Received: by 2002:aa7:c9c6:0:b0:5dc:ccb4:cb11 with SMTP id
 4fb4d7f45d1cf-5f3d9d1f008mr154150a12.4.1744643952361; Mon, 14 Apr 2025
 08:19:12 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202504140435.2OoLcwfS-lkp@intel.com>
In-Reply-To: <202504140435.2OoLcwfS-lkp@intel.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Mon, 14 Apr 2025 08:18:34 -0700
X-Gm-Features: ATxdqUFdptLiRTgyyXD7-SwfiHHuh0sV_sAfKPkOoh58utSVLahQ5ujaA2TnepI
Message-ID: <CABCJKucXUGB6iUh2HTZKcYQGjgMtW1L=vWm_tTwZ+Kjas+iO9Q@mail.gmail.com>
Subject: Re: <stdin>:4:15: error: use of undeclared identifier 'csum_partial'
To: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org, 
	Masahiro Yamada <masahiroy@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Apr 13, 2025 at 1:48=E2=80=AFPM kernel test robot <lkp@intel.com> w=
rote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t master
> head:   8ffd015db85fea3e15a77027fda6c02ced4d2444
> commit: 9c3681f9b9fd12cdbc4a542df599f1837512f3d5 kbuild: Add gendwarfksym=
s as an alternative to genksyms
> date:   3 months ago
> config: um-randconfig-r073-20250414 (https://download.01.org/0day-ci/arch=
ive/20250414/202504140435.2OoLcwfS-lkp@intel.com/config)
> compiler: clang version 21.0.0git (https://github.com/llvm/llvm-project f=
819f46284f2a79790038e1f6649172789734ae8)
> reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archi=
ve/20250414/202504140435.2OoLcwfS-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new vers=
ion of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202504140435.2OoLcwfS-lkp=
@intel.com/
>
> All errors (new ones prefixed by >>):
>
> >> <stdin>:4:15: error: use of undeclared identifier 'csum_partial'
>        4 | EXPORT_SYMBOL(csum_partial);
>          |               ^
> >> <stdin>:5:15: error: use of undeclared identifier 'csum_partial_copy_g=
eneric'
>        5 | EXPORT_SYMBOL(csum_partial_copy_generic);
>          |               ^
>    2 errors generated.

This patch should fix these errors too:

https://lore.kernel.org/lkml/20250326190500.847236-2-samitolvanen@google.co=
m/

Sami
