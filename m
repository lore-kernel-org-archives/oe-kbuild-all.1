Content-Type: multipart/mixed; boundary="===============2489837230758743450=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] leds: trigger: ledtrig_tty can be static
Date: Fri, 16 Oct 2020 06:32:03 +0800
Message-ID: <20201015223203.GA33862@68c68aa7e201>
In-Reply-To: <20201012123358.1475928-4-u.kleine-koenig@pengutronix.de>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2489837230758743450==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kernel test robot <lkp@intel.com>
---
 ledtrig-tty.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/leds/trigger/ledtrig-tty.c b/drivers/leds/trigger/ledt=
rig-tty.c
index 806548e33cd874..09cba818fb65c7 100644
--- a/drivers/leds/trigger/ledtrig-tty.c
+++ b/drivers/leds/trigger/ledtrig-tty.c
@@ -174,7 +174,7 @@ static void ledtrig_tty_deactivate(struct led_classdev =
*led_cdev)
 	kfree(trigger_data);
 }
 =

-struct led_trigger ledtrig_tty =3D {
+static struct led_trigger ledtrig_tty =3D {
 	.name =3D "tty",
 	.activate =3D ledtrig_tty_activate,
 	.deactivate =3D ledtrig_tty_deactivate,
--===============2489837230758743450==--

