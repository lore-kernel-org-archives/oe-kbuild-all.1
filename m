Content-Type: multipart/mixed; boundary="===============3472229460127574942=="
MIME-Version: 1.0
From: Johan Hovold <johan@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [linux-stable-rc:linux-5.10.y 642/862] drivers/usb/serial/keyspan_pda.c:550:30: warning: variable 'priv' set but not used
Date: Fri, 08 Jan 2021 16:01:51 +0100
Message-ID: <X/hz301PdhOHhJiG@hovoldconsulting.com>
In-Reply-To: <202101082251.stzlA1TY-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3472229460127574942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 08, 2021 at 10:35:10PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git linux-5.10.y
> head:   208f314c03c52f01c09eaff3018fd704c2f8fbe2
> commit: df2754ae5f0eb7d15d541d837b8e8725d3e56817 [642/862] USB: serial: k=
eyspan_pda: fix write-wakeup use-after-free
> config: mips-randconfig-r026-20210108 (attached as .config)
> compiler: mips64-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-st=
able-rc.git/commit/?id=3Ddf2754ae5f0eb7d15d541d837b8e8725d3e56817
>         git remote add linux-stable-rc https://git.kernel.org/pub/scm/lin=
ux/kernel/git/stable/linux-stable-rc.git
>         git fetch --no-tags linux-stable-rc linux-5.10.y
>         git checkout df2754ae5f0eb7d15d541d837b8e8725d3e56817
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dmips =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    drivers/usb/serial/keyspan_pda.c: In function 'keyspan_pda_write_bulk_=
callback':
> >> drivers/usb/serial/keyspan_pda.c:550:30: warning: variable 'priv' set =
but not used [-Wunused-but-set-variable]
>      550 |  struct keyspan_pda_private *priv;
>          |                              ^~~~

Indeed, priv should have been removed by this patch, but it was
mistakingly removed by a follow-on patch in mainline instead.

Greg, I only see this warning with W=3D1, but here's a patch to silence
the build bots for the stable trees in case you want it.

Johan


>From 62218024401fac7dd7c7a6e74b566164d515d922 Mon Sep 17 00:00:00 2001
From: Johan Hovold <johan@kernel.org>
Date: Fri, 8 Jan 2021 15:55:28 +0100
Subject: [PATCH] USB: serial: keyspan_pda: remove unused variable

Remove an unused variable which was mistakingly left by commit
37faf5061541 ("USB: serial: keyspan_pda: fix write-wakeup
use-after-free") and only removed by a later change.

This is needed to suppress a W=3D1 warning about the unused variable in
the stable trees that the build bots triggers.

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Johan Hovold <johan@kernel.org>
---
 drivers/usb/serial/keyspan_pda.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/usb/serial/keyspan_pda.c b/drivers/usb/serial/keyspan_=
pda.c
index 39ed3ad32365..aec32bf06e01 100644
--- a/drivers/usb/serial/keyspan_pda.c
+++ b/drivers/usb/serial/keyspan_pda.c
@@ -555,10 +555,8 @@ static int keyspan_pda_write(struct tty_struct *tty,
 static void keyspan_pda_write_bulk_callback(struct urb *urb)
 {
 	struct usb_serial_port *port =3D urb->context;
-	struct keyspan_pda_private *priv;
 =

 	set_bit(0, &port->write_urbs_free);
-	priv =3D usb_get_serial_port_data(port);
 =

 	/* queue up a wakeup at scheduler time */
 	usb_serial_port_softint(port);
-- =

2.26.2

--===============3472229460127574942==--

