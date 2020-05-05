Content-Type: multipart/mixed; boundary="===============8055016298972460613=="
MIME-Version: 1.0
From: David Hildenbrand <david@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [vhost:vhost 8/22] drivers/virtio/virtio_mem.c:1375:20: error: implicit declaration of function 'kzalloc'; did you mean 'vzalloc'?
Date: Tue, 05 May 2020 16:50:13 +0200
Message-ID: <7dea2810-85cf-0892-20a8-bba3e3a2c133@redhat.com>
In-Reply-To: <202005052221.83QerHmG%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8055016298972460613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 05.05.20 16:15, kbuild test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git vho=
st
> head:   da1742791d8c0c0a8e5471f181549c4726a5c5f9
> commit: 7527631e900d464ed2d533f799cb0da2b29cc6f0 [8/22] virtio-mem: Parav=
irtualized memory hotplug
> config: x86_64-randconfig-b002-20200505 (attached as .config)
> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> reproduce:
>         git checkout 7527631e900d464ed2d533f799cb0da2b29cc6f0
>         # save the attached .config to linux build tree
>         make ARCH=3Dx86_64 =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
> =

> All error/warnings (new ones prefixed by >>):
> =

>    drivers/virtio/virtio_mem.c: In function 'virtio_mem_probe':
>>> drivers/virtio/virtio_mem.c:1375:20: error: implicit declaration of fun=
ction 'kzalloc'; did you mean 'vzalloc'? [-Werror=3Dimplicit-function-decla=
ration]
>      vdev->priv =3D vm =3D kzalloc(sizeof(*vm), GFP_KERNEL);
>                        ^~~~~~~
>                        vzalloc
>>> drivers/virtio/virtio_mem.c:1375:18: warning: assignment makes pointer =
from integer without a cast [-Wint-conversion]
>      vdev->priv =3D vm =3D kzalloc(sizeof(*vm), GFP_KERNEL);
>                      ^
>>> drivers/virtio/virtio_mem.c:1419:2: error: implicit declaration of func=
tion 'kfree'; did you mean 'vfree'? [-Werror=3Dimplicit-function-declaratio=
n]
>      kfree(vm);
>      ^~~~~
>      vfree
>    cc1: some warnings being treated as errors
> =

> vim +1375 drivers/virtio/virtio_mem.c

Guess we simply need

 #include <linux/slab.h>

to make it work for that config.

-- =

Thanks,

David / dhildenb

--===============8055016298972460613==--

