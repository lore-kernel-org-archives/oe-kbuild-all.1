Content-Type: multipart/mixed; boundary="===============3592803576675485981=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] ath11k: ath11k_mac_get_tx_mcs_map() can be static
Date: Fri, 01 May 2020 10:14:03 +0800
Message-ID: <20200501021403.GA34224@2ec9c934b904>
In-Reply-To: <20200429145708.25992-3-john@phrozen.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3592803576675485981==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 mac.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/mac.c b/drivers/net/wireless/a=
th/ath11k/mac.c
index ad05409783c05..c8acdc1e33353 100644
--- a/drivers/net/wireless/ath/ath11k/mac.c
+++ b/drivers/net/wireless/ath/ath11k/mac.c
@@ -5285,7 +5285,7 @@ ath11k_mac_has_single_legacy_rate(struct ath11k *ar,
 	return num_rates =3D=3D 1;
 }
 =

-u16 ath11k_mac_get_tx_mcs_map(const struct ieee80211_sta_he_cap *he_cap)
+static u16 ath11k_mac_get_tx_mcs_map(const struct ieee80211_sta_he_cap *he=
_cap)
 {
 	if (he_cap->he_cap_elem.phy_cap_info[0] &
 	    IEEE80211_HE_PHY_CAP0_CHANNEL_WIDTH_SET_80PLUS80_MHZ_IN_5G)
--===============3592803576675485981==--

