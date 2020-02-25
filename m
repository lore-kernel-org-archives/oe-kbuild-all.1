Content-Type: multipart/mixed; boundary="===============7101044394409118451=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] net: mscc: ocelot: vsc7514_vcap_is2_keys[] can be static
Date: Tue, 25 Feb 2020 12:58:12 +0800
Message-ID: <20200225045810.GA17545@e50d7db646c3>
In-Reply-To: <20200224130831.25347-6-olteanv@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7101044394409118451==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: b33f9830eb55 ("net: mscc: ocelot: don't rely on preprocessor for vca=
p key/action packing")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 ocelot_board.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/mscc/ocelot_board.c b/drivers/net/etherne=
t/mscc/ocelot_board.c
index 8b83a10083e2e..186f181deffee 100644
--- a/drivers/net/ethernet/mscc/ocelot_board.c
+++ b/drivers/net/ethernet/mscc/ocelot_board.c
@@ -263,7 +263,7 @@ static const struct ocelot_ops ocelot_ops =3D {
 	.reset			=3D ocelot_reset,
 };
 =

-struct vcap_field vsc7514_vcap_is2_keys[] =3D {
+static struct vcap_field vsc7514_vcap_is2_keys[] =3D {
 	/* Common: 46 bits */
 	[VCAP_IS2_TYPE]				=3D {  0,   4},
 	[VCAP_IS2_HK_FIRST]			=3D {  4,   1},
@@ -343,7 +343,7 @@ struct vcap_field vsc7514_vcap_is2_keys[] =3D {
 	[VCAP_IS2_HK_OAM_IS_Y1731]		=3D {187,   1},
 };
 =

-struct vcap_field vsc7514_vcap_is2_actions[] =3D {
+static struct vcap_field vsc7514_vcap_is2_actions[] =3D {
 	[VCAP_IS2_ACT_HIT_ME_ONCE]		=3D {  0,  1},
 	[VCAP_IS2_ACT_CPU_COPY_ENA]		=3D {  1,  1},
 	[VCAP_IS2_ACT_CPU_QU_NUM]		=3D {  2,  3},
--===============7101044394409118451==--

