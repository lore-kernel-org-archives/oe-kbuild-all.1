Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CA6912B94
	for <oe-kbuild-all@lists.linux.dev>; Sun,  9 Aug 2026 20:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786308947; cv=none; b=L72gdVghIp/AXfeACRADh9nz7jZj2VjDNispS3Mqez9eUkPMOgGUF5CJ2CZBpqLVViWRwW4U1rECAcgv4Ysag66uHrCpybt/geX1Nby9APytiS5YUWdp7/m2SCrwjfrOTLUgXUV/E50fNY1KRXZ7JxeGo991xi9CN5kplYgCbwY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786308947; c=relaxed/simple;
	bh=4eXLTdstkZWTEYMj1IbFx9jSvny47ZPBpnRGoouEdMs=;
	h=Date:From:To:Cc:Subject:Message-ID; b=H79ZneackR2itiaIfCzKlnWWwBypjeX4G3I/kr+G9/aZr6xdu0nxR5vC19Y5cHnV8mYxvxk29dHq5fAvgZlG5nAeSvlTVLLsbR3PJVKew0+/cL5Pavj+KnfJ/ln3qbyjUBezeobsyiNx8Sg72sQ5rZnfKoxRxtSt6vm5+sUxNHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Io5V/9VQ; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Io5V/9VQ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786308946; x=1817844946;
  h=date:from:to:cc:subject:message-id;
  bh=4eXLTdstkZWTEYMj1IbFx9jSvny47ZPBpnRGoouEdMs=;
  b=Io5V/9VQjOjr6YzRUbuh4kr+8UtoP0+SWd8OiXd+Pz3BsGIfuByrrlfi
   wUMi9whPK3PgT98m0sT0f8zBXjiHJYmQen24qRxd730l+8BP9SUr60l8n
   Y2AALdeCa2WYYtKExj3MtzWwsvXNeCMAIME8M7Peh3ZdxAdj5nDYmo6yw
   mwj7GbxOZzBcYpmsutBzril1NnjA6Ce/AK1IbkDYMg2g4+tMp1IuE0DVz
   7XCb13wGu9UrN1UbeM0Q5BFGkkWcBHO/QfipMVUtg/CcOpSXcVhfFv2NE
   Ksx8xzRJ0Mf/rY503qdP0T9t3VAOeExlfGmoaAO1WR6n6k6bRZjXWzVht
   A==;
X-CSE-ConnectionGUID: PcsNFdB1Q+iwrZYRPFDnqA==
X-CSE-MsgGUID: IBh4HBLfQKy1NX0miDHpzQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11870"; a="86901999"
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="86901999"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Aug 2026 13:55:45 -0700
X-CSE-ConnectionGUID: mWSDAzDZQNiC1Wd8gTsZYw==
X-CSE-MsgGUID: aObpNkORRHu0GTIWLEDyXQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,214,1779174000"; 
   d="scan'208";a="261125267"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by orviesa006.jf.intel.com with ESMTP; 09 Aug 2026 13:55:44 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wtAYX-00000000MN0-3t5r;
	Sun, 09 Aug 2026 20:55:41 +0000
Date: Mon, 10 Aug 2026 04:55:37 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@svenpeter.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [asahilinux:tbt-reset-wip 16/16] drivers/pci/probe.c:6:9:
 warning: 'DEBUG' macro redefined
Message-ID: <202608100353.vMQGvitJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/AsahiLinux/linux tbt-reset-wip
head:   bb0656db5a81399cee865239cc885749f06e3d04
commit: bb0656db5a81399cee865239cc885749f06e3d04 [16/16] enable debug in various places
config: sparc64-randconfig-r071-20260809 (https://download.01.org/0day-ci/archive/20260810/202608100353.vMQGvitJ-lkp@intel.com/config)
compiler: clang version 24.0.0git (https://github.com/llvm/llvm-project 12df34b8469b8095359de8c249cb1b2753fadeea)
smatch: v0.5.0-9187-g5189e3fb
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260810/202608100353.vMQGvitJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608100353.vMQGvitJ-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/pci/probe.c:6:9: warning: 'DEBUG' macro redefined [-Wmacro-redefined]
       6 | #define DEBUG
         |         ^
   <command line>:3:9: note: previous definition is here
       3 | #define DEBUG 1
         |         ^
   1 warning generated.


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
