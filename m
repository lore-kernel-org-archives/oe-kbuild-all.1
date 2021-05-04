Content-Type: multipart/mixed; boundary="===============4659708044718537912=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: kbuild-all@lists.01.org
Subject: Re: [stable:linux-5.4.y 5541/6083] ERROR: "__memcat_p" [drivers/hwtracing/stm/stm_core.ko] undefined!
Date: Tue, 04 May 2021 12:46:05 +0200
Message-ID: <CAK8P3a2-ttarw-31YTbq1YbwAxvG3HwouKC9u1YjfyQwMhwovw@mail.gmail.com>
In-Reply-To: <YJEFF1iHZ4o7LUgV@kroah.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4659708044718537912==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 4, 2021 at 10:26 AM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:

> On Tue, May 04, 2021 at 09:41:14AM +0200, Arnd Bergmann wrote:
> > which is the same as what 7273ad2b08f8 does, but only for this one file
> > instead of all of lib/*.o.
>
> I think a "one off" change would be best here.  Can you submit it?

Sent https://lore.kernel.org/lkml/20210504104441.1317138-1-arnd(a)kernel.or=
g/T/

      Arnd
--===============4659708044718537912==--

