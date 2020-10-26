Content-Type: multipart/mixed; boundary="===============7111062846298599015=="
MIME-Version: 1.0
From: Thinh Nguyen <Thinh.Nguyen@synopsys.com>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH 3/3] usb: xhci: Check for blocked disconnection
Date: Mon, 26 Oct 2020 22:27:48 +0000
Message-ID: <491ae4d2-5c11-f67f-1aca-a883953e4e57@synopsys.com>
In-Reply-To: <20201026091038.GF1042@kadam>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7111062846298599015==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Dan Carpenter wrote:
> Hi Thinh,
>
> [FYI, it's a private test report for your RFC patch.]
>
> url:    https://urldefense.com/v3/__https://github.com/0day-ci/linux/comm=
its/Thinh-Nguyen/dt-bindings-usb-Add-undetected-disconnection-quirk/2020102=
2-131650__;!!A4F2R9G_pg!NUKKu0guuRY7SoPGszPfDbC3kfjxHznRSWGOqfFygl1e5uJQ83a=
GFsa6X928YyfPwrYL$ =

> base:    270315b8235e3d10c2e360cff56c2f9e0915a252
> config: i386-randconfig-m031-20201022 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> Reported-by: Dan Carpenter <dan.carpenter@oracle.com>
>
> smatch warnings:
> drivers/usb/host/xhci-ring.c:4277 xhci_resume_isoc() warn: variable deref=
erenced before check 'vdev->udev' (see line 4270)
>
> vim +4277 drivers/usb/host/xhci-ring.c
>
> 47ab6d8c0d7f14f Thinh Nguyen 2020-10-21  4260  void xhci_resume_isoc(stru=
ct work_struct *work)
> 47ab6d8c0d7f14f Thinh Nguyen 2020-10-21  4261  {
> 47ab6d8c0d7f14f Thinh Nguyen 2020-10-21  4262  	struct xhci_hcd *xhci;
> 47ab6d8c0d7f14f Thinh Nguyen 2020-10-21  4263  	struct xhci_virt_device *=
vdev;
> 47ab6d8c0d7f14f Thinh Nguyen 2020-10-21  4264  	unsigned int slot_id;
> 47ab6d8c0d7f14f Thinh Nguyen 2020-10-21  4265  	unsigned long flags;
> 47ab6d8c0d7f14f Thinh Nguyen 2020-10-21  4266  =

> 47ab6d8c0d7f14f Thinh Nguyen 2020-10-21  4267  	vdev =3D container_of(to_=
delayed_work(work),
> 47ab6d8c0d7f14f Thinh Nguyen 2020-10-21  4268  			    struct xhci_virt_de=
vice, resume_isoc);
> 47ab6d8c0d7f14f Thinh Nguyen 2020-10-21  4269  	xhci =3D vdev->xhci;
> 47ab6d8c0d7f14f Thinh Nguyen 2020-10-21 @4270  	slot_id =3D vdev->udev->s=
lot_id;
>                                                           ^^^^^^^^^^^^
> Dereference.
>
> 47ab6d8c0d7f14f Thinh Nguyen 2020-10-21  4271  =

> 47ab6d8c0d7f14f Thinh Nguyen 2020-10-21  4272  	spin_lock_irqsave(&xhci->=
lock, flags);
> 47ab6d8c0d7f14f Thinh Nguyen 2020-10-21  4273  =

> 47ab6d8c0d7f14f Thinh Nguyen 2020-10-21  4274  	vdev->flags &=3D ~VDEV_DI=
SCONN_CHECK_PENDING;
> 47ab6d8c0d7f14f Thinh Nguyen 2020-10-21  4275  =

> 47ab6d8c0d7f14f Thinh Nguyen 2020-10-21  4276  	/* Resume isoc transfers =
if the device is still connected */
> 47ab6d8c0d7f14f Thinh Nguyen 2020-10-21 @4277  	if (xhci->devs[slot_id] &=
& vdev->udev) {
>                                                                          =
  ^^^^^^^^^^
> Checked too late.
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://urldefense.com/v3/__https://lists.01.org/hyperkitty/list/kbuild-a=
ll(a)lists.01.org__;!!A4F2R9G_pg!NUKKu0guuRY7SoPGszPfDbC3kfjxHznRSWGOqfFygl=
1e5uJQ83aGFsa6X928Y8qQXggz$ =


Thanks very much for the report. I'll make the fix.

BR,
Thinh
--===============7111062846298599015==--

