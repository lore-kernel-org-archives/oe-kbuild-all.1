Content-Type: multipart/mixed; boundary="===============4512628183869312820=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] pstore/blk: __unregister_pstore_device() can be static
Date: Sun, 10 May 2020 21:59:32 +0800
Message-ID: <20200510135932.GA55346@7c31f038ab56>
In-Reply-To: <20200509234103.46544-17-keescook@chromium.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4512628183869312820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 blk.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index 3e67bd4557ea6f..b541b395fd1391 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -179,7 +179,7 @@ int register_pstore_device(struct psblk_device *dev)
 }
 EXPORT_SYMBOL_GPL(register_pstore_device);
 =

-void __unregister_pstore_device(struct psblk_device *dev)
+static void __unregister_pstore_device(struct psblk_device *dev)
 {
 	WARN_ON(!mutex_is_locked(&pstore_blk_lock));
 	if (pstore_zone_info && pstore_zone_info->read =3D=3D dev->read) {
--===============4512628183869312820==--

