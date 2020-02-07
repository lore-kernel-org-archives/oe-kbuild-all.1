Content-Type: multipart/mixed; boundary="===============2929622112620989581=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [kraxel:drm-virtio-buffers /14] drivers/gpu/drm/virtio/virtio-buffers.c:48:21: sparse: sparse: restricted __le32 degrades to integer
Date: Fri, 07 Feb 2020 23:51:17 +0800
Message-ID: <202002072342.rMNezNZg%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============2929622112620989581==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   git://git.kraxel.org/linux drm-virtio-buffers
head:   99a89f50af438cb416646f62739903caf679d4ce
commit: 91629472d325002de19fb303ce18042283e1b739 [/14] [wip] virtio-buffers=
: guest driver
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-159-g100509c0-dirty
        git checkout 91629472d325002de19fb303ce18042283e1b739
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> drivers/gpu/drm/virtio/virtio-buffers.c:48:21: sparse: sparse: restricte=
d __le32 degrades to integer
>> drivers/gpu/drm/virtio/virtio-buffers.c:41:6: sparse: sparse: symbol 'vi=
rtbufs_ctrl_ack' was not declared. Should it be static?

vim +48 drivers/gpu/drm/virtio/virtio-buffers.c

    40	=

  > 41	void virtbufs_ctrl_ack(struct virtqueue *vq)
    42	{
    43		// struct virtbufs_device *vb =3D vq->vdev->priv;
    44		struct virtbufs_request *req;
    45		int length;
    46	=

    47		req =3D virtqueue_get_buf(vq, &length);
  > 48		if (req->rsp.response !=3D VIRTIO_BUFFERS_RSP_OK)
    49			DRM_ERROR("command 0x%04x -> error 0x%4x\n",
    50				  req->cmd.command, req->rsp.response);
    51		kfree(req);
    52	}
    53	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2929622112620989581==--

