Content-Type: multipart/mixed; boundary="===============3086545999840677596=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] optee: __optee_enumerate_devices() can be static
Date: Thu, 21 May 2020 13:49:32 +0800
Message-ID: <20200521054932.GA42084@f61f8b3f25ca>
In-Reply-To: <20200518133459.28019-2-maxim.uvarov@linaro.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3086545999840677596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 device.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/tee/optee/device.c b/drivers/tee/optee/device.c
index 8263b308efd56..d4931dad07aaa 100644
--- a/drivers/tee/optee/device.c
+++ b/drivers/tee/optee/device.c
@@ -87,7 +87,7 @@ static int optee_register_device(const uuid_t *device_uui=
d, u32 device_id)
 	return rc;
 }
 =

-int __optee_enumerate_devices(u32 func)
+static int __optee_enumerate_devices(u32 func)
 {
 	const uuid_t pta_uuid =3D
 		UUID_INIT(0x7011a688, 0xddde, 0x4053,
--===============3086545999840677596==--

