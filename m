Content-Type: multipart/mixed; boundary="===============4702438117667862820=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH andersson-kernel] drm/bridge: lt9611: lt9611_hdmi_hw_params() can be static
Date: Thu, 27 Feb 2020 06:17:10 +0800
Message-ID: <20200226221710.GA41418@e50d7db646c3>
In-Reply-To: <202002270624.muKmv8Au%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4702438117667862820==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Fixes: 9e1731f0c9f2 ("drm/bridge: lt9611: Add hdmi audio codec support")
Signed-off-by: kbuild test robot <lkp@intel.com>
---
 lt9611.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/lt9611.c b/drivers/gpu/drm/bridge/lt961=
1.c
index 4d6a324aa11ed..64a614032f34c 100644
--- a/drivers/gpu/drm/bridge/lt9611.c
+++ b/drivers/gpu/drm/bridge/lt9611.c
@@ -1024,7 +1024,7 @@ static int lt9611_read_device_rev(struct lt9611 *lt96=
11)
 	return ret;
 }
 =

-int lt9611_hdmi_hw_params(struct device *dev, void *data,
+static int lt9611_hdmi_hw_params(struct device *dev, void *data,
 			   struct hdmi_codec_daifmt *fmt,
 			   struct hdmi_codec_params *hparms)
 {
@@ -1097,7 +1097,7 @@ static struct hdmi_codec_pdata codec_data =3D {
 	.i2s =3D 1,
 };
 =

-int lt9611_audio_init(struct device *dev, struct lt9611 *lt9611)
+static int lt9611_audio_init(struct device *dev, struct lt9611 *lt9611)
 {
 	codec_data.data =3D lt9611;
 	lt9611->audio_pdev =3D platform_device_register_data(dev,
@@ -1108,7 +1108,7 @@ int lt9611_audio_init(struct device *dev, struct lt96=
11 *lt9611)
 	return PTR_ERR_OR_ZERO(lt9611->audio_pdev);
 }
 =

-void lt9611_audio_exit(struct lt9611 *lt9611)
+static void lt9611_audio_exit(struct lt9611 *lt9611)
 {
 	if (lt9611->audio_pdev) {
 		platform_device_unregister(lt9611->audio_pdev);
--===============4702438117667862820==--

