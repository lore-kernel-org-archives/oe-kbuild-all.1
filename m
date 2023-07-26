Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EC6021D39
	for <oe-kbuild-all@lists.linux.dev>; Wed, 26 Jul 2023 14:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1690380432; x=1721916432;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=+ke1BkXlGl7lJUSNcfkVDwXWN1HlHbQwvk3haYf+lww=;
  b=gWj4JUWwK2MRraPvChZR0PauokQjQVAykiVpPjaVjW+OU10ddaR8q5rq
   si6wMjfyla8UlvGLvI2yuuONlqLh19G3wYGSWcH3q6UpRYJnqtVa99NO2
   ASk9sFYpI5qjGZiQE5CHKPS3dYHmMyDPbpFUhH1V2EICycvzV7Vh1tYS1
   WDzA3CJngtKjR/4sftdJ04falgWeMu6oMVC3mpD10Ln9/oYMMEJjra4qk
   A5pSbUgmkXOZFkr9uE8yIjpBhhddI04k1P+0CvuECwzPQkx1CiyHWgA5K
   kA6q4Eow9WbIfL1Dj6JxVRFJ1cFCsLSWClqTwXKiDxtIYjg3lfkAN0yxq
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="365481818"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="365481818"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 Jul 2023 07:07:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10783"; a="703739662"
X-IronPort-AV: E=Sophos;i="6.01,232,1684825200"; 
   d="scan'208";a="703739662"
Received: from lkp-server02.sh.intel.com (HELO 953e8cd98f7d) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 26 Jul 2023 07:07:09 -0700
Received: from kbuild by 953e8cd98f7d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qOfAS-00010U-38;
	Wed, 26 Jul 2023 14:07:08 +0000
Date: Wed, 26 Jul 2023 22:06:59 +0800
From: kernel test robot <lkp@intel.com>
To: Greg KH <greg@kroah.com>
Cc: oe-kbuild-all@lists.linux.dev, Peter Zijlstra <peterz@infradead.org>
Subject: [peterz-queue:core/guards2 19/55] kernel/events/core.c:11388:1:
 warning: 'static' is not at beginning of declaration
Message-ID: <202307262155.0Fj30YQG-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/peterz/queue.git core/guards2
head:   bef4845ab42c7a28ab63629ea1e619cbe51cccad
commit: 251e48298d67e2562346cb08683a6fd470095aec [19/55] perf/core: Fix narrow startup race when creating the perf nr_addr_filters sysfs file
config: arm-randconfig-r046-20230726 (https://download.01.org/0day-ci/archive/20230726/202307262155.0Fj30YQG-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230726/202307262155.0Fj30YQG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307262155.0Fj30YQG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/events/core.c:11388:1: warning: 'static' is not at beginning of declaration [-Wold-style-declaration]
   11388 | const static struct attribute_group *pmu_dev_groups[] = {
         | ^~~~~


vim +/static +11388 kernel/events/core.c

 11387	
 11388	const static struct attribute_group *pmu_dev_groups[] = {
 11389		&pmu_dev_attr_group,
 11390		NULL,
 11391	};
 11392	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
