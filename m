Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793394481;
	b=UHl7p0fwwpqERp5dkxGWRyo2aQUrn4I7CC1o75vO7j/DHUbUHJCioAuHLnjbnuBMuQSB
	 ZIlTg/ccOLYIzlZJGgeOcpJqjsPSbOcyU8isafloIAhhrviFykJLr8rbBgZWuyiLeC0sX
	 aYhCIPJ246EiYde582Q6yGFRoH1Ybn/0364S25kr0nHDI1c2zYmqBUaXj7/RPOj8sF911
	 /k3kUZl/KMK6Ffdznd1xam++mdC9kkx4jIwPeD91TzTFprwycGAeM/2gQ8hhXTp4l+Gd7
	 Xe9F2oHPhCUsL8T1ZceOGEhvc8y9Qwfy3BSgbHcYcmT1qJBwcr9zPqO9U1NyLw78Zaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793394481;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=IZKe7cuC0MDYIi5/jI0F1g1F3O39CX9+Itd1K5q/4Jk=;
	b=pQi2IdUBwpNLHzkyWAqxTcqFybGzNcWh3RRL5rABOUFXmbKT399KdxBCkUcyHwLHTrrL
	 uvPkB7weW/VizX5JFnI/lIDjuGj4NF2rYRSzkoxhNdIwmNuFEa046gQRV5MnF49mRalo6
	 KnUV802VpC1pKrTbQlI6vAk/WHQcpMNFwyygM3w9uoDd3qm1yPjZsRMUVQYarxu+MQ4tp
	 DlH9OOPIOa90ZCZnFRh+wchNUOOBMXwm99OCL4aMYuly0duccwXcxKU8Y8oc5OuUsE1sp
	 zteK10EV+d+OltU+BWX2Bz3Xe7CDaVWan7rFXP2YJK7OELfwmp+xj/MGyOJvDKoY4Hg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RvRH0F3a;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28DE1606A31A
	for <oe-kbuild-all@lists.linux.dev>; Fri, 30 Oct 2026 21:07:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28DE1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=RvRH0F3a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793394481; x=1824930481;
  h=date:from:to:cc:subject:message-id;
  bh=YvWGlFegbhtROW+U0Cy/rU9cBGkxi9itGntZD3cVYAI=;
  b=RvRH0F3asXtF2EgdFx7Gx1oHAds0MN8Y8NKRb8fGYqtAaUvBXMBRO9Q4
   nKlXueRNlTWZVQ2uwhHZuyAm5824u8aJifUkaEandI1x/yl2Tpot6EWwm
   yobztPJk83kV+kHLfNZWDWR+tA54t5lUSuOSEM98Eib8v2q0Fcrd6vGG9
   QZhHRIRjeLNN7Iw+YErCxpZOEHQ0lXqBO636B2hHxyZ1OQjyEFNI8Feto
   En5nDzOn7EiPOPSOWfAppga+gv4Dwmx8SaVrVfHcnhCelQu2VaTLbuNEN
   u9v8ysEs2OnuhGv11xvmOCh2QYBCQqjflziakb7FKkrU8DMXfz8xUj9lV
   A==;
X-CSE-ConnectionGUID: XGKvT5siSv+63hghXZsecA==
X-CSE-MsgGUID: j0vGXhGPRymm3rQn39L/jg==
X-IronPort-AV: E=McAfee;i="6800,10657,11951"; a="2183083"
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="2183083"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2026 14:08:00 -0700
X-CSE-ConnectionGUID: RqzZp9XgTcy6kRblvXXkLg==
X-CSE-MsgGUID: F9xgDDn+R1exxR3Ykd5pYA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,186,1787036400"; 
   d="scan'208";a="5944765"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 30 Oct 2026 14:07:58 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xMtpL-00000000cEk-2MTO;
	Fri, 30 Oct 2026 21:07:55 +0000
Date: Sat, 31 Oct 2026 05:07:20 +0800
From: kernel test robot <lkp@intel.com>
To: Jonathan Flynn <jonathan.flynn@hammerspace.com>
Cc: oe-kbuild-all@lists.linux.dev, Mike Snitzer <snitzer@kernel.org>
Subject: [snitzer:kernel-7.3/main 308/382]
 include/linux/build_bug.h:80:41: error: static assertion failed:
 "!IS_ENABLED(CONFIG_SMP) || offsetof(struct nfs4_ff_layout_segment,
 mirror_array) + sizeof(struct nfs4_ff_layout_mirror *) <= offsetof(struct
 nfs4_ff_layout_segment, stripe_unit) + SMP_CACHE...
Message-ID: <202610310459.Q3bswxmc-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/snitzer/linux.git kernel-7.3/main
head:   c96933548628d84436aff2640c68fb4dfd47ea4a
commit: 3f46013bc402c9c99e8eeca7f7fb53055153d26a [308/382] pNFS/flexfiles: give the read-mostly layout segment fields their own cacheline
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20261031/202610310459.Q3bswxmc-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261031/202610310459.Q3bswxmc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610310459.Q3bswxmc-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:22,
                    from include/linux/uio.h:8,
                    from include/linux/socket.h:8,
                    from include/uapi/linux/in.h:25,
                    from include/linux/in.h:19,
                    from include/linux/nfs_fs.h:22,
                    from fs/nfs/flexfilelayout/flexfilelayout.c:10:
>> include/linux/build_bug.h:80:41: error: static assertion failed: "!IS_ENABLED(CONFIG_SMP) || offsetof(struct nfs4_ff_layout_segment, mirror_array) + sizeof(struct nfs4_ff_layout_mirror *) <= offsetof(struct nfs4_ff_layout_segment, stripe_unit) + SMP_CACHE_BYTES"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   fs/nfs/flexfilelayout/flexfilelayout.c:1092:1: note: in expansion of macro 'static_assert'
    1092 | static_assert(!IS_ENABLED(CONFIG_SMP) ||
         | ^~~~~~~~~~~~~
--
   In file included from include/linux/container_of.h:5,
                    from include/linux/kernel.h:22,
                    from include/linux/uio.h:8,
                    from include/linux/socket.h:8,
                    from include/uapi/linux/in.h:25,
                    from include/linux/in.h:19,
                    from include/linux/nfs_fs.h:22,
                    from flexfilelayout.c:10:
>> include/linux/build_bug.h:80:41: error: static assertion failed: "!IS_ENABLED(CONFIG_SMP) || offsetof(struct nfs4_ff_layout_segment, mirror_array) + sizeof(struct nfs4_ff_layout_mirror *) <= offsetof(struct nfs4_ff_layout_segment, stripe_unit) + SMP_CACHE_BYTES"
      80 | #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
         |                                         ^~~~~~~~~~~~~~
   include/linux/build_bug.h:79:34: note: in expansion of macro '__static_assert'
      79 | #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
         |                                  ^~~~~~~~~~~~~~~
   flexfilelayout.c:1092:1: note: in expansion of macro 'static_assert'
    1092 | static_assert(!IS_ENABLED(CONFIG_SMP) ||
         | ^~~~~~~~~~~~~


vim +80 include/linux/build_bug.h

bc6245e5efd70c Ian Abbott       2017-07-10  61  
6bab69c65013be Rasmus Villemoes 2019-03-07  62  /**
6bab69c65013be Rasmus Villemoes 2019-03-07  63   * static_assert - check integer constant expression at build time
6ffd853b0b10e1 Randy Dunlap     2026-03-01  64   * @expr: expression to be checked
6bab69c65013be Rasmus Villemoes 2019-03-07  65   *
6bab69c65013be Rasmus Villemoes 2019-03-07  66   * static_assert() is a wrapper for the C11 _Static_assert, with a
6bab69c65013be Rasmus Villemoes 2019-03-07  67   * little macro magic to make the message optional (defaulting to the
6bab69c65013be Rasmus Villemoes 2019-03-07  68   * stringification of the tested expression).
6bab69c65013be Rasmus Villemoes 2019-03-07  69   *
6bab69c65013be Rasmus Villemoes 2019-03-07  70   * Contrary to BUILD_BUG_ON(), static_assert() can be used at global
6bab69c65013be Rasmus Villemoes 2019-03-07  71   * scope, but requires the expression to be an integer constant
6bab69c65013be Rasmus Villemoes 2019-03-07  72   * expression (i.e., it is not enough that __builtin_constant_p() is
6bab69c65013be Rasmus Villemoes 2019-03-07  73   * true for expr).
6bab69c65013be Rasmus Villemoes 2019-03-07  74   *
6bab69c65013be Rasmus Villemoes 2019-03-07  75   * Also note that BUILD_BUG_ON() fails the build if the condition is
6bab69c65013be Rasmus Villemoes 2019-03-07  76   * true, while static_assert() fails the build if the expression is
6bab69c65013be Rasmus Villemoes 2019-03-07  77   * false.
6bab69c65013be Rasmus Villemoes 2019-03-07  78   */
6bab69c65013be Rasmus Villemoes 2019-03-07  79  #define static_assert(expr, ...) __static_assert(expr, ##__VA_ARGS__, #expr)
6bab69c65013be Rasmus Villemoes 2019-03-07 @80  #define __static_assert(expr, msg, ...) _Static_assert(expr, msg)
6bab69c65013be Rasmus Villemoes 2019-03-07  81  
07a368b3f55a79 Maxim Levitsky   2022-10-25  82  

:::::: The code at line 80 was first introduced by commit
:::::: 6bab69c65013bed5fce9f101a64a84d0385b3946 build_bug.h: add wrapper for _Static_assert

:::::: TO: Rasmus Villemoes <linux@rasmusvillemoes.dk>
:::::: CC: Linus Torvalds <torvalds@linux-foundation.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
