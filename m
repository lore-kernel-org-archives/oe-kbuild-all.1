Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A23C19995E
	for <oe-kbuild-all@lists.linux.dev>; Mon, 21 Jul 2025 20:02:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753128134; cv=none; b=itarRTbcdtsUX8va5c1oQiV9LMWZJ501QbMK8NGjW25lGryI/wrh8FxiTYy01V3azH4B3h6tSG1azlyfTwGw2xnDFfEKtdIiWGaC5kRWIlOdSwxx3oGm9j8I1PAwMyHm6iEB0zQoRTo5B8KvOtsfq+b8FKD4y6LoSGnBaGnouHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753128134; c=relaxed/simple;
	bh=kjI5PzEv209MgqAo4qQG7b6i/dYC2rYzP87QtWJw05I=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZZn0YbhE/1gPakddGwdEGD0C8oaf/u4MiRov2qiDN5s7HehXzn/sb+eqgpMl/ex2I53ERwkI8wRGLZwnlizB5ZYq6mONEN/O8tIA3ZJxdvVU6BdCrF+xgCLvuYnnAhQMN0JSW9ZEoYAgJ2fTBZH+hAgpJdnGEhOJpYitqZvhxyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=R5ekemY9; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="R5ekemY9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1753128133; x=1784664133;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=kjI5PzEv209MgqAo4qQG7b6i/dYC2rYzP87QtWJw05I=;
  b=R5ekemY97RjSGDZ21EZlYInzo4ayHDB0m33EH2X1l5uaVd6+NdHFGMPT
   yXrPHIay0HTlM6c6ShD9qAJ+6OTW+1w68wi5t6m1UkBtL4zetsTu5q2zU
   AZg9tdmwI/0CPGfcE89Rez9wlsJl6UCAlhbgYdhCoTmDGceoKLvvn2K1k
   +PVxNA54wCEwPAr2X33pJaD3/SAUxjTW4yHXQVlWRTqXh5X+bxpn6nw0l
   IKJo9BbJUCHGVjpOp913VK0aEOv8XYOEA0YO7VCIUDTrDIhaIyMttruqP
   5IUv5lwY0McshZll8poP8R6q9oRAX1bqgysrQ+YlrIiNuPOShgG5HhM1z
   A==;
X-CSE-ConnectionGUID: WYF9UPM0Q1SUO8i2nqVPCg==
X-CSE-MsgGUID: iwnOQXB+SCSeMqN2SfH83Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11499"; a="54456296"
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="54456296"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jul 2025 13:02:12 -0700
X-CSE-ConnectionGUID: DzOS1Jv1RByCFQ0KPZpLPw==
X-CSE-MsgGUID: qg4IV4JxRGSBWrV7QO/KbQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,329,1744095600"; 
   d="scan'208";a="164424473"
Received: from lkp-server01.sh.intel.com (HELO 9ee84586c615) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 21 Jul 2025 13:02:12 -0700
Received: from kbuild by 9ee84586c615 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1udwiA-000H7d-0J;
	Mon, 21 Jul 2025 20:02:10 +0000
Date: Tue, 22 Jul 2025 04:01:33 +0800
From: kernel test robot <lkp@intel.com>
To: Vlastimil Babka <vbabka@suse.cz>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [vbabka:sheaves-with-microbenchmark 2/13]
 lib/tests/slub_kunit.c:10:10: fatal error: asm/tsc.h: No such file or
 directory
Message-ID: <202507220310.CoCvlBbO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/vbabka/linux.git sheaves-with-microbenchmark
head:   53a6c37b14b0985676c3e8e82faffb687df66240
commit: 51a16612a9b2763f07222deaeba06a0be3985f10 [2/13] slub_kunit: microbenchmark
config: arm-randconfig-003-20250722 (https://download.01.org/0day-ci/archive/20250722/202507220310.CoCvlBbO-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250722/202507220310.CoCvlBbO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202507220310.CoCvlBbO-lkp@intel.com/

All errors (new ones prefixed by >>):

>> lib/tests/slub_kunit.c:10:10: fatal error: asm/tsc.h: No such file or directory
    #include <asm/tsc.h>
             ^~~~~~~~~~~
   compilation terminated.


vim +10 lib/tests/slub_kunit.c

  > 10	#include <asm/tsc.h>
    11	#include "../mm/slab.h"
    12	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
