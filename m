Content-Type: multipart/mixed; boundary="===============4148412728066444791=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] usb: dwc2: Postponed gadget registration to the udc class driver
Date: Sun, 31 May 2020 21:33:10 +0800
Message-ID: <202005312116.9mY5QkUv%lkp@intel.com>
In-Reply-To: <137e787bf7c7935bda3358c8f07230d3f4998fad.1590745119.git.hminas@synopsys.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4148412728066444791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Minas,

I love your patch! Yet something to improve:

[auto build test ERROR on balbi-usb/testing/next]
[also build test ERROR on usb/usb-testing peter.chen-usb/ci-for-usb-next v5=
.7-rc7 next-20200529]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Minas-Harutyunyan/usb-dwc2=
-Postponed-gadget-registration-to-the-udc-class-driver/20200531-074103
base:   https://git.kernel.org/pub/scm/linux/kernel/git/balbi/usb.git testi=
ng/next
config: c6x-randconfig-c022-20200531 (attached as .config)
compiler: c6x-elf-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>

All errors (new ones prefixed by >>, old ones prefixed by <<):

drivers/usb/dwc2/platform.c: In function 'dwc2_driver_probe':
>> drivers/usb/dwc2/platform.c:580:49: error: 'struct dwc2_hsotg' has no me=
mber named 'gadget'
580 |   retval =3D usb_add_gadget_udc(hsotg->dev, &hsotg->gadget);
|                                                 ^~

vim +580 drivers/usb/dwc2/platform.c

   395	=

   396	/**
   397	 * dwc2_driver_probe() - Called when the DWC_otg core is bound to th=
e DWC_otg
   398	 * driver
   399	 *
   400	 * @dev: Platform device
   401	 *
   402	 * This routine creates the driver components required to control th=
e device
   403	 * (core, HCD, and PCD) and initializes the device. The driver compo=
nents are
   404	 * stored in a dwc2_hsotg structure. A reference to the dwc2_hsotg i=
s saved
   405	 * in the device private data. This allows the driver to access the =
dwc2_hsotg
   406	 * structure on subsequent calls to driver methods for this device.
   407	 */
   408	static int dwc2_driver_probe(struct platform_device *dev)
   409	{
   410		struct dwc2_hsotg *hsotg;
   411		struct resource *res;
   412		int retval;
   413	=

   414		hsotg =3D devm_kzalloc(&dev->dev, sizeof(*hsotg), GFP_KERNEL);
   415		if (!hsotg)
   416			return -ENOMEM;
   417	=

   418		hsotg->dev =3D &dev->dev;
   419	=

   420		/*
   421		 * Use reasonable defaults so platforms don't have to provide these.
   422		 */
   423		if (!dev->dev.dma_mask)
   424			dev->dev.dma_mask =3D &dev->dev.coherent_dma_mask;
   425		retval =3D dma_set_coherent_mask(&dev->dev, DMA_BIT_MASK(32));
   426		if (retval) {
   427			dev_err(&dev->dev, "can't set coherent DMA mask: %d\n", retval);
   428			return retval;
   429		}
   430	=

   431		hsotg->regs =3D devm_platform_get_and_ioremap_resource(dev, 0, &res=
);
   432		if (IS_ERR(hsotg->regs))
   433			return PTR_ERR(hsotg->regs);
   434	=

   435		dev_dbg(&dev->dev, "mapped PA %08lx to VA %p\n",
   436			(unsigned long)res->start, hsotg->regs);
   437	=

   438		retval =3D dwc2_lowlevel_hw_init(hsotg);
   439		if (retval)
   440			return retval;
   441	=

   442		spin_lock_init(&hsotg->lock);
   443	=

   444		hsotg->irq =3D platform_get_irq(dev, 0);
   445		if (hsotg->irq < 0)
   446			return hsotg->irq;
   447	=

   448		dev_dbg(hsotg->dev, "registering common handler for irq%d\n",
   449			hsotg->irq);
   450		retval =3D devm_request_irq(hsotg->dev, hsotg->irq,
   451					  dwc2_handle_common_intr, IRQF_SHARED,
   452					  dev_name(hsotg->dev), hsotg);
   453		if (retval)
   454			return retval;
   455	=

   456		hsotg->vbus_supply =3D devm_regulator_get_optional(hsotg->dev, "vbu=
s");
   457		if (IS_ERR(hsotg->vbus_supply)) {
   458			retval =3D PTR_ERR(hsotg->vbus_supply);
   459			hsotg->vbus_supply =3D NULL;
   460			if (retval !=3D -ENODEV)
   461				return retval;
   462		}
   463	=

   464		retval =3D dwc2_lowlevel_hw_enable(hsotg);
   465		if (retval)
   466			return retval;
   467	=

   468		hsotg->needs_byte_swap =3D dwc2_check_core_endianness(hsotg);
   469	=

   470		retval =3D dwc2_get_dr_mode(hsotg);
   471		if (retval)
   472			goto error;
   473	=

   474		hsotg->need_phy_for_wake =3D
   475			of_property_read_bool(dev->dev.of_node,
   476					      "snps,need-phy-for-wake");
   477	=

   478		/*
   479		 * Before performing any core related operations
   480		 * check core version.
   481		 */
   482		retval =3D dwc2_check_core_version(hsotg);
   483		if (retval)
   484			goto error;
   485	=

   486		/*
   487		 * Reset before dwc2_get_hwparams() then it could get power-on real
   488		 * reset value form registers.
   489		 */
   490		retval =3D dwc2_core_reset(hsotg, false);
   491		if (retval)
   492			goto error;
   493	=

   494		/* Detect config values from hardware */
   495		retval =3D dwc2_get_hwparams(hsotg);
   496		if (retval)
   497			goto error;
   498	=

   499		/*
   500		 * For OTG cores, set the force mode bits to reflect the value
   501		 * of dr_mode. Force mode bits should not be touched at any
   502		 * other time after this.
   503		 */
   504		dwc2_force_dr_mode(hsotg);
   505	=

   506		retval =3D dwc2_init_params(hsotg);
   507		if (retval)
   508			goto error;
   509	=

   510		if (hsotg->params.activate_stm_id_vb_detection) {
   511			u32 ggpio;
   512	=

   513			hsotg->usb33d =3D devm_regulator_get(hsotg->dev, "usb33d");
   514			if (IS_ERR(hsotg->usb33d)) {
   515				retval =3D PTR_ERR(hsotg->usb33d);
   516				if (retval !=3D -EPROBE_DEFER)
   517					dev_err(hsotg->dev,
   518						"failed to request usb33d supply: %d\n",
   519						retval);
   520				goto error;
   521			}
   522			retval =3D regulator_enable(hsotg->usb33d);
   523			if (retval) {
   524				dev_err(hsotg->dev,
   525					"failed to enable usb33d supply: %d\n", retval);
   526				goto error;
   527			}
   528	=

   529			ggpio =3D dwc2_readl(hsotg, GGPIO);
   530			ggpio |=3D GGPIO_STM32_OTG_GCCFG_IDEN;
   531			ggpio |=3D GGPIO_STM32_OTG_GCCFG_VBDEN;
   532			dwc2_writel(hsotg, ggpio, GGPIO);
   533		}
   534	=

   535		if (hsotg->dr_mode !=3D USB_DR_MODE_HOST) {
   536			retval =3D dwc2_gadget_init(hsotg);
   537			if (retval)
   538				goto error_init;
   539			hsotg->gadget_enabled =3D 1;
   540		}
   541	=

   542		/*
   543		 * If we need PHY for wakeup we must be wakeup capable.
   544		 * When we have a device that can wake without the PHY we
   545		 * can adjust this condition.
   546		 */
   547		if (hsotg->need_phy_for_wake)
   548			device_set_wakeup_capable(&dev->dev, true);
   549	=

   550		hsotg->reset_phy_on_wake =3D
   551			of_property_read_bool(dev->dev.of_node,
   552					      "snps,reset-phy-on-wake");
   553		if (hsotg->reset_phy_on_wake && !hsotg->phy) {
   554			dev_warn(hsotg->dev,
   555				 "Quirk reset-phy-on-wake only supports generic PHYs\n");
   556			hsotg->reset_phy_on_wake =3D false;
   557		}
   558	=

   559		if (hsotg->dr_mode !=3D USB_DR_MODE_PERIPHERAL) {
   560			retval =3D dwc2_hcd_init(hsotg);
   561			if (retval) {
   562				if (hsotg->gadget_enabled)
   563					dwc2_hsotg_remove(hsotg);
   564				goto error_init;
   565			}
   566			hsotg->hcd_enabled =3D 1;
   567		}
   568	=

   569		platform_set_drvdata(dev, hsotg);
   570		hsotg->hibernated =3D 0;
   571	=

   572		dwc2_debugfs_init(hsotg);
   573	=

   574		/* Gadget code manages lowlevel hw on its own */
   575		if (hsotg->dr_mode =3D=3D USB_DR_MODE_PERIPHERAL)
   576			dwc2_lowlevel_hw_disable(hsotg);
   577	=

   578		/* Postponed adding a new gadget to the udc class driver list */
   579		if (hsotg->gadget_enabled) {
 > 580			retval =3D usb_add_gadget_udc(hsotg->dev, &hsotg->gadget);
   581			if (retval) {
   582				dwc2_hsotg_remove(hsotg);
   583				goto error_init;
   584			}
   585		}
   586	=

   587		return 0;
   588	=

   589	error_init:
   590		if (hsotg->params.activate_stm_id_vb_detection)
   591			regulator_disable(hsotg->usb33d);
   592	error:
   593		dwc2_lowlevel_hw_disable(hsotg);
   594		return retval;
   595	}
   596	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4148412728066444791==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
dArGAQA=
--===============4148412728066444791==--

