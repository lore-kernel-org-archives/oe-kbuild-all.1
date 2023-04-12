Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D42246FD2
	for <oe-kbuild-all@lists.linux.dev>; Wed, 12 Apr 2023 17:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681320955; x=1712856955;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=HnsIO6P2M8Q7le2Ng1thbjopLUJJ76OdbGSlUE9aa0g=;
  b=ggJn/EmRjErngmE+jMQ+ybAZWdvHu8UoHvmA2hhAMYcbdCZZ8Dn1P4+J
   KXFt0MrSLZqgMh/8YI65I4sxoJ8+Hiw16KSMl/xddXgZsqG2JqsEicraz
   wzlyRMefIO9ophapvxOXFft/6i39B2n/RDSkOVREbFTttEfaiEJKSsX+w
   taqdS1uUcQKFXFwQksI4x88pRJ5V1NHWyKKFGnphKKbqAoAzzCQ2ydht8
   G/Hjk8FThLiNyfqud435Vlw5rnzY9PDzg8ICH5LrfVBQwdAdHDHWxyy/4
   UxnB36XiLyi8t/zgNP89ZrRlFBlohtpQpcNXQ9TnV/zlNdOv8SB8Yzy5u
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="406798776"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="406798776"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Apr 2023 10:35:28 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10678"; a="719479602"
X-IronPort-AV: E=Sophos;i="5.98,339,1673942400"; 
   d="scan'208";a="719479602"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 12 Apr 2023 10:35:25 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmeNL-000Xx1-2H;
	Wed, 12 Apr 2023 17:35:19 +0000
Date: Thu, 13 Apr 2023 01:35:13 +0800
From: kernel test robot <lkp@intel.com>
To: Anurag Kumar Vulisha <anurag.kumar.vulisha@xilinx.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Michal Simek <monstr@monstr.eu>,
	Mayank Adesara <mayank.adesara@xilinx.com>
Subject: [xilinx-xlnx:master 6713/14520] drivers/usb/dwc3/core.c:806:5:
 warning: no previous prototype for 'dwc3_core_init'
Message-ID: <202304130156.36JKNvyJ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Anurag,

FYI, the error/warning still remains.

tree:   https://github.com/Xilinx/linux-xlnx master
head:   3a2a9dcee70777a85b3952269c47e6eb65779b78
commit: e061efcfb9c08c69a1aa36ae13dceca7cf397eed [6713/14520] usb: dwc3: Add hibernation support when operating as gadget
config: sparc-randconfig-r033-20230410 (https://download.01.org/0day-ci/archive/20230413/202304130156.36JKNvyJ-lkp@intel.com/config)
compiler: sparc-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/Xilinx/linux-xlnx/commit/e061efcfb9c08c69a1aa36ae13dceca7cf397eed
        git remote add xilinx-xlnx https://github.com/Xilinx/linux-xlnx
        git fetch --no-tags xilinx-xlnx master
        git checkout e061efcfb9c08c69a1aa36ae13dceca7cf397eed
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=sparc SHELL=/bin/bash drivers/usb/dwc3/

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304130156.36JKNvyJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/workqueue.h:9,
                    from include/linux/srcu.h:34,
                    from include/linux/notifier.h:16,
                    from include/linux/memory_hotplug.h:7,
                    from include/linux/mmzone.h:780,
                    from include/linux/gfp.h:6,
                    from include/linux/umh.h:4,
                    from include/linux/kmod.h:22,
                    from include/linux/module.h:13,
                    from drivers/usb/dwc3/core.c:23:
   include/linux/timer.h: In function 'timer_setup':
   include/linux/timer.h:179:30: warning: cast between incompatible function types from 'void (*)(struct timer_list *)' to 'void (*)(long unsigned int)' [-Wcast-function-type]
     179 |         __setup_timer(timer, (TIMER_FUNC_TYPE)callback,
         |                              ^
   include/linux/timer.h:144:39: note: in definition of macro '__setup_timer'
     144 |                 (_timer)->function = (_fn);                             \
         |                                       ^~~
   In file included from arch/sparc/include/asm/openprom.h:15,
                    from arch/sparc/include/asm/device.h:9,
                    from include/linux/device.h:30,
                    from include/linux/platform_device.h:14,
                    from drivers/usb/dwc3/core.c:27:
   include/linux/of.h: In function '__of_changeset_add_update_property_stringv':
   include/linux/of.h:1440:9: warning: function '__of_changeset_add_update_property_stringv' might be a candidate for 'gnu_printf' format attribute [-Wsuggest-attribute=format]
    1440 |         str = kvasprintf(GFP_KERNEL, fmt, vargs);
         |         ^~~
   In file included from drivers/usb/dwc3/core.c:45:
   drivers/usb/dwc3/core.h: At top level:
   drivers/usb/dwc3/core.h:1248:6: warning: no previous prototype for 'dwc3_simple_wakeup_capable' [-Wmissing-prototypes]
    1248 | void dwc3_simple_wakeup_capable(struct device *dev, bool wakeup)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/core.h:1250:6: warning: no previous prototype for 'dwc3_set_simple_data' [-Wmissing-prototypes]
    1250 | void dwc3_set_simple_data(struct dwc3 *dwc)
         |      ^~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/core.h:1252:6: warning: no previous prototype for 'dwc3_simple_check_quirks' [-Wmissing-prototypes]
    1252 | void dwc3_simple_check_quirks(struct dwc3 *dwc)
         |      ^~~~~~~~~~~~~~~~~~~~~~~~
   drivers/usb/dwc3/core.h:1254:5: warning: no previous prototype for 'dwc3_set_usb_core_power' [-Wmissing-prototypes]
    1254 | int dwc3_set_usb_core_power(struct dwc3 *dwc, bool on)
         |     ^~~~~~~~~~~~~~~~~~~~~~~
>> drivers/usb/dwc3/core.c:806:5: warning: no previous prototype for 'dwc3_core_init' [-Wmissing-prototypes]
     806 | int dwc3_core_init(struct dwc3 *dwc)
         |     ^~~~~~~~~~~~~~
   drivers/usb/dwc3/core.h: In function 'dwc3_set_usb_core_power':
   drivers/usb/dwc3/core.h:1255:5: warning: control reaches end of non-void function [-Wreturn-type]
    1255 | { ; }
         |     ^


vim +/dwc3_core_init +806 drivers/usb/dwc3/core.c

   799	
   800	/**
   801	 * dwc3_core_init - Low-level initialization of DWC3 Core
   802	 * @dwc: Pointer to our controller context structure
   803	 *
   804	 * Returns 0 on success otherwise negative errno.
   805	 */
 > 806	int dwc3_core_init(struct dwc3 *dwc)
   807	{
   808		u32			reg;
   809		int			ret;
   810	
   811		if (!dwc3_core_is_valid(dwc)) {
   812			dev_err(dwc->dev, "this is not a DesignWare USB3 DRD Core\n");
   813			ret = -ENODEV;
   814			goto err0;
   815		}
   816	
   817		/*
   818		 * Write Linux Version Code to our GUID register so it's easy to figure
   819		 * out which kernel version a bug was found.
   820		 */
   821		dwc3_writel(dwc->regs, DWC3_GUID, LINUX_VERSION_CODE);
   822	
   823		/* Handle USB2.0-only core configuration */
   824		if (DWC3_GHWPARAMS3_SSPHY_IFC(dwc->hwparams.hwparams3) ==
   825				DWC3_GHWPARAMS3_SSPHY_IFC_DIS) {
   826			if (dwc->maximum_speed == USB_SPEED_SUPER)
   827				dwc->maximum_speed = USB_SPEED_HIGH;
   828		}
   829	
   830		ret = dwc3_core_get_phy(dwc);
   831		if (ret)
   832			goto err0;
   833	
   834		ret = dwc3_core_soft_reset(dwc);
   835		if (ret)
   836			goto err0;
   837	
   838		ret = dwc3_config_soc_bus(dwc);
   839		if (ret)
   840			goto err0;
   841	
   842		ret = dwc3_phy_setup(dwc);
   843		if (ret)
   844			goto err0;
   845	
   846		dwc3_core_setup_global_control(dwc);
   847		dwc3_core_num_eps(dwc);
   848	
   849		if (dwc->scratchbuf == NULL) {
   850			ret = dwc3_alloc_scratch_buffers(dwc);
   851			if (ret) {
   852				dev_err(dwc->dev,
   853					"Not enough memory for scratch buffers\n");
   854				goto err1;
   855			}
   856		}
   857	
   858		ret = dwc3_setup_scratch_buffers(dwc);
   859		if (ret) {
   860			dev_err(dwc->dev, "Failed to setup scratch buffers: %d\n", ret);
   861			goto err1;
   862		}
   863	
   864		/* Adjust Frame Length */
   865		dwc3_frame_length_adjustment(dwc);
   866	
   867		usb_phy_set_suspend(dwc->usb2_phy, 0);
   868		usb_phy_set_suspend(dwc->usb3_phy, 0);
   869		ret = phy_power_on(dwc->usb2_generic_phy);
   870		if (ret < 0)
   871			goto err2;
   872	
   873		ret = phy_power_on(dwc->usb3_generic_phy);
   874		if (ret < 0)
   875			goto err3;
   876	
   877		ret = dwc3_event_buffers_setup(dwc);
   878		if (ret) {
   879			dev_err(dwc->dev, "failed to setup event buffers\n");
   880			goto err4;
   881		}
   882	
   883		/*
   884		 * ENDXFER polling is available on version 3.10a and later of
   885		 * the DWC_usb3 controller. It is NOT available in the
   886		 * DWC_usb31 controller.
   887		 */
   888		if (!dwc3_is_usb31(dwc) && dwc->revision >= DWC3_REVISION_310A) {
   889			reg = dwc3_readl(dwc->regs, DWC3_GUCTL2);
   890			reg |= DWC3_GUCTL2_RST_ACTBITLATER;
   891			dwc3_writel(dwc->regs, DWC3_GUCTL2, reg);
   892		}
   893	
   894		/* When configured in HOST mode, after issuing U3/L2 exit controller
   895		 * fails to send proper CRC checksum in CRC5 feild. Because of this
   896		 * behaviour Transaction Error is generated, resulting in reset and
   897		 * re-enumeration of usb device attached. Enabling bit 10 of GUCTL1
   898		 * will correct this problem
   899		 */
   900		if (dwc->enable_guctl1_resume_quirk) {
   901			reg = dwc3_readl(dwc->regs, DWC3_GUCTL1);
   902			reg |= DWC3_GUCTL1_RESUME_QUIRK;
   903			dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
   904		}
   905	
   906		/* SNPS controller when configureed in HOST mode maintains Inter Packet
   907		 * Delay (IPD) of ~380ns which works with most of the super-speed hubs
   908		 * except VIA-LAB hubs. When IPD is ~380ns HOST controller fails to
   909		 * enumerate FS/LS devices when connected behind VIA-LAB hubs.
   910		 * Enabling bit 9 of GUCTL1 enables the workaround in HW to reduce the
   911		 * ULPI clock latency by 1 cycle, thus reducing the IPD (~360ns) and
   912		 * making controller enumerate FS/LS devices connected behind VIA-LAB.
   913		 */
   914		if (dwc->enable_guctl1_ipd_quirk) {
   915			reg = dwc3_readl(dwc->regs, DWC3_GUCTL1);
   916			reg |= DWC3_GUCTL1_IPD_QUIRK;
   917			dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
   918		}
   919	
   920		if (dwc->revision >= DWC3_REVISION_250A) {
   921			reg = dwc3_readl(dwc->regs, DWC3_GUCTL1);
   922	
   923			/*
   924			 * Enable hardware control of sending remote wakeup
   925			 * in HS when the device is in the L1 state.
   926			 */
   927			if (dwc->revision >= DWC3_REVISION_290A)
   928				reg |= DWC3_GUCTL1_DEV_L1_EXIT_BY_HW;
   929	
   930			if (dwc->dis_tx_ipgap_linecheck_quirk)
   931				reg |= DWC3_GUCTL1_TX_IPGAP_LINECHECK_DIS;
   932	
   933			dwc3_writel(dwc->regs, DWC3_GUCTL1, reg);
   934		}
   935	
   936		return 0;
   937	
   938	err4:
   939		phy_power_off(dwc->usb3_generic_phy);
   940	
   941	err3:
   942		phy_power_off(dwc->usb2_generic_phy);
   943	
   944	err2:
   945		usb_phy_set_suspend(dwc->usb2_phy, 1);
   946		usb_phy_set_suspend(dwc->usb3_phy, 1);
   947	
   948	err1:
   949		usb_phy_shutdown(dwc->usb2_phy);
   950		usb_phy_shutdown(dwc->usb3_phy);
   951		phy_exit(dwc->usb2_generic_phy);
   952		phy_exit(dwc->usb3_generic_phy);
   953	
   954	err0:
   955		return ret;
   956	}
   957	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
