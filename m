Content-Type: multipart/mixed; boundary="===============9101879993538069150=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH tobetter-linux] ODROID-XU4: drivers/fbtft: reg_gpx1 can be static
Date: Thu, 22 Oct 2020 17:08:02 +0800
Message-ID: <20201022090802.GA148780@0a28a6810553>
In-Reply-To: <202010221730.5F7o3F7T-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9101879993538069150==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 21c44ffcad76 ("ODROID-XU4: drivers/fbtft: Add fb_hktft35 module for =
Hardkernel 3.5 inch TFT LCD")
Signed-off-by: kernel test robot <lkp@intel.com>
---
 fb_hktft35.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/staging/fbtft/fb_hktft35.c b/drivers/staging/fbtft/fb_=
hktft35.c
index 2389343492d470..61955aa6d63920 100644
--- a/drivers/staging/fbtft/fb_hktft35.c
+++ b/drivers/staging/fbtft/fb_hktft35.c
@@ -45,9 +45,9 @@ union reg_bitfield {
 	} bits;
 };
 =

-volatile void __iomem *reg_gpx1;
-volatile void __iomem *reg_gpx2;
-volatile void __iomem *reg_gpa2;
+static volatile void __iomem *reg_gpx1;
+static volatile void __iomem *reg_gpx2;
+static volatile void __iomem *reg_gpa2;
 =

 /* this init sequence matches Hardkernel 3.5 inch TFT LCD */
 static const s16 default_init_sequence[] =3D {
--===============9101879993538069150==--

