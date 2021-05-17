Content-Type: multipart/mixed; boundary="===============5332715848947650113=="
MIME-Version: 1.0
From: Linus Walleij <linus.walleij@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 1/5] hw_random: ixp4xx: enable compile-testing
Date: Tue, 18 May 2021 00:06:25 +0200
Message-ID: <CACRpkdb3kApYFVM4X9tLWBJbGSO98vcAq7pad4DSV3sABfoduw@mail.gmail.com>
In-Reply-To: <202105120032.nxayhdgm-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5332715848947650113==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 11, 2021 at 6:22 PM kernel test robot <lkp@intel.com> wrote:

> >> drivers/char/hw_random/ixp4xx-rng.c:24:10: fatal error: linux/soc/ixp4=
xx/cpu.h: No such file or directory
>       24 | #include <linux/soc/ixp4xx/cpu.h>
>          |          ^~~~~~~~~~~~~~~~~~~~~~~~
>    compilation terminated.

This is just an implicit dependency on another patch which will
be included in the pull request.

Yours,
Linus Walleij
--===============5332715848947650113==--

