Content-Type: multipart/mixed; boundary="===============1686710166682632740=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] sfc: siena_check_caps() can be static
Date: Tue, 12 May 2020 09:01:35 +0800
Message-ID: <20200512010135.GA70023@613088f56a4b>
In-Reply-To: <ad6213aa-b163-8708-47a4-553cb5aa0a8f@solarflare.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1686710166682632740==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 siena.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/sfc/siena.c b/drivers/net/ethernet/sfc/si=
ena.c
index ed1cb6caa69d9..4b4afe81be2a3 100644
--- a/drivers/net/ethernet/sfc/siena.c
+++ b/drivers/net/ethernet/sfc/siena.c
@@ -948,8 +948,8 @@ static int siena_mtd_probe(struct efx_nic *efx)
 =

 #endif /* CONFIG_SFC_MTD */
 =

-unsigned int siena_check_caps(const struct efx_nic *efx,
-			      u8 flag, u32 offset)
+static unsigned int siena_check_caps(const struct efx_nic *efx,
+				     u8 flag, u32 offset)
 {
 	/* Siena did not support MC_CMD_GET_CAPABILITIES */
 	return 0;
--===============1686710166682632740==--

