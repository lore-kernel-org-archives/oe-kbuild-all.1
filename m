Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 440FF384CC4
	for <oe-kbuild-all@lists.linux.dev>; Fri, 31 Jul 2026 07:28:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785482934; cv=none; b=Qd2b7YJWwsmmYdJd6Y8lhhrmqPcJKKdh4iKWFidtjBi8KQdKBY323e3g9vEoX7l/ihMAO9LD55Ce8rBMajJfMC54HvkGQHSNwdcITq6AqNafUiAg0QXxVMXMNAvI90ZMHsxrK6uXJZ19wL+d54mFQqwPH78PQhx1RAtJ/LyyKvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785482934; c=relaxed/simple;
	bh=Q7YZ9NEyRmcvGXoiFifEYsXsiCY7eSHcPKn1DgSXjLY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=QbwOw0CV/qBl+Jz0+U3dRunnRthFRZv4kAZ+hIRx/csNEwuI2OvB8zSnlxdM3gKTgkXWTD9wYwM3A7TA7v6WjPKdJeBliK4djC/0dYKf+lzLu8mIqnDhiuPM/2H9JSbOjtr7sSg0ONCEfD6cjvm2KBpcHGybvQ8ZLK5VY26Sknk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EVnqKJJ0; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EVnqKJJ0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1785482931; x=1817018931;
  h=date:from:to:cc:subject:message-id;
  bh=Q7YZ9NEyRmcvGXoiFifEYsXsiCY7eSHcPKn1DgSXjLY=;
  b=EVnqKJJ0gWo8fTP+wWm380TfYgvGr9ylQQjftmVAKWmBn9/L47WwOJ8c
   zo/z9rMBcOqHzB6FYBllkr0Ya0zspCOkLMK4BkbXrO/5wnn4IU2x4u3hS
   GYZG+AggObQSGsyE5Be38CpJi/RAXbnUhH3CsHIot2sT/euKrXlMmuqvE
   6GoYa9RWaIBd2iWpZjXulzv/sCBu8a8HQPe13unISC2VsKzOJz7qVKJtR
   Wuxd9AnE4ob598Lb2N8mWn3rFOvNHMn1DUbZmK9qtN+JoRisQ2P8NOWOf
   gEECepjYAodQ8ZPJgAF4xXFpUfyXgvZWj5Ogqbw023D0I9it+j4t1gqL4
   Q==;
X-CSE-ConnectionGUID: DilO7z/gRZOoZORAD34dtg==
X-CSE-MsgGUID: J7T5yjI/TIeVMMVpmXO4sQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11860"; a="86057436"
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="86057436"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jul 2026 00:28:51 -0700
X-CSE-ConnectionGUID: 1P+JcXcZQFGaCovqjI93Mw==
X-CSE-MsgGUID: +4NZJesEQ2iqxNILi0xDPg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,196,1779174000"; 
   d="scan'208";a="285114930"
Received: from lkp-server01.sh.intel.com (HELO 6eda058d650d) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 31 Jul 2026 00:28:49 -0700
Received: from kbuild by 6eda058d650d with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wphfi-000000000IL-46xT;
	Fri, 31 Jul 2026 07:28:46 +0000
Date: Fri, 31 Jul 2026 15:28:43 +0800
From: kernel test robot <lkp@intel.com>
To: YoungSoo Shin <shinys000114@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Dongjin Kim <tobetter@gmail.com>
Subject: [tobetter:odroid-7.2.y 58/58]
 drivers/video/fbdev/sh1106fb.c:20:10: fatal error: linux/of_gpio.h: No such
 file or directory
Message-ID: <202607311556.WtYTiBZJ-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/tobetter/linux odroid-7.2.y
head:   b975acfb39259020dffed242fcfba388a6f4e354
commit: a7f14d616999ff734886c89b75b3f701b77ffd2d [58/58] ODROID-COMMON: fbdev: add support for Sino Wealth SH1106 OLED controller
config: arc-allmodconfig (https://download.01.org/0day-ci/archive/20260731/202607311556.WtYTiBZJ-lkp@intel.com/config)
compiler: arc-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260731/202607311556.WtYTiBZJ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202607311556.WtYTiBZJ-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/video/fbdev/sh1106fb.c:20:10: fatal error: linux/of_gpio.h: No such file or directory
      20 | #include <linux/of_gpio.h>
         |          ^~~~~~~~~~~~~~~~~
   compilation terminated.


vim +20 drivers/video/fbdev/sh1106fb.c

  > 20	#include <linux/of_gpio.h>
    21	#include <linux/uaccess.h>
    22	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
