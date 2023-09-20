Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 658B23715F
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 13:29:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695216556; x=1726752556;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=KgVlJmZWlTJMzITqZ+zqw8VERJrBQAO8BsWhuc6o/NM=;
  b=iHpd/b9BRjqORYqxkEapw8NDsJ85uqoHv7/pdULVm3MGEcB2G5Kgq3Un
   yLp47BetgvYyKX06Yioxgg4bwAtDZDltZnB9QpnFEDpUPo1WEmqMwWZGj
   HDIiP0lPuFNdsayGaj88wxsQMStz8D7/HsHfkoH98djuqii4/F8aPtThc
   HNWcMgNwA5iYCne9Z+ltOCne55Zn3mnonM7Jl0iE818VICWQiYpSXqy13
   3kzsnhoVFt4wT03f0hf2tp+frVYdlhWhYYePEHaJ5g53wT7YDIt8uT0PP
   3cWX6uHYWABES0dWn/ZtATJSzdS6afm9nzbjWs3wriobQ1NG5b5+diLw1
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="384065951"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="384065951"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 06:29:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10839"; a="749905087"
X-IronPort-AV: E=Sophos;i="6.03,162,1694761200"; 
   d="scan'208";a="749905087"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 20 Sep 2023 06:29:00 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qixGE-0008lx-08;
	Wed, 20 Sep 2023 13:28:58 +0000
Date: Wed, 20 Sep 2023 21:26:12 +0800
From: kernel test robot <lkp@intel.com>
To: Peter Ujfalusi <peter.ujfalusi@ti.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [omap-audio:peter/linux-next-wip 14/48]
 sound/soc/soc-utils.c:251:34: warning: 'soc_dummy_ids' defined but not used
Message-ID: <202309202125.zNFUMUGE-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/omap-audio/linux-audio peter/linux-next-wip
head:   53915ce9abe60ba07d0e5456948553edefc6cbfb
commit: 895dc8ae1b62037335ccdb5881f24af8ca95fdc1 [14/48] ASoC: soc-utils: HACK: DT binding for snd-soc-dummy
config: x86_64-buildonly-randconfig-002-20230920 (https://download.01.org/0day-ci/archive/20230920/202309202125.zNFUMUGE-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309202125.zNFUMUGE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309202125.zNFUMUGE-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/soc-utils.c:251:34: warning: 'soc_dummy_ids' defined but not used [-Wunused-const-variable=]
     251 | static const struct of_device_id soc_dummy_ids[] = {
         |                                  ^~~~~~~~~~~~~


vim +/soc_dummy_ids +251 sound/soc/soc-utils.c

   250	
 > 251	static const struct of_device_id soc_dummy_ids[] = {
   252		{ .compatible = "linux,snd-soc-dummy", },
   253		{ }
   254	};
   255	MODULE_DEVICE_TABLE(of, soc_dummy_ids);
   256	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
