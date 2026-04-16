Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FEF54723
	for <oe-kbuild-all@lists.linux.dev>; Thu, 16 Apr 2026 01:06:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776301593; cv=none; b=keo1gnKmHGUZE+9wx6oUeCdu/7K2qlt83yr3qQEGlUcORnb5JaWJL9uFMJTmzLksc9Ns8zNF0L9CftwfXoKfVZBnThp1IjJVjWK6PPUEeZlyvyelQAvvE0aNCcIbR1pjdNQx/AJziEpz57bG2/cxmPMwBVlZRS3+VOEt8pLScQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776301593; c=relaxed/simple;
	bh=uq9sQlciTQwuiPuPiku8erRS7Ngl212BIwknGbAC5Zk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=sq3InHzRxoef3jWE5gEGKCLU9svrdFCtPOKuCxVzE4DFMwsR5OHqmG6trpM1MB+uZXZeiwcZcylLCUdevPVApJJrx5q8o2PAiqRt/xZC6A/Kwwq2j1Lmsd50C/tFpk8l+qUrvgtxeGM1DPKE4TSxUk4Qoj26r6uqvIa6xoz8rKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=D6y6R+WX; arc=none smtp.client-ip=192.198.163.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="D6y6R+WX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1776301591; x=1807837591;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=uq9sQlciTQwuiPuPiku8erRS7Ngl212BIwknGbAC5Zk=;
  b=D6y6R+WXIYW+Vx3jBepuDKAgoLcECiFzdk4CItI7JhrMOt8icCygD+W2
   X+GcCQTbJNDDw/ddXvdwx3t/4NlWyRD4kwHOmWihp2iIKy+axGh5ccou1
   bFWMWVDM8p3ryDC8OMYryu4ZqFK5ViN+3SNfHjBIgjTv7QDSdjB8yKrms
   fqbjtJht2L58shHB6HiTvgo3Op21d6QLsRKf+NpxuUt5Jp8qKohFWWVcj
   uIkwPySy9atDyj8KaZv3aXQFX1WZoQkV8dQKMAOF5zp28u1nkC6L/ScNI
   MvIQ0VCRDo2QVN6l6+O5OlvTQFTiADScWTD1TXSyB76s/P63Z1AK+hmN2
   w==;
X-CSE-ConnectionGUID: nnhGOfT/TVG2t8tLG+hbGA==
X-CSE-MsgGUID: mWE7K6ahToeSD50/V40C3w==
X-IronPort-AV: E=McAfee;i="6800,10657,11760"; a="87914183"
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="87914183"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by fmvoesa105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Apr 2026 18:06:30 -0700
X-CSE-ConnectionGUID: cpnojEsJT62JIPsicovXqg==
X-CSE-MsgGUID: S8iiwzGcR1yf22YQl7/Hzg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,181,1770624000"; 
   d="scan'208";a="226259277"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 15 Apr 2026 18:06:28 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wDBBb-000000000tJ-1Uv1;
	Thu, 16 Apr 2026 01:06:27 +0000
Date: Thu, 16 Apr 2026 03:05:38 +0200
From: kernel test robot <lkp@intel.com>
To: Alexander Lobakin <aleksander.lobakin@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [alobakin:libeth 8/8] include/linux/build_bug.h:80:41:
 error: static assertion failed: "offsetof(struct idpf_tx_queue,
 __cacheline_group_end__read_write) - offsetofend(struct idpf_tx_queue,
 __cacheline_group_begin__read_write) == (104 + __builtin_offsetof(struct
 idpf_tx_queue,...
Message-ID: <202604160220.Ekxe6WHC-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable

tree:   https://github.com/alobakin/linux libeth
head:   2f4cad2257c116e3f47b7547bdd3412637a16b32
commit: 2f4cad2257c116e3f47b7547bdd3412637a16b32 [8/8] idpf: add flow-based=
 XDP fallback for FWs without Tx FIFO support
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/202604=
16/202604160220.Ekxe6WHC-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=3D1 build): (https://download.01.org/0day-ci/archive=
/20260416/202604160220.Ekxe6WHC-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new versio=
n of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202604160220.Ekxe6WHC-lkp@i=
ntel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/minmax.h:5,
                    from include/linux/jiffies.h:8,
                    from include/net/pkt_sched.h:5,
                    from drivers/net/ethernet/intel/idpf/idpf.h:14,
                    from drivers/net/ethernet/intel/idpf/idpf_dev.c:4:
>> include/linux/build_bug.h:80:41: error: static assertion failed: "offset=
of(struct idpf_tx_queue, __cacheline_group_end__read_write) - offsetofend(s=
truct idpf_tx_queue, __cacheline_group_begin__read_write) =3D=3D (104 + __b=
uiltin_offsetof(struct idpf_tx_queue, cached_tstamp_caps) - (__builtin_offs=
etof(struct idpf_tx_queue, timer) + sizeof((((struct idpf_tx_queue *)0)->ti=
mer))) + __builtin_offsetof(struct idpf_tx_queue, q_stats) - (__builtin_off=
setof(struct idpf_tx_queue, tstamp_task) + sizeof((((struct idpf_tx_queue *=
)0)->tstamp_task))))"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_a=
ssert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/libeth/cache.h:17:9: note: in expansion of macro 'static_ass=
ert'
      17 |         static_assert(offsetof(type, __cacheline_group_end__##gr=
p) -          \
         |         ^~~~~~~~~~~~~
   include/net/libeth/cache.h:62:9: note: in expansion of macro 'libeth_cac=
heline_group_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);    =
              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:724:1: note: in expansion of=
 macro 'libeth_cacheline_set_assert'
     724 | libeth_cacheline_set_assert(struct idpf_tx_queue, 64,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/build_bug.h:80:41: error: static assertion failed: "sizeof=
(struct idpf_tx_queue) =3D=3D ((((((64)) + ((__typeof__((64)))(((1 << (6)))=
) - 1)) & ~((__typeof__((64)))(((1 << (6)))) - 1)) + ((((104 + __builtin_of=
fsetof(struct idpf_tx_queue, cached_tstamp_caps) - (__builtin_offsetof(stru=
ct idpf_tx_queue, timer) + sizeof((((struct idpf_tx_queue *)0)->timer))) + =
__builtin_offsetof(struct idpf_tx_queue, q_stats) - (__builtin_offsetof(str=
uct idpf_tx_queue, tstamp_task) + sizeof((((struct idpf_tx_queue *)0)->tsta=
mp_task))))) + ((__typeof__((104 + __builtin_offsetof(struct idpf_tx_queue,=
 cached_tstamp_caps) - (__builtin_offsetof(struct idpf_tx_queue, timer) + s=
izeof((((struct idpf_tx_queue *)0)->timer))) + __builtin_offsetof(struct id=
pf_tx_queue, q_stats) - (__builtin_offsetof(struct idpf_tx_queue, tstamp_ta=
sk) + sizeof((((struct idpf_tx_queue *)0)->tstamp_task))))))(((1 << (6)))) =
- 1)) & ~((__typeof__((104 + __builtin_offsetof(struct idpf_tx_queue, cache=
d_tstamp_caps) - (__builtin_offsetof(struct idpf_tx_queue, timer) + sizeof(=
(((struct idpf_tx_queue *)0)->timer))) + __builtin_offsetof(struct idpf_tx_=
queue, q_stats) - (__builtin_offsetof(struct idpf_tx_queue, tstamp_task) + =
sizeof((((struct idpf_tx_queue *)0)->tstamp_task))))))(((1 << (6)))) - 1)) =
+ ((((32)) + ((__typeof__((32)))(((1 << (6)))) - 1)) & ~((__typeof__((32)))=
(((1 << (6)))) - 1))))"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_a=
ssert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/libeth/cache.h:21:9: note: in expansion of macro 'static_ass=
ert'
      21 |         static_assert(sizeof(type) =3D=3D (sz))
         |         ^~~~~~~~~~~~~
   include/net/libeth/cache.h:48:9: note: in expansion of macro '__libeth_c=
acheline_struct_assert'
      48 |         __libeth_cacheline_struct_assert(type, __libeth_cls(__VA=
_ARGS__));    \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:64:9: note: in expansion of macro 'libeth_cac=
heline_struct_assert'
      64 |         libeth_cacheline_struct_assert(type, ro, rw, c)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/net/ethernet/intel/idpf/idpf_txrx.h:724:1: note: in expansion of=
 macro 'libeth_cacheline_set_assert'
     724 | libeth_cacheline_set_assert(struct idpf_tx_queue, 64,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
--
   In file included from include/linux/minmax.h:5,
                    from include/linux/jiffies.h:8,
                    from include/net/pkt_sched.h:5,
                    from idpf.h:14,
                    from idpf_dev.c:4:
>> include/linux/build_bug.h:80:41: error: static assertion failed: "offset=
of(struct idpf_tx_queue, __cacheline_group_end__read_write) - offsetofend(s=
truct idpf_tx_queue, __cacheline_group_begin__read_write) =3D=3D (104 + __b=
uiltin_offsetof(struct idpf_tx_queue, cached_tstamp_caps) - (__builtin_offs=
etof(struct idpf_tx_queue, timer) + sizeof((((struct idpf_tx_queue *)0)->ti=
mer))) + __builtin_offsetof(struct idpf_tx_queue, q_stats) - (__builtin_off=
setof(struct idpf_tx_queue, tstamp_task) + sizeof((((struct idpf_tx_queue *=
)0)->tstamp_task))))"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_a=
ssert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/libeth/cache.h:17:9: note: in expansion of macro 'static_ass=
ert'
      17 |         static_assert(offsetof(type, __cacheline_group_end__##gr=
p) -          \
         |         ^~~~~~~~~~~~~
   include/net/libeth/cache.h:62:9: note: in expansion of macro 'libeth_cac=
heline_group_assert'
      62 |         libeth_cacheline_group_assert(type, read_write, rw);    =
              \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   idpf_txrx.h:724:1: note: in expansion of macro 'libeth_cacheline_set_ass=
ert'
     724 | libeth_cacheline_set_assert(struct idpf_tx_queue, 64,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~
>> include/linux/build_bug.h:80:41: error: static assertion failed: "sizeof=
(struct idpf_tx_queue) =3D=3D ((((((64)) + ((__typeof__((64)))(((1 << (6)))=
) - 1)) & ~((__typeof__((64)))(((1 << (6)))) - 1)) + ((((104 + __builtin_of=
fsetof(struct idpf_tx_queue, cached_tstamp_caps) - (__builtin_offsetof(stru=
ct idpf_tx_queue, timer) + sizeof((((struct idpf_tx_queue *)0)->timer))) + =
__builtin_offsetof(struct idpf_tx_queue, q_stats) - (__builtin_offsetof(str=
uct idpf_tx_queue, tstamp_task) + sizeof((((struct idpf_tx_queue *)0)->tsta=
mp_task))))) + ((__typeof__((104 + __builtin_offsetof(struct idpf_tx_queue,=
 cached_tstamp_caps) - (__builtin_offsetof(struct idpf_tx_queue, timer) + s=
izeof((((struct idpf_tx_queue *)0)->timer))) + __builtin_offsetof(struct id=
pf_tx_queue, q_stats) - (__builtin_offsetof(struct idpf_tx_queue, tstamp_ta=
sk) + sizeof((((struct idpf_tx_queue *)0)->tstamp_task))))))(((1 << (6)))) =
- 1)) & ~((__typeof__((104 + __builtin_offsetof(struct idpf_tx_queue, cache=
d_tstamp_caps) - (__builtin_offsetof(struct idpf_tx_queue, timer) + sizeof(=
(((struct idpf_tx_queue *)0)->timer))) + __builtin_offsetof(struct idpf_tx_=
queue, q_stats) - (__builtin_offsetof(struct idpf_tx_queue, tstamp_task) + =
sizeof((((struct idpf_tx_queue *)0)->tstamp_task))))))(((1 << (6)))) - 1)) =
+ ((((32)) + ((__typeof__((32)))(((1 << (6)))) - 1)) & ~((__typeof__((32)))=
(((1 << (6)))) - 1))))"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_a=
ssert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_AR=
GS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   include/net/libeth/cache.h:21:9: note: in expansion of macro 'static_ass=
ert'
      21 |         static_assert(sizeof(type) =3D=3D (sz))
         |         ^~~~~~~~~~~~~
   include/net/libeth/cache.h:48:9: note: in expansion of macro '__libeth_c=
acheline_struct_assert'
      48 |         __libeth_cacheline_struct_assert(type, __libeth_cls(__VA=
_ARGS__));    \
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/net/libeth/cache.h:64:9: note: in expansion of macro 'libeth_cac=
heline_struct_assert'
      64 |         libeth_cacheline_struct_assert(type, ro, rw, c)
         |         ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   idpf_txrx.h:724:1: note: in expansion of macro 'libeth_cacheline_set_ass=
ert'
     724 | libeth_cacheline_set_assert(struct idpf_tx_queue, 64,
         | ^~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +80 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  61 =20
6bab69c65013be Rasmus Villemoes 2019-03-07  62  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  63   * static_assert - check in=
teger constant expression at build time
6ffd853b0b10e1 Randy Dunlap     2026-03-01  64   * @expr: expression to be =
checked
6bab69c65013be Rasmus Villemoes 2019-03-07  65   *
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * static_assert() is a wra=
pper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  67   * little macro magic to ma=
ke the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * stringification of the t=
ested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  69   *
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * Contrary to BUILD_BUG_ON=
(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * scope, but requires the =
expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  72   * expression (i.e., it is =
not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  74   *
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * Also note that BUILD_BUG=
_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  76   * true, while static_asser=
t() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  77   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  78   */
6bab69c65013be Rasmus Villemoes 2019-03-07  79  #define static_assert(expr,=
 ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @80  #define __static_assert(exp=
r, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  81 =20
07a368b3f55a79 Maxim Levitsky   2022-10-25  82 =20

:::::: The code at line 80 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper fo=
r _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--=20
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
