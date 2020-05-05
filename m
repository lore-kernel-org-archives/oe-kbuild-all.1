Content-Type: multipart/mixed; boundary="===============9049227411305282335=="
MIME-Version: 1.0
From: Michael S. Tsirkin <mst@redhat.com>
To: kbuild-all@lists.01.org
Subject: Re: [vhost:vhost 8/22] drivers/virtio/virtio_mem.c:1375:20: error: implicit declaration of function 'kzalloc'; did you mean 'vzalloc'?
Date: Tue, 05 May 2020 12:20:07 -0400
Message-ID: <20200505121732-mutt-send-email-mst@kernel.org>
In-Reply-To: <3eaebd8d-750a-d046-15f5-706fb00a196e@redhat.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============9049227411305282335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Tue, May 05, 2020 at 05:46:44PM +0200, David Hildenbrand wrote:
> On 05.05.20 17:44, Michael S. Tsirkin wrote:
> > On Tue, May 05, 2020 at 04:50:13PM +0200, David Hildenbrand wrote:
> >> On 05.05.20 16:15, kbuild test robot wrote:
> >>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git=
 vhost
> >>> head:   da1742791d8c0c0a8e5471f181549c4726a5c5f9
> >>> commit: 7527631e900d464ed2d533f799cb0da2b29cc6f0 [8/22] virtio-mem: P=
aravirtualized memory hotplug
> >>> config: x86_64-randconfig-b002-20200505 (attached as .config)
> >>> compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
> >>> reproduce:
> >>>         git checkout 7527631e900d464ed2d533f799cb0da2b29cc6f0
> >>>         # save the attached .config to linux build tree
> >>>         make ARCH=3Dx86_64 =

> >>>
> >>> If you fix the issue, kindly add following tag as appropriate
> >>> Reported-by: kbuild test robot <lkp@intel.com>
> >>>
> >>> All error/warnings (new ones prefixed by >>):
> >>>
> >>>    drivers/virtio/virtio_mem.c: In function 'virtio_mem_probe':
> >>>>> drivers/virtio/virtio_mem.c:1375:20: error: implicit declaration of=
 function 'kzalloc'; did you mean 'vzalloc'? [-Werror=3Dimplicit-function-d=
eclaration]
> >>>      vdev->priv =3D vm =3D kzalloc(sizeof(*vm), GFP_KERNEL);
> >>>                        ^~~~~~~
> >>>                        vzalloc
> >>>>> drivers/virtio/virtio_mem.c:1375:18: warning: assignment makes poin=
ter from integer without a cast [-Wint-conversion]
> >>>      vdev->priv =3D vm =3D kzalloc(sizeof(*vm), GFP_KERNEL);
> >>>                      ^
> >>>>> drivers/virtio/virtio_mem.c:1419:2: error: implicit declaration of =
function 'kfree'; did you mean 'vfree'? [-Werror=3Dimplicit-function-declar=
ation]
> >>>      kfree(vm);
> >>>      ^~~~~
> >>>      vfree
> >>>    cc1: some warnings being treated as errors
> >>>
> >>> vim +1375 drivers/virtio/virtio_mem.c
> >>
> >> Guess we simply need
> >>
> >>  #include <linux/slab.h>
> >>
> >> to make it work for that config.
> > =

> > =

> > OK I added that in the 1st commit that introduced virtio-mem.
> =

> Thanks. I have some addon-patches ready, what's the best way to continue
> with these?

If these are bugfixes, just respin the series (including this fix).
If these are more features, you can just post them on list noting "next" in
subject and saying "this is on top of vhost tree" after --.
I don't know how to make 0-day figure out where to apply such dependent
patches unfortunately.

> =

> -- =

> Thanks,
> =

> David / dhildenb

--===============9049227411305282335==--

