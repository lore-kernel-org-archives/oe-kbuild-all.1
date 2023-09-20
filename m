Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8175C156C9
	for <oe-kbuild-all@lists.linux.dev>; Wed, 20 Sep 2023 09:41:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1695202915; x=1726738915;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4tGzmPR5HHySkb9CyhTat+Y4RJcoM4MrfxezC5+g3xM=;
  b=XP3NUcucIuBBSpTsfiB9FUoU8qmn4z+lpLunjge3LEoutGfUJ1+X/C1F
   EAarvdNcxkJHQ1vQhT5f37qVEShhD14XFbpg41WeOHGvKW+ecOl/nijzQ
   3wHtkT/c5kBzX0hdX2TfrtH8ur/DyGMs7d9G9PJDx8RhfGr0fL4a31FsO
   yUXtvq4vRApO40GZxa3qWANG3v+VM1OqKhDvRMCrPzIIS2eH7hA5r7PoG
   lTg8kohh2jpgMtdxBWuiMIin4C0SHhP54+8rg57oQ1Ds5rap9DEMp+For
   ftzKeE/u7ncdDAQI89OmGX2txjMR3vOa3AhuM9s8MZGt7+j2e9nP//U7C
   Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="411118956"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="411118956"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
  by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Sep 2023 02:41:53 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10838"; a="775925061"
X-IronPort-AV: E=Sophos;i="6.02,161,1688454000"; 
   d="scan'208";a="775925061"
Received: from lkp-server02.sh.intel.com (HELO 9ef86b2655e5) ([10.239.97.151])
  by orsmga008.jf.intel.com with ESMTP; 20 Sep 2023 02:41:51 -0700
Received: from kbuild by 9ef86b2655e5 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qitiP-0008as-0M;
	Wed, 20 Sep 2023 09:41:49 +0000
Date: Wed, 20 Sep 2023 17:40:53 +0800
From: kernel test robot <lkp@intel.com>
To: Thomas Gleixner <tglx@linutronix.de>
Cc: oe-kbuild-all@lists.linux.dev,
	Linux Memory Management List <linux-mm@kvack.org>,
	Petr Mladek <pmladek@suse.com>,
	John Ogness <john.ogness@linutronix.de>
Subject: [linux-next:master 5670/6619] kernel/printk/printk.c:2871:24:
 warning: array subscript 0 is outside array bounds of 'char[0]'
Message-ID: <202309201724.M9BMAQIh-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   926f75c8a5ab70567eb4c2d82fbc96963313e564
commit: 06653d57ff283be627a2c769139d73ecc487810f [5670/6619] printk: nbcon: Add emit function and callback function for atomic printing
config: s390-randconfig-r004-20230825 (https://download.01.org/0day-ci/archive/20230920/202309201724.M9BMAQIh-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 11.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230920/202309201724.M9BMAQIh-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309201724.M9BMAQIh-lkp@intel.com/

All warnings (new ones prefixed by >>):

   kernel/printk/printk.c: In function 'console_flush_all':
>> kernel/printk/printk.c:2871:24: warning: array subscript 0 is outside array bounds of 'char[0]' [-Warray-bounds]
    2871 |         char *outbuf = &printk_shared_pbufs.outbuf[0];
         |                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   In file included from kernel/printk/printk.c:61:
   kernel/printk/internal.h:112:17: note: while referencing 'outbuf'
     112 |         char    outbuf[PRINTK_MESSAGE_MAX];
         |                 ^~~~~~
   kernel/printk/printk.c:2851:23: note: defined here 'printk_shared_pbufs'
    2851 | struct printk_buffers printk_shared_pbufs;
         |                       ^~~~~~~~~~~~~~~~~~~


vim +2871 kernel/printk/printk.c

d818b56f77521e kernel/printk/printk.c John Ogness             2023-09-16  2852  
2830eec14afd18 kernel/printk/printk.c John Ogness             2023-01-09  2853  /*
2830eec14afd18 kernel/printk/printk.c John Ogness             2023-01-09  2854   * Print one record for the given console. The record printed is whatever
2830eec14afd18 kernel/printk/printk.c John Ogness             2023-01-09  2855   * record is the next available record for the given console.
03a749e628fdbc kernel/printk/printk.c John Ogness             2022-04-21  2856   *
a699449bb13b70 kernel/printk/printk.c John Ogness             2022-04-21  2857   * @handover will be set to true if a printk waiter has taken over the
fc956ae0de7fa2 kernel/printk/printk.c John Ogness             2022-11-16  2858   * console_lock, in which case the caller is no longer holding both the
fc956ae0de7fa2 kernel/printk/printk.c John Ogness             2022-11-16  2859   * console_lock and the SRCU read lock. Otherwise it is set to false.
fc956ae0de7fa2 kernel/printk/printk.c John Ogness             2022-11-16  2860   *
fc956ae0de7fa2 kernel/printk/printk.c John Ogness             2022-11-16  2861   * @cookie is the cookie from the SRCU read lock.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2862   *
a699449bb13b70 kernel/printk/printk.c John Ogness             2022-04-21  2863   * Returns false if the given console has no next record to print, otherwise
a699449bb13b70 kernel/printk/printk.c John Ogness             2022-04-21  2864   * true.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2865   *
fc956ae0de7fa2 kernel/printk/printk.c John Ogness             2022-11-16  2866   * Requires the console_lock and the SRCU read lock.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2867   */
2830eec14afd18 kernel/printk/printk.c John Ogness             2023-01-09  2868  static bool console_emit_next_record(struct console *con, bool *handover, int cookie)
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2869  {
2830eec14afd18 kernel/printk/printk.c John Ogness             2023-01-09  2870  	bool is_extended = console_srcu_read_flags(con) & CON_EXTENDED;
d818b56f77521e kernel/printk/printk.c John Ogness             2023-09-16 @2871  	char *outbuf = &printk_shared_pbufs.outbuf[0];
2830eec14afd18 kernel/printk/printk.c John Ogness             2023-01-09  2872  	struct printk_message pmsg = {
d818b56f77521e kernel/printk/printk.c John Ogness             2023-09-16  2873  		.pbufs = &printk_shared_pbufs,
2830eec14afd18 kernel/printk/printk.c John Ogness             2023-01-09  2874  	};
2830eec14afd18 kernel/printk/printk.c John Ogness             2023-01-09  2875  	unsigned long flags;
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2876  
a699449bb13b70 kernel/printk/printk.c John Ogness             2022-04-21  2877  	*handover = false;
78944e549d3667 kernel/printk.c        Antonino A. Daplas      2006-08-05  2878  
ea308da1198f8c kernel/printk/printk.c John Ogness             2023-01-09  2879  	if (!printk_get_next_message(&pmsg, con->seq, is_extended, true))
a699449bb13b70 kernel/printk/printk.c John Ogness             2022-04-21  2880  		return false;
7ff9554bb578ba kernel/printk.c        Kay Sievers             2012-05-03  2881  
2830eec14afd18 kernel/printk/printk.c John Ogness             2023-01-09  2882  	con->dropped += pmsg.dropped;
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2883  
2830eec14afd18 kernel/printk/printk.c John Ogness             2023-01-09  2884  	/* Skip messages of formatted length 0. */
2830eec14afd18 kernel/printk/printk.c John Ogness             2023-01-09  2885  	if (pmsg.outbuf_len == 0) {
2830eec14afd18 kernel/printk/printk.c John Ogness             2023-01-09  2886  		con->seq = pmsg.seq + 1;
084681d14e429c kernel/printk.c        Kay Sievers             2012-06-28  2887  		goto skip;
084681d14e429c kernel/printk.c        Kay Sievers             2012-06-28  2888  	}
649e6ee33f73ba kernel/printk.c        Kay Sievers             2012-05-10  2889  
c4fcc617e14879 kernel/printk/printk.c John Ogness             2023-01-09  2890  	if (con->dropped && !is_extended) {
c4fcc617e14879 kernel/printk/printk.c John Ogness             2023-01-09  2891  		console_prepend_dropped(&pmsg, con->dropped);
c4fcc617e14879 kernel/printk/printk.c John Ogness             2023-01-09  2892  		con->dropped = 0;
6fe29354befe4c kernel/printk/printk.c Tejun Heo               2015-06-25  2893  	}
7ff9554bb578ba kernel/printk.c        Kay Sievers             2012-05-03  2894  
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2895) 	/*
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2896) 	 * While actively printing out messages, if another printk()
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2897) 	 * were to occur on another CPU, it may wait for this one to
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2898) 	 * finish. This task can not be preempted if there is a
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2899) 	 * waiter waiting to take over.
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2900  	 *
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2901  	 * Interrupts are disabled because the hand over to a waiter
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2902  	 * must not be interrupted until the hand over is completed
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2903  	 * (@console_waiter is cleared).
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2904) 	 */
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2905  	printk_safe_enter_irqsave(flags);
c162d5b4338d72 kernel/printk/printk.c Petr Mladek             2018-01-12  2906  	console_lock_spinning_enable();
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2907) 
c4fcc617e14879 kernel/printk/printk.c John Ogness             2023-01-09  2908  	/* Do not trace print latency. */
c4fcc617e14879 kernel/printk/printk.c John Ogness             2023-01-09  2909  	stop_critical_timings();
c4fcc617e14879 kernel/printk/printk.c John Ogness             2023-01-09  2910  
c4fcc617e14879 kernel/printk/printk.c John Ogness             2023-01-09  2911  	/* Write everything out to the hardware. */
c4fcc617e14879 kernel/printk/printk.c John Ogness             2023-01-09  2912  	con->write(con, outbuf, pmsg.outbuf_len);
c4fcc617e14879 kernel/printk/printk.c John Ogness             2023-01-09  2913  
2d9ef940f89e0a kernel/printk/printk.c Petr Mladek             2022-06-23  2914  	start_critical_timings();
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2915) 
2830eec14afd18 kernel/printk/printk.c John Ogness             2023-01-09  2916  	con->seq = pmsg.seq + 1;
a699449bb13b70 kernel/printk/printk.c John Ogness             2022-04-21  2917  
fc956ae0de7fa2 kernel/printk/printk.c John Ogness             2022-11-16  2918  	*handover = console_lock_spinning_disable_and_check(cookie);
c162d5b4338d72 kernel/printk/printk.c Petr Mladek             2018-01-12  2919  	printk_safe_exit_irqrestore(flags);
a699449bb13b70 kernel/printk/printk.c John Ogness             2022-04-21  2920  skip:
a699449bb13b70 kernel/printk/printk.c John Ogness             2022-04-21  2921  	return true;
a699449bb13b70 kernel/printk/printk.c John Ogness             2022-04-21  2922  }
a699449bb13b70 kernel/printk/printk.c John Ogness             2022-04-21  2923  

:::::: The code at line 2871 was first introduced by commit
:::::: d818b56f77521ecc5e3eda71dc9b2beb3d6681e3 printk: Make static printk buffers available to nbcon

:::::: TO: John Ogness <john.ogness@linutronix.de>
:::::: CC: Petr Mladek <pmladek@suse.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
