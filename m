Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F8D11DF732
	for <oe-kbuild-all@lists.linux.dev>; Mon,  6 Jan 2025 20:01:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736193709; cv=none; b=Ub62wEYQUwQKFrOAKAu7XuYkaA5jek1TniysOw+NeNlZgp7Ny9GXt0/NpeTGsjtTVLZ+IIhY2zqLUR8nz/69XRaN3jYrZnarx/3rUfIReE0ltwgu/lz039eQeQn7PXk+7MDRjaLSAIGUrZl2414zSkcqs/CKrWBeHIGX+pD2ogM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736193709; c=relaxed/simple;
	bh=KBKF9ZGKWJ0GPOvQAm2rvyJOlfTt78g9hWAOzjs4rTw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=L6dZBKS8zTgC4h1fE9I6xtETn4evbJX0Y0HylBSGE2iUmzt5dRi8CR4cAOJLQ1r1QVO7EzJyTR4b3rHoDiTbMW06xxipenUif365T4mljNSGPjSIOjFXoVKtCHGDDFeAO7qhzHak2qZFVWmsW9aFmkIWAOLrnALwh+/9TEmDatc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xdjRD7GO; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xdjRD7GO"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7b7041273ddso1034264285a.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 06 Jan 2025 12:01:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736193705; x=1736798505; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Gqo08AP97puaTotcp4emsgOY4g9ojpu0IG3QSOl3UZU=;
        b=xdjRD7GOCP3D7wvAyhNUMcNWykkPpHFsPT9z8uAiC01Z06pq5tIJJTzz+ZZiOuCgJO
         kYvt4IEHpzDZrmG0zqFpTsdQfxJMdhwJXrczMztXjo2DnAke4qNLVxuI0lZaMHE+kV0F
         xR8fzHYHqMWzq47/E4s7EGQugtWXXzLEzAlXrijvn201lqDLKtz/uwfAwXJZviKR/S0d
         VPo+19LzisMrAZNp2iq9NFHhsaD4b+CT3LkigA5NGVz9E2hGo2jRlSFNPW8mjUiJUgep
         d96FNi3AVSaStnpc5ostbCUfggAptLxGzV3bfsHWaYEMx+a8q182yO1Ajsmc2hLTl5vC
         82bA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736193705; x=1736798505;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gqo08AP97puaTotcp4emsgOY4g9ojpu0IG3QSOl3UZU=;
        b=PBK5eEw8xxyGAAlSBe+648jFQrLYgoiXuLEis8XjrgAl4xn1n4CBzus/1fHB5w+te0
         i4KZNawQn7jgLIz98GciBk2qSLaiwKrNjEr/pH2PXRT8x/AGqv9C208y+7aYWmAhRbz3
         +NJuMXr7WGVvLLZ4U0nfYX8XJJ50Gn6aUD06w0VwEHN8S7XNnWZIQFVYdAbuqH6NdOiF
         oiSxgK9jZN+tGuOIvgnzSJMTer2wapGdL7R7T0pTo5M2Brqp4tM0/mTNFs4/lE48tBVN
         t4P5SoDNVJ8gNVqipfp3jhIpsOYOTAbrjIwi332VJeA4vvTdUKuT8ZAtl/ar4VVIMFJG
         mL9w==
X-Forwarded-Encrypted: i=1; AJvYcCWyMPf7QbhnKHpoiBoKM5uk0eAlVN6dbRhtC8eptqxSNL1wXqghRxr3tWtzS/+QCjP9PP0LNZoteCm0Fd2z@lists.linux.dev
X-Gm-Message-State: AOJu0Yxf5fK3IHGGWaWmYbRMrWGziv5rfiZnkYGNwFVeKZbDweHbCSNz
	fR8AAvzSiF+KEFf6cIGcb8vU6R2XN/Agv+yAU9vG7x3PlPNIuYpTyWAMvZxxY/djXIEaabCGnc7
	dPW0MkjAL16ikcHl5jnIgR0L8Ek7TyKyhCE46
X-Gm-Gg: ASbGncvSSS00THWUjL0gCpi5Iid+EibGme+qDXcse23Kl6CTcErHwvQdKz8igfNOONx
	ZMARiARJCr6iUFXCpQX/Yl5YMKfm2xr2pqLp6lg==
X-Google-Smtp-Source: AGHT+IEtPavfF33Se+RLvCh1Zj+VbZzJfIKyEO5cEA7ZUNkJ1Bj3bSNCFso7TA9Lis99xWgol0vJAfg30kv8dYeGVOE=
X-Received: by 2002:a05:620a:3913:b0:7b6:6b52:8bb1 with SMTP id
 af79cd13be357-7b9ba72a55dmr10178813885a.14.1736193705122; Mon, 06 Jan 2025
 12:01:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202501031535.erbln3A2-lkp@intel.com> <20250106192608.1107362-1-cmllamas@google.com>
In-Reply-To: <20250106192608.1107362-1-cmllamas@google.com>
From: Todd Kjos <tkjos@google.com>
Date: Mon, 6 Jan 2025 12:01:33 -0800
X-Gm-Features: AbW1kvbGDIcVWpPJsqJ_KoFTsFZCXvwa1VFv1HNZ28r2Vo4l2drL8tO_n0tdK8U
Message-ID: <CAHRSSEydJ_VHc3kaPzmi_tfnUbAPTXXNOpsfq2ZajDY6CnOpgQ@mail.gmail.com>
Subject: Re: [PATCH] binder: fix kernel-doc warning of 'file' member
To: Carlos Llamas <cmllamas@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joel@joelfernandes.org>, Christian Brauner <brauner@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	oe-kbuild-all@lists.linux.dev, paulmck@kernel.org, uladzislau.rezki@sony.com, 
	urezki@gmail.com, kernel test robot <lkp@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 6, 2025 at 11:26=E2=80=AFAM Carlos Llamas <cmllamas@google.com>=
 wrote:
>
> The 'struct file' member in 'binder_task_work_cb' definition was renamed
> to 'file' between patch versions but its kernel-doc reference kept the
> old name 'fd'. Update the naming to fix the W=3D1 build warning.
>
> Cc: Todd Kjos <tkjos@google.com>
> Fixes: 80cd795630d6 ("binder: fix use-after-free due to ksys_close() duri=
ng fdget()")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202501031535.erbln3A2-lkp@i=
ntel.com/
> Signed-off-by: Carlos Llamas <cmllamas@google.com>

Acked-by: Todd Kjos <tkjos@google.com>

> ---
>  drivers/android/binder.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/android/binder.c b/drivers/android/binder.c
> index ef353ca13c35..f790356750e9 100644
> --- a/drivers/android/binder.c
> +++ b/drivers/android/binder.c
> @@ -1971,7 +1971,7 @@ static bool binder_validate_fixup(struct binder_pro=
c *proc,
>   * struct binder_task_work_cb - for deferred close
>   *
>   * @twork:                callback_head for task work
> - * @fd:                   fd to close
> + * @file:                 file to close
>   *
>   * Structure to pass task work to be handled after
>   * returning from binder_ioctl() via task_work_add().
> --
> 2.47.1.613.gc27f4b7a9f-goog
>
