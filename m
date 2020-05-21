Content-Type: multipart/mixed; boundary="===============1150601498600097433=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] net: atlantic: ptp_ring_idx() can be static
Date: Thu, 21 May 2020 10:15:28 +0800
Message-ID: <20200521021528.GA70605@6bfd3b9cba2b>
In-Reply-To: <20200520134734.2014-4-irusskikh@marvell.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1150601498600097433==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 aq_ptp.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c b/drivers/net/=
ethernet/aquantia/atlantic/aq_ptp.c
index 9aee49c50f1f8..599ced261b2a4 100644
--- a/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
+++ b/drivers/net/ethernet/aquantia/atlantic/aq_ptp.c
@@ -948,7 +948,7 @@ void aq_ptp_ring_deinit(struct aq_nic_s *aq_nic)
 /* Index must be 8 (8 TCs) or 16 (4 TCs).
  * It depends on Traffic Class mode.
  */
-unsigned int ptp_ring_idx(const enum aq_tc_mode tc_mode)
+static unsigned int ptp_ring_idx(const enum aq_tc_mode tc_mode)
 {
 	if (tc_mode =3D=3D AQ_TC_MODE_8TCS)
 		return PTP_8TC_RING_IDX;
--===============1150601498600097433==--

