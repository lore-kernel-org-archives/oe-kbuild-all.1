Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B75B2DF42
	for <oe-kbuild-all@lists.linux.dev>; Sat, 23 Sep 2023 15:55:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695484521; x=1727020521;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=sOa6pvLzLFZ42Rcs+LAbQLfQFRwFlQxwxwLMy9tfJ5I=;
  b=azf2y93B40mKFU68Wnuhd8IsArhqOFw9pV5hRs6Rnw68ZwyUVhyeErQm
   12jYYdyWNfFy9oXTOgZJNDQc+05Ysyr9DUCgfWTPpCY+whStG25c3PgNq
   +ot5ERT/9gIwWZS9JtIHDD6bHUSK2VL3zK+BeEmBMzKqIKvwluwpIOg1Y
   kbbqPvlDKFTO2cIJjJQ87HOiC1ttnDrIWFiFHrfZoWAoZGKLqXjBs4n4K
   dwF91JDRY3r6Dpu+SvFkwglfdHFf0PvQltAQex1Qp8suznCdD4tOrU73Y
   ZblbRQd0RjJBH2IKw/9bs0fguP9MkDHgzL3Q0NmQdsIjKYP48cyZFbklX
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="361280753"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="361280753"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 23 Sep 2023 08:55:20 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10842"; a="751184148"
X-IronPort-AV: E=Sophos;i="6.03,171,1694761200"; 
   d="scan'208";a="751184148"
Received: from lkp-server02.sh.intel.com (HELO 493f6c7fed5d) ([10.239.97.151])
  by fmsmga007.fm.intel.com with ESMTP; 23 Sep 2023 08:55:19 -0700
Received: from kbuild by 493f6c7fed5d with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qk4yT-0002XR-0W;
	Sat, 23 Sep 2023 15:55:17 +0000
Date: Sat, 23 Sep 2023 23:55:07 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, Shaopeng Tan <tan.shaopeng@fujitsu.com>
Subject: [morse:mpam/monitors_and_locking/v6 8/24]
 arch/x86/kernel/cpu/resctrl/monitor.c:55: warning: Cannot understand  *
 @closid_num_dirty_rmid    The number of dirty RMID each CLOSID has.
Message-ID: <202309232302.z3yFQvXl-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/monitors_and_locking/v6
head:   60cd5a617cf6d65701aa6a1d75435b9c05ee7e7b
commit: b8aa13691f6a30d3349ab5625d55ac27566d52f5 [8/24] x86/resctrl: Track the number of dirty RMID a CLOSID has
config: i386-randconfig-012-20230923 (https://download.01.org/0day-ci/archive/20230923/202309232302.z3yFQvXl-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230923/202309232302.z3yFQvXl-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309232302.z3yFQvXl-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/resctrl/monitor.c:48: warning: Cannot understand  * @rmid_free_lru    A least recently used list of free RMIDs
    on line 48 - I thought it was a doc line
>> arch/x86/kernel/cpu/resctrl/monitor.c:55: warning: Cannot understand  * @closid_num_dirty_rmid    The number of dirty RMID each CLOSID has.
    on line 55 - I thought it was a doc line
   arch/x86/kernel/cpu/resctrl/monitor.c:62: warning: Cannot understand  * @rmid_limbo_count     count of currently unused but (potentially)
    on line 62 - I thought it was a doc line
   arch/x86/kernel/cpu/resctrl/monitor.c:71: warning: Cannot understand  * @rmid_entry - The entry in the limbo and free lists.
    on line 71 - I thought it was a doc line


vim +55 arch/x86/kernel/cpu/resctrl/monitor.c

    53	
    54	/**
  > 55	 * @closid_num_dirty_rmid    The number of dirty RMID each CLOSID has.
    56	 *     Only allocated when CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID is defined.
    57	 *     Indexed by CLOSID. Protected by rdtgroup_mutex.
    58	 */
    59	static unsigned int *closid_num_dirty_rmid;
    60	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
