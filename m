Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA7233F587
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 15:29:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775921385; cv=none; b=SMFHxNUC5dqO5jMGA1QVZ2pzEd8BbRcKmejCrZpuSpmf74I19D+xG/hVeeazZEK30GnaeIRxSX0yvUL7iO7hBYhHNVSjHBJb0yq6sNij+YCzapMBnJhXIX7SHNQU05iNtgHOjBiHrCzPxh5fgRvauuK9qsdHlCpQC5ry7Z2v13I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775921385; c=relaxed/simple;
	bh=2aQsCP0k9+sTXVi1Kowj4LqHzndrUZ58UNajtM7ZlyE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MKmnP1ZfadlIo3g5xFTw0jmVs8cDJSGuu3NR5Ire223gFxfxtwDegdGX4WEfBa0lbxVTvpNf41pupSGwagp+Xb4RowLGtaWYXbh38k+9LFRpzRekL9IerBj/BMRM6R2zEeQU1Au83iyNiDQ0r4XBrcN4LOzPa/lHRGxM3tDdr2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56daad0fdbaso1007017e0c.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 08:29:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775921382; x=1776526182;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=z7Uob3PPQ2wMJ7rBeRrgMGe2UIDEqi7OD7mw9wckD6g=;
        b=KeugfUY63PkysJ8NYf/NhCd4X5UfrRL8sdG3pEIgcEFpKqhmtVz6Rcv99zBSwpU+xa
         qTbCKfn0VyCjtGVJNxrtFjzee8P71fKltsXQF+us479AblAt5/FhLECxYsxn4KO7KNYM
         a6cN1XFshXapOBY6PKTJ8tiIRDMBN6imgJAoewgh7fbMsc1MdV6H9S8Npyj//Vh13J0n
         fOzn3RD9yqBNOlcy2fYXoMOCKua1lKkSs7g1M8UN/pG8NCm3YlyWLebiIAilyGNCClYv
         61IX3RsViavxgjbdkYED7gPwsDOgLjq083iOvVXTOn0rXcu7PkolbbXPuxcHE4dVgGz4
         REOg==
X-Forwarded-Encrypted: i=1; AJvYcCXz2vsihpG1bv+YzNdQM2cJxckuQF3oAt2/NDaTNWXwmRtvvWoH7EbLBfaakrDuamjRuotWvto/xvhpuUkM@lists.linux.dev
X-Gm-Message-State: AOJu0YyDWKd5IqDegzNmkW6fHBsdeOGtyZEhjrxWjp2vpDfjBViin6xH
	RjBcfsBqGQo8bAAaQx21MAlCB+VKi/9OwJi/FzMMPwOgX+KwuRVcoJ0tuGrpmK09
X-Gm-Gg: AeBDiesEbG6X0Lg1HlMcfVWdrhFC2QaY78cAX8hJ/uRybcEX1CPiDYrUwcS+DJGMUvO
	UMkvquqDVcBfwKC8lSOgm5n2qPEVkzC5d3aZQxWantwUBSoofje7DmLCYO9Re6LH92xo1pcQWoU
	o7xkGMRUyvYnRsUNDjPYK+Gv1PNksE7hvLTuhNn/xKqhhgefEQLZBYbrt8smCSw6UliYXUWRiNC
	auiYzCxQ+75WJUZs0Xo+pC90656fog/jchuwgLV4jZQ/2iK+5LCQXhAPtPBlTe49uXy6ovH0o+/
	rlZKkcCL1N9ojonSE5oqF+AFuqvu1VsIJusOH2OJfhCA2QcuJXNvwRUnpRdFdV/WpA2p4jHMaCJ
	1gxq7WmEQ52OOHuAwixQFsXeRMJYnUrr5qWdubHq1Pvovc61XaZAiJ8RHaPzlWpaqta/aOrNxOP
	GjOcIJwNlVnFtmJO1zLIA+ReflbpHJDI0uXMz4dL7T4d1PY04YwnX1SZjRwSbEeUww
X-Received: by 2002:a05:6122:4d01:b0:56e:e33f:2ffd with SMTP id 71dfb90a1353d-56f3bd48718mr3185862e0c.14.1775921382136;
        Sat, 11 Apr 2026 08:29:42 -0700 (PDT)
Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com. [209.85.221.182])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-56f3b96fa41sm3977080e0c.11.2026.04.11.08.29.41
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 11 Apr 2026 08:29:42 -0700 (PDT)
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-56daad0fdbaso1007015e0c.3
        for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 08:29:41 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXnOU+bdznzWZOHv8fk41muSu/VsT9JLqnkJh9QDdERrlSNKglVroqj80o7G2Uz6k0+rdSw65TnsslkJUp3@lists.linux.dev
X-Received: by 2002:a05:6122:788:b0:56d:a755:ec64 with SMTP id
 71dfb90a1353d-56f3bca3b67mr3164767e0c.11.1775921381742; Sat, 11 Apr 2026
 08:29:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604101721.fsv5XmCX-lkp@intel.com> <2fb2a553-3e67-497e-b964-7fa5f940e8a1@gmail.com>
 <1e02bd10a68747f4a342caedde76ef04@realtek.com>
In-Reply-To: <1e02bd10a68747f4a342caedde76ef04@realtek.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Sat, 11 Apr 2026 17:29:30 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWW=CFtTKG7ZqsULvo4hpOWh8miBZPemR6L2n1qCNvTWg@mail.gmail.com>
X-Gm-Features: AQROBzD6uxwOygCVW8JBfaQ1bRO6xZFv71N98HzJV65CxSBzGuUEUBkW4J7xbS8
Message-ID: <CAMuHMdWW=CFtTKG7ZqsULvo4hpOWh8miBZPemR6L2n1qCNvTWg@mail.gmail.com>
Subject: Re: include/linux/build_bug.h:78:41: error: static assertion failed:
 "sizeof(struct rtw8814a_efuse) == 512"
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>, kernel test robot <lkp@intel.com>, 
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Ping-Ke,

On Fri, 10 Apr 2026 at 14:15, Ping-Ke Shih <pkshih@realtek.com> wrote:
> Bitterblue Smith <rtl8821cerfe2@gmail.com> wrote:
> > On 10/04/2026 12:25, kernel test robot wrote:
> > > tree:    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > head:   9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
> > > commit: deb3ddeb18652118956fb581a39ac299e1ee5623 wifi: rtw88: Enable the new RTL8814AE/RTL8814AU drivers
> > > date:   1 year, 1 month ago
> > > config: arm-randconfig-001-20260410 (https://download.01.org/0day-ci/archive/20260410/202604101721.fsv5XmCX-lkp@intel.com/config)
> > > compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
> > > reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260410/202604101721.fsv5XmCX-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Fixes: deb3ddeb1865 ("wifi: rtw88: Enable the new RTL8814AE/RTL8814AU drivers")
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes:  https://lore.kernel.org/oe-kbuild-all/202604101721.fsv5XmCX-lkp@intel.com/
> > >
> > > All errors (new ones prefixed by >>):
> > >
> > >    In file included from include/linux/bitfield.h:10,
> > >                     from include/linux/fortify-string.h:5,
> > >                     from include/linux/string.h:389,
> > >                     from include/linux/uuid.h:11,
> > >                     from include/linux/mod_devicetable.h:14,
> > >                     from include/linux/usb.h:5,
> > >                     from drivers/net/wireless/realtek/rtw88/rtw8814a.c:5:
> > >>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct rtw8814a_efuse) == 512"
> >
> > struct rtw_2g_txpwr_idx is missing __packed. Could that be the reason
> > for the error? I don't see what else could be causing it.
> >
>
> I also found that flaw, but it isn't cause. I download cross compiler
> to build arm on my x86, and address the cause is:
>
> diff --git a/drivers/net/wireless/realtek/rtw88/rtw8814a.h b/drivers/net/wireless/realtek/rtw88/rtw8814a.h
> index c57c7c8f915e..7f2260117487 100644
> --- a/drivers/net/wireless/realtek/rtw88/rtw8814a.h
> +++ b/drivers/net/wireless/realtek/rtw88/rtw8814a.h
> @@ -51,10 +51,15 @@ struct rtw8814a_efuse {
>         union {
>                 struct rtw8814au_efuse u;
>                 struct rtw8814ae_efuse e;
> -       };
> +       } __packed;

How can that make a difference?
Both rtw8814au_efuse and rtw8814ae_efuse contain just (the same number
of) bytes, so __packed on the union should not make any difference?
Moreover, rtw8814au_efuse and rtw8814ae_efuse are already tagged with
__packed, which should also not make any difference.  Someone's been
sprinkling too many __packed all over the place?

>         u8 res5[0x122];                 /* 0xde */
>  } __packed;
>
> I will send a patch soon.
>
> Ping-Ke

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
