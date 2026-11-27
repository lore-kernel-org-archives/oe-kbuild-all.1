Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795803290;
	b=R2kopvk1TEjT4jte/M0V3mxoTD3sm++DC1JtqAKdTS9uH28Hv7u6Et3/EN6Wh78LZpvM
	 3WQLLutGu7kMsIuqXNILapmaobo6u4ap5W6IxZ/E8HNGD7Ksta6LGqb+Ux2hCEPUDsldl
	 loGHHg3jLFzkvSKkLpCDscKyxVywT2FdcMVlV+aUTXQVnC00dios2Uzuza5glSQzeWhtg
	 3Y5wh0erZHP+w9vAgftBp4fc07sZskYIeCG92lrHYc/v9bmZ5LIClphs1sHFaffxuZscX
	 UqwMvgaCzFQB2oKbJYQBjZwbFEFk3arZTlFDkAXlz8DanJmTdkKgVJGLm+RXKH9ACsA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795803290;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=XsWDkZuANFPxIvD2x9Ll/EjMvtn1EUoMXN5wVYtIHaM=;
	b=0b8HvKR1n8TkmY7SlgK7yRUvFKsR0hx55kfsMsE8fEIn/n8npqdDrSw9KOJ6irfOboiK
	 5uA3Pf8BBfSQQegxQqBFZVM1/k06Gx6Kg7Rkstw/9qHrKRbZxOwKdXbn1Tfmc9U0e1se/
	 S97IgLWvvGWXAt9mN+2vdaFlGdElAPXt8rmg9N5A4ZqPz06v+n7dofhLpvwvw9gxlxlCu
	 8VujT53FQjzvCFYSmnCV1lcXiVZ1Nek7y89UdT1XErd/tYY9l6uUXsr/dfF9eNmwc8RsZ
	 OgcXB98OcPWhDnGR/OlGu0xoOGJCWkYXgDHpZJD+pk/I/RwKpE92Guy4c+tmRgi8AAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VQaYuHQo;
	arc=none smtp.remote-ip=198.175.65.11
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDD34606A689
	for <oe-kbuild-all@lists.linux.dev>; Fri, 27 Nov 2026 18:14:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EDD34606A689
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=VQaYuHQo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1795803288; x=1827339288;
  h=date:from:to:cc:subject:message-id;
  bh=LteNuJq34GS3Qeh9FIDwfvDD2OYzra6l9/oZbzT4qsw=;
  b=VQaYuHQoHrRnq8b/8rraAF/OCaZai6BZKK63ey0ZH131S9SxYbjZEOLn
   YMELA3qiVctmT+c6UQvVABeUh5Bw9yTI8LZj+uLynSUT4FsOLS3d9ptQ7
   JVTh/HZYDJOhDw/cXkbu0zNJ+9WcEPFRf8VEaeYHCk0fY7xvSd3wlcQJP
   eIYLWUMu0NXC57gDAilLcNptJTjt6bsZylBFRJlS+e5dWtUDV7BUZr3O4
   0mR/013bpp7vAbN6bO2Pd3jj9cdKwefd4xmmnOu2Sg/QS70ci7dNfREoB
   tM9UkZ/DllFuqM1uxq7kz2hd8yKNA7Nv5Bj2YDObGalOK0ozFEFVvEdMn
   g==;
X-CSE-ConnectionGUID: PowQGEHISV2Iv5zrUN00Jw==
X-CSE-MsgGUID: +8Ok/B52TzadgmOjFR0iHg==
X-IronPort-AV: E=McAfee;i="6800,10657,11979"; a="4611207"
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="4611207"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Nov 2026 10:14:47 -0800
X-CSE-ConnectionGUID: tFLWJjqFRbmyPH6yxDIDWw==
X-CSE-MsgGUID: vPaiEKoZRIezvzkFXhk+cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,237,1787036400"; 
   d="scan'208";a="12599886"
Received: from igk-lkp-server01.igk.intel.com (HELO 146cf1e082f1) ([10.211.93.152])
  by orviesa001.jf.intel.com with ESMTP; 27 Nov 2026 10:14:46 -0800
Received: from kbuild by 146cf1e082f1 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xX0T5-000000000IQ-2JGk;
	Fri, 27 Nov 2026 18:14:43 +0000
Date: Fri, 27 Nov 2026 19:14:16 +0100
From: kernel test robot <lkp@intel.com>
To: Jiri Kosina <jkosina@suse.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-input@vger.kernel.org
Subject: [hid:for-next 4/10] drivers/hid/hidraw.h:30:37: error:
 'HIDRAW_BUFFER_SIZE' undeclared here (not in a function); did you mean
 'HID_MAX_BUFFER_SIZE'?
Message-ID: <20261127191142.lxhwJp0x-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hid/hid.git for-next
head:   e61d3737e144924bc27c536a31da8147f1b55554
commit: 3203bc9bc0795c44c25ce7b7762eeb35f73e82c4 [4/10] Merge branch 'for-7.4/upstream-fixes' into for-next
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20261127/20261127191142.lxhwJp0x-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261127/20261127191142.lxhwJp0x-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/20261127191142.lxhwJp0x-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/hid/hid-core.c:37:
>> drivers/hid/hidraw.h:30:37: error: 'HIDRAW_BUFFER_SIZE' undeclared here (not in a function); did you mean 'HID_MAX_BUFFER_SIZE'?
      30 |         struct hidraw_report buffer[HIDRAW_BUFFER_SIZE];
         |                                     ^~~~~~~~~~~~~~~~~~
         |                                     HID_MAX_BUFFER_SIZE
--
>> drivers/hid/hidraw.c:34:8: error: redefinition of 'struct hidraw'
      34 | struct hidraw {
         |        ^~~~~~
   In file included from drivers/hid/hidraw.c:32:
   drivers/hid/hidraw.h:12:8: note: originally defined here
      12 | struct hidraw {
         |        ^~~~~~
>> drivers/hid/hidraw.c:45:8: error: redefinition of 'struct hidraw_report'
      45 | struct hidraw_report {
         |        ^~~~~~~~~~~~~
   drivers/hid/hidraw.h:24:8: note: originally defined here
      24 | struct hidraw_report {
         |        ^~~~~~~~~~~~~
>> drivers/hid/hidraw.c:50:8: error: redefinition of 'struct hidraw_list'
      50 | struct hidraw_list {
         |        ^~~~~~~~~~~
   drivers/hid/hidraw.h:29:8: note: originally defined here
      29 | struct hidraw_list {
         |        ^~~~~~~~~~~
   In file included from <command-line>:
   drivers/hid/hidraw.c: In function 'drop_ref':
>> include/linux/stddef.h:16:33: error: 'struct hidraw' has no member named 'rcu'
      16 | #define offsetof(TYPE, MEMBER)  __builtin_offsetof(TYPE, MEMBER)
         |                                 ^~~~~~~~~~~~~~~~~~
   include/linux/compiler_types.h:682:23: note: in definition of macro '__compiletime_assert'
     682 |                 if (!(condition))                                       \
         |                       ^~~~~~~~~
   include/linux/compiler_types.h:702:9: note: in expansion of macro '_compiletime_assert'
     702 |         _compiletime_assert(condition, msg, __compiletime_assert_, __COUNTER__)
         |         ^~~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:40:37: note: in expansion of macro 'compiletime_assert'
      40 | #define BUILD_BUG_ON_MSG(cond, msg) compiletime_assert(!(cond), msg)
         |                                     ^~~~~~~~~~~~~~~~~~
   include/linux/build_bug.h:51:9: note: in expansion of macro 'BUILD_BUG_ON_MSG'
      51 |         BUILD_BUG_ON_MSG(condition, "BUILD_BUG_ON failed: " #condition)
         |         ^~~~~~~~~~~~~~~~
   include/linux/rcupdate.h:1123:17: note: in expansion of macro 'BUILD_BUG_ON'
    1123 |                 BUILD_BUG_ON(offsetof(typeof(*(ptr)), kvrhf) >= 4096);  \
         |                 ^~~~~~~~~~~~
   include/linux/rcupdate.h:1123:30: note: in expansion of macro 'offsetof'
    1123 |                 BUILD_BUG_ON(offsetof(typeof(*(ptr)), kvrhf) >= 4096);  \
         |                              ^~~~~~~~
   include/linux/rcupdate.h:1084:29: note: in expansion of macro 'kvfree_rcu_arg_2'
    1084 | #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
         |                             ^~~~~~~~~~~~~~~~
   drivers/hid/hidraw.c:385:25: note: in expansion of macro 'kfree_rcu'
     385 |                         kfree_rcu(hidraw, rcu);
         |                         ^~~~~~~~~
   In file included from include/linux/rbtree.h:24,
                    from include/linux/mm_types.h:11,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/xarray.h:16,
                    from include/linux/list_lru.h:14,
                    from include/linux/fs/super_types.h:7,
                    from include/linux/fs/super.h:5,
                    from include/linux/fs.h:5,
                    from drivers/hid/hidraw.c:16:
>> include/linux/rcupdate.h:1124:61: error: 'struct hidraw' has no member named 'rcu'
    1124 |                 ___head = (struct kvfree_rcu_head *) &(___p)->kvrhf;    \
         |                                                             ^~
   include/linux/rcupdate.h:1084:29: note: in expansion of macro 'kvfree_rcu_arg_2'
    1084 | #define kfree_rcu(ptr, rhf) kvfree_rcu_arg_2(ptr, rhf)
         |                             ^~~~~~~~~~~~~~~~
   drivers/hid/hidraw.c:385:25: note: in expansion of macro 'kfree_rcu'
     385 |                         kfree_rcu(hidraw, rcu);
         |                         ^~~~~~~~~


vim +30 drivers/hid/hidraw.h

86166b7bcda0bcb include/linux/hidraw.h Jiri Kosina    2007-05-14  28  
86166b7bcda0bcb include/linux/hidraw.h Jiri Kosina    2007-05-14  29  struct hidraw_list {
86166b7bcda0bcb include/linux/hidraw.h Jiri Kosina    2007-05-14 @30  	struct hidraw_report buffer[HIDRAW_BUFFER_SIZE];
86166b7bcda0bcb include/linux/hidraw.h Jiri Kosina    2007-05-14  31  	int head;
86166b7bcda0bcb include/linux/hidraw.h Jiri Kosina    2007-05-14  32  	int tail;
86166b7bcda0bcb include/linux/hidraw.h Jiri Kosina    2007-05-14  33  	struct fasync_struct *fasync;
86166b7bcda0bcb include/linux/hidraw.h Jiri Kosina    2007-05-14  34  	struct hidraw *hidraw;
86166b7bcda0bcb include/linux/hidraw.h Jiri Kosina    2007-05-14  35  	struct list_head node;
86166b7bcda0bcb include/linux/hidraw.h Jiri Kosina    2007-05-14  36  	struct mutex read_mutex;
b31c9d9dc343146 include/linux/hidraw.h Peter Hutterer 2024-08-27  37  	bool revoked;
86166b7bcda0bcb include/linux/hidraw.h Jiri Kosina    2007-05-14  38  };
86166b7bcda0bcb include/linux/hidraw.h Jiri Kosina    2007-05-14  39  

:::::: The code at line 30 was first introduced by commit
:::::: 86166b7bcda0bcb53525114fa1c87ac432be478e HID: add hidraw interface

:::::: TO: Jiri Kosina <jkosina@suse.cz>
:::::: CC: Jiri Kosina <jkosina@suse.cz>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
