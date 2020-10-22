Content-Type: multipart/mixed; boundary="===============4435982105562891797=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] x86: cmp_version() can be static
Date: Thu, 22 Oct 2020 20:23:18 +0800
Message-ID: <20201022122318.GA44344@88a7b53954a2>
In-Reply-To: <20201021214151.32229-1-lists@wildgooses.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4435982105562891797==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kernel test robot <lkp@intel.com>
---
 pcengines-apuv2.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/pcengines-apuv2.c b/drivers/platform/x86/=
pcengines-apuv2.c
index 45f7a89de2780c..2f579bf9917645 100644
--- a/drivers/platform/x86/pcengines-apuv2.c
+++ b/drivers/platform/x86/pcengines-apuv2.c
@@ -228,7 +228,7 @@ static const struct dmi_system_id apu_gpio_dmi_table[] =
__initconst =3D {
 	{}
 };
 =

-int cmp_version(const char *base, const char *test)
+static int cmp_version(const char *base, const char *test)
 {
 	int i;
 	int oct_base[4], oct_test[4];
--===============4435982105562891797==--

