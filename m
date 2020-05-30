Content-Type: multipart/mixed; boundary="===============0221405964170785947=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH regulator] regulator: max8998: max8998_set_current_limit() can be static
Date: Sat, 30 May 2020 21:03:14 +0800
Message-ID: <20200530130314.GA73557@d7d8dbfb64ff>
In-Reply-To: <202005302128.HV9kPNGq%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0221405964170785947==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 4ffea5e083f8 ("regulator: max8998: Add charger regulator")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 max8998.c |    4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/regulator/max8998.c b/drivers/regulator/max8998.c
index 668ced0064179..340413bba0c5f 100644
--- a/drivers/regulator/max8998.c
+++ b/drivers/regulator/max8998.c
@@ -371,8 +371,8 @@ static int max8998_set_voltage_buck_time_sel(struct reg=
ulator_dev *rdev,
 	return 0;
 }
 =

-int max8998_set_current_limit(struct regulator_dev *rdev,
-			      int min_uA, int max_uA)
+static int max8998_set_current_limit(struct regulator_dev *rdev,
+				     int min_uA, int max_uA)
 {
 	struct max8998_data *max8998 =3D rdev_get_drvdata(rdev);
 	struct i2c_client *i2c =3D max8998->iodev->i2c;
--===============0221405964170785947==--

