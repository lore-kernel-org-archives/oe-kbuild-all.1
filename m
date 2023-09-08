Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DFBE7E9
	for <oe-kbuild-all@lists.linux.dev>; Fri,  8 Sep 2023 10:11:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1694167864; x=1725703864;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=B3lUejYowFHeanBVB4NxPimJ95mYrDZ3PrCjOeGV7WM=;
  b=k+MHpD4Hf8j6tl1NBzBrBKw+OecUYAGp64VQ4XmgcjMoqeOOoI0yt5B3
   By2gQQbDTzUaZ1PaUUGVWOMg+WhzFV8+bq51AuSRhVf3vG0+fjBOP6WLx
   z5hQNPCYxOeOqsekxraxCD7P7lskfaci0yjQ5yIOZBCnuTIQ50x3DF/ei
   bYS2i7m2l6YQwghxjdudG/eeC78LnqhOacuu0LADIOdXoqn2/cHsVanlr
   SD9wfu61P65tskvDYelhJYxjSVXURxcnuo1weJhUn2Kt8tCmExh7Eaw7T
   lIhlgWyTSHSAwjMvscK5m/Xrlphf3f1hqfFO3t4PEKSDF1qJU3LD4Nlgv
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="357916598"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="357916598"
Received: from orsmga005.jf.intel.com ([10.7.209.41])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Sep 2023 03:11:03 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="916122961"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; 
   d="scan'208";a="916122961"
Received: from lkp-server01.sh.intel.com (HELO 59b3c6e06877) ([10.239.97.150])
  by orsmga005.jf.intel.com with ESMTP; 08 Sep 2023 03:11:00 -0700
Received: from kbuild by 59b3c6e06877 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qeYS2-0002AB-02;
	Fri, 08 Sep 2023 10:10:58 +0000
Date: Fri, 8 Sep 2023 18:10:53 +0800
From: kernel test robot <lkp@intel.com>
To: Nick Alcock <nick.alcock@oracle.com>
Cc: oe-kbuild-all@lists.linux.dev, Kris Van Hees <kris.van.hees@oracle.com>,
	Tomas Jedlicka <tomas.jedlicka@oracle.com>,
	Eugene Loh <eugene.loh@oracle.com>,
	David Mc Lean <david.mclean@oracle.com>,
	Vincent Lim <vincent.lim@oracle.com>
Subject: [oracle-dtrace:v2/6.5 10/13] fs/select.c:236:31: sparse: sparse:
 restricted __poll_t degrades to integer
Message-ID: <202309081855.tEliDi5B-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/oracle/dtrace-linux-kernel v2/6.5
head:   1120d1c598d4ae2d08278969b9001a866aa8273a
commit: 051cfd2102807119e31bdd4947d18388b3df5fd3 [10/13] waitfd: new syscall implementing waitpid() over fds
config: x86_64-randconfig-121-20230908 (https://download.01.org/0day-ci/archive/20230908/202309081855.tEliDi5B-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20230908/202309081855.tEliDi5B-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202309081855.tEliDi5B-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/select.c:236:31: sparse: sparse: restricted __poll_t degrades to integer
   fs/select.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
--
   fs/eventpoll.c:534:9: sparse: sparse: restricted __poll_t degrades to integer
   fs/eventpoll.c:534:9: sparse: sparse: cast to restricted __poll_t
   fs/eventpoll.c:1255:53: sparse: sparse: incorrect type in argument 3 (different base types) @@     expected unsigned int pollflags @@     got restricted __poll_t @@
   fs/eventpoll.c:1255:53: sparse:     expected unsigned int pollflags
   fs/eventpoll.c:1255:53: sparse:     got restricted __poll_t
   fs/eventpoll.c:1300:39: sparse: sparse: restricted __poll_t degrades to integer
>> fs/eventpoll.c:1300:25: sparse: sparse: dubious: x & !y
   fs/eventpoll.c: note: in included file (through arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, include/linux/sched/task.h, ...):
   arch/x86/include/asm/uaccess_64.h:88:24: sparse: sparse: cast removes address space '__user' of expression
--
>> fs/waitfd.c:60:34: sparse: sparse: cast removes address space '__user' of expression
>> fs/waitfd.c:60:34: sparse: sparse: incorrect type in initializer (different address spaces) @@     expected int [noderef] __user *stat_addr @@     got int * @@
   fs/waitfd.c:60:34: sparse:     expected int [noderef] __user *stat_addr
   fs/waitfd.c:60:34: sparse:     got int *
>> fs/waitfd.c:89:27: sparse: sparse: incorrect type in initializer (different base types) @@     expected restricted __poll_t ( *poll )( ... ) @@     got unsigned int ( * )( ... ) @@
   fs/waitfd.c:89:27: sparse:     expected restricted __poll_t ( *poll )( ... )
   fs/waitfd.c:89:27: sparse:     got unsigned int ( * )( ... )

vim +236 fs/select.c

   228	
   229	/* Add a new entry */
   230	static void __pollwait(struct file *filp, wait_queue_head_t *wait_address,
   231					poll_table *p, unsigned long fixed_event)
   232	{
   233		struct poll_wqueues *pwq = container_of(p, struct poll_wqueues, pt);
   234		struct poll_table_entry *entry;
   235	
 > 236		if (fixed_event && !(p->_key & fixed_event))
   237			return;
   238	
   239		entry = poll_get_entry(pwq);
   240		if (!entry)
   241			return;
   242	
   243		entry->filp = get_file(filp);
   244		entry->wait_address = wait_address;
   245		entry->key = p->_key;
   246		entry->fixed_key = fixed_event;
   247		init_waitqueue_func_entry(&entry->wait, pollwake);
   248		entry->wait.private = pwq;
   249		add_wait_queue(wait_address, &entry->wait);
   250	}
   251	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
