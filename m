Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FC87D2ED
	for <oe-kbuild-all@lists.linux.dev>; Thu,  9 Nov 2023 18:49:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MFj04fU8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699555767; x=1731091767;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g4w5mhUufILy/kG40cOiZPylx+qY//I5wRWasF7dG4A=;
  b=MFj04fU8T803LF5NuZY28AdBsv8iBr8t34TZEz/nFqTwwjXWF3qNZfKE
   svr+8c6NEFcFE3LRo+AeS2f7tdBD6liRbuJZDQ/+RLrQqgdOiBgZ1Mmzu
   EBz+oN6VJaMdjW9gH1S9WDiXpCW+KBF7cVN1bbfW/ovg93hCZog27KgmM
   gu8XrpeFv8TRFZVTUIFbkYdoE9gNa9MdY30ZvT7Z0Gh9So1rDyP5SD8Gu
   q90tL/17qa0crvOOX2Bg3WcGDaVhWCPPabhNxCXRbNWejMfZbAIOzoAX2
   W/9mGt2D4egGqHdm9PaGjQW8D7XmIwdIpYYAtYTJcEi0RIuh2MstcvUkf
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="3033673"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="3033673"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Nov 2023 10:49:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10889"; a="829414675"
X-IronPort-AV: E=Sophos;i="6.03,290,1694761200"; 
   d="scan'208";a="829414675"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga008.fm.intel.com with ESMTP; 09 Nov 2023 10:49:22 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r1A5f-00092v-2w;
	Thu, 09 Nov 2023 18:49:20 +0000
Date: Fri, 10 Nov 2023 02:49:15 +0800
From: kernel test robot <lkp@intel.com>
To: Sudeep Holla <sudeep.holla@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sudeep-holla:v6.7/ffa_integ_test 5/5]
 drivers/firmware/arm_ffa/test_driver.c:28:6: warning: no previous prototype
 for 'test_ffa_notif_cb'
Message-ID: <202311100209.nmATysYA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sudeep.holla/linux.git v6.7/ffa_integ_test
head:   0dfce5abe57576c4804fc626172b0cd80a320c1c
commit: 0dfce5abe57576c4804fc626172b0cd80a320c1c [5/5] firmware: arm_ffa: Add test driver
config: arm64-randconfig-001-20231110 (https://download.01.org/0day-ci/archive/20231110/202311100209.nmATysYA-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231110/202311100209.nmATysYA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311100209.nmATysYA-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/firmware/arm_ffa/test_driver.c:28:6: warning: no previous prototype for 'test_ffa_notif_cb' [-Wmissing-prototypes]
      28 | void test_ffa_notif_cb(int notification_id, void *data)
         |      ^~~~~~~~~~~~~~~~~


vim +/test_ffa_notif_cb +28 drivers/firmware/arm_ffa/test_driver.c

    26	
    27	
  > 28	void test_ffa_notif_cb(int notification_id, void *data)
    29	{
    30		pr_info("%x %p\n", notification_id, data);
    31	}
    32	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
