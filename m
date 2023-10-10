Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.115])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89AC522D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 10 Oct 2023 04:10:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="cs5o+xCV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1696911011; x=1728447011;
  h=date:from:cc:subject:message-id:mime-version;
  bh=vxU1wwXMEs7XFEtvlW0rN+R8ZKAhfz/4lfpSJvm8C6c=;
  b=cs5o+xCVh4XyqZT7UM1tduLWKpt6Rj0W4atzUyzlIxdwGxwA+xqfPQa0
   LHc4CXfFZPboXErtPD3ofGYCZ9OeJA8Arosa0kU1jV4IlZGtNh3zfdoln
   vyP9Pu0VjAtUV4+7gZ63IRlaVH6Z9ua/nvi23DGEghTpdi0eiY1XHVXW1
   GjtA2u6k8tedBKK+mUM2e9pTOduPRBDWV2liel7gQO7qCAP6ni91ZBKsv
   2hwb5+xymEdQOGBx+n52mfe+HYWt+2lZaGfhgyPormWXUS+tIYiY3nE0o
   Czy7FZ8tlPbTiHOHkR2tHb+vPQBnkhd9r/EmGnq4zsYjTgRitWXg7oKMa
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="384164577"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="384164577"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmsmga103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Oct 2023 21:10:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10858"; a="869510327"
X-IronPort-AV: E=Sophos;i="6.03,211,1694761200"; 
   d="scan'208";a="869510327"
Received: from lkp-server02.sh.intel.com (HELO 4ed589823ba4) ([10.239.97.151])
  by fmsmga002.fm.intel.com with ESMTP; 09 Oct 2023 21:10:09 -0700
Received: from kbuild by 4ed589823ba4 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qq44N-00014w-23
	for oe-kbuild-all@lists.linux.dev;
	Tue, 10 Oct 2023 04:10:07 +0000
Date: Tue, 10 Oct 2023 12:09:49 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [intel-lts:5.15/dovetail-xenomai 2251/28233]
 kernel/irq_work.c:52:13: warning: no previous declaration for
 'irq_local_work_raise'
Message-ID: <202310101258.L5nDd8Nh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/intel/linux-intel-lts.git 5.15/dovetail-xenomai
head:   ec73c4e7ce8bba4e7ebdcd217ef20f768b63b4cc
commit: 2d5253bea505b64cf79922d14e34f1411e1b9b95 [2251/28233] genirq: irq_pipeline: add IRQ pipeline core
config: i386-buildonly-randconfig-005-20230929 (https://download.01.org/0day-ci/archive/20231010/202310101258.L5nDd8Nh-lkp@intel.com/config)
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231010/202310101258.L5nDd8Nh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310101258.L5nDd8Nh-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/irq_work.c:52:13: warning: no previous declaration for 'irq_local_work_raise' [-Wmissing-declarations]
    void __weak irq_local_work_raise(void)
                ^~~~~~~~~~~~~~~~~~~~


vim +/irq_local_work_raise +52 kernel/irq_work.c

    51	
  > 52	void __weak irq_local_work_raise(void)
    53	{
    54		arch_irq_work_raise();
    55	}
    56	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
