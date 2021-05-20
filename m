Content-Type: multipart/mixed; boundary="===============2085182184312648885=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: kbuild-all@lists.01.org
Subject: Re: [asm-generic:compat-alloc-user-space-9 6/41] net/ethtool/ioctl.c:815:9: error: implicit declaration of function 'in_ia32_syscall'; did you mean 'in_compat_syscall'?
Date: Thu, 20 May 2021 07:19:51 +0200
Message-ID: <20210520051951.GA21165@lst.de>
In-Reply-To: <CAK8P3a3ytGKfRftRqC5OaGTxNfxX5-qpbXdGG9AYHcRJFMB-RA@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2085182184312648885==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Wed, May 19, 2021 at 10:33:08PM +0200, Arnd Bergmann wrote:
>  static bool ethtool_translate_compat(void)
>  {
> -#ifdef CONFIG_X86_64
> +#if defined(CONFIG_X86_64) && !defined(CONFIG_UML)
>         /* On x86, translation is needed for i386 but not x32 */
>         return in_ia32_syscall();
>  #else

Please just use compat_need_64bit_alignment_fixup() instead.
--===============2085182184312648885==--

