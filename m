Received: from mail-ua1-f50.google.com (mail-ua1-f50.google.com [209.85.222.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 858C01B414E
	for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 08:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739866102; cv=none; b=momYHctwAd1j2zXS3IrSt4U30wSmZO/3zELt6P+88+bSqO77w7Bs+HIjLWpjdPxXfZs9il/prUmqBbrmUgwCRlA0tDQjfD+709+mJVSxU55lH/YWPqd7uGmYGCgehmKiJMojMyG194ojXGO0GfHCSDE3fPZrF/uS20q/cNgthmQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739866102; c=relaxed/simple;
	bh=j6H6oVqYMGS6D3VJkggcAv1qxGcui/OzylaqNBXvkrA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=iSSarN7+rnYj14Pnc9EblK/SesN287UfS8FkDP6CGJWDriFeDur8XghRljKhXdjBaz4BAVsWa4SM3HLoVdwGZT3qQVbxfczhe20mPTVkr2hV+GxAm3CBKRpvjdEP0LmrS1fOWVsAL9XLJQlAdhJVUag86B1d9jf0auzm6257AJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f50.google.com with SMTP id a1e0cc1a2514c-868da0af0fcso1650145241.2
        for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 00:08:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739866098; x=1740470898;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=H9MwgkOHrsarAXnf9TuQkNcaIA+s+1gcKpDOdbCbxlU=;
        b=UOa/LPYbrG294aWUYD3VTCVEQLEbicUgle5CIHZ8BBTmTX2N6C5dogmJ/RGfFn8aPk
         zprRz2QCjWLy2pzAK3OijP7/DO00oqcYPD15YuJWWdXe1NQOqzPMANACvCRzPe7noGY3
         vp8AqfMF/YSXD5JNqxb1TNbF1pzfDyMn1AvVJrXdxu3OIPrwDk1HZXqwpamIu5QzVgsm
         GVCxRrQnYtOSEXochHXlyHK1mx+rAH84fjmFhbfWMbDcFV0S+G/Neq9eO8aZBbg8Sq1g
         mP+M88FlkNwC7S+trZFycLGlgqedYFg0NZoiVVi5yJaebKVJ6FZ1ELOuEOMl7iZAQME0
         SyxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWimNrCkm9bjk1gEI93Oh5IXSSp4t/gtK8Ibkb58kzPzK7/uhyr9wA7soU52Vl+AsdMAL94WtHPQRGC4UAO@lists.linux.dev
X-Gm-Message-State: AOJu0YzcmSKWDsPbqDHxv1mSOJ4rnFA1KB28SXB9PmPKcGuv8eu3gwT+
	uMTVvlF5slDSD7vwITav/Y9SnNeV8HISkv5R7UrwCe1te9CuKopOSv+vfQ9es7Q=
X-Gm-Gg: ASbGncsFb56LrqZn7jYbCWBqzcRcSP+3/YqVfNmqP+XOCIoVrxdIAV0GpdFy0CPTFx0
	Dd1+kRUlnv9VqQPjWZG6BMESu7uLWn5IvDIzhSFhBgsMP0ZioarC7pMTigoymcBs1OZu7HjzTPH
	AfOAGMDgZeu+KDFK4s02FeJuAVvCZKx/dUqInKZG/EVr3TNOV1ZYCikfPsFuwKM6kGxzjnOXOc7
	7SvFrgwB6bsSJQS9BoYI2pIJG5udN340ygJewqcUX86GiuZoAlc1uaiGv4xLJHkAcoQkNMr4lFH
	4cjZ/gniijSMEzaGemBZ98vo4PyleLLmfGKRdzNjKd15nsecG6jVGw==
X-Google-Smtp-Source: AGHT+IEKtRMkL53/A+PX+QrEoNoYefl0OBpR4XvFYQb4D5UlLOvG1t2HlOYlva0m6mL+KnbtPXFRjQ==
X-Received: by 2002:a05:6102:f97:b0:4bb:d062:420 with SMTP id ada2fe7eead31-4bd3fc81828mr7054777137.1.1739866097734;
        Tue, 18 Feb 2025 00:08:17 -0800 (PST)
Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com. [209.85.217.47])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-868e8599602sm2085481241.18.2025.02.18.00.08.17
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Feb 2025 00:08:17 -0800 (PST)
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-4be633cacbbso460558137.3
        for <oe-kbuild-all@lists.linux.dev>; Tue, 18 Feb 2025 00:08:17 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWgmvE/9SmnzyLKIutc9gE+hDrLz0kQwDRtbkDHfK6N14C8jNpZDwDl/pzX6gsKjLkXtARiih0XefZMatdh@lists.linux.dev
X-Received: by 2002:a05:6102:f10:b0:4bb:d45c:7f4b with SMTP id
 ada2fe7eead31-4bd3fd72a27mr7350475137.11.1739866096976; Tue, 18 Feb 2025
 00:08:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202502072019.LYoCR9bF-lkp@intel.com> <2421077.NG923GbCHz@camazotz>
 <Z68CX3HMEUW00WYi@rli9-mobl> <9791da8a-fb5f-46d0-a86f-66738293d155@app.fastmail.com>
In-Reply-To: <9791da8a-fb5f-46d0-a86f-66738293d155@app.fastmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 18 Feb 2025 09:08:04 +0100
X-Gmail-Original-Message-ID: <CAMuHMdU3MazCqD6PaeyLTW1P8mVZr6BVEConT713cTHe830bTQ@mail.gmail.com>
X-Gm-Features: AWEUYZnH9dq957HqwTY97HF9xwG7uxLoVu7EqjIV6dduDusvg_uATVUem4tufXg
Message-ID: <CAMuHMdU3MazCqD6PaeyLTW1P8mVZr6BVEConT713cTHe830bTQ@mail.gmail.com>
Subject: Re: include/linux/thread_info.h:259:25: error: call to
 '__bad_copy_to' declared with attribute error: copy destination size is too small
To: Arnd Bergmann <arnd@arndb.de>
Cc: Philip Li <philip.li@intel.com>, Elizabeth Figura <zfigura@codeweavers.com>, 
	kernel test robot <lkp@intel.com>, oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Arnd,

On Fri, 14 Feb 2025 at 12:26, Arnd Bergmann <arnd@arndb.de> wrote:
> On Fri, Feb 14, 2025, at 09:44, Philip Li wrote:
> > On Mon, Feb 10, 2025 at 02:39:46PM -0600, Elizabeth Figura wrote:
> >> On Friday, 7 February 2025 06:11:47 CST kernel test robot wrote:
> >> >    In file included from include/linux/spinlock.h:60,
> >> >                     from include/linux/wait.h:9,
> >> >                     from include/linux/wait_bit.h:8,
> >> >                     from include/linux/fs.h:6,
> >> >                     from drivers/misc/ntsync.c:11:
> >> >    In function 'check_copy_size',
> >> >        inlined from 'copy_from_user' at include/linux/uaccess.h:207:7,
> >> >        inlined from 'setup_wait' at drivers/misc/ntsync.c:888:6:
> >> > >> include/linux/thread_info.h:259:25: error: call to '__bad_copy_to' declared with attribute error: copy destination size is too small
> >> >      259 |                         __bad_copy_to();
> >> >          |                         ^~~~~~~~~~~~~~~
> >>
> >> This was caught before and mentioned in [1]. The suggestion there of changing "args->count" to "count" doesn't help.
> >>
> >> Somehow gcc 12 thinks that the array_size(count, sizeof(*fds)) parameter is constant, although it's finnicky and depends on exactly where __builtin_constant_p() is evaluated.
> >>
> >> The bug goes away with gcc 13. Is this worth trying to work around? I don't have any ideas for how to do so.
> >
> > Thanks for the info, at bot side, we will ignore this error to
> > avoid further reporting on old gcc.
>
> gcc-12 isn't really "old", we support gcc-5 through gcc-14 at the moment.
>
> Maybe the change below would address it? (Not sure I handled the
> "+1" right here, but something like that should make it obvious
> to the compiler what the check is).
>
>       Arnd
>
> diff --git a/drivers/misc/ntsync.c b/drivers/misc/ntsync.c
> index 055395cde42b..ae13aae9194b 100644
> --- a/drivers/misc/ntsync.c
> +++ b/drivers/misc/ntsync.c
> @@ -873,6 +873,7 @@ static int setup_wait(struct ntsync_device *dev,
>  {
>         int fds[NTSYNC_MAX_WAIT_COUNT + 1];
>         const __u32 count = args->count;
> +       size_t size = count * sizeof(fds[0]);

array_size(), to keep the multiplication overflow check?

>         struct ntsync_q *q;
>         __u32 total_count;
>         __u32 i, j;
> @@ -880,15 +881,14 @@ static int setup_wait(struct ntsync_device *dev,
>         if (args->pad || (args->flags & ~NTSYNC_WAIT_REALTIME))
>                 return -EINVAL;
>
> -       if (args->count > NTSYNC_MAX_WAIT_COUNT)
> +       if (size >= sizeof(fds))
>                 return -EINVAL;
>
>         total_count = count;
>         if (args->alert)
>                 total_count++;
>
> -       if (copy_from_user(fds, u64_to_user_ptr(args->objs),
> -                          array_size(count, sizeof(*fds))))
> +       if (copy_from_user(fds, u64_to_user_ptr(args->objs), size))
>                 return -EFAULT;
>         if (args->alert)
>                 fds[count] = args->alert;

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
