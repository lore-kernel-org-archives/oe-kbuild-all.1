Content-Type: multipart/mixed; boundary="===============1445101150642080284=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] EDAC/Cadence: data_synd[] can be static
Date: Wed, 26 Feb 2020 10:11:09 +0800
Message-ID: <20200226021101.GA16779@e50d7db646c3>
In-Reply-To: <20200225093856.7328-2-dkangude@cadence.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1445101150642080284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 201447a5db9b ("EDAC/Cadence:Add EDAC driver for cadence memory contr=
oller")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 cadence_edac.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/edac/cadence_edac.c b/drivers/edac/cadence_edac.c
index 3887db5665eee..17aa656a740ee 100644
--- a/drivers/edac/cadence_edac.c
+++ b/drivers/edac/cadence_edac.c
@@ -121,7 +121,7 @@
 /* Syndrome values */
 #define ECC_DOUBLE_MULTI_ERR_SYND	0x03
 =

-char data_synd[] =3D {
+static char data_synd[] =3D {
 			0xf4, 0xf1, 0xec, 0xea, 0xe9, 0xe6, 0xe5, 0xe3,
 			0xdc, 0xda, 0xd9, 0xd6, 0xd5, 0xd3, 0xce, 0xcb,
 			0xb5, 0xb0, 0xad, 0xab, 0xa8, 0xa7, 0xa4, 0xa2,
@@ -132,7 +132,7 @@ char data_synd[] =3D {
 			0x1c, 0x1a, 0x19, 0x16, 0x15, 0x13, 0x0e, 0x0b
 		  };
 =

-char check_synd[] =3D {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x80};
+static char check_synd[] =3D {0x01, 0x02, 0x04, 0x08, 0x10, 0x20, 0x40, 0x=
80};
 =

 /**
  * struct cdns_platform_data -  cadence platform data structure.
--===============1445101150642080284==--

