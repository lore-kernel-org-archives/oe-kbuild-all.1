Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4BA119458
	for <oe-kbuild-all@lists.linux.dev>; Fri,  3 Nov 2023 14:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="OR/uw+65"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699022478; x=1730558478;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=o+YuKJmaegRahpKR9LbxCJPjuXh4BbKIkXD16gjpKcM=;
  b=OR/uw+65hLMg1jSsTSjBFt4W6oq3Yp77XLLxiBb/op9HCNY6ch7HiiXy
   N5RNhgYS2UlZfRZzn5Nc7toZYfDPeFSt/BwnBx01tUDffinVR8hz/I+Or
   GWDZUzZ+eP4eqfnBeNqr2uypihNxsyYmse6r31PRmwClQlZbahnkNQ8gD
   GWf0dkgaPRbj/e+x0ngrra4hZwEBv5CgWMW1DzQOEDxGqPi8oZGtQnll8
   pS3icPims3roFoLeBN1hahth5UpmTK08ve9ENz1obAfZ0nQasaz+gN2gQ
   GPTb3yoIEl5aR53ZZb+qOmBwqiAfwW32mhm5fnRc4awO2WtQyBxi+el4L
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="368298827"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="368298827"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 03 Nov 2023 07:41:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10883"; a="755171745"
X-IronPort-AV: E=Sophos;i="6.03,273,1694761200"; 
   d="scan'208";a="755171745"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 03 Nov 2023 07:41:16 -0700
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qyvMI-0002al-0o;
	Fri, 03 Nov 2023 14:41:14 +0000
Date: Fri, 3 Nov 2023 22:40:14 +0800
From: kernel test robot <lkp@intel.com>
To: Prasanth Babu Mantena <p-mantena@ti.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Praneeth Bajjuri <praneeth@ti.com>
Subject: [ti:ti-rt-linux-6.1.y-cicd 21/28]
 drivers/media/platform/chips-media/wave5/wave5-helper.c:248:35: warning:
 variable 'req_freq' set but not used
Message-ID: <202311032240.4sEjEYyd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y-cicd
head:   765670365233dc7ad139e5e96c437d333ae94543
commit: 1bb45095919cd3307dd7729168754a3212b7a119 [21/28] arm64: media: wave5: Add Support for frequency points
config: alpha-allyesconfig (https://download.01.org/0day-ci/archive/20231103/202311032240.4sEjEYyd-lkp@intel.com/config)
compiler: alpha-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231103/202311032240.4sEjEYyd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311032240.4sEjEYyd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/platform/chips-media/wave5/wave5-helper.c: In function 'wave5_instance_set_clk':
>> drivers/media/platform/chips-media/wave5/wave5-helper.c:248:35: warning: variable 'req_freq' set but not used [-Wunused-but-set-variable]
     248 |         unsigned long pixel_rate, req_freq;
         |                                   ^~~~~~~~


vim +/req_freq +248 drivers/media/platform/chips-media/wave5/wave5-helper.c

   243	
   244	
   245	int wave5_instance_set_clk(struct vpu_instance *inst)
   246	{
   247		int width, height, framerate;
 > 248		unsigned long pixel_rate, req_freq;

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
