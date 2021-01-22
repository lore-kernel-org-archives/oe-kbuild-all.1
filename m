Content-Type: multipart/mixed; boundary="===============0365246967934059300=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: include/uapi/sound/asound.h:562:14: error: conflicting types for '__pad_before_uframe'
Date: Fri, 22 Jan 2021 10:21:36 +0800
Message-ID: <202101221020.BzdYLNeS-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0365246967934059300==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Arnd,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9f29bd8b2e7132b409178d1367dae1813017bd0e
commit: 80fe7430c7085951d1246d83f638cc17e6c0be36 ALSA: add new 32-bit layou=
t for snd_pcm_mmap_status/control
date:   1 year, 1 month ago
config: mips-randconfig-r034-20210122 (attached as .config)
compiler: mips-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D80fe7430c7085951d1246d83f638cc17e6c0be36
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 80fe7430c7085951d1246d83f638cc17e6c0be36
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dmips =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from arch/mips/include/uapi/asm/byteorder.h:13,
                    from arch/mips/include/asm/bitops.h:20,
                    from include/linux/bitops.h:26,
                    from include/linux/kernel.h:12,
                    from include/linux/clk.h:13,
                    from drivers/base/regmap/regmap-mmio.c:7:
   include/linux/byteorder/big_endian.h:8:2: warning: #warning inconsistent=
 configuration, needs CONFIG_CPU_BIG_ENDIAN [-Wcpp]
       8 | #warning inconsistent configuration, needs CONFIG_CPU_BIG_ENDIAN
         |  ^~~~~~~
   drivers/base/regmap/regmap-mmio.c: In function 'regmap_mmio_gen_context':
>> drivers/base/regmap/regmap-mmio.c:274:2: error: duplicate case value
     274 |  case REGMAP_ENDIAN_NATIVE:
         |  ^~~~
   drivers/base/regmap/regmap-mmio.c:246:2: note: previously used here
     246 |  case REGMAP_ENDIAN_NATIVE:
         |  ^~~~
--
   In file included from arch/mips/include/uapi/asm/byteorder.h:13,
                    from arch/mips/include/asm/bitops.h:20,
                    from include/linux/bitops.h:26,
                    from include/linux/kernel.h:12,
                    from include/asm-generic/bug.h:19,
                    from arch/mips/include/asm/bug.h:42,
                    from include/linux/bug.h:5,
                    from include/linux/mmdebug.h:5,
                    from include/linux/gfp.h:5,
                    from include/linux/slab.h:15,
                    from sound/core/sound.c:8:
   include/linux/byteorder/big_endian.h:8:2: warning: #warning inconsistent=
 configuration, needs CONFIG_CPU_BIG_ENDIAN [-Wcpp]
       8 | #warning inconsistent configuration, needs CONFIG_CPU_BIG_ENDIAN
         |  ^~~~~~~
   In file included from include/sound/asound.h:24,
                    from include/sound/control.h:12,
                    from sound/core/sound.c:15:
>> include/uapi/sound/asound.h:562:14: error: conflicting types for '__pad_=
before_uframe'
     562 | typedef char __pad_before_uframe[0];
         |              ^~~~~~~~~~~~~~~~~~~
   include/uapi/sound/asound.h:557:14: note: previous declaration of '__pad=
_before_uframe' was here
     557 | typedef char __pad_before_uframe[sizeof(__u64) - sizeof(snd_pcm_=
uframes_t)];
         |              ^~~~~~~~~~~~~~~~~~~
>> include/uapi/sound/asound.h:563:14: error: conflicting types for '__pad_=
after_uframe'
     563 | typedef char __pad_after_uframe[sizeof(__u64) - sizeof(snd_pcm_u=
frames_t)];
         |              ^~~~~~~~~~~~~~~~~~
   include/uapi/sound/asound.h:558:14: note: previous declaration of '__pad=
_after_uframe' was here
     558 | typedef char __pad_after_uframe[0];
         |              ^~~~~~~~~~~~~~~~~~
--
   In file included from arch/mips/include/uapi/asm/byteorder.h:13,
                    from arch/mips/include/asm/bitops.h:20,
                    from include/linux/bitops.h:26,
                    from include/linux/kernel.h:12,
                    from include/linux/delay.h:22,
                    from sound/core/timer.c:7:
   include/linux/byteorder/big_endian.h:8:2: warning: #warning inconsistent=
 configuration, needs CONFIG_CPU_BIG_ENDIAN [-Wcpp]
       8 | #warning inconsistent configuration, needs CONFIG_CPU_BIG_ENDIAN
         |  ^~~~~~~
   In file included from include/sound/asound.h:24,
                    from include/sound/timer.h:11,
                    from sound/core/timer.c:17:
>> include/uapi/sound/asound.h:562:14: error: conflicting types for '__pad_=
before_uframe'
     562 | typedef char __pad_before_uframe[0];
         |              ^~~~~~~~~~~~~~~~~~~
   include/uapi/sound/asound.h:557:14: note: previous declaration of '__pad=
_before_uframe' was here
     557 | typedef char __pad_before_uframe[sizeof(__u64) - sizeof(snd_pcm_=
uframes_t)];
         |              ^~~~~~~~~~~~~~~~~~~
>> include/uapi/sound/asound.h:563:14: error: conflicting types for '__pad_=
after_uframe'
     563 | typedef char __pad_after_uframe[sizeof(__u64) - sizeof(snd_pcm_u=
frames_t)];
         |              ^~~~~~~~~~~~~~~~~~
   include/uapi/sound/asound.h:558:14: note: previous declaration of '__pad=
_after_uframe' was here
     558 | typedef char __pad_after_uframe[0];
         |              ^~~~~~~~~~~~~~~~~~
   sound/core/timer.c: In function 'snd_timer_user_read':
   sound/core/timer.c:2219:19: warning: initialized field overwritten [-Wov=
erride-init]
    2219 |     .tstamp_sec =3D tread->tstamp_nsec,
         |                   ^~~~~
   sound/core/timer.c:2219:19: note: (near initialization for '(anonymous).=
tstamp_sec')
--
   In file included from arch/mips/include/uapi/asm/byteorder.h:13,
                    from arch/mips/include/asm/bitops.h:20,
                    from include/linux/bitops.h:26,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/preempt.h:11,
                    from include/linux/spinlock.h:51,
                    from include/linux/seqlock.h:36,
                    from include/linux/time.h:6,
                    from include/linux/compat.h:10,
                    from sound/core/pcm_native.c:7:
   include/linux/byteorder/big_endian.h:8:2: warning: #warning inconsistent=
 configuration, needs CONFIG_CPU_BIG_ENDIAN [-Wcpp]
       8 | #warning inconsistent configuration, needs CONFIG_CPU_BIG_ENDIAN
         |  ^~~~~~~
   In file included from include/sound/asound.h:24,
                    from include/sound/control.h:12,
                    from sound/core/pcm_native.c:19:
>> include/uapi/sound/asound.h:562:14: error: conflicting types for '__pad_=
before_uframe'
     562 | typedef char __pad_before_uframe[0];
         |              ^~~~~~~~~~~~~~~~~~~
   include/uapi/sound/asound.h:557:14: note: previous declaration of '__pad=
_before_uframe' was here
     557 | typedef char __pad_before_uframe[sizeof(__u64) - sizeof(snd_pcm_=
uframes_t)];
         |              ^~~~~~~~~~~~~~~~~~~
>> include/uapi/sound/asound.h:563:14: error: conflicting types for '__pad_=
after_uframe'
     563 | typedef char __pad_after_uframe[sizeof(__u64) - sizeof(snd_pcm_u=
frames_t)];
         |              ^~~~~~~~~~~~~~~~~~
   include/uapi/sound/asound.h:558:14: note: previous declaration of '__pad=
_after_uframe' was here
     558 | typedef char __pad_after_uframe[0];
         |              ^~~~~~~~~~~~~~~~~~
   sound/core/pcm_native.c: In function 'constrain_mask_params':
   sound/core/pcm_native.c:251:18: warning: variable 'old_mask' set but not=
 used [-Wunused-but-set-variable]
     251 |  struct snd_mask old_mask;
         |                  ^~~~~~~~
   sound/core/pcm_native.c: In function 'constrain_interval_params':
   sound/core/pcm_native.c:287:22: warning: variable 'old_interval' set but=
 not used [-Wunused-but-set-variable]
     287 |  struct snd_interval old_interval;
         |                      ^~~~~~~~~~~~
   sound/core/pcm_native.c: In function 'constrain_params_by_rules':
   sound/core/pcm_native.c:328:22: warning: variable 'old_interval' set but=
 not used [-Wunused-but-set-variable]
     328 |  struct snd_interval old_interval;
         |                      ^~~~~~~~~~~~
   sound/core/pcm_native.c:327:18: warning: variable 'old_mask' set but not=
 used [-Wunused-but-set-variable]
     327 |  struct snd_mask old_mask;
         |                  ^~~~~~~~
   sound/core/pcm_native.c: In function 'snd_pcm_hw_params_choose':
   sound/core/pcm_native.c:611:22: warning: variable 'old_interval' set but=
 not used [-Wunused-but-set-variable]
     611 |  struct snd_interval old_interval;
         |                      ^~~~~~~~~~~~
   sound/core/pcm_native.c:610:18: warning: variable 'old_mask' set but not=
 used [-Wunused-but-set-variable]
     610 |  struct snd_mask old_mask;
         |                  ^~~~~~~~
--
   In file included from arch/mips/include/uapi/asm/byteorder.h:13,
                    from arch/mips/include/asm/bitops.h:20,
                    from include/linux/bitops.h:26,
                    from lib/find_bit.c:15:
   include/linux/byteorder/big_endian.h:8:2: warning: #warning inconsistent=
 configuration, needs CONFIG_CPU_BIG_ENDIAN [-Wcpp]
       8 | #warning inconsistent configuration, needs CONFIG_CPU_BIG_ENDIAN
         |  ^~~~~~~
>> lib/find_bit.c:199:15: error: redefinition of 'find_next_zero_bit_le'
     199 | unsigned long find_next_zero_bit_le(const void *addr, unsigned
         |               ^~~~~~~~~~~~~~~~~~~~~
   In file included from arch/mips/include/asm/bitops.h:458,
                    from include/linux/bitops.h:26,
                    from lib/find_bit.c:15:
   include/asm-generic/bitops/le.h:12:29: note: previous definition of 'fin=
d_next_zero_bit_le' was here
      12 | static inline unsigned long find_next_zero_bit_le(const void *ad=
dr,
         |                             ^~~~~~~~~~~~~~~~~~~~~
>> lib/find_bit.c:208:15: error: redefinition of 'find_next_bit_le'
     208 | unsigned long find_next_bit_le(const void *addr, unsigned
         |               ^~~~~~~~~~~~~~~~
   In file included from arch/mips/include/asm/bitops.h:458,
                    from include/linux/bitops.h:26,
                    from lib/find_bit.c:15:
   include/asm-generic/bitops/le.h:18:29: note: previous definition of 'fin=
d_next_bit_le' was here
      18 | static inline unsigned long find_next_bit_le(const void *addr,
         |                             ^~~~~~~~~~~~~~~~
--
   In file included from arch/mips/include/uapi/asm/byteorder.h:13,
                    from arch/mips/include/asm/bitops.h:20,
                    from include/linux/bitops.h:26,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from lib/lzo/lzo1x_decompress_safe.c:16:
   include/linux/byteorder/big_endian.h:8:2: warning: #warning inconsistent=
 configuration, needs CONFIG_CPU_BIG_ENDIAN [-Wcpp]
       8 | #warning inconsistent configuration, needs CONFIG_CPU_BIG_ENDIAN
         |  ^~~~~~~
   In file included from lib/lzo/lzo1x_decompress_safe.c:21:
>> lib/lzo/lzodefs.h:33:2: error: #error "conflicting endian definitions"
      33 | #error "conflicting endian definitions"
         |  ^~~~~
--
   In file included from arch/mips/include/uapi/asm/byteorder.h:13,
                    from arch/mips/include/asm/bitops.h:20,
                    from include/linux/bitops.h:26,
                    from include/linux/kernel.h:12,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from lib/lzo/lzo1x_compress.c:15:
   include/linux/byteorder/big_endian.h:8:2: warning: #warning inconsistent=
 configuration, needs CONFIG_CPU_BIG_ENDIAN [-Wcpp]
       8 | #warning inconsistent configuration, needs CONFIG_CPU_BIG_ENDIAN
         |  ^~~~~~~
   In file included from lib/lzo/lzo1x_compress.c:19:
>> lib/lzo/lzodefs.h:33:2: error: #error "conflicting endian definitions"
      33 | #error "conflicting endian definitions"
         |  ^~~~~
   lib/lzo/lzo1x_compress.c:291:5: warning: no previous prototype for 'lzog=
eneric1x_1_compress' [-Wmissing-prototypes]
     291 | int lzogeneric1x_1_compress(const unsigned char *in, size_t in_l=
en,
         |     ^~~~~~~~~~~~~~~~~~~~~~~


vim +/__pad_before_uframe +562 include/uapi/sound/asound.h

   560	=

   561	#if defined(__BYTE_ORDER) ? __BYTE_ORDER =3D=3D __LITTLE_ENDIAN : de=
fined(__LITTLE_ENDIAN)
 > 562	typedef char __pad_before_uframe[0];
 > 563	typedef char __pad_after_uframe[sizeof(__u64) - sizeof(snd_pcm_ufram=
es_t)];
   564	#endif
   565	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============0365246967934059300==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
xCJCJ8H9D3PARdDUhwEA
--===============0365246967934059300==--

