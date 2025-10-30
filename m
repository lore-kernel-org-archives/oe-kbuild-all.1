Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C770B281504
	for <oe-kbuild-all@lists.linux.dev>; Thu, 30 Oct 2025 14:57:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761836269; cv=none; b=OPftsis0HJDRv9a6vAyE3y2sWHfQSaasguju36b2oWebL71fewbGmocIb8nZmi8OwoJxHbddHu9zVjlvniE0u1hNqmUqAGmp7mFoSzm4pBmhaX05N8XZDoxSoLM7nJyFBYLrfOrLnx2USKEpzFYlddnb1z1d1nB6+4ZijCy/x5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761836269; c=relaxed/simple;
	bh=ROOLyFVZQK6QM6kymkHQZU2iymiZ/1t2v3Y+gJFoNRw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sBWIDiZqfBdREmPOHoQIa27Xq1TAE3mP0IHi0ahziQCcCSLCB2nStawWogoFi+I2lTz7LQXDK0Y1rRo+F0a54xRXNaKcyR1dS+ajYzOzbcvwo1jKc2vYvfLG1TGuxWfXP0ICiGfDJ1rLhznNlQoT7qbkowXdhnB61PRGb5noJ88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=kBqpQydk; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="kBqpQydk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761836268; x=1793372268;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ROOLyFVZQK6QM6kymkHQZU2iymiZ/1t2v3Y+gJFoNRw=;
  b=kBqpQydkMIia2wVCX74GKceKDngE9bpYHHb0wQbiQccblz6UISog9Gi0
   Wesumk9lpb9K6iJRF3Zzc+klj05/xyP8YOmzsQjevOYnffEq9iyzaAsSu
   60joSYVymQKI9Dt0mfpHS8BFykPWlcA0wGRiwVKNYOxbKb5cRDHxRXINE
   1IAzCckabgBnQOMXYXDnJPCMbyrN/xNWpx3ddh7u4Itl+U/KpIXjmRcXU
   bsul6bMQ+vN3gNLrHVdFQK3LmDXXD0e6g7bnHjCI96iI0mydEElzSc59+
   N+OOScmqrAaTdjBkq53db8osYVwRsUiHBuVMrHs8iWnpZt2zhJx6Ner7n
   Q==;
X-CSE-ConnectionGUID: Fly438JjT7SNeINRkQQtRA==
X-CSE-MsgGUID: UE164GswT7mMJF6IcdXMLA==
X-IronPort-AV: E=McAfee;i="6800,10657,11598"; a="63889312"
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="63889312"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 30 Oct 2025 07:57:47 -0700
X-CSE-ConnectionGUID: ECg2fMrOSJqTzYDJaSyoTg==
X-CSE-MsgGUID: Y57WRbHCSEmgKiUvLNpNTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,267,1754982000"; 
   d="scan'208";a="185236894"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa010.jf.intel.com with ESMTP; 30 Oct 2025 07:57:46 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEU5v-000M7p-24;
	Thu, 30 Oct 2025 14:57:43 +0000
Date: Thu, 30 Oct 2025 22:57:04 +0800
From: kernel test robot <lkp@intel.com>
To: Jim Cromie <jim.cromie@gmail.com>,
	=?utf-8?Q?=C5=81ukasz?= Bartosik <ukaszb@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jimc:must-be-lval 38/57] lib/test_lvalue.c:16:26: warning: passing
 argument 3 of 'pci_get_device' makes pointer from integer without a cast
Message-ID: <202510302226.gPQQw1Xc-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jimc/linux.git must-be-lval
head:   ddd6ff4d1945e2040067848741c3e94855fd43c7
commit: 6d0e01538bf8aa880118f706ea96e92d3df34fab [38/57] lib/test_lvalues.c: test __lvalue() atal
config: nios2-allnoconfig (https://download.01.org/0day-ci/archive/20251030/202510302226.gPQQw1Xc-lkp@intel.com/config)
compiler: nios2-linux-gcc (GCC) 11.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251030/202510302226.gPQQw1Xc-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510302226.gPQQw1Xc-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from include/linux/ioport.h:15,
                    from include/linux/acpi.h:12,
                    from lib/test_lvalue.c:5:
   lib/test_lvalue.c: In function 'test_lvalue_macros':
   include/linux/minmax.h:308:41: error: lvalue required as left operand of assignment
     308 |         do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                                         ^
   lib/test_lvalue.c:13:9: note: in expansion of macro 'swap'
      13 |         swap(1, 2);
         |         ^~~~
   include/linux/minmax.h:308:52: error: lvalue required as left operand of assignment
     308 |         do { typeof(a) __tmp = (a); (a) = (b); (b) = __tmp; } while (0)
         |                                                    ^
   lib/test_lvalue.c:13:9: note: in expansion of macro 'swap'
      13 |         swap(1, 2);
         |         ^~~~
   In file included from include/linux/uidgid.h:16,
                    from include/linux/kernfs.h:18,
                    from include/linux/sysfs.h:16,
                    from include/linux/kobject.h:20,
                    from include/linux/energy_model.h:7,
                    from include/linux/device.h:16,
                    from include/linux/acpi.h:14,
                    from lib/test_lvalue.c:5:
   include/linux/highuid.h:70:38: error: lvalue required as left operand of assignment
      70 | #define SET_UID(var, uid) do { (var) = __convert_uid(sizeof(var), (uid)); } while (0)
         |                                      ^
   lib/test_lvalue.c:14:9: note: in expansion of macro 'SET_UID'
      14 |         SET_UID(1, 1);
         |         ^~~~~~~
   In file included from include/acpi/acpi.h:22,
                    from include/linux/acpi.h:26,
                    from lib/test_lvalue.c:5:
   include/acpi/platform/acenv.h:248:60: error: lvalue required as left operand of assignment
     248 | #define ACPI_ACQUIRE_GLOBAL_LOCK(Glptr, acquired) acquired = 1
         |                                                            ^
   lib/test_lvalue.c:15:9: note: in expansion of macro 'ACPI_ACQUIRE_GLOBAL_LOCK'
      15 |         ACPI_ACQUIRE_GLOBAL_LOCK(NULL, 1);
         |         ^~~~~~~~~~~~~~~~~~~~~~~~
   In file included from lib/test_lvalue.c:8:
>> lib/test_lvalue.c:16:26: warning: passing argument 3 of 'pci_get_device' makes pointer from integer without a cast [-Wint-conversion]
      16 |         for_each_pci_dev(1);
         |                          ^
         |                          |
         |                          int
   include/linux/pci.h:576:80: note: in definition of macro 'for_each_pci_dev'
     576 | #define for_each_pci_dev(d) while ((d = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, d)) != NULL)
         |                                                                                ^
   include/linux/pci.h:2041:62: note: expected 'struct pci_dev *' but argument is of type 'int'
    2041 |                                              struct pci_dev *from)
         |                                              ~~~~~~~~~~~~~~~~^~~~
   include/linux/pci.h:576:39: error: lvalue required as left operand of assignment
     576 | #define for_each_pci_dev(d) while ((d = pci_get_device(PCI_ANY_ID, PCI_ANY_ID, d)) != NULL)
         |                                       ^
   lib/test_lvalue.c:16:9: note: in expansion of macro 'for_each_pci_dev'
      16 |         for_each_pci_dev(1);
         |         ^~~~~~~~~~~~~~~~


vim +/pci_get_device +16 lib/test_lvalue.c

   > 5	#include <linux/acpi.h>
     6	#include <linux/highuid.h>
     7	#include <linux/minmax.h>
     8	#include <linux/pci.h>
     9	
    10	static void __used __init test_lvalue_macros(void)
    11	{
    12		/* These should all fail to compile */
    13		swap(1, 2);
    14		SET_UID(1, 1);
    15		ACPI_ACQUIRE_GLOBAL_LOCK(NULL, 1);
  > 16		for_each_pci_dev(1);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
