Content-Type: multipart/mixed; boundary="===============8744139794222162925=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: clk-plldig.c:undefined reference to `devm_platform_ioremap_resource'
Date: Sun, 30 May 2021 05:26:59 +0800
Message-ID: <202105300505.cRUUlfI4-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8744139794222162925==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   df8c66c4cfb91f2372d138b9b714f6df6f506966
commit: bbd7ffdbef6888459f301c5889f3b14ada38b913 clk: Allow the common clk =
framework to be selectable
date:   1 year, 1 month ago
config: s390-randconfig-r014-20210530 (attached as .config)
compiler: s390-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dbbd7ffdbef6888459f301c5889f3b14ada38b913
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout bbd7ffdbef6888459f301c5889f3b14ada38b913
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Ds390 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   s390-linux-ld: drivers/irqchip/irq-renesas-irqc.o: in function `irqc_pro=
be':
   irq-renesas-irqc.c:(.text+0x32a): undefined reference to `devm_platform_=
ioremap_resource'
   s390-linux-ld: drivers/irqchip/irq-renesas-rza1.o: in function `rza1_irq=
c_probe':
   irq-renesas-rza1.c:(.text+0xca): undefined reference to `devm_platform_i=
oremap_resource'
   s390-linux-ld: drivers/irqchip/irq-imx-irqsteer.o: in function `imx_irqs=
teer_probe':
   irq-imx-irqsteer.c:(.text+0x11a): undefined reference to `devm_platform_=
ioremap_resource'
   s390-linux-ld: drivers/irqchip/irq-imx-intmux.o: in function `imx_intmux=
_probe':
   irq-imx-intmux.c:(.text+0x8a): undefined reference to `devm_platform_ior=
emap_resource'
   s390-linux-ld: drivers/phy/hisilicon/phy-hisi-inno-usb2.o: in function `=
hisi_inno_phy_probe':
   phy-hisi-inno-usb2.c:(.text+0x4a): undefined reference to `devm_platform=
_ioremap_resource'
   s390-linux-ld: drivers/phy/marvell/phy-mmp3-usb.o: in function `mmp3_usb=
_phy_probe':
   phy-mmp3-usb.c:(.text+0x60): undefined reference to `devm_ioremap_resour=
ce'
   s390-linux-ld: drivers/pinctrl/pxa/pinctrl-pxa27x.o: in function `pxa27x=
_pinctrl_probe':
   pinctrl-pxa27x.c:(.text+0x90): undefined reference to `devm_platform_ior=
emap_resource'
   s390-linux-ld: pinctrl-pxa27x.c:(.text+0xae): undefined reference to `de=
vm_platform_ioremap_resource'
   s390-linux-ld: pinctrl-pxa27x.c:(.text+0xcc): undefined reference to `de=
vm_platform_ioremap_resource'
   s390-linux-ld: pinctrl-pxa27x.c:(.text+0xee): undefined reference to `de=
vm_platform_ioremap_resource'
   s390-linux-ld: drivers/pinctrl/sh-pfc/core.o: in function `sh_pfc_probe':
   core.c:(.text+0x2de): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: drivers/pwm/pwm-berlin.o: in function `berlin_pwm_probe':
   pwm-berlin.c:(.text+0x38c): undefined reference to `devm_ioremap_resourc=
e'
   s390-linux-ld: drivers/pwm/pwm-imx1.o: in function `pwm_imx1_probe':
   pwm-imx1.c:(.text+0x2ac): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: drivers/pwm/pwm-lpc32xx.o: in function `lpc32xx_pwm_probe=
':
   pwm-lpc32xx.c:(.text+0x1a8): undefined reference to `devm_ioremap_resour=
ce'
   s390-linux-ld: drivers/pwm/pwm-mediatek.o: in function `pwm_mediatek_pro=
be':
   pwm-mediatek.c:(.text+0x3e4): undefined reference to `devm_ioremap_resou=
rce'
   s390-linux-ld: drivers/pwm/pwm-pxa.o:pwm-pxa.c:(.text+0x3b0): more undef=
ined references to `devm_ioremap_resource' follow
   s390-linux-ld: drivers/clk/clk-plldig.o: in function `plldig_clk_probe':
>> clk-plldig.c:(.text+0x4e): undefined reference to `devm_platform_ioremap=
_resource'
   s390-linux-ld: drivers/clk/actions/owl-common.o: in function `owl_clk_re=
gmap_init':
   owl-common.c:(.text+0x40): undefined reference to `devm_ioremap_resource'
   s390-linux-ld: drivers/clk/bcm/clk-bcm2835-aux.o: in function `bcm2835_a=
ux_clk_probe':
   clk-bcm2835-aux.c:(.text+0x54): undefined reference to `devm_platform_io=
remap_resource'
   s390-linux-ld: drivers/clk/mediatek/clk-mt6779.o: in function `clk_mt677=
9_top_probe':
   clk-mt6779.c:(.text+0xb2): undefined reference to `devm_platform_ioremap=
_resource'
   s390-linux-ld: drivers/clk/mediatek/clk-mt2701.o: in function `mtk_peric=
fg_init':
   clk-mt2701.c:(.text+0x1e4): undefined reference to `devm_ioremap_resourc=
e'
   s390-linux-ld: drivers/clk/mediatek/clk-mt2701.o: in function `mtk_topck=
gen_init':
   clk-mt2701.c:(.text+0x2b4): undefined reference to `devm_ioremap_resourc=
e'
   s390-linux-ld: drivers/clk/mediatek/clk-mt2712.o: in function `clk_mt271=
2_mcu_probe':
   clk-mt2712.c:(.text+0x32): undefined reference to `devm_platform_ioremap=
_resource'
   s390-linux-ld: drivers/clk/mediatek/clk-mt2712.o: in function `clk_mt271=
2_top_probe':
   clk-mt2712.c:(.text+0x1da): undefined reference to `devm_platform_iorema=
p_resource'
   s390-linux-ld: drivers/clk/mediatek/clk-mt7629.o: in function `mtk_peric=
fg_init':
   clk-mt7629.c:(.text+0xc2): undefined reference to `devm_platform_ioremap=
_resource'
   s390-linux-ld: drivers/clk/mediatek/clk-mt7629.o: in function `mtk_topck=
gen_init':
   clk-mt7629.c:(.text+0x17a): undefined reference to `devm_platform_iorema=
p_resource'
   s390-linux-ld: drivers/clk/sunxi-ng/ccu-sun50i-a64.o: in function `sun50=
i_a64_ccu_probe':
   ccu-sun50i-a64.c:(.text+0x38): undefined reference to `devm_ioremap_reso=
urce'
   s390-linux-ld: drivers/clk/sunxi-ng/ccu-sun50i-h6.o: in function `sun50i=
_h6_ccu_probe':
   ccu-sun50i-h6.c:(.text+0x38): undefined reference to `devm_ioremap_resou=
rce'
   s390-linux-ld: drivers/clk/sunxi-ng/ccu-sun8i-a83t.o: in function `sun8i=
_a83t_ccu_probe':
   ccu-sun8i-a83t.c:(.text+0xa0): undefined reference to `devm_ioremap_reso=
urce'
   s390-linux-ld: drivers/clk/sunxi-ng/ccu-sun9i-a80.o: in function `sun9i_=
a80_ccu_probe':
   ccu-sun9i-a80.c:(.text+0xa0): undefined reference to `devm_ioremap_resou=
rce'
   s390-linux-ld: drivers/clk/sunxi-ng/ccu-sun9i-a80-de.o: in function `sun=
9i_a80_de_clk_probe':
>> ccu-sun9i-a80-de.c:(.text+0x3c): undefined reference to `devm_ioremap_re=
source'
   s390-linux-ld: drivers/clk/sunxi-ng/ccu-sun9i-a80-usb.o:ccu-sun9i-a80-us=
b.c:(.text+0x3c): more undefined references to `devm_ioremap_resource' foll=
ow
   s390-linux-ld: drivers/mfd/syscon.o: in function `syscon_probe':
   syscon.c:(.text+0x1a2): undefined reference to `devm_ioremap'
   s390-linux-ld: drivers/input/keyboard/samsung-keypad.o: in function `sam=
sung_keypad_probe':
>> samsung-keypad.c:(.text+0x330): undefined reference to `devm_ioremap'
   s390-linux-ld: drivers/input/touchscreen/imx6ul_tsc.o: in function `imx6=
ul_tsc_probe':
   imx6ul_tsc.c:(.text+0x844): undefined reference to `devm_platform_iorema=
p_resource'
   s390-linux-ld: imx6ul_tsc.c:(.text+0x880): undefined reference to `devm_=
platform_ioremap_resource'
   s390-linux-ld: drivers/power/reset/brcm-kona-reset.o: in function `kona_=
reset_probe':
   brcm-kona-reset.c:(.text+0xa0): undefined reference to `devm_ioremap_res=
ource'
   s390-linux-ld: drivers/power/reset/ocelot-reset.o: in function `ocelot_r=
eset_probe':
   ocelot-reset.c:(.text+0x12c): undefined reference to `devm_ioremap_resou=
rce'
   s390-linux-ld: drivers/thermal/tango_thermal.o: in function `tango_therm=
al_probe':
   tango_thermal.c:(.text+0x5c): undefined reference to `devm_ioremap_resou=
rce'
   s390-linux-ld: drivers/thermal/zx2967_thermal.o: in function `zx2967_the=
rmal_probe':
   zx2967_thermal.c:(.text+0x164): undefined reference to `devm_ioremap_res=
ource'
   s390-linux-ld: drivers/watchdog/omap_wdt.o: in function `omap_wdt_probe':
   omap_wdt.c:(.text+0x70a): undefined reference to `devm_platform_ioremap_=
resource'
   s390-linux-ld: drivers/watchdog/sama5d4_wdt.o: in function `sama5d4_wdt_=
probe':
   sama5d4_wdt.c:(.text+0x662): undefined reference to `devm_platform_iorem=
ap_resource'
   s390-linux-ld: drivers/watchdog/ep93xx_wdt.o: in function `ep93xx_wdt_pr=
obe':
   ep93xx_wdt.c:(.text+0x182): undefined reference to `devm_platform_iorema=
p_resource'
   s390-linux-ld: drivers/watchdog/davinci_wdt.o: in function `davinci_wdt_=
probe':
   davinci_wdt.c:(.text+0x536): undefined reference to `devm_platform_iorem=
ap_resource'
   s390-linux-ld: drivers/watchdog/ts72xx_wdt.o: in function `ts72xx_wdt_pr=
obe':
   ts72xx_wdt.c:(.text+0x2c2): undefined reference to `devm_platform_iorema=
p_resource'
   s390-linux-ld: drivers/watchdog/ts72xx_wdt.o:ts72xx_wdt.c:(.text+0x2ee):=
 more undefined references to `devm_platform_ioremap_resource' follow
   s390-linux-ld: drivers/watchdog/sc520_wdt.o: in function `sc520_wdt_unlo=
ad':
   sc520_wdt.c:(.exit.text+0x50): undefined reference to `iounmap'
   s390-linux-ld: drivers/watchdog/sc520_wdt.o: in function `sc520_wdt_init=
':
   sc520_wdt.c:(.init.text+0x58): undefined reference to `ioremap'
   s390-linux-ld: sc520_wdt.c:(.init.text+0x106): undefined reference to `i=
ounmap'
   s390-linux-ld: drivers/clocksource/timer-of.o: in function `timer_of_ini=
t':
   timer-of.c:(.init.text+0x168): undefined reference to `iounmap'
   s390-linux-ld: drivers/clocksource/timer-of.o: in function `timer_of_cle=
anup':
   timer-of.c:(.init.text+0x280): undefined reference to `iounmap'
   s390-linux-ld: drivers/clocksource/timer-davinci.o: in function `davinci=
_timer_register':
   timer-davinci.c:(.init.text+0x9a): undefined reference to `ioremap'
   s390-linux-ld: drivers/mailbox/rockchip-mailbox.o: in function `rockchip=
_mbox_probe':
   rockchip-mailbox.c:(.text+0x74e): undefined reference to `devm_ioremap_r=
esource'
   s390-linux-ld: drivers/mailbox/bcm-pdc-mailbox.o: in function `pdc_probe=
':
   bcm-pdc-mailbox.c:(.text+0xeb2): undefined reference to `devm_ioremap_re=
source'
   s390-linux-ld: drivers/mailbox/qcom-apcs-ipc-mailbox.o: in function `qco=
m_apcs_ipc_probe':
   qcom-apcs-ipc-mailbox.c:(.text+0x13c): undefined reference to `devm_iore=
map_resource'
   s390-linux-ld: drivers/mailbox/mtk-cmdq-mailbox.o: in function `cmdq_pro=
be':
   mtk-cmdq-mailbox.c:(.text+0x1278): undefined reference to `devm_ioremap_=
resource'
   s390-linux-ld: drivers/rpmsg/qcom_smd.o: in function `smd_copy_from_fifo=
':
   qcom_smd.c:(.text+0x44c): undefined reference to `__ioread32_copy'
   s390-linux-ld: drivers/rpmsg/qcom_smd.o: in function `smd_copy_to_fifo':
   qcom_smd.c:(.text+0x574): undefined reference to `__iowrite32_copy'
   s390-linux-ld: drivers/counter/ti-eqep.o: in function `ti_eqep_probe':
   ti-eqep.c:(.text+0xaea): undefined reference to `devm_platform_ioremap_r=
esource'

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for MFD_SYSCON
   Depends on HAS_IOMEM
   Selected by
   - POWER_RESET_OCELOT_RESET && POWER_RESET && (MSCC_OCELOT || COMPILE_TEST
   - COMMON_CLK_ASPEED && COMMON_CLK && (ARCH_ASPEED || COMPILE_TEST
   - QCOM_GSBI && (ARCH_QCOM || COMPILE_TEST
   - EXYNOS_CHIPID && SOC_SAMSUNG && (ARCH_EXYNOS || COMPILE_TEST
   - INGENIC_TCU_IRQ && (MIPS || COMPILE_TEST
   - PHY_HI3660_USB && (ARCH_HISI && ARM64 || COMPILE_TEST
   - PHY_HISI_INNO_USB2 && (ARCH_HISI && ARM64 || COMPILE_TEST

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============8744139794222162925==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
fVRFRgEA
--===============8744139794222162925==--

