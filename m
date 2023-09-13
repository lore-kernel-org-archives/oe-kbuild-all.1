Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783FE22EFC
	for <oe-kbuild-all@lists.linux.dev>; Wed, 13 Sep 2023 21:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694641455; x=1726177455;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=w8pYPEU5ySCBd2IkgwPJpd5edhiFfbd4sBCnimZKkvM=;
  b=ERMgtA2tCcT5CB2lvSxeitCWL2wuqX3aRoim7SkszyTObUIH5TznZ9te
   KWB2lB/X5KGQYJDikNqU69xAbYGhj6iSnFtk2cuNong1oJX14r4vpT0Zz
   Jq4WM1K7Sq5kSvily8yFFP/0ypYX8g7V6UefZT5wEnJ7vgPoHnSDytxR8
   EMP6F+lE1mGixm90gcTDhFZX3TcO80OJjASS06xrGtBz4ubgSmsTabTIZ
   0PCizOJRdH7s/933vh6NX17bfI5KgTpFbybmA9cn+pGpMabRcEdzx9fnw
   2A35pNPEwSciHiPA4B8+yjMDZi/V6GnLcI3qLeXvte51GZsWtKZp2WODt
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="445225564"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="445225564"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Sep 2023 14:44:14 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10832"; a="887508194"
X-IronPort-AV: E=Sophos;i="6.02,144,1688454000"; 
   d="scan'208";a="887508194"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by fmsmga001.fm.intel.com with ESMTP; 13 Sep 2023 14:43:42 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qgXeR-0000hb-1x;
	Wed, 13 Sep 2023 21:44:03 +0000
Date: Thu, 14 Sep 2023 05:43:22 +0800
From: kernel test robot <lkp@intel.com>
To: Arnd Bergmann <arnd@arndb.de>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Christian Brauner <brauner@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>
Subject: arch/parisc/kernel/pdt.c:65:6: warning: no previous prototype for
 'arch_report_meminfo'
Message-ID: <202309140530.CBISqBas-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   23f108dc9ed26100b1489f6a9e99088d4064f56b
commit: ef104443bffa004f631729dfc924f0b84abbd602 procfs: consolidate arch_report_meminfo declaration
date:   4 months ago
config: parisc-randconfig-002-20230914 (https://download.01.org/0day-ci/archive/20230914/202309140530.CBISqBas-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230914/202309140530.CBISqBas-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309140530.CBISqBas-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> arch/parisc/kernel/pdt.c:65:6: warning: no previous prototype for 'arch_report_meminfo' [-Wmissing-prototypes]
      65 | void arch_report_meminfo(struct seq_file *m)
         |      ^~~~~~~~~~~~~~~~~~~


vim +/arch_report_meminfo +65 arch/parisc/kernel/pdt.c

c9c2877d08d9aa Helge Deller 2017-05-11  63  
c9c2877d08d9aa Helge Deller 2017-05-11  64  /* report PDT entries via /proc/meminfo */
c9c2877d08d9aa Helge Deller 2017-05-11 @65  void arch_report_meminfo(struct seq_file *m)
c9c2877d08d9aa Helge Deller 2017-05-11  66  {
c9c2877d08d9aa Helge Deller 2017-05-11  67  	if (pdt_type == PDT_NONE)
c9c2877d08d9aa Helge Deller 2017-05-11  68  		return;
c9c2877d08d9aa Helge Deller 2017-05-11  69  
c9c2877d08d9aa Helge Deller 2017-05-11  70  	seq_printf(m, "PDT_max_entries: %7lu\n",
c9c2877d08d9aa Helge Deller 2017-05-11  71  			pdt_status.pdt_size);
c9c2877d08d9aa Helge Deller 2017-05-11  72  	seq_printf(m, "PDT_cur_entries: %7lu\n",
c9c2877d08d9aa Helge Deller 2017-05-11  73  			pdt_status.pdt_entries);
c9c2877d08d9aa Helge Deller 2017-05-11  74  }
c9c2877d08d9aa Helge Deller 2017-05-11  75  

:::::: The code at line 65 was first introduced by commit
:::::: c9c2877d08d9aa0ca0a5c227ac795fbb76269300 parisc: Add Page Deallocation Table (PDT) support

:::::: TO: Helge Deller <deller@gmx.de>
:::::: CC: Helge Deller <deller@gmx.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
