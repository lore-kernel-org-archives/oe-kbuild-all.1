Content-Type: multipart/mixed; boundary="===============8390262562964441045=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [RFC PATCH] vdpa: vhost_vdpa_poll_stop() can be static
Date: Wed, 27 May 2020 17:16:46 +0800
Message-ID: <20200527091646.GA80910@369e1fe990b8>
In-Reply-To: <1590471145-4436-1-git-send-email-lingshan.zhu@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8390262562964441045==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable


Signed-off-by: kbuild test robot <lkp@intel.com>
---
 vdpa.c |    6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/vhost/vdpa.c b/drivers/vhost/vdpa.c
index d3a2acafedecd4..5037ce7f48cd42 100644
--- a/drivers/vhost/vdpa.c
+++ b/drivers/vhost/vdpa.c
@@ -287,12 +287,12 @@ static long vhost_vdpa_get_vring_num(struct vhost_vdp=
a *v, u16 __user *argp)
 =

 	return 0;
 }
-void vhost_vdpa_poll_stop(struct vhost_virtqueue *vq)
+static void vhost_vdpa_poll_stop(struct vhost_virtqueue *vq)
 {
 	vhost_poll_stop(&vq->poll);
 }
 =

-int vhost_vdpa_poll_start(struct vhost_virtqueue *vq)
+static int vhost_vdpa_poll_start(struct vhost_virtqueue *vq)
 {
 	struct vhost_poll *poll =3D &vq->poll;
 	struct file *file =3D vq->kick;
@@ -747,7 +747,7 @@ static int vhost_vdpa_poll_worker(wait_queue_entry_t *w=
ait, unsigned int mode,
 	return 0;
 }
 =

-void vhost_vdpa_poll_init(struct vhost_dev *dev)
+static void vhost_vdpa_poll_init(struct vhost_dev *dev)
 {
 	struct vhost_virtqueue *vq;
 	struct vhost_poll *poll;
--===============8390262562964441045==--

