Received: from mail-vs1-f44.google.com (mail-vs1-f44.google.com [209.85.217.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B172D37C92D
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 09:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.217.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776071733; cv=none; b=brHptVFtEWS3WFgetegJw/+XZfCWnddH6EiVEaIos2+EHOPoAYFjSj36UqWx6TmXIb04KjrE8OeLlLsuO9jIEcltpd910uAuAyIOGNwrW3TPcApKyHaZZ9oWQslh469I4tL0dOi36bCgVWfnaWFEUtjsQPOI5IWO1UftVaoM2Wc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776071733; c=relaxed/simple;
	bh=ZsNKzos9LEUmySr9kZSQKigI0Q+1XYDnHm0ryOKrXRw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ndHZJ7I5trRTO98DYkg1Q0kT1HOeNqPTGpXHpWvlR7W/NkKMCIRoszf3Utv0qrdRh1oPQ/h2UbK17r1S+eYqHQzhBiJbKvyEXrzLuZ6p5kxU7SOZgyPBwRXF1otxtf/Ob9ReHdzcZiUd0/ffgfJgNBNnDFQ6DaLtJcEw7s7DMIs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.217.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f44.google.com with SMTP id ada2fe7eead31-60579b9c0ccso3502218137.3
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 02:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776071731; x=1776676531;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cVjU0uTmz9oSXMwkITeM/SU6oQUUJyXqwOeIr3UHY04=;
        b=lC+dWc+SM9oEL284kyIyfCkyCvjqsspU+eyc3LQG22t0krg0WeSYn5zp464TxiJRWn
         wer7azDPc2e70zyGvHdp1sDqHJZ0IGmMhCMcEaBAhbLsyQsbs8yAjWCDDUeMQLCvWrEg
         1ok/BERnRzVOLStC3FZY5Rxc1i/dfBxPakHcmo+mInZg7mSXYOZQ/H8ldWIQnXmSJmW1
         e5p00rtElQuKM+D4JH5bWP+Ppc3OmAYhFlAH0mC4PSL1JatTzMJeM0Hfy7SzIImuZ/E7
         +/oXFeUDd9k3qVggfOqeCU8e+Pv+5td/a9py/d/x2LBPLGzs3HUZnmILw2wuwV8d7HLU
         mrMA==
X-Forwarded-Encrypted: i=1; AFNElJ+BQY+fx/IZJuyTqrp16mLH8Go+ylanefvLdb/VOoMhWGR2kpi7XRMJrXkvkk65+T3LPES8q7oedMmSZdLF@lists.linux.dev
X-Gm-Message-State: AOJu0YxQkyBHoxCP//dXyTVuOinaLs4Z6dkkBT4Js+1S9pbH3xUhn5UG
	lP6pGXe1gGLPS4V+pesqSa6qbF7Ev0aMwXvYqGbEbznNK7F/rHvBO/R4nd2KUAU6
X-Gm-Gg: AeBDiesI8pM9040Cf0x97FocrAdQZmFXJyUifFGcsr6ctoUWt4O2N1s6W/JvmVk2gJx
	3oeW26y+Wd6K4rk/jZLE85C4nKZEfo5mqLFxqQ7liNjffFiOkfwdjQlwWu6dBDuA16WlEFg+YYb
	9IL3SeZRCYy7nfF5nCyJJWGV63gfALCjZCdkZew7CfxELrK7OufeXBNL/xZdI9pa9oznsNqFmtd
	MA6JFRts1Yr+zS3SEWnlNKG6yU/jYQsgH1EGwDE/avCUlebrxyJ3+ebWWGChnOHiSUqtbkU1VLK
	quUwSPvEpzE8HozuJ/CZmRW3yz/D1DBcOdKr29ukqSk+DtiqWzHoUuXc+QXUhfSB3DGqyVLqduF
	ULeKj0P3wtX4VaU/nTXLnp84irehX2OAZeFvMnoHCYFkI5v4a4YUp2sdNO+0IwWQ+DZ6b1XOQ9e
	eksRuDf958Ohh3YK2xsmt+Qt97ppjpX3bQRZ+vX5PKuI3XNLhpOFlzuzlnaRDQPqLelBgs73c=
X-Received: by 2002:a05:6102:3312:b0:602:7470:2428 with SMTP id ada2fe7eead31-609fedc8e58mr5139311137.10.1776071730496;
        Mon, 13 Apr 2026 02:15:30 -0700 (PDT)
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com. [209.85.217.49])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-609d8c5b7fbsm5874613137.1.2026.04.13.02.15.29
        for <oe-kbuild-all@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Apr 2026 02:15:29 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id ada2fe7eead31-605823aec55so2473330137.2
        for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Apr 2026 02:15:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ/Gw0v2R6/oAkAcmK86+ZSckZMANDQfEkykAbjTdoJ4Z6uaUPeokoqjSFxFxIDIYGWdEl5u+AL5XFtEdxlh@lists.linux.dev
X-Received: by 2002:a05:6102:1621:b0:605:19ce:9ccf with SMTP id
 ada2fe7eead31-609ff2bc0b7mr5281930137.13.1776071729144; Mon, 13 Apr 2026
 02:15:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202604101721.fsv5XmCX-lkp@intel.com> <2fb2a553-3e67-497e-b964-7fa5f940e8a1@gmail.com>
 <1e02bd10a68747f4a342caedde76ef04@realtek.com> <CAMuHMdWW=CFtTKG7ZqsULvo4hpOWh8miBZPemR6L2n1qCNvTWg@mail.gmail.com>
 <c09417ea7d534e2c812d470bd166fa3a@realtek.com>
In-Reply-To: <c09417ea7d534e2c812d470bd166fa3a@realtek.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Apr 2026 11:15:17 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVWW1SOq_=FUZfqLyYKEgwVW_k+FywdYCu5j6Rnrv_GXg@mail.gmail.com>
X-Gm-Features: AQROBzAk2GPyCRhhTrCHVH7dCcNReXAAM23HdOL342gHEGoBnlwZgt9nhpaU3jk
Message-ID: <CAMuHMdVWW1SOq_=FUZfqLyYKEgwVW_k+FywdYCu5j6Rnrv_GXg@mail.gmail.com>
Subject: Re: include/linux/build_bug.h:78:41: error: static assertion failed:
 "sizeof(struct rtw8814a_efuse) == 512"
To: Ping-Ke Shih <pkshih@realtek.com>
Cc: Bitterblue Smith <rtl8821cerfe2@gmail.com>, kernel test robot <lkp@intel.com>, 
	"oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Arnd Bergmann <arnd@arndb.de>
Content-Type: text/plain; charset="UTF-8"

Hi Ping-Ke,

CC Arnd

On Mon, 13 Apr 2026 at 02:48, Ping-Ke Shih <pkshih@realtek.com> wrote:
> > On Fri, 10 Apr 2026 at 14:15, Ping-Ke Shih <pkshih@realtek.com> wrote:
> > > Bitterblue Smith <rtl8821cerfe2@gmail.com> wrote:
> > > > On 10/04/2026 12:25, kernel test robot wrote:
> > > > > tree:    https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
> > > > > head:   9a9c8ce300cd3859cc87b408ef552cd697cc2ab7
> > > > > commit: deb3ddeb18652118956fb581a39ac299e1ee5623 wifi: rtw88: Enable the new RTL8814AE/RTL8814AU
> > drivers
> > > > > date:   1 year, 1 month ago
> > > > > config: arm-randconfig-001-20260410
> > (https://download.01.org/0day-ci/archive/20260410/202604101721.fsv5XmCX-lkp@intel.com/config)
> > > > > compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
> > > > > reproduce (this is a W=1 build):
> > (https://download.01.org/0day-ci/archive/20260410/202604101721.fsv5XmCX-lkp@intel.com/reproduce)
> > > > >
> > > > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > > > the same patch/commit), kindly add following tags
> > > > > | Fixes: deb3ddeb1865 ("wifi: rtw88: Enable the new RTL8814AE/RTL8814AU drivers")
> > > > > | Reported-by: kernel test robot <lkp@intel.com>
> > > > > | Closes:  https://lore.kernel.org/oe-kbuild-all/202604101721.fsv5XmCX-lkp@intel.com/
> > > > >
> > > > > All errors (new ones prefixed by >>):
> > > > >
> > > > >    In file included from include/linux/bitfield.h:10,
> > > > >                     from include/linux/fortify-string.h:5,
> > > > >                     from include/linux/string.h:389,
> > > > >                     from include/linux/uuid.h:11,
> > > > >                     from include/linux/mod_devicetable.h:14,
> > > > >                     from include/linux/usb.h:5,
> > > > >                     from drivers/net/wireless/realtek/rtw88/rtw8814a.c:5:
> > > > >>> include/linux/build_bug.h:78:41: error: static assertion failed: "sizeof(struct rtw8814a_efuse)
> > == 512"
> > > >
> > > > struct rtw_2g_txpwr_idx is missing __packed. Could that be the reason
> > > > for the error? I don't see what else could be causing it.
> > > >
> > >
> > > I also found that flaw, but it isn't cause. I download cross compiler
> > > to build arm on my x86, and address the cause is:
> > >
> > > diff --git a/drivers/net/wireless/realtek/rtw88/rtw8814a.h
> > b/drivers/net/wireless/realtek/rtw88/rtw8814a.h
> > > index c57c7c8f915e..7f2260117487 100644
> > > --- a/drivers/net/wireless/realtek/rtw88/rtw8814a.h
> > > +++ b/drivers/net/wireless/realtek/rtw88/rtw8814a.h
> > > @@ -51,10 +51,15 @@ struct rtw8814a_efuse {
> > >         union {
> > >                 struct rtw8814au_efuse u;
> > >                 struct rtw8814ae_efuse e;
> > > -       };
> > > +       } __packed;
> >
> > How can that make a difference?
> > Both rtw8814au_efuse and rtw8814ae_efuse contain just (the same number
> > of) bytes, so __packed on the union should not make any difference?
> > Moreover, rtw8814au_efuse and rtw8814ae_efuse are already tagged with
> > __packed, which should also not make any difference.  Someone's been
> > sprinkling too many __packed all over the place?
>
> I have similar thought as yours, but arm-linux-gnueabi-gcc compiler seems
> have special treatment with union. For this case, without __packed
> the offset of followed field res5 will become 0xe0.

Hmm, I can confirm the original issue, and that adding __packed does
have an impact (it reduces the size of rtw8814a_efuse from 522 to 520),
but the actual size is still wrong (should be 512).

drivers/net/wireless/realtek/rtw88/rtw88xxa.h has a similar issue, but
adding __packed does not make a difference there.

Removing the __packed from struct rtw8814au_efuse increases its size
from 14 to 16 bytes.  Looks like that ABI pads every structure to a
multiple of 4 bytes?

>
> When investing this error, I also found another waning [1].
>
> I don't know why the compiler treats the union so special, and I fix
> them by experimental results.
>
> [1] https://lore.kernel.org/linux-wireless/20260411072509.1556635-1-pkshih@realtek.com/T/#u
>
> >
> > >         u8 res5[0x122];                 /* 0xde */
> > >  } __packed;
> > >
> > > I will send a patch soon.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
