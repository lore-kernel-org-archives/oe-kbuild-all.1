Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5695CA46
	for <oe-kbuild-all@lists.linux.dev>; Thu,  6 Jul 2023 04:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688618178; x=1720154178;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=y3iq5YDal45OS2tptQ6AvDKWGdIS7dnILjH0IuhJFc8=;
  b=LxuEXWSN7Cy5Mq4yVXS5YR4V/wNa6rXWwklVNOQQiNxT/zyG+zI5jRZq
   Zm6bs4sQq/kC9QiVx+q+2vxtW+o6J/IT6Y9cwMcTzmLPCMP1NqsogKy0Z
   m3wiJ0l++yGVxjzyZuwZUsGSwvj5f1RtzqdHLopV/eDn/kL7S8KSeF4lz
   NzXpT9v4FR63uN29KOfJGdvVcDCsVsEF+OK5Dwp7cKYHsHZuZWvNvxtOc
   16JzhvKyZtwG7sJG76KYrDY8b6KWrR91hjcDVQS7MGrBxFKBhuStXoNAJ
   CXtXr6gGGyxcHOETYHsxETjtC7bLigL0ihzycvaJuBK0+UuC5MkMrEiOt
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="343832202"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="343832202"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jul 2023 21:36:17 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10762"; a="966073753"
X-IronPort-AV: E=Sophos;i="6.01,184,1684825200"; 
   d="scan'208";a="966073753"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by fmsmga006.fm.intel.com with ESMTP; 05 Jul 2023 21:36:16 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qHGj1-000158-0q;
	Thu, 06 Jul 2023 04:36:15 +0000
Date: Thu, 6 Jul 2023 12:35:30 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 26201/28660]
 mm/vmscan.c:4940:5: warning: no previous prototype for 'print_node_mglru'
Message-ID: <202307061256.8ehqywGD-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common mirror-chromeos-5.10-arcvm
head:   f525b45859c737549efe5a735c935e0ee895e875
commit: 5c82b782d441ff1b64fdf4d9f0617319c61c2e2b [26201/28660] CHROMIUM: Implementation of MGLRU in sysfs
config: x86_64-allyesconfig (https://download.01.org/0day-ci/archive/20230706/202307061256.8ehqywGD-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230706/202307061256.8ehqywGD-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307061256.8ehqywGD-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vmscan.c:683:15: warning: no previous prototype for 'shrink_slab' [-Wmissing-prototypes]
     683 | unsigned long shrink_slab(gfp_t gfp_mask, int nid,
         |               ^~~~~~~~~~~
>> mm/vmscan.c:4940:5: warning: no previous prototype for 'print_node_mglru' [-Wmissing-prototypes]
    4940 | int print_node_mglru(struct lruvec *lruvec, char *buf, int orig_pos)
         |     ^~~~~~~~~~~~~~~~
   mm/vmscan.c: In function 'store_lru_gen_admin':
   mm/vmscan.c:5062:61: warning: format '%n' expects argument of type 'int *', but argument 11 has type 'long unsigned int *' [-Wformat=]
    5062 |                 n = sscanf(cur, "%c %u %u %lu %n %u %n %lu %n", &cmd, &memcg_id, &nid,
         |                                                            ~^
         |                                                             |
         |                                                             int *
         |                                                            %ln
    5063 |                            &seq, &end, &swappiness, &end, &nr_to_reclaim, &opt, &end);
         |                                                                           ~~~~
         |                                                                           |
         |                                                                           long unsigned int *
   mm/vmscan.c:5062:33: warning: too many arguments for format [-Wformat-extra-args]
    5062 |                 n = sscanf(cur, "%c %u %u %lu %n %u %n %lu %n", &cmd, &memcg_id, &nid,
         |                                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/vmscan.c:5069:56: warning: passing argument 5 of 'run_cmd' makes pointer from integer without a cast [-Wint-conversion]
    5069 |                 err = run_cmd(cmd, memcg_id, nid, seq, swappiness, nr_to_reclaim, opt);
         |                                                        ^~~~~~~~~~
         |                                                        |
         |                                                        unsigned int
   mm/vmscan.c:4867:41: note: expected 'struct scan_control *' but argument is of type 'unsigned int'
    4867 |                    struct scan_control *sc, int swappiness, unsigned long opt);
         |                    ~~~~~~~~~~~~~~~~~~~~~^~


vim +/print_node_mglru +4940 mm/vmscan.c

  4939	
> 4940	int print_node_mglru(struct lruvec *lruvec, char *buf, int orig_pos)
  4941	{
  4942		unsigned long seq;
  4943		struct lru_gen_struct *lrugen = &lruvec->lrugen;
  4944	
  4945		DEFINE_MAX_SEQ(lruvec);
  4946		DEFINE_MIN_SEQ(lruvec);
  4947	
  4948		int print_pos = orig_pos;
  4949	
  4950		seq = min(min_seq[0], min_seq[1]);
  4951	
  4952		for (; seq <= max_seq; seq++) {
  4953			int gen, type, zone;
  4954			unsigned int msecs;
  4955	
  4956			gen = lru_gen_from_seq(seq);
  4957			msecs = jiffies_to_msecs(jiffies - READ_ONCE(lrugen->timestamps[gen]));
  4958	
  4959			print_pos += snprintf(buf + print_pos, PAGE_SIZE - print_pos,
  4960				" %10lu %10u", seq, msecs);
  4961	
  4962			for (type = 0; type < ANON_AND_FILE; type++) {
  4963				long size = 0;
  4964	
  4965				if (seq < min_seq[type]) {
  4966					print_pos += snprintf(buf + print_pos,
  4967						PAGE_SIZE - print_pos, "         -0 ");
  4968					continue;
  4969				}
  4970	
  4971				for (zone = 0; zone < MAX_NR_ZONES; zone++)
  4972					size += READ_ONCE(lrugen->nr_pages[gen][type][zone]);
  4973	
  4974				print_pos += snprintf(buf + print_pos,
  4975					PAGE_SIZE - print_pos, " %10lu ", max(size, 0L));
  4976			}
  4977	
  4978			print_pos += snprintf(buf + print_pos, PAGE_SIZE - print_pos, "\n");
  4979	
  4980		}
  4981	
  4982		return print_pos - orig_pos;
  4983	}
  4984	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
