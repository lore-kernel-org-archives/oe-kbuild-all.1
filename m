Content-Type: multipart/mixed; boundary="===============3368605896766200229=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH goldwynr] btrfs: btrfs_page_prepare() can be static
Date: Wed, 28 Oct 2020 02:14:44 +0800
Message-ID: <20201027181444.GA85160@1993f2ebd57b>
In-Reply-To: <202010280219.gPUAyPVN-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3368605896766200229==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: ec52a9d5030e ("btrfs: Switch to iomap_file_buffered_write()")
Signed-off-by: kernel test robot <lkp@intel.com>
---
 file.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/btrfs/file.c b/fs/btrfs/file.c
index f73935ad1252ce..7721ce7d4e25ea 100644
--- a/fs/btrfs/file.c
+++ b/fs/btrfs/file.c
@@ -416,7 +416,7 @@ static void btrfs_drop_remaining_pages(struct btrfs_iom=
ap *bi)
 	}
 }
 =

-struct page *btrfs_page_prepare(struct inode *inode, loff_t pos,
+static struct page *btrfs_page_prepare(struct inode *inode, loff_t pos,
 		unsigned len, struct iomap *iomap)
 {
 	struct btrfs_iomap *bi =3D iomap->private;
@@ -1896,7 +1896,7 @@ static int btrfs_buffered_iomap_end(struct inode *ino=
de, loff_t pos,
 	return ret;
 }
 =

-const struct iomap_ops btrfs_buffered_iomap_ops =3D {
+static const struct iomap_ops btrfs_buffered_iomap_ops =3D {
 	.iomap_begin =3D btrfs_buffered_iomap_begin,
 	.iomap_end =3D btrfs_buffered_iomap_end,
 };
--===============3368605896766200229==--

