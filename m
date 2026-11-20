Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795217179;
	b=hkyYxCei3cm8KLcgDD4rl9HKxYbhW3ywtfdDDIKoQHpaSeM/waAI4xmzbg0Jy0T4XizD
	 qHVD/eIi+FcRNxsI2hYpyUMcElphjbw5BHpQw9yDtCK63adSYxq98mr2BIzcldOkFuiDG
	 gRSolbPL5uKiIg2xkBuj8pKMHr4mXHPYS21ctJoR8T4H7li5nZdq0NR5sbP9eJCwFsapk
	 7Tz00HnPeme6utvjcKYW3k0S82Iv92UqS5dKINfGZjsiNzEvwKsZHaOTHxkVeKiAxUBvu
	 xqhI2RjawGerF65mQGqNB/CqmevvLfehKHrK72oX6KUHEu4te3yfqWlH1Ok1dWQ37+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795217179;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=HxNGyJ35hri0geA+PjED9R6TVp4HHaU3ucvR7577Fks=;
	b=42oo3x4Tfh2/Y+A398PuCZaNFTmgpv33Uhla1UHcKFoocC4Cka8TphTCkoeGhm4xefu6
	 lMOFDluDReolAKPkvMa/jfMgTlhG0w+OFcW/CcSJHRziXPa8+XQLCsUUsX6O+QhGmJXgp
	 cIb0BSeNEdtHi8ixlqkEDc/mUou9Tl5BaNQbUEQ0stDRuuIMfY0JGYYVZaOB+T8W/HFlE
	 qHJSVjtptrkZRS0MKvghuBd4CKMVDz7uhad1+mG8TSuNAqBK/CZ4n1yFhrXPzAjBVpFaD
	 xjMLuHSljH5Gs9Z/gOP8NpkIk8ZRiImwXYSi9tIKP1cS38NEsD3z2t3eNITvyMOfCaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EgsjNbIi;
	arc=none smtp.remote-ip=198.175.65.18
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9A4E606A69A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Nov 2026 23:26:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C9A4E606A69A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=EgsjNbIi
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795217174; x=1826753174;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Nbm7dttcg2VYnk3FmoiGwjR8294oJVUEhQthcpzoxPc=;
  b=EgsjNbIijb02s3t4/xW693lQ+QGSXRyuzrj+5MrJ3kFtP4d58lkWxHNm
   qv4EE1klHQ750QvJP1RbfJAWUWxYPiURuOlDGXeGo+YVWnWX82W9ZqzOi
   AfGQ6Fj3F9cdrRaEtBmjxCcpbg2svUy9TdLSjwwZZtQoau4L2ZFCiddlQ
   2wR9xJ/Sz1UfeYFOAVNs0sRzq6keV8o3tSKSXFkRSbNKEL8u5qC5THT9i
   gCvJ3CcnlAOe7KaATGGwhDrPesHIFU2U3q2WB+wxT9SK+5fiGPpjGahv8
   l15CNLFXbnzS9Rq21vH5Lk4AjWymqb7uTpimb3mbYhs+etHMlxPkAL/mM
   Q==;
X-CSE-ConnectionGUID: txidB9EsRR212tn+ytOlaw==
X-CSE-MsgGUID: wg5fNzIfSdaKCKKelob72g==
X-IronPort-AV: E=McAfee;i="6800,10657,11972"; a="4119572"
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="4119572"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Nov 2026 15:26:14 -0800
X-CSE-ConnectionGUID: idZQ6xneQb+zLcR8VejhGw==
X-CSE-MsgGUID: x+F/2N1QQ5GFCYNgl6siGQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,223,1787036400"; 
   d="scan'208";a="12811083"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa013.fm.intel.com with ESMTP; 20 Nov 2026 15:26:08 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xUXzZ-00000001IwJ-0y7s;
	Fri, 20 Nov 2026 23:26:05 +0000
Date: Sat, 21 Nov 2026 07:25:13 +0800
From: kernel test robot <lkp@intel.com>
To: Kyle Hendry via B4 Relay <devnull+khendry.reliablecontrols.com@kernel.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	=?iso-8859-1?Q?Cl=E9ment_L=E9ger?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Kyle Hendry <khendry@reliablecontrols.com>
Subject: Re: [PATCH 2/6] clk: renesas: r9a06g032: Add reset controller
Message-ID: <202611210721.sFAijXHV-lkp@intel.com>
References: <20261119-rzn1-miic-resets-v1-2-feee2bb28bb4@reliablecontrols.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261119-rzn1-miic-resets-v1-2-feee2bb28bb4@reliablecontrols.com>

Hi Kyle,

kernel test robot noticed the following build errors:

[auto build test ERROR on 662377fd1bb1d7cf4e97d312255fed868f56342d]

url:    https://github.com/intel-lab-lkp/linux/commits/Kyle-Hendry-via-B4-Relay/dt-bindings-clock-r9a06g032-sysctrl-Document-reset-cells/20261119-095743
base:   662377fd1bb1d7cf4e97d312255fed868f56342d
patch link:    https://lore.kernel.org/r/20261119-rzn1-miic-resets-v1-2-feee2bb28bb4%40reliablecontrols.com
patch subject: [PATCH 2/6] clk: renesas: r9a06g032: Add reset controller
config: arm-shmobile_defconfig (https://download.01.org/0day-ci/archive/20261121/202611210721.sFAijXHV-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261121/202611210721.sFAijXHV-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611210721.sFAijXHV-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:22,
                    from include/linux/clk.h:13,
                    from drivers/clk/renesas/r9a06g032-clocks.c:10:
   drivers/clk/renesas/r9a06g032-clocks.c: In function 'r9a06g032_reset_set':
>> include/linux/container_of.h:8:47: error: 'struct r9a06g032_priv' has no member named 'rcdev'
       8 | #define typeof_member(T, m)     typeof(((T*)0)->m)
         |                                               ^~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |                       ^~~~~~~~~~~
   include/linux/container_of.h:20:43: note: in expansion of macro 'typeof_member'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |                                           ^~~~~~~~~~~~~
   drivers/clk/renesas/r9a06g032-clocks.c:1317:33: note: in expansion of macro 'container_of'
    1317 | #define rcdev_to_priv(x)        container_of(x, struct r9a06g032_priv, rcdev)
         |                                 ^~~~~~~~~~~~
   drivers/clk/renesas/r9a06g032-clocks.c:1322:39: note: in expansion of macro 'rcdev_to_priv'
    1322 |         struct r9a06g032_priv *priv = rcdev_to_priv(rcdev);
         |                                       ^~~~~~~~~~~~~
>> include/linux/compiler_types.h:610:27: error: expression in static assertion is not an integer
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |                       ^~~~~~~~~~~
   drivers/clk/renesas/r9a06g032-clocks.c:1317:33: note: in expansion of macro 'container_of'
    1317 | #define rcdev_to_priv(x)        container_of(x, struct r9a06g032_priv, rcdev)
         |                                 ^~~~~~~~~~~~
   drivers/clk/renesas/r9a06g032-clocks.c:1322:39: note: in expansion of macro 'rcdev_to_priv'
    1322 |         struct r9a06g032_priv *priv = rcdev_to_priv(rcdev);
         |                                       ^~~~~~~~~~~~~
   In file included from include/uapi/linux/posix_types.h:5,
                    from include/uapi/linux/types.h:14,
                    from include/linux/types.h:5,
                    from include/linux/kasan-checks.h:5,
                    from include/asm-generic/rwonce.h:26,
                    from ./arch/arm/include/generated/asm/rwonce.h:1,
                    from include/linux/compiler.h:391,
                    from include/linux/err.h:5,
                    from include/linux/clk.h:12:
>> include/linux/stddef.h:16:33: error: 'struct r9a06g032_priv' has no member named 'rcdev'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:34: note: in expansion of macro 'offsetof'
      23 |         (type *)((void *)(ptr) - offsetof(type, member)); })
         |                                  ^~~~~~~~
   drivers/clk/renesas/r9a06g032-clocks.c:1317:33: note: in expansion of macro 'container_of'
    1317 | #define rcdev_to_priv(x)        container_of(x, struct r9a06g032_priv, rcdev)
         |                                 ^~~~~~~~~~~~
   drivers/clk/renesas/r9a06g032-clocks.c:1322:39: note: in expansion of macro 'rcdev_to_priv'
    1322 |         struct r9a06g032_priv *priv = rcdev_to_priv(rcdev);
         |                                       ^~~~~~~~~~~~~
   drivers/clk/renesas/r9a06g032-clocks.c: In function 'r9a06g032_reset_status':
>> include/linux/container_of.h:8:47: error: 'struct r9a06g032_priv' has no member named 'rcdev'
       8 | #define typeof_member(T, m)     typeof(((T*)0)->m)
         |                                               ^~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |                       ^~~~~~~~~~~
   include/linux/container_of.h:20:43: note: in expansion of macro 'typeof_member'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |                                           ^~~~~~~~~~~~~
   drivers/clk/renesas/r9a06g032-clocks.c:1317:33: note: in expansion of macro 'container_of'
    1317 | #define rcdev_to_priv(x)        container_of(x, struct r9a06g032_priv, rcdev)
         |                                 ^~~~~~~~~~~~
   drivers/clk/renesas/r9a06g032-clocks.c:1354:39: note: in expansion of macro 'rcdev_to_priv'
    1354 |         struct r9a06g032_priv *priv = rcdev_to_priv(rcdev);
         |                                       ^~~~~~~~~~~~~
>> include/linux/compiler_types.h:610:27: error: expression in static assertion is not an integer
     610 | #define __same_type(a, b) __builtin_types_compatible_p(typeof(a), typeof(b))
         |                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:80:56: note: in definition of macro '__static_assert'
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                                        ^~~~
   include/linux/container_of.h:20:9: note: in expansion of macro 'static_assert'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |         ^~~~~~~~~~~~~
   include/linux/container_of.h:20:23: note: in expansion of macro '__same_type'
      20 |         static_assert(__same_type(*(ptr), typeof_member(type, member)) || \
         |                       ^~~~~~~~~~~
   drivers/clk/renesas/r9a06g032-clocks.c:1317:33: note: in expansion of macro 'container_of'
    1317 | #define rcdev_to_priv(x)        container_of(x, struct r9a06g032_priv, rcdev)
         |                                 ^~~~~~~~~~~~
   drivers/clk/renesas/r9a06g032-clocks.c:1354:39: note: in expansion of macro 'rcdev_to_priv'
    1354 |         struct r9a06g032_priv *priv = rcdev_to_priv(rcdev);
         |                                       ^~~~~~~~~~~~~
>> include/linux/stddef.h:16:33: error: 'struct r9a06g032_priv' has no member named 'rcdev'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:23:34: note: in expansion of macro 'offsetof'
      23 |         (type *)((void *)(ptr) - offsetof(type, member)); })
         |                                  ^~~~~~~~
   drivers/clk/renesas/r9a06g032-clocks.c:1317:33: note: in expansion of macro 'container_of'
    1317 | #define rcdev_to_priv(x)        container_of(x, struct r9a06g032_priv, rcdev)
         |                                 ^~~~~~~~~~~~
   drivers/clk/renesas/r9a06g032-clocks.c:1354:39: note: in expansion of macro 'rcdev_to_priv'
    1354 |         struct r9a06g032_priv *priv = rcdev_to_priv(rcdev);
         |                                       ^~~~~~~~~~~~~
   drivers/clk/renesas/r9a06g032-clocks.c: In function 'r9a06g032_clocks_probe':
>> drivers/clk/renesas/r9a06g032-clocks.c:1463:15: error: 'struct r9a06g032_priv' has no member named 'rcdev'
    1463 |         clocks->rcdev.ops = &r9a06g032_reset_ops;
         |               ^~
   drivers/clk/renesas/r9a06g032-clocks.c:1464:15: error: 'struct r9a06g032_priv' has no member named 'rcdev'
    1464 |         clocks->rcdev.of_node = np;
         |               ^~
   drivers/clk/renesas/r9a06g032-clocks.c:1465:15: error: 'struct r9a06g032_priv' has no member named 'rcdev'
    1465 |         clocks->rcdev.of_reset_n_cells = 1;
         |               ^~
   drivers/clk/renesas/r9a06g032-clocks.c:1466:15: error: 'struct r9a06g032_priv' has no member named 'rcdev'
    1466 |         clocks->rcdev.nr_resets = ARRAY_SIZE(r9a06g032_resets);
         |               ^~
   drivers/clk/renesas/r9a06g032-clocks.c:1467:61: error: 'struct r9a06g032_priv' has no member named 'rcdev'
    1467 |         error =  devm_reset_controller_register(dev, &clocks->rcdev);
         |                                                             ^~


vim +8 include/linux/container_of.h

d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  4  
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08 @5  #include <linux/build_bug.h>
2b8e35337605ca5 Andy Shevchenko 2023-01-30  6  #include <linux/stddef.h>
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  7  
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08 @8  #define typeof_member(T, m)	typeof(((T*)0)->m)
d2a8ebbf8192b84 Andy Shevchenko 2021-11-08  9  

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
