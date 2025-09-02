Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8680D31DD9A
	for <oe-kbuild-all@lists.linux.dev>; Tue,  2 Sep 2025 15:29:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756826970; cv=none; b=qDzwaEybpBCCTJPNiVbtAwuJIRZ1a/D8AZ/hDAvOSaeSZYR6IH55YazLGS6PWSZis+MGFGdlCNYaGsNmvfiT7kQnYGLeb15bZMQcU5VZG6PCnTWP7iLdUxnneDM33g9cH2icH6wChpzS/GQc2yFLuKEWA/Ih/xbsaR7j/Wd2OAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756826970; c=relaxed/simple;
	bh=h/7pKLheTp60yfS64v6Q3yrnFtkNU0n6rfzoGNGi9Iw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GASL/i4I20aeiZIfnKAF6Dbnta/5dXxcVPa3Ikfvb9Ojqv3aU8fDo/qf1lUYfIX4xfrBZnkTFZOfjfUOxT/CvcZYiZBbV2pw6r7uqBWU2EdEVOvOemWOgC6Qoldo1GhxhaSESWbc5Og1DS/16PkFmem2YkTvwSJGQnd4mFwDbh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CZQZLBOE; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CZQZLBOE"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3369d3513faso48818861fa.0
        for <oe-kbuild-all@lists.linux.dev>; Tue, 02 Sep 2025 08:29:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756826966; x=1757431766; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45D3H8+xv+cJQOWaurVBdJjz0km7uhmNmdRtwG5A/1w=;
        b=CZQZLBOEFkG32892IvrOMTBSfp80I0bIp2ZjdOjEu/ixlfUjFDJiXSZux1w9c5hmMw
         c8hWg6YC4ItOnyECnug2ROC6VTj9i2iD2pBHAxqH9jd1yFw2L5TzMzDNRatizGNFBA67
         iOu7br13Yp+wFnofJt4DVAI1vgPJ0sLRNdc90Vk6i/ZsU8OoDoE9U3Dfcu8nuqHG+SAS
         6x19Xr8c6YJKxsncEcuq04CbL/LB13A2WBBhVqTTEvsNL5zweT2226352LBa2Db+2jI6
         ikrsRZEOaRP8qs9JUpoC6YGlJRJo18+NN1Asbg0PqhRS2mmhgwUSzw9QiNFD7mkydmJt
         ZwEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756826966; x=1757431766;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=45D3H8+xv+cJQOWaurVBdJjz0km7uhmNmdRtwG5A/1w=;
        b=NtrRybK5gUZ2SDCxciNoiOPyV6jPluMAbKs9nB0urV3+MfE6tDUC78+cwc1AyJj4Ce
         Lmp+VkaE5s9LkhTC5xUNQoXW8EPnJUXJPgClbyAfzLMqY2i2DcvvL+oCqiq91x7swQpg
         qH3Nz/Oq+mVsh4X96KKvz7r+r5EBn9pqbe1PeEYBvZ0X+TY71WptqANO+pvJx8q72Xrb
         b6SuFsfK98dTyRXpj6wgO1wzWgrglh/grDAKmXQS1xMJtO02H0IHPki/1KloOuuhehMG
         Z6cjxCT6vUl+V7Y2NZfcCR7o5BJlt5e3YYR3jq99OYxY4npdqnUvWFhK1O5dExURXmGr
         813w==
X-Forwarded-Encrypted: i=1; AJvYcCURRnUbq6V3sYovZt6ziiyIFYm9KpXc+sjm0YiYnKGiBmsPXQ86+uc5OdruCcP+pQrqN7UFensAYOT/bSO6@lists.linux.dev
X-Gm-Message-State: AOJu0Yy6qnXgQ6DlTzHe2ArzAwYtLcu4zo3rJ/hVHGgX/d7FkmKZy85I
	tdiMgNDlwafnCZ1nzZMtxPuNmsujB7GF3PO3PPLEgxjsWXNz/Vy8iv/pgXNniDJiwJs+Hrcuk8+
	PP28Y8ELY23Xzv0YDhNsRfjBAt5v8szM=
X-Gm-Gg: ASbGncshHRCOiYHhRHlSbsiGge5q6j0sSCFfLTZWtjXkOZxTybeiNQscQyYn9p76B+a
	FKO9cBKF5dwL3oY65BlvLERGYX13tt0zSeZhSacZuTE0sSXCEBldZZnfm8N3BCYYiLYccSXHuqx
	Mg3w3Z31TXbDM+ch1cnLN+Y7yYPbBtZH7D86G3VFbuqyod29cHefZ/xYX74zv2WMOevymEXTL0t
	4g0+amSWw8dytjgvZH+98sELx/rR40RKpGEVrBTXBdoOw==
X-Google-Smtp-Source: AGHT+IHJ+ifO3wbwufUVcTFDMp7vzAFqN/JcOC4u8JhOqaNrPYiCiSR9o2M3s+tthdJTnwxOiQhxQf4CM1nG6ewI/aE=
X-Received: by 2002:a05:651c:551:b0:336:e22d:804a with SMTP id
 38308e7fff4ca-336e22da0cdmr26270971fa.17.1756826966207; Tue, 02 Sep 2025
 08:29:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202508300413.OnIedvRh-lkp@intel.com> <b78a4255d17adbb74140aa23f89cb7653af96c75.1756513671.git.calvin@wbinvd.org>
 <84fd4012-966b-4983-b015-ffce06509b5e@molgen.mpg.de> <aLNRvzXE4O9dKZoN@mozart.vkv.me>
In-Reply-To: <aLNRvzXE4O9dKZoN@mozart.vkv.me>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Tue, 2 Sep 2025 11:29:13 -0400
X-Gm-Features: Ac12FXxpABT60qjwT9pgH_IdUsZUdnJMAR-u1w75YMCcYqqH0yYBL57h5ICrG1c
Message-ID: <CABBYNZJBDgQHwmx82H2XJ-LCeOsxc77PPo6NA4zzT0dt7Uxddw@mail.gmail.com>
Subject: Re: [PATCH] Bluetooth: btmtksdio: Fix build after header cleanup
To: Calvin Owens <calvin@wbinvd.org>
Cc: Paul Menzel <pmenzel@molgen.mpg.de>, linux-kernel@vger.kernel.org, 
	linux-bluetooth@vger.kernel.org, 
	Luiz Augusto von Dentz <luiz.von.dentz@intel.com>, oe-kbuild-all@lists.linux.dev, 
	Marcel Holtmann <marcel@holtmann.org>, Sean Wang <sean.wang@mediatek.com>, 
	linux-mediatek@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Calvin,

On Sat, Aug 30, 2025 at 3:32=E2=80=AFPM Calvin Owens <calvin@wbinvd.org> wr=
ote:
>
> On Saturday 08/30 at 07:11 +0200, Paul Menzel wrote:
> > Dear Calvin,
> >
> >
> > Thank you for your patch, and addressing the regression right away.
> >
> > Am 30.08.25 um 02:50 schrieb Calvin Owens:
> > > Syzbot found a randconfig which fails after my recent patch:
> > >
> > >      drivers/bluetooth/btmtksdio.c:442:33: error: array type has inco=
mplete element type =E2=80=98struct h4_recv_pkt=E2=80=99
> > >        442 | static const struct h4_recv_pkt mtk_recv_pkts[] =3D {
> > >            |                                 ^~~~~~~~~~~~~
> > >      drivers/bluetooth/btmtksdio.c:443:11: error: =E2=80=98H4_RECV_AC=
L=E2=80=99 undeclared here (not in a function)
> > >        443 |         { H4_RECV_ACL,      .recv =3D btmtksdio_recv_acl=
 },
> > >            |           ^~~~~~~~~~~
> > >      drivers/bluetooth/btmtksdio.c:444:11: error: =E2=80=98H4_RECV_SC=
O=E2=80=99 undeclared here (not in a function)
> > >        444 |         { H4_RECV_SCO,      .recv =3D hci_recv_frame },
> > >            |           ^~~~~~~~~~~
> > >      drivers/bluetooth/btmtksdio.c:445:11: error: =E2=80=98H4_RECV_EV=
ENT=E2=80=99 undeclared here (not in a function)
> > >        445 |         { H4_RECV_EVENT,    .recv =3D btmtksdio_recv_eve=
nt },
> > >
> > > ...because we can have BT_MTKSDIO=3Dy with BT_HCIUART_H4=3Dn, and the
> > > definitions used here are gated on BT_HCIUART_H4 in hci_uart.h.
> >
> > The drivers below seem to be affected:
> >
> >     drivers/bluetooth/bpa10x.c:     { H4_RECV_EVENT,   .recv =3D
> > hci_recv_frame },
> >     drivers/bluetooth/btmtksdio.c:  { H4_RECV_EVENT,    .recv =3D
> > btmtksdio_recv_event },
> >     drivers/bluetooth/btmtkuart.c:  { H4_RECV_EVENT,    .recv =3D
> > btmtkuart_recv_event },
> >     drivers/bluetooth/btnxpuart.c:  { H4_RECV_EVENT,        .recv =3D
> > hci_recv_frame },
> >
> > > I think the simplest way to fix this is to remove the gate on the
> > > definitions in hci_uart.h. Since the constants are macros, there's no
> > > runtime cost to doing so, and nothing seems to rely on their absence =
in
> > > the BT_HCIUART_H4=3Dn case.
> >
> > Looking at the implementation, it looks like they only work with the H4
> > protocol? So maybe, that should be denoted in the Kconfig files?
>
> Thanks for looking Paul.
>
> Yes, my fix will cause a link error with other randconfigs, which my
> 'make randconfig drivers/bluetooth/' test loop missed after I made the
> function prototype always defined, whoops.
>
> We do need the dependencies here, as you note. The btmtksdio case syzbot
> found is the odd one out because it only uses the constants, and doesn't
> call h4_recv_buf().
>
> Hopefully this gets it all:
>
> -----8<-----
> From: Calvin Owens <calvin@wbinvd.org>
> Subject: [PATCH v2] Bluetooth: Fix build after header cleanup
>
> Some Kconfig dependencies are needed after my recent cleanup, since
> the core code has its own option.
>
> Since btmtksdio does not actually call h4_recv_buf(), move the
> definitions it uses outside the BT_HCIUART_H4 gate in hci_uart.h to
> avoid adding a dependency for btmtksdio.
>
> The rest I touched (bpa10x, btmtkuart, and btnxpuart) do really call
> h4_recv_buf(), so the dependency is required, add it for them.
>
> Fixes: 74bcec450eea ("Bluetooth: remove duplicate h4_recv_buf() in header=
")
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202508300413.OnIedvRh-lkp@i=
ntel.com/
> Signed-off-by: Calvin Owens <calvin@wbinvd.org>
> ---
>  drivers/bluetooth/Kconfig    | 6 ++++++
>  drivers/bluetooth/hci_uart.h | 8 ++++----
>  2 files changed, 10 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/bluetooth/Kconfig b/drivers/bluetooth/Kconfig
> index 4ab32abf0f48..7df69ccb6600 100644
> --- a/drivers/bluetooth/Kconfig
> +++ b/drivers/bluetooth/Kconfig
> @@ -312,7 +312,9 @@ config BT_HCIBCM4377
>
>  config BT_HCIBPA10X
>         tristate "HCI BPA10x USB driver"
> +       depends on BT_HCIUART
>         depends on USB
> +       select BT_HCIUART_H4
>         help
>           Bluetooth HCI BPA10x USB driver.
>           This driver provides support for the Digianswer BPA 100/105 Blu=
etooth
> @@ -437,8 +439,10 @@ config BT_MTKSDIO
>
>  config BT_MTKUART
>         tristate "MediaTek HCI UART driver"
> +       depends on BT_HCIUART
>         depends on SERIAL_DEV_BUS
>         depends on USB || !BT_HCIBTUSB_MTK
> +       select BT_HCIUART_H4
>         select BT_MTK
>         help
>           MediaTek Bluetooth HCI UART driver.
> @@ -483,7 +487,9 @@ config BT_VIRTIO
>
>  config BT_NXPUART
>         tristate "NXP protocol support"
> +       depends on BT_HCIUART
>         depends on SERIAL_DEV_BUS
> +       select BT_HCIUART_H4
>         select CRC32
>         select CRC8
>         help
> diff --git a/drivers/bluetooth/hci_uart.h b/drivers/bluetooth/hci_uart.h
> index 5ea5dd80e297..cbbe79b241ce 100644
> --- a/drivers/bluetooth/hci_uart.h
> +++ b/drivers/bluetooth/hci_uart.h
> @@ -121,10 +121,6 @@ void hci_uart_set_flow_control(struct hci_uart *hu, =
bool enable);
>  void hci_uart_set_speeds(struct hci_uart *hu, unsigned int init_speed,
>                          unsigned int oper_speed);
>
> -#ifdef CONFIG_BT_HCIUART_H4
> -int h4_init(void);
> -int h4_deinit(void);
> -
>  struct h4_recv_pkt {
>         u8  type;       /* Packet type */
>         u8  hlen;       /* Header length */
> @@ -162,6 +158,10 @@ struct h4_recv_pkt {
>         .lsize =3D 2, \
>         .maxlen =3D HCI_MAX_FRAME_SIZE \
>
> +#ifdef CONFIG_BT_HCIUART_H4
> +int h4_init(void);
> +int h4_deinit(void);
> +
>  struct sk_buff *h4_recv_buf(struct hci_dev *hdev, struct sk_buff *skb,
>                             const unsigned char *buffer, int count,
>                             const struct h4_recv_pkt *pkts, int pkts_coun=
t);
> --
> 2.47.2

Please send a v2 then otherwise this is no pickup by the likes of CI
and patchwork.

>


--=20
Luiz Augusto von Dentz
