Content-Type: multipart/mixed; boundary="===============7811319656339338127=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] scsi: ufs: ufshpb: ufshpb_remove_lun() can be static
Date: Sat, 16 May 2020 04:17:45 +0800
Message-ID: <20200515201745.GA47195@dee648cdfb08>
In-Reply-To: <1589538614-24048-5-git-send-email-avri.altman@wdc.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7811319656339338127==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 ufshpb.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/scsi/ufs/ufshpb.c b/drivers/scsi/ufs/ufshpb.c
index 4a10e7b6f7949..1c1c669e3ee35 100644
--- a/drivers/scsi/ufs/ufshpb.c
+++ b/drivers/scsi/ufs/ufshpb.c
@@ -37,7 +37,7 @@ struct ufshpb_lun *ufshpb_luns;
 static unsigned long ufshpb_lun_map[BITS_TO_LONGS(UFSHPB_MAX_LUNS)];
 static u8 ufshpb_lun_lookup[UFSHPB_MAX_LUNS];
 =

-void ufshpb_remove_lun(u8 lun)
+static void ufshpb_remove_lun(u8 lun)
 {
 	struct ufshpb_lun *hpb;
=20
--===============7811319656339338127==--

