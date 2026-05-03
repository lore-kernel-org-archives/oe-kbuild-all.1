Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13A80370D6D
	for <oe-kbuild-all@lists.linux.dev>; Sun,  3 May 2026 22:02:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777845774; cv=none; b=ezK4Z5dz3SeUHIGtPJmfNmWRkWvhYoGoVUlwtWj8jxdEJeZkzHHmEZm9FvMyMphA88ciRmhlXOHAdzbphOeb/dicGjN/ssOqOY8IZU5MSCJl6zYyJkGqSdgpN+bl9Oa7Ewj4ZDSvkgY4zNx9QZvvAnTBRQhu/HqHWL+YI+gKfJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777845774; c=relaxed/simple;
	bh=H82XEW8gt52Aocz8D1pat7nHJfi8c6QPxnNMG8uccWQ=;
	h=Date:From:To:Cc:Subject:Message-ID; b=gj1ADdMhbIRYCe7stWO1j/6cpY0ba8GbS40I4qJTmzQ4v5NOYZ2wyHiQLkpMctcJ6ztNIcQ46T2i1HFgE3cH+3RYH7mdeuQjywep1W3eNvDWVvYt0Av4I07ZSGT6mo1l35PXQMnyFzCHn4OkZ0N3lm4GDZbYdzNtmxppHm8okR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=esoU6Qn3; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="esoU6Qn3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777845773; x=1809381773;
  h=date:from:to:cc:subject:message-id;
  bh=H82XEW8gt52Aocz8D1pat7nHJfi8c6QPxnNMG8uccWQ=;
  b=esoU6Qn3SLkXy2JDHIFYPtd4/bdHEpkwR0+0Len2EyiJFJYV5/XWZpSK
   uQStm2FgWR+V0GgCQO6Uilk/QYCNZ0tQfZRf8kWeZpKi0OZO55DTNiw39
   ct7SY8lmgzXdu0tLfVI2lAK8VEkGw8riciO2CN2xIylprCJxtzHgfV+ev
   5I5Tzeo0ZJtKKHzJiELQ23oALi0r9SAFROujkUHDys2gObrMnzIbtoYtp
   HxoPIMbRWxbEIcpQq2lXylVed7pfOXk5h7x+erh1MJseXNuABXNbuopGE
   ISf3MLGojdy74ReEDsfnSK+5Syj+lOc2el5o7ucGCMoxus7KH+yKxp2BE
   w==;
X-CSE-ConnectionGUID: GPB+b5Z2QYCajoUUoh8zvA==
X-CSE-MsgGUID: e447lrCNSvaJNAXICADSIg==
X-IronPort-AV: E=McAfee;i="6800,10657,11775"; a="78419319"
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="78419319"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 May 2026 15:02:52 -0700
X-CSE-ConnectionGUID: VkUw1iEJR4S6IXyXpOAVdQ==
X-CSE-MsgGUID: gPdcPeNQQz+vej5SmUwFCw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,214,1770624000"; 
   d="scan'208";a="239676116"
Received: from lkp-server01.sh.intel.com (HELO 781826d00641) ([10.239.97.150])
  by orviesa004.jf.intel.com with ESMTP; 03 May 2026 15:02:51 -0700
Received: from kbuild by 781826d00641 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJetc-0000000035Z-3kZ1;
	Sun, 03 May 2026 22:02:44 +0000
Date: Mon, 04 May 2026 06:02:19 +0800
From: kernel test robot <lkp@intel.com>
To: "Kiryl Shutsemau (Meta)" <kas@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [kas:pte_size 9/69]
 drivers/input/touchscreen/wdt87xx_i2c.c:40:9: warning: 'PG_SIZE' redefined
Message-ID: <202605040516.byxHtWX1-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/kas/linux.git pte_size
head:   3453a5ad954365409373c2762ba237c7e31a623b
commit: e82dd313bd342a12e78c55f382ca33fe4002b2f0 [9/69] mm: Introduce PG_SIZE, PG_SHIFT and PG_MASK
config: parisc-allmodconfig (https://download.01.org/0day-ci/archive/20260504/202605040516.byxHtWX1-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260504/202605040516.byxHtWX1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605040516.byxHtWX1-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/touchscreen/wdt87xx_i2c.c:40:9: warning: 'PG_SIZE' redefined
      40 | #define PG_SIZE                         0x1000
         |         ^~~~~~~
   In file included from arch/parisc/include/asm/page.h:7,
                    from include/linux/mm_types_task.h:14,
                    from include/linux/mm_types.h:5,
                    from include/linux/mmzone.h:22,
                    from include/linux/gfp.h:7,
                    from include/linux/slab.h:17,
                    from include/linux/resource_ext.h:11,
                    from include/linux/acpi.h:14,
                    from include/linux/i2c.h:13,
                    from drivers/input/touchscreen/wdt87xx_i2c.c:12:
   include/vdso/page.h:34:9: note: this is the location of the previous definition
      34 | #define PG_SIZE         (_AC(1,UL) << CONFIG_PG_SHIFT)
         |         ^~~~~~~


vim +/PG_SIZE +40 drivers/input/touchscreen/wdt87xx_i2c.c

3e30c11c8a902d HungNien Chen 2015-06-15  39  
3e30c11c8a902d HungNien Chen 2015-06-15 @40  #define PG_SIZE				0x1000
3e30c11c8a902d HungNien Chen 2015-06-15  41  #define MAX_RETRIES			3
3e30c11c8a902d HungNien Chen 2015-06-15  42  

:::::: The code at line 40 was first introduced by commit
:::::: 3e30c11c8a902de350281a0d821e17cdb45ef156 Input: add a driver for wdt87xx touchscreen controller

:::::: TO: HungNien Chen <hn.chen@weidahitech.com>
:::::: CC: Dmitry Torokhov <dmitry.torokhov@gmail.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
