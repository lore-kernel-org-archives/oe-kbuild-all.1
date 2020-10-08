Content-Type: multipart/mixed; boundary="===============3050959288413632059=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] NFSv4.2: nfs_ssc_clnt_ops_tbl can be static
Date: Thu, 08 Oct 2020 11:11:26 +0800
Message-ID: <20201008031126.GA156798@30b510b0eab4>
In-Reply-To: <20201008012513.89989-2-dai.ngo@oracle.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3050959288413632059==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kernel test robot <lkp@intel.com>
---
 nfs4file.c |    2 +-
 super.c    |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/nfs/nfs4file.c b/fs/nfs/nfs4file.c
index ea42c39bc2ffd..124876dfd6447 100644
--- a/fs/nfs/nfs4file.c
+++ b/fs/nfs/nfs4file.c
@@ -28,7 +28,7 @@ static struct file *__nfs42_ssc_open(struct vfsmount *ss_=
mnt,
 		struct nfs_fh *src_fh, nfs4_stateid *stateid);
 static void __nfs42_ssc_close(struct file *filep);
 =

-const struct nfs4_ssc_client_ops nfs4_ssc_clnt_ops_tbl =3D {
+static const struct nfs4_ssc_client_ops nfs4_ssc_clnt_ops_tbl =3D {
 	.sco_owner =3D THIS_MODULE,
 	.sco_open =3D __nfs42_ssc_open,
 	.sco_close =3D __nfs42_ssc_close,
diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index c6324e2de1ae5..65636fef6a006 100644
--- a/fs/nfs/super.c
+++ b/fs/nfs/super.c
@@ -86,7 +86,7 @@ const struct super_operations nfs_sops =3D {
 };
 EXPORT_SYMBOL_GPL(nfs_sops);
 =

-const struct nfs_ssc_client_ops nfs_ssc_clnt_ops_tbl =3D {
+static const struct nfs_ssc_client_ops nfs_ssc_clnt_ops_tbl =3D {
 	.sco_owner =3D THIS_MODULE,
 	.sco_sb_deactive =3D nfs_sb_deactive,
 };
--===============3050959288413632059==--

