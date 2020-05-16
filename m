Content-Type: multipart/mixed; boundary="===============1126033707533667402=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] thermal: core: thermal_genl_sampling_temp() can be static
Date: Sat, 16 May 2020 20:55:05 +0800
Message-ID: <20200516125505.GA16652@aae4cc650884>
In-Reply-To: <20200515141034.19154-4-daniel.lezcano@linaro.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1126033707533667402==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 thermal_netlink.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/thermal/thermal_netlink.c b/drivers/thermal/thermal_ne=
tlink.c
index a2bce846771e4..851db26e66465 100644
--- a/drivers/thermal/thermal_netlink.c
+++ b/drivers/thermal/thermal_netlink.c
@@ -66,7 +66,7 @@ static struct genl_family thermal_gnl_family;
 =

 /************************** Sampling encoding ****************************=
***/
 =

-int thermal_genl_sampling_temp(int id, int temp)
+static int thermal_genl_sampling_temp(int id, int temp)
 {
 	struct sk_buff *skb;
 	void *hdr;
@@ -506,7 +506,7 @@ static cb_t cmd_cb[] =3D {
 	[THERMAL_GENL_CMD_CDEV_GET]	=3D thermal_genl_cmd_cdev_get,
 };
 =

-int thermal_genl_cmd_dumpit(struct sk_buff *skb, struct netlink_callback *=
cb)
+static int thermal_genl_cmd_dumpit(struct sk_buff *skb, struct netlink_cal=
lback *cb)
 {
 	struct param p =3D { .msg =3D skb };
 	const struct genl_dumpit_info *info =3D genl_dumpit_info(cb);
@@ -532,7 +532,7 @@ int thermal_genl_cmd_dumpit(struct sk_buff *skb, struct=
 netlink_callback *cb)
 	return ret;
 }
 =

-int thermal_genl_cmd_doit(struct sk_buff *skb, struct genl_info *info)
+static int thermal_genl_cmd_doit(struct sk_buff *skb, struct genl_info *in=
fo)
 {
 	struct param p =3D { .attrs =3D info->attrs };
 	struct sk_buff *msg;
--===============1126033707533667402==--

