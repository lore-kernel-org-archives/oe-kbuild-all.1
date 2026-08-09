Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51498355048
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Aug 2026 09:55:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786269345; cv=none; b=hZL8TTjXKqYZK6EOM0nI4bPu9hbpVwqZ2K4nCN7lSnsXZZRvCSzGNKuwwZhzTZ0v9LEejN4tfb/vASlWSq6H0uJ4wawmwJ1hb524K7YEMXJTdfwyA19C7iIW8NAJOmXiDHDmeHq5SHugwpxhFRrd5rwKSSHcVo2sSHaLIOqR1VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786269345; c=relaxed/simple;
	bh=j853YRuA+FsbtmSRnKvwPDrqSKDdeS2UJV21qPNZ8Vs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=KSs67Yol9mGDDTJiZ5nEWRdtiRrLdQG55r5H6YHIEofdul0EwROz45RK1PI+cKqbYGAZS4ucIizLSceQYnZy5VggdD9tTEv0fJxuaFlYqX70sV7+MdcLeUa+TGTEbmd2P9MXOPnQgPwnXyOjskNV/mQbesAgEbq9fEj4K7XsSVo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=E86CTs8a; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="E86CTs8a"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786269342; x=1817805342;
  h=date:from:to:cc:subject:message-id;
  bh=j853YRuA+FsbtmSRnKvwPDrqSKDdeS2UJV21qPNZ8Vs=;
  b=E86CTs8avpka4lMXZGDwbWJyzEKVrVPT5flFKPLpstAnWvsb9aCiWA90
   Arikw3Tc+0X/0uwae5+mQ5zCeqpcLAsCsgQtSlLlYZ8oGj4NkIERICxbd
   CzPV2r/t1vfvM4T7jf5SJ18Qu5zv0o3jQGSGGgsS6t4dSH1jVbqRMs5i1
   Ub2HdiDHgm1V+pqZ662TzGHAsLjHrnYPpy/nMZaD6K7mOJrGQwCdnR6eE
   8gOdAvu9a72NKDYmTDIMEBtvcfy+0isgQ0dNXIo6khSKsFsWPsMsvWHhw
   Ir1cjNJouiIa61TwiqXZw04gxVxwoMoZ3MQk8XMwb+0PuFUjbHQQ322yY
   g==;
X-CSE-ConnectionGUID: ppvl7DxsQ82lCL54giiq2w==
X-CSE-MsgGUID: HPnoVLKISP+ay6q1I18n7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11869"; a="98172738"
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="98172738"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 02:55:41 -0700
X-CSE-ConnectionGUID: f8nzrqURRE2cmBKA/FqA8g==
X-CSE-MsgGUID: VWXPzNE+QDW5dVf7XZtzRQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,213,1779174000"; 
   d="scan'208";a="292692277"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 09 Aug 2026 02:55:40 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wt0Fl-00000000LmD-3elE;
	Sun, 09 Aug 2026 09:55:37 +0000
Date: Sun, 09 Aug 2026 17:54:52 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:tbt-reset-wip 16/16] drivers/pci/probe.c:6:9:
 warning: 'DEBUG' redefined
Message-ID: <202608091705.jMvzxIoD-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux tbt-reset-wip
head:   bb0656db5a81399cee865239cc885749f06e3d04
commit: bb0656db5a81399cee865239cc885749f06e3d04 [16/16] enable debug in various places
config: powerpc-allmodconfig (https://download.01.org/0day-ci/archive/20260809/202608091705.jMvzxIoD-lkp@intel.com/config)
compiler: powerpc64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260809/202608091705.jMvzxIoD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608091705.jMvzxIoD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/probe.c:6:9: warning: 'DEBUG' redefined
       6 | #define DEBUG
         |         ^~~~~
   <command-line>: note: this is the location of the previous definition


vim +/DEBUG +6 drivers/pci/probe.c

   > 6	#define DEBUG
     7	#include <linux/array_size.h>
     8	#include <linux/kernel.h>
     9	#include <linux/delay.h>
    10	#include <linux/init.h>
    11	#include <linux/pci.h>
    12	#include <linux/msi.h>
    13	#include <linux/of_pci.h>
    14	#include <linux/of_platform.h>
    15	#include <linux/platform_device.h>
    16	#include <linux/pci_hotplug.h>
    17	#include <linux/slab.h>
    18	#include <linux/sprintf.h>
    19	#include <linux/module.h>
    20	#include <linux/cpumask.h>
    21	#include <linux/aer.h>
    22	#include <linux/acpi.h>
    23	#include <linux/hypervisor.h>
    24	#include <linux/irqdomain.h>
    25	#include <linux/pm_runtime.h>
    26	#include <linux/bitfield.h>
    27	#include <trace/events/pci.h>
    28	#include "pci.h"
    29	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
