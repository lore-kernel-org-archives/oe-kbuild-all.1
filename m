Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4BCF30F92D
	for <oe-kbuild-all@lists.linux.dev>; Sat, 11 Apr 2026 18:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775933281; cv=none; b=BgpkRAA+vH5HQip/8sV+rwafjQR9fSJyElfxHCDofoLdrz2tBvEYPLyZ8Di02Yq2WKlus3g1OqTu8wOpw3FtWY25YFELGjuyJyiX85PQ5u05aJ5DkFJEpGj+/UOgeNrprh2XV4wMURlRA5RiBvZkCGf0qwPVqivlb4/7m6FiP4k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775933281; c=relaxed/simple;
	bh=8ihQ9nY78K6mOuIHsMgaeejPCU2oQimbBlXQD33+peg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=MWwfVwz4NwHenU5KvnIgAXyNUEAiO7TsY4c4Q0rkECaXpvIe+NMbxsPMaOYo+NHx2mfUwP5SGcpuXZ7kG4FBYj8JGZ170uE0zRGqovk3Y2CdfnWVf5sZE6gVnKQKvsV0/IkQSHIeF3E7o5KaZE7N2SCVNArxCuaIciUSDd5SSxw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UXu+MlDj; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UXu+MlDj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1775933279; x=1807469279;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=8ihQ9nY78K6mOuIHsMgaeejPCU2oQimbBlXQD33+peg=;
  b=UXu+MlDjipZusaGrVQP2Iu10COluywusc5JkVeEFm6ptu0/48pfNcVuh
   dJG3X1M44sm2L40AyZipN8KdNe8bjXhTkxzrzxWrp7wMGfDN2hljxmFgp
   jtl2vlKG0w95W2Tj7U/2SZwfEjBkHRY+zhTWC/Wi+VJInDp1OOjSuWp/v
   wLK9/vwiuMXEGLt2NAWgpi6TtNG8VsKKYnbQwfAO8ig4yBJZnx120LHZ8
   ayv8OWfRVztQyyVGZqKq3Z5UVtiew2zrzSNPvbMzAoOOYVX9ZbDQMhK5r
   1EQLfrXWb0YdapgGR8DS8QHdocEjvrtG2lYFuu5LjhY2+MvyFMvB6eYwv
   Q==;
X-CSE-ConnectionGUID: G/C+KJjTSZC/qvTKyljezQ==
X-CSE-MsgGUID: chajE4IETvahTSGF6Yx1pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11755"; a="76089523"
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="76089523"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2026 11:47:58 -0700
X-CSE-ConnectionGUID: zRcb+C2mROK5EVGyqYyV7A==
X-CSE-MsgGUID: CJvjnEAFQPiSdlLnzAfvGA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,173,1770624000"; 
   d="scan'208";a="229271826"
Received: from lkp-server01.sh.intel.com (HELO 3eaaf1a74b89) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 11 Apr 2026 11:47:56 -0700
Received: from kbuild by 3eaaf1a74b89 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wBdN3-000000001S9-3OMW;
	Sat, 11 Apr 2026 18:47:53 +0000
Date: Sun, 12 Apr 2026 02:47:41 +0800
From: kernel test robot <lkp@intel.com>
To: Drew Fustini <fustini@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev,
 Adrien Ricciardi <aricciardi@baylibre.com>
Subject: [fustini:b4/ssqosid-cbqri-rqsc 8/12]
 include/linux/iopoll.h:237:35: error: implicit declaration of function
 'readq'; did you mean 'readw'?
Message-ID: <202604120209.g4oLInNA-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git b=
4/ssqosid-cbqri-rqsc
head:   2f8f0ae94f0b804b7a3bf31c02899a3b9b70afa2
commit: d7f1ed01bd5347baa2e4d8ccdd2465fe212d56e4 [8/12] RISC-V: QoS: enable=
 resctrl support for Ssqosid
config: riscv-randconfig-001-20260412 (https://download.01.org/0day-ci/arch=
ive/20260412/202604120209.g4oLInNA-lkp@intel.com/config)
compiler: riscv32-linux-gcc (GCC) 13.4.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260412/202604120209.g4oLInNA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604120209.g4oLInNA-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   arch/riscv/kernel/qos/qos_resctrl.c: In function 'cbqri_set_cbm':
   arch/riscv/kernel/qos/qos_resctrl.c:40:9: error: implicit declaration of=
 function 'iowrite64'; did you mean 'iowrite32'? [-Werror=3Dimplicit-functi=
on-declaration]
      40 |         iowrite64(cbm, ctrl->base + reg_offset);
         |         ^~~~~~~~~
         |         iowrite32
   arch/riscv/kernel/qos/qos_resctrl.c: In function 'cbqri_set_rbwb':
   arch/riscv/kernel/qos/qos_resctrl.c:50:15: error: implicit declaration o=
f function 'ioread64'; did you mean 'ioread32'? [-Werror=3Dimplicit-functio=
n-declaration]
      50 |         reg =3D ioread64(ctrl->base + reg_offset);
         |               ^~~~~~~~
         |               ioread32
   In file included from arch/riscv/kernel/qos/qos_resctrl.c:7:
   arch/riscv/kernel/qos/qos_resctrl.c: In function 'cbqri_wait_busy_flag':
>> include/linux/iopoll.h:237:35: error: implicit declaration of function '=
readq'; did you mean 'readw'? [-Werror=3Dimplicit-function-declaration]
     237 |         readx_poll_timeout_atomic(readq, addr, val, cond, delay_=
us, timeout_us)
         |                                   ^~~~~
   include/linux/iopoll.h:102:17: note: in definition of macro 'poll_timeou=
t_us_atomic'
     102 |                 op; \
         |                 ^~
   include/linux/iopoll.h:213:9: note: in expansion of macro 'read_poll_tim=
eout_atomic'
     213 |         read_poll_timeout_atomic(op, val, cond, delay_us, timeou=
t_us, false, addr)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:237:9: note: in expansion of macro 'readx_poll_ti=
meout_atomic'
     237 |         readx_poll_timeout_atomic(readq, addr, val, cond, delay_=
us, timeout_us)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:72:15: note: in expansion of macro '=
readq_poll_timeout_atomic'
      72 |         ret =3D readq_poll_timeout_atomic(ctrl->base + reg_offse=
t, reg,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:48:27: warning: left shift count >=3D width of type=
 [-Wshift-count-overflow]
      48 |              (type_max(t) << (l) &                              \
         |                           ^~
   include/linux/iopoll.h:103:21: note: in definition of macro 'poll_timeou=
t_us_atomic'
     103 |                 if (cond) { \
         |                     ^~~~
   include/linux/iopoll.h:213:9: note: in expansion of macro 'read_poll_tim=
eout_atomic'
     213 |         read_poll_timeout_atomic(op, val, cond, delay_us, timeou=
t_us, false, addr)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:237:9: note: in expansion of macro 'readx_poll_ti=
meout_atomic'
     237 |         readx_poll_timeout_atomic(readq, addr, val, cond, delay_=
us, timeout_us)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:72:15: note: in expansion of macro '=
readq_poll_timeout_atomic'
      72 |         ret =3D readq_poll_timeout_atomic(ctrl->base + reg_offse=
t, reg,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:694:9: note: in expansion of macro '__com=
piletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_comp=
iletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletim=
e_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:9: note: in expansion of macro 'BUILD_BUG_ON=
_MSG'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >       =
        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:26: note: in expansion of macro '__bf_cast_u=
nsigned'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >       =
        \
         |                          ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:177:17: note: in expansion of macro '__BF_FIELD=
_CHECK_REG'
     177 |                 __BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: ")=
;       \
         |                 ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:73:42: note: in expansion of macro '=
FIELD_GET'
      73 |                                         !FIELD_GET(CBQRI_CONTROL=
_REGISTERS_BUSY_MASK, reg),
         |                                          ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GEN=
MASK'
      41 | #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)
         |                                              ^~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:73:52: note: in expansion of macro '=
CBQRI_CONTROL_REGISTERS_BUSY_MASK'
      73 |                                         !FIELD_GET(CBQRI_CONTROL=
_REGISTERS_BUSY_MASK, reg),
         |                                                    ^~~~~~~~~~~~~=
~~~~~~~~~~~~~~~~~~~~
   include/linux/bits.h:49:27: warning: right shift count >=3D width of typ=
e [-Wshift-count-overflow]
      49 |               type_max(t) >> (BITS_PER_TYPE(t) - 1 - (h)))))
         |                           ^~
   include/linux/iopoll.h:103:21: note: in definition of macro 'poll_timeou=
t_us_atomic'
     103 |                 if (cond) { \
         |                     ^~~~
   include/linux/iopoll.h:213:9: note: in expansion of macro 'read_poll_tim=
eout_atomic'
     213 |         read_poll_timeout_atomic(op, val, cond, delay_us, timeou=
t_us, false, addr)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/iopoll.h:237:9: note: in expansion of macro 'readx_poll_ti=
meout_atomic'
     237 |         readx_poll_timeout_atomic(readq, addr, val, cond, delay_=
us, timeout_us)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:72:15: note: in expansion of macro '=
readq_poll_timeout_atomic'
      72 |         ret =3D readq_poll_timeout_atomic(ctrl->base + reg_offse=
t, reg,
         |               ^~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:694:9: note: in expansion of macro '__com=
piletime_assert'
     694 |         __compiletime_assert(condition, msg, prefix, suffix)
         |         ^~~~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:706:9: note: in expansion of macro '_comp=
iletime_assert'
     706 |         _compiletime_assert(condition, msg, __compiletime_assert=
_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletim=
e_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), =
msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:9: note: in expansion of macro 'BUILD_BUG_ON=
_MSG'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >       =
        \
         |         ^~~~~~~~~~~~~~~~
   include/linux/bitfield.h:79:26: note: in expansion of macro '__bf_cast_u=
nsigned'
      79 |         BUILD_BUG_ON_MSG(__bf_cast_unsigned(mask, mask) >       =
        \
         |                          ^~~~~~~~~~~~~~~~~~
   include/linux/bitfield.h:177:17: note: in expansion of macro '__BF_FIELD=
_CHECK_REG'
     177 |                 __BF_FIELD_CHECK_REG(_mask, _reg, "FIELD_GET: ")=
;       \
         |                 ^~~~~~~~~~~~~~~~~~~~
   arch/riscv/kernel/qos/qos_resctrl.c:73:42: note: in expansion of macro '=
FIELD_GET'
      73 |                                         !FIELD_GET(CBQRI_CONTROL=
_REGISTERS_BUSY_MASK, reg),
         |                                          ^~~~~~~~~
   include/linux/bits.h:51:33: note: in expansion of macro 'GENMASK_TYPE'
      51 | #define GENMASK(h, l)           GENMASK_TYPE(unsigned long, h, l)
         |                                 ^~~~~~~~~~~~
   arch/riscv/kernel/qos/internal.h:41:46: note: in expansion of macro 'GEN=
MASK'
      41 | #define CBQRI_CONTROL_REGISTERS_BUSY_MASK    GENMASK(39, 39)


vim +237 include/linux/iopoll.h

57a29df341466b Kai-Heng Feng      2020-04-25  122 =20
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  123  /**
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  124   * read_poll_t=
imeout - Periodically poll an address until a condition is
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  125   *            =
         met or a timeout occurs
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  126   * @op: access=
or function (takes @args as its arguments)
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  127   * @val: Varia=
ble to read the value into
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  128   * @cond: Brea=
k condition (usually involving @val)
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  129   * @sleep_us: =
Maximum time to sleep between reads in us (0 tight-loops). Please
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  130   *            =
read usleep_range() function description for details and
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  131   *            =
limitations.
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  132   * @timeout_us=
: Timeout in us, 0 means never timeout
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  133   * @sleep_befo=
re_read: if it is true, sleep @sleep_us before read.
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  134   * @args: argu=
ments for @op poll
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  135   *
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  136   * When availa=
ble, you'll probably want to use one of the specialized
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  137   * macros defi=
ned below rather than this macro directly.
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  138   *
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  139   * Returns: 0 =
on success and -ETIMEDOUT upon a timeout. In either
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  140   * case, the l=
ast read value at @args is stored in @val. Must not
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  141   * be called f=
rom atomic context if sleep_us or timeout_us are used.
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  142   */
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  143  #define read_p=
oll_timeout(op, val, cond, sleep_us, timeout_us, \
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  144  			  sleep_bef=
ore_read, args...) \
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  145  	poll_timeout_=
us((val) =3D op(args), cond, sleep_us, timeout_us, sleep_before_read)
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  146 =20
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  147  /**
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  148   * read_poll_t=
imeout_atomic - Periodically poll an address until a condition is
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  149   *            =
                met or a timeout occurs
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  150   * @op: access=
or function (takes @args as its arguments)
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  151   * @val: Varia=
ble to read the value into
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  152   * @cond: Brea=
k condition (usually involving @val)
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  153   * @delay_us: =
Time to udelay between reads in us (0 tight-loops). Please
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  154   *            =
read udelay() function description for details and
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  155   *            =
limitations.
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  156   * @timeout_us=
: Timeout in us, 0 means never timeout
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  157   * @delay_befo=
re_read: if it is true, delay @delay_us before read.
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  158   * @args: argu=
ments for @op poll
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  159   *
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  160   * This macro =
does not rely on timekeeping.  Hence it is safe to call even when
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  161   * timekeeping=
 is suspended, at the expense of an underestimation of wall clock
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  162   * time, which=
 is rather minimal with a non-zero delay_us.
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  163   *
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  164   * When availa=
ble, you'll probably want to use one of the specialized
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  165   * macros defi=
ned below rather than this macro directly.
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  166   *
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  167   * Returns: 0 =
on success and -ETIMEDOUT upon a timeout. In either
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  168   * case, the l=
ast read value at @args is stored in @val.
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  169   */
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  170  #define read_p=
oll_timeout_atomic(op, val, cond, sleep_us, timeout_us, \
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  171  				 sleep_bef=
ore_read, args...) \
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  172  	poll_timeout_=
us_atomic((val) =3D op(args), cond, sleep_us, timeout_us, sleep_before_read)
9df8043a546d2e Ville Syrj=C3=A4l=C3=A4      2025-08-26  173 =20
54c523127bcca9 Matt Wagantall     2014-12-15  174  /**
54c523127bcca9 Matt Wagantall     2014-12-15  175   * readx_poll_timeout - =
Periodically poll an address until a condition is met or a timeout occurs
54c523127bcca9 Matt Wagantall     2014-12-15  176   * @op: accessor functio=
n (takes @addr as its only argument)
54c523127bcca9 Matt Wagantall     2014-12-15  177   * @addr: Address to poll
54c523127bcca9 Matt Wagantall     2014-12-15  178   * @val: Variable to rea=
d the value into
54c523127bcca9 Matt Wagantall     2014-12-15  179   * @cond: Break conditio=
n (usually involving @val)
89124747f096fc Anna-Maria Behnsen 2024-10-14  180   * @sleep_us: Maximum ti=
me to sleep between reads in us (0 tight-loops). Please
89124747f096fc Anna-Maria Behnsen 2024-10-14  181   *            read uslee=
p_range() function description for details and
89124747f096fc Anna-Maria Behnsen 2024-10-14  182   *            limitation=
s.
54c523127bcca9 Matt Wagantall     2014-12-15  183   * @timeout_us: Timeout =
in us, 0 means never timeout
54c523127bcca9 Matt Wagantall     2014-12-15  184   *
54c523127bcca9 Matt Wagantall     2014-12-15  185   * When available, you'l=
l probably want to use one of the specialized
54c523127bcca9 Matt Wagantall     2014-12-15  186   * macros defined below =
rather than this macro directly.
89124747f096fc Anna-Maria Behnsen 2024-10-14  187   *
89124747f096fc Anna-Maria Behnsen 2024-10-14  188   * Returns: 0 on success=
 and -ETIMEDOUT upon a timeout. In either
89124747f096fc Anna-Maria Behnsen 2024-10-14  189   * case, the last read v=
alue at @addr is stored in @val. Must not
89124747f096fc Anna-Maria Behnsen 2024-10-14  190   * be called from atomic=
 context if sleep_us or timeout_us are used.
54c523127bcca9 Matt Wagantall     2014-12-15  191   */
54c523127bcca9 Matt Wagantall     2014-12-15  192  #define readx_poll_timeo=
ut(op, addr, val, cond, sleep_us, timeout_us)	\
eaa6b01024a74a Dejin Zheng        2020-03-23  193  	read_poll_timeout(op, v=
al, cond, sleep_us, timeout_us, false, addr)
54c523127bcca9 Matt Wagantall     2014-12-15  194 =20
54c523127bcca9 Matt Wagantall     2014-12-15  195  /**
54c523127bcca9 Matt Wagantall     2014-12-15  196   * readx_poll_timeout_at=
omic - Periodically poll an address until a condition is met or a timeout o=
ccurs
54c523127bcca9 Matt Wagantall     2014-12-15  197   * @op: accessor functio=
n (takes @addr as its only argument)
54c523127bcca9 Matt Wagantall     2014-12-15  198   * @addr: Address to poll
54c523127bcca9 Matt Wagantall     2014-12-15  199   * @val: Variable to rea=
d the value into
54c523127bcca9 Matt Wagantall     2014-12-15  200   * @cond: Break conditio=
n (usually involving @val)
89124747f096fc Anna-Maria Behnsen 2024-10-14  201   * @delay_us: Time to ud=
elay between reads in us (0 tight-loops). Please
89124747f096fc Anna-Maria Behnsen 2024-10-14  202   *            read udela=
y() function description for details and
89124747f096fc Anna-Maria Behnsen 2024-10-14  203   *            limitation=
s.
54c523127bcca9 Matt Wagantall     2014-12-15  204   * @timeout_us: Timeout =
in us, 0 means never timeout
54c523127bcca9 Matt Wagantall     2014-12-15  205   *
54c523127bcca9 Matt Wagantall     2014-12-15  206   * When available, you'l=
l probably want to use one of the specialized
54c523127bcca9 Matt Wagantall     2014-12-15  207   * macros defined below =
rather than this macro directly.
89124747f096fc Anna-Maria Behnsen 2024-10-14  208   *
89124747f096fc Anna-Maria Behnsen 2024-10-14  209   * Returns: 0 on success=
 and -ETIMEDOUT upon a timeout. In either
89124747f096fc Anna-Maria Behnsen 2024-10-14  210   * case, the last read v=
alue at @addr is stored in @val.
54c523127bcca9 Matt Wagantall     2014-12-15  211   */
54c523127bcca9 Matt Wagantall     2014-12-15  212  #define readx_poll_timeo=
ut_atomic(op, addr, val, cond, delay_us, timeout_us) \
57a29df341466b Kai-Heng Feng      2020-04-25  213  	read_poll_timeout_atomi=
c(op, val, cond, delay_us, timeout_us, false, addr)
54c523127bcca9 Matt Wagantall     2014-12-15  214 =20
54c523127bcca9 Matt Wagantall     2014-12-15  215  #define readb_poll_timeo=
ut(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15  216  	readx_poll_timeout(read=
b, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  217 =20
54c523127bcca9 Matt Wagantall     2014-12-15  218  #define readb_poll_timeo=
ut_atomic(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15  219  	readx_poll_timeout_atom=
ic(readb, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  220 =20
54c523127bcca9 Matt Wagantall     2014-12-15  221  #define readw_poll_timeo=
ut(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15  222  	readx_poll_timeout(read=
w, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  223 =20
54c523127bcca9 Matt Wagantall     2014-12-15  224  #define readw_poll_timeo=
ut_atomic(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15  225  	readx_poll_timeout_atom=
ic(readw, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  226 =20
54c523127bcca9 Matt Wagantall     2014-12-15  227  #define readl_poll_timeo=
ut(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15  228  	readx_poll_timeout(read=
l, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  229 =20
54c523127bcca9 Matt Wagantall     2014-12-15  230  #define readl_poll_timeo=
ut_atomic(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15  231  	readx_poll_timeout_atom=
ic(readl, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  232 =20
54c523127bcca9 Matt Wagantall     2014-12-15  233  #define readq_poll_timeo=
ut(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15  234  	readx_poll_timeout(read=
q, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  235 =20
54c523127bcca9 Matt Wagantall     2014-12-15  236  #define readq_poll_timeo=
ut_atomic(addr, val, cond, delay_us, timeout_us) \
54c523127bcca9 Matt Wagantall     2014-12-15 @237  	readx_poll_timeout_atom=
ic(readq, addr, val, cond, delay_us, timeout_us)
54c523127bcca9 Matt Wagantall     2014-12-15  238 =20

:::::: The code at line 237 was first introduced by commit
:::::: 54c523127bcca986c6f9b04c7b56a949ea011899 iopoll: Introduce memory-ma=
pped IO polling macros

:::::: TO: Matt Wagantall <mattw@codeaurora.org>
:::::: CC: Will Deacon <will.deacon@arm.com>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
