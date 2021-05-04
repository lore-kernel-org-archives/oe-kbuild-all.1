Content-Type: multipart/mixed; boundary="===============6054581668504548688=="
MIME-Version: 1.0
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: kbuild-all@lists.01.org
Subject: Re: [stable:linux-5.4.y 5541/6083] ERROR: "__memcat_p" [drivers/hwtracing/stm/stm_core.ko] undefined!
Date: Tue, 04 May 2021 06:42:57 +0200
Message-ID: <YJDQ0ePGHxmcB7dX@kroah.com>
In-Reply-To: <CAK8P3a3KLasm-CdcM3HCP6EZO1Vr0ay17jw7zSy0btqPr32WRg@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6054581668504548688==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Mon, May 03, 2021 at 09:16:42PM +0200, Arnd Bergmann wrote:
> On Mon, May 3, 2021 at 7:00 PM 'Nick Desaulniers' via Clang Built
> Linux <clang-built-linux@googlegroups.com> wrote:
> > > > >> ERROR: "__memcat_p" [drivers/hwtracing/stm/stm_core.ko] undefine=
d!
> > >
> > > I'm fairly sure this is unrelated to my patch, but I don't see what
> > > happened here.
> >
> > It's unrelated to your patch. It was fixed in 5.7 by
> > 7273ad2b08f8ac9563579d16a3cf528857b26f49 and a few other dependencies
> > according to https://github.com/ClangBuiltLinux/linux/issues/515.
> >
> =

> Ah right, the big hammer.
> =

> Greg, not sure what we want to do here. Backporting
> =

> 7273ad2b08f8 ("kbuild: link lib-y objects to vmlinux forcibly when
> CONFIG_MODULES=3Dy")
> =

> to v5.4 and earlier would be an easy workaround, but it has the potential
> of adding extra bloat to the kernel image since it links in all other
> library objects as well.

I've lost the thread here, but what _real_ problem is happening here
that doing the above is required?

thanks,

greg k-h
--===============6054581668504548688==--

