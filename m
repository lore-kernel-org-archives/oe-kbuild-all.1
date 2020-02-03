Content-Type: multipart/mixed; boundary="===============0259129673969747783=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH android-common] ANDROID: staging: android: ion: ion_module_init() can be static
Date: Mon, 03 Feb 2020 12:10:44 +0800
Message-ID: <20200203041044.qyztlgooptidsfzn@f53c9c00458a>
In-Reply-To: <202002030842.R9yGZKhF%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0259129673969747783==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: f64a8b79c0e8 ("ANDROID: staging: android: ion: enable modularizing t=
he ion driver")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 ion.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/android/ion/ion.c b/drivers/staging/android/io=
n/ion.c
index 49bf964b2879a..0ce0258cd9cbb 100644
--- a/drivers/staging/android/ion/ion.c
+++ b/drivers/staging/android/ion/ion.c
@@ -663,7 +663,7 @@ static int ion_device_create(void)
 }
 =

 #ifdef CONFIG_ION_MODULE
-int ion_module_init(void)
+static int ion_module_init(void)
 {
 	int ret;
=20
--===============0259129673969747783==--

