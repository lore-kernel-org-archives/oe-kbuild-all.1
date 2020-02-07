Content-Type: multipart/mixed; boundary="===============2824610900081716128=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] platform/chrome: cros_typec_parse_port_props() can be static
Date: Fri, 07 Feb 2020 14:52:00 +0800
Message-ID: <20200207065200.eevscpn4h7d7ocvr@f53c9c00458a>
In-Reply-To: <20200205205954.84503-2-pmalani@chromium.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2824610900081716128==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 2adbeaafa10e ("platform/chrome: Add Type C connector class driver")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 cros_ec_typec.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/platform/chrome/cros_ec_typec.c b/drivers/platform/chr=
ome/cros_ec_typec.c
index fe5659171c2a85..9b83aa4d5456d4 100644
--- a/drivers/platform/chrome/cros_ec_typec.c
+++ b/drivers/platform/chrome/cros_ec_typec.c
@@ -25,9 +25,9 @@ struct cros_typec_data {
 	struct typec_port *ports[EC_USB_PD_MAX_PORTS];
 };
 =

-int cros_typec_parse_port_props(struct typec_capability *cap,
-				struct fwnode_handle *fwnode,
-				struct device *dev)
+static int cros_typec_parse_port_props(struct typec_capability *cap,
+				       struct fwnode_handle *fwnode,
+				       struct device *dev)
 {
 	const char *buf;
 	int ret;
--===============2824610900081716128==--

