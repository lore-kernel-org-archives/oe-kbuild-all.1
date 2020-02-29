Content-Type: multipart/mixed; boundary="===============3928090872593035542=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH chrome-os] CHROMIUM: extcon: cros_ec_tcss_get_next_state_req() can be static
Date: Sun, 01 Mar 2020 05:18:25 +0800
Message-ID: <20200229211818.GA39542@317218acf1d6>
In-Reply-To: <202003010523.MkhFG3C4%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3928090872593035542==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 562267b91e8a ("CHROMIUM: extcon: Perform initial Type-C port and cab=
le detection")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 extcon-tcss-cros-ec.c |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/extcon/extcon-tcss-cros-ec.c b/drivers/extcon/extcon-t=
css-cros-ec.c
index 908da6577dfcb..93f9c25f29fe5 100644
--- a/drivers/extcon/extcon-tcss-cros-ec.c
+++ b/drivers/extcon/extcon-tcss-cros-ec.c
@@ -270,8 +270,8 @@ static int cros_ec_tcss_get_current_state(struct cros_e=
c_tcss_info *info,
  *
  * Return: Request for next state, 0 if nothing needs to be done
  */
-u8 cros_ec_tcss_get_next_state_req(struct cros_ec_tcss_data *port_data,
-				   struct cros_ec_tcss_data *prev_port_data)
+static u8 cros_ec_tcss_get_next_state_req(struct cros_ec_tcss_data *port_d=
ata,
+					  struct cros_ec_tcss_data *prev_port_data)
 {
 	u8 ret =3D
 	    tcss_mode_states[prev_port_data->conn_mode][port_data->conn_mode];
@@ -423,8 +423,8 @@ static int cros_ec_tcss_req(struct cros_ec_tcss_info *i=
nfo, int req_type,
 	return -EIO;
 }
 =

-int cros_ec_tcss_detect_cable(struct cros_ec_tcss_info *info,
-			      bool force, u8 port)
+static int cros_ec_tcss_detect_cable(struct cros_ec_tcss_info *info,
+				     bool force, u8 port)
 {
 	struct cros_ec_tcss_data *tcss_info;
 	struct cros_ec_tcss_data port_data;
--===============3928090872593035542==--

