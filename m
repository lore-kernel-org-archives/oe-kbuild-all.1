Content-Type: multipart/mixed; boundary="===============4512636798535746139=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] rtw88: 8723d: rtw8723d_pwr_track() can be static
Date: Tue, 12 May 2020 03:07:31 +0800
Message-ID: <20200511190731.GA8959@75ebaf9685ab>
In-Reply-To: <20200507042151.15634-10-yhchuang@realtek.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4512636798535746139==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 rtw8723d.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/realtek/rtw88/rtw8723d.c b/drivers/net/wi=
reless/realtek/rtw88/rtw8723d.c
index 400364aec393f..b517af417e0e4 100644
--- a/drivers/net/wireless/realtek/rtw88/rtw8723d.c
+++ b/drivers/net/wireless/realtek/rtw88/rtw8723d.c
@@ -1896,7 +1896,7 @@ static void rtw8723d_phy_pwrtrack(struct rtw_dev *rtw=
dev)
 		rtw8723d_phy_calibration(rtwdev);
 }
 =

-void rtw8723d_pwr_track(struct rtw_dev *rtwdev)
+static void rtw8723d_pwr_track(struct rtw_dev *rtwdev)
 {
 	struct rtw_efuse *efuse =3D &rtwdev->efuse;
 	struct rtw_dm_info *dm_info =3D &rtwdev->dm_info;
--===============4512636798535746139==--

