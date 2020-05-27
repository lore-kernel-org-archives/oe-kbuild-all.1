Content-Type: multipart/mixed; boundary="===============2003723119278060258=="
MIME-Version: 1.0
From: Tetsuo Handa <penguin-kernel@i-love.sakura.ne.jp>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] twist: allow converting pr_devel()/pr_debug() into printk(KERN_DEBUG)
Date: Wed, 27 May 2020 22:41:00 +0900
Message-ID: <e4766ed8-905e-faf0-fcbf-3c806ef2b267@i-love.sakura.ne.jp>
In-Reply-To: <202005271707.bUYELlt7%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2003723119278060258==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

>From 3406a1853564618f167a5d0a815f174d2fb295f5 Mon Sep 17 00:00:00 2001
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
Date: Wed, 27 May 2020 22:34:50 +0900
Subject: [PATCH] dev_printk: Explicitly include dynamic_debug.h

While printk.h included dynamic_debug.h before pr_debug(), dev_printk.h
did not include it before dynamic_dev_dbg(). Include it in dev_printk.h
in case future patch touches CONFIG_DYNAMIC_DEBUG case in printk.h .

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
---
 include/linux/dev_printk.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/linux/dev_printk.h b/include/linux/dev_printk.h
index 5aad06b4ca7b..69f0b3708eaf 100644
--- a/include/linux/dev_printk.h
+++ b/include/linux/dev_printk.h
@@ -110,6 +110,7 @@ void _dev_info(const struct device *dev, const char *fm=
t, ...)
 	_dev_info(dev, dev_fmt(fmt), ##__VA_ARGS__)
 =

 #if defined(CONFIG_DYNAMIC_DEBUG)
+#include <linux/dynamic_debug.h>
 #define dev_dbg(dev, fmt, ...)						\
 	dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
 #elif defined(DEBUG)
-- =

2.18.2

--===============2003723119278060258==--

