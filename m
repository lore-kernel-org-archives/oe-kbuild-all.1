Content-Type: multipart/mixed; boundary="===============5767364127959123608=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] net: mdio: mdio_debug_fops can be static
Date: Sun, 17 Jan 2021 07:20:58 +0800
Message-ID: <20210116232057.GA89809@49432ef1697d>
In-Reply-To: <20210116211916.8329-1-code@simerda.eu>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5767364127959123608==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 mdio-debugfs.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/mdio-debugfs.c b/drivers/net/phy/mdio-debugfs.c
index abed40052c20a1d..f1c9a3c604714c2 100644
--- a/drivers/net/phy/mdio-debugfs.c
+++ b/drivers/net/phy/mdio-debugfs.c
@@ -151,7 +151,7 @@ static unsigned int mdio_debug_poll(struct file *file, =
poll_table *wait)
 	return data->value =3D=3D -1 ? POLLOUT : POLLIN;
 }
 =

-struct file_operations mdio_debug_fops =3D {
+static struct file_operations mdio_debug_fops =3D {
 	.owner =3D THIS_MODULE,
 	.open =3D mdio_debug_open,
 	.release =3D mdio_debug_release,
@@ -181,7 +181,7 @@ void mdio_debugfs_remove(struct mii_bus *bus)
 }
 EXPORT_SYMBOL_GPL(mdio_debugfs_remove);
 =

-int __init mdio_debugfs_init(void)
+static int __init mdio_debugfs_init(void)
 {
 	mdio_debugfs_dentry =3D debugfs_create_dir("mdio", NULL);
 =

@@ -189,7 +189,7 @@ int __init mdio_debugfs_init(void)
 }
 module_init(mdio_debugfs_init);
 =

-void __exit mdio_debugfs_exit(void)
+static void __exit mdio_debugfs_exit(void)
 {
 	debugfs_remove(mdio_debugfs_dentry);
 }
--===============5767364127959123608==--

