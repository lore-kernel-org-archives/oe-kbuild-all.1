Content-Type: multipart/mixed; boundary="===============5289932266568853743=="
MIME-Version: 1.0
From: Mike Christie <michael.christie@oracle.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH 04/16] vhost: prep vhost_dev_init users to handle failures
Date: Fri, 23 Oct 2020 11:21:18 -0500
Message-ID: <3361538b-15bf-fb92-040b-fd9c33370c70@oracle.com>
In-Reply-To: <20201023115635-mutt-send-email-mst@kernel.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5289932266568853743==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 10/23/20 10:56 AM, Michael S. Tsirkin wrote:
> On Fri, Oct 09, 2020 at 02:41:26PM +0300, Dan Carpenter wrote:
>> Hi Mike,
>>
>> url:    https://urldefense.com/v3/__https://github.com/0day-ci/linux/com=
mits/Mike-Christie/vhost-fix-scsi-cmd-handling-and-IOPs/20201008-045802__;!=
!GqivPVa7Brio!PSUeg8MO8B2TLNpewKuGd0oWY8N3pkO7w9hbCh3xgWK3TgFsPr78zcIUZ8Org=
xgaqydf$
>> base:   https://urldefense.com/v3/__https://git.kernel.org/pub/scm/linux=
/kernel/git/mst/vhost.git__;!!GqivPVa7Brio!PSUeg8MO8B2TLNpewKuGd0oWY8N3pkO7=
w9hbCh3xgWK3TgFsPr78zcIUZ8Org7WbKd27$  linux-next
>> config: x86_64-randconfig-m001-20201008 (attached as .config)
>> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>>
>> New smatch warnings:
>> drivers/vhost/vdpa.c:844 vhost_vdpa_open() error: uninitialized symbol '=
r'.
>>
>> Old smatch warnings:
>> drivers/vhost/vdpa.c:436 vhost_vdpa_unlocked_ioctl() warn: maybe return =
-EFAULT instead of the bytes remaining?
>> drivers/vhost/vdpa.c:489 vhost_vdpa_unlocked_ioctl() warn: maybe return =
-EFAULT instead of the bytes remaining?
>>
>> vim +/r +844 drivers/vhost/vdpa.c
>>
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  793  static int vhost_vdpa_ope=
n(struct inode *inode, struct file *filep)
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  794  {
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  795  	struct vhost_vdpa *v;
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  796  	struct vhost_dev *dev;
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  797  	struct vhost_virtqueue *=
*vqs;
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  798  	int nvqs, i, r, opened;
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  799
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  800  	v =3D container_of(inode=
->i_cdev, struct vhost_vdpa, cdev);
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  801
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  802  	opened =3D atomic_cmpxch=
g(&v->opened, 0, 1);
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  803  	if (opened)
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  804  		return -EBUSY;
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  805
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  806  	nvqs =3D v->nvqs;
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  807  	vhost_vdpa_reset(v);
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  808
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  809  	vqs =3D kmalloc_array(nv=
qs, sizeof(*vqs), GFP_KERNEL);
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  810  	if (!vqs) {
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  811  		r =3D -ENOMEM;
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  812  		goto err;
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  813  	}
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  814
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  815  	dev =3D &v->vdev;
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  816  	for (i =3D 0; i < nvqs; =
i++) {
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  817  		vqs[i] =3D &v->vqs[i];
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  818  		vqs[i]->handle_kick =3D=
 handle_vq_kick;
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  819  	}
>> 7dc4d1082d406f3 Mike Christie 2020-10-07  820  	if (vhost_dev_init(dev, =
vqs, nvqs, 0, 0, 0, false,
>> 7dc4d1082d406f3 Mike Christie 2020-10-07  821  			   vhost_vdpa_process_=
iotlb_msg))
>> 7dc4d1082d406f3 Mike Christie 2020-10-07  822  		goto err_dev_init;
>>
>> "r" not set on this error path.
>>
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  823
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  824  	dev->iotlb =3D vhost_iot=
lb_alloc(0, 0);
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  825  	if (!dev->iotlb) {
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  826  		r =3D -ENOMEM;
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  827  		goto err_init_iotlb;
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  828  	}
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  829
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  830  	r =3D vhost_vdpa_alloc_d=
omain(v);
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  831  	if (r)
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  832  		goto err_init_iotlb;
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  833
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  834  	filep->private_data =3D =
v;
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  835
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  836  	return 0;
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  837
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  838  err_init_iotlb:
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  839  	vhost_dev_cleanup(&v->vd=
ev);
>> 7dc4d1082d406f3 Mike Christie 2020-10-07  840  err_dev_init:
>> 37787e9f81e2e58 Mike Christie 2020-09-21  841  	kfree(vqs);
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  842  err:
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  843  	atomic_dec(&v->opened);
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26 @844  	return r;
>> 4c8cf31885f69e8 Tiwei Bie     2020-03-26  845  }
> =

> =

> Yes looks like it would use r uninitialized ...
> Mike?
> =


Ah sorry, I had posted a v3 of this patchset:

https://patchwork.kernel.org/project/target-devel/list/?series=3D368487

and I fixed that but there was another cases of uninitialized variable =

that I missed. I fixed that up now, but have not posted an updated set.
--===============5289932266568853743==--

