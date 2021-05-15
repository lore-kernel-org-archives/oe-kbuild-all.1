Content-Type: multipart/mixed; boundary="===============3972085244043398617=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [arm-platforms:irq/domain_cleanup 5/25] drivers/staging/octeon-usb/octeon-hcd.c:3548:26: error: dereferencing pointer to incomplete type 'struct device_node'
Date: Sun, 16 May 2021 02:27:08 +0800
Message-ID: <202105160201.AT9dpMNa-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3972085244043398617==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms.g=
it irq/domain_cleanup
head:   dee94333f76d0bd7b6c8302e377654b6e103b71b
commit: 59463db82808e6588f589b75f7fef5f0c0c2012d [5/25] MIPS: Do not includ=
e linux/irqdomain.h from asm/irq.h
config: mips-cavium_octeon_defconfig (attached as .config)
compiler: mips64-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/maz/arm-platforms=
.git/commit/?id=3D59463db82808e6588f589b75f7fef5f0c0c2012d
        git remote add arm-platforms https://git.kernel.org/pub/scm/linux/k=
ernel/git/maz/arm-platforms.git
        git fetch --no-tags arm-platforms irq/domain_cleanup
        git checkout 59463db82808e6588f589b75f7fef5f0c0c2012d
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
W=3D1 ARCH=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   drivers/staging/octeon-usb/octeon-hcd.c: In function 'octeon_usb_probe':
>> drivers/staging/octeon-usb/octeon-hcd.c:3548:26: error: dereferencing po=
inter to incomplete type 'struct device_node'
    3548 |  usbn_node =3D dev->of_node->parent;
         |                          ^~
>> drivers/staging/octeon-usb/octeon-hcd.c:3550:6: error: implicit declarat=
ion of function 'of_property_read_u32' [-Werror=3Dimplicit-function-declara=
tion]
    3550 |  i =3D of_property_read_u32(usbn_node,
         |      ^~~~~~~~~~~~~~~~~~~~
>> drivers/staging/octeon-usb/octeon-hcd.c:3575:6: error: implicit declarat=
ion of function 'of_property_read_string' [-Werror=3Dimplicit-function-decl=
aration]
    3575 |  i =3D of_property_read_string(usbn_node,
         |      ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/staging/octeon-usb/octeon-hcd.c:3600:9: error: implicit declarat=
ion of function 'irq_create_mapping' [-Werror=3Dimplicit-function-declarati=
on]
    3600 |   irq =3D irq_create_mapping(NULL, hwirq);
         |         ^~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +3548 drivers/staging/octeon-usb/octeon-hcd.c

96b06c0a16f737 Chris Packham 2020-02-05  3527  =

96b06c0a16f737 Chris Packham 2020-02-05  3528  static int octeon_usb_probe(=
struct platform_device *pdev)
96b06c0a16f737 Chris Packham 2020-02-05  3529  {
96b06c0a16f737 Chris Packham 2020-02-05  3530  	int status;
96b06c0a16f737 Chris Packham 2020-02-05  3531  	int initialize_flags;
96b06c0a16f737 Chris Packham 2020-02-05  3532  	int usb_num;
96b06c0a16f737 Chris Packham 2020-02-05  3533  	struct resource *res_mem;
96b06c0a16f737 Chris Packham 2020-02-05  3534  	struct device_node *usbn_no=
de;
96b06c0a16f737 Chris Packham 2020-02-05  3535  	int irq =3D platform_get_ir=
q(pdev, 0);
96b06c0a16f737 Chris Packham 2020-02-05  3536  	struct device *dev =3D &pde=
v->dev;
96b06c0a16f737 Chris Packham 2020-02-05  3537  	struct octeon_hcd *usb;
96b06c0a16f737 Chris Packham 2020-02-05  3538  	struct usb_hcd *hcd;
96b06c0a16f737 Chris Packham 2020-02-05  3539  	u32 clock_rate =3D 48000000;
96b06c0a16f737 Chris Packham 2020-02-05  3540  	bool is_crystal_clock =3D f=
alse;
96b06c0a16f737 Chris Packham 2020-02-05  3541  	const char *clock_type;
96b06c0a16f737 Chris Packham 2020-02-05  3542  	int i;
96b06c0a16f737 Chris Packham 2020-02-05  3543  =

96b06c0a16f737 Chris Packham 2020-02-05  3544  	if (!dev->of_node) {
96b06c0a16f737 Chris Packham 2020-02-05  3545  		dev_err(dev, "Error: empty=
 of_node\n");
96b06c0a16f737 Chris Packham 2020-02-05  3546  		return -ENXIO;
96b06c0a16f737 Chris Packham 2020-02-05  3547  	}
96b06c0a16f737 Chris Packham 2020-02-05 @3548  	usbn_node =3D dev->of_node-=
>parent;
96b06c0a16f737 Chris Packham 2020-02-05  3549  =

96b06c0a16f737 Chris Packham 2020-02-05 @3550  	i =3D of_property_read_u32(=
usbn_node,
96b06c0a16f737 Chris Packham 2020-02-05  3551  				 "clock-frequency", &clo=
ck_rate);
96b06c0a16f737 Chris Packham 2020-02-05  3552  	if (i)
96b06c0a16f737 Chris Packham 2020-02-05  3553  		i =3D of_property_read_u32=
(usbn_node,
96b06c0a16f737 Chris Packham 2020-02-05  3554  					 "refclk-frequency", &c=
lock_rate);
96b06c0a16f737 Chris Packham 2020-02-05  3555  	if (i) {
96b06c0a16f737 Chris Packham 2020-02-05  3556  		dev_err(dev, "No USBN \"cl=
ock-frequency\"\n");
96b06c0a16f737 Chris Packham 2020-02-05  3557  		return -ENXIO;
96b06c0a16f737 Chris Packham 2020-02-05  3558  	}
96b06c0a16f737 Chris Packham 2020-02-05  3559  	switch (clock_rate) {
96b06c0a16f737 Chris Packham 2020-02-05  3560  	case 12000000:
96b06c0a16f737 Chris Packham 2020-02-05  3561  		initialize_flags =3D CVMX_=
USB_INITIALIZE_FLAGS_CLOCK_12MHZ;
96b06c0a16f737 Chris Packham 2020-02-05  3562  		break;
96b06c0a16f737 Chris Packham 2020-02-05  3563  	case 24000000:
96b06c0a16f737 Chris Packham 2020-02-05  3564  		initialize_flags =3D CVMX_=
USB_INITIALIZE_FLAGS_CLOCK_24MHZ;
96b06c0a16f737 Chris Packham 2020-02-05  3565  		break;
96b06c0a16f737 Chris Packham 2020-02-05  3566  	case 48000000:
96b06c0a16f737 Chris Packham 2020-02-05  3567  		initialize_flags =3D CVMX_=
USB_INITIALIZE_FLAGS_CLOCK_48MHZ;
96b06c0a16f737 Chris Packham 2020-02-05  3568  		break;
96b06c0a16f737 Chris Packham 2020-02-05  3569  	default:
96b06c0a16f737 Chris Packham 2020-02-05  3570  		dev_err(dev, "Illegal USBN=
 \"clock-frequency\" %u\n",
96b06c0a16f737 Chris Packham 2020-02-05  3571  			clock_rate);
96b06c0a16f737 Chris Packham 2020-02-05  3572  		return -ENXIO;
96b06c0a16f737 Chris Packham 2020-02-05  3573  	}
96b06c0a16f737 Chris Packham 2020-02-05  3574  =

96b06c0a16f737 Chris Packham 2020-02-05 @3575  	i =3D of_property_read_stri=
ng(usbn_node,
96b06c0a16f737 Chris Packham 2020-02-05  3576  				    "cavium,refclk-type"=
, &clock_type);
96b06c0a16f737 Chris Packham 2020-02-05  3577  	if (i)
96b06c0a16f737 Chris Packham 2020-02-05  3578  		i =3D of_property_read_str=
ing(usbn_node,
96b06c0a16f737 Chris Packham 2020-02-05  3579  					    "refclk-type", &clo=
ck_type);
96b06c0a16f737 Chris Packham 2020-02-05  3580  =

96b06c0a16f737 Chris Packham 2020-02-05  3581  	if (!i && strcmp("crystal",=
 clock_type) =3D=3D 0)
96b06c0a16f737 Chris Packham 2020-02-05  3582  		is_crystal_clock =3D true;
96b06c0a16f737 Chris Packham 2020-02-05  3583  =

96b06c0a16f737 Chris Packham 2020-02-05  3584  	if (is_crystal_clock)
96b06c0a16f737 Chris Packham 2020-02-05  3585  		initialize_flags |=3D CVMX=
_USB_INITIALIZE_FLAGS_CLOCK_XO_XI;
96b06c0a16f737 Chris Packham 2020-02-05  3586  	else
96b06c0a16f737 Chris Packham 2020-02-05  3587  		initialize_flags |=3D CVMX=
_USB_INITIALIZE_FLAGS_CLOCK_XO_GND;
96b06c0a16f737 Chris Packham 2020-02-05  3588  =

96b06c0a16f737 Chris Packham 2020-02-05  3589  	res_mem =3D platform_get_re=
source(pdev, IORESOURCE_MEM, 0);
96b06c0a16f737 Chris Packham 2020-02-05  3590  	if (!res_mem) {
96b06c0a16f737 Chris Packham 2020-02-05  3591  		dev_err(dev, "found no mem=
ory resource\n");
96b06c0a16f737 Chris Packham 2020-02-05  3592  		return -ENXIO;
96b06c0a16f737 Chris Packham 2020-02-05  3593  	}
96b06c0a16f737 Chris Packham 2020-02-05  3594  	usb_num =3D (res_mem->start=
 >> 44) & 1;
96b06c0a16f737 Chris Packham 2020-02-05  3595  =

96b06c0a16f737 Chris Packham 2020-02-05  3596  	if (irq < 0) {
96b06c0a16f737 Chris Packham 2020-02-05  3597  		/* Defective device tree, =
but we know how to fix it. */
96b06c0a16f737 Chris Packham 2020-02-05  3598  		irq_hw_number_t hwirq =3D =
usb_num ? (1 << 6) + 17 : 56;
96b06c0a16f737 Chris Packham 2020-02-05  3599  =

96b06c0a16f737 Chris Packham 2020-02-05 @3600  		irq =3D irq_create_mapping=
(NULL, hwirq);
96b06c0a16f737 Chris Packham 2020-02-05  3601  	}
96b06c0a16f737 Chris Packham 2020-02-05  3602  =

96b06c0a16f737 Chris Packham 2020-02-05  3603  	/*
96b06c0a16f737 Chris Packham 2020-02-05  3604  	 * Set the DMA mask to 64bi=
ts so we get buffers already translated for
96b06c0a16f737 Chris Packham 2020-02-05  3605  	 * DMA.
96b06c0a16f737 Chris Packham 2020-02-05  3606  	 */
96b06c0a16f737 Chris Packham 2020-02-05  3607  	i =3D dma_coerce_mask_and_c=
oherent(dev, DMA_BIT_MASK(64));
96b06c0a16f737 Chris Packham 2020-02-05  3608  	if (i)
96b06c0a16f737 Chris Packham 2020-02-05  3609  		return i;
96b06c0a16f737 Chris Packham 2020-02-05  3610  =

96b06c0a16f737 Chris Packham 2020-02-05  3611  	/*
96b06c0a16f737 Chris Packham 2020-02-05  3612  	 * Only cn52XX and cn56XX h=
ave DWC_OTG USB hardware and the
96b06c0a16f737 Chris Packham 2020-02-05  3613  	 * IOB priority registers. =
 Under heavy network load USB
96b06c0a16f737 Chris Packham 2020-02-05  3614  	 * hardware can be starved =
by the IOB causing a crash.  Give
96b06c0a16f737 Chris Packham 2020-02-05  3615  	 * it a priority boost if i=
t has been waiting more than 400
96b06c0a16f737 Chris Packham 2020-02-05  3616  	 * cycles to avoid this sit=
uation.
96b06c0a16f737 Chris Packham 2020-02-05  3617  	 *
96b06c0a16f737 Chris Packham 2020-02-05  3618  	 * Testing indicates that a=
 cnt_val of 8192 is not sufficient,
96b06c0a16f737 Chris Packham 2020-02-05  3619  	 * but no failures are seen=
 with 4096.  We choose a value of
96b06c0a16f737 Chris Packham 2020-02-05  3620  	 * 400 to give a safety fac=
tor of 10.
96b06c0a16f737 Chris Packham 2020-02-05  3621  	 */
96b06c0a16f737 Chris Packham 2020-02-05  3622  	if (OCTEON_IS_MODEL(OCTEON_=
CN52XX) || OCTEON_IS_MODEL(OCTEON_CN56XX)) {
96b06c0a16f737 Chris Packham 2020-02-05  3623  		union cvmx_iob_n2c_l2c_pri=
_cnt pri_cnt;
96b06c0a16f737 Chris Packham 2020-02-05  3624  =

96b06c0a16f737 Chris Packham 2020-02-05  3625  		pri_cnt.u64 =3D 0;
96b06c0a16f737 Chris Packham 2020-02-05  3626  		pri_cnt.s.cnt_enb =3D 1;
96b06c0a16f737 Chris Packham 2020-02-05  3627  		pri_cnt.s.cnt_val =3D 400;
96b06c0a16f737 Chris Packham 2020-02-05  3628  		cvmx_write_csr(CVMX_IOB_N2=
C_L2C_PRI_CNT, pri_cnt.u64);
96b06c0a16f737 Chris Packham 2020-02-05  3629  	}
96b06c0a16f737 Chris Packham 2020-02-05  3630  =

96b06c0a16f737 Chris Packham 2020-02-05  3631  	hcd =3D usb_create_hcd(&oct=
eon_hc_driver, dev, dev_name(dev));
96b06c0a16f737 Chris Packham 2020-02-05  3632  	if (!hcd) {
96b06c0a16f737 Chris Packham 2020-02-05  3633  		dev_dbg(dev, "Failed to al=
locate memory for HCD\n");
96b06c0a16f737 Chris Packham 2020-02-05  3634  		return -1;
96b06c0a16f737 Chris Packham 2020-02-05  3635  	}
96b06c0a16f737 Chris Packham 2020-02-05  3636  	hcd->uses_new_polling =3D 1;
96b06c0a16f737 Chris Packham 2020-02-05  3637  	usb =3D (struct octeon_hcd =
*)hcd->hcd_priv;
96b06c0a16f737 Chris Packham 2020-02-05  3638  =

96b06c0a16f737 Chris Packham 2020-02-05  3639  	spin_lock_init(&usb->lock);
96b06c0a16f737 Chris Packham 2020-02-05  3640  =

96b06c0a16f737 Chris Packham 2020-02-05  3641  	usb->init_flags =3D initial=
ize_flags;
96b06c0a16f737 Chris Packham 2020-02-05  3642  =

96b06c0a16f737 Chris Packham 2020-02-05  3643  	/* Initialize the USB state=
 structure */
96b06c0a16f737 Chris Packham 2020-02-05  3644  	usb->index =3D usb_num;
96b06c0a16f737 Chris Packham 2020-02-05  3645  	INIT_LIST_HEAD(&usb->idle_p=
ipes);
96b06c0a16f737 Chris Packham 2020-02-05  3646  	for (i =3D 0; i < ARRAY_SIZ=
E(usb->active_pipes); i++)
96b06c0a16f737 Chris Packham 2020-02-05  3647  		INIT_LIST_HEAD(&usb->activ=
e_pipes[i]);
96b06c0a16f737 Chris Packham 2020-02-05  3648  =

96b06c0a16f737 Chris Packham 2020-02-05  3649  	/* Due to an errata, CN31XX=
 doesn't support DMA */
96b06c0a16f737 Chris Packham 2020-02-05  3650  	if (OCTEON_IS_MODEL(OCTEON_=
CN31XX)) {
96b06c0a16f737 Chris Packham 2020-02-05  3651  		usb->init_flags |=3D CVMX_=
USB_INITIALIZE_FLAGS_NO_DMA;
96b06c0a16f737 Chris Packham 2020-02-05  3652  		/* Only use one channel wi=
th non DMA */
96b06c0a16f737 Chris Packham 2020-02-05  3653  		usb->idle_hardware_channel=
s =3D 0x1;
96b06c0a16f737 Chris Packham 2020-02-05  3654  	} else if (OCTEON_IS_MODEL(=
OCTEON_CN5XXX)) {
96b06c0a16f737 Chris Packham 2020-02-05  3655  		/* CN5XXX have an errata w=
ith channel 3 */
96b06c0a16f737 Chris Packham 2020-02-05  3656  		usb->idle_hardware_channel=
s =3D 0xf7;
96b06c0a16f737 Chris Packham 2020-02-05  3657  	} else {
96b06c0a16f737 Chris Packham 2020-02-05  3658  		usb->idle_hardware_channel=
s =3D 0xff;
96b06c0a16f737 Chris Packham 2020-02-05  3659  	}
96b06c0a16f737 Chris Packham 2020-02-05  3660  =

96b06c0a16f737 Chris Packham 2020-02-05  3661  	status =3D cvmx_usb_initial=
ize(dev, usb);
96b06c0a16f737 Chris Packham 2020-02-05  3662  	if (status) {
96b06c0a16f737 Chris Packham 2020-02-05  3663  		dev_dbg(dev, "USB initiali=
zation failed with %d\n", status);
96b06c0a16f737 Chris Packham 2020-02-05  3664  		usb_put_hcd(hcd);
96b06c0a16f737 Chris Packham 2020-02-05  3665  		return -1;
96b06c0a16f737 Chris Packham 2020-02-05  3666  	}
96b06c0a16f737 Chris Packham 2020-02-05  3667  =

96b06c0a16f737 Chris Packham 2020-02-05  3668  	status =3D usb_add_hcd(hcd,=
 irq, 0);
96b06c0a16f737 Chris Packham 2020-02-05  3669  	if (status) {
96b06c0a16f737 Chris Packham 2020-02-05  3670  		dev_dbg(dev, "USB add HCD =
failed with %d\n", status);
96b06c0a16f737 Chris Packham 2020-02-05  3671  		usb_put_hcd(hcd);
96b06c0a16f737 Chris Packham 2020-02-05  3672  		return -1;
96b06c0a16f737 Chris Packham 2020-02-05  3673  	}
96b06c0a16f737 Chris Packham 2020-02-05  3674  	device_wakeup_enable(hcd->s=
elf.controller);
96b06c0a16f737 Chris Packham 2020-02-05  3675  =

96b06c0a16f737 Chris Packham 2020-02-05  3676  	dev_info(dev, "Registered H=
CD for port %d on irq %d\n", usb_num, irq);
96b06c0a16f737 Chris Packham 2020-02-05  3677  =

96b06c0a16f737 Chris Packham 2020-02-05  3678  	return 0;
96b06c0a16f737 Chris Packham 2020-02-05  3679  }
96b06c0a16f737 Chris Packham 2020-02-05  3680  =


:::::: The code at line 3548 was first introduced by commit
:::::: 96b06c0a16f737e9ea7dff1e23dd5f6d847e6731 Revert "staging: octeon-usb=
: delete the octeon usb host controller driver"

:::::: TO: Chris Packham <chris.packham@alliedtelesis.co.nz>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============3972085244043398617==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============3972085244043398617==--

