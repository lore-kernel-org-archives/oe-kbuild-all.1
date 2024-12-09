Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2240B1990C9
	for <oe-kbuild-all@lists.linux.dev>; Mon,  9 Dec 2024 19:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733772354; cv=none; b=cL5qeK9ABsh3ciOQ2r/BP3XSHAk7TR8cBerFQIL26TTonz36tMIDNr5TA204CMq5wfXf+gPcLI8KMNIpE7158sFnmHmud612AvBmE9Y+Mpykn+gW2algcQNd/GALd8D1e8obxIpEB/iymdeUN6Sg//l2V3OWPnGVZIIYkE1BX50=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733772354; c=relaxed/simple;
	bh=kFLzPPOxk/BwhOM+xWgT/KlPu4qy1i8v5WZyZmHTI5o=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=I8Jlszn7ua6hqQQeNjJYdHXAl2XRQ9u7N6/zawzSP5lHnSDtsSb68+LtxWzpeYrlZ2WhS/dvWxDexSFIDKh8qZ4zi/jv4gbTSxqzPY4vwRkoDRlOuJALPmJoNagNyfTG3V0QvPAI/sIhOIrbHc9eR25lmEHSIGYNPcVAkCjoNcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ga30GIWu; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ga30GIWu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1733772353; x=1765308353;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kFLzPPOxk/BwhOM+xWgT/KlPu4qy1i8v5WZyZmHTI5o=;
  b=ga30GIWuNUt1lrU0ujRvdER70pCF5HGPS26TUFnvH1kCRNJMJ9hchsWI
   IXDQGL5YUo8yLZLTtOyWN+qWSqX4Tnu9O6kHGjeI2SymEYXr/XDE7Blqi
   SXMyXX/gZ750Ln1RIVmCDakJanv/wl5K3AFGW1W017RrsD6H83rSin/qF
   Kg/zK0/QM8EpqvwWzG7V5si3o2HaZRt5xCithN74K0zrR7T37sF2NkA1w
   NwV5OY6qoaioVXwFnto01+qTKrngaTytyQsdkOIvRf3W/P6PVyphaHTCs
   YWuOfpHnxW6qsNYy4HtCbCjhB+VHJWG7qh5x17lXhdp3rGcgUPMkH+1CW
   Q==;
X-CSE-ConnectionGUID: ptA47X/9Rr+V8rtIbYvtCA==
X-CSE-MsgGUID: zM/YjYfqQIaSU/BbEYSgbA==
X-IronPort-AV: E=McAfee;i="6700,10204,11281"; a="33427544"
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="33427544"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Dec 2024 11:25:53 -0800
X-CSE-ConnectionGUID: FZcgd8aqSCyal24JqjZkVw==
X-CSE-MsgGUID: TsayRejVS3K4W6A+fPs+pg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,220,1728975600"; 
   d="scan'208";a="95618314"
Received: from lkp-server01.sh.intel.com (HELO 82a3f569d0cb) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 09 Dec 2024 11:25:52 -0800
Received: from kbuild by 82a3f569d0cb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tKjO8-0004jl-33;
	Mon, 09 Dec 2024 19:25:48 +0000
Date: Tue, 10 Dec 2024 03:25:23 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Hongchen Zhang <zhanghongchen@loongson.cn>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1613/1613] include/linux/suspend.h:36:60: error:
 expected ')' before numeric constant
Message-ID: <202412100354.AFJ414Ch-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Jianmin,

FYI, the error/warning still remains.

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   db988390007bce595dba0dfd782c610578e26d2d
commit: 1f46f3a128f21c190281c72cad99267bcc177e34 [1613/1613] PCI: PM: fix pcie mrrs restoring
config: loongarch-randconfig-001-20241210 (https://download.01.org/0day-ci/archive/20241210/202412100354.AFJ414Ch-lkp@intel.com/config)
compiler: loongarch64-linux-gcc (GCC) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241210/202412100354.AFJ414Ch-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202412100354.AFJ414Ch-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/pci/pci.c:35:
>> include/linux/suspend.h:36:60: error: expected ')' before numeric constant
      36 | #define PM_SUSPEND_ON           ((__force suspend_state_t) 0)
         |                                                            ^
   include/linux/suspend.h:341:34: note: in expansion of macro 'PM_SUSPEND_ON'
     341 | #define pm_suspend_target_state (PM_SUSPEND_ON)
         |                                  ^~~~~~~~~~~~~
   drivers/pci/pci.c:177:17: note: in expansion of macro 'pm_suspend_target_state'
     177 | suspend_state_t pm_suspend_target_state;
         |                 ^~~~~~~~~~~~~~~~~~~~~~~


vim +36 include/linux/suspend.h

95d9ffbe01fb21d Rafael J. Wysocki 2007-10-18  35  
95d9ffbe01fb21d Rafael J. Wysocki 2007-10-18 @36  #define PM_SUSPEND_ON		((__force suspend_state_t) 0)
690cbb90a709c1b Rafael J. Wysocki 2017-08-10  37  #define PM_SUSPEND_TO_IDLE	((__force suspend_state_t) 1)
7e73c5ae6e7991a Zhang Rui         2013-02-06  38  #define PM_SUSPEND_STANDBY	((__force suspend_state_t) 2)
95d9ffbe01fb21d Rafael J. Wysocki 2007-10-18  39  #define PM_SUSPEND_MEM		((__force suspend_state_t) 3)
690cbb90a709c1b Rafael J. Wysocki 2017-08-10  40  #define PM_SUSPEND_MIN		PM_SUSPEND_TO_IDLE
95d9ffbe01fb21d Rafael J. Wysocki 2007-10-18  41  #define PM_SUSPEND_MAX		((__force suspend_state_t) 4)
95d9ffbe01fb21d Rafael J. Wysocki 2007-10-18  42  

:::::: The code at line 36 was first introduced by commit
:::::: 95d9ffbe01fb21d524c86bf77871255066bc6e55 PM: Move definition of struct pm_ops to suspend.h

:::::: TO: Rafael J. Wysocki <rjw@sisk.pl>
:::::: CC: Linus Torvalds <torvalds@woody.linux-foundation.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
