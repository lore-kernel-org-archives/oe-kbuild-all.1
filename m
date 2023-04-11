Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B20EA8F4D
	for <oe-kbuild-all@lists.linux.dev>; Tue, 11 Apr 2023 16:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1681229563; x=1712765563;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3uH9mZVswNV7NEAGR7thTxtEXvur+Sm1rcCQW8cErwo=;
  b=JXtyVnAb4CRvMvkHn235sTBw2p/Ag6OjjV74CVlqlF92ZKgyr3hTlWbW
   83dTFV/FUcwd9hFZ1DjP2NAY/Ct1ZT/PHf2t3o6X62CQZdMBinRs2QIU5
   BMTZngCKGl1AvuHHupJ8t56NA82sJ5OjObDIrITuuLB+tX9iPNcgUZI+W
   El0ct8fHNzx3ZYli9nmmfhm54kXjrV8iI67V+5vRgOscW5qjvoIZBjUEI
   as1M8BmqKp9SDZRBgBDD/jNtZ6kb78tB7Nvok3FhnezwMYZ/kUu689hui
   TzIDYKlgSirlM6JintuMkYykII3Rck2RcM6AqanHJxIUK8+hKxnJ5YuOe
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="323294100"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="323294100"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Apr 2023 09:10:23 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10677"; a="812617320"
X-IronPort-AV: E=Sophos;i="5.98,336,1673942400"; 
   d="scan'208";a="812617320"
Received: from lkp-server01.sh.intel.com (HELO b613635ddfff) ([10.239.97.150])
  by orsmga004.jf.intel.com with ESMTP; 11 Apr 2023 09:10:21 -0700
Received: from kbuild by b613635ddfff with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1pmGZT-000WSR-22;
	Tue, 11 Apr 2023 16:10:15 +0000
Date: Wed, 12 Apr 2023 00:10:04 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.10 2/29] mm/vmscan.c:4914:5: warning: no
 previous prototype for 'print_node_mglru'
Message-ID: <202304120020.FgsHXBQX-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.10
head:   c27833f102ef632ef9410a1b1ce69a1ed9f2e48b
commit: d93c528012f08b5037cda48b14b73fc226943a4c [2/29] CHROMIUM: Implementation of MGLRU in sysfs
config: mips-allyesconfig (https://download.01.org/0day-ci/archive/20230412/202304120020.FgsHXBQX-lkp@intel.com/config)
compiler: mips-linux-gcc (GCC) 12.1.0
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git remote add chrome-os https://chromium.googlesource.com/chromiumos/third_party/kernel
        git fetch --no-tags chrome-os chromeos-5.10
        git checkout d93c528012f08b5037cda48b14b73fc226943a4c
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips olddefconfig
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=gcc-12.1.0 make.cross W=1 O=build_dir ARCH=mips SHELL=/bin/bash

If you fix the issue, kindly add following tag where applicable
| Reported-by: kernel test robot <lkp@intel.com>
| Link: https://lore.kernel.org/oe-kbuild-all/202304120020.FgsHXBQX-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> mm/vmscan.c:4914:5: warning: no previous prototype for 'print_node_mglru' [-Wmissing-prototypes]
    4914 | int print_node_mglru(struct lruvec *lruvec, char *buf, int orig_pos)
         |     ^~~~~~~~~~~~~~~~


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
