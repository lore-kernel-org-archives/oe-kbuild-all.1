Content-Type: multipart/mixed; boundary="===============2304500074851607849=="
MIME-Version: 1.0
From: Russell King - ARM Linux admin <linux@armlinux.org.uk>
To: kbuild-all@lists.01.org
Subject: Re: arch/arm/boot/compressed/decompress.c:50: warning: "memmove" redefined
Date: Sun, 09 May 2021 17:25:01 +0100
Message-ID: <20210509162501.GJ1336@shell.armlinux.org.uk>
In-Reply-To: <CACRpkdaNVg9zgaDN0JG+Z8dMMk+0fdpYHwGMHS-FKUG9MZAb4w@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2304500074851607849==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, May 09, 2021 at 05:17:49PM +0200, Linus Walleij wrote:
> OK, paging in the KSan mailing list and key people.
> =

> Certainly this problem must be the same on all platforms
> using an XZ-compressed kernel and not just Arm?
> =

> What I wonder is why the other platforms that use
> XZ compression don't redefine memmove and
> memcpy in their decompress.c clause for XZ?
> =

> Can we just delete these two lines?
> #define memmove memmove
> #define memcpy memcpy

We can't. XZ has:

#ifndef memmove
/* Not static to avoid a conflict with the prototype in the Linux
 * headers. */
void *memmove(void *dest, const void *src, size_t size)
{
...
}
#endif

So, if memmove is not defined in the preprocessor, the code will create
its own implementation. memmove() is also defined in
arch/arm/boot/compressed/string.c for use with other decompressors, so
the local version in lib/decompress_unxz.c will conflict and cause a
link time error.

The addition of KASan added this to arch/arm/include/asm/string.h:

#if defined(CONFIG_KASAN) && !defined(__SANITIZE_ADDRESS__)
#define memcpy(dst, src, len) __memcpy(dst, src, len)
#define memmove(dst, src, len) __memmove(dst, src, len)
#define memset(s, c, n) __memset(s, c, n)

#ifndef __NO_FORTIFY
#define __NO_FORTIFY /* FORTIFY_SOURCE uses __builtin_memcpy, etc. */
#endif

#endif

created a conditional definition of memmove in the preprocessor, which
ultimately caused this problem. lib/decompress_unxz.c wants it defined
in the preprocessor _if_ one has a local implementation (we do.)

Given that KASan should be disabled in the decompressor, maybe the
conditional added by KASan to asm/string.h is insufficient? The
makefile has:

KASAN_SANITIZE          :=3D n

So really we should not be playing _any_ KASan games in the
decompressor code.

-- =

RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 40Mbps down 10Mbps up. Decent connectivity at last!
--===============2304500074851607849==--

