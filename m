Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA2B01B7EF
	for <oe-kbuild-all@lists.linux.dev>; Thu, 17 Aug 2023 22:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1692310658; x=1723846658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YKc6RYuQpC9ZUFAJWRZQQE+WZlHgAwvcZcMAZgusUGg=;
  b=fw3k0cXAd347VvgxQKb4VSFs6Ysvnqu1DMK/AXojuiAq14ekBETnBNzb
   l5Z8ELyr3qh2tbpG3hEDChr7LgdnhqJtROcDt60/pwwwH7N8+EJ8I0G2P
   nWFPRlPcMQLkhFLO7cSCGudAhtXktBFFCKD723HIQ+hyg97cult73grGA
   /OYAF2NOkMDlVjgK6lwKEVsv61RYaqXjm7NDjOnPUys0FCP7Vj7U0qxfT
   8WnIN/VS10zGsseNGG3v7Cr67cz60PGrkorbZmZ2tQ8elfXfxqPNXMq2O
   Y+jXyuH0zYlekGbUh6CbwELVuGVK82z4dU6xHgV2YSHN7jfDlkFtJZA85
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="357911753"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="357911753"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 17 Aug 2023 15:17:38 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10805"; a="711714209"
X-IronPort-AV: E=Sophos;i="6.01,181,1684825200"; 
   d="scan'208";a="711714209"
Received: from lkp-server02.sh.intel.com (HELO a9caf1a0cf30) ([10.239.97.151])
  by orsmga006.jf.intel.com with ESMTP; 17 Aug 2023 15:17:37 -0700
Received: from kbuild by a9caf1a0cf30 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qWlJA-0001VP-0p;
	Thu, 17 Aug 2023 22:17:36 +0000
Date: Fri, 18 Aug 2023 06:17:07 +0800
From: kernel test robot <lkp@intel.com>
To: James Morse <james.morse@arm.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [morse:mpam/monitors_and_locking/v5 6/24]
 arch/x86/kernel/cpu/resctrl/monitor.c:47: warning: Cannot understand  *
 @closid_num_dirty_rmid    The number of dirty RMID each CLOSID has.
Message-ID: <202308180627.0oav3dHd-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/monitors_and_locking/v5
head:   562c8d6543a4f032152fa2f72fc36f65bd9dae42
commit: 98252168f348d6d84ce98e9e0c92157d9988f264 [6/24] x86/resctrl: Track the number of dirty RMID a CLOSID has
config: x86_64-rhel-8.3-bpf (https://download.01.org/0day-ci/archive/20230818/202308180627.0oav3dHd-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230818/202308180627.0oav3dHd-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308180627.0oav3dHd-lkp@intel.com/

All warnings (new ones prefixed by >>):

   arch/x86/kernel/cpu/resctrl/monitor.c:40: warning: Cannot understand  * @rmid_free_lru    A least recently used list of free RMIDs
    on line 40 - I thought it was a doc line
>> arch/x86/kernel/cpu/resctrl/monitor.c:47: warning: Cannot understand  * @closid_num_dirty_rmid    The number of dirty RMID each CLOSID has.
    on line 47 - I thought it was a doc line
   arch/x86/kernel/cpu/resctrl/monitor.c:54: warning: Cannot understand  * @rmid_limbo_count     count of currently unused but (potentially)
    on line 54 - I thought it was a doc line
   arch/x86/kernel/cpu/resctrl/monitor.c:63: warning: Cannot understand  * @rmid_entry - The entry in the limbo and free lists.
    on line 63 - I thought it was a doc line


vim +47 arch/x86/kernel/cpu/resctrl/monitor.c

    45	
    46	/**
  > 47	 * @closid_num_dirty_rmid    The number of dirty RMID each CLOSID has.
    48	 * Only allocated when CONFIG_RESCTRL_RMID_DEPENDS_ON_CLOSID is defined.
    49	 * Indexed by CLOSID. Protected by rdtgroup_mutex.
    50	 */
    51	static int *closid_num_dirty_rmid;
    52	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
