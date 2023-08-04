Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62679746B
	for <oe-kbuild-all@lists.linux.dev>; Fri,  4 Aug 2023 07:19:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1691133552; x=1722669552;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=g/U0m0ZcBzeTaUjohAoZyrFsm/+cqIU7PBCwnqMOwys=;
  b=cHr5POlGYwu4QAF6vhh3KHhGeHQbHEeFR7JMt82FCB6UBMluRCp+cJeJ
   meaUvDxscJqPO8OQA/ksT8Bf96u7uGlu7LoSg+bTGo+s++afaF6Ed6Wrb
   wbiMWzULqKIUGiFIPhIU9wh6JaHYJjEoVI8FqZ2ISw7Jm07eD/KRaZcQi
   00iuVqUwedSjek9DQWSDS74VXOa31U+1c1tPpx7Rt7xzs7Ks2Rq3WHapQ
   dKOBWULluk1f5YVJ0lDvqisUA1sVxkwVe3+ZNwxQKm0LZ1y7X+cBtv+1a
   QqnFbFnOzn1bFd6T470bKLiHY52Kia/+YCYJI5U3LTjobkfAhRpVORUid
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="373737455"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="373737455"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Aug 2023 00:19:10 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10791"; a="759451251"
X-IronPort-AV: E=Sophos;i="6.01,254,1684825200"; 
   d="scan'208";a="759451251"
Received: from lkp-server01.sh.intel.com (HELO d1ccc7e87e8f) ([10.239.97.150])
  by orsmga008.jf.intel.com with ESMTP; 04 Aug 2023 00:19:08 -0700
Received: from kbuild by d1ccc7e87e8f with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qRp5X-0002il-2r;
	Fri, 04 Aug 2023 07:19:07 +0000
Date: Fri, 4 Aug 2023 15:18:21 +0800
From: kernel test robot <lkp@intel.com>
To: Douglas Anderson <dianders@chromium.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Andrew Morton <akpm@linux-foundation.org>
Subject: [linux-next:master 6492/7272] kernel/watchdog.c:111:12: warning:
 'hardlockup_all_cpu_backtrace_proc_handler' defined but not used
Message-ID: <202308041501.2T8kM1gb-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   bdffb18b5dd8071cd25685b966f380a30b1fadaa
commit: 838b3b76220d5b1bc53e4186d8936c5ec6810bf0 [6492/7272] watchdog/hardlockup: avoid large stack frames in watchdog_hardlockup_check()
config: x86_64-randconfig-x012-20230731 (https://download.01.org/0day-ci/archive/20230804/202308041501.2T8kM1gb-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce: (https://download.01.org/0day-ci/archive/20230804/202308041501.2T8kM1gb-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202308041501.2T8kM1gb-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/watchdog.c:111:12: warning: 'hardlockup_all_cpu_backtrace_proc_handler' defined but not used [-Wunused-function]
     111 | static int hardlockup_all_cpu_backtrace_proc_handler(struct ctl_table *table, int write,
         |            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/hardlockup_all_cpu_backtrace_proc_handler +111 kernel/watchdog.c

   110	
 > 111	static int hardlockup_all_cpu_backtrace_proc_handler(struct ctl_table *table, int write,
   112			  void *buffer, size_t *lenp, loff_t *ppos)
   113	{
   114		int ret;
   115	
   116		ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
   117	
   118		/*
   119		 * Only allocate memory for the backtrace mask if userspace actually
   120		 * wants to trace all CPUs since this can take up 1K of space on a
   121		 * system with CONFIG_NR_CPUS=8192.
   122		 */
   123		if (sysctl_hardlockup_all_cpu_backtrace && !hardlockup_backtrace_mask) {
   124			hardlockup_backtrace_mask =
   125				   kzalloc(sizeof(*hardlockup_backtrace_mask), GFP_KERNEL);
   126		} else if (!sysctl_hardlockup_all_cpu_backtrace && hardlockup_backtrace_mask) {
   127			kfree(hardlockup_backtrace_mask);
   128			hardlockup_backtrace_mask = NULL;
   129		}
   130	
   131		return ret;
   132	}
   133	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
