Content-Type: multipart/mixed; boundary="===============7668158965972927907=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH ath6kl] ath11k: host_ce_config_wlan_ipq8074[] can be static
Date: Thu, 28 May 2020 22:55:49 +0800
Message-ID: <20200528145549.GA89558@3f49cb9714f8>
In-Reply-To: <202005282230.4SJMb2ms%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7668158965972927907==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 26d01bfe84cf ("ath11k: define different ce count")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 ce.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/wireless/ath/ath11k/ce.c b/drivers/net/wireless/at=
h/ath11k/ce.c
index 212d41f7d28e8..85e94ca834a6b 100644
--- a/drivers/net/wireless/ath/ath11k/ce.c
+++ b/drivers/net/wireless/ath/ath11k/ce.c
@@ -9,7 +9,7 @@
 =

 #define host_ce_config_wlan ab->ce.host_ce_config
 =

-const struct ce_attr host_ce_config_wlan_ipq8074[] =3D {
+static const struct ce_attr host_ce_config_wlan_ipq8074[] =3D {
 	/* CE0: host->target HTC control and raw streams */
 	{
 		.flags =3D CE_ATTR_FLAGS,
--===============7668158965972927907==--

