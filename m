Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D0B72621
	for <oe-kbuild-all@lists.linux.dev>; Sat,  8 Aug 2026 07:45:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786175104; cv=none; b=j/txs59MwqeKtc5N3joJnF+//PVTcJMLFUomt2Oo9TK9MkmP+sD2qm+bi/6qsTcqb0RpkFfVZuZJh+kO+AmXjWl2YznLe89r0a1Qd/heSvxfrHcOLQjorSPnaAX/2QmKIogzwUBq3iaD4rldGmB3MXWtAF2BEFOeXdaryQvdwOo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786175104; c=relaxed/simple;
	bh=+pR+p0IQgWcuom0wI2YuJ6dEQ5svfyDIY29IARDhpaQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=E5oqD7xeAZvj8svuSdPJff9jkkopOVJH0zxBzzcB4ameiuAOu+QIMi85LN9Nf4rtpxKAJuivlb6vkCo4nD9YfJ+5aO2crUSHxHOWYD+qKSWJj/bVmoNJrEogXDTuHbv7QJ7VakP33MMLwBc13lpEyuQxnabkS6DLuFxnc21zDEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=LqQHFh8C; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LqQHFh8C"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786175102; x=1817711102;
  h=date:from:to:cc:subject:message-id;
  bh=+pR+p0IQgWcuom0wI2YuJ6dEQ5svfyDIY29IARDhpaQ=;
  b=LqQHFh8CesIrSYoNXotnI2l6wuvcJuTanJtWlgCezctKhEv3DmqbS//H
   9CLdr2H68lnQHE7iKKxpOA3UlaoAHJbX6zQ9datgzB11pIIneZ2pG6xIh
   KZHUpL2zE709zF1F1y9+m6Pf1JZVfsqITQs6vtI+Cz1y8Vw7zer47/o1t
   xZjeuEEllwFuVjlUb0DHufbetujOSI/iTr0qHguME7pNRWgmOQ5PhaiBP
   DY8f1kvulnZHyG9JVKd3j5Ry1U7LqB1UkmPrJrBAZOAvzeb219ZvZFS+W
   Ood7GueZZyZsDj4NSPScez6e4df/aMd+GNZmjc5oAhA+wyQLOdLJ1P/QV
   w==;
X-CSE-ConnectionGUID: +vjLkFQuSIywQdhVNDYGZQ==
X-CSE-MsgGUID: mF296eFhR4+V428PXCw4SA==
X-IronPort-AV: E=McAfee;i="6800,10657,11868"; a="86714733"
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="86714733"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Aug 2026 00:44:56 -0700
X-CSE-ConnectionGUID: MgsSlfRaSzmHOJgCDJHnqw==
X-CSE-MsgGUID: ecJi/nuVQV69zPp/GcrXQQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,211,1779174000"; 
   d="scan'208";a="261296210"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 08 Aug 2026 00:44:54 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wsbjg-00000000Jy9-07Sl;
	Sat, 08 Aug 2026 07:44:52 +0000
Date: Sat, 08 Aug 2026 15:44:11 +0800
From: kernel test robot <lkp@intel.com>
To: Julian Braha <julianbraha@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Helge Deller <deller@gmx.de>
Subject: [linux-next:master 7580/13846]
 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c:571:8: warning: unused variable
 'dev_attr_dispregs'
Message-ID: <202608081537.o23Goj8d-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   6b8c8af514d739d0335f5579b585e02babe8a727
commit: 0738ecee1ab15aa75d2ea433e636d8cbf25623de [7580/13846] fbdev: mb862xx: replace dead select with dependency
config: powerpc64-randconfig-r054-20260808 (https://download.01.org/0day-ci/archive/20260808/202608081537.o23Goj8d-lkp@intel.com/config)
compiler: clang version 17.0.6 (https://github.com/llvm/llvm-project 6009708b4367171ccdbf4b5905cb6a803753fe18)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260808/202608081537.o23Goj8d-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608081537.o23Goj8d-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/video/fbdev/mb862xx/mb862xxfbdrv.c:411:12: warning: unused function 'mb862xxfb_init_fbinfo' [-Wunused-function]
     411 | static int mb862xxfb_init_fbinfo(struct fb_info *fbi)
         |            ^~~~~~~~~~~~~~~~~~~~~
>> drivers/video/fbdev/mb862xx/mb862xxfbdrv.c:571:8: warning: unused variable 'dev_attr_dispregs' [-Wunused-variable]
     571 | static DEVICE_ATTR_RO(dispregs);
         |        ^~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/device.h:279:26: note: expanded from macro 'DEVICE_ATTR_RO'
     279 |         struct device_attribute dev_attr_##_name = __DEVICE_ATTR_RO(_name)
         |                                 ^~~~~~~~~~~~~~~~
   <scratch space>:124:1: note: expanded from here
     124 | dev_attr_dispregs
         | ^~~~~~~~~~~~~~~~~
   drivers/video/fbdev/mb862xx/mb862xxfbdrv.c:573:20: warning: unused function 'mb862xx_intr' [-Wunused-function]
     573 | static irqreturn_t mb862xx_intr(int irq, void *dev_id)
         |                    ^~~~~~~~~~~~
   3 warnings generated.


vim +/dev_attr_dispregs +571 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c

17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  570  
ff323d6d72e1e4 drivers/video/fbdev/mb862xx/mb862xxfbdrv.c Zhen Lei           2021-06-01 @571  static DEVICE_ATTR_RO(dispregs);
17a1217e12d8c8 drivers/video/mb862xx/mb862xxfb.c          Anatolij Gustschin 2008-11-06  572  

:::::: The code at line 571 was first introduced by commit
:::::: ff323d6d72e1e4971c8ba9e2f3cf8afc48f22383 video: fbdev: mb862xx: use DEVICE_ATTR_RO macro

:::::: TO: Zhen Lei <thunder.leizhen@huawei.com>
:::::: CC: Daniel Vetter <daniel.vetter@ffwll.ch>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
