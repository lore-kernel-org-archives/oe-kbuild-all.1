Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 852F04C9E
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jul 2023 10:18:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688552337; x=1720088337;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h71dZMZY9PjrEmE0s46MOXHD1z7Ryzf1qWs3lkNpL1g=;
  b=bEctA8YSTei5nOjHo7UXGM+rKotmyZE/v8a8FOcKS8/FR/huQI5ZrI0b
   e0Uuuh2KV4N/zjfKCqMmCdKCfPjiDlbqTQfptfQvUOe5FxUczJExeQiAa
   z3RscLHP2Z8whz92b1aEYnJBZ/ACqgZQYikJtEqQVk8wzxfO/J+JhEQ2O
   iuF4i41hCrWKX0+PC9Tvo07QFMj9a1y72D/l7im8Tyi1OQv6TaMSmI0Py
   e3GHT8WEFrdhPwzs5CHqVxptSqEZfU1e7MPxr7LQWZWILNeRYw/UZZxCd
   H03k/o03fewgluRQZqCMy5mlp0J5FpTuKOAhj6q4eeBF635ngxa0MjPTv
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="429338191"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="429338191"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 03:18:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="696403868"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="696403868"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 05 Jul 2023 03:18:55 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGzb4-0000ZW-3D;
	Wed, 05 Jul 2023 10:18:54 +0000
Date: Wed, 5 Jul 2023 18:18:31 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 23789/28660]
 mm/vmscan.c:4621:5: warning: no previous prototype for 'print_node_mglru'
Message-ID: <202307051825.hL3urMIB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Bryan,

FYI, the error/warning still remains.

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   f525b45859c737549efe5a735c935e0ee895e875
commit: 2038834ed810ff10b875445a030663d659c69500 [23789/28660] CHROMIUM: Reland of add implementation of MGLRU in sysfs
config: i386-allyesconfig (https://download.01.org/0day-ci/archive/20230705/202307051825.hL3urMIB-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307051825.hL3urMIB-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307051825.hL3urMIB-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vmscan.c:678:15: warning: no previous prototype for 'shrink_slab' [-Wmissing-prototypes]
     678 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^~~~~~~~~~~
>> mm/vmscan.c:4621:5: warning: no previous prototype for 'print_node_mglru' [-Wmissing-prototypes]
    4621 | int print_node_mglru(struct lruvec *lruvec, char *buf, int orig_pos)
         |     ^~~~~~~~~~~~~~~~
   mm/vmscan.c: In function 'show_lru_gen_admin':
   mm/vmscan.c:4691:62: warning: format '%s' expects argument of type 'char *', but argument 5 has type 'void *' [-Wformat=]
    4691 |                                                 "memcg %5hu %s\n", mem_cgroup_id(memcg), path);
         |                                                             ~^                           ~~~~
         |                                                              |                           |
         |                                                              char *                      void *
         |                                                             %p
   mm/vmscan.c:4702:21: warning: assignment to 'char *' from 'long unsigned int' makes pointer from integer without a cast [-Wint-conversion]
    4702 |                 buf = PAGE_SIZE - 1;
         |                     ^


vim +/print_node_mglru +4621 mm/vmscan.c

  4620	
> 4621	int print_node_mglru(struct lruvec *lruvec, char *buf, int orig_pos)
  4622	{
  4623		unsigned long seq;
  4624		struct lrugen *lrugen = &lruvec->evictable;
  4625	
  4626		DEFINE_MAX_SEQ(lruvec);
  4627		DEFINE_MIN_SEQ(lruvec);
  4628	
  4629		int print_pos = orig_pos;
  4630	
  4631		seq = min(min_seq[0], min_seq[1]);
  4632	
  4633		for (; seq <= max_seq; seq++) {
  4634			int gen, type, zone;
  4635			unsigned int msecs;
  4636	
  4637			gen = lru_gen_from_seq(seq);
  4638			msecs = jiffies_to_msecs(jiffies - READ_ONCE(lrugen->timestamps[gen]));
  4639	
  4640			print_pos += snprintf(buf + print_pos, PAGE_SIZE - print_pos,
  4641				" %10lu %10u", seq, msecs);
  4642	
  4643			for (type = 0; type < ANON_AND_FILE; type++) {
  4644				long size = 0;
  4645	
  4646				if (seq < min_seq[type]) {
  4647					print_pos += snprintf(buf + print_pos,
  4648						PAGE_SIZE - print_pos, "         -0 ");
  4649					continue;
  4650				}
  4651	
  4652				for (zone = 0; zone < MAX_NR_ZONES; zone++)
  4653					size += READ_ONCE(lrugen->sizes[gen][type][zone]);
  4654	
  4655				print_pos += snprintf(buf + print_pos,
  4656					PAGE_SIZE - print_pos, " %10lu ", max(size, 0L));
  4657			}
  4658	
  4659			print_pos += snprintf(buf + print_pos, PAGE_SIZE - print_pos, "\n");
  4660	
  4661		}
  4662	
  4663		return print_pos - orig_pos;
  4664	}
  4665	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
