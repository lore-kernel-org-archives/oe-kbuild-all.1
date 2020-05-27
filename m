Content-Type: multipart/mixed; boundary="===============0117539332214543466=="
MIME-Version: 1.0
From: Malcolm Priestley <tvboxspy@gmail.com>
To: kbuild-all@lists.01.org
Subject: [PATCH v2] staging: vt6656: Fix warning: unused variable vnt_frame_time
Date: Wed, 27 May 2020 10:35:46 +0100
Message-ID: <5096f399-03e7-77e1-b334-947aabc44d14@gmail.com>
In-Reply-To: <202005241918.IseLzHqZ%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0117539332214543466==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

In commit 61bb798767e4
("staging: vt6656: vnt_get_rtscts_rsvtime_le replace with rts/cts duration.=
")
not quite all of the code was removed.

Remove unused vnt_frame_time variable.

Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Malcolm Priestley <tvboxspy@gmail.com>
---
v2 corrected the commit =


 drivers/staging/vt6656/rxtx.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/staging/vt6656/rxtx.c b/drivers/staging/vt6656/rxtx.c
index 5530c06ffd40..5dd6b4d2bf20 100644
--- a/drivers/staging/vt6656/rxtx.c
+++ b/drivers/staging/vt6656/rxtx.c
@@ -39,10 +39,6 @@ static const u16 vnt_time_stampoff[2][MAX_RATE] =3D {
 #define DATADUR_B       10
 #define DATADUR_A       11
 =

-static const u16 vnt_frame_time[MAX_RATE] =3D {
-	10, 20, 55, 110, 24, 36, 48, 72, 96, 144, 192, 216
-};
-
 static const u8 vnt_phy_signal[] =3D {
 	0x00,	/* RATE_1M  */
 	0x01,	/* RATE_2M  */
-- =

2.27.0.rc0
--===============0117539332214543466==--

