Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ED1F1D5CD6
	for <oe-kbuild-all@lists.linux.dev>; Sun,  2 Feb 2025 10:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738490850; cv=none; b=ebMffeOjKZfOk5fZheTIj5xVRqajoQWov+RiNUuC9UypxLRzMqUCDQjU3Btj7lQiwME8xywjE0OZ//2VDqiZ6DnugpUuPqqZo06uvQKQgfXz2uQLWLuF+KvFIHlQS/euijAKgA7UobDduU4r4LHvqTBChKuuAKH7RUPbi/xq2qY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738490850; c=relaxed/simple;
	bh=jVM+PLBR2s1zf8lcgY3A9Dc2rX0UvR/Ltq82iCZ7kGg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=haG8e8iXkBIfSVLXWC+qy6oUb0ni3NvDJ4HirTia2tow0w0q6kQel7svRsR4vftMd5TijxDfehPW1HMTeKiMmaDA9G+KR3zxIRmazW93h5CLNxVxRa65ocGHkiD0ZRKnOiG4cC7/1/idGiHT+vlouGUbCtivbLj6HrkgfOqS4mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ls8jUlK+; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ls8jUlK+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1738490848; x=1770026848;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=jVM+PLBR2s1zf8lcgY3A9Dc2rX0UvR/Ltq82iCZ7kGg=;
  b=ls8jUlK+BAcTfJp5hIluetF7K+tK6R47xYC6YbxGuBJMFWelRUijAW5W
   5kUODeKL9uoLafWilDv++Of8zb5+3m7jCaLajHqesC2pTN2MZOaS/w0/k
   ZdPg1AcO+7ZzcTGPzfSQJzcf1xXu+kkITX87cT3NtgO0fGeHAQu4j5C0Y
   My9XSmvqc8GAC7pemipmB7T86Z6HI2dGsxaTfDdKwzj+JArN0XsrAWq1a
   phpNGwkBvSEDT0N0X2EM8ykN6/ttK9NjqdOIIWV0pl4iGjIL1E8gXpziM
   nLHbYMnHx4r+ucNcZAHUy4OSG8bYQe4tRl+hwaWhcm1hl/IZ5kJgfFqmF
   Q==;
X-CSE-ConnectionGUID: AFfPmjIXT0SIvzJSEyaAQw==
X-CSE-MsgGUID: /42SD2VJSji9+9IqeCVbVQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11314"; a="50415965"
X-IronPort-AV: E=Sophos;i="6.12,310,1728975600"; 
   d="scan'208";a="50415965"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2025 02:07:27 -0800
X-CSE-ConnectionGUID: dDrDZcFuSaSrNL/GATKAeA==
X-CSE-MsgGUID: zxDOJgAgS6+YPvPluWpyEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,253,1732608000"; 
   d="scan'208";a="110584934"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 02 Feb 2025 02:07:28 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1teWsu-000pXr-2Z;
	Sun, 02 Feb 2025 10:07:24 +0000
Date: Sun, 2 Feb 2025 18:07:21 +0800
From: kernel test robot <lkp@intel.com>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [rgushchin:sframe_unwinder.rfc 4/8] kernel/sframe_lookup.c:8:9:
 warning: "pr_fmt" redefined
Message-ID: <202502021726.azygOX2C-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/rgushchin/linux.git sframe_unwinder.rfc
head:   0cc3157743fd72033cfa5de243943249f9d67cea
commit: 1ef915ef47cd2f4bbdaa9b10266c281d663d6e03 [4/8] unwind: Implement generic sframe unwinder library
config: arm64-randconfig-r123-20250202 (https://download.01.org/0day-ci/archive/20250202/202502021726.azygOX2C-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 14.2.0
reproduce: (https://download.01.org/0day-ci/archive/20250202/202502021726.azygOX2C-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502021726.azygOX2C-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/sframe_lookup.c:8:9: warning: "pr_fmt" redefined
       8 | #define pr_fmt(fmt)     "sframe: " fmt
         |         ^~~~~~
   In file included from include/asm-generic/bug.h:22,
                    from arch/arm64/include/asm/bug.h:26,
                    from include/linux/bug.h:5,
                    from arch/arm64/include/asm/cpufeature.h:24,
                    from arch/arm64/include/asm/hwcap.h:9,
                    from arch/arm64/include/asm/arch_timer.h:12,
                    from arch/arm64/include/asm/timex.h:8,
                    from include/linux/timex.h:67,
                    from include/linux/time32.h:13,
                    from include/linux/time.h:60,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from kernel/sframe_lookup.c:2:
   include/linux/printk.h:391:9: note: this is the location of the previous definition
     391 | #define pr_fmt(fmt) fmt
         |         ^~~~~~


vim +/pr_fmt +8 kernel/sframe_lookup.c

     7	
   > 8	#define pr_fmt(fmt)	"sframe: " fmt
     9	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
