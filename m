Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41B052472B5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 08:55:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754902520; cv=none; b=UnXi14sEaMa49GOvLgqOp5t3+ivayI1KcagiFCOtrKt/tSqbndipAAg3eR8g/zUsmV310HUNwIVGvLEjTLOG76i6K0yrbkcVz/94b8TGmF+uogeCs0C2o/Q4fTtzZ+xCOSqX5VJ7AAjM/yw1WVGSZemJ07IenYSgNt/YojJNHDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754902520; c=relaxed/simple;
	bh=9TpHCUtQbpYeE5hC40i0PLb1CG+a9lfcbDOK9kxG3Eg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cfOhzXm+bJ+CvLmOVPwFGGhTiInuDn2lGf82gEGhPZ5ouU3OG/W97AufW4EXQ82VOUU7slE/9rAp9HqHYBHfx1FY6bVchZWUyoRcWxdhpK2iBNkCj4FT89kDtYvlWu3DStz6PkGFlbX5rj6mzR2qVMDtHOc63ZJnb3Gr6S5mtyA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-5393776550aso3469816e0c.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 01:55:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754902517; x=1755507317;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CK1AgXEDVnnCjp/WETSt1mjlEj20pRVnTyOEAVLwD9Y=;
        b=X9eMcSPGmt0PaagVECsIHIt20vRVo1MM+yZg6A3/vyBRqTcQe5OiqRM+sR9kuhQlLP
         9ZI81kQrh4TdBD0/1JrNIQ1NjNc86Oibba1KUYwQMdWtZx2EZ0/rHIkFox4DSXgyronl
         k9D5dRleng0ySmgq9VySNXbTURYRNYIVmdckYxov1pScBz7tDTN64Z/49c5neKW0FsVX
         2KUN2qea3xLYmEw5t3DrD86jS891p8KRadRkpr7V/I2Js9Hl91B2pgY0ZYQbONRq8nzy
         W2fk4AGs4j7d00p2te/GiOPKjShi6sN7a2w+ZEd7cUzs4TN27+SpBJHygDpmxM/pMVMK
         Ne+Q==
X-Forwarded-Encrypted: i=1; AJvYcCUZWxcRcZbayUAorwxBbS1hVX1+I1bMgtFwb4BZ+hE5KdI/WRkXq7D3xa0GAopilt/mOIcHEUi9Nsw9I/tS@lists.linux.dev
X-Gm-Message-State: AOJu0YxO3UDP83zDzDMzw2yPp0EdZ6JIlH6iVIjSPWtz0Gg5G83mgrxi
	b0PCNcYxMpJ5CFhrrR/aOIXM6mjtm6wGNDWvQ5shyna7sUDG1Mvvp1b8MTEiQy+I
X-Gm-Gg: ASbGncsVuINrX5hkXmQa68fP2vEiyO+VvP7GyXb1GtGmCvrfcR1XPRFhtk17B8zeh6w
	ftaJstBLFrmXxCzvoT4+tb2EGK7c7TDRgd7irBaQJ8T+t/UubDCkFOzHH1X1KUKmXW1GJW6uPR4
	79nL24LgpLRddqLtATXiqyVogRrJ6Bzw6pckjk/88LSe4DIgF1eO8wYoL9GpEY1mrsB865PcEjR
	EqBqmLRZcwP1unLHHdc0qnzUBI5y3TEVJNsuauBa8nBBSZoUPRLVuB3zpOzYovH6fJ2XcWih0hP
	kF1d3EWU9ANgo4RuiIt+F2Xh7HMvTLKUmdbKZzGjl7QXuYsuh48336Ph5853MynDYS3G67GyvXV
	gesZPSJKmMYlsdlO9qZZhpsEfYNy6uqp3szwEvTe/lYY4+k47Cqo5Uxq4kWlK1Rm+PmRiuKg=
X-Google-Smtp-Source: AGHT+IGCJ0iQOsEa8SIyrhFqiWZLhqKiYQvE8pQkxepatiALLrFQhfNnH9/9GidtqRbKV2h1jFqEMA==
X-Received: by 2002:a05:6122:3c8f:b0:539:5cff:8070 with SMTP id 71dfb90a1353d-53a52eecc45mr4152053e0c.9.1754902516740;
        Mon, 11 Aug 2025 01:55:16 -0700 (PDT)
Received: from mail-vs1-f51.google.com (mail-vs1-f51.google.com. [209.85.217.51])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-539b028c565sm2593649e0c.16.2025.08.11.01.55.16
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 Aug 2025 01:55:16 -0700 (PDT)
Received: by mail-vs1-f51.google.com with SMTP id ada2fe7eead31-500006b3efdso3893078137.1
        for <oe-kbuild-all@lists.linux.dev>; Mon, 11 Aug 2025 01:55:16 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUsEFsTbCi2v1FFQdo7g7MSgMRKHDqWV4Im8ONEtF9+GFfsdyio9WHVnAjjr6kVocOAQp12aQXnNLrzFzYe@lists.linux.dev
X-Received: by 2002:a05:6102:160a:b0:4fc:1987:fc84 with SMTP id
 ada2fe7eead31-5060f4b66f2mr4026964137.21.1754902515854; Mon, 11 Aug 2025
 01:55:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20250805073748.606294-2-yukuai1@huaweicloud.com>
 <202508061722.0vTVFHLe-lkp@intel.com> <7d2b0108-4d16-97fb-5de9-7438414d9ca4@huaweicloud.com>
In-Reply-To: <7d2b0108-4d16-97fb-5de9-7438414d9ca4@huaweicloud.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 11 Aug 2025 10:55:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWieP=Tk=Qgii=6mrpZNd5Mp4epSGufs5QD26tLg4joMA@mail.gmail.com>
X-Gm-Features: Ac12FXwhwvPoKhEjbebgA6PlT3FuvJCiQC1n7jaXfuYXxfXS72nh_AEZ8FaZLf0
Message-ID: <CAMuHMdWieP=Tk=Qgii=6mrpZNd5Mp4epSGufs5QD26tLg4joMA@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] lib/sbitmap: convert shallow_depth from one word
 to the whole sbitmap
To: Yu Kuai <yukuai1@huaweicloud.com>
Cc: kernel test robot <lkp@intel.com>, axboe@kernel.dk, akpm@linux-foundation.org, 
	ming.lei@redhat.com, dlemoal@kernel.org, jack@suse.cz, 
	oe-kbuild-all@lists.linux.dev, linux-block@vger.kernel.org, 
	linux-kernel@vger.kernel.org, yi.zhang@huawei.com, yangerkun@huawei.com, 
	johnny.chenyi@huawei.com, "yukuai (C)" <yukuai3@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Kuai,

On Thu, 7 Aug 2025 at 23:37, Yu Kuai <yukuai1@huaweicloud.com> wrote:
> =E5=9C=A8 2025/08/06 17:41, kernel test robot =E5=86=99=E9=81=93:
> > All error/warnings (new ones prefixed by >>):
> >
> >     In file included from ./arch/sparc/include/generated/asm/div64.h:1,
> >                      from include/linux/math.h:6,
> >                      from include/linux/kernel.h:27,
> >                      from include/linux/cpumask.h:11,
> >                      from arch/sparc/include/asm/smp_32.h:15,
> >                      from arch/sparc/include/asm/smp.h:7,
> >                      from arch/sparc/include/asm/switch_to_32.h:5,
> >                      from arch/sparc/include/asm/switch_to.h:7,
> >                      from arch/sparc/include/asm/ptrace.h:120,
> >                      from arch/sparc/include/asm/thread_info_32.h:19,
> >                      from arch/sparc/include/asm/thread_info.h:7,
> >                      from include/linux/thread_info.h:60,
> >                      from arch/sparc/include/asm/current.h:15,
> >                      from include/linux/sched.h:12,
> >                      from lib/sbitmap.c:7:
> >     lib/sbitmap.c: In function '__map_depth_with_shallow':
> >     include/asm-generic/div64.h:183:35: warning: comparison of distinct=
 pointer types lacks a cast
> >       183 |         (void)(((typeof((n)) *)0) =3D=3D ((uint64_t *)0)); =
 \
> >           |                                   ^~
> >     lib/sbitmap.c:222:20: note: in expansion of macro 'do_div'
> >       222 |         reminder =3D do_div(shallow_word_depth, sb->depth);
> >           |                    ^~~~~~
>
> /* The unnecessary pointer compare is there
>   * to check for type safety (n must be 64bit)
>   */
> # define do_div(n,base) ({
>
> I didn't notice that under specific arch, do_div() will require the fist
> paramater to be 64bit.

do_div() is strictly meant for a 64-by-32 div/mod operation.

Gr{oetje,eeting}s,

                        Geert

--=20
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k=
.org

In personal conversations with technical people, I call myself a hacker. Bu=
t
when I'm talking to journalists I just say "programmer" or something like t=
hat.
                                -- Linus Torvalds
