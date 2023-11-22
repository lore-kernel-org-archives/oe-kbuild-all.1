Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BAE297469
	for <oe-kbuild-all@lists.linux.dev>; Wed, 22 Nov 2023 12:41:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="G3drv4zI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1700656882; x=1732192882;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=vIidtCM9kjjiM/dlwk8xtUVUPMklbi02Xe8XiNDARKc=;
  b=G3drv4zIhaU5466wQ4EEwcVb/372N0isw/LgeqYrFY3axyTgnSWSOsl5
   uBG2bdqZCFGvIg9phN9smP3vPbjz7607XYAMyBWD6Cdl3Lv05TnR/juoF
   OCsv3fNxZ2WwfubfzTsCvQAimf/0b+pQxhJcYQzFM+7dJfb3bFWPw4YxF
   CiBK0Wqx+iz6LkbIlMJzG8LE73RStSzrpmr+QX9+l4RMjgLzy/sx8aQ2u
   Tz6E/XOfuHvuoxOomJf58+40X69sFaiTWXX/ZQ6fk/x37XNzGtniyHo/R
   /ANeV51Zkev7w+KCvh6WL+xNKmrWjU9zAyrKe/hsaU/8c2UC68V8snyX7
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="391814864"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="391814864"
Received: from fmsmga005.fm.intel.com ([10.253.24.32])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Nov 2023 04:41:18 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10901"; a="1098385914"
X-IronPort-AV: E=Sophos;i="6.04,218,1695711600"; 
   d="scan'208";a="1098385914"
Received: from lkp-server01.sh.intel.com (HELO d584ee6ebdcc) ([10.239.97.150])
  by fmsmga005.fm.intel.com with ESMTP; 22 Nov 2023 04:41:17 -0800
Received: from kbuild by d584ee6ebdcc with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r5mXb-0000St-26;
	Wed, 22 Nov 2023 12:41:15 +0000
Date: Wed, 22 Nov 2023 20:40:48 +0800
From: kernel test robot <lkp@intel.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [arm-integrator:kernel-in-vmalloc-v6.7-rc1 5/5] setup.c:undefined
 reference to `kernel_sec_end'
Message-ID: <202311221755.k8WmpOzZ-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-integrator.git kernel-in-vmalloc-v6.7-rc1
head:   5c1e67778bd34494bdd0eb10ad26e3db1378c43a
commit: 5c1e67778bd34494bdd0eb10ad26e3db1378c43a [5/5] hack to print highmem and vmalloc start
config: arm-allnoconfig (https://download.01.org/0day-ci/archive/20231122/202311221755.k8WmpOzZ-lkp@intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231122/202311221755.k8WmpOzZ-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311221755.k8WmpOzZ-lkp@intel.com/

All errors (new ones prefixed by >>):

   arm-linux-gnueabi-ld: arch/arm/kernel/setup.o: in function `setup_arch':
>> setup.c:(.init.text+0x7e4): undefined reference to `kernel_sec_end'
>> arm-linux-gnueabi-ld: setup.c:(.init.text+0x7e8): undefined reference to `kernel_sec_start'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
