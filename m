Received: from mga11.intel.com (mga11.intel.com [192.55.52.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BFE517FF
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 04:22:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681186974; x=1712722974;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=AoafrAVFL5D9UrbGpTcIUih0DI9yQXGIy3TcdM5je/Q=;
  b=e2iBo09sv9gEc1A1d+MVnU/WMB+NsO2XigLN1L/JZIAgBPcIa0tu8+Or
   wr9q2lw8wBeKKTvov6bsPd6ppaOMBr8GfHg7Ig+u5gH5MjveYB0r/9684
   oEjUl34RtXP7cURTIJr5uRgV8ZDL71beSPsFzcGDOzbezL5A9r88CqoO/
   ddtE5JroCc6+rq01B8dZ7Vs+IxnQ6uPYn4YfuGo1E/juHQJAGQbJv6q3v
   fm9w81CuMDUov56O1m2DOcbOWR91iQ43I6KwRuXVcegM1fLtYkaiNsxtR
   /cdPk4t37H568p2c+PUYB97cpKOzcnNpIBeaKRLWDntEwZ2UGjhs/eaER
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="341010167"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="341010167"
Received: from orsmga001.jf.intel.com ([10.7.209.18])
  by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 10 Apr 2023 21:22:54 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="721045359"
X-IronPort-AV: E=Sophos;i="5.98,335,1673942400"; 
   d="scan'208";a="721045359"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga001.jf.intel.com with ESMTP; 10 Apr 2023 21:22:52 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pm5Wt-000Vv3-2e;
	Tue, 11 Apr 2023 04:22:51 +0000
Date: Tue, 11 Apr 2023 12:22:39 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 2/18] mm/vmscan.c:4914:5: warning: no
 previous prototype for function 'print_node_mglru'
Message-ID: <202304111204.jkXKMpQB-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   2334558ddfcc49430baece1143367805ca186f3b
commit: d93c528012f08b5037cda48b14b73fc226943a4c [2/18] CHROMIUM: Implementation of MGLRU in sysfs
config: x86_64-randconfig-a004-20230410 (https://download.01.org/0day-ci/archive/20230411/202304111204.jkXKMpQB-lkp@intel.com/config)
compiler: clang version 14.0.6 (https://github.com/llvm/llvm-project f28c006a5895fc0e329fe15fead81e37457cb1d1)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout d93c528012f08b5037cda48b14b73fc226943a4c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=x86_64 SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304111204.jkXKMpQB-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.c:4914:5: warning: no previous prototype for function 'print_node_mglru' [-Wmissing-prototypes]
   int print_node_mglru(struct lruvec *lruvec, char *buf, int orig_pos)
       ^
   mm/vmscan.c:4914:1: note: declare 'static' if the function is not intended to be used outside of this translation unit
   int print_node_mglru(struct lruvec *lruvec, char *buf, int orig_pos)
   ^
   static 
   1 warning generated.


vim +/print_node_mglru +4914 mm/vmscan.c

  4913	
> 4914	int print_node_mglru(struct lruvec *lruvec, char *buf, int orig_pos)
  4915	{
  4916		unsigned long seq;
  4917		struct lru_gen_struct *lrugen = &lruvec->lrugen;
  4918	
  4919		DEFINE_MAX_SEQ(lruvec);
  4920		DEFINE_MIN_SEQ(lruvec);
  4921	
  4922		int print_pos = orig_pos;
  4923	
  4924		seq = min(min_seq[0], min_seq[1]);
  4925	
  4926		for (; seq <= max_seq; seq++) {
  4927			int gen, type, zone;
  4928			unsigned int msecs;
  4929	
  4930			gen = lru_gen_from_seq(seq);
  4931			msecs = jiffies_to_msecs(jiffies - READ_ONCE(lrugen->timestamps[gen]));
  4932	
  4933			print_pos += snprintf(buf + print_pos, PAGE_SIZE - print_pos,
  4934				" %10lu %10u", seq, msecs);
  4935	
  4936			for (type = 0; type < ANON_AND_FILE; type++) {
  4937				long size = 0;
  4938	
  4939				if (seq < min_seq[type]) {
  4940					print_pos += snprintf(buf + print_pos,
  4941						PAGE_SIZE - print_pos, "         -0 ");
  4942					continue;
  4943				}
  4944	
  4945				for (zone = 0; zone < MAX_NR_ZONES; zone++)
  4946					size += READ_ONCE(lrugen->nr_pages[gen][type][zone]);
  4947	
  4948				print_pos += snprintf(buf + print_pos,
  4949					PAGE_SIZE - print_pos, " %10lu ", max(size, 0L));
  4950			}
  4951	
  4952			print_pos += snprintf(buf + print_pos, PAGE_SIZE - print_pos, "\n");
  4953	
  4954		}
  4955	
  4956		return print_pos - orig_pos;
  4957	}
  4958	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests
