Received: from mga01.intel.com (mga01.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28B4C10F0
	for <oe-kbuild-all@lists.linux.dev>; Wed,  5 Jul 2023 06:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1688537658; x=1720073658;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=IzWPPCLbwECkxT4vSI36ghWZUPGUnzoGq7zTUreOpKE=;
  b=GTp4eCLjtT8yq2c2dMhdIQhMfp/VaV838XM8vAZBzIQFS9D0V4sw46oY
   E/PjPRROEqf2mc9ysjC+rR9scNSlvapdrQwOwDsQUmvTPcvDDpmQnGhf9
   KWX5jUtU6ZF0qpqn2IMyfOe6g9TIlnt7hI7LiBkBm0fVMGgLy11aBQbdz
   zJLUPFWL78AaIuzovndDP1aLUmWperiI/5huoSHqdkPMvWX294I2egkE7
   Oj+w1QC/tdaeyFKDNaiQqTRRxPpt+EFrmLcmdASkCGizNPyyLgDVYcq17
   BbgeCMULDbjwVnXapCrkLrvTgHBC0M8vb7n1rmsCGRlUQXcRYaigWhWkS
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="394008863"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="394008863"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2023 23:13:51 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10761"; a="696342051"
X-IronPort-AV: E=Sophos;i="6.01,182,1684825200"; 
   d="scan'208";a="696342051"
Received: from lkp-server01.sh.intel.com (HELO c544d7fc5005) ([10.239.97.150])
  by orsmga006.jf.intel.com with ESMTP; 04 Jul 2023 23:13:50 -0700
Received: from kbuild by c544d7fc5005 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qGvlt-0000QG-1s;
	Wed, 05 Jul 2023 06:13:49 +0000
Date: Wed, 5 Jul 2023 14:13:07 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:mirror-chromeos-5.10-arcvm 23789/28660]
 mm/vmscan.c:4621:5: warning: no previous prototype for function
 'print_node_mglru'
Message-ID: <202307051453.1cnlmh4p-lkp@intel.com>
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
commit: 2038834ed810ff10b875445a030663d659c69500 [23789/28660] CHROMIUM: Reland of add implementation of MGLRU in sysfs
config: i386-randconfig-i011-20230705 (https://download.01.org/0day-ci/archive/20230705/202307051453.1cnlmh4p-lkp@intel.com/config)
compiler: clang version 15.0.7 (https://github.com/llvm/llvm-project.git 8dfdcc7b7bf66834a761bd8de445840ef68e4d1a)
reproduce: (https://download.01.org/0day-ci/archive/20230705/202307051453.1cnlmh4p-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202307051453.1cnlmh4p-lkp@intel.com/

All warnings (new ones prefixed by >>):

   mm/vmscan.c:678:15: warning: no previous prototype for function 'shrink_slab' [-Wmissing-prototypes]
   unsigned long shrink_slab(gfp_t gfp_mask, int nid,
                 ^
   mm/vmscan.c:678:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   unsigned long shrink_slab(gfp_t gfp_mask, int nid,
   ^
   static 
>> mm/vmscan.c:4621:5: warning: no previous prototype for function 'print_node_mglru' [-Wmissing-prototypes]
   int print_node_mglru(struct lruvec *lruvec, char *buf, int orig_pos)
       ^
   mm/vmscan.c:4621:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int print_node_mglru(struct lruvec *lruvec, char *buf, int orig_pos)
   ^
   static 
   mm/vmscan.c:4691:48: warning: format specifies type 'char *' but the argument has type 'void *' [-Wformat]
                                                   "memcg %5hu %s\n", mem_cgroup_id(memcg), path);
                                                               ~~                           ^~~~
   mm/vmscan.c:4702:7: error: incompatible integer to pointer conversion assigning to 'char *' from 'unsigned long' [-Wint-conversion]
                   buf = PAGE_SIZE - 1;
                       ^ ~~~~~~~~~~~~~
   3 warnings and 1 error generated.


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
