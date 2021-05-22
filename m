Content-Type: multipart/mixed; boundary="===============8122142409430341281=="
MIME-Version: 1.0
From: José Expósito <jose.exposito89@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 3/5] HID: magicmouse: Magic Trackpad 2 USB battery capacity
Date: Sat, 22 May 2021 19:41:47 +0200
Message-ID: <20210522174147.GA7547@elementary-os.localdomain>
In-Reply-To: <eeba0785-1d5c-7d4a-d5c4-af6ffb3f4f8b@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8122142409430341281==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 05:18:51PM +0800, Rong Chen wrote: =

> Hi Jos=C3=A9 Exp=C3=B3sito,
> =

> I think it's related to HAS_IOMEM in drivers/usb/Kconfig:
> =

> menuconfig USB_SUPPORT
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 bool "USB support"
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 depends on HAS_IOMEM
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 default y
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 help
> =

> =

> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 This option adds c=
ore support for Universal Serial Bus (USB).
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 You will also need=
 drivers from the following menu to make use of
> it.
> =

> and I found a similar issue fixed by the below commit:
>
> [...]
> =

> Best Regards,
> Rong Chen

Hi Rong,

Thank you very much for taking the time to help me out with this issue, I r=
eally appreciate it.

As you mentioned, the issue was related with depends on in Kconfig, I'll em=
ail a new version of the patches.

Best regards,
Jose
--===============8122142409430341281==--

