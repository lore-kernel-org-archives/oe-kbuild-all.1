Content-Type: multipart/mixed; boundary="===============3134812780439739653=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] uacce: uacce_ctrl_open() can be static
Date: Thu, 21 Jan 2021 19:43:28 +0800
Message-ID: <20210121114328.GA80090@0beca8d15ecb>
In-Reply-To: <1611220154-90232-1-git-send-email-wangzhou1@hisilicon.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3134812780439739653==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 uacce.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/misc/uacce/uacce.c b/drivers/misc/uacce/uacce.c
index b8ac4080a7d6f76..11cbb69422221a5 100644
--- a/drivers/misc/uacce/uacce.c
+++ b/drivers/misc/uacce/uacce.c
@@ -508,7 +508,7 @@ void uacce_remove(struct uacce_device *uacce)
 }
 EXPORT_SYMBOL_GPL(uacce_remove);
 =

-int uacce_ctrl_open(struct inode *inode, struct file *file)
+static int uacce_ctrl_open(struct inode *inode, struct file *file)
 {
 	struct uacce_pin_container *p;
 =

@@ -522,7 +522,7 @@ int uacce_ctrl_open(struct inode *inode, struct file *f=
ile)
 	return 0;
 }
 =

-int uacce_ctrl_release(struct inode *inode, struct file *file)
+static int uacce_ctrl_release(struct inode *inode, struct file *file)
 {
 	struct uacce_pin_container *priv =3D file->private_data;
 	struct pin_pages *p;
--===============3134812780439739653==--

