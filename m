Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E3303A28D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 29 Mar 2024 04:28:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711686519; cv=none; b=ktbFj1F/bF8I+bUPvOjATAF5TjYJyTboi7IeYwZNUAghWq0ty3mlsAWsMDUJcJzn/blGjAQxCTypZk7QGXc7dZfRwUyRCYGCEHsHJcemiVJVjKKuZhP8wud4qnYogS/Isqw7t962BLbzCezux6V7b7Wdl/9unogrnwI9/qJQ6cY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711686519; c=relaxed/simple;
	bh=PEnUVGSXGyr4SHdHqVpebdrlNv3OQa3f1qKTfNTHJvg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=gQ9luJJD7FlZZl+vcz9OgezU3Ckh/52hQ3VXm1C6f0Yj7NaevmIcFR+XntkqD5S5xLiY0waod4wBkQroSWqHmTPCibH1nodu9tIO6RhFDVX+3X4FR4DiCW9sZWs/6ev7o1T/Tk+2YOsCxiaDQd7984M6EYx4esDYtbNuLpk1C90=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=W2ChA5rm; arc=none smtp.client-ip=198.175.65.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="W2ChA5rm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1711686517; x=1743222517;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=PEnUVGSXGyr4SHdHqVpebdrlNv3OQa3f1qKTfNTHJvg=;
  b=W2ChA5rmiR1AsjxQKf989iNjZV5WF90M5KAQjX+SbscLfiG3eLmdGgxk
   QNdx28/N9SFFkK5JQqlyxdhrrCQDuLmdmWMJWA7ExXSR1mVEiYNBt7qVt
   p8ilHgr2+c1GZWkoHAtltcTPoG7tvaIhCXm7XBPo7XT4Oe/COSI+AM6mr
   izKWSjkMDnkmG3zAbNGBnWQ4dubq1AVLwdPsFmVU0iksRm53gnX7rIDcT
   CZrV/kigvTgobMHl+2k6y61sNkRsStPQPGzdzVcsywpPIy8E2U989Sr6A
   Ljl6/FHGxXm+hbjnczd7JbwWzyz6N6PRKpfb8ZuxCnEnVzcy3pRlksL3d
   A==;
X-CSE-ConnectionGUID: S07fLTHfTIqVlxDFcYV52A==
X-CSE-MsgGUID: gMZ+G8c9T9666Lnb01jFnA==
X-IronPort-AV: E=McAfee;i="6600,9927,11027"; a="6768166"
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="6768166"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
  by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Mar 2024 21:28:36 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,162,1708416000"; 
   d="scan'208";a="16912032"
Received: from lkp-server01.sh.intel.com (HELO be39aa325d23) ([10.239.97.150])
  by fmviesa007.fm.intel.com with ESMTP; 28 Mar 2024 21:28:34 -0700
Received: from kbuild by be39aa325d23 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rq3qy-0002qa-0V;
	Fri, 29 Mar 2024 04:28:32 +0000
Date: Fri, 29 Mar 2024 12:28:13 +0800
From: kernel test robot <lkp@intel.com>
To: Samuel Holland <samuel.holland@sifive.com>
Cc: oe-kbuild-all@lists.linux.dev,
	Andrew Morton <akpm@linux-foundation.org>,
	Linux Memory Management List <linux-mm@kvack.org>,
	Christoph Hellwig <hch@lst.de>
Subject: [akpm-mm:mm-nonmm-unstable 62/62] lib/test_fpu_glue.c:41:14: error:
 implicit declaration of function 'kernel_fpu_available'
Message-ID: <202403291254.0XqikdBT-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/akpm/mm.git mm-nonmm-unstable
head:   b065e14a3960a495216a032e6d383c104147c9ef
commit: b065e14a3960a495216a032e6d383c104147c9ef [62/62] selftests/fpu: allow building on other architectures
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20240329/202403291254.0XqikdBT-lkp@intel.com/config)
compiler: gcc-12 (Ubuntu 12.3.0-9ubuntu2) 12.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240329/202403291254.0XqikdBT-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403291254.0XqikdBT-lkp@intel.com/

All errors (new ones prefixed by >>):

   lib/test_fpu_glue.c: In function 'test_fpu_init':
>> lib/test_fpu_glue.c:41:14: error: implicit declaration of function 'kernel_fpu_available' [-Werror=implicit-function-declaration]
      41 |         if (!kernel_fpu_available())
         |              ^~~~~~~~~~~~~~~~~~~~
   cc1: some warnings being treated as errors


vim +/kernel_fpu_available +41 lib/test_fpu_glue.c

    38	
    39	static int __init test_fpu_init(void)
    40	{
  > 41		if (!kernel_fpu_available())
    42			return -EINVAL;
    43	
    44		selftest_dir = debugfs_create_dir("selftest_helpers", NULL);
    45		if (!selftest_dir)
    46			return -ENOMEM;
    47	
    48		debugfs_create_file_unsafe("test_fpu", 0444, selftest_dir, NULL,
    49					   &test_fpu_fops);
    50	
    51		return 0;
    52	}
    53	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
