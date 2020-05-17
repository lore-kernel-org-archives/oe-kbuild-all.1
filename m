Content-Type: multipart/mixed; boundary="===============5476204999468756690=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] staging: rtl8192u: indicate_packets() can be static
Date: Mon, 18 May 2020 04:22:16 +0800
Message-ID: <20200517202216.GA24634@8c544063f25c>
In-Reply-To: <20200517165819.136715-1-pterjan@google.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5476204999468756690==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 ieee80211_rx.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c b/drivers/st=
aging/rtl8192u/ieee80211/ieee80211_rx.c
index 3309f64be4c94..bceff1ba3d7d4 100644
--- a/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
+++ b/drivers/staging/rtl8192u/ieee80211/ieee80211_rx.c
@@ -520,7 +520,7 @@ static bool AddReorderEntry(struct rx_ts_record *pTS, s=
truct rx_reorder_entry *p
 	return true;
 }
 =

-void indicate_packets(struct ieee80211_device *ieee, struct ieee80211_rxb =
*rxb)
+static void indicate_packets(struct ieee80211_device *ieee, struct ieee802=
11_rxb *rxb)
 {
 	struct net_device_stats *stats =3D &ieee->stats;
 	struct net_device *dev =3D ieee->dev;
--===============5476204999468756690==--

