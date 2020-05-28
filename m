Content-Type: multipart/mixed; boundary="===============4001470361559028680=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH ath6kl] ath11k: ath11k_dp_srng_calculate_msi_group() can be static
Date: Thu, 28 May 2020 23:31:46 +0800
Message-ID: <20200528153146.GA25006@3f49cb9714f8>
In-Reply-To: <202005282327.ZEJRVYGS%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4001470361559028680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: f2748890bfc2 ("ath11k: enable DP interrupt setup for QCA6390")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 dp.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/wireless/ath/ath11k/dp.c b/drivers/net/wireless/at=
h/ath11k/dp.c
index d1be849bd46fa..bb9271ed7f626 100644
--- a/drivers/net/wireless/ath/ath11k/dp.c
+++ b/drivers/net/wireless/ath/ath11k/dp.c
@@ -121,8 +121,8 @@ static int ath11k_dp_srng_find_ring_in_mask(int ring_nu=
m, const u8 *grp_mask)
 	return -ENOENT;
 }
 =

-int ath11k_dp_srng_calculate_msi_group(struct ath11k_base *ab,
-				       enum hal_ring_type type, int ring_num)
+static int ath11k_dp_srng_calculate_msi_group(struct ath11k_base *ab,
+					      enum hal_ring_type type, int ring_num)
 {
 	const u8 *grp_mask;
=20
--===============4001470361559028680==--

