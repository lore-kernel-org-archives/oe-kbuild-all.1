Content-Type: multipart/mixed; boundary="===============0179279052907983815=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH ath6kl] ath11k: ath11k_mac_id_to_pdev_id_ipq8074() can be static
Date: Fri, 29 May 2020 00:08:29 +0800
Message-ID: <20200528160829.GA50950@3f49cb9714f8>
In-Reply-To: <202005290059.xMptJizM%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0179279052907983815==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: f4e7ef9fc04c ("ath11k: setup QCA6390 rings for both rxdmas")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 hw.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/hw.c b/drivers/net/wireless/at=
h/ath11k/hw.c
index 65cae23d39481..1f59867b67b02 100644
--- a/drivers/net/wireless/ath/ath11k/hw.c
+++ b/drivers/net/wireless/ath/ath11k/hw.c
@@ -205,22 +205,22 @@ static void ath11k_init_wmi_config_ipq8074(struct ath=
11k_base *ab,
 	config->twt_ap_sta_count =3D 1000;
 }
 =

-int ath11k_mac_id_to_pdev_id_ipq8074(int mac_id)
+static int ath11k_mac_id_to_pdev_id_ipq8074(int mac_id)
 {
 	return mac_id;
 }
 =

-int ath11k_mac_id_to_srng_id_ipq8074(int mac_id)
+static int ath11k_mac_id_to_srng_id_ipq8074(int mac_id)
 {
 	return 0;
 }
 =

-int ath11k_mac_id_to_pdev_id_qca6x90(int mac_id)
+static int ath11k_mac_id_to_pdev_id_qca6x90(int mac_id)
 {
 	return 0;
 }
 =

-int ath11k_mac_id_to_srng_id_qca6x90(int mac_id)
+static int ath11k_mac_id_to_srng_id_qca6x90(int mac_id)
 {
 	return mac_id;
 }
--===============0179279052907983815==--

