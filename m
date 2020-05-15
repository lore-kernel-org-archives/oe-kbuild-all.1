Content-Type: multipart/mixed; boundary="===============0209570432126765576=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] scsi: ufshpb: ufshpb_luns_conf can be static
Date: Sat, 16 May 2020 03:33:49 +0800
Message-ID: <20200515193349.GA70866@dee648cdfb08>
In-Reply-To: <1589538614-24048-3-git-send-email-avri.altman@wdc.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0209570432126765576==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 ufshpb.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/scsi/ufs/ufshpb.c b/drivers/scsi/ufs/ufshpb.c
index 181917f662f56..1bd2030d0897b 100644
--- a/drivers/scsi/ufs/ufshpb.c
+++ b/drivers/scsi/ufs/ufshpb.c
@@ -66,8 +66,8 @@ struct ufshpb_lun {
 =

 =

 struct ufshpb_config *ufshpb_conf;
-struct ufshpb_lun_config *ufshpb_luns_conf;
-struct ufshpb_lun *ufshpb_luns;
+static struct ufshpb_lun_config *ufshpb_luns_conf;
+static struct ufshpb_lun *ufshpb_luns;
 static unsigned long ufshpb_lun_map[BITS_TO_LONGS(UFSHPB_MAX_LUNS)];
 static u8 ufshpb_lun_lookup[UFSHPB_MAX_LUNS];
=20
--===============0209570432126765576==--

