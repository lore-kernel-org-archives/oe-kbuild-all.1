Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAEE014A0AB
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 May 2024 13:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714743697; cv=none; b=MVOsmDAXlp/gIX+invUVYPFacvcbkZS5fJQnwxQo1ujs9joYKNn4RqnLyyWGjl8nXbXIy/CYx2ITIiRItu4IGbspvrxiV1LqG/ryKsU2chaBnlSyoO9nRG+sa6tp+YdcrtF6WL14VYpIQ+BgEq3nE/qO8/THXn+4rodyulkoA8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714743697; c=relaxed/simple;
	bh=Yh4TqxkIYITdVOMoQZrVsalhZo/eYyJGXbRyZoqBPgs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZrY2hMc2f1pf90KBLBzeAB0uMaFxKt4ZzF79Qd2QE4AISdRMDmKt1Cu9v0h2dgKBVsEmblXrfkmTYB8CNYJUyMRcWGY/TrY0A5nzXencWJUmyzkgWlcgSXcSeAqlfcLtYOpO34n8Ey+pUPP619S3rRZ6BHo0uc6U0uvi2d6dtBM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gA0hW2U9; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gA0hW2U9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1714743696; x=1746279696;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=Yh4TqxkIYITdVOMoQZrVsalhZo/eYyJGXbRyZoqBPgs=;
  b=gA0hW2U9QFTjT/28eWiUGgIzzkSlyt1NcJEtwTeVkMRZVDvzDThHaUVm
   T391R5N/ROeeSgX3cobnWUP3lGWI02GxhbjVUwE1brqR8z2NKIy5+AX/G
   GD+o7vUwVZLU46OrWSDK7gsyNzdHXNTqQW+JkUfKbQwvRDDv//G+HTgse
   SHqs7bgWiWRhWmiEjZE/YHNVgb6AvOLIc8RPXB8coQZsEI7mBl5Jsea+9
   +XFevXJob/R8N/CT0WnXroyQplNvCO8wCkqrV+Anx4oV6Zqnm7H07KDpo
   a4Cqo1BeHNJLSHcNCGicnDsz2iy6fqVmfzbbrc7OD2KXC/6NVav+F8/+U
   Q==;
X-CSE-ConnectionGUID: AQNzc4waSzSBkyVQyoolxw==
X-CSE-MsgGUID: L3H2anr2RvmMPkPuLQjDBA==
X-IronPort-AV: E=McAfee;i="6600,9927,11063"; a="10767837"
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="10767837"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2024 06:41:35 -0700
X-CSE-ConnectionGUID: 5NHK01fwRpmKrd9EXmH0Qw==
X-CSE-MsgGUID: apKbYYziRqaE+IjA0V6/Xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,251,1708416000"; 
   d="scan'208";a="32133868"
Received: from lkp-server01.sh.intel.com (HELO e434dd42e5a1) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 03 May 2024 06:41:34 -0700
Received: from kbuild by e434dd42e5a1 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1s2tAJ-000BjG-3A;
	Fri, 03 May 2024 13:41:31 +0000
Date: Fri, 3 May 2024 21:41:14 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Stanley <joel@jms.id.au>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [shenki:aspeed-6.9-rebase 208/1143]
 drivers/i3c/master/dw-i3c-master.c:14:10: fatal error: 'linux/i3c/target.h'
 file not found
Message-ID: <202405032126.SJC0Ts5p-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/shenki/linux aspeed-6.9-rebase
head:   9bdcee91eb5d9149678acb9d066e9dafbd026721
commit: d1e5ebb66f8d1729d5dd7349190b9befb083e5e3 [208/1143] i3c: master: dw: Implement I3C target functions
config: arm-randconfig-001-20240503 (https://download.01.org/0day-ci/archive/20240503/202405032126.SJC0Ts5p-lkp@intel.com/config)
compiler: clang version 19.0.0git (https://github.com/llvm/llvm-project 37ae4ad0eef338776c7e2cffb3896153d43dcd90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240503/202405032126.SJC0Ts5p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202405032126.SJC0Ts5p-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/i3c/master/dw-i3c-master.c:13:
   In file included from include/linux/i3c/master.h:14:
   In file included from include/linux/i2c.h:19:
   In file included from include/linux/regulator/consumer.h:35:
   In file included from include/linux/suspend.h:5:
   In file included from include/linux/swap.h:9:
   In file included from include/linux/memcontrol.h:21:
   In file included from include/linux/mm.h:2208:
   include/linux/vmstat.h:522:36: warning: arithmetic between different enumeration types ('enum node_stat_item' and 'enum lru_list') [-Wenum-enum-conversion]
     522 |         return node_stat_name(NR_LRU_BASE + lru) + 3; // skip "nr_"
         |                               ~~~~~~~~~~~ ^ ~~~
>> drivers/i3c/master/dw-i3c-master.c:14:10: fatal error: 'linux/i3c/target.h' file not found
      14 | #include <linux/i3c/target.h>
         |          ^~~~~~~~~~~~~~~~~~~~
   1 warning and 1 error generated.


vim +14 drivers/i3c/master/dw-i3c-master.c

  > 14	#include <linux/i3c/target.h>
    15	#include <linux/interrupt.h>
    16	#include <linux/ioport.h>
    17	#include <linux/iopoll.h>
    18	#include <linux/list.h>
    19	#include <linux/module.h>
    20	#include <linux/of.h>
    21	#include <linux/platform_device.h>
    22	#include <linux/reset.h>
    23	#include <linux/slab.h>
    24	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
