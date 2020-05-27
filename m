Content-Type: multipart/mixed; boundary="===============2302289146792804395=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] mmc: core: sdio_type can be static
Date: Wed, 27 May 2020 16:16:43 +0800
Message-ID: <20200527081643.GA18613@1b766f755b98>
In-Reply-To: <20200526154334.21222-2-pali@kernel.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2302289146792804395==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 sdio.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/mmc/core/sdio.c b/drivers/mmc/core/sdio.c
index d708e0fbc05b46..2d86a9db547704 100644
--- a/drivers/mmc/core/sdio.c
+++ b/drivers/mmc/core/sdio.c
@@ -41,7 +41,7 @@ static struct attribute *sdio_std_attrs[] =3D {
 };
 ATTRIBUTE_GROUPS(sdio_std);
 =

-struct device_type sdio_type =3D {
+static struct device_type sdio_type =3D {
 	.groups =3D sdio_std_groups,
 };
=20
--===============2302289146792804395==--

