Content-Type: multipart/mixed; boundary="===============3568158817749638064=="
MIME-Version: 1.0
From: Joe Perches <joe@perches.com>
To: kbuild-all@lists.01.org
Subject: Re: drivers/video/backlight/ltv350qv.c:192:12: warning: stack frame size of 13472 bytes in function 'ltv350qv_power'
Date: Sun, 25 Oct 2020 12:23:21 -0700
Message-ID: <7e76d1c3239bf2d33889c4874bc9919fee6b6ebe.camel@perches.com>
In-Reply-To: <20201025121708.04d4070a44e28146baf9a6a7@linux-foundation.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3568158817749638064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Sun, 2020-10-25 at 12:17 -0700, Andrew Morton wrote:
> On Mon, 26 Oct 2020 02:15:37 +0800 kernel test robot <lkp@intel.com> wr=
ote:
> > vim +/ltv350qv_power +192 drivers/video/backlight/ltv350qv.c
> =

> Odd - the code looks pretty normal.  It is possible that your compiler
> is (crazily) inlining ltv350qv_write_reg()?

There's a lot of stack used when gcc's compiler options include

           -fsanitize=3Dobject-size
               This option enables instrumentation of memory references usi=
ng
               the "__builtin_object_size" function.  Various out of bounds
               pointer accesses are detected.

Perhaps this config enables it?


--===============3568158817749638064==--

