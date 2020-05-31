Content-Type: multipart/mixed; boundary="===============8179076400560488091=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] drm/virtio: virtgpu_dmabuf_ops can be static
Date: Sun, 31 May 2020 18:04:57 +0800
Message-ID: <20200531100457.GA195395@936ae0323f7b>
In-Reply-To: <20200526105811.30784-4-stevensd@chromium.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8179076400560488091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 virtgpu_prime.c |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/virtio/virtgpu_prime.c b/drivers/gpu/drm/virti=
o/virtgpu_prime.c
index a753bb70fcf11..04848a768e74d 100644
--- a/drivers/gpu/drm/virtio/virtgpu_prime.c
+++ b/drivers/gpu/drm/virtio/virtgpu_prime.c
@@ -43,7 +43,7 @@ static int virtgpu_virtio_get_uuid(struct dma_buf *buf,
 	return 0;
 }
 =

-const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =3D  {
+static const struct virtio_dma_buf_ops virtgpu_dmabuf_ops =3D  {
 	.ops =3D {
 		.cache_sgt_mapping =3D true,
 		.attach =3D virtio_dma_buf_attach,
--===============8179076400560488091==--

