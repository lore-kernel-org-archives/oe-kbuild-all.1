Content-Type: multipart/mixed; boundary="===============5211589788711222774=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: [android-common:android-4.19-r 1/1] drivers/dma/ti/omap-dma.c:1626:34: warning: unused variable 'omap_dma_match'
Date: Tue, 19 Jan 2021 21:07:00 +0800
Message-ID: <202101192154.I4KlD27A-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============5211589788711222774==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://android.googlesource.com/kernel/common android-4.19-r
head:   f0719dcb3a6ebfd657bff0df566e70f6fd18e3c9
commit: f0719dcb3a6ebfd657bff0df566e70f6fd18e3c9 [1/1] BACKPORT: ARM: 8900/=
1: UNWINDER_FRAME_POINTER implementation for Clang
config: arm-randconfig-r002-20210119 (attached as .config)
compiler: clang version 12.0.0 (https://github.com/llvm/llvm-project 22b684=
40e1647e16b5ee24b924986207173c02d1)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install arm cross compiling tool for clang build
        # apt-get install binutils-arm-linux-gnueabi
        git remote add android-common https://android.googlesource.com/kern=
el/common
        git fetch --no-tags android-common android-4.19-r
        git checkout f0719dcb3a6ebfd657bff0df566e70f6fd18e3c9
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Darm =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   In file included from include/linux/idr.h:16:
   In file included from include/linux/gfp.h:6:
   include/linux/mmzone.h:988:44: warning: comparison of integers of differ=
ent signs: 'int' and 'enum zone_type' [-Wsign-compare]
           if (likely(!nodes && zonelist_zone_idx(z) <=3D highest_zoneidx))
                                ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/compiler.h:56:36: note: expanded from macro 'if'
   #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                                      ^~~~
   include/linux/compiler.h:58:30: note: expanded from macro '__trace_if'
           if (__builtin_constant_p(!!(cond)) ? !!(cond) :                 \
                                       ^~~~
   In file included from drivers/dma/ti/omap-dma.c:9:
   In file included from include/linux/dmaengine.h:20:
   In file included from include/linux/device.h:16:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:14:
   In file included from include/linux/idr.h:16:
   In file included from include/linux/gfp.h:6:
   include/linux/mmzone.h:988:44: warning: comparison of integers of differ=
ent signs: 'int' and 'enum zone_type' [-Wsign-compare]
           if (likely(!nodes && zonelist_zone_idx(z) <=3D highest_zoneidx))
                                ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/compiler.h:56:36: note: expanded from macro 'if'
   #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                                      ^~~~
   include/linux/compiler.h:58:30: note: expanded from macro '__trace_if'
           if (__builtin_constant_p(!!(cond)) ? !!(cond) :                 \
                                       ^~~~
   In file included from drivers/dma/ti/omap-dma.c:9:
   In file included from include/linux/dmaengine.h:20:
   In file included from include/linux/device.h:16:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:14:
   In file included from include/linux/idr.h:16:
   In file included from include/linux/gfp.h:6:
   include/linux/mmzone.h:988:44: warning: comparison of integers of differ=
ent signs: 'int' and 'enum zone_type' [-Wsign-compare]
           if (likely(!nodes && zonelist_zone_idx(z) <=3D highest_zoneidx))
                                ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   include/linux/compiler.h:45:39: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                             ^
   include/linux/compiler.h:33:34: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                         ^
   include/linux/compiler.h:56:36: note: expanded from macro 'if'
   #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                                      ^~~~
   include/linux/compiler.h:69:16: note: expanded from macro '__trace_if'
                   ______r =3D !!(cond);                                   =
  \
                                ^~~~
   In file included from drivers/dma/ti/omap-dma.c:9:
   In file included from include/linux/dmaengine.h:20:
   In file included from include/linux/device.h:16:
   In file included from include/linux/kobject.h:20:
   In file included from include/linux/sysfs.h:16:
   In file included from include/linux/kernfs.h:14:
   In file included from include/linux/idr.h:16:
   In file included from include/linux/gfp.h:6:
   include/linux/mmzone.h:988:44: warning: comparison of integers of differ=
ent signs: 'int' and 'enum zone_type' [-Wsign-compare]
           if (likely(!nodes && zonelist_zone_idx(z) <=3D highest_zoneidx))
                                ~~~~~~~~~~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   include/linux/compiler.h:56:36: note: expanded from macro 'if'
   #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                                      ^~~~
   include/linux/compiler.h:69:16: note: expanded from macro '__trace_if'
                   ______r =3D !!(cond);                                   =
  \
                                ^~~~
   In file included from drivers/dma/ti/omap-dma.c:9:
   In file included from include/linux/dmaengine.h:24:
   In file included from include/linux/scatterlist.h:8:
   In file included from include/linux/mm.h:26:
   In file included from include/linux/page_ref.h:7:
   include/linux/page-flags.h:163:21: warning: comparison of integers of di=
fferent signs: 'const unsigned long' and 'long' [-Wsign-compare]
           return page->flags =3D=3D PAGE_POISON_PATTERN;
                  ~~~~~~~~~~~ ^  ~~~~~~~~~~~~~~~~~~~
   drivers/dma/ti/omap-dma.c:235:17: warning: comparison of integers of dif=
ferent signs: 'int' and 'unsigned int' [-Wsign-compare]
                   for (i =3D 0; i < d->sglen; i++) {
                               ~ ^ ~~~~~~~~
   drivers/dma/ti/omap-dma.c:1527:16: warning: comparison of integers of di=
fferent signs: 'int' and 'unsigned int' [-Wsign-compare]
           for (i =3D 0; i < od->dma_requests; i++) {
                       ~ ^ ~~~~~~~~~~~~~~~~
>> drivers/dma/ti/omap-dma.c:1626:34: warning: unused variable 'omap_dma_ma=
tch' [-Wunused-const-variable]
   static const struct of_device_id omap_dma_match[] =3D {
                                    ^
   16 warnings generated.
   /usr/bin/as: unrecognized option '-EL'
   clang-12: error: assembler command failed with exit code 1 (use -v to se=
e invocation)
--
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:168:44: note: expanded from macro 'for_each_cfg=
_sme'
           for (i =3D 0; idx =3D fwspec_smendx(fw, i), i < fw->num_ids; ++i)
                                                   ~ ^ ~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1148:2: warning: comparison of integers of diff=
erent signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_cfg_sme(fwspec, i, idx) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:168:20: note: expanded from macro 'for_each_cfg=
_sme'
           for (i =3D 0; idx =3D fwspec_smendx(fw, i), i < fw->num_ids; ++i)
                             ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:166:5: note: expanded from macro 'fwspec_smendx'
           (i >=3D fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[=
i])
            ~ ^  ~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1172:2: warning: comparison of integers of diff=
erent signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_cfg_sme(fwspec, i, idx) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:168:44: note: expanded from macro 'for_each_cfg=
_sme'
           for (i =3D 0; idx =3D fwspec_smendx(fw, i), i < fw->num_ids; ++i)
                                                   ~ ^ ~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1172:2: warning: comparison of integers of diff=
erent signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_cfg_sme(fwspec, i, idx) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:168:20: note: expanded from macro 'for_each_cfg=
_sme'
           for (i =3D 0; idx =3D fwspec_smendx(fw, i), i < fw->num_ids; ++i)
                             ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:166:5: note: expanded from macro 'fwspec_smendx'
           (i >=3D fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[=
i])
            ~ ^  ~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1194:2: warning: comparison of integers of diff=
erent signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_cfg_sme(fwspec, i, idx) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:168:44: note: expanded from macro 'for_each_cfg=
_sme'
           for (i =3D 0; idx =3D fwspec_smendx(fw, i), i < fw->num_ids; ++i)
                                                   ~ ^ ~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1194:2: warning: comparison of integers of diff=
erent signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_cfg_sme(fwspec, i, idx) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:168:20: note: expanded from macro 'for_each_cfg=
_sme'
           for (i =3D 0; idx =3D fwspec_smendx(fw, i), i < fw->num_ids; ++i)
                             ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:166:5: note: expanded from macro 'fwspec_smendx'
           (i >=3D fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[=
i])
            ~ ^  ~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1396:16: warning: comparison of integers of dif=
ferent signs: 'int' and 'unsigned int' [-Wsign-compare]
           for (i =3D 0; i < fwspec->num_ids; i++) {
                       ~ ^ ~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1465:2: warning: comparison of integers of diff=
erent signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_cfg_sme(fwspec, i, idx) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:168:44: note: expanded from macro 'for_each_cfg=
_sme'
           for (i =3D 0; idx =3D fwspec_smendx(fw, i), i < fw->num_ids; ++i)
                                                   ~ ^ ~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1465:2: warning: comparison of integers of diff=
erent signs: 'int' and 'unsigned int' [-Wsign-compare]
           for_each_cfg_sme(fwspec, i, idx) {
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:168:20: note: expanded from macro 'for_each_cfg=
_sme'
           for (i =3D 0; idx =3D fwspec_smendx(fw, i), i < fw->num_ids; ++i)
                             ^~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:166:5: note: expanded from macro 'fwspec_smendx'
           (i >=3D fw->num_ids ? INVALID_SMENDX : __fwspec_cfg(fw)->smendx[=
i])
            ~ ^  ~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1609:16: warning: comparison of integers of dif=
ferent signs: 'int' and 'u32' (aka 'unsigned int') [-Wsign-compare]
           for (i =3D 0; i < smmu->num_mapping_groups; ++i)
                       ~ ^ ~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1632:16: warning: comparison of integers of dif=
ferent signs: 'int' and 'u32' (aka 'unsigned int') [-Wsign-compare]
           for (i =3D 0; i < smmu->num_context_banks; ++i) {
                       ~ ^ ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/iommu/arm-smmu.c:1796:16: warning: comparison of integers of dif=
ferent signs: 'int' and 'unsigned long' [-Wsign-compare]
           for (i =3D 0; i < size; i++)
                       ~ ^ ~~~~
   drivers/iommu/arm-smmu.c:2092:16: warning: comparison of integers of dif=
ferent signs: 'int' and 'u32' (aka 'unsigned int') [-Wsign-compare]
                   if (num_irqs > smmu->num_global_irqs)
                       ~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:36: note: expanded from macro 'if'
   #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                                      ^~~~
   include/linux/compiler.h:69:16: note: expanded from macro '__trace_if'
                   ______r =3D !!(cond);                                   =
  \
                                ^~~~
   drivers/iommu/arm-smmu.c:2092:16: warning: comparison of integers of dif=
ferent signs: 'int' and 'u32' (aka 'unsigned int') [-Wsign-compare]
                   if (num_irqs > smmu->num_global_irqs)
                       ~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:36: note: expanded from macro 'if'
   #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                                      ^~~~
   include/linux/compiler.h:58:30: note: expanded from macro '__trace_if'
           if (__builtin_constant_p(!!(cond)) ? !!(cond) :                 \
                                       ^~~~
   drivers/iommu/arm-smmu.c:2092:16: warning: comparison of integers of dif=
ferent signs: 'int' and 'u32' (aka 'unsigned int') [-Wsign-compare]
                   if (num_irqs > smmu->num_global_irqs)
                       ~~~~~~~~ ^ ~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:56:36: note: expanded from macro 'if'
   #define if(cond, ...) __trace_if( (cond , ## __VA_ARGS__) )
                                      ^~~~
   include/linux/compiler.h:58:42: note: expanded from macro '__trace_if'
           if (__builtin_constant_p(!!(cond)) ? !!(cond) :                 \
                                                   ^~~~
   drivers/iommu/arm-smmu.c:2135:16: warning: comparison of integers of dif=
ferent signs: 'int' and 'u32' (aka 'unsigned int') [-Wsign-compare]
           for (i =3D 0; i < smmu->num_global_irqs; ++i) {
                       ~ ^ ~~~~~~~~~~~~~~~~~~~~~
>> drivers/iommu/arm-smmu.c:1927:34: warning: unused variable 'arm_smmu_of_=
match' [-Wunused-const-variable]
   static const struct of_device_id arm_smmu_of_match[] =3D {
                                    ^
   33 warnings generated.
   /usr/bin/as: unrecognized option '-EL'
   clang-12: error: assembler command failed with exit code 1 (use -v to se=
e invocation)
--
   sound/soc/codecs/da7218.c:1779:2: warning: missing field 'connected' ini=
tializer [-Wmissing-field-initializers]
   sound/soc/codecs/da7218.c:1704:44: note: expanded from macro 'DA7218_DMI=
X_ROUTES'
           {name, "In Filter1R Switch", "In Filter1R"},            \
                                                     ^
   sound/soc/codecs/da7218.c:1779:2: warning: missing field 'connected' ini=
tializer [-Wmissing-field-initializers]
   sound/soc/codecs/da7218.c:1705:44: note: expanded from macro 'DA7218_DMI=
X_ROUTES'
           {name, "In Filter2L Switch", "In Filter2L"},            \
                                                     ^
   sound/soc/codecs/da7218.c:1779:2: warning: missing field 'connected' ini=
tializer [-Wmissing-field-initializers]
   sound/soc/codecs/da7218.c:1706:44: note: expanded from macro 'DA7218_DMI=
X_ROUTES'
           {name, "In Filter2R Switch", "In Filter2R"},            \
                                                     ^
   sound/soc/codecs/da7218.c:1779:2: warning: missing field 'connected' ini=
tializer [-Wmissing-field-initializers]
   sound/soc/codecs/da7218.c:1707:43: note: expanded from macro 'DA7218_DMI=
X_ROUTES'
           {name, "ToneGen Switch", "Tone Generator"},             \
                                                    ^
   sound/soc/codecs/da7218.c:1779:2: warning: missing field 'connected' ini=
tializer [-Wmissing-field-initializers]
   sound/soc/codecs/da7218.c:1708:31: note: expanded from macro 'DA7218_DMI=
X_ROUTES'
           {name, "DAIL Switch", "DAIIN"},                         \
                                        ^
   sound/soc/codecs/da7218.c:1779:2: warning: missing field 'connected' ini=
tializer [-Wmissing-field-initializers]
   sound/soc/codecs/da7218.c:1709:31: note: expanded from macro 'DA7218_DMI=
X_ROUTES'
           {name, "DAIR Switch", "DAIIN"}
                                        ^
   sound/soc/codecs/da7218.c:1781:45: warning: missing field 'connected' in=
itializer [-Wmissing-field-initializers]
           {"BiQuad Filter", NULL, "Mixer Out FilterL"},
                                                      ^
   sound/soc/codecs/da7218.c:1782:45: warning: missing field 'connected' in=
itializer [-Wmissing-field-initializers]
           {"BiQuad Filter", NULL, "Mixer Out FilterR"},
                                                      ^
   sound/soc/codecs/da7218.c:1784:58: warning: missing field 'connected' in=
itializer [-Wmissing-field-initializers]
           {"Out FilterL BiQuad Mux", "Bypass", "Mixer Out FilterL"},
                                                                   ^
   sound/soc/codecs/da7218.c:1785:55: warning: missing field 'connected' in=
itializer [-Wmissing-field-initializers]
           {"Out FilterL BiQuad Mux", "Enabled", "BiQuad Filter"},
                                                                ^
   sound/soc/codecs/da7218.c:1786:58: warning: missing field 'connected' in=
itializer [-Wmissing-field-initializers]
           {"Out FilterR BiQuad Mux", "Bypass", "Mixer Out FilterR"},
                                                                   ^
   sound/soc/codecs/da7218.c:1787:55: warning: missing field 'connected' in=
itializer [-Wmissing-field-initializers]
           {"Out FilterR BiQuad Mux", "Enabled", "BiQuad Filter"},
                                                                ^
   sound/soc/codecs/da7218.c:1789:2: warning: missing field 'connected' ini=
tializer [-Wmissing-field-initializers]
           DA7218_DMIX_ST_ROUTES("ST Mixer Out FilterL"),
           ^
   sound/soc/codecs/da7218.c:1712:55: note: expanded from macro 'DA7218_DMI=
X_ST_ROUTES'
           {name, "Out FilterL Switch", "Out FilterL BiQuad Mux"}, \
                                                                ^
   sound/soc/codecs/da7218.c:1789:2: warning: missing field 'connected' ini=
tializer [-Wmissing-field-initializers]
   sound/soc/codecs/da7218.c:1713:55: note: expanded from macro 'DA7218_DMI=
X_ST_ROUTES'
           {name, "Out FilterR Switch", "Out FilterR BiQuad Mux"}, \
                                                                ^
   sound/soc/codecs/da7218.c:1789:2: warning: missing field 'connected' ini=
tializer [-Wmissing-field-initializers]
   sound/soc/codecs/da7218.c:1714:45: note: expanded from macro 'DA7218_DMI=
X_ST_ROUTES'
           {name, "Sidetone Switch", "Sidetone Filter"}
                                                      ^
   sound/soc/codecs/da7218.c:1790:2: warning: missing field 'connected' ini=
tializer [-Wmissing-field-initializers]
           DA7218_DMIX_ST_ROUTES("ST Mixer Out FilterR"),
           ^
   sound/soc/codecs/da7218.c:1712:55: note: expanded from macro 'DA7218_DMI=
X_ST_ROUTES'
           {name, "Out FilterL Switch", "Out FilterL BiQuad Mux"}, \
                                                                ^
   sound/soc/codecs/da7218.c:1790:2: warning: missing field 'connected' ini=
tializer [-Wmissing-field-initializers]
   sound/soc/codecs/da7218.c:1713:55: note: expanded from macro 'DA7218_DMI=
X_ST_ROUTES'
           {name, "Out FilterR Switch", "Out FilterR BiQuad Mux"}, \
                                                                ^
   sound/soc/codecs/da7218.c:1790:2: warning: missing field 'connected' ini=
tializer [-Wmissing-field-initializers]
   sound/soc/codecs/da7218.c:1714:45: note: expanded from macro 'DA7218_DMI=
X_ST_ROUTES'
           {name, "Sidetone Switch", "Sidetone Filter"}
                                                      ^
   sound/soc/codecs/da7218.c:1792:46: warning: missing field 'connected' in=
itializer [-Wmissing-field-initializers]
           {"Out FilterL", NULL, "ST Mixer Out FilterL"},
                                                       ^
   sound/soc/codecs/da7218.c:1793:46: warning: missing field 'connected' in=
itializer [-Wmissing-field-initializers]
           {"Out FilterR", NULL, "ST Mixer Out FilterR"},
                                                       ^
   sound/soc/codecs/da7218.c:1795:41: warning: missing field 'connected' in=
itializer [-Wmissing-field-initializers]
           {"Mixout Left PGA", NULL, "Out FilterL"},
                                                  ^
   sound/soc/codecs/da7218.c:1796:42: warning: missing field 'connected' in=
itializer [-Wmissing-field-initializers]
           {"Mixout Right PGA", NULL, "Out FilterR"},
                                                   ^
   sound/soc/codecs/da7218.c:1798:48: warning: missing field 'connected' in=
itializer [-Wmissing-field-initializers]
           {"Headphone Left PGA", NULL, "Mixout Left PGA"},
                                                         ^
   sound/soc/codecs/da7218.c:1799:50: warning: missing field 'connected' in=
itializer [-Wmissing-field-initializers]
           {"Headphone Right PGA", NULL, "Mixout Right PGA"},
                                                           ^
   sound/soc/codecs/da7218.c:1801:36: warning: missing field 'connected' in=
itializer [-Wmissing-field-initializers]
           {"HPL", NULL, "Headphone Left PGA"},
                                             ^
   sound/soc/codecs/da7218.c:1802:37: warning: missing field 'connected' in=
itializer [-Wmissing-field-initializers]
           {"HPR", NULL, "Headphone Right PGA"},
                                              ^
   sound/soc/codecs/da7218.c:1804:29: warning: missing field 'connected' in=
itializer [-Wmissing-field-initializers]
           {"HPL", NULL, "Charge Pump"},
                                      ^
   sound/soc/codecs/da7218.c:1805:29: warning: missing field 'connected' in=
itializer [-Wmissing-field-initializers]
           {"HPR", NULL, "Charge Pump"},
                                      ^
>> sound/soc/codecs/da7218.c:2285:34: warning: unused variable 'da7218_of_m=
atch' [-Wunused-const-variable]
   static const struct of_device_id da7218_of_match[] =3D {
                                    ^
   324 warnings generated.
   /usr/bin/as: unrecognized option '-EL'
   clang-12: error: assembler command failed with exit code 1 (use -v to se=
e invocation)
..


vim +/omap_dma_match +1626 drivers/dma/ti/omap-dma.c

7bedaa5537604f34 drivers/dma/omap-dma.c Russell King 2012-04-13  1625  =

8d30662aac256eb6 drivers/dma/omap-dma.c Jon Hunter   2013-02-26 @1626  stat=
ic const struct of_device_id omap_dma_match[] =3D {
8d30662aac256eb6 drivers/dma/omap-dma.c Jon Hunter   2013-02-26  1627  	{ .=
compatible =3D "ti,omap2420-sdma", },
8d30662aac256eb6 drivers/dma/omap-dma.c Jon Hunter   2013-02-26  1628  	{ .=
compatible =3D "ti,omap2430-sdma", },
8d30662aac256eb6 drivers/dma/omap-dma.c Jon Hunter   2013-02-26  1629  	{ .=
compatible =3D "ti,omap3430-sdma", },
8d30662aac256eb6 drivers/dma/omap-dma.c Jon Hunter   2013-02-26  1630  	{ .=
compatible =3D "ti,omap3630-sdma", },
8d30662aac256eb6 drivers/dma/omap-dma.c Jon Hunter   2013-02-26  1631  	{ .=
compatible =3D "ti,omap4430-sdma", },
8d30662aac256eb6 drivers/dma/omap-dma.c Jon Hunter   2013-02-26  1632  	{},
8d30662aac256eb6 drivers/dma/omap-dma.c Jon Hunter   2013-02-26  1633  };
8d30662aac256eb6 drivers/dma/omap-dma.c Jon Hunter   2013-02-26  1634  MODU=
LE_DEVICE_TABLE(of, omap_dma_match);
8d30662aac256eb6 drivers/dma/omap-dma.c Jon Hunter   2013-02-26  1635  =


:::::: The code at line 1626 was first introduced by commit
:::::: 8d30662aac256eb61bc2f1d9cf1191825ef96328 dmaengine: OMAP: Register S=
DMA controller with Device Tree DMA driver

:::::: TO: Jon Hunter <jon-hunter@ti.com>
:::::: CC: Vinod Koul <vinod.koul@intel.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============5211589788711222774==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
1LeFsypV90x2MlbgixrDgpr9/B/d/HPUhp4BAA==
--===============5211589788711222774==--

