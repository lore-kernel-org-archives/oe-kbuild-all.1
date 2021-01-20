Content-Type: multipart/mixed; boundary="===============4165191095247242665=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH bpf-next 4/8] xsk: register XDP sockets at bind(), and add new AF_XDP BPF helper
Date: Wed, 20 Jan 2021 21:01:27 +0800
Message-ID: <202101202043.cg7vjYPH-lkp@intel.com>
In-Reply-To: <20210119153655.153999-5-bjorn.topel@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============4165191095247242665==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi "Bj=C3=B6rn,

I love your patch! Yet something to improve:

[auto build test ERROR on 95204c9bfa48d2f4d3bab7df55c1cc823957ff81]

url:    https://github.com/0day-ci/linux/commits/Bj-rn-T-pel/Introduce-bpf_=
redirect_xsk-helper/20210120-165233
base:    95204c9bfa48d2f4d3bab7df55c1cc823957ff81
config: nios2-randconfig-r034-20210120 (attached as .config)
compiler: nios2-linux-gcc (GCC) 9.3.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/0day-ci/linux/commit/e90e83e99e93790a73ecb4071=
ffd4366c75f12c0
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Bj-rn-T-pel/Introduce-bpf_redirect=
_xsk-helper/20210120-165233
        git checkout e90e83e99e93790a73ecb4071ffd4366c75f12c0
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
ARCH=3Dnios2 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

   In file included from <command-line>:
   net/core/filter.c: In function '____bpf_xdp_redirect_xsk':
>> net/core/filter.c:4165:35: error: 'struct netdev_rx_queue' has no member=
 named 'xsk'
    4165 |  xs =3D READ_ONCE(dev->_rx[queue_id].xsk);
         |                                   ^
   include/linux/compiler_types.h:300:9: note: in definition of macro '__co=
mpiletime_assert'
     300 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:320:2: note: in expansion of macro '_comp=
iletime_assert'
     320 |  _compiletime_assert(condition, msg, __compiletime_assert_, __CO=
UNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compilet=
ime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(=
long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__nativ=
e_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(=
long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compilet=
ime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/filter.c:4165:7: note: in expansion of macro 'READ_ONCE'
    4165 |  xs =3D READ_ONCE(dev->_rx[queue_id].xsk);
         |       ^~~~~~~~~
>> net/core/filter.c:4165:35: error: 'struct netdev_rx_queue' has no member=
 named 'xsk'
    4165 |  xs =3D READ_ONCE(dev->_rx[queue_id].xsk);
         |                                   ^
   include/linux/compiler_types.h:300:9: note: in definition of macro '__co=
mpiletime_assert'
     300 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:320:2: note: in expansion of macro '_comp=
iletime_assert'
     320 |  _compiletime_assert(condition, msg, __compiletime_assert_, __CO=
UNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compilet=
ime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(=
long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__nativ=
e_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(=
long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compilet=
ime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/filter.c:4165:7: note: in expansion of macro 'READ_ONCE'
    4165 |  xs =3D READ_ONCE(dev->_rx[queue_id].xsk);
         |       ^~~~~~~~~
>> net/core/filter.c:4165:35: error: 'struct netdev_rx_queue' has no member=
 named 'xsk'
    4165 |  xs =3D READ_ONCE(dev->_rx[queue_id].xsk);
         |                                   ^
   include/linux/compiler_types.h:300:9: note: in definition of macro '__co=
mpiletime_assert'
     300 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:320:2: note: in expansion of macro '_comp=
iletime_assert'
     320 |  _compiletime_assert(condition, msg, __compiletime_assert_, __CO=
UNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compilet=
ime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(=
long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__nativ=
e_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(=
long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compilet=
ime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/filter.c:4165:7: note: in expansion of macro 'READ_ONCE'
    4165 |  xs =3D READ_ONCE(dev->_rx[queue_id].xsk);
         |       ^~~~~~~~~
>> net/core/filter.c:4165:35: error: 'struct netdev_rx_queue' has no member=
 named 'xsk'
    4165 |  xs =3D READ_ONCE(dev->_rx[queue_id].xsk);
         |                                   ^
   include/linux/compiler_types.h:300:9: note: in definition of macro '__co=
mpiletime_assert'
     300 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:320:2: note: in expansion of macro '_comp=
iletime_assert'
     320 |  _compiletime_assert(condition, msg, __compiletime_assert_, __CO=
UNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compilet=
ime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(=
long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:21: note: in expansion of macro '__nativ=
e_word'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(=
long long), \
         |                     ^~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compilet=
ime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/filter.c:4165:7: note: in expansion of macro 'READ_ONCE'
    4165 |  xs =3D READ_ONCE(dev->_rx[queue_id].xsk);
         |       ^~~~~~~~~
>> net/core/filter.c:4165:35: error: 'struct netdev_rx_queue' has no member=
 named 'xsk'
    4165 |  xs =3D READ_ONCE(dev->_rx[queue_id].xsk);
         |                                   ^
   include/linux/compiler_types.h:300:9: note: in definition of macro '__co=
mpiletime_assert'
     300 |   if (!(condition))     \
         |         ^~~~~~~~~
   include/linux/compiler_types.h:320:2: note: in expansion of macro '_comp=
iletime_assert'
     320 |  _compiletime_assert(condition, msg, __compiletime_assert_, __CO=
UNTER__)
         |  ^~~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:36:2: note: in expansion of macro 'compilet=
ime_assert'
      36 |  compiletime_assert(__native_word(t) || sizeof(t) =3D=3D sizeof(=
long long), \
         |  ^~~~~~~~~~~~~~~~~~
   include/asm-generic/rwonce.h:49:2: note: in expansion of macro 'compilet=
ime_assert_rwonce_type'
      49 |  compiletime_assert_rwonce_type(x);    \
         |  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   net/core/filter.c:4165:7: note: in expansion of macro 'READ_ONCE'
    4165 |  xs =3D READ_ONCE(dev->_rx[queue_id].xsk);
         |       ^~~~~~~~~
>> net/core/filter.c:4165:35: error: 'struct netdev_rx_queue' has no member=
 named 'xsk'
    4165 |  xs =3D READ_ONCE(dev->_rx[queue_id].xsk);
         |                                   ^
   include/linux/compiler_types.h:271:13: note: in definition of macro '__u=
nqual_scalar_typeof'
     271 |   _Generic((x),      \
         |             ^
   include/asm-generic/rwonce.h:50:2: note: in expansion of macro '__READ_O=
NCE'
      50 |  __READ_ONCE(x);       \
         |  ^~~~~~~~~~~
   net/core/filter.c:4165:7: note: in expansion of macro 'READ_ONCE'
    4165 |  xs =3D READ_ONCE(dev->_rx[queue_id].xsk);
         |       ^~~~~~~~~
   In file included from ./arch/nios2/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:246,
                    from include/linux/kernel.h:10,
                    from include/linux/list.h:9,
                    from include/linux/module.h:12,
                    from net/core/filter.c:20:
>> net/core/filter.c:4165:35: error: 'struct netdev_rx_queue' has no member=
 named 'xsk'
    4165 |  xs =3D READ_ONCE(dev->_rx[queue_id].xsk);
         |                                   ^
   include/asm-generic/rwonce.h:44:72: note: in definition of macro '__READ=
_ONCE'
      44 | #define __READ_ONCE(x) (*(const volatile __unqual_scalar_typeof(=
x) *)&(x))
         |                                                                 =
       ^
   net/core/filter.c:4165:7: note: in expansion of macro 'READ_ONCE'
    4165 |  xs =3D READ_ONCE(dev->_rx[queue_id].xsk);
         |       ^~~~~~~~~

Kconfig warnings: (for reference only)
   WARNING: unmet direct dependencies detected for SERIAL_CORE_CONSOLE
   Depends on TTY && HAS_IOMEM
   Selected by
   - EARLY_PRINTK


vim +4165 net/core/filter.c

  4157	=

  4158	BPF_CALL_2(bpf_xdp_redirect_xsk, struct xdp_buff *, xdp, u64, action)
  4159	{
  4160		struct net_device *dev =3D xdp->rxq->dev;
  4161		u32 queue_id =3D xdp->rxq->queue_index;
  4162		struct bpf_redirect_info *ri;
  4163		struct xdp_sock *xs;
  4164	=

> 4165		xs =3D READ_ONCE(dev->_rx[queue_id].xsk);
  4166		if (!xs)
  4167			return action;
  4168	=

  4169		ri =3D this_cpu_ptr(&bpf_redirect_info);
  4170		ri->tgt_type =3D XDP_REDIR_XSK;
  4171		ri->tgt_value =3D xs;
  4172	=

  4173		return XDP_REDIRECT;
  4174	}
  4175	=


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org

--===============4165191095247242665==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

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
--===============4165191095247242665==--

