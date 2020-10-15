Content-Type: multipart/mixed; boundary="===============5509094688064338566=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] nvmem: core: nvmem_of_notifier can be static
Date: Thu, 15 Oct 2020 08:13:28 +0800
Message-ID: <20201015001328.GA31200@033f2984987c>
In-Reply-To: <20201014214128.1091738-3-michael.auchter@ni.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5509094688064338566==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kernel test robot <lkp@intel.com>
---
 core.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/nvmem/core.c b/drivers/nvmem/core.c
index 859431c15d5bc3..6dd79075fdd9b0 100644
--- a/drivers/nvmem/core.c
+++ b/drivers/nvmem/core.c
@@ -1671,7 +1671,7 @@ static int of_nvmem_notify(struct notifier_block *nb,=
 unsigned long action,
 	return NOTIFY_OK;
 }
 =

-struct notifier_block nvmem_of_notifier =3D {
+static struct notifier_block nvmem_of_notifier =3D {
 	.notifier_call =3D of_nvmem_notify,
 };
 #endif /* CONFIG_OF_DYNAMIC */
--===============5509094688064338566==--

