Content-Type: multipart/mixed; boundary="===============6889197325335712974=="
MIME-Version: 1.0
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: kbuild-all@lists.01.org
Subject: [PATCH] remoteproc: wcss: Fix arguments passed to qcom_add_glink_subdev()
Date: Thu, 14 May 2020 11:58:56 -0700
Message-ID: <20200514185856.1598945-1-bjorn.andersson@linaro.org>
In-Reply-To: <202005150242.0AdaUqnG%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6889197325335712974==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Recently qcom_add_glink_subdev() was extended to also take the glink_ssr
identifier as an argument and I missed this while applying '8a226e2c71bb
("remoteproc: wcss: add support for rpmsg communication")'.

Fixes: 8a226e2c71bb ("remoteproc: wcss: add support for rpmsg communication=
")
Reported-by: kbuild test robot <lkp@intel.com>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_=
q6v5_wcss.c
index 48d16d81f94d..88c76b9417fa 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -560,7 +560,7 @@ static int q6v5_wcss_probe(struct platform_device *pdev)
 	if (ret)
 		goto free_rproc;
 =

-	qcom_add_glink_subdev(rproc, &wcss->glink_subdev);
+	qcom_add_glink_subdev(rproc, &wcss->glink_subdev, "q6wcss");
 	qcom_add_ssr_subdev(rproc, &wcss->ssr_subdev, "q6wcss");
 =

 	ret =3D rproc_add(rproc);
-- =

2.26.2

--===============6889197325335712974==--

