Content-Type: multipart/mixed; boundary="===============8613637174484779712=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH regulator] regulator: max8998: max8998_get_current_limit() can be static
Date: Sat, 30 May 2020 17:39:52 +0800
Message-ID: <20200530093952.GA95399@ff281034de1d>
In-Reply-To: <202005301757.zXvAYTUt%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8613637174484779712==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 4ffea5e083f8 ("regulator: max8998: Add charger regulator")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 max8998.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/regulator/max8998.c b/drivers/regulator/max8998.c
index 668ced0064179..ab16790a02068 100644
--- a/drivers/regulator/max8998.c
+++ b/drivers/regulator/max8998.c
@@ -415,7 +415,7 @@ int max8998_set_current_limit(struct regulator_dev *rde=
v,
 				  sel, rdev->desc->csel_mask);
 }
 =

-int max8998_get_current_limit(struct regulator_dev *rdev)
+static int max8998_get_current_limit(struct regulator_dev *rdev)
 {
 	struct max8998_data *max8998 =3D rdev_get_drvdata(rdev);
 	struct i2c_client *i2c =3D max8998->iodev->i2c;
--===============8613637174484779712==--

