Content-Type: multipart/mixed; boundary="===============7829742537954142431=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH linux-platform-drivers-x86] platform/x86: thinkpad_acpi: keyboard_lang_data[] can be static
Date: Tue, 26 Jan 2021 10:47:14 +0800
Message-ID: <20210126024713.GA56241@dba771b738ee>
In-Reply-To: <202101261014.gblyDi4e-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7829742537954142431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: d7cbe2773aed ("platform/x86: thinkpad_acpi: set keyboard language")
Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: kernel test robot <lkp@intel.com>
---
 thinkpad_acpi.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/platform/x86/thinkpad_acpi.c b/drivers/platform/x86/th=
inkpad_acpi.c
index 81f8ad6bb6886..85383b943a133 100644
--- a/drivers/platform/x86/thinkpad_acpi.c
+++ b/drivers/platform/x86/thinkpad_acpi.c
@@ -9996,7 +9996,7 @@ struct keyboard_lang_data {
  * When adding new entries to keyboard_lang_data, please check that
  * the select_lang[] buffer in keyboard_lang_show() is still large enough.
  */
-struct keyboard_lang_data keyboard_lang_data[] =3D {
+static struct keyboard_lang_data keyboard_lang_data[] =3D {
 	{"en", 0},
 	{"be", 0x080c},
 	{"cz", 0x0405},
--===============7829742537954142431==--

