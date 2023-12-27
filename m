Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89C53481B4
	for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Dec 2023 21:42:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jz/j47BP"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-336788cb261so4993852f8f.3
        for <oe-kbuild-all@lists.linux.dev>; Wed, 27 Dec 2023 13:42:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1703713372; x=1704318172; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hDLD4+/i2vMq1fQYbzWj7QeJ4PZ6TaAuPhlpaYobBH0=;
        b=Jz/j47BP/lYbaAlbmd+91ZbUnZAbU8H1dwSavp70cFWLN8RfD983gT+RYdvPiCdfIn
         wDYoJIV+uukrDNnvkg6lmU9ipGVRjjh9QsmB53dH/TarkFclJuiruanugCu1CZGl6C0T
         lTBkuiJm9ggUeEdcPE8DpptccJSFT9/FdVGjIb4gjL6shw353EvYXhY/gWzQ9LQSKel1
         PCnyvWh3yCdWh/h3sf8ssP4w3XIl514qBUM5cbq8ZiCQQCvO2iyK74ST6Jy0nKLa9o/M
         V/VTGdWuOw3niaWpQYH8Np+NINRcQF2XMBNAiWasQomEv6+waI2d0GZ7dXIxOPJOoIrK
         tTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703713372; x=1704318172;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hDLD4+/i2vMq1fQYbzWj7QeJ4PZ6TaAuPhlpaYobBH0=;
        b=hb6a4vcXDb6WiVgVaRT1ujUSWrmiAE0qKwlqVjTWLOXJSa2EAUj47gZEazx5bRBUB6
         kwJv8VQqWPq6mjKqOhIo5d2YGTkWQyQIHHYUKg+USe3ycRqXVjg0QkvaNoqQz8KdyMpr
         /Spn9gR/eiuQv3TIBAcHtFt8ChxcmSEOyOUl/lDOYmYZ4hJLVe4EEvOTce5SQa7aPNcQ
         37pXx3alVV4827FQRyPEKDO4cel1kBPv6ljWzMe7m2F+NACfE783fGtKFn3uiOdkwTRI
         YVNUCcd2QeRgvhP9PjfVkc9/nICqOkmVMC9ilmddMxjmgS1+aUL20FWxvf3GSbc6XgPS
         Ewfg==
X-Gm-Message-State: AOJu0Yxrxiy8AXnBS0EOryB/N/h4GG0Tsn//i8kJ9K4WQR8qtuey8haO
	5V2+0TEiEOHc3Njr1ZK32k9ZLXu25EuJAYTpRRs=
X-Google-Smtp-Source: AGHT+IGgAO7AFAZan3TC+1/9LKYfUXC+HyHtjJ/qCR7SSlhOKpX4cDm/waGRD608xGQ/bf1FuGvPMzJSEc/Y1XJQO9A=
X-Received: by 2002:a5d:598c:0:b0:336:e8da:e17f with SMTP id
 n12-20020a5d598c000000b00336e8dae17fmr1859975wri.113.1703713371579; Wed, 27
 Dec 2023 13:42:51 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231226225121.235865-1-andrey.konovalov@linux.dev>
 <202312280213.6j147JJb-lkp@intel.com> <20231227132311.557c302e92bdc9ffb88b42d5@linux-foundation.org>
In-Reply-To: <20231227132311.557c302e92bdc9ffb88b42d5@linux-foundation.org>
From: Andrey Konovalov <andreyknvl@gmail.com>
Date: Wed, 27 Dec 2023 22:42:40 +0100
Message-ID: <CA+fCnZfZMhkqOvsvavJ-YTddY4kniP+sWFZRYy+nd3+8_C9hPA@mail.gmail.com>
Subject: Re: [PATCH mm] kasan: stop leaking stack trace handles
To: Andrew Morton <akpm@linux-foundation.org>
Cc: kernel test robot <lkp@intel.com>, andrey.konovalov@linux.dev, 
	Marco Elver <elver@google.com>, oe-kbuild-all@lists.linux.dev, 
	Linux Memory Management List <linux-mm@kvack.org>, Alexander Potapenko <glider@google.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Ryabinin <ryabinin.a.a@gmail.com>, kasan-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 27, 2023 at 10:23=E2=80=AFPM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> Thanks, I added this fix:
>
> --- a/mm/kasan/generic.c~kasan-stop-leaking-stack-trace-handles-fix
> +++ a/mm/kasan/generic.c
> @@ -503,7 +503,7 @@ void kasan_init_object_meta(struct kmem_
>          */
>  }
>
> -void release_alloc_meta(struct kasan_alloc_meta *meta)
> +static void release_alloc_meta(struct kasan_alloc_meta *meta)
>  {
>         /* Evict the stack traces from stack depot. */
>         stack_depot_put(meta->alloc_track.stack);
> @@ -514,7 +514,7 @@ void release_alloc_meta(struct kasan_all
>         __memset(meta, 0, sizeof(*meta));
>  }
>
> -void release_free_meta(const void *object, struct kasan_free_meta *meta)
> +static void release_free_meta(const void *object, struct kasan_free_meta=
 *meta)
>  {
>         /* Check if free meta is valid. */
>         if (*(u8 *)kasan_mem_to_shadow(object) !=3D KASAN_SLAB_FREE_META)
> _
>

Could you mark them as "static inline" even?

I'll fix this if I end up sending v2.

Thank you, Andrew!
