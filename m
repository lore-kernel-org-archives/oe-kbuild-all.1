Content-Type: multipart/mixed; boundary="===============6981938207929191631=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] pstore/blk: __unregister_pstore_blk() can be static
Date: Sun, 10 May 2020 19:12:36 +0800
Message-ID: <20200510111236.GA87509@7c31f038ab56>
In-Reply-To: <20200509234103.46544-10-keescook@chromium.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6981938207929191631==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 blk.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/pstore/blk.c b/fs/pstore/blk.c
index b0e1ae21d1de7..f9485047d0cdb 100644
--- a/fs/pstore/blk.c
+++ b/fs/pstore/blk.c
@@ -412,7 +412,7 @@ int register_pstore_blk(unsigned int major, unsigned in=
t flags,
 }
 EXPORT_SYMBOL_GPL(register_pstore_blk);
 =

-void __unregister_pstore_blk(unsigned int major)
+static void __unregister_pstore_blk(unsigned int major)
 {
 	struct psblk_device dev =3D { .read =3D psblk_generic_blk_read };
 	void *holder =3D blkdev;
--===============6981938207929191631==--

