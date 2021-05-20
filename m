Content-Type: multipart/mixed; boundary="===============6596235252617001459=="
MIME-Version: 1.0
From: Arnd Bergmann <arnd@arndb.de>
To: kbuild-all@lists.01.org
Subject: Re: [asm-generic:compat-alloc-user-space-9 6/41] net/ethtool/ioctl.c:815:9: error: implicit declaration of function 'in_ia32_syscall'; did you mean 'in_compat_syscall'?
Date: Thu, 20 May 2021 09:30:18 +0200
Message-ID: <CAK8P3a2Mg0jHDxb9h+_9ox74gYp7v2jQFN2QOswT=VRpbPbMzA@mail.gmail.com>
In-Reply-To: <20210520051951.GA21165@lst.de>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6596235252617001459==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 20, 2021 at 7:19 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, May 19, 2021 at 10:33:08PM +0200, Arnd Bergmann wrote:
> >  static bool ethtool_translate_compat(void)
> >  {
> > -#ifdef CONFIG_X86_64
> > +#if defined(CONFIG_X86_64) && !defined(CONFIG_UML)
> >         /* On x86, translation is needed for i386 but not x32 */
> >         return in_ia32_syscall();
> >  #else
>
> Please just use compat_need_64bit_alignment_fixup() instead.

Ah perfect, thanks for adding that interface.

       Arnd
--===============6596235252617001459==--

