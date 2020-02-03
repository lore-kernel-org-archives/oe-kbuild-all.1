Content-Type: multipart/mixed; boundary="===============1344065207451055937=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net] device property: change device_get_phy_mode() to prevent signedess bugs
Date: Mon, 03 Feb 2020 08:15:48 +0800
Message-ID: <202002030811.LGxjjsUT%lkp@intel.com>
In-Reply-To: <20200131045953.wbj66jkvijnmf5s2@kili.mountain>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1344065207451055937==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Dan,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on net/master]
[also build test ERROR on driver-core/driver-core-testing linus/master v5.5=
 next-20200131]
[cannot apply to sparc-next/master]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Dan-Carpenter/device-prope=
rty-change-device_get_phy_mode-to-prevent-signedess-bugs/20200203-043126
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net.git b7c3a=
17c6062701d97a0959890a2c882bfaac537
config: x86_64-defconfig (attached as .config)
compiler: gcc-7 (Debian 7.5.0-3) 7.5.0
reproduce:
        # save the attached .config to linux build tree
        make ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>

All error/warnings (new ones prefixed by >>):

   In file included from include/linux/ethtool.h:18:0,
                    from include/linux/phy.h:16,
                    from include/linux/property.h:15,
                    from include/linux/of.h:22,
                    from include/linux/irqdomain.h:35,
                    from include/linux/acpi.h:13,
                    from drivers/gpu/drm/i915/i915_drv.c:30:
>> include/uapi/linux/ethtool.h:1668:20: error: expected identifier before =
numeric constant
    #define PORT_NONE  0xef
                       ^
>> drivers/gpu/drm/i915/display/intel_display.h:190:2: note: in expansion o=
f macro 'PORT_NONE'
     PORT_NONE =3D -1,
     ^~~~~~~~~
   In file included from drivers/gpu/drm/i915/display/intel_bw.h:11:0,
                    from drivers/gpu/drm/i915/i915_drv.c:51:
   drivers/gpu/drm/i915/display/intel_display.h: In function 'port_identifi=
er':
>> drivers/gpu/drm/i915/display/intel_display.h:214:7: error: 'PORT_A' unde=
clared (first use in this function); did you mean 'PORT_DA'?
     case PORT_A:
          ^~~~~~
          PORT_DA
   drivers/gpu/drm/i915/display/intel_display.h:214:7: note: each undeclare=
d identifier is reported only once for each function it appears in
>> drivers/gpu/drm/i915/display/intel_display.h:216:7: error: 'PORT_B' unde=
clared (first use in this function); did you mean 'PORT_A'?
     case PORT_B:
          ^~~~~~
          PORT_A
>> drivers/gpu/drm/i915/display/intel_display.h:218:7: error: 'PORT_C' unde=
clared (first use in this function); did you mean 'PORT_B'?
     case PORT_C:
          ^~~~~~
          PORT_B
>> drivers/gpu/drm/i915/display/intel_display.h:220:7: error: 'PORT_D' unde=
clared (first use in this function); did you mean 'PORT_C'?
     case PORT_D:
          ^~~~~~
          PORT_C
>> drivers/gpu/drm/i915/display/intel_display.h:222:7: error: 'PORT_E' unde=
clared (first use in this function); did you mean 'PORT_D'?
     case PORT_E:
          ^~~~~~
          PORT_D
>> drivers/gpu/drm/i915/display/intel_display.h:224:7: error: 'PORT_F' unde=
clared (first use in this function); did you mean 'PORT_E'?
     case PORT_F:
          ^~~~~~
          PORT_E
>> drivers/gpu/drm/i915/display/intel_display.h:226:7: error: 'PORT_G' unde=
clared (first use in this function); did you mean 'PORT_F'?
     case PORT_G:
          ^~~~~~
          PORT_F
>> drivers/gpu/drm/i915/display/intel_display.h:228:7: error: 'PORT_H' unde=
clared (first use in this function); did you mean 'PORT_G'?
     case PORT_H:
          ^~~~~~
          PORT_G
>> drivers/gpu/drm/i915/display/intel_display.h:230:7: error: 'PORT_I' unde=
clared (first use in this function); did you mean 'PORT_H'?
     case PORT_I:
          ^~~~~~
          PORT_H
   In file included from drivers/gpu/drm/i915/display/intel_display_types.h=
:46:0,
                    from drivers/gpu/drm/i915/i915_drv.c:53:
   drivers/gpu/drm/i915/i915_drv.h: At top level:
>> drivers/gpu/drm/i915/i915_drv.h:726:41: error: 'I915_MAX_PORTS' undeclar=
ed here (not in a function); did you mean 'I915_MAX_PHYS'?
     struct ddi_vbt_port_info ddi_port_info[I915_MAX_PORTS];
                                            ^~~~~~~~~~~~~~
                                            I915_MAX_PHYS
   In file included from drivers/gpu/drm/i915/i915_drv.c:53:0:
   drivers/gpu/drm/i915/display/intel_display_types.h: In function 'vlv_dpo=
rt_to_channel':
>> drivers/gpu/drm/i915/display/intel_display_types.h:1386:7: error: 'PORT_=
B' undeclared (first use in this function); did you mean 'PORT_BNC'?
     case PORT_B:
          ^~~~~~
          PORT_BNC
>> drivers/gpu/drm/i915/display/intel_display_types.h:1387:7: error: 'PORT_=
D' undeclared (first use in this function); did you mean 'PORT_B'?
     case PORT_D:
          ^~~~~~
          PORT_B
>> drivers/gpu/drm/i915/display/intel_display_types.h:1389:7: error: 'PORT_=
C' undeclared (first use in this function); did you mean 'PORT_D'?
     case PORT_C:
          ^~~~~~
          PORT_D
   drivers/gpu/drm/i915/display/intel_display_types.h: In function 'vlv_dpo=
rt_to_phy':
   drivers/gpu/drm/i915/display/intel_display_types.h:1400:7: error: 'PORT_=
B' undeclared (first use in this function); did you mean 'PORT_BNC'?
     case PORT_B:
          ^~~~~~
          PORT_BNC
>> drivers/gpu/drm/i915/display/intel_display_types.h:1401:7: error: 'PORT_=
C' undeclared (first use in this function); did you mean 'PORT_B'?
     case PORT_C:
          ^~~~~~
          PORT_B
>> drivers/gpu/drm/i915/display/intel_display_types.h:1403:7: error: 'PORT_=
D' undeclared (first use in this function); did you mean 'PORT_C'?
     case PORT_D:
          ^~~~~~
          PORT_C
--
   In file included from include/linux/ethtool.h:18:0,
                    from include/linux/phy.h:16,
                    from include/linux/property.h:15,
                    from include/linux/of.h:22,
                    from include/linux/irqdomain.h:35,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/gpu/drm/i915/display/intel_display_types.h=
:30,
                    from drivers/gpu/drm/i915/i915_irq.c:39:
>> include/uapi/linux/ethtool.h:1668:20: error: expected identifier before =
numeric constant
    #define PORT_NONE  0xef
                       ^
>> drivers/gpu/drm/i915/display/intel_display.h:190:2: note: in expansion o=
f macro 'PORT_NONE'
     PORT_NONE =3D -1,
     ^~~~~~~~~
   In file included from drivers/gpu/drm/i915/i915_drv.h:68:0,
                    from drivers/gpu/drm/i915/display/intel_display_types.h=
:46,
                    from drivers/gpu/drm/i915/i915_irq.c:39:
   drivers/gpu/drm/i915/display/intel_display.h: In function 'port_identifi=
er':
>> drivers/gpu/drm/i915/display/intel_display.h:214:7: error: 'PORT_A' unde=
clared (first use in this function); did you mean 'PORT_DA'?
     case PORT_A:
          ^~~~~~
          PORT_DA
   drivers/gpu/drm/i915/display/intel_display.h:214:7: note: each undeclare=
d identifier is reported only once for each function it appears in
>> drivers/gpu/drm/i915/display/intel_display.h:216:7: error: 'PORT_B' unde=
clared (first use in this function); did you mean 'PORT_A'?
     case PORT_B:
          ^~~~~~
          PORT_A
>> drivers/gpu/drm/i915/display/intel_display.h:218:7: error: 'PORT_C' unde=
clared (first use in this function); did you mean 'PORT_B'?
     case PORT_C:
          ^~~~~~
          PORT_B
>> drivers/gpu/drm/i915/display/intel_display.h:220:7: error: 'PORT_D' unde=
clared (first use in this function); did you mean 'PORT_C'?
     case PORT_D:
          ^~~~~~
          PORT_C
>> drivers/gpu/drm/i915/display/intel_display.h:222:7: error: 'PORT_E' unde=
clared (first use in this function); did you mean 'PORT_D'?
     case PORT_E:
          ^~~~~~
          PORT_D
>> drivers/gpu/drm/i915/display/intel_display.h:224:7: error: 'PORT_F' unde=
clared (first use in this function); did you mean 'PORT_E'?
     case PORT_F:
          ^~~~~~
          PORT_E
>> drivers/gpu/drm/i915/display/intel_display.h:226:7: error: 'PORT_G' unde=
clared (first use in this function); did you mean 'PORT_F'?
     case PORT_G:
          ^~~~~~
          PORT_F
>> drivers/gpu/drm/i915/display/intel_display.h:228:7: error: 'PORT_H' unde=
clared (first use in this function); did you mean 'PORT_G'?
     case PORT_H:
          ^~~~~~
          PORT_G
>> drivers/gpu/drm/i915/display/intel_display.h:230:7: error: 'PORT_I' unde=
clared (first use in this function); did you mean 'PORT_H'?
     case PORT_I:
          ^~~~~~
          PORT_H
   In file included from drivers/gpu/drm/i915/display/intel_display_types.h=
:46:0,
                    from drivers/gpu/drm/i915/i915_irq.c:39:
   drivers/gpu/drm/i915/i915_drv.h: At top level:
>> drivers/gpu/drm/i915/i915_drv.h:726:41: error: 'I915_MAX_PORTS' undeclar=
ed here (not in a function); did you mean 'I915_MAX_PHYS'?
     struct ddi_vbt_port_info ddi_port_info[I915_MAX_PORTS];
                                            ^~~~~~~~~~~~~~
                                            I915_MAX_PHYS
   In file included from drivers/gpu/drm/i915/i915_irq.c:39:0:
   drivers/gpu/drm/i915/display/intel_display_types.h: In function 'vlv_dpo=
rt_to_channel':
>> drivers/gpu/drm/i915/display/intel_display_types.h:1386:7: error: 'PORT_=
B' undeclared (first use in this function); did you mean 'PORT_BNC'?
     case PORT_B:
          ^~~~~~
          PORT_BNC
>> drivers/gpu/drm/i915/display/intel_display_types.h:1387:7: error: 'PORT_=
D' undeclared (first use in this function); did you mean 'PORT_B'?
     case PORT_D:
          ^~~~~~
          PORT_B
>> drivers/gpu/drm/i915/display/intel_display_types.h:1389:7: error: 'PORT_=
C' undeclared (first use in this function); did you mean 'PORT_D'?
     case PORT_C:
          ^~~~~~
          PORT_D
   drivers/gpu/drm/i915/display/intel_display_types.h: In function 'vlv_dpo=
rt_to_phy':
   drivers/gpu/drm/i915/display/intel_display_types.h:1400:7: error: 'PORT_=
B' undeclared (first use in this function); did you mean 'PORT_BNC'?
     case PORT_B:
          ^~~~~~
          PORT_BNC
>> drivers/gpu/drm/i915/display/intel_display_types.h:1401:7: error: 'PORT_=
C' undeclared (first use in this function); did you mean 'PORT_B'?
     case PORT_C:
          ^~~~~~
          PORT_B
>> drivers/gpu/drm/i915/display/intel_display_types.h:1403:7: error: 'PORT_=
D' undeclared (first use in this function); did you mean 'PORT_C'?
     case PORT_D:
          ^~~~~~
          PORT_C
   In file included from drivers/gpu/drm/i915/i915_drv.h:64:0,
                    from drivers/gpu/drm/i915/display/intel_display_types.h=
:46,
                    from drivers/gpu/drm/i915/i915_irq.c:39:
   drivers/gpu/drm/i915/i915_irq.c: At top level:
>> drivers/gpu/drm/i915/i915_irq.c:152:37: error: 'PORT_A' undeclared here =
(not in a function); did you mean 'PORT_DA'?
     [HPD_PORT_A] =3D SDE_DDI_HOTPLUG_ICP(PORT_A),
                                        ^
   drivers/gpu/drm/i915/i915_reg.h:8021:43: note: in definition of macro 'S=
DE_DDI_HOTPLUG_ICP'
    #define SDE_DDI_HOTPLUG_ICP(port) (1 << ((port) + 16))
                                              ^~~~
>> drivers/gpu/drm/i915/i915_irq.c:153:37: error: 'PORT_B' undeclared here =
(not in a function); did you mean 'PORT_A'?
     [HPD_PORT_B] =3D SDE_DDI_HOTPLUG_ICP(PORT_B),
                                        ^
   drivers/gpu/drm/i915/i915_reg.h:8021:43: note: in definition of macro 'S=
DE_DDI_HOTPLUG_ICP'
    #define SDE_DDI_HOTPLUG_ICP(port) (1 << ((port) + 16))
                                              ^~~~
>> drivers/gpu/drm/i915/i915_irq.c:163:37: error: 'PORT_C' undeclared here =
(not in a function); did you mean 'PORT_B'?
     [HPD_PORT_C] =3D SDE_DDI_HOTPLUG_ICP(PORT_C),
                                        ^
   drivers/gpu/drm/i915/i915_reg.h:8021:43: note: in definition of macro 'S=
DE_DDI_HOTPLUG_ICP'
    #define SDE_DDI_HOTPLUG_ICP(port) (1 << ((port) + 16))
                                              ^~~~
--
   In file included from include/linux/ethtool.h:18:0,
                    from include/linux/phy.h:16,
                    from include/linux/property.h:15,
                    from include/linux/of.h:22,
                    from include/linux/irqdomain.h:35,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/gpu/drm/i915/i915_drv.h:37,
                    from drivers/gpu/drm/i915/i915_getparam.c:8:
>> include/uapi/linux/ethtool.h:1668:20: error: expected identifier before =
numeric constant
    #define PORT_NONE  0xef
                       ^
>> drivers/gpu/drm/i915/display/intel_display.h:190:2: note: in expansion o=
f macro 'PORT_NONE'
     PORT_NONE =3D -1,
     ^~~~~~~~~
   In file included from drivers/gpu/drm/i915/i915_drv.h:68:0,
                    from drivers/gpu/drm/i915/i915_getparam.c:8:
   drivers/gpu/drm/i915/display/intel_display.h: In function 'port_identifi=
er':
>> drivers/gpu/drm/i915/display/intel_display.h:214:7: error: 'PORT_A' unde=
clared (first use in this function); did you mean 'PORT_DA'?
     case PORT_A:
          ^~~~~~
          PORT_DA
   drivers/gpu/drm/i915/display/intel_display.h:214:7: note: each undeclare=
d identifier is reported only once for each function it appears in
>> drivers/gpu/drm/i915/display/intel_display.h:216:7: error: 'PORT_B' unde=
clared (first use in this function); did you mean 'PORT_A'?
     case PORT_B:
          ^~~~~~
          PORT_A
>> drivers/gpu/drm/i915/display/intel_display.h:218:7: error: 'PORT_C' unde=
clared (first use in this function); did you mean 'PORT_B'?
     case PORT_C:
          ^~~~~~
          PORT_B
>> drivers/gpu/drm/i915/display/intel_display.h:220:7: error: 'PORT_D' unde=
clared (first use in this function); did you mean 'PORT_C'?
     case PORT_D:
          ^~~~~~
          PORT_C
>> drivers/gpu/drm/i915/display/intel_display.h:222:7: error: 'PORT_E' unde=
clared (first use in this function); did you mean 'PORT_D'?
     case PORT_E:
          ^~~~~~
          PORT_D
>> drivers/gpu/drm/i915/display/intel_display.h:224:7: error: 'PORT_F' unde=
clared (first use in this function); did you mean 'PORT_E'?
     case PORT_F:
          ^~~~~~
          PORT_E
>> drivers/gpu/drm/i915/display/intel_display.h:226:7: error: 'PORT_G' unde=
clared (first use in this function); did you mean 'PORT_F'?
     case PORT_G:
          ^~~~~~
          PORT_F
>> drivers/gpu/drm/i915/display/intel_display.h:228:7: error: 'PORT_H' unde=
clared (first use in this function); did you mean 'PORT_G'?
     case PORT_H:
          ^~~~~~
          PORT_G
>> drivers/gpu/drm/i915/display/intel_display.h:230:7: error: 'PORT_I' unde=
clared (first use in this function); did you mean 'PORT_H'?
     case PORT_I:
          ^~~~~~
          PORT_H
   In file included from drivers/gpu/drm/i915/i915_getparam.c:8:0:
   drivers/gpu/drm/i915/i915_drv.h: At top level:
>> drivers/gpu/drm/i915/i915_drv.h:726:41: error: 'I915_MAX_PORTS' undeclar=
ed here (not in a function); did you mean 'I915_MAX_PHYS'?
     struct ddi_vbt_port_info ddi_port_info[I915_MAX_PORTS];
                                            ^~~~~~~~~~~~~~
                                            I915_MAX_PHYS
--
   In file included from include/linux/ethtool.h:18:0,
                    from include/linux/phy.h:16,
                    from include/linux/property.h:15,
                    from include/linux/of.h:22,
                    from include/linux/irqdomain.h:35,
                    from include/linux/acpi.h:13,
                    from include/linux/i2c.h:13,
                    from drivers/gpu/drm/i915/display/intel_display_types.h=
:30,
                    from drivers/gpu/drm/i915/display/intel_pipe_crc.c:33:
>> include/uapi/linux/ethtool.h:1668:20: error: expected identifier before =
numeric constant
    #define PORT_NONE  0xef
                       ^
>> drivers/gpu/drm/i915/display/intel_display.h:190:2: note: in expansion o=
f macro 'PORT_NONE'
     PORT_NONE =3D -1,
     ^~~~~~~~~
   In file included from drivers/gpu/drm/i915/i915_drv.h:68:0,
                    from drivers/gpu/drm/i915/display/intel_display_types.h=
:46,
                    from drivers/gpu/drm/i915/display/intel_pipe_crc.c:33:
   drivers/gpu/drm/i915/display/intel_display.h: In function 'port_identifi=
er':
>> drivers/gpu/drm/i915/display/intel_display.h:214:7: error: 'PORT_A' unde=
clared (first use in this function); did you mean 'PORT_DA'?
     case PORT_A:
          ^~~~~~
          PORT_DA
   drivers/gpu/drm/i915/display/intel_display.h:214:7: note: each undeclare=
d identifier is reported only once for each function it appears in
>> drivers/gpu/drm/i915/display/intel_display.h:216:7: error: 'PORT_B' unde=
clared (first use in this function); did you mean 'PORT_A'?
     case PORT_B:
          ^~~~~~
          PORT_A
>> drivers/gpu/drm/i915/display/intel_display.h:218:7: error: 'PORT_C' unde=
clared (first use in this function); did you mean 'PORT_B'?
     case PORT_C:
          ^~~~~~
          PORT_B
>> drivers/gpu/drm/i915/display/intel_display.h:220:7: error: 'PORT_D' unde=
clared (first use in this function); did you mean 'PORT_C'?
     case PORT_D:
          ^~~~~~
          PORT_C
>> drivers/gpu/drm/i915/display/intel_display.h:222:7: error: 'PORT_E' unde=
clared (first use in this function); did you mean 'PORT_D'?
     case PORT_E:
          ^~~~~~
          PORT_D
>> drivers/gpu/drm/i915/display/intel_display.h:224:7: error: 'PORT_F' unde=
clared (first use in this function); did you mean 'PORT_E'?
     case PORT_F:
          ^~~~~~
          PORT_E
>> drivers/gpu/drm/i915/display/intel_display.h:226:7: error: 'PORT_G' unde=
clared (first use in this function); did you mean 'PORT_F'?
     case PORT_G:
          ^~~~~~
          PORT_F
>> drivers/gpu/drm/i915/display/intel_display.h:228:7: error: 'PORT_H' unde=
clared (first use in this function); did you mean 'PORT_G'?
     case PORT_H:
          ^~~~~~
          PORT_G
>> drivers/gpu/drm/i915/display/intel_display.h:230:7: error: 'PORT_I' unde=
clared (first use in this function); did you mean 'PORT_H'?
     case PORT_I:
          ^~~~~~
          PORT_H
   In file included from drivers/gpu/drm/i915/display/intel_display_types.h=
:46:0,
                    from drivers/gpu/drm/i915/display/intel_pipe_crc.c:33:
   drivers/gpu/drm/i915/i915_drv.h: At top level:
>> drivers/gpu/drm/i915/i915_drv.h:726:41: error: 'I915_MAX_PORTS' undeclar=
ed here (not in a function); did you mean 'I915_MAX_PHYS'?
     struct ddi_vbt_port_info ddi_port_info[I915_MAX_PORTS];
                                            ^~~~~~~~~~~~~~
                                            I915_MAX_PHYS
   In file included from drivers/gpu/drm/i915/display/intel_pipe_crc.c:33:0:
   drivers/gpu/drm/i915/display/intel_display_types.h: In function 'vlv_dpo=
rt_to_channel':
>> drivers/gpu/drm/i915/display/intel_display_types.h:1386:7: error: 'PORT_=
B' undeclared (first use in this function); did you mean 'PORT_BNC'?
     case PORT_B:
          ^~~~~~
          PORT_BNC
>> drivers/gpu/drm/i915/display/intel_display_types.h:1387:7: error: 'PORT_=
D' undeclared (first use in this function); did you mean 'PORT_B'?
     case PORT_D:
          ^~~~~~
          PORT_B
>> drivers/gpu/drm/i915/display/intel_display_types.h:1389:7: error: 'PORT_=
C' undeclared (first use in this function); did you mean 'PORT_D'?
     case PORT_C:
          ^~~~~~
          PORT_D
   drivers/gpu/drm/i915/display/intel_display_types.h: In function 'vlv_dpo=
rt_to_phy':
   drivers/gpu/drm/i915/display/intel_display_types.h:1400:7: error: 'PORT_=
B' undeclared (first use in this function); did you mean 'PORT_BNC'?
     case PORT_B:
          ^~~~~~
          PORT_BNC
>> drivers/gpu/drm/i915/display/intel_display_types.h:1401:7: error: 'PORT_=
C' undeclared (first use in this function); did you mean 'PORT_B'?
     case PORT_C:
          ^~~~~~
          PORT_B
>> drivers/gpu/drm/i915/display/intel_display_types.h:1403:7: error: 'PORT_=
D' undeclared (first use in this function); did you mean 'PORT_C'?
     case PORT_D:
          ^~~~~~
          PORT_C
   drivers/gpu/drm/i915/display/intel_pipe_crc.c: In function 'i9xx_pipe_cr=
c_auto_source':
>> drivers/gpu/drm/i915/display/intel_pipe_crc.c:103:9: error: 'PORT_B' und=
eclared (first use in this function); did you mean 'PORT_BNC'?
       case PORT_B:
            ^~~~~~
            PORT_BNC
>> drivers/gpu/drm/i915/display/intel_pipe_crc.c:106:9: error: 'PORT_C' und=
eclared (first use in this function); did you mean 'PORT_B'?
       case PORT_C:
            ^~~~~~
            PORT_B
>> drivers/gpu/drm/i915/display/intel_pipe_crc.c:109:9: error: 'PORT_D' und=
eclared (first use in this function); did you mean 'PORT_C'?
       case PORT_D:
            ^~~~~~
            PORT_C
..

vim +1668 include/uapi/linux/ethtool.h

103a8ad1fa3b26 Nikolay Aleksandrov 2016-02-03  1660  =

607ca46e97a1b6 David Howells       2012-10-13  1661  /* Which connector por=
t. */
607ca46e97a1b6 David Howells       2012-10-13  1662  #define PORT_TP			0x00
607ca46e97a1b6 David Howells       2012-10-13  1663  #define PORT_AUI		0x01
607ca46e97a1b6 David Howells       2012-10-13  1664  #define PORT_MII		0x02
607ca46e97a1b6 David Howells       2012-10-13  1665  #define PORT_FIBRE		0x=
03
607ca46e97a1b6 David Howells       2012-10-13  1666  #define PORT_BNC		0x04
607ca46e97a1b6 David Howells       2012-10-13  1667  #define PORT_DA			0x05
607ca46e97a1b6 David Howells       2012-10-13 @1668  #define PORT_NONE		0xef
607ca46e97a1b6 David Howells       2012-10-13  1669  #define PORT_OTHER		0x=
ff
607ca46e97a1b6 David Howells       2012-10-13  1670  =


:::::: The code at line 1668 was first introduced by commit
:::::: 607ca46e97a1b6594b29647d98a32d545c24bdff UAPI: (Scripted) Disintegra=
te include/linux

:::::: TO: David Howells <dhowells@redhat.com>
:::::: CC: David Howells <dhowells@redhat.com>

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation

--===============1344065207451055937==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============1344065207451055937==--

