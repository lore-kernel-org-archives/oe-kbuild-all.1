Content-Type: multipart/mixed; boundary="===============5025598696785276846=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] ext4: ext4_iomap_xattr_ops can be static
Date: Fri, 28 Feb 2020 03:18:49 +0800
Message-ID: <20200227191849.GA79833@5ae7410f0801>
In-Reply-To: <2341a116e39ff0934b1f90aee8f4e10ac0371648.1582800839.git.riteshh@linux.ibm.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5025598696785276846==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: e3d16669487e ("ext4: Move ext4_fiemap to use iomap framework.")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 extents.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/ext4/extents.c b/fs/ext4/extents.c
index 204795232ce7e..42eeedd9db00c 100644
--- a/fs/ext4/extents.c
+++ b/fs/ext4/extents.c
@@ -4915,7 +4915,7 @@ static int ext4_iomap_xattr_begin(struct inode *inode=
, loff_t offset,
 	return error;
 }
 =

-const struct iomap_ops ext4_iomap_xattr_ops =3D {
+static const struct iomap_ops ext4_iomap_xattr_ops =3D {
 	.iomap_begin		=3D ext4_iomap_xattr_begin,
 };
=20
--===============5025598696785276846==--

