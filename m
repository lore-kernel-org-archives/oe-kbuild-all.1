Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 803771AA1D2
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jan 2026 16:45:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769359515; cv=none; b=K8r3DH0WW4PTd1dPXv20GVBD3TEeajzxNIryfwTqGCF/1lbh/15zjum+roRBGmLCjjybEu4LxQTmOyKMbcwVofeySPfbZctOCn98mRkqQwIGS3vtf2/h242TFVoWPL3jKkYI6hrGIJtrWmsHjp5fKobMJXcNcnhnBMTb8XE0NZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769359515; c=relaxed/simple;
	bh=U/aw65XdgXQsKx44G3JuVvRunQbZFYlKJGb7nO5JAfk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=GPdY6IiAdCw2sJajRjaW8jOOn72ravaE+3+0qKInd9VH/CIFITglkPnBPgEZ7sXmoMK0YasB/j84jD/FX9Ic5JNHzj1uBeQbtepUEoMuV77WsltC0CkFNPM3GxgMyS8oUZ05zNPBDR/jYgXJHikBSvLNp15XSPkQtZtnVyL1B14=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=X1VWS+ps; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="X1VWS+ps"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1769359513; x=1800895513;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=U/aw65XdgXQsKx44G3JuVvRunQbZFYlKJGb7nO5JAfk=;
  b=X1VWS+psmtRAigAJfv+rUB5G+xmSE5+Im4GrTCCLfOiXnYz2RWn+NwaW
   YmkFHeNaUT+pJGvFQe1gQgqeyx6F0QpVz2KnLrXItCbfqX4drQ0jqgINl
   UI9SEUTTEdJktKPY7EIlJ+5mijxm46pgRo8sS3tdPwWdRJoQgsXbm4LWN
   uP3sVL5lSqrCadqtSscUE7b4YU4j+fX1G7Rg5YtlBCdyZpCZgCWxej/Aq
   +XaftqaSqtEMNFJ+9j4TITmXZhSxxn/PRQFLrhT5s+cGaTVoq2wj81tK9
   9Kjou5fdxpDoHCRsjcQpQBboMoLwHhSKt4S1yjdiC3UnvwYEnkCGATgU7
   g==;
X-CSE-ConnectionGUID: a89yWHazSfKNjxJNOKHKCg==
X-CSE-MsgGUID: XjpsR0psTvyPvkEldZkhDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11682"; a="70455503"
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="70455503"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jan 2026 08:45:13 -0800
X-CSE-ConnectionGUID: Ggur5pBrRj25EK7Hn6hBzw==
X-CSE-MsgGUID: IMHE942LRJqwDZ5CgLUQ6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,253,1763452800"; 
   d="scan'208";a="245100570"
Received: from igk-lkp-server01.igk.intel.com (HELO afc5bfd7f602) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 25 Jan 2026 08:45:12 -0800
Received: from kbuild by afc5bfd7f602 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vk3Eb-000000001JN-0149;
	Sun, 25 Jan 2026 16:45:09 +0000
Date: Sun, 25 Jan 2026 17:44:37 +0100
From: kernel test robot <lkp@intel.com>
To: "Thomas =?utf-8?Q?Wei=C3=9Fschuh"?= <linux@weissschuh.net>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thomas-weissschuh:b4/sysfs-const-driver-attribute 16/17]
 include/linux/container_of.h:36:9: warning: initialization discards 'const'
 qualifier from pointer target type
Message-ID: <202601251716.Ktu1c1eo-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/thomas.weissschuh/linux.git b4/sysfs-const-driver-attribute
head:   92cff81ee317b9c2c7c4e3bb80f46c9feddbfa9d
commit: 445ba0f479b21cc9310a99aefa9de3d53559eeb0 [16/17] x
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260125/202601251716.Ktu1c1eo-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260125/202601251716.Ktu1c1eo-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601251716.Ktu1c1eo-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/list.h:5,
                    from include/linux/module.h:12,
                    from drivers/input/serio/serio.c:14:
   drivers/input/serio/serio.c: In function 'description_show':
>> include/linux/container_of.h:36:9: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      36 |         _Generic(ptr,                                                   \
         |         ^~~~~~~~
   include/linux/serio.h:84:33: note: in expansion of macro 'container_of_const'
      84 | #define to_serio_driver(d)      container_of_const(d, struct serio_driver, driver)
         |                                 ^~~~~~~~~~~~~~~~~~
   drivers/input/serio/serio.c:707:39: note: in expansion of macro 'to_serio_driver'
     707 |         struct serio_driver *driver = to_serio_driver(drv);
         |                                       ^~~~~~~~~~~~~~~
   drivers/input/serio/serio.c: In function 'bind_mode_show':
>> include/linux/container_of.h:36:9: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      36 |         _Generic(ptr,                                                   \
         |         ^~~~~~~~
   include/linux/serio.h:84:33: note: in expansion of macro 'container_of_const'
      84 | #define to_serio_driver(d)      container_of_const(d, struct serio_driver, driver)
         |                                 ^~~~~~~~~~~~~~~~~~
   drivers/input/serio/serio.c:714:42: note: in expansion of macro 'to_serio_driver'
     714 |         struct serio_driver *serio_drv = to_serio_driver(drv);
         |                                          ^~~~~~~~~~~~~~~
   drivers/input/serio/serio.c: In function 'bind_mode_store':
>> include/linux/container_of.h:36:9: warning: initialization discards 'const' qualifier from pointer target type [-Wdiscarded-qualifiers]
      36 |         _Generic(ptr,                                                   \
         |         ^~~~~~~~
   include/linux/serio.h:84:33: note: in expansion of macro 'container_of_const'
      84 | #define to_serio_driver(d)      container_of_const(d, struct serio_driver, driver)
         |                                 ^~~~~~~~~~~~~~~~~~
   drivers/input/serio/serio.c:720:42: note: in expansion of macro 'to_serio_driver'
     720 |         struct serio_driver *serio_drv = to_serio_driver(drv);
         |                                          ^~~~~~~~~~~~~~~


vim +/const +36 include/linux/container_of.h

d2a8ebbf8192b8 Andy Shevchenko    2021-11-08   9  
d2a8ebbf8192b8 Andy Shevchenko    2021-11-08  10  /**
d2a8ebbf8192b8 Andy Shevchenko    2021-11-08  11   * container_of - cast a member of a structure out to the containing structure
d2a8ebbf8192b8 Andy Shevchenko    2021-11-08  12   * @ptr:	the pointer to the member.
d2a8ebbf8192b8 Andy Shevchenko    2021-11-08  13   * @type:	the type of the container struct this is embedded in.
d2a8ebbf8192b8 Andy Shevchenko    2021-11-08  14   * @member:	the name of the member within the struct.
d2a8ebbf8192b8 Andy Shevchenko    2021-11-08  15   *
7376e561fd2e01 Sakari Ailus       2022-10-24  16   * WARNING: any const qualifier of @ptr is lost.
35cff7af7598b9 Sakari Ailus       2025-05-20  17   * Do not use container_of() in new code.
d2a8ebbf8192b8 Andy Shevchenko    2021-11-08  18   */
d2a8ebbf8192b8 Andy Shevchenko    2021-11-08  19  #define container_of(ptr, type, member) ({				\
d2a8ebbf8192b8 Andy Shevchenko    2021-11-08  20  	void *__mptr = (void *)(ptr);					\
e1edc277e6f6df Rasmus Villemoes   2021-11-08  21  	static_assert(__same_type(*(ptr), ((type *)0)->member) ||	\
e1edc277e6f6df Rasmus Villemoes   2021-11-08  22  		      __same_type(*(ptr), void),			\
d2a8ebbf8192b8 Andy Shevchenko    2021-11-08  23  		      "pointer type mismatch in container_of()");	\
d2a8ebbf8192b8 Andy Shevchenko    2021-11-08  24  	((type *)(__mptr - offsetof(type, member))); })
d2a8ebbf8192b8 Andy Shevchenko    2021-11-08  25  
64f6a5d1922bf6 Greg Kroah-Hartman 2022-12-05  26  /**
64f6a5d1922bf6 Greg Kroah-Hartman 2022-12-05  27   * container_of_const - cast a member of a structure out to the containing
64f6a5d1922bf6 Greg Kroah-Hartman 2022-12-05  28   *			structure and preserve the const-ness of the pointer
64f6a5d1922bf6 Greg Kroah-Hartman 2022-12-05  29   * @ptr:		the pointer to the member
64f6a5d1922bf6 Greg Kroah-Hartman 2022-12-05  30   * @type:		the type of the container struct this is embedded in.
64f6a5d1922bf6 Greg Kroah-Hartman 2022-12-05  31   * @member:		the name of the member within the struct.
35cff7af7598b9 Sakari Ailus       2025-05-20  32   *
35cff7af7598b9 Sakari Ailus       2025-05-20  33   * Always prefer container_of_const() instead of container_of() in new code.
64f6a5d1922bf6 Greg Kroah-Hartman 2022-12-05  34   */
64f6a5d1922bf6 Greg Kroah-Hartman 2022-12-05  35  #define container_of_const(ptr, type, member)				\
64f6a5d1922bf6 Greg Kroah-Hartman 2022-12-05 @36  	_Generic(ptr,							\
64f6a5d1922bf6 Greg Kroah-Hartman 2022-12-05  37  		const typeof(*(ptr)) *: ((const type *)container_of(ptr, type, member)),\
64f6a5d1922bf6 Greg Kroah-Hartman 2022-12-05  38  		default: ((type *)container_of(ptr, type, member))	\
64f6a5d1922bf6 Greg Kroah-Hartman 2022-12-05  39  	)
64f6a5d1922bf6 Greg Kroah-Hartman 2022-12-05  40  

:::::: The code at line 36 was first introduced by commit
:::::: 64f6a5d1922bf6d2b2d845de20d4563a6f328e2d container_of: add container_of_const() that preserves const-ness of the pointer

:::::: TO: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
:::::: CC: Greg Kroah-Hartman <gregkh@linuxfoundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
