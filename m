Content-Type: multipart/mixed; boundary="===============6061275630290820944=="
MIME-Version: 1.0
From: Daniel Axtens <dja@axtens.net>
To: kbuild-all@lists.01.org
Subject: Re: [hnaz-linux-mm:master 156/523] include/linux/string.h:307:9: note: in expansion of macro '__underlying_strncpy'
Date: Wed, 20 May 2020 00:42:17 +1000
Message-ID: <87blmkhtpy.fsf@dja-thinkpad.axtens.net>
In-Reply-To: <202005191736.t1JQZSrV%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6061275630290820944==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

This looks like a SCSI issue that this has just happened to expose?
+ scsi list

kbuild test robot <lkp@intel.com> writes:

> tree:   https://github.com/hnaz/linux-mm master
> head:   2bbf0589bfeb27800c730b76eacf34528eee5418
> commit: 854834b3859d2d80e31750f658bc8e4031422912 [156/523] string.h: fix =
incompatibility between FORTIFY_SOURCE and KASAN
> config: arm-allyesconfig (attached as .config)
> compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         git checkout 854834b3859d2d80e31750f658bc8e4031422912
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Darm =

>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> drivers/scsi/arcmsr/arcmsr_hba.c: In function 'arcmsr_remap_pciregion':
> drivers/scsi/arcmsr/arcmsr_hba.c:286:30: warning: variable 'flags' set bu=
t not used [-Wunused-but-set-variable]
> 286 |   unsigned long addr, range, flags;
> |                              ^~~~~
> drivers/scsi/arcmsr/arcmsr_hba.c: In function 'arcmsr_suspend':
> drivers/scsi/arcmsr/arcmsr_hba.c:1070:11: warning: variable 'intmask_org'=
 set but not used [-Wunused-but-set-variable]
> 1070 |  uint32_t intmask_org;
> |           ^~~~~~~~~~~
> drivers/scsi/arcmsr/arcmsr_hba.c: In function 'arcmsr_done4abort_postqueu=
e':
> drivers/scsi/arcmsr/arcmsr_hba.c:1410:29: warning: variable 'cdb_phy_hipa=
rt' set but not used [-Wunused-but-set-variable]
> 1410 |  unsigned long ccb_cdb_phy, cdb_phy_hipart;
> |                             ^~~~~~~~~~~~~~
> drivers/scsi/arcmsr/arcmsr_hba.c: In function 'arcmsr_hbaD_postqueue_isr':
> drivers/scsi/arcmsr/arcmsr_hba.c:2448:36: warning: variable 'cdb_phy_hipa=
rt' set but not used [-Wunused-but-set-variable]
> 2448 |  unsigned long flags, ccb_cdb_phy, cdb_phy_hipart;
> |                                    ^~~~~~~~~~~~~~
> drivers/scsi/arcmsr/arcmsr_hba.c: In function 'arcmsr_hbaD_polling_ccbdon=
e':
> drivers/scsi/arcmsr/arcmsr_hba.c:3498:36: warning: variable 'cdb_phy_hipa=
rt' set but not used [-Wunused-but-set-variable]
> 3498 |  unsigned long flags, ccb_cdb_phy, cdb_phy_hipart;
> |                                    ^~~~~~~~~~~~~~
> In file included from include/linux/bitmap.h:9,
> from include/linux/nodemask.h:95,
> from include/linux/mmzone.h:17,
> from include/linux/gfp.h:6,
> from include/linux/umh.h:4,
> from include/linux/kmod.h:9,
> from include/linux/module.h:16,
> from drivers/scsi/arcmsr/arcmsr_hba.c:47:
> In function 'strncpy',
> inlined from 'arcmsr_handle_virtual_command' at drivers/scsi/arcmsr/arcms=
r_hba.c:3059:3:
> include/linux/string.h:297:30: warning: '__builtin_strncpy' output trunca=
ted before terminating nul copying 4 bytes from a string of the same length=
 [-Wstringop-truncation]
> 297 | #define __underlying_strncpy __builtin_strncpy
> |                              ^
>>> include/linux/string.h:307:9: note: in expansion of macro '__underlying=
_strncpy'
> 307 |  return __underlying_strncpy(p, q, size);
> |         ^~~~~~~~~~~~~~~~~~~~
> In function 'strncpy',
> inlined from 'arcmsr_handle_virtual_command' at drivers/scsi/arcmsr/arcms=
r_hba.c:3057:3:
> include/linux/string.h:297:30: warning: '__builtin_strncpy' output trunca=
ted before terminating nul copying 16 bytes from a string of the same lengt=
h [-Wstringop-truncation]
> 297 | #define __underlying_strncpy __builtin_strncpy
> |                              ^
>>> include/linux/string.h:307:9: note: in expansion of macro '__underlying=
_strncpy'
> 307 |  return __underlying_strncpy(p, q, size);
> |         ^~~~~~~~~~~~~~~~~~~~
> In function 'strncpy',
> inlined from 'arcmsr_handle_virtual_command' at drivers/scsi/arcmsr/arcms=
r_hba.c:3055:3:
> include/linux/string.h:297:30: warning: '__builtin_strncpy' output trunca=
ted before terminating nul copying 8 bytes from a string of the same length=
 [-Wstringop-truncation]
> 297 | #define __underlying_strncpy __builtin_strncpy
> |                              ^
>>> include/linux/string.h:307:9: note: in expansion of macro '__underlying=
_strncpy'
> 307 |  return __underlying_strncpy(p, q, size);
> |         ^~~~~~~~~~~~~~~~~~~~
> --
> In file included from include/linux/bitmap.h:9,
> from include/linux/nodemask.h:95,
> from include/linux/mmzone.h:17,
> from include/linux/gfp.h:6,
> from include/linux/slab.h:15,
> from drivers/scsi/pm8001/pm8001_sas.c:41:
> In function 'strncpy',
> inlined from 'pm8001_issue_ssp_tmf' at drivers/scsi/pm8001/pm8001_sas.c:9=
19:2:
> include/linux/string.h:297:30: warning: '__builtin_strncpy' specified bou=
nd 8 equals destination size [-Wstringop-truncation]
> 297 | #define __underlying_strncpy __builtin_strncpy
> |                              ^
>>> include/linux/string.h:307:9: note: in expansion of macro '__underlying=
_strncpy'
> 307 |  return __underlying_strncpy(p, q, size);
> |         ^~~~~~~~~~~~~~~~~~~~
> --
> drivers/scsi/ips.c: In function 'ips_init_copperhead':
> drivers/scsi/ips.c:4700:10: warning: variable 'ConfigByte' set but not us=
ed [-Wunused-but-set-variable]
> 4700 |  uint8_t ConfigByte[IPS_MAX_CONFIG_BYTES];
> |          ^~~~~~~~~~
> drivers/scsi/ips.c: In function 'ips_init_copperhead_memio':
> drivers/scsi/ips.c:4794:10: warning: variable 'ConfigByte' set but not us=
ed [-Wunused-but-set-variable]
> 4794 |  uint8_t ConfigByte[IPS_MAX_CONFIG_BYTES];
> |          ^~~~~~~~~~
> drivers/scsi/ips.c: In function 'ips_init_phase1':
> drivers/scsi/ips.c:6839:10: warning: variable 'func' set but not used [-W=
unused-but-set-variable]
> 6839 |  uint8_t func;
> |          ^~~~
> drivers/scsi/ips.c:6838:10: warning: variable 'bus' set but not used [-Wu=
nused-but-set-variable]
> 6838 |  uint8_t bus;
> |          ^~~
> In file included from arch/arm/include/asm/io.h:23,
> from drivers/scsi/ips.c:164:
> In function 'strncpy',
> inlined from 'ips_send_cmd' at drivers/scsi/ips.c:3522:6:
> include/linux/string.h:297:30: warning: '__builtin_strncpy' output trunca=
ted before terminating nul copying 4 bytes from a string of the same length=
 [-Wstringop-truncation]
> 297 | #define __underlying_strncpy __builtin_strncpy
> |                              ^
>>> include/linux/string.h:307:9: note: in expansion of macro '__underlying=
_strncpy'
> 307 |  return __underlying_strncpy(p, q, size);
> |         ^~~~~~~~~~~~~~~~~~~~
> In function 'strncpy',
> inlined from 'ips_send_cmd' at drivers/scsi/ips.c:3520:6:
> include/linux/string.h:297:30: warning: '__builtin_strncpy' output trunca=
ted before terminating nul copying 16 bytes from a string of the same lengt=
h [-Wstringop-truncation]
> 297 | #define __underlying_strncpy __builtin_strncpy
> |                              ^
>>> include/linux/string.h:307:9: note: in expansion of macro '__underlying=
_strncpy'
> 307 |  return __underlying_strncpy(p, q, size);
> |         ^~~~~~~~~~~~~~~~~~~~
> In function 'strncpy',
> inlined from 'ips_send_cmd' at drivers/scsi/ips.c:3518:6:
> include/linux/string.h:297:30: warning: '__builtin_strncpy' output trunca=
ted before terminating nul copying 8 bytes from a string of the same length=
 [-Wstringop-truncation]
> 297 | #define __underlying_strncpy __builtin_strncpy
> |                              ^
>>> include/linux/string.h:307:9: note: in expansion of macro '__underlying=
_strncpy'
> 307 |  return __underlying_strncpy(p, q, size);
> |         ^~~~~~~~~~~~~~~~~~~~
> In function 'strncpy',
> inlined from 'ips_inquiry' at drivers/scsi/ips.c:4041:2:
> include/linux/string.h:297:30: warning: '__builtin_strncpy' output trunca=
ted before terminating nul copying 4 bytes from a string of the same length=
 [-Wstringop-truncation]
> 297 | #define __underlying_strncpy __builtin_strncpy
> |                              ^
>>> include/linux/string.h:307:9: note: in expansion of macro '__underlying=
_strncpy'
> 307 |  return __underlying_strncpy(p, q, size);
> |         ^~~~~~~~~~~~~~~~~~~~
> In function 'strncpy',
> inlined from 'ips_inquiry' at drivers/scsi/ips.c:4040:2:
> include/linux/string.h:297:30: warning: '__builtin_strncpy' output trunca=
ted before terminating nul copying 16 bytes from a string of the same lengt=
h [-Wstringop-truncation]
> 297 | #define __underlying_strncpy __builtin_strncpy
> |                              ^
>>> include/linux/string.h:307:9: note: in expansion of macro '__underlying=
_strncpy'
> 307 |  return __underlying_strncpy(p, q, size);
> |         ^~~~~~~~~~~~~~~~~~~~
> In function 'strncpy',
> inlined from 'ips_inquiry' at drivers/scsi/ips.c:4039:2:
> include/linux/string.h:297:30: warning: '__builtin_strncpy' output trunca=
ted before terminating nul copying 8 bytes from a string of the same length=
 [-Wstringop-truncation]
> 297 | #define __underlying_strncpy __builtin_strncpy
> |                              ^
>>> include/linux/string.h:307:9: note: in expansion of macro '__underlying=
_strncpy'
> 307 |  return __underlying_strncpy(p, q, size);
> |         ^~~~~~~~~~~~~~~~~~~~
> In function 'strncpy',
> inlined from 'ips_get_bios_version' at drivers/scsi/ips.c:2242:2:
> include/linux/string.h:297:30: warning: '__builtin_strncpy' output trunca=
ted before terminating nul copying 8 bytes from a string of the same length=
 [-Wstringop-truncation]
> 297 | #define __underlying_strncpy __builtin_strncpy
> |                              ^
>>> include/linux/string.h:307:9: note: in expansion of macro '__underlying=
_strncpy'
> 307 |  return __underlying_strncpy(p, q, size);
> |         ^~~~~~~~~~~~~~~~~~~~
> In function 'strncpy',
> inlined from 'ips_write_driver_status' at drivers/scsi/ips.c:5626:2:
> include/linux/string.h:297:30: warning: '__builtin_strncpy' output trunca=
ted before terminating nul copying 4 bytes from a string of the same length=
 [-Wstringop-truncation]
> 297 | #define __underlying_strncpy __builtin_strncpy
> |                              ^
>>> include/linux/string.h:307:9: note: in expansion of macro '__underlying=
_strncpy'
> 307 |  return __underlying_strncpy(p, q, size);
> |         ^~~~~~~~~~~~~~~~~~~~
> In function 'strncpy',
> inlined from 'ips_write_driver_status' at drivers/scsi/ips.c:5625:2:
> include/linux/string.h:297:30: warning: '__builtin_strncpy' output trunca=
ted before terminating nul copying 4 bytes from a string of the same length=
 [-Wstringop-truncation]
> 297 | #define __underlying_strncpy __builtin_strncpy
> |                              ^
>>> include/linux/string.h:307:9: note: in expansion of macro '__underlying=
_strncpy'
> 307 |  return __underlying_strncpy(p, q, size);
> |         ^~~~~~~~~~~~~~~~~~~~
> In function 'strncpy',
> inlined from 'ips_write_driver_status' at drivers/scsi/ips.c:5627:2,
> inlined from 'ips_hainit' at drivers/scsi/ips.c:2433:7:
> include/linux/string.h:297:30: warning: '__builtin_strncpy' output may be=
 truncated copying 4 bytes from a string of length 7 [-Wstringop-truncation]
> 297 | #define __underlying_strncpy __builtin_strncpy
> |                              ^
>>> include/linux/string.h:307:9: note: in expansion of macro '__underlying=
_strncpy'
> 307 |  return __underlying_strncpy(p, q, size);
> |         ^~~~~~~~~~~~~~~~~~~~
> In function 'strncpy',
> inlined from 'ips_write_driver_status' at drivers/scsi/ips.c:5628:2,
> inlined from 'ips_hainit' at drivers/scsi/ips.c:2433:7:
> include/linux/string.h:297:30: warning: '__builtin_strncpy' specified bou=
nd 4 equals destination size [-Wstringop-truncation]
> 297 | #define __underlying_strncpy __builtin_strncpy
> |                              ^
>>> include/linux/string.h:307:9: note: in expansion of macro '__underlying=
_strncpy'
> 307 |  return __underlying_strncpy(p, q, size);
> |         ^~~~~~~~~~~~~~~~~~~~
> --
> drivers/scsi/3w-sas.c: In function 'twl_scsiop_execute_scsi':
> drivers/scsi/3w-sas.c:298:22: warning: variable 'sglist' set but not used=
 [-Wunused-but-set-variable]
> 298 |  struct scatterlist *sglist =3D NULL, *sg;
> |                      ^~~~~~
> drivers/scsi/3w-sas.c: In function 'twl_scsi_biosparam':
> drivers/scsi/3w-sas.c:1411:23: warning: variable 'tw_dev' set but not use=
d [-Wunused-but-set-variable]
> 1411 |  TW_Device_Extension *tw_dev;
> |                       ^~~~~~
> In file included from include/linux/bitmap.h:9,
> from include/linux/nodemask.h:95,
> from include/linux/mmzone.h:17,
> from include/linux/gfp.h:6,
> from include/linux/umh.h:4,
> from include/linux/kmod.h:9,
> from include/linux/module.h:16,
> from drivers/scsi/3w-sas.c:53:
> In function 'strncpy',
> inlined from 'twl_reset_sequence' at drivers/scsi/3w-sas.c:1331:3:
> include/linux/string.h:297:30: warning: '__builtin_strncpy' output trunca=
ted before terminating nul copying 11 bytes from a string of the same lengt=
h [-Wstringop-truncation]
> 297 | #define __underlying_strncpy __builtin_strncpy
> |                              ^
>>> include/linux/string.h:307:9: note: in expansion of macro '__underlying=
_strncpy'
> 307 |  return __underlying_strncpy(p, q, size);
> |         ^~~~~~~~~~~~~~~~~~~~
> --
> In file included from include/linux/bitmap.h:9,
> from include/linux/nodemask.h:95,
> from include/linux/mmzone.h:17,
> from include/linux/gfp.h:6,
> from include/linux/slab.h:15,
> from include/linux/crypto.h:19,
> from include/crypto/hash.h:11,
> from include/linux/uio.h:10,
> from include/linux/socket.h:8,
> from include/uapi/linux/if.h:25,
> from include/scsi/libfc.h:12,
> from drivers/scsi/libfc/fc_elsct.c:17:
> In function 'strncpy',
> inlined from 'fc_ct_ms_fill.constprop' at include/scsi/fc_encode.h:263:3:
> include/linux/string.h:297:30: warning: '__builtin_strncpy' output may be=
 truncated copying 64 bytes from a string of length 79 [-Wstringop-truncati=
on]
> 297 | #define __underlying_strncpy __builtin_strncpy
> |                              ^
>>> include/linux/string.h:307:9: note: in expansion of macro '__underlying=
_strncpy'
> 307 |  return __underlying_strncpy(p, q, size);
> |         ^~~~~~~~~~~~~~~~~~~~
> In function 'strncpy',
> inlined from 'fc_ct_ms_fill.constprop' at include/scsi/fc_encode.h:275:3:
> include/linux/string.h:297:30: warning: '__builtin_strncpy' output may be=
 truncated copying 64 bytes from a string of length 79 [-Wstringop-truncati=
on]
> 297 | #define __underlying_strncpy __builtin_strncpy
> |                              ^
>>> include/linux/string.h:307:9: note: in expansion of macro '__underlying=
_strncpy'
> 307 |  return __underlying_strncpy(p, q, size);
> |         ^~~~~~~~~~~~~~~~~~~~
>
> vim +/__underlying_strncpy +307 include/linux/string.h
>
>    299	=

>    300	__FORTIFY_INLINE char *strncpy(char *p, const char *q, __kernel_si=
ze_t size)
>    301	{
>    302		size_t p_size =3D __builtin_object_size(p, 0);
>    303		if (__builtin_constant_p(size) && p_size < size)
>    304			__write_overflow();
>    305		if (p_size < size)
>    306			fortify_panic(__func__);
>  > 307		return __underlying_strncpy(p, q, size);
>    308	}
>    309	=

>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6061275630290820944==--

