Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5A2511C2AE
	for <oe-kbuild-all@lists.linux.dev>; Sat, 21 Oct 2023 17:42:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="YUACxfeE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697910144; x=1729446144;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=TAOgAmMpcce3ktAlcM1kCtu5dm/xjLW86GsQE1F0X1I=;
  b=YUACxfeE2fXnBm07WJgDsYfN27NTknpp+uM2ge3B7ekYv69q/2Bdfbee
   wSaOYkhzCX/BQ1xKZtttF0m/mTZyv+3GbdwyHa7fhhtRnLu5GgJfDcJba
   TuQIN5Ua04ruRpUJtwT4CwHtmguy5//tB/0J6yYu4dL5rIF0O/BbTMhtg
   WP8V1+hTViEUxcpqeo6gkouSyvw2HyJqyT6TV0kiYCz2FvP10DsVXrZVe
   QnDuIZMfYGG0NtDoZgK+mps21ud+Di7SfbOxkasa/+X1V6Bks+IGG5gNP
   l2UgYG1rHakFQG1TYTO5zK2OZ+pwQZEWOeRWa41PkWQE21NxtoAE6Gosn
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="383849808"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="383849808"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Oct 2023 10:42:19 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10870"; a="901418020"
X-IronPort-AV: E=Sophos;i="6.03,241,1694761200"; 
   d="scan'208";a="901418020"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmsmga001.fm.intel.com with ESMTP; 21 Oct 2023 10:40:05 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1quFzM-000566-0d;
	Sat, 21 Oct 2023 17:42:16 +0000
Date: Sun, 22 Oct 2023 01:41:44 +0800
From: kernel test robot <lkp@intel.com>
To: Marcelo Tosatti <mtosatti@redhat.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: drivers/cpuidle/governors/ladder.c:54: warning: Function parameter
 or member 'dev' not described in 'ladder_do_selection'
Message-ID: <202310220146.HIH4ghQD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   9c5d00cb7b6bbc5a7965d9ab7d223b5402d1f02c
commit: 7d4daeedd575bbc3c40c87fc6708a8b88c50fe7e governors: unify last_state_idx
date:   4 years, 3 months ago
config: x86_64-alldefconfig (https://download.01.org/0day-ci/archive/20231022/202310220146.HIH4ghQD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231022/202310220146.HIH4ghQD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310220146.HIH4ghQD-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/cpuidle/governors/ladder.c:54: warning: Function parameter or member 'dev' not described in 'ladder_do_selection'


vim +54 drivers/cpuidle/governors/ladder.c

4f86d3a8e297205 Len Brown       2007-10-03  44  
4f86d3a8e297205 Len Brown       2007-10-03  45  /**
4f86d3a8e297205 Len Brown       2007-10-03  46   * ladder_do_selection - prepares private data for a state change
4f86d3a8e297205 Len Brown       2007-10-03  47   * @ldev: the ladder device
4f86d3a8e297205 Len Brown       2007-10-03  48   * @old_idx: the current state index
4f86d3a8e297205 Len Brown       2007-10-03  49   * @new_idx: the new target state index
4f86d3a8e297205 Len Brown       2007-10-03  50   */
7d4daeedd575bbc Marcelo Tosatti 2019-07-03  51  static inline void ladder_do_selection(struct cpuidle_device *dev,
7d4daeedd575bbc Marcelo Tosatti 2019-07-03  52  				       struct ladder_device *ldev,
4f86d3a8e297205 Len Brown       2007-10-03  53  				       int old_idx, int new_idx)
4f86d3a8e297205 Len Brown       2007-10-03 @54  {
4f86d3a8e297205 Len Brown       2007-10-03  55  	ldev->states[old_idx].stats.promotion_count = 0;
4f86d3a8e297205 Len Brown       2007-10-03  56  	ldev->states[old_idx].stats.demotion_count = 0;
7d4daeedd575bbc Marcelo Tosatti 2019-07-03  57  	dev->last_state_idx = new_idx;
4f86d3a8e297205 Len Brown       2007-10-03  58  }
4f86d3a8e297205 Len Brown       2007-10-03  59  

:::::: The code at line 54 was first introduced by commit
:::::: 4f86d3a8e297205780cca027e974fd5f81064780 cpuidle: consolidate 2.6.22 cpuidle branch into one patch

:::::: TO: Len Brown <len.brown@intel.com>
:::::: CC: Len Brown <len.brown@intel.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
