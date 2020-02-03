Content-Type: multipart/mixed; boundary="===============7965383211152114742=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v1 4/7] device property: fwnode_get_phy_mode: Change API to solve int/unit warnings
Date: Mon, 03 Feb 2020 10:32:47 +0800
Message-ID: <202002031009.jzjqMEFl%lkp@intel.com>
In-Reply-To: <20200131153440.20870-5-calvin.johnson@nxp.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7965383211152114742==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Calvin,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.5]
[cannot apply to driver-core/driver-core-testing net-next/master net/master=
 linus/master sparc-next/master next-20200131]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Calvin-Johnson/ACPI-suppor=
t-for-xgmac_mdio-and-dpaa2-mac-drivers/20200203-070754
base:    d5226fa6dbae0569ee43ecfc08bdcd6770fc4755
config: x86_64-defconfig (attached as .config)
compiler: gcc-7 (Debian 7.5.0-3) 7.5.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

Note: the linux-review/Calvin-Johnson/ACPI-support-for-xgmac_mdio-and-dpaa2=
-mac-drivers/20200203-070754 HEAD 90ffe7e2e45e6e2671084e1169a7bd16c6b3cc8d =
builds fine.
      It only hurts bisectibility.

All error/warnings (new ones prefixed by >>):

          ^~~~~~
          PORT_E
   drivers/gpu/drm/i915/display/intel_display.h:226:7: error: 'PORT_G' unde=
clared (first use in this function); did you mean 'PORT_F'?
     case PORT_G:
          ^~~~~~
          PORT_F
   drivers/gpu/drm/i915/display/intel_display.h:228:7: error: 'PORT_H' unde=
clared (first use in this function); did you mean 'PORT_G'?
     case PORT_H:
          ^~~~~~
          PORT_G
   drivers/gpu/drm/i915/display/intel_display.h:230:7: error: 'PORT_I' unde=
clared (first use in this function); did you mean 'PORT_H'?
     case PORT_I:
          ^~~~~~
          PORT_H
   In file included from drivers/gpu/drm/i915/display/intel_bios.c:34:0:
   drivers/gpu/drm/i915/i915_drv.h: At top level:
   drivers/gpu/drm/i915/i915_drv.h:730:41: error: 'I915_MAX_PORTS' undeclar=
ed here (not in a function); did you mean 'I915_MAX_PHYS'?
     struct ddi_vbt_port_info ddi_port_info[I915_MAX_PORTS];
                                            ^~~~~~~~~~~~~~
                                            I915_MAX_PHYS
   In file included from include/linux/bitops.h:5:0,
                    from include/linux/kernel.h:12,
                    from include/linux/delay.h:22,
                    from include/drm/drm_dp_helper.h:26,
                    from drivers/gpu/drm/i915/display/intel_bios.c:28:
   drivers/gpu/drm/i915/display/intel_bios.c: In function 'parse_dsi_backli=
ght_ports':
   drivers/gpu/drm/i915/display/intel_bios.c:807:36: error: 'PORT_A' undecl=
ared (first use in this function); did you mean 'PORT_DA'?
      dev_priv->vbt.dsi.bl_ports =3D BIT(PORT_A);
                                       ^
   include/linux/bits.h:8:30: note: in definition of macro 'BIT'
    #define BIT(nr)   (UL(1) << (nr))
                                 ^~
   drivers/gpu/drm/i915/display/intel_bios.c:810:36: error: 'PORT_C' undecl=
ared (first use in this function); did you mean 'PORT_A'?
      dev_priv->vbt.dsi.bl_ports =3D BIT(PORT_C);
                                       ^
   include/linux/bits.h:8:30: note: in definition of macro 'BIT'
    #define BIT(nr)   (UL(1) << (nr))
                                 ^~
   drivers/gpu/drm/i915/display/intel_bios.c: In function 'get_port_by_ddc_=
pin':
   drivers/gpu/drm/i915/display/intel_bios.c:1249:14: error: 'PORT_A' undec=
lared (first use in this function); did you mean 'PORT_DA'?
     for (port =3D PORT_A; port < I915_MAX_PORTS; port++) {
                 ^~~~~~
                 PORT_DA
   drivers/gpu/drm/i915/display/intel_bios.c: In function 'get_port_by_aux_=
ch':
   drivers/gpu/drm/i915/display/intel_bios.c:1300:14: error: 'PORT_A' undec=
lared (first use in this function); did you mean 'PORT_DA'?
     for (port =3D PORT_A; port < I915_MAX_PORTS; port++) {
                 ^~~~~~
                 PORT_DA
   drivers/gpu/drm/i915/display/intel_bios.c: In function 'dvo_port_to_port=
':
   drivers/gpu/drm/i915/display/intel_bios.c:1396:4: error: 'PORT_A' undecl=
ared (first use in this function); did you mean 'PORT_DA'?
      [PORT_A] =3D { DVO_PORT_HDMIA, DVO_PORT_DPA, -1},
       ^~~~~~
       PORT_DA
   drivers/gpu/drm/i915/display/intel_bios.c:1396:4: error: array index in =
initializer not of integer type
   drivers/gpu/drm/i915/display/intel_bios.c:1396:4: note: (near initializa=
tion for 'dvo_ports')
   drivers/gpu/drm/i915/display/intel_bios.c:1397:4: error: 'PORT_B' undecl=
ared (first use in this function); did you mean 'PORT_A'?
      [PORT_B] =3D { DVO_PORT_HDMIB, DVO_PORT_DPB, -1},
       ^~~~~~
       PORT_A
   drivers/gpu/drm/i915/display/intel_bios.c:1397:4: error: array index in =
initializer not of integer type
   drivers/gpu/drm/i915/display/intel_bios.c:1397:4: note: (near initializa=
tion for 'dvo_ports')
   drivers/gpu/drm/i915/display/intel_bios.c:1398:4: error: 'PORT_C' undecl=
ared (first use in this function); did you mean 'PORT_B'?
      [PORT_C] =3D { DVO_PORT_HDMIC, DVO_PORT_DPC, -1},
       ^~~~~~
       PORT_B
   drivers/gpu/drm/i915/display/intel_bios.c:1398:4: error: array index in =
initializer not of integer type
   drivers/gpu/drm/i915/display/intel_bios.c:1398:4: note: (near initializa=
tion for 'dvo_ports')
   drivers/gpu/drm/i915/display/intel_bios.c:1399:4: error: 'PORT_D' undecl=
ared (first use in this function); did you mean 'PORT_C'?
      [PORT_D] =3D { DVO_PORT_HDMID, DVO_PORT_DPD, -1},
       ^~~~~~
       PORT_C
   drivers/gpu/drm/i915/display/intel_bios.c:1399:4: error: array index in =
initializer not of integer type
   drivers/gpu/drm/i915/display/intel_bios.c:1399:4: note: (near initializa=
tion for 'dvo_ports')
   drivers/gpu/drm/i915/display/intel_bios.c:1400:4: error: 'PORT_E' undecl=
ared (first use in this function); did you mean 'PORT_D'?
      [PORT_E] =3D { DVO_PORT_CRT, DVO_PORT_HDMIE, DVO_PORT_DPE},
       ^~~~~~
       PORT_D
   drivers/gpu/drm/i915/display/intel_bios.c:1400:4: error: array index in =
initializer not of integer type
   drivers/gpu/drm/i915/display/intel_bios.c:1400:4: note: (near initializa=
tion for 'dvo_ports')
   drivers/gpu/drm/i915/display/intel_bios.c:1401:4: error: 'PORT_F' undecl=
ared (first use in this function); did you mean 'PORT_E'?
      [PORT_F] =3D { DVO_PORT_HDMIF, DVO_PORT_DPF, -1},
       ^~~~~~
       PORT_E
   drivers/gpu/drm/i915/display/intel_bios.c:1401:4: error: array index in =
initializer not of integer type
   drivers/gpu/drm/i915/display/intel_bios.c:1401:4: note: (near initializa=
tion for 'dvo_ports')
   drivers/gpu/drm/i915/display/intel_bios.c:1402:4: error: 'PORT_G' undecl=
ared (first use in this function); did you mean 'PORT_F'?
      [PORT_G] =3D { DVO_PORT_HDMIG, DVO_PORT_DPG, -1},
       ^~~~~~
       PORT_F
   drivers/gpu/drm/i915/display/intel_bios.c:1402:4: error: array index in =
initializer not of integer type
   drivers/gpu/drm/i915/display/intel_bios.c:1402:4: note: (near initializa=
tion for 'dvo_ports')
   drivers/gpu/drm/i915/display/intel_bios.c: In function 'parse_ddi_port':
   drivers/gpu/drm/i915/display/intel_bios.c:1446:14: error: 'PORT_A' undec=
lared (first use in this function); did you mean 'PORT_DA'?
     if (port =3D=3D PORT_A && is_dvi) {
                 ^~~~~~
                 PORT_DA
   drivers/gpu/drm/i915/display/intel_bios.c:1472:24: error: 'PORT_E' undec=
lared (first use in this function); did you mean 'PORT_A'?
     if (is_crt && port !=3D PORT_E)
                           ^~~~~~
                           PORT_A
>> drivers/gpu/drm/i915/display/intel_bios.c:1482:25: error: 'PORT_B' undec=
lared (first use in this function); did you mean 'PORT_E'?
     if (is_edp && (port =3D=3D PORT_B || port =3D=3D PORT_C || port =3D=3D=
 PORT_E))
                            ^~~~~~
                            PORT_E
   drivers/gpu/drm/i915/display/intel_bios.c:1482:43: error: 'PORT_C' undec=
lared (first use in this function); did you mean 'PORT_B'?
     if (is_edp && (port =3D=3D PORT_B || port =3D=3D PORT_C || port =3D=3D=
 PORT_E))
                                              ^~~~~~
                                              PORT_B
   drivers/gpu/drm/i915/display/intel_bios.c: In function 'init_vbt_default=
s':
   drivers/gpu/drm/i915/display/intel_bios.c:1725:14: error: 'PORT_A' undec=
lared (first use in this function); did you mean 'PORT_DA'?
     for (port =3D PORT_A; port < I915_MAX_PORTS; port++) {
                 ^~~~~~
                 PORT_DA
   drivers/gpu/drm/i915/display/intel_bios.c: In function 'init_vbt_missing=
_defaults':
   drivers/gpu/drm/i915/display/intel_bios.c:1739:14: error: 'PORT_A' undec=
lared (first use in this function); did you mean 'PORT_DA'?
     for (port =3D PORT_A; port < I915_MAX_PORTS; port++) {
                 ^~~~~~
                 PORT_DA
   drivers/gpu/drm/i915/display/intel_bios.c:1751:51: error: 'PORT_E' undec=
lared (first use in this function); did you mean 'PORT_A'?
      info->supports_dvi =3D (port !=3D PORT_A && port !=3D PORT_E);
                                                      ^~~~~~
                                                      PORT_A
   drivers/gpu/drm/i915/display/intel_bios.c: In function 'intel_bios_is_po=
rt_present':
   drivers/gpu/drm/i915/display/intel_bios.c:2027:4: error: 'PORT_B' undecl=
ared (first use in this function); did you mean 'PORT_BNC'?
      [PORT_B] =3D { DVO_PORT_DPB, DVO_PORT_HDMIB, },
       ^~~~~~
       PORT_BNC
   drivers/gpu/drm/i915/display/intel_bios.c:2027:4: error: array index in =
initializer not of integer type
   drivers/gpu/drm/i915/display/intel_bios.c:2027:4: note: (near initializa=
tion for 'port_mapping')
   drivers/gpu/drm/i915/display/intel_bios.c:2028:4: error: 'PORT_C' undecl=
ared (first use in this function); did you mean 'PORT_B'?
      [PORT_C] =3D { DVO_PORT_DPC, DVO_PORT_HDMIC, },
       ^~~~~~
       PORT_B
   drivers/gpu/drm/i915/display/intel_bios.c:2028:4: error: array index in =
initializer not of integer type
   drivers/gpu/drm/i915/display/intel_bios.c:2028:4: note: (near initializa=
tion for 'port_mapping')
   drivers/gpu/drm/i915/display/intel_bios.c:2029:4: error: 'PORT_D' undecl=
ared (first use in this function); did you mean 'PORT_C'?
      [PORT_D] =3D { DVO_PORT_DPD, DVO_PORT_HDMID, },
       ^~~~~~
       PORT_C
   drivers/gpu/drm/i915/display/intel_bios.c:2029:4: error: array index in =
initializer not of integer type
   drivers/gpu/drm/i915/display/intel_bios.c:2029:4: note: (near initializa=
tion for 'port_mapping')
   drivers/gpu/drm/i915/display/intel_bios.c:2030:4: error: 'PORT_E' undecl=
ared (first use in this function); did you mean 'PORT_D'?
      [PORT_E] =3D { DVO_PORT_DPE, DVO_PORT_HDMIE, },
       ^~~~~~
       PORT_D
   drivers/gpu/drm/i915/display/intel_bios.c:2030:4: error: array index in =
initializer not of integer type
   drivers/gpu/drm/i915/display/intel_bios.c:2030:4: note: (near initializa=
tion for 'port_mapping')
   drivers/gpu/drm/i915/display/intel_bios.c:2031:4: error: 'PORT_F' undecl=
ared (first use in this function); did you mean 'PORT_E'?
      [PORT_F] =3D { DVO_PORT_DPF, DVO_PORT_HDMIF, },
       ^~~~~~
       PORT_E
   drivers/gpu/drm/i915/display/intel_bios.c:2031:4: error: array index in =
initializer not of integer type
   drivers/gpu/drm/i915/display/intel_bios.c:2031:4: note: (near initializa=
tion for 'port_mapping')
   In file included from arch/x86/include/asm/bug.h:83:0,
                    from include/linux/bug.h:5,
                    from include/linux/cpumask.h:14,
                    from arch/x86/include/asm/cpumask.h:5,
                    from arch/x86/include/asm/msr.h:11,
                    from arch/x86/include/asm/processor.h:22,
                    from include/linux/mutex.h:19,
                    from include/linux/kernfs.h:12,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/of.h:17,
                    from include/linux/irqdomain.h:35,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from include/drm/drm_dp_helper.h:27,
                    from drivers/gpu/drm/i915/display/intel_bios.c:28:
   drivers/gpu/drm/i915/display/intel_bios.c:2045:22: error: 'PORT_A' undec=
lared (first use in this function); did you mean 'PORT_F'?
     if (WARN_ON(port =3D=3D PORT_A) || port >=3D ARRAY_SIZE(port_mapping))
                         ^
   include/asm-generic/bug.h:122:25: note: in definition of macro 'WARN'
     int __ret_warn_on =3D !!(condition);    \
                            ^~~~~~~~~
   drivers/gpu/drm/i915/display/intel_bios.c:2045:6: note: in expansion of =
macro 'WARN_ON'
     if (WARN_ON(port =3D=3D PORT_A) || port >=3D ARRAY_SIZE(port_mapping))
         ^~~~~~~
   drivers/gpu/drm/i915/display/intel_bios.c: In function 'intel_bios_is_po=
rt_edp':
   drivers/gpu/drm/i915/display/intel_bios.c:2075:4: error: 'PORT_B' undecl=
ared (first use in this function); did you mean 'PORT_BNC'?
      [PORT_B] =3D DVO_PORT_DPB,
       ^~~~~~
       PORT_BNC
   drivers/gpu/drm/i915/display/intel_bios.c:2075:4: error: array index in =
initializer not of integer type
   drivers/gpu/drm/i915/display/intel_bios.c:2075:4: note: (near initializa=
tion for 'port_mapping')
   drivers/gpu/drm/i915/display/intel_bios.c:2076:4: error: 'PORT_C' undecl=
ared (first use in this function); did you mean 'PORT_B'?
      [PORT_C] =3D DVO_PORT_DPC,
       ^~~~~~
       PORT_B
   drivers/gpu/drm/i915/display/intel_bios.c:2076:4: error: array index in =
initializer not of integer type
   drivers/gpu/drm/i915/display/intel_bios.c:2076:4: note: (near initializa=
tion for 'port_mapping')
   drivers/gpu/drm/i915/display/intel_bios.c:2077:4: error: 'PORT_D' undecl=
ared (first use in this function); did you mean 'PORT_C'?
      [PORT_D] =3D DVO_PORT_DPD,
       ^~~~~~
       PORT_C
   drivers/gpu/drm/i915/display/intel_bios.c:2077:4: error: array index in =
initializer not of integer type
   drivers/gpu/drm/i915/display/intel_bios.c:2077:4: note: (near initializa=
tion for 'port_mapping')
   drivers/gpu/drm/i915/display/intel_bios.c:2078:4: error: 'PORT_E' undecl=
ared (first use in this function); did you mean 'PORT_D'?
      [PORT_E] =3D DVO_PORT_DPE,
       ^~~~~~
       PORT_D
--
   drivers/gpu/drm/i915/display/intel_display.c: In function 'intel_port_to=
_phy':
   drivers/gpu/drm/i915/display/intel_display.c:6803:38: error: 'PORT_D' un=
declared (first use in this function); did you mean 'PORT_DA'?
     if (IS_ELKHARTLAKE(i915) && port =3D=3D PORT_D)
                                         ^~~~~~
                                         PORT_DA
   drivers/gpu/drm/i915/display/intel_display.c: In function 'intel_port_to=
_tc':
   drivers/gpu/drm/i915/display/intel_display.c:6815:17: error: 'PORT_D' un=
declared (first use in this function); did you mean 'PORT_DA'?
      return port - PORT_D;
                    ^~~~~~
                    PORT_DA
   drivers/gpu/drm/i915/display/intel_display.c:6817:16: error: 'PORT_C' un=
declared (first use in this function); did you mean 'PORT_D'?
     return port - PORT_C;
                   ^~~~~~
                   PORT_D
   drivers/gpu/drm/i915/display/intel_display.c: In function 'intel_port_to=
_power_domain':
   drivers/gpu/drm/i915/display/intel_display.c:6823:7: error: 'PORT_A' und=
eclared (first use in this function); did you mean 'PORT_DA'?
     case PORT_A:
          ^~~~~~
          PORT_DA
   drivers/gpu/drm/i915/display/intel_display.c:6825:7: error: 'PORT_B' und=
eclared (first use in this function); did you mean 'PORT_A'?
     case PORT_B:
          ^~~~~~
          PORT_A
   drivers/gpu/drm/i915/display/intel_display.c:6827:7: error: 'PORT_C' und=
eclared (first use in this function); did you mean 'PORT_B'?
     case PORT_C:
          ^~~~~~
          PORT_B
   drivers/gpu/drm/i915/display/intel_display.c:6829:7: error: 'PORT_D' und=
eclared (first use in this function); did you mean 'PORT_C'?
     case PORT_D:
          ^~~~~~
          PORT_C
   drivers/gpu/drm/i915/display/intel_display.c:6831:7: error: 'PORT_E' und=
eclared (first use in this function); did you mean 'PORT_D'?
     case PORT_E:
          ^~~~~~
          PORT_D
   drivers/gpu/drm/i915/display/intel_display.c:6833:7: error: 'PORT_F' und=
eclared (first use in this function); did you mean 'PORT_E'?
     case PORT_F:
          ^~~~~~
          PORT_E
   drivers/gpu/drm/i915/display/intel_display.c:6835:7: error: 'PORT_G' und=
eclared (first use in this function); did you mean 'PORT_F'?
     case PORT_G:
          ^~~~~~
          PORT_F
   drivers/gpu/drm/i915/display/intel_display.c: In function 'ironlake_init=
_pch_refclk':
   drivers/gpu/drm/i915/display/intel_display.c:9020:25: error: 'PORT_A' un=
declared (first use in this function); did you mean 'PORT_DA'?
       if (encoder->port =3D=3D PORT_A)
                            ^~~~~~
                            PORT_DA
   In file included from drivers/gpu/drm/i915/display/intel_crt.h:9:0,
                    from drivers/gpu/drm/i915/display/intel_display.c:46:
   drivers/gpu/drm/i915/display/intel_display.c: In function 'cannonlake_ge=
t_ddi_pll':
   drivers/gpu/drm/i915/i915_reg.h:10005:59: error: 'PORT_F' undeclared (fi=
rst use in this function); did you mean 'PORT_DA'?
    #define  DPCLKA_CFGCR0_DDI_CLK_SEL_SHIFT(port) ((port) =3D=3D PORT_F ? =
21 : \
                                                              ^
   drivers/gpu/drm/i915/i915_reg.h:10007:53: note: in expansion of macro 'D=
PCLKA_CFGCR0_DDI_CLK_SEL_SHIFT'
    #define  DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(port) (3 << DPCLKA_CFGCR0_DDI_C=
LK_SEL_SHIFT(port))
                                                        ^~~~~~~~~~~~~~~~~~~=
~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:10217:36: note: in expansio=
n of macro 'DPCLKA_CFGCR0_DDI_CLK_SEL_MASK'
     temp =3D I915_READ(DPCLKA_CFGCR0) & DPCLKA_CFGCR0_DDI_CLK_SEL_MASK(por=
t);
                                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c: In function 'bxt_get_ddi_p=
ll':
   drivers/gpu/drm/i915/display/intel_display.c:10270:7: error: 'PORT_A' un=
declared (first use in this function); did you mean 'PORT_DA'?
     case PORT_A:
          ^~~~~~
          PORT_DA
   drivers/gpu/drm/i915/display/intel_display.c:10273:7: error: 'PORT_B' un=
declared (first use in this function); did you mean 'PORT_A'?
     case PORT_B:
          ^~~~~~
          PORT_A
   drivers/gpu/drm/i915/display/intel_display.c:10276:7: error: 'PORT_C' un=
declared (first use in this function); did you mean 'PORT_B'?
     case PORT_C:
          ^~~~~~
          PORT_B
   In file included from drivers/gpu/drm/i915/display/intel_ddi.h:11:0,
                    from drivers/gpu/drm/i915/display/intel_display.c:47:
   drivers/gpu/drm/i915/display/intel_display.c: In function 'bxt_get_dsi_t=
ranscoder_state':
   drivers/gpu/drm/i915/display/intel_display.h:336:18: error: 'PORT_A' und=
eclared (first use in this function); did you mean 'PORT_DA'?
     for ((__port) =3D PORT_A; (__port) < I915_MAX_PORTS; (__port)++) \
                     ^
   drivers/gpu/drm/i915/display/intel_display.c:10448:2: note: in expansion=
 of macro 'for_each_port_masked'
     for_each_port_masked(port, BIT(PORT_A) | BIT(PORT_C)) {
     ^~~~~~~~~~~~~~~~~~~~
   In file included from include/drm/drm_connector.h:31:0,
                    from include/drm/drm_modes.h:33,
                    from include/drm/drm_crtc.h:40,
                    from include/drm/drm_atomic.h:31,
                    from drivers/gpu/drm/i915/display/intel_display.c:35:
   drivers/gpu/drm/i915/display/intel_display.c:10448:47: error: 'PORT_C' u=
ndeclared (first use in this function); did you mean 'PORT_A'?
     for_each_port_masked(port, BIT(PORT_A) | BIT(PORT_C)) {
                                                  ^
   include/drm/drm_util.h:63:38: note: in definition of macro 'for_each_if'
    #define for_each_if(condition) if (!(condition)) {} else
                                         ^~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:10448:2: note: in expansion=
 of macro 'for_each_port_masked'
     for_each_port_masked(port, BIT(PORT_A) | BIT(PORT_C)) {
     ^~~~~~~~~~~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:10448:43: note: in expansio=
n of macro 'BIT'
     for_each_port_masked(port, BIT(PORT_A) | BIT(PORT_C)) {
                                              ^~~
   drivers/gpu/drm/i915/display/intel_display.c: In function 'haswell_get_d=
di_port_state':
>> drivers/gpu/drm/i915/display/intel_display.c:10528:15: error: 'PORT_E' u=
ndeclared (first use in this function); did you mean 'PORT_DA'?
         (port =3D=3D PORT_E) && I915_READ(LPT_TRANSCONF) & TRANS_ENABLE) {
                  ^~~~~~
                  PORT_DA
   In file included from drivers/gpu/drm/i915/display/intel_display_types.h=
:46:0,
                    from drivers/gpu/drm/i915/display/intel_dsi.h:30,
                    from drivers/gpu/drm/i915/display/intel_display.c:49:
   drivers/gpu/drm/i915/display/intel_display.c: In function 'intel_ddi_crt=
_present':
   drivers/gpu/drm/i915/display/intel_display.c:15884:28: error: 'PORT_A' u=
ndeclared (first use in this function); did you mean 'PORT_DA'?
     if (I915_READ(DDI_BUF_CTL(PORT_A)) & DDI_A_4_LANES)
                               ^
   drivers/gpu/drm/i915/i915_drv.h:1981:45: note: in definition of macro '_=
_I915_REG_OP'
     intel_uncore_##op__(&(dev_priv__)->uncore, __VA_ARGS__)
                                                ^~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:15884:6: note: in expansion=
 of macro 'I915_READ'
     if (I915_READ(DDI_BUF_CTL(PORT_A)) & DDI_A_4_LANES)
         ^~~~~~~~~
   drivers/gpu/drm/i915/i915_reg.h:237:33: note: in expansion of macro '_MM=
IO'
    #define _MMIO_PORT(port, a, b)  _MMIO(_PORT(port, a, b))
                                    ^~~~~
   drivers/gpu/drm/i915/i915_reg.h:231:28: note: in expansion of macro '_PI=
CK_EVEN'
    #define _PORT(port, a, b)  _PICK_EVEN(port, a, b)
                               ^~~~~~~~~~
   drivers/gpu/drm/i915/i915_reg.h:237:39: note: in expansion of macro '_PO=
RT'
    #define _MMIO_PORT(port, a, b)  _MMIO(_PORT(port, a, b))
                                          ^~~~~
   drivers/gpu/drm/i915/i915_reg.h:9745:27: note: in expansion of macro '_M=
MIO_PORT'
    #define DDI_BUF_CTL(port) _MMIO_PORT(port, _DDI_BUF_CTL_A, _DDI_BUF_CTL=
_B)
                              ^~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c:15884:16: note: in expansio=
n of macro 'DDI_BUF_CTL'
     if (I915_READ(DDI_BUF_CTL(PORT_A)) & DDI_A_4_LANES)
                   ^~~~~~~~~~~
   drivers/gpu/drm/i915/display/intel_display.c: In function 'intel_setup_o=
utputs':
   drivers/gpu/drm/i915/display/intel_display.c:15940:28: error: 'PORT_A' u=
ndeclared (first use in this function); did you mean 'PORT_DA'?
      intel_ddi_init(dev_priv, PORT_A);
                               ^~~~~~
                               PORT_DA
   drivers/gpu/drm/i915/display/intel_display.c:15941:28: error: 'PORT_B' u=
ndeclared (first use in this function); did you mean 'PORT_A'?
      intel_ddi_init(dev_priv, PORT_B);
                               ^~~~~~
                               PORT_A
   drivers/gpu/drm/i915/display/intel_display.c:15942:28: error: 'PORT_D' u=
ndeclared (first use in this function); did you mean 'PORT_B'?
      intel_ddi_init(dev_priv, PORT_D);
                               ^~~~~~
                               PORT_B
   drivers/gpu/drm/i915/display/intel_display.c:15943:28: error: 'PORT_E' u=
ndeclared (first use in this function); did you mean 'PORT_D'?
      intel_ddi_init(dev_priv, PORT_E);
                               ^~~~~~
                               PORT_D
   drivers/gpu/drm/i915/display/intel_display.c:15944:28: error: 'PORT_F' u=
ndeclared (first use in this function); did you mean 'PORT_E'?
      intel_ddi_init(dev_priv, PORT_F);
                               ^~~~~~
                               PORT_E
   drivers/gpu/drm/i915/display/intel_display.c:15945:28: error: 'PORT_G' u=
ndeclared (first use in this function); did you mean 'PORT_F'?
      intel_ddi_init(dev_priv, PORT_G);
                               ^~~~~~
                               PORT_F
   drivers/gpu/drm/i915/display/intel_display.c:15946:28: error: 'PORT_H' u=
ndeclared (first use in this function); did you mean 'PORT_G'?
      intel_ddi_init(dev_priv, PORT_H);
                               ^~~~~~
                               PORT_G
   drivers/gpu/drm/i915/display/intel_display.c:15947:28: error: 'PORT_I' u=
ndeclared (first use in this function); did you mean 'PORT_H'?
      intel_ddi_init(dev_priv, PORT_I);
                               ^~~~~~
                               PORT_H
   drivers/gpu/drm/i915/display/intel_display.c:15952:28: error: 'PORT_C' u=
ndeclared (first use in this function); did you mean 'PORT_I'?
      intel_ddi_init(dev_priv, PORT_C);
                               ^~~~~~
                               PORT_I
   drivers/gpu/drm/i915/display/intel_display.c: In function 'ibx_sanitize_=
pch_ports':
   drivers/gpu/drm/i915/display/intel_display.c:17557:37: error: 'PORT_B' u=
ndeclared (first use in this function); did you mean 'PORT_BNC'?
     ibx_sanitize_pch_dp_port(dev_priv, PORT_B, PCH_DP_B);
                                        ^~~~~~
                                        PORT_BNC
   drivers/gpu/drm/i915/display/intel_display.c:17558:37: error: 'PORT_C' u=
ndeclared (first use in this function); did you mean 'PORT_B'?
     ibx_sanitize_pch_dp_port(dev_priv, PORT_C, PCH_DP_C);
                                        ^~~~~~
                                        PORT_B
   drivers/gpu/drm/i915/display/intel_display.c:17559:37: error: 'PORT_D' u=
ndeclared (first use in this function); did you mean 'PORT_C'?
     ibx_sanitize_pch_dp_port(dev_priv, PORT_D, PCH_DP_D);
                                        ^~~~~~
                                        PORT_C
   drivers/gpu/drm/i915/display/intel_display.c: In function 'intel_port_to=
_tc':
   drivers/gpu/drm/i915/display/intel_display.c:6818:1: warning: control re=
aches end of non-void function [-Wreturn-type]
    }
    ^
..

vim +1482 drivers/gpu/drm/i915/display/intel_bios.c

b024ab9b2d3aa1 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-03-22 =
 1419  =

b024ab9b2d3aa1 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-03-22 =
 1420  static void parse_ddi_port(struct drm_i915_private *dev_priv,
b024ab9b2d3aa1 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-03-22 =
 1421  			   const struct child_device_config *child,
b024ab9b2d3aa1 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-03-22 =
 1422  			   u8 bdb_version)
b024ab9b2d3aa1 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-03-22 =
 1423  {
b024ab9b2d3aa1 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-03-22 =
 1424  	struct ddi_vbt_port_info *info;
b024ab9b2d3aa1 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-03-22 =
 1425  	bool is_dvi, is_hdmi, is_dp, is_edp, is_crt;
b024ab9b2d3aa1 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-03-22 =
 1426  	enum port port;
b024ab9b2d3aa1 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-03-22 =
 1427  =

b024ab9b2d3aa1 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-03-22 =
 1428  	port =3D dvo_port_to_port(child->dvo_port);
b024ab9b2d3aa1 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-03-22 =
 1429  	if (port =3D=3D PORT_NONE)
6acab15a7b0d27 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1430  		return;
6acab15a7b0d27 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1431  =

b024ab9b2d3aa1 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-03-22 =
 1432  	info =3D &dev_priv->vbt.ddi_port_info[port];
b024ab9b2d3aa1 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-03-22 =
 1433  =

7679f9b8f6ee39 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-05-31 =
 1434  	if (info->child) {
b024ab9b2d3aa1 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-03-22 =
 1435  		DRM_DEBUG_KMS("More than one child device for port %c in VBT, usin=
g the first.\n",
b024ab9b2d3aa1 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-03-22 =
 1436  			      port_name(port));
b024ab9b2d3aa1 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-03-22 =
 1437  		return;
b024ab9b2d3aa1 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-03-22 =
 1438  	}
b024ab9b2d3aa1 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-03-22 =
 1439  =

cc9985893aacc3 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2017-08-24 =
 1440  	is_dvi =3D child->device_type & DEVICE_TYPE_TMDS_DVI_SIGNALING;
cc9985893aacc3 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2017-08-24 =
 1441  	is_dp =3D child->device_type & DEVICE_TYPE_DISPLAYPORT_OUTPUT;
cc9985893aacc3 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2017-08-24 =
 1442  	is_crt =3D child->device_type & DEVICE_TYPE_ANALOG_OUTPUT;
cc9985893aacc3 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2017-08-24 =
 1443  	is_hdmi =3D is_dvi && (child->device_type & DEVICE_TYPE_NOT_HDMI_OU=
TPUT) =3D=3D 0;
cc9985893aacc3 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2017-08-24 =
 1444  	is_edp =3D is_dp && (child->device_type & DEVICE_TYPE_INTERNAL_CONN=
ECTOR);
554d6af50a4012 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1445  =

2ba7d7e0437127 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2017-09-21 =
@1446  	if (port =3D=3D PORT_A && is_dvi) {
2ba7d7e0437127 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2017-09-21 =
 1447  		DRM_DEBUG_KMS("VBT claims port A supports DVI%s, ignoring\n",
2ba7d7e0437127 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2017-09-21 =
 1448  			      is_hdmi ? "/HDMI" : "");
2ba7d7e0437127 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2017-09-21 =
 1449  		is_dvi =3D false;
2ba7d7e0437127 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2017-09-21 =
 1450  		is_hdmi =3D false;
2ba7d7e0437127 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2017-09-21 =
 1451  	}
2ba7d7e0437127 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2017-09-21 =
 1452  =

311a20949f047a drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1453  	info->supports_dvi =3D is_dvi;
311a20949f047a drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1454  	info->supports_hdmi =3D is_hdmi;
311a20949f047a drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1455  	info->supports_dp =3D is_dp;
a98d9c1d7e9bb0 drivers/gpu/drm/i915/intel_bios.c Imre Deak      2016-12-21 =
 1456  	info->supports_edp =3D is_edp;
311a20949f047a drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1457  =

38b3416f3c2f1d drivers/gpu/drm/i915/intel_bios.c Imre Deak      2018-12-14 =
 1458  	if (bdb_version >=3D 195)
38b3416f3c2f1d drivers/gpu/drm/i915/intel_bios.c Imre Deak      2018-12-14 =
 1459  		info->supports_typec_usb =3D child->dp_usb_type_c;
38b3416f3c2f1d drivers/gpu/drm/i915/intel_bios.c Imre Deak      2018-12-14 =
 1460  =

38b3416f3c2f1d drivers/gpu/drm/i915/intel_bios.c Imre Deak      2018-12-14 =
 1461  	if (bdb_version >=3D 209)
38b3416f3c2f1d drivers/gpu/drm/i915/intel_bios.c Imre Deak      2018-12-14 =
 1462  		info->supports_tbt =3D child->tbt;
38b3416f3c2f1d drivers/gpu/drm/i915/intel_bios.c Imre Deak      2018-12-14 =
 1463  =

932cd15431567c drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-05-31 =
 1464  	DRM_DEBUG_KMS("Port %c VBT info: CRT:%d DVI:%d HDMI:%d DP:%d eDP:%d=
 LSPCON:%d USB-Type-C:%d TBT:%d\n",
932cd15431567c drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-05-31 =
 1465  		      port_name(port), is_crt, is_dvi, is_hdmi, is_dp, is_edp,
932cd15431567c drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-05-31 =
 1466  		      HAS_LSPCON(dev_priv) && child->lspcon,
38b3416f3c2f1d drivers/gpu/drm/i915/intel_bios.c Imre Deak      2018-12-14 =
 1467  		      info->supports_typec_usb, info->supports_tbt);
554d6af50a4012 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1468  =

554d6af50a4012 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1469  	if (is_edp && is_dvi)
554d6af50a4012 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1470  		DRM_DEBUG_KMS("Internal DP port %c is TMDS compatible\n",
554d6af50a4012 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1471  			      port_name(port));
554d6af50a4012 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1472  	if (is_crt && port !=3D PORT_E)
554d6af50a4012 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1473  		DRM_DEBUG_KMS("Port %c is analog\n", port_name(port));
554d6af50a4012 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1474  	if (is_crt && (is_dvi || is_dp))
554d6af50a4012 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1475  		DRM_DEBUG_KMS("Analog port %c is also DP or TMDS compatible\n",
554d6af50a4012 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1476  			      port_name(port));
554d6af50a4012 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1477  	if (is_dvi && (port =3D=3D PORT_A || port =3D=3D PORT_E))
9b13494c916dc0 drivers/gpu/drm/i915/intel_bios.c Masanari Iida  2014-08-06 =
 1478  		DRM_DEBUG_KMS("Port %c is TMDS compatible\n", port_name(port));
554d6af50a4012 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1479  	if (!is_dvi && !is_dp && !is_crt)
554d6af50a4012 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1480  		DRM_DEBUG_KMS("Port %c is not DP/TMDS/CRT compatible\n",
554d6af50a4012 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1481  			      port_name(port));
554d6af50a4012 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
@1482  	if (is_edp && (port =3D=3D PORT_B || port =3D=3D PORT_C || port =3D=
=3D PORT_E))
554d6af50a4012 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1483  		DRM_DEBUG_KMS("Port %c is internal DP\n", port_name(port));
6bf19e7c548d46 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1484  =

6bf19e7c548d46 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1485  	if (is_dvi) {
e53a1058395435 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-04-11 =
 1486  		u8 ddc_pin;
e53a1058395435 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-04-11 =
 1487  =

f212bf9abe5de9 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-04-11 =
 1488  		ddc_pin =3D map_ddc_pin(dev_priv, child->ddc_pin);
f212bf9abe5de9 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-04-11 =
 1489  		if (intel_gmbus_is_valid_pin(dev_priv, ddc_pin)) {
f212bf9abe5de9 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-04-11 =
 1490  			info->alternate_ddc_pin =3D ddc_pin;
9454fa871edf15 drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
016-10-11  1491  			sanitize_ddc_pin(dev_priv, port);
f212bf9abe5de9 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-04-11 =
 1492  		} else {
f212bf9abe5de9 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-04-11 =
 1493  			DRM_DEBUG_KMS("Port %c has invalid DDC pin %d, "
f212bf9abe5de9 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-04-11 =
 1494  				      "sticking to defaults\n",
f212bf9abe5de9 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-04-11 =
 1495  				      port_name(port), ddc_pin);
f212bf9abe5de9 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-04-11 =
 1496  		}
6bf19e7c548d46 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1497  	}
6bf19e7c548d46 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1498  =

6bf19e7c548d46 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1499  	if (is_dp) {
e53a1058395435 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-04-11 =
 1500  		info->alternate_aux_channel =3D child->aux_channel;
9454fa871edf15 drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
016-10-11  1501  =

9454fa871edf15 drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
016-10-11  1502  		sanitize_aux_ch(dev_priv, port);
6bf19e7c548d46 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1503  	}
6bf19e7c548d46 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1504  =

0ead5f81d4200b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2017-09-28 =
 1505  	if (bdb_version >=3D 158) {
6acab15a7b0d27 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1506  		/* The VBT HDMI level shift values match the table we have. */
e53a1058395435 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-04-11 =
 1507  		u8 hdmi_level_shift =3D child->hdmi_level_shifter_value;
6acab15a7b0d27 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1508  		DRM_DEBUG_KMS("VBT HDMI level shift for port %c: %d\n",
6acab15a7b0d27 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1509  			      port_name(port),
6acab15a7b0d27 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1510  			      hdmi_level_shift);
6acab15a7b0d27 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1511  		info->hdmi_level_shift =3D hdmi_level_shift;
6acab15a7b0d27 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1512  	}
75067ddecf2127 drivers/gpu/drm/i915/intel_bios.c Antti Koskipaa 2015-07-10 =
 1513  =

d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1514  	if (bdb_version >=3D 204) {
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1515  		int max_tmds_clock;
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1516  =

d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1517  		switch (child->hdmi_max_data_rate) {
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1518  		default:
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1519  			MISSING_CASE(child->hdmi_max_data_rate);
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1520  			/* fall through */
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1521  		case HDMI_MAX_DATA_RATE_PLATFORM:
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1522  			max_tmds_clock =3D 0;
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1523  			break;
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1524  		case HDMI_MAX_DATA_RATE_297:
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1525  			max_tmds_clock =3D 297000;
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1526  			break;
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1527  		case HDMI_MAX_DATA_RATE_165:
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1528  			max_tmds_clock =3D 165000;
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1529  			break;
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1530  		}
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1531  =

d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1532  		if (max_tmds_clock)
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1533  			DRM_DEBUG_KMS("VBT HDMI max TMDS clock for port %c: %d =
kHz\n",
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1534  				      port_name(port), max_tmds_clock);
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1535  		info->max_tmds_clock =3D max_tmds_clock;
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1536  	}
d6038611aa3d7d drivers/gpu/drm/i915/intel_bios.c Ville Syrj=C3=A4l=C3=A4  2=
017-10-30  1537  =

75067ddecf2127 drivers/gpu/drm/i915/intel_bios.c Antti Koskipaa 2015-07-10 =
 1538  	/* Parse the I_boost config for SKL and above */
0ead5f81d4200b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2017-09-28 =
 1539  	if (bdb_version >=3D 196 && child->iboost) {
f22bb35856ba1e drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2017-08-25 =
 1540  		info->dp_boost_level =3D translate_iboost(child->dp_iboost_level);
75067ddecf2127 drivers/gpu/drm/i915/intel_bios.c Antti Koskipaa 2015-07-10 =
 1541  		DRM_DEBUG_KMS("VBT (e)DP boost level for port %c: %d\n",
75067ddecf2127 drivers/gpu/drm/i915/intel_bios.c Antti Koskipaa 2015-07-10 =
 1542  			      port_name(port), info->dp_boost_level);
f22bb35856ba1e drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2017-08-25 =
 1543  		info->hdmi_boost_level =3D translate_iboost(child->hdmi_iboost_lev=
el);
75067ddecf2127 drivers/gpu/drm/i915/intel_bios.c Antti Koskipaa 2015-07-10 =
 1544  		DRM_DEBUG_KMS("VBT HDMI boost level for port %c: %d\n",
75067ddecf2127 drivers/gpu/drm/i915/intel_bios.c Antti Koskipaa 2015-07-10 =
 1545  			      port_name(port), info->hdmi_boost_level);
75067ddecf2127 drivers/gpu/drm/i915/intel_bios.c Antti Koskipaa 2015-07-10 =
 1546  	}
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1547  =

99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1548  	/* DP max link rate for CNL+ */
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1549  	if (bdb_version >=3D 216) {
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1550  		switch (child->dp_max_link_rate) {
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1551  		default:
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1552  		case VBT_DP_MAX_LINK_RATE_HBR3:
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1553  			info->dp_max_link_rate =3D 810000;
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1554  			break;
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1555  		case VBT_DP_MAX_LINK_RATE_HBR2:
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1556  			info->dp_max_link_rate =3D 540000;
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1557  			break;
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1558  		case VBT_DP_MAX_LINK_RATE_HBR:
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1559  			info->dp_max_link_rate =3D 270000;
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1560  			break;
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1561  		case VBT_DP_MAX_LINK_RATE_LBR:
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1562  			info->dp_max_link_rate =3D 162000;
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1563  			break;
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1564  		}
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1565  		DRM_DEBUG_KMS("VBT DP max link rate for port %c: %d\n",
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1566  			      port_name(port), info->dp_max_link_rate);
99b91bda84060b drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2018-02-01 =
 1567  	}
7679f9b8f6ee39 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-05-31 =
 1568  =

7679f9b8f6ee39 drivers/gpu/drm/i915/intel_bios.c Jani Nikula    2019-05-31 =
 1569  	info->child =3D child;
6acab15a7b0d27 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1570  }
6acab15a7b0d27 drivers/gpu/drm/i915/intel_bios.c Paulo Zanoni   2013-09-12 =
 1571  =


:::::: The code at line 1482 was first introduced by commit
:::::: 554d6af50a40125c28e4e1035527a684d2607266 drm/i915: add some assertio=
ns about VBT DDI port types

:::::: TO: Paulo Zanoni <paulo.r.zanoni@intel.com>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============7965383211152114742==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============7965383211152114742==--

