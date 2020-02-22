Content-Type: multipart/mixed; boundary="===============4254468511505674032=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] misc: bcm-vk: image_tab[] can be static
Date: Sun, 23 Feb 2020 00:44:50 +0800
Message-ID: <20200222164450.GA660@e50d7db646c3>
In-Reply-To: <20200220004825.23372-7-scott.branden@broadcom.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4254468511505674032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: b6354450d21b ("misc: bcm-vk: add Broadcom VK driver")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 bcm_vk_dev.c |    2 +-
 bcm_vk_msg.c |    6 +++---
 2 files changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/misc/bcm-vk/bcm_vk_dev.c b/drivers/misc/bcm-vk/bcm_vk_=
dev.c
index d8f59e898ca8a..24cdab04c8703 100644
--- a/drivers/misc/bcm-vk/bcm_vk_dev.c
+++ b/drivers/misc/bcm-vk/bcm_vk_dev.c
@@ -31,7 +31,7 @@ enum soc_idx {
 };
 =

 #define NUM_BOOT_STAGES 2
-const struct load_image_tab image_tab[][NUM_BOOT_STAGES] =3D {
+static const struct load_image_tab image_tab[][NUM_BOOT_STAGES] =3D {
 	[VALKYRIE] =3D {
 		{VK_IMAGE_TYPE_BOOT1, VK_BOOT1_DEF_VALKYRIE_FILENAME},
 		{VK_IMAGE_TYPE_BOOT2, VK_BOOT2_DEF_VALKYRIE_FILENAME}
diff --git a/drivers/misc/bcm-vk/bcm_vk_msg.c b/drivers/misc/bcm-vk/bcm_vk_=
msg.c
index 651fba2149e28..9247d4bc50288 100644
--- a/drivers/misc/bcm-vk/bcm_vk_msg.c
+++ b/drivers/misc/bcm-vk/bcm_vk_msg.c
@@ -99,8 +99,8 @@ static void bcm_vk_h2vk_verify_blk
 #define BCM_VK_QSTATS_ACC_CNT 20000
 #endif
 =

-void bcm_vk_update_qstats(struct bcm_vk *vk, const char *tag,
-			  struct bcm_vk_qstats *qstats, uint32_t occupancy)
+static void bcm_vk_update_qstats(struct bcm_vk *vk, const char *tag,
+				 struct bcm_vk_qstats *qstats, uint32_t occupancy)
 {
 	struct bcm_vk_qs_cnts *qcnts =3D &qstats->qcnts;
 =

@@ -731,7 +731,7 @@ int bcm_vk_send_shutdown_msg(struct bcm_vk *vk, uint32_=
t shut_type,
 	return rc;
 }
 =

-int bcm_vk_handle_last_sess(struct bcm_vk *vk, struct task_struct *ppid)
+static int bcm_vk_handle_last_sess(struct bcm_vk *vk, struct task_struct *=
ppid)
 {
 	int rc =3D 0;
 	pid_t pid =3D task_pid_nr(ppid);
--===============4254468511505674032==--

