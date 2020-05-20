Content-Type: multipart/mixed; boundary="===============5384008389388196291=="
MIME-Version: 1.0
From: Christoph Hellwig <hch@lst.de>
To: kbuild-all@lists.01.org
Subject: Re: [hnaz-linux-mm:master 548/598] include/linux/highmem.h:302:20: error: passing argument 1 of 'flush_dcache_page' from incompatible pointer type
Date: Wed, 20 May 2020 19:35:20 +0200
Message-ID: <20200520173520.GA11199@lst.de>
In-Reply-To: <202005202014.Kfpemcdx%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5384008389388196291==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Andrew, can you fold in this fix?

---
diff --git a/drivers/media/platform/omap3isp/ispvideo.c b/drivers/media/pla=
tform/omap3isp/ispvideo.c
index 6f769c527faed..10c214bd09030 100644
--- a/drivers/media/platform/omap3isp/ispvideo.c
+++ b/drivers/media/platform/omap3isp/ispvideo.c
@@ -10,7 +10,6 @@
  *	     Sakari Ailus <sakari.ailus@iki.fi>
  */
 =

-#include <asm/cacheflush.h>
 #include <linux/clk.h>
 #include <linux/mm.h>
 #include <linux/module.h>
@@ -19,6 +18,7 @@
 #include <linux/sched.h>
 #include <linux/slab.h>
 #include <linux/vmalloc.h>
+#include <asm/cacheflush.h>
 =

 #include <media/v4l2-dev.h>
 #include <media/v4l2-ioctl.h>
--===============5384008389388196291==--

