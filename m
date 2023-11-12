Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 167AA1840
	for <oe-kbuild-all@lists.linux.dev>; Sun, 12 Nov 2023 02:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ZQOXVQX4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699757809; x=1731293809;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=BkSL3nCgo0GguoyiHtH8QGOQwv/jQtbkQV3vMQdjSL8=;
  b=ZQOXVQX4d1tu5kQMXC6XOF+hqa8llN4ThWtxs5LnHfSUvKeIoUfIs91h
   FVOJJ3gXlcYEFT67/ZZldSYdOnKDuOQBd8HWmOZWtSHUDSQgJTbsQ8N+0
   v63MTCWzHCBrCjfKEBUGOBYXUO/rCLZssppMjdchBN9K3JmmSfaBR1fAL
   9+m63QWh9uDqPpxgcqYwwyW+YhIB8iMiN93t0odo6FS6A8RNeRrbbIjto
   qvlhqmA1SxFhhvEUXMJ1cKBxJCMpZ2v6Uj78bfhgbgvxF2Zq/t7XruU6d
   tw0vudnviAufnPetlIu9jsJ5ga/WsPZkxzZ5Ph039eNRiD30tGgKsdgiv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="11859138"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="11859138"
Received: from fmsmga002.fm.intel.com ([10.253.24.26])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Nov 2023 18:56:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10891"; a="881320856"
X-IronPort-AV: E=Sophos;i="6.03,296,1694761200"; 
   d="scan'208";a="881320856"
Received: from lkp-server01.sh.intel.com (HELO 17d9e85e5079) ([10.239.97.150])
  by fmsmga002.fm.intel.com with ESMTP; 11 Nov 2023 18:56:46 -0800
Received: from kbuild by 17d9e85e5079 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1r20eS-000Au6-2X;
	Sun, 12 Nov 2023 02:56:44 +0000
Date: Sun, 12 Nov 2023 10:55:45 +0800
From: kernel test robot <lkp@intel.com>
To: Marcelo Tosatti <mtosatti@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: drivers/cpuidle/governors/ladder.c:54: warning: Function parameter
 or member 'dev' not described in 'ladder_do_selection'
Message-ID: <202311121013.hcdaCtXP-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Marcelo,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   3ca112b71f35dd5d99fc4571a56b5fc6f0c15814
commit: 7d4daeedd575bbc3c40c87fc6708a8b88c50fe7e governors: unify last_state_idx
date:   4 years, 3 months ago
config: x86_64-alldefconfig (https://download.01.org/0day-ci/archive/20231112/202311121013.hcdaCtXP-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231112/202311121013.hcdaCtXP-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202311121013.hcdaCtXP-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpuidle/governors/ladder.c:54: warning: Function parameter or member 'dev' not described in 'ladder_do_selection'


vim +54 drivers/cpuidle/governors/ladder.c

4f86d3a8e29720 Len Brown       2007-10-03  44  
4f86d3a8e29720 Len Brown       2007-10-03  45  /**
4f86d3a8e29720 Len Brown       2007-10-03  46   * ladder_do_selection - prepares private data for a state change
4f86d3a8e29720 Len Brown       2007-10-03  47   * @ldev: the ladder device
4f86d3a8e29720 Len Brown       2007-10-03  48   * @old_idx: the current state index
4f86d3a8e29720 Len Brown       2007-10-03  49   * @new_idx: the new target state index
4f86d3a8e29720 Len Brown       2007-10-03  50   */
7d4daeedd575bb Marcelo Tosatti 2019-07-03  51  static inline void ladder_do_selection(struct cpuidle_device *dev,
7d4daeedd575bb Marcelo Tosatti 2019-07-03  52  				       struct ladder_device *ldev,
4f86d3a8e29720 Len Brown       2007-10-03  53  				       int old_idx, int new_idx)
4f86d3a8e29720 Len Brown       2007-10-03 @54  {
4f86d3a8e29720 Len Brown       2007-10-03  55  	ldev->states[old_idx].stats.promotion_count = 0;
4f86d3a8e29720 Len Brown       2007-10-03  56  	ldev->states[old_idx].stats.demotion_count = 0;
7d4daeedd575bb Marcelo Tosatti 2019-07-03  57  	dev->last_state_idx = new_idx;
4f86d3a8e29720 Len Brown       2007-10-03  58  }
4f86d3a8e29720 Len Brown       2007-10-03  59  

:::::: The code at line 54 was first introduced by commit
:::::: 4f86d3a8e297205780cca027e974fd5f81064780 cpuidle: consolidate 2.6.22 cpuidle branch into one patch

:::::: TO: Len Brown <len.brown@intel.com>
:::::: CC: Len Brown <len.brown@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
